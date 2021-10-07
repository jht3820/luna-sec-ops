<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1302">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId }">
	<input type="hidden" name="templateId" id="templateId" value="${param.paramTemplateId }">
	<input type="hidden" name="itemId" id="itemId" value="${param.paramItemId }">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemNm">항목 명</span></label>
						<input type="text" class="form-control" placeholder="항목 명" name="itemNm" id="itemNm" minlength="2" maxlength="100" required>
					</div>
				</div>
				
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemCode">항목 분류</span></label>
						<select class="form-control kt-select2" id="itemCode" name="itemCode" opttype="-1" required>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemType">항목 타입</span></label>
						<select class="form-control kt-select2" id="itemType" name="itemType" opttype="-1" required>
						</select>
					</div>
				</div>
				
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemPcRowNum">PC 열 넓이</span></label>
						<select class="form-control kt-select2 rowNumSelectBox" id="itemPcRowNum" name="itemPcRowNum" opttype="-1" required>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemTabletRowNum">테블릿 열 넓이</span></label>
						<select class="form-control kt-select2 rowNumSelectBox" id="itemTabletRowNum" name="itemTabletRowNum" opttype="-1" required>
						</select>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemMobileRowNum">모바일 열 넓이</span></label>
						<select class="form-control kt-select2 rowNumSelectBox" id="itemMobileRowNum" name="itemMobileRowNum" opttype="-1" required>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemOrd">순서</span></label>
						<input type="number" class="form-control" placeholder="설정값" name="itemOrd" id="itemOrd" value="1" opttype="-1" min="0" max="999" maxlength="3" required>
					</div>
				</div>
				
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemCommonCode">공통코드</span></label>
						<select class="form-control kt-select2" id="itemCommonCode" name="itemCommonCode" data-select2-id="itemCommonCode"  opttype="-1" required disabled>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemLength">길이 제한</span></label>
						<input type="number" class="form-control" placeholder="길이 제한" name="itemLength" id="itemLength" value="1" opttype="-1" min="0" max="999" maxlength="3" required>
					</div>
				</div>
				
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemEssentialCd">필수 유무</span></label>
						<select class="form-control kt-select2" id="itemEssentialCd" name="itemEssentialCd" opttype="-1" required>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1302SaveSubmit"> 
		<i class="fa fa-save"></i><span data-lang-cd="prj1302.button.insert">작성 완료</span>
	</button>
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
	
	
	var itemId = $("#itemId").val();
	
	
	$("#prj1302SaveSubmit > span").text($.osl.lang("prj1302.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	
	var formValidate = $.osl.validate(formId);
	
    
    var documentSetting = function () {
    	
    	
    	$("#itemCode").change(function(){
    		itemCodeChange();
    	});
    	
    	
    	var rowNumList = "";
    	for(var i=1;i<=12;i++){
    		rowNumList += "<option value='"+i+"'>"+i+"</option>";
    	}
		$(".rowNumSelectBox").append(rowNumList);
		
    	
    	if(type == "update"){
    		
    		selectTemplateInfo();
    	}else{
    		var commonCodeArr = [
	 			{mstCd: "FLW00001", useYn: "Y",targetObj: "#itemCode", comboType:"OS"}, 
	 			{mstCd: "FLW00003", useYn: "Y",targetObj: "#itemType", comboType:"OS"}, 
	 			
	 			{mstCd: "CMM00001", useYn: "Y",targetObj: "#itemEssentialCd", comboType:"OS"} 
			];
   	
			
			$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
			
	    	commonCodeDataSelect();
    	}
    	
    	
    	$("#prj1302SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		
    		
    		if (!form.valid()) {
    			return;
    		}
    		
   			submitSaveAction();
    	});
    };

    var itemCodeChange = function(){
    	var selCode = $("#itemCode").val();
		if(selCode=='01'){
			
			$("#itemCommonCode").prop("disabled",true);
			$("#itemType").prop("disabled",false);
		}else if(selCode=='02'){
			
			$("#itemCommonCode").prop("disabled",false);
			$("#itemType").prop("disabled",true);
		}else{
			
			$("#itemCommonCode").prop("disabled",true);
			$("#itemType").prop("disabled",true);
		}
    }
  	var commonCodeDataSelect = function(selData){
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1300/selectPrj1302CommonCodeListAjax.do'/>", "async": false},{});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				var codeList = data.commonCodeList;
				var codeHtml ="";
				$.each(codeList, function(idx, code){
					if(selData==code.mstCd){
						codeHtml="<option value='"+code.mstCd+"' selected='selected'>"+code.mstCdNm+"</option>"
					}else{
						codeHtml="<option value='"+code.mstCd+"'>"+code.mstCdNm+"</option>"
					}
					$("#itemCommonCode").append(codeHtml);
				});
				
				
				
			}
		});
		
		
		ajaxObj.send();
  	}
    
	var selectTemplateInfo = function() {
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1300/selectPrj1302ItemInfoAjax.do'/>", "async": false}
				,{"templateId": templateId, "itemId": itemId});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				var itemInfo=data.templateInfoMap
				
		    	$.osl.setDataFormElem(itemInfo,"frPrj1302", ["itemNm", "itemCode", "itemType", "itemPcRowNum", "itemTabletRowNum", "itemMobileRowNum", "itemOrd", "itemCommonCode", "itemLength", "itemEssentialCd"]);
				
				
		    	$("#itemCode").attr("data-osl-value", itemInfo.itemCode);
		    	$("#itemType").attr("data-osl-value", itemInfo.itemType);
		    	$("#itemEssentialCd").attr("data-osl-value", itemInfo.itemEssentialCd);
		    	
				var commonCodeArr = [
		 			{mstCd: "FLW00001", useYn: "Y",targetObj: "#itemCode", comboType:"OS"}, 
		 			{mstCd: "FLW00003", useYn: "Y",targetObj: "#itemType", comboType:"OS"}, 
		 			
		 			{mstCd: "CMM00001", useYn: "Y",targetObj: "#itemEssentialCd", comboType:"OS"} 
				];
		   	
				
				$.osl.getMulticommonCodeDataForm(commonCodeArr , false);

				itemCodeChange();
				
				
		    	commonCodeDataSelect(itemInfo.itemCommonCode);
			}
		});
		
		
		ajaxObj.send();
	};
    
    
   
    var submitSaveAction = function(){
    	
    	var form = $('#'+formId);
    	
		
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("prj1302.message.confirm.insert"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1300/savePrj1302ItemInfo.do'/>", "loadingShow": false}, formData);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    			}else{
	    				
	    				$.osl.toastr(data.message);

	    				
	    				$.osl.layerPopupClose();

	    				
	    				
	    				
	    				
	    				$("button[data-datatable-id=prj1301PrjTable][data-datatable-action=select]").click();
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
	OSLPrj1302Popup.init();
});

	
</script>