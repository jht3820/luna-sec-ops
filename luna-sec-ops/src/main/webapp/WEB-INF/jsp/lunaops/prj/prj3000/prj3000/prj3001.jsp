<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj3001">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" name="dtParamPrjId" id="dtParamPrjId" value="${param.dtParamPrjId }">
	<input type="hidden" id="lvl" name="lvl" value="${param.lvl}"//>
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="prj3001.label.upperDocId">상위 산출물 ID</span></label>
				<input type="text" class="form-control" placeholder="상위 산출물 ID" name="upperDocId" id="upperDocId" value="${param.upperDocId}" readonly="readonly">
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3001.label.upperDocNm">상위 산출물 명</span></label>
				<input type="text" class="form-control" placeholder="상위 산출물 명" name="upperDocNm" id="upperDocNm" value="${param.upperDocNm}" readonly="readonly">
			</div>
			<c:if test="${requestScope.type == 'update'}">
				<div class="form-group">
					<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docId">산출물 ID</span></label>
					<input type="text" class="form-control" placeholder="산출물 ID" name="docId" id="docId" value="${param.docId}" readonly="readonly">
				</div>
			</c:if>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docNm">산출물 명</span></label>
				<input type="text" class="form-control" placeholder="산출물 명" name="docNm" id="docNm" minlength="2" maxlength="100" required>
			</div>
			<div class="form-group">
				<label><i class="fas fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docEdDtm">산출물 마감일</span></label>
				<input type="text" class="form-control" placeholder="산출물 마감일" name="docEdDtm" id="docEdDtm" readonly="readonly">
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docOrd">순번</span></label>
				<input type="number" class="form-control" placeholder="순번" name="ord" id="ord" value="${requestScope.nextOrd}" required>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj3001.label.signUseCd">결재 사용유무</span></label>
				<select class="form-control kt-select2" id="signUseCd" name="signUseCd">
				</select>
			</div>
			<c:if test="${requestScope.type == 'update'}">
				<div class="form-group">
					<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docUseCd">사용유무</span></label>
					<select class="form-control kt-select2" id="useCd" name="useCd">
					</select>
				</div>
			</c:if>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3001.label.docDesc">비고</span></label>
				<textarea class="form-control osl-min-h-px--130" name="docDesc" id="docDesc" maxlength="2000"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj3001SaveSubmit"> 
		<i class="fa fa-save"></i><span data-lang-cd="prj3001.button.insert">작성 완료</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span>Close</span>
	</button>
	
</div>

<script>
"use strict";
var OSLPrj3001Popup = function () {
	
	var formId = 'frPrj3001';
	var type = $("#type").val();
	
	
	var docId = $("#docId").val();
	
	
	var dtParamPrjId = $("#dtParamPrjId").val();
	
	
	$("#prj3001SaveSubmit > span").text($.osl.lang("prj3001.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	
	var formValidate = $.osl.validate(formId);
	
    
    var documentSetting = function () {
    	
    	
    	autosize($("#docEtc"));
    	
    	
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"}, 
			{mstCd: "PRJ00021", useYn: "Y",targetObj: "#signUseCd", comboType:"OS"} 
		];

  		
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
  		
    	
    	if(type == "update"){
    		
    		selectDocInfo();
    	}
    	
    	
    	$("#prj3001SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		
    		
    		if (!form.valid()) {
    			return;
    		}
    		
    		if(type == "insert"){
	    		submitInsertAction();
    		}else if(type == "update"){
    			submitUpdateAction();
    		}
    	});
    	
    	
    	$.osl.date.datepicker($("#docEdDtm"), {});
    };

  	
    
	var selectDocInfo = function() {
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj3000/prj3000/selectPrj3000DocInfoAjax.do'/>", "async": false}
				,{"docId": docId});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
		    	$.osl.setDataFormElem(data.docInfoMap,"frPrj3001", ["upperDocId", "upperDocNm", "docId", "docEdDtm", "docNm", "ord", "docDesc"]);
				
		    	
				if($.osl.isNull(data.docInfoMap.upperDocId)){
					$("#upperDocId").val("-");
				}
		    	
				
				if($.osl.isNull(data.docInfoMap.upperDocNm)){
					$("#upperDocNm").val("-");
				}
		    	
		    	if(type == "update"){
		    		$("#useCd").data("osl-value", data.docInfoMap.useCd);
		    	}
		    	
		    	
		    	$("#signUseCd").val("data.docInfoMap.signUseCd").trigger('change.select2');
		    	
		    	
				autosize.update($("#docDesc"));
		    	
			}
		});
		
		
		ajaxObj.send();
	};
    
    
   
    var submitInsertAction = function(){
    	
    	var form = $('#'+formId);
    	
		
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("prj3001.message.confirm.insert"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj3000/prj3000/insertPrj3000DocInfoAjax.do'/>", "loadingShow": false}, formData);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    			}else{
	    				
	    				$.osl.toastr(data.message);

	    				
	    				$.osl.layerPopupClose();
	    				
	    				
	    				$("button[data-tree-id=prj3000DocTree][data-tree-action=select]").click();
	    			}
	    		});
	    		
	    		
	    		ajaxObj.send();
	        }
	    });
    };
    
    
   
    var submitUpdateAction = function(){
    	
    	var form = $('#'+formId);
  		
		
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("prj3001.message.confirm.update"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj3000/prj3000/updatePrj3000DocInfoAjax.do'/>", "loadingShow": false}, formData);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    			}else{
	    				
	    				$.osl.toastr(data.message);

	    				
	    				$.osl.layerPopupClose();

	    				
	    				$("button[data-tree-id=prj3000DocTree][data-tree-action=selectDocInfo]").click();
	    				
	    				
	    				$("button[data-tree-id=prj3000DocTree][data-tree-action=select]").click();
	    				
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
	OSLPrj3001Popup.init();
});

	
</script>