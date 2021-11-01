<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frSpr2101" autocomplete="off">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="mmrId" id="mmrId" value="<c:out value='${param.mmrId}'/>">
	<input type="hidden" name="sprId" id="sprId" value="<c:out value='${param.sprId}'/>">
	<input type="hidden" name="paramSprNm" id="paramSprNm" value="<c:out value='${param.sprNm}'/>">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
		<div class="form-group">
			<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2101.label.sprNm">스프린트명</span></label>
			<input type="text" class="form-control" name="sprNm" id="sprNm" autocomplete="off" readonly="readonly" required>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2101.label.mmrNm">회고록 제목</span></label>
					<input type="text" class="form-control" id="mmrNm" name="mmrNm" autocomplete="off" placeholder="제목" maxlength="80" required>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group form-group-last">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2101.label.mmrDesc">회고록 내용</span></label>
					<textarea class="form-control kt-hide" name="mmrDesc" id="mmrDesc"autocomplete="off"  required></textarea>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="spr2101SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show" data-lang-cd="spr2101.submit">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>

<script>
"use strict";
var OSLSpr2101Popup = function () {
	var formId = 'frSpr2101';
	
	
	var formEditList = [];
	
	
	var formValidate = $.osl.validate(formId);

	
	var type;

	
	var usrList = [];
	
	
    var documentSetting = function () {
    	
    	type = $("#type").val();
    	
    	
    	$("#spr2101SaveSubmit > span").text($.osl.lang("spr2101.button."+type+"Btn"));
    	
    	
    	$("#mmrNm").attr("placeholder",$.osl.lang("spr2101.placeholder.mmrNm"));
    	
    	
    	if(type == "insert"){
    		
    		$("#sprNm").val($("#paramSprNm").val());

    		
    		formEditList.push($.osl.editorSetting("mmrDesc", {formValidate: formValidate,height:190, 'minHeight': 190, disableResizeEditor: false}));
	    
    		
	    	$("#mmrDesc").removeClass("kt-hide");
    	
    	}else{
    		
    		
    		selectSprMmrInfo();
    	}
    	
    	
    	$("#spr2101SaveSubmit").click(function(){
			var form = $('#'+ formId);    		
			
			
    		if (!form.valid()) {
    			return false;
    		}
    		
    		$.osl.confirm($.osl.lang("spr2101.saveString."+type+"Str"),null,function(result) {
    	        if (result.value) {
    	        	if(type=="insert"){
    	        		submitInsertAction();
    	        	}else{
    	        		submitUpdateAction();
    	        	}
    	        }
    		});
    	});
    };
    
	 var selectSprMmrInfo = function() {
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
				
		    	$.osl.setDataFormElem(data.mmrInfo,"frSpr2101");
								
	    		
	    		formEditList.push($.osl.editorSetting("mmrDesc", {formValidate: formValidate,height:190, 'minHeight': 190, 'maxHeight': 190}));
	    		
		    	$("#mmrDesc").removeClass("kt-hide");
			}
		});
		
		
		ajaxObj.send();
	};
    
	
    var submitInsertAction = function(){
    	var form = $('#'+formId);    		
    	
		
		if (!form.valid()) {
			return;
		}

       	
   		var fd = $.osl.formDataToJsonArray(formId);
       	
       	
       	fd.append("mmrUsrId", $.osl.user.userInfo.usrId);

		
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/spr/spr2000/spr2100/insertSpr2101MmrInfoAjax.do'/>"
   			, "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
			,fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				OSLSpr2100Popup.reload();
   			}
   		});
   		
   		
   		ajaxObj.send();
    };
    
    
    var submitUpdateAction = function(){
		var form = $('#'+formId);    		
    	
		
		if (!form.valid()) {
			return;
		}

       	
   		var fd = $.osl.formDataToJsonArray(formId);

       	
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/spr/spr2000/spr2100/updateSpr2101MmrInfoAjax.do'/>"
   					, "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
   				,fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				OSLSpr2100Popup.reload();
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
	OSLSpr2101Popup.init();
});

	
</script>