<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm6001">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" id="lvl" name="lvl" value="${param.lvl}"//>
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="stm6001.label.upperDeptId">상위 조직 ID</span></label>
				<input type="text" class="form-control" placeholder="상위 조직 ID" name="upperDeptId" id="upperDeptId" value="${param.upperDeptId}" readonly="readonly">
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm6001.label.upperDeptNm">상위 조직 명</span></label>
				<input type="text" class="form-control" placeholder="상위 조직 명" name="upperDeptNm" id="upperDeptNm" value="${param.upperDeptNm}" readonly="readonly">
			</div>
			<c:if test="${requestScope.type == 'update'}">
				<div class="form-group">
					<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="stm6001.label.deptId">조직 ID</span></label>
					<input type="text" class="form-control" placeholder="조직 ID" name="deptId" id="deptId" value="${param.deptId}" readonly="readonly">
				</div>
			</c:if>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm6001.label.deptNm">조직명</span></label>
				<input type="text" class="form-control" placeholder="조직 명" name="deptName" id="deptName" minlength="2" maxlength="100" required>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="stm6001.label.deptOrd">순번</span></label>
				<input type="number" class="form-control" placeholder="순번" name="ord" id="ord" value="${requestScope.nextOrd}" required>
			</div>
			<c:if test="${requestScope.type == 'update'}">
				<div class="form-group">
					<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="stm6001.label.deptUseCd">사용유무</span></label>
					<select class="form-control kt-select2" id="useCd" name="useCd">
					</select>
				</div>
			</c:if>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm6001.label.deptEtc">비고</span></label>
				<textarea class="form-control osl-min-h-px--130" name="deptEtc" id="deptEtc" maxlength="2000"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm6001SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show" data-lang-cd="stm6001.button.insert">작성 완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i>
	<span class="osl-resize__display--show" data-lang-cd="modal.close"
	>Close</span></button>
</div>

<script>
"use strict";
var OSLStm6001Popup = function () {
	
	var formId = 'frStm6001';
	var type = $("#type").val();
	
	
	$("#stm6001SaveSubmit > span").text($.osl.lang("stm6001.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	
	var formValidate = $.osl.validate(formId);
	
    
    var documentSetting = function () {
    	
    	
    	autosize($("#deptEtc"));
    	
    	
    	if(type == "update"){
    		
        	
    		var commonCodeArr = [
    			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} 
    		];

      		
    		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
    		
    		
    		selectDeptInfo();
    	}
    	
    	
    	
    	$("#stm6001SaveSubmit").click(function(){
    		
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
    	
    };

    
    
	var selectDeptInfo = function() {
    	
		var deptId = $("#deptId").val();
		 
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm6000/stm6000/selectStm6000DeptInfoAjax.do'/>", "async": false}
				,{"deptId": deptId});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
		    	$.osl.setDataFormElem(data.deptInfoMap,"frStm6001", ["deptId", "upperDeptId", "upperDeptNm", "deptName", "lvl", "ord", "deptEtc"]);
			
		    	
				if($.osl.isNull(data.deptInfoMap.upperDeptId)){
					$("#upperDeptId").val("-");
				}
		    	
		    	if(type == "update"){
		    		$("#useCd").attr("data-osl-value", data.deptInfoMap.useCd);
		    	}
		    	
		    	
				autosize.update($("#deptEtc"));
		    	
			}
		});
		
		
		ajaxObj.send();
	};
    
    
   
    var submitInsertAction = function(){
    	
    	var form = $('#'+formId);
    	
		
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("stm6001.message.confirm.insert"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm6000/stm6000/insertStm6000DeptInfoAjax.do'/>", "loadingShow": false}, formData);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    			}else{
	    				
	    				$.osl.toastr(data.message);

	    				
	    				$.osl.layerPopupClose();
	    				
	    				
	    				$("button[data-tree-id=stm6000DeptTree][data-tree-action=select]").click();
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
		
		$.osl.confirm($.osl.lang("stm6001.message.confirm.update"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm6000/stm6000/updateStm6000DeptInfoAjax.do'/>", "loadingShow": false}, formData);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    			}else{
	    				
	    				$.osl.toastr(data.message);

	    				
	    				$.osl.layerPopupClose();

	    				
	    				$("button[data-tree-id=stm6000DeptTree][data-tree-action=select]").click();
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
	OSLStm6001Popup.init();
});

	
</script>