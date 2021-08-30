<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm25000">
	<input type="hidden" name="paramDeptNm" id="paramDeptNm" value="${param.deptName}">
	<input type="hidden" name="paramDocId" id="paramDocId" value="${param.docId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.prjId}">
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="cmm25000DeptTreeInfo">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>결재선 정보<br>
						</h5>
					</div>
				</div>
				<div class="kt-margin-t-5 osl-align-center--imp" id="infomation">
							결재 대기중인 파일이 존재할 경우 결재선을 수정할 수 없습니다.</div>
				<div class="kt-portlet__body kt-padding-r-15">
					<div class="kt-scroll kt-padding-r-10" data-height="525" id="signCardTable"></div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span>Close</span></button>
</div>
<script>
"use strict";
var OSLCmm25100Popup = function () {
		
	//카드에 들어갈 순서
    var ord=0;
    //우측 결재선에 들어간 card의 사용자 아이디 값을 담아둘 배열
    var selectUsrArray=[];
    //카드
    var usrStr = '';
	//이미 배정된 카드 체크
	var usrIdDupleList = 0;
	
	//프로젝트 아이디
	var prjId = $('#paramPrjId').val();
	
	//산출물 아이디
	var docId = $('#paramDocId').val();
	
    // Private functions
    var documentSetting = function () {
	    
    	selectSignUsrInfList();
    	
	    $('#infomation').text($.osl.lang("cmm25100.infomation.cannotUpdate"));
    	
	   	//퍼펙트 스크롤 적용
	   	KTUtil.scrollInit($("#signCardTable")[0], {
	           disableForMobile: true, 
	           resetHeightOnDestroy: true, 
	           handleWindowResize: true, 
	           height: 525
	       });
	   	
		
	
	};
   
    //결재선 정보 가져오기
	var selectSignUsrInfList = function(){
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
			{"url":"<c:url value='/prj/prj3000/prj3000/selectPrj3003SignUsrListAjax.do'/>"}
			, {prjId : prjId, docId:docId});

		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				//가져온 정보로 유저카드 만들기
				$.each(data.signUsrInfList,function(idx,map){
					
		    		//사용자 카드 생성			
					userSetting(map);
			    		
				});
				
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	}
  	
    
  	//결재선 이동 시 사용자카드 세팅
   	function userSetting(userInfo){
		usrStr += 
			'<div class="kt-widget kt-margin-b-10 kt-widget--general-2 rounded osl-sign-card osl-widget-draggable" data-usr-id="'+userInfo.usrId+'" data-usr-name="'+$.osl.escapeHtml(userInfo.usrNm)+'">'
				+'<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">'
				+'<div class="kt-margin-r-20 font-weight-bolder">'
					+'<span class="cardNumber">No.</span><span class="dplStartOrdCell" ord='+ord+'>'+ord+'</span>'
				+'</div>'
				+'<div class="kt-widget__label kt-margin-r-10 osl-user__active--block">'
						+'<i class="fa fa-arrow-alt-circle-left"></i>'
					+'</div>'
					+'<div class="kt-media kt-media--circle kt-media--md">'
						+'<img src="'+$.osl.user.usrImgUrlVal(userInfo.usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
					+'</div>'
					+'<div class="kt-widget__wrapper">'
						+'<div class="kt-widget__label">'
							+'<div class="kt-widget__title">'
								+$.osl.escapeHtml(userInfo.usrNm)
								+'<small>'+$.osl.escapeHtml(userInfo.email)+'</small>'
							+'</div>'
							
							+'<span class="kt-widget__desc">'
								+'<span>'+$.osl.escapeHtml(userInfo.usrDutyNm)+'</span>, <span>'+$.osl.escapeHtml(userInfo.usrPositionNm)+'</span>'
							+'</span>'
						+'</div>'
					+'</div>'
				+'</div>'
			+'</div>';	

		//사용자 카드 넣기
		$("#signCardTable").append(usrStr);
		//우측 카드에 들어가는 사용자들 id값을 배열에 담는다
		selectUsrArray.push(userInfo.usrId);
		//사용자 카드 세팅 초기화
		usrStr='';	
		//카드 넘버
		ord++;
		
		//최종 결재자 번호 수정
		updateLastUsrCard();
   	}
  	
  	//마지막 사용자 카드는 최종이라고 노출되게
    var updateLastUsrCard = function(){
    	var usrCardList = $("#signCardTable .dplStartOrdCell").parent();
    	var usrCardCnt = usrCardList.length;
    	$.each(usrCardList,function(idx,map){
			if((idx+1) == usrCardCnt){
				$(this).children(".cardNumber").text("");
				$(this).children(".dplStartOrdCell").text("최종");
			}else{
				$(this).children(".cardNumber").text("No.");
				$(this).children(".dplStartOrdCell").text(idx);
			}
    		
    	});
    }
  	
    return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLCmm25100Popup.init();
});

	

</script>