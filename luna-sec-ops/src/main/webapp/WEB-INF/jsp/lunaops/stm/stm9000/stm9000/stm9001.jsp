<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm9001">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="jenId" id="jenId" value="${param.paramJenId}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9001.label.jenkinsName">JENKINS NAME</span></label>
				<input type="text" class="form-control" placeholder="JENKINS NAME" name="jenNm" id="jenNm" maxlength="250" required/>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9001.label.jenkinsUrl">JENKINS URL</span></label>
				<input type="text" class="form-control" placeholder="JENKINS URL" name="jenUrl" id="jenUrl" maxlength="500" required/>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9001.label.jenkinsUserId">USER ID</span></label>
				<input type="text" class="form-control" placeholder="JENKINS USER ID" name="jenUsrId" id="jenUsrId" minlength="2" maxlength="20" regexstr="^[a-z0-9_-]{2,20}$" regexalert="영문 소문자, 숫자, _-" required/>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="stm9001.label.tokenKey">TOKEN KEY</span></label>
				<input type="password" class="form-control" placeholder="JENKINS TOKEN KEY" name="jenUsrTok" id="jenUsrTok" maxlength="2000" required/>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="stm9001.label.jenkinsUseCd">사용 여부</span></label>
				<select class="form-control kt-select2" id="useCd" name="useCd">
				</select>
			</div>	
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9001.label.jenkinsDesc">JENKINS 설명</span></label>
				<textarea class="form-control osl-min-h-px--130" name="jenDesc" id="jenDesc" maxlength="2000"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm9001SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show" data-lang-cd="stm9001.button.insert">작성 완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>

<script>
"use strict";
var OSLStm9001Popup = function () {
	
	var formId = 'frStm9001';
	var type = $("#type").val();
	
	
	var nowJenUsrTok = "";
	
	
	$("#stm9001SaveSubmit > span").text($.osl.lang("stm9001.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	
	var formValidate = $.osl.validate(formId);
	
    
    var documentSetting = function () {
    	
    	
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} 
		];
    	
		
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);

		
    	autosize($("#jenDesc"));
    	
    	
    	
    	if(type == "update"){
    		
    		selectJenkinsInfo();
    	}
    	
    	
    	$("#stm9001SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		var jenUrl = $("#jenUrl").val(); 		
			var jenUsrId = $("#jenUsrId").val(); 	
			var jenUsrTok = $("#jenUsrTok").val(); 	
			var jenDesc = $("#jenDesc").val(); 		
    		
    		
    		if (!form.valid()) {
    			return;
    		}
    		
			
			
			
			
        	
        	submitSaveAction();
    	});
    	
    };

    
    
	var selectJenkinsInfo = function() {
    	
    	var jenId = $("#jenId").val();
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm9000/stm9000/selectStm9000JenkinsInfoAjax.do'/>", "async": false}
				,{"jenId": jenId});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
				var jenkinsInfo = data.jenInfo;
				
				
		    	$.osl.setDataFormElem(jenkinsInfo,"frStm9001", ["jenId", "jenNm", "jenUrl", "jenUsrId", "jenUsrTok", "jenDesc"]);
				
				
		    	$("#useCd").attr("data-osl-value", jenkinsInfo.useCd);
				
				
		    	nowJenUsrTok = jenkinsInfo.jenUsrTok;
					
				
				autosize.update($("#jenDesc"));
			}	
		});
		
		
		ajaxObj.send();
	};
    
    
  	
    var submitSaveAction = function(){
    	
    	var form = $('#'+formId);
		
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("stm9001.message.confirm."+type),null,function(result) {
	        if (result.value) {
	        	
	        	var formDataArray = form.serializeArray();
	        	formDataArray.push({name:"nowJenUsrTok", value:nowJenUsrTok});
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm9000/stm9000/saveStm9001JenkinsInfoAjax.do'/>"
	    			, "loadingShow": true}, formDataArray);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			
	    			
	    			var jenConnectCheckCode = data.resultCode;
	    			
	    			
	    			if(!$.osl.isNull(jenConnectCheckCode)){
	    				
	    				$.osl.alert(data.resultMessage,{type: 'error'});
	    			
	    			
	    			}else if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    				
    				
	    			}else{
	    				$.osl.toastr(data.message);
	    				
	    				$.osl.layerPopupClose();
	    				
	    				if(type == "insert"){
		    				
		    				$("button[data-datatable-id=stm9000JenkinsTable][data-datatable-action=select]").click();
	    				}else{
	    					
	    					$.osl.datatable.list["stm9000JenkinsTable"].targetDt.reload();	
	    				}
	    			}
	    		});
	    		
	    		
	    		ajaxObj.send();
	        }
	    });
		
    };
	
    return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();


$.osl.ready(function(){
	OSLStm9001Popup.init();
});

	
</script>