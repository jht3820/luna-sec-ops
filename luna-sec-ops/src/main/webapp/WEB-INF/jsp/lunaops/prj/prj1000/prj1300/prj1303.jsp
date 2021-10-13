<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1302">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId }">
	<input type="hidden" name="templateId" id="templateId" value="${param.paramTemplateId }">
	<input type="hidden" name="paramDataList" id="paramDataList" value='${param.paramDataList }'>
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="row" id="optionPreview">
			
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span>Close</span>
	</button>
	
</div>

<script>
"use strict";
var OSLPrj1302Popup = function () {
	
	var formId = 'frPrj1302';
	var type = $("#type").val();
	
	
	var templateId = $("#templateId").val();
	
	
	var paramPrjId = $("#paramPrjId").val();
	
	var paramDataList = $("#paramDataList").val();
	
	
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	
	var formValidate = $.osl.validate(formId); 
	
    
    var documentSetting = function () {
    	if(paramDataList==""){
    		
    		commonCodeDataSelect();
    	}else{
    		paramDataList = JSON.parse(paramDataList);
    	}
    	
    	
    	$.osl.customOpt.setting(paramDataList,  "optionPreview",
    			
    			{
    				viewType: "preview"
    			},
    			
    			function(){
    				
    			}
    	); 
    };

  	var commonCodeDataSelect = function(selData){
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1300/selectPrj1302AllItemListAjax.do'/>", "async": false},{
					templateId: templateId,
					paramPrjId: paramPrjId
				});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				paramDataList = data.itemList;
			}
		});
		
		
		ajaxObj.send();
  	}
    
    return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();


$.osl.ready(function(){
	OSLPrj1302Popup.init();
});

	
</script>