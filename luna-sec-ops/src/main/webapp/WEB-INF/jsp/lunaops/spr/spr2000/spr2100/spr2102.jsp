<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frSpr2102" autocomplete="off">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="mmrId" id="mmrId" value="<c:out value='${param.mmrId}'/>">
	<input type="hidden" name="sprId" id="sprId" value="<c:out value='${param.sprId}'/>">
	<input type="hidden" name="paramSprNm" id="paramSprNm" value="<c:out value='${param.sprNm}'/>">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
		<div class="form-group">
			<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2101.label.sprNm">스프린트명</span></label>
			<input type="text" class="form-control" name="sprNm" id="sprNm" readonly="readonly">
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group">
					<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2101.label.mmrNm">회의록 제목</span></label>
					<input type="text" class="form-control" id="mmrNm" name="mmrNm" readonly="readonly">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group form-group-last">
					<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2101.label.mmrDesc">회의록 내용</span></label>
					<textarea class="form-control kt-hide" name="mmrDesc" id="mmrDesc" readonly="readonly"></textarea>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>

<script>
"use strict";
var OSLSpr2102Popup = function () {
	var formId = 'frSpr2102';
	
	
	var formEditList = [];
	
	
	var formValidate = $.osl.validate(formId);

	
    var documentSetting = function () {
    	
		
    	selectSprRptInfo();
	};
	
    
	 var selectSprRptInfo = function() {
    	var data = {
    			mmrId :  $("#mmrId").val(),
    			sprId :  $("#sprId").val(),
    	};

		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/spr/spr2000/spr2100/selectSpr2100MmrInfoAjax.do'/>", "async":"true"}
				,data);
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				
				$.osl.layerPopupClose();
			}else{
				
		    	$.osl.setDataFormElem(data.mmrInfo,"frSpr2102");

				
	    		formEditList.push($.osl.editorSetting("mmrDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:190
	    		}));
	    		
		    	
		    	$("#mmrDesc").removeClass("kt-hide");
			}
		});
		
		
		ajaxObj.send();
	};
	
    return {
        
        init: function() {
        	documentSetting();
        },
    };
}();


$.osl.ready(function(){
	OSLSpr2102Popup.init();
});
	
</script>