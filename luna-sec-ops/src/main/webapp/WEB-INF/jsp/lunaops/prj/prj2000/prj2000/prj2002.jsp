<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj2002">
	<input type="hidden" name="prjId" id="prjId" value="${param.paramPrjId}">
	<input type="hidden" name="authGrpId" id="authGrpId" value="${param.paramAuthGrpId}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i>권한그룹 명</label>
				<input type="text" class="form-control" placeholder="권한그룹 명" name="authGrpNm" id="authGrpNm" readonly="readonly">
			</div>
			<div class="form-group">
				<label><i class="fa fa-list-ol kt-margin-r-5"></i>순번</label>
				<input type="number" class="form-control" placeholder="순번" name="ord" id="ord" readonly="readonly">
			</div>
			<div class="form-group">
				<label><i class="fa fa-portrait kt-margin-r-5"></i>사용자 유형</label>
				<input type="text" class="form-control" placeholder="사용자 유형" name="usrTypNm" id="usrTypNm" readonly="readonly">
			</div>
			<div class="form-group">
				<label><i class="fa fa-receipt kt-margin-r-5"></i>접수권한 사용유무</label>
				<input type="text" class="form-control" placeholder="접수권한 사용유무" name="acceptUseNm" id="acceptUseNm" readonly="readonly">
			</div>
			<div class="form-group">
				<label><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
				<input type="text" class="form-control" placeholder="사용유무" name="useNm" id="useNm" readonly="readonly">
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i>비고</label>
				<div class="form-control h-100 osl-min-height--12rem" id="authGrpDesc"></div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i>
		<span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>

<script>
"use strict";
var OSLPrj2002Popup = function () {
	var formId = 'frPrj2002';

    
    var documentSetting = function () {
		
    	selectPrjAuthInfo();
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
				
		    	$.osl.setDataFormElem(data.prjAuthGrpInfoMap,"frPrj2002", ["prjId", "authGrpId", "authGrpNm", "useNm", "acceptUseNm", "usrTypNm", "ord"]);
			
		    	var authGrpDesc = data.prjAuthGrpInfoMap.authGrpDesc;
		    	if(!$.osl.isNull(authGrpDesc)){
		    		authGrpDesc =  $.osl.escapeHtml(authGrpDesc);
			    	
					$("#authGrpDesc").html(authGrpDesc.replace(/\n/g, '<br/>'));
				}
		    	
			}	
			
		});
		
		
		ajaxObj.send();
	};
	
    return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();


$.osl.ready(function(){
	OSLPrj2002Popup.init();
});
	
</script>