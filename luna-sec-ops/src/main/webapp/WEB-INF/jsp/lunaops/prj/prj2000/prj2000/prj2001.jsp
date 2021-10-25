<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj2001">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" name="authGrpId" id="authGrpId" value="${param.paramAuthGrpId}">
	<input type="hidden" name="prjId" id="prjId" value="${param.paramPrjId}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>권한그룹 명</label>
				<input type="text" class="form-control" placeholder="권한그룹 명" name="authGrpNm" id="authGrpNm" minlength="2" maxlength="25" required>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i>순번</label>
				<input type="number" class="form-control" placeholder="순번" name="ord" id="ord" value="${requestScope.nextOrd}" required>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-portrait kt-margin-r-5"></i>사용자 유형</label>
				<select class="form-control kt-select2" id="usrTyp" name="usrTyp">
				</select>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-receipt kt-margin-r-5"></i>접수권한 사용유무</label>
				<select class="form-control kt-select2" id="acceptUseCd" name="acceptUseCd">
				</select>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
				<select class="form-control kt-select2" id="useCd" name="useCd">
				</select>
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i>비고</label>
				<textarea class="form-control osl-min-h-px--130" name="authGrpDesc" id="authGrpDesc" maxlength="250"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj2001SaveSubmit">
		<i class="fa fa-check-square"></i>
		<span class="osl-resize__display--show">완료</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i>
		<span class="osl-resize__display--show">Close</span>
	</button>
</div>

<script>
"use strict";
var OSLPrj2001Popup = function () {
	var formId = 'frPrj2001';
	var type = $("#type").val();
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var pageTypeData = {
			"insert":{
				"saveString": "신규 권한그룹을 등록하시겠습니까?",
				"saveBtnString": "작성 완료"
			},
			"update":{
				"saveString": "권한그룹 정보를 수정하시겠습니까?",
				"saveBtnString": "수정 완료"
			}
	};
	
    
    var documentSetting = function () {
    	
    	
    	$("#prj2001SaveSubmit").text(pageTypeData[type]["saveBtnString"]);
    	
    	
		var commonCodeArr = [
			{mstCd: "ADM00004", useYn: "Y",targetObj: "#usrTyp", comboType:"OS"},	 	
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#acceptUseCd", comboType:"OS"}, 	
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} 		
		];

  		
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
    	
		
    	autosize($("#authGrpDesc"));
  		
		
    	if(type == "update"){
    		
    		selectPrjAuthInfo();
    	}
		
    	
    	$("#prj2001SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		
    		
    		if (!form.valid()) {
    			return;
    		}
    		
        	
        	submitSaveAction();
    	});
    	
    };

    
    
	var selectPrjAuthInfo = function() {
    	
    	var paramPrjId = $("#prjId").val();
    	var paramAuthGrpId = $("#authGrpId").val();
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj2000/prj2100/selectPrj2000AuthGrpInfoAjax.do'/>", "async": false}
				,{"prjId": paramPrjId, "authGrpId":paramAuthGrpId});
		
		ajaxObj.setFnSuccess(function(data){

			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
		    	$.osl.setDataFormElem(data.prjAuthGrpInfoMap,"frPrj2001", ["prjId", "authGrpId", "authGrpNm", "ord", "authGrpDesc"]);
				
		    	
		    	$("#useCd").attr("data-osl-value", data.prjAuthGrpInfoMap.useCd);
				$("#acceptUseCd").attr("data-osl-value", data.prjAuthGrpInfoMap.acceptUseCd);
				$("#usrTyp").attr("data-osl-value", data.prjAuthGrpInfoMap.usrTyp);
				
				
				autosize.update($("#authGrpDesc"));
			}	
			
		});
		
		
		ajaxObj.send();
	};
    
    
  	
    var submitSaveAction = function(){
    	
    	var form = $('#'+formId);
  		
    	
    	var url = "<c:url value='/prj/prj2000/prj2000/insertPrj2000AuthGrpInfoAjax.do'/>";
    	if(type == "update"){
    		url = "<c:url value='/prj/prj2000/prj2000/updatePrj2000AuthGrpInfoAjax.do'/>"
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
		    				
		    				$("button[data-datatable-id=prj2000AuthTable][data-datatable-action=select]").click();
	    				}else{
	    					
	    					$.osl.datatable.list["prj2000AuthTable"].targetDt.reload();	
	    				}
	    				
	    				
	    				OSLPrj2000.selectFoldingAuthList();
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
	OSLPrj2001Popup.init();
});
	
</script>