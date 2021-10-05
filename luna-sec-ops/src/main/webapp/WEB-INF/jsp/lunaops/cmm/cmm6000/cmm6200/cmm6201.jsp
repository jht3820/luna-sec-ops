<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http:
<form class="kt-form" id="frCmm6201" autocomplete="off">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}"/>
	<input type="hidden" name="paramReqId" id="paramReqId" value="${param.paramReqId}"/>
	<div class="osl-req__process-main d-flex">
		
		<div class="osl-req__process-history" id="osl-req__process-history" data-scroll-x="true">
		</div>
	</div>
	<div class="osl-wizard" id="requestProcessWizard" data-ktwizard-state="step-first">
		<div class="osl-wizard__nav">
			<div class="osl-wizard__nav-items osl-wizard__nav-items--clickable">
				<div class="osl-wizard__nav-item" data-ktwizard-type="step" data-ktwizard-state="current">
					<div class="osl-wizard-wrapper">
						<div class="wizard-number">1</div>
						<div class="wizard-label">
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.mmtTitle">요구사항 정보</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.mmtDesc">선택 요구사항 목록 확인</span></div>
						</div>
					</div>
				</div>
				<div class="osl-wizard__nav-item" data-ktwizard-type="step">
					<div class="osl-wizard-wrapper">
						<div class="wizard-number">2</div>
						<div class="wizard-label">
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.sprPtTitle">기본 항목 입력</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.sprPtDesc">요구사항 기본 항목 입력</span></div>
						</div>
					</div>
				</div>
				<div class="osl-wizard__nav-item" data-ktwizard-type="step">
					<div class="osl-wizard-wrapper">
						<div class="wizard-number">3</div>
						<div class="wizard-label">
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.chargerTitle">프로세스 선택</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.chargerDesc">이관 프로세스 선택</span></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="osl-wizard__content osl-min-h-px--575 w-100 kt-bg-light kt-padding-10" data-ktwizard-type="step-content" data-ktwizard-state="current">
			<div class="osl-mask-bg kt-padding-10">
				<div class="kt-portlet" id="req4102RequestUsrInfo">
					<div class="kt-portlet__head">
						<div class="kt-portlet__head-label">
							<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.title">요청자 정보</span>
						</div>
						<div class="kt-portlet__head-toolbar">
							<div class="kt-portlet__head-group">
								<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
							</div>
						</div>
					</div>
					<div class="kt-portlet__body">
						<div class="row">
							<div class="col-xl-2 kt-align-center">
								<a href="#" class="kt-media kt-media--xl kt-media--circle">
									<img type="img" id="usrImgId">
								</a>
							</div>
							<div class="col-xl-5">
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.usrNm">요청자 이름</span></label>
									<input type="text" class="form-control"  name="reqUsrNm" id="usrNm" readonly="readonly">
								</div>
							</div>
							<div class="col-xl-5">
								<div class="form-group">
									<label><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.email">요청자 e-mail</span></label>
									<input type="text" class="form-control" name="reqUsrEmail" id="email" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-7">
								<div class="form-group">
									<label><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.deptNm">요청자 소속</span></label>
									<input type="text" class="form-control" name="reqUsrDeptNm" id="deptName" readonly="readonly">
								</div>
							</div>
							<div class="col-xl-5">
								<div class="form-group">
									<label><i class="fa fa-phone-square-alt kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.telNo">요청자 연락처</span></label>
									<input type="text" class="form-control" name="reqUsrNum" id="telno" readonly="readonly">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="osl-wizard__content osl-min-h-px--575 w-100 kt-bg-light" data-ktwizard-type="step-content">
		
		</div>
		<div class="osl-wizard__content osl-min-h-px--575 w-100 kt-bg-light" data-ktwizard-type="step-content">
		
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLCmm6201Popup = function () {
	var formId = 'frCmm6201';
	
	
	var paramPrjId = $("#paramPrjId").val();
	var paramReqId = $("#paramReqId").val();
	
    
    var documentSetting = function () {
    	
    	KTUtil.scrollInit($("#osl-req__process-history")[0], {
			disableForMobile: true, 
			resetHeightOnDestroy: true, 
			handleWindowResize: true, 
			windowScroll:false
		});
    	$(".osl-req__process-history").on('mousewheel',function(e){
    		var wheelDelta = e.originalEvent.wheelDelta;
    		if(wheelDelta > 0){
    			$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
    		}else{
    			$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
    		}
    	});
    	
    	
		var wizard = new KTWizard('requestProcessWizard', {
			startStep: 1, 
			clickableSteps: true		
		});
    	
    	
    	fnRequestProcessData();
    };
	
	
    var fnRequestProcessData = function(){
    	
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"<c:url value='/req/req4000/req4100/selectReq4100RequestProcessData.do'/>"},
 				{paramPrjId: paramPrjId, paramReqId: paramReqId});
 		
 		
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});

 				
 				$.osl.layerPopupClose();
 			}else{
 				
 				var reqChgList = data.reqChgList;
 				var reqChgStr = '';
 				if(!$.osl.isNull(reqChgList) && reqChgList.length > 0){
 					$.each(reqChgList, function(idx, map){
 						var processNextLabel = '<div class="osl-flowchart__label"><i class="fa fa-arrow-right"></i></div>';
 						
 						
 						if((idx+1) == reqChgList.length){
 							processNextLabel = '';
 						}
 						
 						
 						var processNm, bgColor, color, flowNm, chgDtm, chgUsrId, chgUsrImgId, chgUsrNm, chgUsrEmail;
 						
 						
 						if(map.reqChgTypeCd == "03") {
 							processNm = $.osl.escapeHtml(map.chgProcessNm);
 							bgColor = map.chgFlowTitleBgColor;
 							color = map.chgFlowTitleColor;
 							flowNm = map.chgFlowNm;
 						}
 						
 						
 						var paramDatetime = new Date(map.chgDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd HH:mm:ss"});
		                chgDtm = agoTimeStr.agoString;
		                
		                
		                chgUsrId = map.chgUsrId;
		                chgUsrImgId = map.chgUsrImgId;
		                chgUsrNm = map.chgUsrNm;
		                chgUsrEmail = map.chgUsrEmail;
		                
 						reqChgStr += 
 							'<div class="osl-flowchart__operator">'
	 							+'<div class="flowchart-operator-process-title">'
	 								+'<div class="flowchart-operator-title__lebel badge badge-info d-inline-block text-truncate">'+processNm+'</div>'
	 							+'</div>'
	 							+'<div class="flowchart-operator-title" style="background-color:'+bgColor+';color:'+color+';">'
	 								+'<div class="flowchart-operator-title__lebel d-inline-block text-truncate">'+flowNm+'</div>'
	 							+'</div>'
	 							+'<div class="flowchart-operator-inputs-outputs">'
	 								+'<div class="kt-user-card-v2 btn" data-usr-id="'+ chgUsrId +'">' 
		 								+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
		 									+'<img src="'+$.osl.user.usrImgUrlVal(chgUsrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
		 								+'</div>'
		 								+'<div class="kt-user-card-v2__details float-left">'
		 									+'<span class="kt-user-card-v2__name float-left">'+chgUsrNm+'</span>'
		 									+'<span class="kt-user-card-v2__email float-left kt-margin-l-10 osl-line-height-rem-1_5">'+chgUsrEmail+'</span>'
		 								+'</div>'
		 							+'</div>'
		 							+'<div class="flowchart-operator-chg__dtm"><i class="fa fa-clock kt-margin-r-5"></i>'+chgDtm+'</div>'
	 							+'</div>'
	 							+processNextLabel
	 						+'</div>';
 					});
 				}
 				$("#osl-req__process-history").html(reqChgStr);
 				
 				
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
	OSLCmm6201Popup.init();
});

	
</script>