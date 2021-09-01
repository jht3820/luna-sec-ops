<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj3102">
	<input type="hidden" name="dtParamPrjId" id="dtParamPrjId" value="${param.dtParamPrjId }">
	<input type="hidden" id="checkedFiles" name='checkedFiles' value="${param.checkedFiles}">
	<input type="hidden" id="ord" name="ord" value="${param.ord}">
	<input type="hidden" id="docId" name="docId" value="${param.docId}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3102.label.rjtRes">반려 사유</span></label>
				<textarea class="form-control osl-min-h-px--130" name="rjtRes" id="rjtRes" maxlength="250"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj3102SaveSubmit"> 
		<i class="fa fa-save"></i><span data-lang-cd="prj3102.button.save">작성 완료</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span>Close</span>
	</button>
	
</div>

<script>
"use strict";
var OSLPrj3102Popup = function () {
	var formId = 'frPrj3102';
	
	//프로젝트 아이디
	var prjId = $('#dtParamPrjId').val();
	
	//산출물 아이디
	var docId = $('#docId').val();
	
	//선택된 파일 sn
	var checkedFiles = $('#checkedFiles').val();
	
	//순번
	var ord = $('#ord').val()
	
	// 버튼 문구 세팅
	$("#prj3001SaveSubmit > span").text($.osl.lang("prj3001.button.save"));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
    // Private functions
    var documentSetting = function () {
    	
    	// textarea 자동 사이즈 조절 설정
    	autosize($("#rjtRes"));
    	
    	// 등록 버튼 클릭
    	$("#prj3102SaveSubmit").click(function(){
    		
    		//결재선 저장
	    	submitInsertAction();
    	});
    	
    };

  	
   /**
 	* function 명 	: submitInsertAction
	* function 설명	: 신규 조직을 등록한다.
	*/
    var submitInsertAction = function(){
		
		var form = $('#'+formId);
    	
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("prj3102.message.confirm.save"),null,function(result) {
	        if (result.value) {
	        	
	        	var formData = form.serializeArray();
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj3000/prj3100/updatePrj3001SignRjtAjax.do'/>", "loadingShow": false}, formData);

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
	    				
	    				//트리 재조회
	    				$("button[data-tree-id=prj3100DocTree][data-tree-action=selectFiles]").click();
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
	OSLPrj3102Popup.init();
});

	
</script>