<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form class="kt-form" id="frCmm6209">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramReqId" id="paramReqId" value="${param.paramReqId}">
	
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">반려 내용</span></label>
						<textarea  name="reqRejectDesc" id="reqRejectDesc" opttype="-1" required></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="reqRejectDescSave"><i class="fa fa-save"></i><span>반려 사유 등록</span></button>
	<input type="hidden" id="cmm6209SubmitBtn" name="cmm6209SubmitBtn"/>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>


<script>
"use strict";
var OSLCmm6209Popup = function () {
	var formId = 'frCmm6209'

	
	var formValidate = $.osl.validate(formId);
	
	var paramPrjGrpId = $("#paramPrjGrpId").val();
	var paramPrjId = $("#paramPrjId").val();
	var paramReqId = $("#paramReqId").val();
	
	
	var reqRejectDesc;
	var deferred = $.Deferred();
	
	var documentSetting = function(){
		
		$("#reqRejectDescSave").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		
    		
    		reqRejectDesc = $("#reqRejectDesc").val();
    		
    		$.osl.confirm("반려 사유를 등록하시겠습니까?",null,function(result) {
    	        if (result.value) {
    	        	$("#cmm6209SubmitBtn").click();
    	        	
       				$.osl.layerPopupClose();
    	        }
    		});
		});
		
		
    	$.osl.editorSetting("reqRejectDesc", {
			disableResizeEditor: false,
			height:170
    	});
	};
	
	return {
        
        init: function() {
        	documentSetting();
        },
        getReqRejectDesc: function(){
        	return reqRejectDesc;
        }
        
    };
}();

$.osl.ready(function(){
	OSLCmm6209Popup.init();
});
</script>

