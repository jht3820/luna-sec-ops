<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form class="kt-form" id="frSpr1002" name="frSpr1002">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramSprId" id="paramSprId" value="${param.paramSprId}">
	<input type="hidden" name="sprStDt" id="sprStDt">
	<input type="hidden" name="sprEdDt" id="sprEdDt">
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__body">
			
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>스프린트 명</label>
						<input type="text" class="form-control" name="sprNm" id="sprNm" opttype="-1" maxlength="99" required>
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>스프린트 기간</label>
						<input type="text" class="form-control" id="sprRange" name="sprRange" opttype="-1">
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>스프린트 설명</label> 
						<textarea type="text" class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="sprDesc" id="sprDesc" opttype="-1" required></textarea>
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required" for="ord"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>정렬 순서</span></label>
						<input type="number" class="form-control" placeholder="정렬 순서" name="ord" id="ord" value="1" opttype="-1" min="0" max="999" maxlength="3" required>
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
						<select class="form-control kt-select2" id="useCd" name="useCd" opttype="-1" required>
						</select>
						<c:if test="${param.type == 'update'}">
							<span class="form-text text-muted">대기 상태의 스프린트만 수정이 가능합니다.</span>
						</c:if>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</form>

<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="spr1002SaveSubmit" name="spr1002SaveSubmit"><i class="fa fa-save"></i><span>등록</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>



<script>
"use strict";
var OSLSpr1002Popup = function () {
	
	var type = $("#type").val();
	
	var formId = 'frSpr1002'
	
	
	var paramPrjGrpId = $("#paramPrjGrpId").val();
	var paramPrjId = $("#paramPrjId").val();
	var paramSprId = $("#paramSprId").val();

	var documentSetting = function(){
		
    	$("#spr1002SaveSubmit > span").text($.osl.lang("spr1002."+type+".saveBtnString"));
		
		
		var formEditList = [];
		
		
		var formValidate = $.osl.validate(formId);
		
		var today = new Date().format("yyyy-MM-dd");
    	
    	$("#sprStDt").val(today);
		$("#sprEdDt").val(today);
		
		
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} 
		];
		
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		
    	
		$.osl.date.daterangepicker($("#sprRange"), {}, function(defaultConfig, start, end, label) {
			var sprStDt = new Date(start._d).format("yyyy-MM-dd");
			var sprEdDt = new Date(end._d).format("yyyy-MM-dd");
			
			$("#sprStDt").val(sprStDt);
			$("#sprEdDt").val(sprEdDt);
		});
    	
		
    	$("#spr1002SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("spr1002."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	
    	        	saveFormAction();
    	        }
    		});
    	});
		
    	
		if(type == "update"){
			fnSprInfoSelect();
		}
	};
	
	
    var saveFormAction = function() {
    	
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/spr/spr1000/spr1000/saveSpr1002SprInfo.do'/>", "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
				$.osl.datatable.list["spr1000Table"].targetDt.reload();
   			}
   		});
   		
   		
   		ajaxObj.send();
    };
    
    
	var fnSprInfoSelect = function(deferred){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000SprInfoAjax.do'/>"}
				,{paramPrjGrpId: paramPrjGrpId, paramPrjId: paramPrjId, paramSprId: paramSprId});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var sprInfo = data.sprInfo;
   				
   				$.osl.setDataFormElem(sprInfo, formId, ["sprNm","useCd","ord","sprDesc","sprStDt","sprEdDt"]);
   				
   				
   				$("#sprRange").data("daterangepicker").setStartDate(sprInfo.sprStDt);
   				$("#sprRange").data("daterangepicker").setEndDate(sprInfo.sprEdDt);
   				
   				$("#useCd").val(sprInfo.useCd).trigger('change.select2');
   				
   				
   				if(sprInfo.sprTypeCd != "01"){
   					$("#useCd").attr("disabled","disabled");
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
	OSLSpr1002Popup.init();
});
</script>

