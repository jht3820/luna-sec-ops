<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="kt-padding-20 osl-user-info__modal kt-bg-light">
	<form class="kt-form" id="frCmm6400">
		<input type="hidden" name="usrId" id="usrId" value="${param.paramUsrId}">
		<div class="row">
			
			<div class="col-3 osl-user-info__modal_dislay--none">
				<div class="kt-profile__main-pic kt-media osl-media">
					<img id="usrImage" src="" />
		    	</div>
		    </div>
			
		    
		    <div class="col-9 osl-user-info__modal_dislay--full">
		    	
			    <div class="row kt-margin-b-20">
					<div class="col-lg-8 col-md-7 col-sm-6 col-6 kt-font-boldest osl-user-name" id="usrNm"></div>
					<div class="col-lg-4 col-md-5 col-sm-6 col-6">
						<button type="button" class="btn btn-brand osl-user__message-btn--right" data-dismiss="" id="sendMessageBtn"><i class="fas fa-envelope-open-text kt-margin-r-5"></i>메세지 전송</button>
					</div>
			    </div>
			    
			    <div class="row">
					<div class="col-6">
						
					    <div class="d-flex align-items-center flex-wrap kt-margin-b-10 osl-flex-info-column">
					    	<span class="kt-font-boldest kt-margin-r-10">
					    		<i class="fas fa-envelope kt-margin-r-5"></i>이메일
					    	</span>
				    		<span id="email"></span>
				    	</div>
			    								
			    		
			    		<div class="d-flex align-items-center flex-wrap osl-flex-info-column">
					    	<span class="kt-font-boldest kt-margin-r-10">
					    		<i class="fas fa-phone-alt kt-margin-r-5"></i>연락처
					    	</span>
					    	<span id="telno"></span>
				    	</div>
			    		
			    	</div>
				    <div class="col-6">
						
						<div class="d-flex align-items-center flex-wrap kt-margin-b-10 osl-flex-info-column">
					    	<span class="kt-font-boldest kt-margin-r-10">
					    		<i class="fa fa-id-badge kt-margin-r-5"></i>직책
					    	</span>
				    		<span id="usrDutyNm"></span>
				    	</div>
			    		
						
			    		<div class="d-flex align-items-center flex-wrap osl-flex-info-column">
					    	<span class="kt-font-boldest kt-margin-r-10">
					    		<i class="fa fa-id-badge kt-margin-r-5"></i>직급
					    	</span>
					    	<span id="usrPositionNm"></span>
				    	</div>
			    		
					</div>
				</div>
				
				
				<div class="d-flex align-items-center flex-wrap kt-margin-t-10 osl-flex-info-column">
			    	<span class="kt-font-boldest kt-margin-r-10">
			    		<i class="far fa-address-card font-weight-bold kt-margin-r-5"></i>부서&nbsp;&nbsp;&nbsp;&nbsp;
			    	</span>
			    	<span id="deptName"></span>
		    	</div>
	    		
		    </div>	
			
	 	</div>
	</form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">닫기</button>
</div>
<script>
"use strict";


var OSLCmm6400Popup = function () {
    
    var documentSetting = function () {
    	selectUsrInfo();
    	
    	$("#sendMessageBtn").click(function(){
    		
    		sendMessage();
    	});
    };
    
    
	var selectUsrInfo = function() {
    	
    	var paramUsrId = $("#usrId").val();
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/usr/usr1000/usr1000/selectUsr1000UsrInfoAjax.do'/>"}
				,{"usrId": paramUsrId});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
		    	$.osl.setDataFormElem(data.usrInfoMap,"frCmm6400", ["usrId", "usrNm", "email", "telno", "deptId", "deptName", "usrPositionNm", "usrDutyNm"]);
				
				var usrImgId = data.usrInfoMap.usrImgId;
				
				
				var usrImgUrl = $.osl.user.usrImgUrlVal(usrImgId);
				$("#usrImage").attr("src", usrImgUrl);
			}
		});
		
		
		ajaxObj.send();
	};
	
    
	var sendMessage = function() {
    	var paramUsrId = $("#usrId").val();

    	var data = {
    		type: "reInsert",
    		reSendUsrId : paramUsrId,
    		notModal: true
    	};
    	
    	var options = {
    			idKey : "reInsert",
    			modalTitle: $.osl.lang("arm1000.actionBtn.reInsertTitle"),
    			closeConfirm: false,
				autoHeight:false,
    	};
    	console.log(options);
    	$.osl.layerPopupOpen('/arm/arm1000/arm1000/insertArm1001View.do',data,options);
	};
	
	
    return {
        
        init: function() {
        	documentSetting();
        }
    };
}();


$.osl.ready(function(){
	OSLCmm6400Popup.init();
});

	
</script>