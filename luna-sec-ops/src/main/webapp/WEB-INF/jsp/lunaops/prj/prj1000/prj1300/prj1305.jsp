<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1305">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId }">
	<input type="hidden" name="templateId" id="templateId" value="${param.paramTemplateId }">
	<input type="hidden" name="itemId" id="itemId" value="${param.paramItemId }">
	<input type="hidden" id="callPage" name="callPage" value="${param.callPage}">
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
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemPcRowNum">데스크탑 열 넓이</span></label>
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
						<input type="number" class="form-control" placeholder="길이 제한" name="itemLength" id="itemLength" opttype="-1" min="1" max="4000" value="255" maxlength="4" required>
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
			<div class="row kt-hide prjBasicItemColumn">
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemRequestCd">요청화면</span></label>
						<div class="form-group kt-margin-b-10">
							<label class="kt-checkbox kt-checkbox--bold">
								<input type="checkbox" class="osl-preview-readonly" id="itemRequestCd" name="itemRequestCd" value="01">
								<span></span>
							</label>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemAcceptCd">접수화면</span></label>
						<div class="form-group kt-margin-b-10">
							<label class="kt-checkbox kt-checkbox--bold">
								<input type="checkbox" class="osl-preview-readonly" id="itemAcceptCd" name="itemAcceptCd" value="01">
								<span></span>
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1305SaveSubmit"> 
		<i class="fa fa-save"></i><span class="osl-resize__display--show" data-lang-cd="prj1302.button.insert">작성 완료</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span>
	</button>
	
</div>
<button type="button" class="kt-hide" id="prj1305ModalCallBackBtn" name="prj1305ModalCallBackBtn"/>

<script>
"use strict";
var OSLPrj1305Popup = function () {
	
	var formId = 'frPrj1305';
	var type = $("#type").val();
	
	
	var templateId = $("#templateId").val();
	
	
	var paramPrjId = $("#paramPrjId").val();
	
	
	var itemId = $("#itemId").val();

	
	var callPage = $("#callPage").val();
	
	var itemList=[]
	
	
	$("#prj1305SaveSubmit > span").text($.osl.lang("prj1302.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	
	var formValidate = $.osl.validate(formId);
	
    
    var documentSetting = function () {
    	if(callPage == 'OSLPrj1001Popup'){
    		$(".prjBasicItemColumn").removeClass("kt-hide");
    	}
    	
    	
    	$("#itemCode").change(function(){
    		itemCodeChange();
    	});
    	
    	$("#itemType").change(function(){
    		itemTypeChange();
    	});
    	
    	
    	var rowNumList = "";
    	for(var i=1;i<=12;i++){
    		if(i==6){
    			rowNumList += "<option value='"+i+"' selected>"+i+"</option>";
    		}else{
    			rowNumList += "<option value='"+i+"'>"+i+"</option>";
    		}
    	}
		$(".rowNumSelectBox").append(rowNumList);
		
    	
    	if(type == "update"){
    		
    		selectTemplateInfo();
    	}else if(type == "updateJson"){
    		var itemObj = $.parseJSON('${param.itemObj}');
    		
    		$.osl.setDataFormElem(itemObj,"frPrj1305", ["itemId","itemNm", "itemCode", "itemType", "itemPcRowNum", "itemTabletRowNum", "itemMobileRowNum", "itemOrd", "itemCommonCode", "itemLength", "itemEssentialCd"]);
			
			if(itemObj.itemRequestCd == '01'){
				$("#itemRequestCd").prop("checked",true);
			}
			if(itemObj.itemAcceptCd == '01'){
				$("#itemAcceptCd").prop("checked",true);
			}
			
	    	$("#itemCode").attr("data-osl-value", itemObj.itemCode);
	    	$("#itemType").attr("data-osl-value", itemObj.itemType);
	    	$("#itemEssentialCd").attr("data-osl-value", itemObj.itemEssentialCd);
	    	
			var commonCodeArr = [
	 			{mstCd: "FLW00001", useYn: "Y",targetObj: "#itemCode", comboType:"OS"}, 
	 			{mstCd: "FLW00003", useYn: "Y",targetObj: "#itemType", comboType:"OS"}, 
	 			
	 			{mstCd: "CMM00001", useYn: "Y",targetObj: "#itemEssentialCd", comboType:"OS"} 
			];
	   	
			
			$.osl.getMulticommonCodeDataForm(commonCodeArr , false);

			itemCodeChange();
			
			itemTypeChange();
			
			
	    	commonCodeDataSelect(itemObj.itemCommonCode);
    	}else{
    		var commonCodeArr = [
	 			{mstCd: "FLW00001", useYn: "Y",targetObj: "#itemCode", comboType:"OS"}, 
	 			{mstCd: "FLW00003", useYn: "Y",targetObj: "#itemType", comboType:"OS"}, 
	 			
	 			{mstCd: "CMM00001", useYn: "Y",targetObj: "#itemEssentialCd", comboType:"OS"} 
			];
   	
			
			$.osl.getMulticommonCodeDataForm(commonCodeArr , false);
			
	    	commonCodeDataSelect();
			
			
	    	$("#itemCode option[value=03]").remove();
	    	$("#itemCode option[value=05]").remove();
    	}
    	
    	
    	$("#prj1305SaveSubmit").click(function(){
    		
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

    var itemTypeChange = function(){
    	var selType = $("#itemType").val();
		if(selType=='01'){
			$("#itemLength").prop("disabled",false);
			$("#itemLength").val("255");
		}else if(selType=='02'){
			$("#itemLength").prop("disabled",false);
			$("#itemLength").val("4000");
		}else{
			$("#itemLength").prop("disabled",true);
			$("#itemLength").val("");
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
				
		    	$.osl.setDataFormElem(itemInfo, "frPrj1305", ["itemNm", "itemCode", "itemType", "itemPcRowNum", "itemTabletRowNum", "itemMobileRowNum", "itemOrd", "itemCommonCode", "itemLength", "itemEssentialCd"]);
				
				
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
				
				itemTypeChange();
				
				
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
		var msg = "";
		if(type=="insert"){
			msg = $.osl.lang("prj1302.message.confirm.insert")
		}else if(type=="update"){
			msg = $.osl.lang("prj1302.message.confirm.update")
		}else if(type=="updateJson"){
			msg = $.osl.lang("prj1302.message.confirm.updateJson")
		}
		
		$.osl.confirm(msg ,null,function(result) {
	        if (result.value) {
	        	var jsonData = {};
	        	var formData = form.serializeArray();
	        	
	        	
	        	$.each(formData, function(idx, map){
	        		jsonData[map.name] = map.value;
	        	});
	        	if(type!="updateJson"){
	        		jsonData.itemId = 'ITM'+new Date().format('yyMMddHHmmssms')+"00";
	        	}
	        	
	        	itemList = [];
	        	itemList.push(jsonData);
	        	
	        	
	        	$("#prj1305ModalCallBackBtn").click();
				
				$.osl.layerPopupClose();
	        }
	    });
    };
    
    return {
        
        init: function() {
        	documentSetting();
        },
        getItemList: function(){
        	return itemList;
        }
        
    };
}();


$.osl.ready(function(){
	OSLPrj1305Popup.init();
});

	
</script>