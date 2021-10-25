<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj3102">
	<input type="hidden" name="dtParamPrjId" id="dtParamPrjId" value="${param.dtParamPrjId }">
	<input type="hidden" id="checkedFiles" name='checkedFiles' value="${param.checkedFiles}">
	<input type="hidden" id="ord" name="ord" value="${param.ord}">
	<input type="hidden" id="docId" name="docId" value="${param.docId}">
	<input type="hidden" id="signUseCd" name="signUseCd" value="${param.signUseCd }">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3102.label.rjtRes">반려 사유</span></label>
				<textarea class="form-control osl-min-h-px--130" name="rjtRes" id="rjtRes" maxlength="250"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj3102SaveSubmit"> 
		<i class="fa fa-save"></i><span class="osl-resize__display--show" data-lang-cd="prj3102.button.save">작성 완료</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span>
	</button>
	
</div>

<script>
"use strict";
var OSLPrj3102Popup = function () {
	var formId = 'frPrj3102';
	
	
	var prjId = $('#dtParamPrjId').val();
	
	
	var docId = $('#docId').val();
	
	
	var checkedFiles = $('#checkedFiles').val();
	
	
	var ord = $('#ord').val()
	
	
	$("#prj3001SaveSubmit > span").text($.osl.lang("prj3001.button.save"));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	
	var formValidate = $.osl.validate(formId);
	
    
    var documentSetting = function () {
    	
    	
    	autosize($("#rjtRes"));
    	
    	
    	$("#prj3102SaveSubmit").click(function(){
    		
    		
	    	submitInsertAction();
    	});
    	
    };

  	
   
    var submitInsertAction = function(){
		
		var form = $('#'+formId);
    	
		
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("prj3102.message.confirm.save"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj3000/prj3100/updatePrj3001SignRjtAjax.do'/>", "loadingShow": false}, formData);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    			}else{
	    				
	    				
	    				$.osl.toastr(data.message);

	    				
	    				$.osl.layerPopupClose();
	    				
	    				
	    				$("button[data-tree-id=prj3100DocTree][data-tree-action=selectFiles]").click();
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
	OSLPrj3102Popup.init();
});

	
</script>