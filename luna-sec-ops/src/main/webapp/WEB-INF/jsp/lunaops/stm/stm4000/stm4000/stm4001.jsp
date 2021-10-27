<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm4001">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" name="lvl" id="lvl" value="0"/>
	<input type="hidden" name="mstCdEngNm" id="mstCdEngNm" />
	<input type="hidden" name="stmUseYn" id="stmUseYn" value="${param.paramStmUseYn}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<c:choose>
				<c:when test="${param.paramStmUseYn == 'Y' and requestScope.type == 'update'}">
					
					<div class="form-group">
						<label class="osl-font-lg"><i class="fa fa-exclamation-circle kt-margin-r-5"></i>시스템에서 사용되는 공통코드는 순번만 수정 가능합니다.</label>
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>공통코드</label>
						<input type="text" class="form-control" placeholder="공통코드 마스터" name="mstCd" id="mstCd" readonly="readonly" value="${param.paramMstCd}">
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>상위코드</label>
						<input type="text" class="form-control" placeholder="상위코드" name="upperMstCd" id="upperMstCd" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>코드명</label>
						<input type="text" class="form-control" placeholder="코드명" name="mstCdNm" id="mstCdNm" readonly="readonly">
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i>순번</label>
						<input type="number" class="form-control" placeholder="순번" name="ord" id="ord" value="${requestScope.nextOrd}" required>
					</div>
					<div class="form-group">
						<label><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
						<input type="text" class="form-control" placeholder="사용 유무" name="useNm" id="useNm" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-laptop kt-margin-r-5"></i>시스템 사용 유무</label>
						<input type="text" class="form-control" placeholder="시스템 사용 유무" name="stmUseNm" id="stmUseNm" readonly="readonly" value="${param.paramStmUseNm}">
					</div>	
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>코드 설명</label>
						<textarea class="form-control osl-min-h-px--130" name="mstCdDesc" id="mstCdDesc" readonly="readonly"></textarea>
					</div>
					
				</c:when>
				<c:otherwise>
					
					<div class="form-group">
						<c:choose>
							<c:when test="${requestScope.type == 'insert'}">
								<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>공통코드</label>
								<input type="text" class="form-control" placeholder="공통코드 마스터" name="mstCd" id="mstCd" maxlength="8" regexstr="^[A-Z|0-9]{8}$" regexalert="영문 대문자, 숫자 조합 8자리" required>
							</c:when>
							<c:otherwise>
								<label><i class="fa fa-edit kt-margin-r-5"></i>공통코드</label>
								<input type="text" class="form-control" placeholder="공통코드 마스터" name="mstCd" id="mstCd" readonly="readonly" value="${param.paramMstCd}">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>상위코드</label>
						<input type="text" class="form-control" placeholder="상위코드" name="upperMstCd" id="upperMstCd" maxlength="8" regexstr="^[A-Z|0-9]{8}$" regexalert="영문 대문자, 숫자 조합 8자리">
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>코드명</label>
						<input type="text" class="form-control" placeholder="코드명" name="mstCdNm" id="mstCdNm" minlength="2" maxlength="25" required>
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i>순번</label>
						<input type="number" class="form-control" placeholder="순번" name="ord" id="ord" value="${requestScope.nextOrd}" required>
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
						<select class="form-control kt-select2" id="useCd" name="useCd">
						</select>
					</div>
					<c:if test="${requestScope.type == 'update'}">
							
						<div class="form-group">
							<label><i class="fa fa-laptop kt-margin-r-5"></i>시스템 사용 유무</label>
							<input type="text" class="form-control" placeholder="시스템 사용 유무" name="stmUseNm" id="stmUseNm" readonly="readonly" value="${param.paramStmUseNm}">
						</div>	
					</c:if>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>코드 설명</label>
						<textarea class="form-control osl-min-h-px--130" name="mstCdDesc" id="mstCdDesc" maxlength="100"></textarea>
					</div>
					
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm4001SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close"
	>Close</span></button>
</div>

<script>
"use strict";
var OSLStm4001Popup = function () {
	var formId = 'frStm4001';

	var type = $("#type").val();
	var stmUseYn = $("#stmUseYn").val();
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var pageTypeData = {
			"insert":{
				"saveString": "신규 공통코드 마스터를 등록하시겠습니까?",
				"saveBtnString": "작성 완료"
			},
			"update":{
				"saveString": "공통코드 마스터정보를 수정하시겠습니까?",
				"saveBtnString": "수정 완료"
			}
	};
	
    
    var documentSetting = function () {
    	
    	
    	$("#stm4001SaveSubmit").text(pageTypeData[type]["saveBtnString"]);
    	
    	
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} 
		];

		
    	autosize($("#mstCdDesc"));
    	
    	
    	if(stmUseYn != "Y"){
	  		
			$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
    	}
    	
    	
    	if(type == "update"){
    		
    		selectMstCodeInfo();
    	}
    	
    	
    	$("#stm4001SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		
    		
    		if (!form.valid()) {
    			return;
    		}
    		
        	
        	submitSaveAction();
    	});
    	
    };

    
    
	var selectMstCodeInfo = function() {
    	
    	var paramMstCd = $("#mstCd").val();
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm4000/stm4000/selectStm4000CommonCodeMasterInfoAjax.do'/>", "async": false}
				,{"mstCd": paramMstCd});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
		    	$.osl.setDataFormElem(data.mstCodeInfoMap,"frStm4001", ["mstCd", "upperMstCd", "mstCdNm", "ord", "lvl", "mstCdEngNm", "stmUseYn", "mstCdDesc"]);
				
		    	
				var useCd = "01";
		    	var useNm = "예";
				if(data.mstCodeInfoMap.useYn == "N"){
					useCd = "02";
					useNm = "아니오"
				}
				
				
				if(data.mstCodeInfoMap.stmUseYn == "N"){
					
			    	$("#useCd").attr("data-osl-value", useCd);
				
				}else{
					$("#useNm").val(useNm);
				}
				
				
				autosize.update($("#mstCdDesc"));
				
			}	
		});
		
		
		ajaxObj.send();
	};
    
    
  	
    var submitSaveAction = function(){
    	
    	var form = $('#'+formId);
    	
		
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm(pageTypeData[type]["saveString"],null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
				
	        	var useYn = "Y";
	        	if($("#useCd").val() == "02"){
	        		useYn = "N";
	        	} 
	        	
	        	formData.push({name:'useYn', value:useYn});
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm4000/stm4000/saveStm4000CommonCodeMasterInfoAjax.do'/>", "loadingShow": false}, formData);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
					
	    			}else if(data.duplYn == "Y"){
	    				$("#mstCd").focus();
	    				$.osl.alert(data.message,{type: 'warning'});	
	    			}else{
	    				
	    				$.osl.toastr(data.message);

	    				
	    				$.osl.layerPopupClose();
	    				
	    				if(type == "insert"){
		    				
		    				$("button[data-datatable-id=stm4000MstCodeTable][data-datatable-action=select]").click();
	    				}else{
	    					
	    					$.osl.datatable.list["stm4000MstCodeTable"].targetDt.reload();	
	    				}
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
	OSLStm4001Popup.init();
});

	
</script>