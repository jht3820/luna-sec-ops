<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6601">
	<input type="hidden" name="paramTargetId" id="paramTargetId" value="${param.targetId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.prjId}">
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="cmm6601DeptTreeInfo">
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
var OSLCmm6601Popup = function () {
	
    
    var usrStr = '';
	
	var usrIdDupleList = 0;
	
	
	var prjId = $('#paramPrjId').val();
	
	
	var targetId = $('#paramTargetId').val();
	
    
    var documentSetting = function () {
	    
    	selectSignUsrInfList();
    	
	    $('#infomation').text($.osl.lang("cmm6601.infomation.cannotUpdate"));
    	
	   	
	   	KTUtil.scrollInit($("#signCardTable")[0], {
	           disableForMobile: true, 
	           resetHeightOnDestroy: true, 
	           handleWindowResize: true, 
	           height: 525
	       });
	   	
		
	
	};
   
	
	
	var selectSignUsrInfList = function(){
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/cmm/cmm6000/cmm6600/selectCmm6600SignUsrListAjax.do'/>"}
			, {"prjId" : prjId, "targetId" : targetId});

		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				
				$.each(data.signUsrInfList,function(idx,map){
					
		    		
					userSetting(map);
			    		
				});
			}
		});
		
		
		ajaxObj.send();
	}
	
    
  	
   	var userSetting = function(userInfo){
		usrStr += 
			'<div class="kt-widget kt-margin-b-10 kt-widget--general-2 rounded osl-sign-card osl-widget-draggable" data-usr-id="'+userInfo.usrId+'" data-usr-name="'+$.osl.escapeHtml(userInfo.usrNm)+'">'
				+'<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">'
				+'<div class="kt-margin-r-20 font-weight-bolder">'
					+'<span class="cardNumber">No.</span><span class="signStartOrdCell" data-ord="0"></span>'
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

		
		$("#signCardTable").append(usrStr);
		
		usrStr='';	
		
		
		updateLastUsrCard();
   	}
  	
  
    var updateLastUsrCard = function(){
    	var usrCardList = $("#signCardTable .signStartOrdCell").parent();
    	var usrCardCnt = usrCardList.length;
    	$.each(usrCardList,function(idx,map){
			
    		
    		if((idx+1) == usrCardCnt){
				$(this).children(".cardNumber").text("");
				var ordCell = $(this).children(".signStartOrdCell"); 
				ordCell.text("최종");
				ordCell.data('ord', idx);
			}
    		
			else if(idx == 0){
				$(this).children(".cardNumber").text("");
				var ordCell = $(this).children(".signStartOrdCell"); 
				ordCell.text("기안");
				ordCell.data('ord', idx);
			
			}
			else{
				$(this).children(".cardNumber").text("No.");
				var ordCell = $(this).children(".signStartOrdCell"); 
				ordCell.text(idx);
				ordCell.data('ord', idx);
			}
    		
    	});
    }
  	
    return {
        
        init: function() {
        	documentSetting();
        }
    };
}();


$.osl.ready(function(){
	OSLCmm6601Popup.init();
});

	

</script>