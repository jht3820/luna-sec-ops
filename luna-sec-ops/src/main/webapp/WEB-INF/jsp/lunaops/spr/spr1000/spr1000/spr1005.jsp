<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form class="kt-form" id="frSpr1005">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramSprId" id="paramSprId" value="${param.paramSprId}">
	<input type="hidden" name="paramReqId" id="paramReqId" value="${param.paramReqId}">
	<input type="hidden" name="paramStartDt" id="paramStartDt" value="${param.paramStartDt}">
	<input type="hidden" name="paramEndDt" id="paramEndDt" value="${param.paramEndDt}">
	
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">결과 내용</span></label>
						<textarea  name="reqResultDesc" id="reqResultDesc" opttype="-1" required></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="reqResultDescSave">
		<i class="fa fa-save"></i><span class="osl-resize__display--show">등록</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span>
	</button>
</div>


<script>
"use strict";
var OSLSpr1005Popup = function () {
	var formId = 'frSpr1005'
	
	
	
	var formValidate = $.osl.validate(formId);
	var paramReqId = $("#paramReqId").val();
	var paramSprId = $("#paramSprId").val();
	var paramPrjGrpId = $("#paramPrjGrpId").val();
	var paramPrjId = $("#paramPrjId").val();
	
	var documentSetting = function(){
		
		
    	fnSprInfoSelect();
		
		$("#reqResultDescSave").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm("요구사항 처리 결과 내용을 등록하시겠습니까?",null,function(result) {
    	        if (result.value) {
    	        	
    	        	saveFormAction();
    	        }
    		});
		});
	};
	

	
	var fnSprInfoSelect = function(){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000SprReqResultDescInfoAjax.do'/>", "async": false}
				,{"reqId": paramReqId, "paramSprId":paramSprId, "paramPrjId":paramPrjId, "paramPrjGrpId": paramPrjGrpId});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var sprReqInfo = data.sprReqInfo;
   		    	
   				$.osl.setDataFormElem(sprReqInfo, formId);
   				
   		    	$.osl.editorSetting("reqResultDesc", {
  		    			formValidate: formValidate,
	   		    		'minHeight': 300,
	   		    		disableResizeEditor: false
   		    		});
   				
   			}
		});
		
		
		ajaxObj.send();
	};
	
	
	var saveFormAction = function(){
		
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/spr/spr1000/spr1000/updateSpr1000SprReqResultDescInfo.do'/>", "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				if(!$.osl.isNull($.osl.datatable.list["sprReqResultTable"])){
					$.osl.datatable.list["sprReqResultTable"].targetDt.reload();
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
	OSLSpr1005Popup.init();
});
</script>

