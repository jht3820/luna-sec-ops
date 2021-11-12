<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm2201">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="authGrpId" id="authGrpId" value="${param.paramAuthGrpId}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2201.label.authGrpNm">권한그룹 명</span></label>
				<input type="text" class="form-control" placeholder="권한그룹 명" name="authGrpNm" id="authGrpNm" minlength="2" maxlength="25" required>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="stm2201.label.ord">순번</span></label>
				<input type="number" class="form-control" placeholder="순번" name="ord" id="ord" value="${requestScope.nextOrd}" required>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-portrait kt-margin-r-5"></i><span data-lang-cd="stm2201.label.usrTyp">사용자 유형</span></label>
				<select class="form-control kt-select2" id="usrTyp" name="usrTyp">
				</select>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-receipt kt-margin-r-5"></i><span data-lang-cd="stm2201.label.acceptUseCd">접수권한 사용유무</span></label>
				<select class="form-control kt-select2" id="acceptUseCd" name="acceptUseCd" data-osl-value="02">
				</select>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="stm2201.label.useCd">사용유무</span></label>
				<select class="form-control kt-select2" id="useCd" name="useCd">
				</select>
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2201.label.authGrpDesc">비고</span></label>
				<textarea class="form-control osl-min-h-px--130" name="authGrpDesc" id="authGrpDesc" maxlength="250"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">

	<c:if test="${param.type ne 'view'}">
		<button type="button" class="btn btn-brand" id="stm2201SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show">완료</span></button>
	</c:if>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>

<script>
"use strict";
var OSLStm2201Popup = function () {
	var formId = 'frStm2201';
	var type = $("#type").val();
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var pageTypeData = {
			"insert":{
				"saveString": "신규 시스템 권한 그룹을 등록하시겠습니까?",
				"saveBtnString": "작성 완료"
			},
			"update":{
				"saveString": "시스템 권한 그룹 정보를 수정하시겠습니까?",
				"saveBtnString": "수정 완료"
			},
			"common":{
				"acceptUse":"접수권한을 활성화 시킬 경우 업무 화면 <br/>접근을 활성화해야 합니다.",
				"acceptMenu": "대시보드>운영 대시 보드>대시보드(운영) 또는 대시보드>개발 대시 보드>대시보드(개발)"
			}
	};
	
    
    var documentSetting = function () {
    	if(type != "view"){
	    	
	    	$("#stm2201SaveSubmit").text(pageTypeData[type]["saveBtnString"]);
	    	$("#stm2201SaveSubmit > span").text($.osl.lang("stm2201."+type+".saveBtnString"));
    	}else{
    		$("#authGrpNm").prop("disabled",true);
    		$("#ord").prop("disabled",true);
    		$("#useCd").prop("disabled",true);
			$("#acceptUseCd").prop("disabled",true);
			$("#usrTyp").prop("disabled",true);
			$("#authGrpDesc").prop("disabled",true);
    	}
    	
    	
    	
		var commonCodeArr = [
			{mstCd: "ADM00004", useYn: "Y",targetObj: "#usrTyp", comboType:"OS"},	 	
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#acceptUseCd", comboType:"OS"}, 	
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} 		
		];

  		
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
    	
  		
  		$("#acceptUseCd").change(function(){
  			if($(this).val() == "01"){
  				$.osl.alert(pageTypeData["common"]["acceptUse"], {text:pageTypeData["common"]["acceptMenu"]});
  			}
  		});

		
    	autosize($("#authGrpDesc"));
  		
		
    	if(type == "update"){
    		
    		selectStmAuthInfo();
    	}
		
    	else if(type == "view"){
       		
       		selectStmAuthInfo();
       	}
	
    	
    	$("#stm2201SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		
    		
    		if (!form.valid()) {
    			return;
    		}
    		
        	
        	submitSaveAction();
    	});
    	
    };

    
    
	var selectStmAuthInfo = function() {
    	
    	var paramAuthGrpId = $("#authGrpId").val();
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2200/selectStm2200StmAuthGrpInfoAjax.do'/>", "async": false}
				,{"authGrpId":paramAuthGrpId});
		
		ajaxObj.setFnSuccess(function(data){

			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
		    	$.osl.setDataFormElem(data.stmAuthGrpInfoMap,"frStm2201", ["authGrpId", "authGrpNm", "ord", "authGrpDesc"]);
				
		    	
		    	$("#useCd").attr("data-osl-value", data.stmAuthGrpInfoMap.useCd);
				$("#acceptUseCd").attr("data-osl-value", data.stmAuthGrpInfoMap.acceptUseCd);
				$("#usrTyp").attr("data-osl-value", data.stmAuthGrpInfoMap.usrTyp);
				
				
				autosize.update($("#authGrpDesc"));
			}	
			
		});
		
		
		ajaxObj.send();
	};
    
    
  	
    var submitSaveAction = function(){
    	
    	var form = $('#'+formId);
  		
    	
    	var url = "<c:url value='/stm/stm2000/stm2200/insertStm2200StmAuthGrpInfoAjax.do'/>";
    	if(type == "update"){
    		url = "<c:url value='/stm/stm2000/stm2200/updateStm2200StmAuthGrpInfoAjax.do'/>"
    	}
    	
		
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm(pageTypeData[type]["saveString"],null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":url, "loadingShow": false}, formData);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    			}else{
	    				
	    				$.osl.toastr(data.message);

	    				
	    				$.osl.layerPopupClose();
	    				
	    				if(type == "insert"){
		    				
		    				$("button[data-datatable-id=stm2200AuthTable][data-datatable-action=select]").click();
	    				}else{
	    					
	    					$.osl.datatable.list["stm2200AuthTable"].targetDt.reload();	
	    				}
	    				
	    				
	    				OSLStm2200.selectFoldingAuthList();
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
	OSLStm2201Popup.init();
});
</script>

