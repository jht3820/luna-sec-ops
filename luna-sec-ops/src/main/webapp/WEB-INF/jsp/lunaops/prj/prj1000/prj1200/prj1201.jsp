<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1201">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="prjSetId" id="prjSetId" value="${param.paramPrjSetId}">
	<input type="hidden" name="newSetYn" id="newSetYn" value="${param.paramNewSetYn}">
	<div class="kt-portlet ">
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1201.label.prjSetNm">설정명</span></label>
						<input type="text" class="form-control" placeholder="설정명" name="prjSetNm" id="prjSetNm" opttype="-1" maxlength="100" disabled>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1201.label.prjSetDesc">설정 설명</span></label>
						<textarea class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="prjSetDesc" id="prjSetDesc" opttype="-1" maxlength="2000" disabled></textarea>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1201.label.prjSetTarget">설정 대상</span></label>
						<select class="form-control kt-select2" id="prjSetTarget" name="prjSetTarget" opttype="-1" disabled >
						</select>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1201.label.prjSetVal">설정 값 타입</span></label>
						<select class="form-control kt-select2" id="valType" name="valType" opttype="-1" disabled>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1201.label.prjSetVal">설정값</span></label>
						<c:choose>
							<c:when test="${param.paramValType eq '03' }">
								<select class="form-control kt-select2" id="prjSetVal" name="prjSetVal" opttype="-1">
								</select>
							</c:when>
							<c:when test="${param.paramValType eq '02' }">
								<input type="number" class="form-control" placeholder="설정값" name="prjSetVal" id="prjSetVal" value="1" opttype="-1" min="0" max="999" maxlength="3" required>
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" placeholder="설정값" name="prjSetVal" id="prjSetVal" opttype="-1" maxlength="50" required>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1201.label.useCd">사용유무</span></label>
						<select class="form-control kt-select2" id="useCd" name="useCd" opttype="-1">
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1201SaveSubmit"><i class="fa fa-check-square"></i><span class="osl-resize__display--show">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLPrj1201Popup = function () {
	var formId = 'frPrj1201';
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var type = $("#type").val();
	
	
	var paramPrjSetId = $("#prjSetId").val();
	
    
    var documentSetting = function () {
    	
    	$("#prj1201SaveSubmit > span").text($.osl.lang("prj1201."+type+".saveBtnString"));
    	
    	
		
    	$("#prj1201SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj1201."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	
    	        	saveFormAction();
    	        }
    		});
    	});
		
		
		if(type == "update"){
			fnPrjSetInfoSelect();
		}
    };
    
    
    var saveFormAction = function() {
    	
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1200/savePrj1201PrjSetInfo.do'/>", "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				$("button[data-datatable-id=prj1200PrjTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		
   		ajaxObj.send();
    };
    
	
	
	var fnPrjSetInfoSelect = function(){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1200/selectPrj1201PrjSetInfoAjax.do'/>"}
				,{"prjSetId": paramPrjSetId});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var prjSetInfo = data.prjSetInfo;
   		    	
   		    	
   		    	
   		    	var commonCodeArr = {};
   		    	$("#prjSetTarget").attr("data-osl-value", prjSetInfo.prjSetTarget);
   		    	$("#valType").attr("data-osl-value", prjSetInfo.valType);
   		    	$("#useCd").attr("data-osl-value", prjSetInfo.useCd);
   		    	if(prjSetInfo.valType == '03'){
   		    		$("#prjSetVal").attr("data-osl-value", prjSetInfo.prjSetVal);
	   				commonCodeArr = [
	   		 			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"}, 
	   		 			{mstCd: "PRJ00015", useYn: "Y",targetObj: "#valType", comboType:"OS"}, 
	   		 			{mstCd: "PRJ00017", useYn: "Y",targetObj: "#prjSetTarget", comboType:"OS"}, 
						{mstCd: prjSetInfo.mstCd, useYn: "Y",targetObj: "#prjSetVal", comboType:"OS"} 
	   				];
   		    	}else{
	   		 		commonCodeArr = [
	   		 			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"}, 
	   		 			{mstCd: "PRJ00015", useYn: "Y",targetObj: "#valType", comboType:"OS"}, 
	   		 			{mstCd: "PRJ00017", useYn: "Y",targetObj: "#prjSetTarget", comboType:"OS"} 
   		 			];
   		    	}
   		    	
   				
   				$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
   				
   				$.osl.setDataFormElem(prjSetInfo, formId);
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
	OSLPrj1201Popup.init();
});

	
</script>