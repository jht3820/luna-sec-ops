<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1301">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId }">
	<input type="hidden" id="lvl" name="lvl" value="${param.lvl}"//>
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<c:if test="${not empty param.upperTemplateId}">
				<div class="form-group">
					<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="prj1301.label.upperTemplateId">상위 템플릿 ID</span></label>
					<input type="text" class="form-control" placeholder="상위 템플릿 ID" name="upperTemplateId" id="upperTemplateId" value="${param.upperTemplateId}" readonly="readonly">
				</div>
				<div class="form-group">
					<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1301.label.upperTemplateNm">상위 템플릿 명</span></label>
					<input type="text" class="form-control" placeholder="상위 템플릿 명" name="upperTemplateNm" id="upperTemplateNm" value="${param.upperTemplateNm}" readonly="readonly">
				</div>
			</c:if>
			<c:if test="${param.type eq 'update'}">
				<div class="form-group">
					<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="prj1301.label.templateId">템플릿 ID</span></label>
					<input type="text" class="form-control" placeholder="템플릿 ID" name="templateId" id="templateId" value="${param.templateId}" readonly="readonly">
				</div>
			</c:if>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1301.label.templateNm">템플릿 명</span></label>
				<input type="text" class="form-control" placeholder="템플릿 명" name="templateNm" id="templateNm" minlength="2" maxlength="100" required>
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj1301.label.templateDesc">비고</span></label>
				<textarea class="form-control osl-min-h-px--130" name="templateDesc" id="templateDesc" maxlength="2000"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1301SaveSubmit"> 
		<i class="fa fa-save"></i><span data-lang-cd="prj1301.button.insert">작성 완료</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span>Close</span>
	</button>
	
</div>

<script>
"use strict";
var OSLPrj1301Popup = function () {
	
	var formId = 'frPrj1301';
	var type = $("#type").val();
	
	//산출물 아이디
	var templateId = $("#templateId").val();
	
	//프로젝트 아이디
	var paramPrjId = $("#paramPrjId").val();
	
	// 버튼 문구 세팅
	$("#prj1301SaveSubmit > span").text($.osl.lang("prj1301.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
    // Private functions
    var documentSetting = function () {
    	
    	// textarea 자동 사이즈 조절 설정
    	autosize($("#templateEtc"));
    	
    	//수정인경우
    	if(type == "update"){
    		// 조직 단건 조회
    		selectTemplateInfo();
    	}
    	
    	
    	// 등록 버튼 클릭
    	$("#prj1301SaveSubmit").click(function(){
    		
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
				{"url":"<c:url value='/prj/prj1000/prj1300/selectPrj1300TemplateInfoAjax.do'/>", "async": false}
				,{"templateId": templateId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				// 조직 정보 세팅
		    	$.osl.setDataFormElem(data.templateInfoMap,"frPrj1301", ["upperTemplateId", "upperTemplateNm", "templateId", "templateNm", "templateDesc"]);
				
				
		    	// 상위 산출물 Id 없을경우
				if($.osl.isNull(data.templateInfoMap.upperTemplateId)){
					$("#upperTemplateId").val("-");
				}
		    	
				// 상위 산출물 명  없을경우
				if($.osl.isNull(data.templateInfoMap.upperTemplateNm)){
					$("#upperTemplateNm").val("-");
				}
		    	
		    	// textarea 입력된 내용에 따라 size 조정
				autosize.update($("#templateDesc"));
		    	
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
		
		$.osl.confirm($.osl.lang("prj1301.message.confirm.insert"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1300/savePrj1301TemplateInfo.do'/>", "loadingShow": false}, formData);

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
	    				
	    				//트리 재조회
	    				$("button[data-tree-id=prj1300TemplateTree][data-tree-action=select]").click();
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
	OSLPrj1301Popup.init();
});

	
</script>