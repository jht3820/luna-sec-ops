<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6602">
	<input type="hidden" id="type" name="type" value="${param.type}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="cmm6602.label.signRes" id="signResText">결재 사유</span></label>
				<textarea class="form-control osl-min-h-px--130" name="signRes" id="signRes" maxlength="250"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="cmm6602SaveSubmit"> 
		<i class="fa fa-save"></i><span data-lang-cd="cmm6602.button.save">작성 완료</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span>Close</span>
	</button>
</div>

<script>
"use strict";
var OSLCmm6602Popup = function () {
	var formId = 'frCmm6602';
	
	
	var type = $("#type").val();
	
	
	$("#signResText").text($.osl.lang("cmm6602.label."+type));
	$("#cmm6602SaveSubmit > span").text($.osl.lang("cmm6602.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
    
    var documentSetting = function () {
    	
    	autosize($("#signRes"));
    	
    };

    return {
        
        init: function() {
        	documentSetting();
        },
        getSignRes: function(){
        	var signRes = $("#signRes").val();
        	return signRes;
        },
        getType: function(){
        	return type;
        }
    };
}();


$.osl.ready(function(){
	OSLCmm6602Popup.init();
});

	
</script>