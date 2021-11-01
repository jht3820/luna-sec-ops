<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1301">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId }">
	<input type="hidden" id="lvl" name="lvl" value="${param.lvl}"
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<c:if test="${not empty param.upperTemplateId}">
				<div class="form-group">
					<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="prj1301.label.upperTemplateId">상위 템플릿 ID</span></label>
					<input type="text" class="form-control" placeholder="상위 템플릿 ID" name="upperTemplateId" id="upperTemplateId" value="${param.upperTemplateId}" readonly="readonly">
				</div>
				<div class="form-group">
					<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1301.label.upperTemplateNm">상위 템플릿 명</span></label>
					<input type="text" class="form-control" placeholder="상위 템플릿 명" name="upperTemplateNm" id="upperTemplateNm" value="${param.upperTemplateNm}" readonly="readonly">
				</div>
			</c:if>
			<c:if test="${param.type eq 'update'}">
				<div class="form-group">
					<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="prj1301.label.templateId">템플릿 ID</span></label>
					<input type="text" class="form-control" placeholder="템플릿 ID" name="templateId" id="templateId" value="${param.templateId}" readonly="readonly">
				</div>
			</c:if>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1301.label.templateNm">템플릿 명</span></label>
				<input type="text" class="form-control" placeholder="템플릿 명" name="templateNm" id="templateNm" minlength="2" maxlength="100" required>
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1301.label.templateDesc">비고</span></label>
				<textarea class="form-control osl-min-h-px--130" name="templateDesc" id="templateDesc" maxlength="2000"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1301SaveSubmit"> 
		<i class="fa fa-save"></i><span class="osl-resize__display--show" data-lang-cd="prj1301.button.insert">작성 완료</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span>
	</button>
	
</div>

<script>
"use strict";
var OSLPrj1301Popup = function () {
	
	var formId = 'frPrj1301';
	var type = $("#type").val();
	
	
	var templateId = $("#templateId").val();
	
	
	var paramPrjId = $("#paramPrjId").val();
	
	
	$("#prj1301SaveSubmit > span").text($.osl.lang("prj1301.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	
	var formValidate = $.osl.validate(formId);
	
    
    var documentSetting = function () {
    	
    	
    	autosize($("#templateEtc"));
    	
    	
    	if(type == "update"){
    		
    		selectTemplateInfo();
    	}
    	
    	
    	
    	$("#prj1301SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		
    		
    		if (!form.valid()) {
    			return;
    		}
    		
   			submitSaveAction();
    	});
    };

  	
    
	var selectTemplateInfo = function() {
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1300/selectPrj1300TemplateInfoAjax.do'/>", "async": false}
				,{"templateId": templateId});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
		    	$.osl.setDataFormElem(data.templateInfoMap,"frPrj1301", ["upperTemplateId", "upperTemplateNm", "templateId", "templateNm", "templateDesc"]);
				
				
		    	
				if($.osl.isNull(data.templateInfoMap.upperTemplateId)){
					$("#upperTemplateId").val("-");
				}
		    	
				
				if($.osl.isNull(data.templateInfoMap.upperTemplateNm)){
					$("#upperTemplateNm").val("-");
				}
		    	
		    	
				autosize.update($("#templateDesc"));
		    	
			}
		});
		
		
		ajaxObj.send();
	};
    
    
   
    var submitSaveAction = function(){
    	
    	var form = $('#'+formId);
    	
		
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("prj1301.message.confirm.insert"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1300/savePrj1301TemplateInfo.do'/>", "loadingShow": false}, formData);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    			}else{
	    				
	    				$.osl.toastr(data.message);

	    				
	    				$.osl.layerPopupClose();

	    				
	    				
	    				
	    				
	    				$("button[data-tree-id=prj1300TemplateTree][data-tree-action=select]").click();
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
	OSLPrj1301Popup.init();
});

	
</script>