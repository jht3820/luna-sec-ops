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
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj1302.label.itemRowNum">열 넓이</span></label>
						<select class="form-control kt-select2" id="itemRowNum" name="itemRowNum" opttype="-1" required>
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
						<select class="form-control kt-select2" id="itemCommonCode" name="itemCommonCode" opttype="-1" required disabled>
							<option>test</option>
							<option>test</option>
							<option>test</option>
							<option>test</option>
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
	
	//산출물 아이디
	var templateId = $("#templateId").val();
	
	//프로젝트 아이디
	var paramPrjId = $("#paramPrjId").val();
	
	//기본항목 아이디
	var itemId = $("#itemId").val();
	
	// 버튼 문구 세팅
	$("#prj1302SaveSubmit > span").text($.osl.lang("prj1302.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
    // Private functions
    var documentSetting = function () {
    	
    	//수정인경우
    	if(type == "update"){
    		// 조직 단건 조회
    		selectTemplateInfo();
    	}else{
    		var commonCodeArr = [
	 			{mstCd: "FLW00001", useYn: "Y",targetObj: "#itemCode", comboType:"OS"}, // 항목분류
	 			{mstCd: "FLW00002", useYn: "Y",targetObj: "#itemRowNum", comboType:"OS"}, // 열넓이
	 			{mstCd: "FLW00003", useYn: "Y",targetObj: "#itemType", comboType:"OS"}, // 항목타입
	 			//{mstCd: "PRJ00017", useYn: "Y",targetObj: "#itemCommonCode", comboType:"OS"}, // 공통코드
	 			{mstCd: "CMM00001", useYn: "Y",targetObj: "#itemEssentialCd", comboType:"OS"} // 필수유무
			];
   	
			//공통코드 채우기
			$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
    	}
    	
    	//항목 분류에 따른 disabled 처리
    	$("#itemCode").change(function(){
    		var selCode = $(this).val();
    		if(selCode=='01'){
    			//공통코드
    			$("#itemCommonCode").prop("disabled",true);
    			$("#itemType").prop("disabled",false);
    			$("#itemRowNum").prop("disabled",false);
    		}else if(selCode=='02'){
    			//기본항목 타입, 길이제한
    			$("#itemCommonCode").prop("disabled",false);
    			$("#itemType").prop("disabled",true);
    			$("#itemRowNum").prop("disabled",true);
    		}else{
    			//공통코드, 기본항목 타입, 길이제한
    			$("#itemCommonCode").prop("disabled",true);
    			$("#itemType").prop("disabled",true);
    			$("#itemRowNum").prop("disabled",true);
    		}
    	});
    	
    	// 등록 버튼 클릭
    	$("#prj1302SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		
   			submitSaveAction();
    	});
    };

  	
    /**
	 * function 명 	: selectTemplateInfo
	 * function 설명	: 선택한 템플릿의 상세정보를 조회하여 화면에 세팅한다.
	 * @param templateId : 선택한 템플릿 ID
	 */
	var selectTemplateInfo = function() {
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1300/selectPrj1302ItemInfoAjax.do'/>", "async": false}
				,{"templateId": templateId, "itemId": itemId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				// 조직 정보 세팅
		    	$.osl.setDataFormElem(data.templateInfoMap,"frPrj1302", ["itemNm", "itemCode", "itemType", "itemRowNum", "itemOrd", "itemCommonCode", "itemLength", "itemEssentialCd"]);
				
		    	
				var commonCodeArr = [
		 			{mstCd: "FLW00001", useYn: "Y",targetObj: "#itemCode", comboType:"OS"}, // 항목분류
		 			{mstCd: "FLW00002", useYn: "Y",targetObj: "#itemRowNum", comboType:"OS"}, // 열넓이
		 			{mstCd: "FLW00003", useYn: "Y",targetObj: "#itemType", comboType:"OS"}, // 항목타입
		 			//{mstCd: "PRJ00017", useYn: "Y",targetObj: "#prjSetTarget", comboType:"OS"}, // 공통코드
		 			{mstCd: "CMM00001", useYn: "Y",targetObj: "#itemEssentialCd", comboType:"OS"} // 필수유무
				];
		   	
				//공통코드 채우기
				$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		    	
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
    
    
   /**
 	* function 명 	: submitInsertAction
	* function 설명	: 신규 템플릿을 등록한다.
	*/
    var submitSaveAction = function(){
    	
    	var form = $('#'+formId);
    	
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("prj1302.message.confirm.insert"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1300/savePrj1302ItemInfo.do'/>", "loadingShow": false}, formData);

	    		//AJAX 전송 성공 함수
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				//모달 창 닫기
						$.osl.layerPopupClose();
	    			}else{
	    				// 등록 성공
	    				$.osl.toastr(data.message);

	    				//모달 창 닫기
	    				$.osl.layerPopupClose();

	    				//트리 노드 정보 재조회
	    				//$("button[data-tree-id=prj1300TemplateTree][data-tree-action=selectTemplateInfo]").click();
	    				
	    				//테이블 재조회
	    				$("button[data-datatable-id=prj1301PrjTable][data-datatable-action=select]").click();
	    			}
	    		});
	    		
	    		//AJAX 전송
	    		ajaxObj.send();
	        }
	    });
    };
    
    return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

//Initialization
$.osl.ready(function(){
	OSLPrj1302Popup.init();
});

	
</script>