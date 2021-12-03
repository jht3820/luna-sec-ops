<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form class="kt-form" id="frDpl1005">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.prjId}">
	<input type="hidden" name="paramDplId" id="paramDplId" value="${param.dplId}">
	<input type="hidden" name="paramJenId" id="paramJenId" value="${param.jenId}">
	<input type="hidden" name="paramJobId" id="paramJobId" value="${param.jobId}">
	<input type="hidden" name="paramBldSeq" id="paramBldSeq" value="${param.bldseq}">

	
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
		<div class="kt-portlet__body">
			<div class="osl-contents-frame osl-min-h-px--580" id="contentsFrame">
				<pre>
					<code class="osl-font osl-code-bg kt-font-light" id="buildConsoleLog"></code>
				</pre>
			</div>
			
		</div>
	</div>
	
</form>


<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>



<script>
"use strict";
var OSLDpl1005Popup = function () {
	
	var documentSetting = function(){

    	// 빌드 이력의 콘솔 로그 조회
		fnSelectBldConsoleLog();
	};
	
	/**
	 * function 명 	: fnSelectBldConsoleLog
	 * function 설명	:  선택한 빌드 이력의 콘솔 로그 조회
	 */ 
	var fnSelectBldConsoleLog = function(){
		
		// 넘어온 값 추출
		var paramPrjId = $("#paramPrjId").val();
		var paramDplId = $("#paramDplId").val();
		var paramJenId = $("#paramJenId").val();
		var paramJobId = $("#paramJobId").val();
		var paramBldSeq = $("#paramBldSeq").val();

		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dpl/dpl1000/dpl1000/selectDpl1400DplSelBuildConsoleLogAjax.do'/>","loadingShow":false}
				,{prjId: paramPrjId, dplId: paramDplId, jenId: paramJenId, jobId: paramJobId, bldSeq: paramBldSeq });
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			// 콘솔 로그 조회 실패
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				
				var buildInfo = data.dpl1400InfoMap;
				
				// 콘솔 로그가 없을 경우
				if($.osl.isNull(buildInfo) || $.osl.isNull(buildInfo.bldConsoleLog)){
					$("#buildConsoleLog").html("<span class='kt-font-inverse-brand  kt-padding-l-10 osl-font-lg osl-font'>콘솔 로그가 없습니다.</span>");
					return false;
				}
				
				//콘솔로그 출력
				$("#buildConsoleLog").html(buildInfo.bldConsoleLog);
				$('#buildConsoleLog').each(function(i, block) {hljs.highlightBlock(block);});
				
				// 스크롤 최하단
				$("#buildConsoleLog").scrollTop(99999);
			}
		});
		
		//AJAX 전송
		ajaxObj.send();	
	};

		
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLDpl1005Popup.init();
});
</script>

