<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form"  id="frStm8001" autocomplete="off">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="strgRepId" id="strgRepId" value="<c:out value='${param.strgRepId}'/>">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group kt-margin-b-5">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-12 col-12 kt-margin-b-15">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm8001.label.strgTypeCd">유형</span></label>
						<select class="form-control kt-select2" name="strgTypeCd" id="strgTypeCd" required></select>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12 col-12">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm8001.label.useCd">사용여부</span></label>
				<select class="form-control kt-select2" name="useCd" id="useCd" required></select>
					</div>
				</div>
			</div>
			<div class="form-group kt-margin-b-15">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm8001.label.strgRepTitle">저장소명</span></label>
				<input type="text" class="form-control" name="strgRepTitle" id="strgRepTitle" placeholder="저장소명" autocomplete="off" required>
			</div>
			<div class="form-group kt-margin-b-15">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm8001.label.strgRepUrl">URL</span></label>
				<input type="text" class="form-control" name="strgRepUrl" id="strgRepUrl" placeholder="URL"  autocomplete="off" required>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-12 col-12 kt-margin-b-15">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm8001.label.strgUsrId">USER</span></label>
					<input type="text" class="form-control" name="strgUsrId" id="strgUsrId" placeholder="사용자 ID"  autocomplete="off" required>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-12" id="optPw" name="optPw">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm8001.label.strgUsrPw">PW</span></label>
					<input type="password" class="form-control" name="strgUsrPw" id="strgUsrPw" placeholder="사용자 PW"  autocomplete="new-password" required>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-12" id="optRep" name="optRep">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm8001.label.strgRepNm">Repo.</span></label>
					<input type="text" class="form-control" name="strgRepNm" id="strgRepNm" placeholder="GIT 프로젝트명"  autocomplete="off" required>
				</div>
			</div>
			<div class="form-group kt-margin-b-15" id="optKey" name="optKey">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm8001.label.strgKey">TOKEN</span></label>
				<input type="text" class="form-control" name="strgKey" id="strgKey" placeholder="GIT TOKEN"  autocomplete="off" required>
			</div>
			<div class="form-group form-group-last">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm8001.label.strgTxt">저장소 설명</span></label>
				<textarea class="form-control osl-min-h-px--140" name="strgTxt" id="strgTxt"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm8000SaveSubmit"><i class="fa fa-check-square"></i><span class="osl-resize__display--show" data-lang-cd="stm8001.complete">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>

<script>
 "use strict";

 var OSLStm8001Popup = function() {
	var formId = 'frStm8001';
	
	 
	var formValidate = $.osl.validate(formId);
	
	
	var type;
	
	
	var strgOriUsrPw;
	
	
	 var documentSetting = function() {
		type = $("#type").val();
		
		
		$("#stm8000SaveSubmit > span").text($.osl.lang("stm8001.submit."+type+"Btn"));
		
		
		$("#strgRepTitle").attr("placeholder",$.osl.lang("stm8001.placeholder.strgRepTitle"));
		$("#strgRepUrl").attr("placeholder",$.osl.lang("stm8001.placeholder.strgRepUrl"));
		$("#strgUsrId").attr("placeholder",$.osl.lang("stm8001.placeholder.strgUsrId"));
		$("#strgUsrPw").attr("placeholder",$.osl.lang("stm8001.placeholder.strgUsrPw"));
		$("#strgRepNm").attr("placeholder",$.osl.lang("stm8001.placeholder.strgRepNm"));
		$("#strgKey").attr("placeholder",$.osl.lang("stm8001.placeholder.strgKey"));
		 
		
		$("#optRep").addClass("kt-hide");
		$("#optKey").addClass("kt-hide");
		 
		
    	$('#strgTypeCd').select2({
			ftScrollUse: false,
		});
    	$('#useCd').select2({
			ftScrollUse: false,
		});
    	
    	
    	if(type=="insert"){
    		
			var commonCodeArr = [
				{mstCd: "STM00004", useYn: "Y", targetObj: "#strgTypeCd", comboType:""},
				{mstCd: "CMM00001", useYn: "Y", targetObj: "#useCd", comboType:""},
			];
	  		
			$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
    	}else{
    		selectStrgRepInfo();
    	}
	    
    	
		$("#strgTypeCd").change(function(){
			
			var typeCd = $("#strgTypeCd").val();
			
			
			if(typeCd == "01"){
				
				$("#optPw").removeClass("kt-hide");
				$("#optRep").addClass("kt-hide");
				$("#optKey").addClass("kt-hide");
				$("#strgRepUrl").val("");
				$("#strgRepUrl").prop("readonly", false);
			}else{
				
				$("#optPw").addClass("kt-hide");
				$("#optRep").removeClass("kt-hide");
				$("#optKey").removeClass("kt-hide");
				$("#strgRepUrl").val("https:
				$("#strgRepUrl").prop("readonly", true);
			}
		});
    	
    	
    	$("#stm8000SaveSubmit").click(function(){
    		var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		
    		
       		var fd = $.osl.formDataToJsonArray(formId);
    		
    		
    		if(type == "insert"){
    			
    			
    	   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm8000/stm8000/insertStm8000ServerInfoAjax.do'/>"
    	   			,"loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

    	   		
    	   		ajaxObj.setFnSuccess(function(data){
    	   			if(data.errorYn == "Y"){
    	   				$.osl.alert(data.message,{type: 'error'});
    	   			}else{
    	   				
    	   				$.osl.toastr(data.message);

    	   				
    	   				$.osl.layerPopupClose();
    	   				
    	   				
    	   				$("button[data-datatable-id=stm8000RepTable][data-datatable-action=select]").click();
    	   			}
    	   		});
    		}else{
    			
    			
    			fd.append("strgOriUsrPw", strgOriUsrPw);
    			
    			
    	   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm8000/stm8000/updateStm8000ServerInfoAjax.do'/>"
    	   			,"loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

    	   		
    	   		ajaxObj.setFnSuccess(function(data){
    	   			if(data.errorYn == "Y"){
    	   				$.osl.alert(data.message,{type: 'error'});
    	   			}else{
    	   				
    	   				$.osl.toastr(data.message);

    	   				
    	   				$.osl.layerPopupClose();
    	   				
    	   				
    	   				$("button[data-datatable-id=stm8000RepTable][data-datatable-action=select]").click();
    	   			}
    	   		});
    		}
   	   		
   	   		ajaxObj.send();
    	});
	}
	
	 
	var selectStrgRepInfo = function(){
		var data = {
				strgRepId : $("#strgRepId").val()
		};

		
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000ServerInfoAjax.do'/>"}, data);
		
   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$("#strgTypeCd").attr("data-osl-value", data.repInfo.strgTypeCd);
   				$("#useCd").attr("data-osl-value", data.repInfo.useCd);
   				
   		    	
   				var commonCodeArr = [
   					{mstCd: "STM00004", useYn: "Y", targetObj: "#strgTypeCd", comboType:"OS"},
   					{mstCd: "CMM00001", useYn: "Y", targetObj: "#useCd", comboType:"OS"},
   				];
   		    	
   		  		
   				$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
   		  		
   		  		
   		  		if(data.repInfo.strgTypeCd == "01"){
   		  			
	   		  		$("#optPw").removeClass("kt-hide");
					$("#optRep").addClass("kt-hide");
					$("#optKey").addClass("kt-hide");
					$("#strgRepUrl").val("");
					$("#strgRepUrl").prop("readonly", false);
   		  		}else{
   		  			
					$("#optPw").addClass("kt-hide");
					$("#optRep").removeClass("kt-hide");
					$("#optKey").removeClass("kt-hide");
					$("#strgRepUrl").val("https:
					$("#strgRepUrl").prop("readonly", true);
   		  		}
   		  		
   		  		
		    	$.osl.setDataFormElem(data.repInfo,"frStm8001");
   		  		
   		  		$("#strgUsrId").val(data.repInfo.strgUsrId);
   		  		$("#strgUsrPw").val(data.repInfo.strgUsrPw);
   		  		strgOriUsrPw = data.repInfo.strgUsrPw;
   		  		$("#strgKey").val(data.repInfo.strgKey);
   			}
   		});
  	 	
   		ajaxObj.send();
	};
	 
	 return {
		 init: function(){
			 documentSetting();
		 }
	 };
 }();
 
 $.osl.ready(function(){
	 OSLStm8001Popup.init();
 });
</script>
