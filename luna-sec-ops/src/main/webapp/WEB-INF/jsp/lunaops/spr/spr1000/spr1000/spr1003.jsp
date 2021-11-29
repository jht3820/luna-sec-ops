<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form class="kt-form" id="frSpr1003">
	<input type="hidden" name="modalId" id="modalId" value="${param.modalId}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramSprId" id="paramSprId" value="${param.paramSprId}">
	<input type="hidden" name="paramStartDt" id="paramStartDt" value="${param.paramStartDt}">
	<input type="hidden" name="paramEndDt" id="paramEndDt" value="${param.paramEndDt}">

	<div class="kt-portlet__body">
		<div class="osl-wizard" id="kt_wizard_v3" data-ktwizard-state="step-first">
			
			<div class="osl-wizard__nav">
				<div class="osl-wizard__nav-items osl-wizard__nav-items--clickable">
					
					<div class="osl-wizard__nav-item" data-ktwizard-type="step" data-ktwizard-state="current">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">1</div>
							<div class="wizard-label">
								<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.mmtTitle">회의록 작성</span></div>
								<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.mmtDesc">스프린트 회의록 작성</span></div>
							</div>
						</div>
					</div>
					
					
					<div class="osl-wizard__nav-item" data-ktwizard-type="step">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">2</div>
							<div class="wizard-label">
								<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.sprPtTitle">스토리 포인트 입력</span></div>
								<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.sprPtDesc">요구사항 스토리 포인트 입력</span></div>
							</div>
						</div>
					</div>
					
					
					<div class="osl-wizard__nav-item" data-ktwizard-type="step">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">3</div>
							<div class="wizard-label">
								<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.chargerTitle">담당자 지정</span></div>
								<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.chargerDesc">요구사항 담당자 지정</span></div>
							</div>
						</div>
					</div>
					
					
					<div class="osl-wizard__nav-item" data-ktwizard-type="step">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">4</div>
							<div class="wizard-label">
								<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.processTitle">프로세스 배정</span></div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="osl-form__actions kt-padding-l-25" id="wizardStepBtnTmp">
				<div>
					<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info" data-ktwizard-state="current">
						<div class="kt-widget__top">
							<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.mmt">* 스프린트 시작 전 회의록을 작성하세요.</span></h6>
						</div>
					</div>
					<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info">
						<div class="kt-widget__top">
							<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.sprPt">* 요구사항에 스토리 포인트를 입력하세요.</span></h6>
						</div>
					</div>
					<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info">
						<div class="kt-widget__top">
							<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.charger">* 사용자를 클릭하고 담당자 입력 상자 클릭으로 담당자를 배정하세요.</span></h6>
						</div>
					</div>
					<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info">
						<div class="kt-widget__top">
							<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.process">* 배정된 프로세스가 칸반 보드에 표시됩니다.</span></h6>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-outline-brand" data-ktwizard-type="action-prev">
					<i class="fas fa-chevron-circle-left"></i><span data-lang-cd="spr1003.wizard.btn.prev">이전</span>
				</button>
				<button type="button" class="btn btn-outline-brand kt-margin-l-20" data-ktwizard-type="action-submit">
					<span class="kt-margin-r-5" data-lang-cd="spr1003.wizard.btn.submit">완료</span><i class="fas fa-check-circle kt-padding-r-0"></i>
				</button>
				<button type="button" class="btn btn-outline-brand kt-margin-l-20" data-ktwizard-type="action-next">
					<span class="kt-margin-r-5" data-lang-cd="spr1003.wizard.btn.next">다음</span><i class="fas fa-chevron-circle-right kt-padding-r-0"></i>
				</button>
			</div>
			
			<div class="osl-wizard__content osl-min-h-px--575 w-100 kt-bg-light kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content" data-ktwizard-state="current">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group">
							<label><i class="fa fa-user-friends kt-margin-r-5"></i><span data-lang-cd="spr1003.label.mmtUsrList">참여 인원</span></label>
							<select class="form-control kt-select2 select2-hidden-accessible" id="sprConferenceUsr" name="sprConferenceUsr" multiple="multiple" data-select2-id="sprConferenceUsr" tabindex="-1" aria-hidden="true"></select>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr1003.label.mmtTitle">회의록 제목</span></label>
							<input type="text" class="form-control" name="mmtNm" id="mmtNm" value="" maxlength="99" required>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group form-group-last">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr1003.label.mmtDesc">회의록 내용</span></label>
							<textarea class="form-control" name="mmtDesc" id="mmtDesc" required></textarea>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="osl-wizard__content osl-min-h-px--575 w-100 kt-bg-light kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content">
				<div class="row kt-margin-t-20">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="col-lg-6 col-md-6 col-sm-12 kt-padding-r-0">
							<div class="osl-datatable-search" data-datatable-id="sprAssignReqTable"></div>
						</div>
						<div class="kt_datatable" id="sprAssignReqTable"></div>
					</div>
				</div>
			</div>
			
			
			<div class="osl-wizard__content w-100 osl-min-h-px--575 kt-bg-light kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content">
				<div class="row kt-margin-t-20">
					<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
						<div class="osl-datatable-search" data-datatable-id="sprAssignReqUsrTable"></div>
						<div class="kt_datatable" id="sprAssignReqUsrTable"></div>
					</div>
					<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 osl-mobile-margin-t-20">
						<div class="osl-datatable-search" data-datatable-id="sprUstListTable"></div>
						<div id="sprUstListCardTable"></div>
						<div class="kt_datatable osl-datatable-footer__divide" id="sprUstListTable"></div>
					</div>
				</div>
			</div>
			
			
			<div class="osl-wizard__content osl-min-h-px--575 w-100 kt-bg-light kt-padding-20 kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content">
				<div class="row kt-margin-t-20">
					
					<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-20 kt-padding-r-20 osl-mobile-padding-lr-10">
						<div class="osl-datatable-search" data-datatable-id="sprAssignProcessTable"></div>
						<div class="kt_datatable" id="sprAssignProcessTable"></div>
					</div>
					
					
					<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-20 kt-padding-r-20 osl-mobile-padding-lr-10 osl-mobile-margin-t-20">
						<div class="osl-datatable-search" data-datatable-id="sprNotAssignProcessTable"></div>
						<div class="kt_datatable" id="sprNotAssignProcessTable"></div>
					</div>
					
				</div>
			</div>
							
		</div>
	</div>
</form>
	
<div class="modal-footer">
	
	<button class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span>
	</button>
</div>
	



<script>
"use strict";
var OSLSpr1003Popup = function () {
	var mainFormId = 'frSpr1003';
	
	
	var datatableInitFlag = {2: false, 3:false, 4:false};
	var datatableSetting = {};
	
	
	var formEditList = [];
	
	
	var paramSprId = $("#paramSprId").val();
	
	
	var usrList = [];
	

	
	var sprProcessIdList = [];
	
	var beforeStep = 0;
	
	var wizardData = {
		
		mmtNm: "",
		
		mmtDesc: "",
		
		usrList: [],
		
		reqListCnt: 0,
		reqSprPointList: {},
		reqUsrList: {},
		sprProcessList: []
	};
	
	
	var formValidate = $.osl.validate(mainFormId);
	
	var documentSetting = function(){
		
		
    	formEditList.push($.osl.editorSetting("mmtDesc", {formValidate: formValidate, 'minHeight': 250, disableResizeEditor: false}));
		
		
		var modalId = $("#modalId").val();
		
    	$('#sprConferenceUsr').select2({
    		
    		templateResult: optionFormatState,
    		
    		templateSelection: tagFormatState,
    		
    		matcher: matchCustom
    	});
    	
    	
    	selectUsrList();
		
		
		
		var wizard = new KTWizard('kt_wizard_v3', {
			startStep: 1, 
			clickableSteps: true	
		});
		 
		
		wizard.on('beforeNext', function(wizardObj) {
			
			if($("#"+mainFormId).valid() !== true){
				wizardObj.stop();
			}else{
				
				var rtnFlag = fnWizardDataSave(wizardObj);
				
				
				if(rtnFlag === false){
					wizardObj.stop();
				}
			}
			beforeStep = wizard.currentStep;
		});
		 
		
		wizard.on('change', function(wizardObj) {
			
			var totalStep = wizard.totalSteps;
			
			var checkThis = wizard.currentStep;
			
			var checking = totalStep - checkThis;
			
			if(checkThis != 2){
				
				if($.osl.isNull($.osl.datatable.list['sprAssignReqTable'])){
					$.osl.alert("스토리포인트 배정을 완료해주세요.",{type:"error"})
					wizardObj.goTo(2);
				}
			}
			
			
			if((checkThis-beforeStep) != 1){
				
				if(checking < checkThis){
					
					var reqListCnt = wizardData["reqListCnt"];
					var reqSprPointList = wizardData["reqSprPointList"];
					var reqSprPointListCnt = 0;
					
					if(!$.osl.isNull(reqSprPointList)){
						
						$.each(reqSprPointList, function(idx, map){
							if(!$.osl.isNull(map) && map >= 0){
								reqSprPointListCnt++;
							}
						});
					}
					if(reqListCnt > reqSprPointListCnt){
						
						$.osl.alert($.osl.lang("spr1003.alert.reqSprPoint",(reqListCnt-reqSprPointListCnt)),{type: 'error'});
						wizardObj.goTo(2);
					}
				}
			}
			if(datatableInitFlag.hasOwnProperty(wizardObj.currentStep)){
				
				if(!datatableInitFlag[wizardObj.currentStep]){
					datatableInitFlag[wizardObj.currentStep] = datatableSetting[wizardObj.currentStep]();
				}else if(datatableInitFlag[wizardObj.currentStep].hasOwnProperty("targetDt")){
					datatableInitFlag[wizardObj.currentStep].targetDt.reload();
				}
			}
		});
		
		
		
		$("#frSpr1003 [data-ktwizard-type=action-submit]").click(function(){
	       	
			
	   		var fd = $.osl.formDataToJsonArray(mainFormId);
	       	
	    	
	    	var processList = $.osl.datatable.list["sprAssignProcessTable"].targetDt.originalDataSet;
	    	if(!$.osl.isNull(processList) && processList.length > 0){
	    		var processIdList = [];
	    		$.each(processList, function(idx, map){
	    			processIdList.push(map.processId);
	    		});
	    		
	    		wizardData["sprProcessList"] = processIdList;
	    	}else{
	    		$.osl.alert("프로세스는 한건이상 추가해야합니다.",{type:"error"})
	    		return; 
	    	}
	       	
	       	
	       	fd.append("wizardData",JSON.stringify(wizardData));
	       	
	   		
	   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/spr/spr1000/spr1000/updateSpr1003SprStart.do'/>", "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

	   		
	   		ajaxObj.setFnSuccess(function(data){
	   			if(data.errorYn == "Y"){
	   				$.osl.alert(data.message,{type: 'error'});
	   			}else{
	   				
	   				$.osl.toastr(data.message);

	   				
	   				$.osl.layerPopupClose();
	   				
	   				
	   				if($("button[data-datatable-id=spr1000Table][data-datatable-action=select]").length > 0){
		   				$("button[data-datatable-id=spr1000Table][data-datatable-action=select]").click();
	   				}
	   				
	   			}
	   		});
	   		
	   		
	   		ajaxObj.send();
		});
	};
	
	
	var fnWizardDataSave = function(wizardObj){
		
		if(wizardObj.currentStep == 1){
			
			
			var mmtNm = $("#mmtNm").val();
			
			
			var mmtDesc = $("#mmtDesc").val();
			
			
			var usrList = $("#sprConferenceUsr").val();
			
			
			if($.osl.isNull(mmtNm)){
				$.osl.alert("회의록 제목을 입력해주세요.",{type: 'error'});
			}
			
			if($.osl.isNull(mmtDesc)){
				$.osl.alert("회의록 내용을 입력해주세요.",{type: 'error'});
			}
			
			
			wizardData["mmtNm"] = mmtNm;
			
			
			wizardData["mmtDesc"] = mmtDesc;
			
			
			wizardData["usrList"] = usrList;
		}
		
		else if(wizardObj.currentStep == 2){
			
			var reqListCnt = wizardData["reqListCnt"];
			var reqSprPointList = wizardData["reqSprPointList"];
			var reqSprPointListCnt = 0;
			
			if(!$.osl.isNull(reqSprPointList)){
				
				$.each(reqSprPointList, function(idx, map){
					if(!$.osl.isNull(map) && map >= 0){
						reqSprPointListCnt++;
					}
				});
			}
			
			if(reqListCnt > reqSprPointListCnt){
				
				$.osl.alert($.osl.lang("spr1003.alert.reqSprPoint",(reqListCnt-reqSprPointListCnt)),{type: 'error'});
				return false;
			}
		}
		
		else if(wizardObj.currentStep == 3){
			
		}
		
		else if(wizardObj.currentStep == 4){
			var processDatasets = $.osl.datatable.list['sprAssignProcessTable'].targetDt.originalDataSet();
			if(processDatasets.length == 0){
				$.osl.alert("프로세스를 한건이상 배정해야합니다.", {type:"error"});
				return false;
			}
		}
		return true;
	};
	
	
    var optionFormatState = function(state){
    	if (!state.id) {
    	    return state.text;
   	 	}
    	var usrId = state.id;
    	var usrNm = state.element.attributes.getNamedItem("data-usr-nm").value;
    	var usrImgId = state.element.attributes.getNamedItem("data-usr-img-id").value;
    	var usrEmail = state.element.attributes.getNamedItem("data-usr-email").value;

    	var state = $(
    			'<div class="kt-user-card-v2 btn osl-word__break" data-usr-id="'+ usrId +'">' 
				+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
					+'<img src="'+$.osl.user.usrImgUrlVal(usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
				+'</div>'
				+'<div class="kt-user-card-v2__details float-left">'
					+'<span class="kt-user-card-v2__name float-left osl-word__break">'+usrNm+'</span>'
					+'<span class="kt-user-card-v2__email float-left kt-margin-l-10 osl-line-height-rem-1_5">'+usrEmail+'</span>'
				+'</div>'
			+'</div>'
   	    );
    	
    	return state;
    };
    
    
    var tagFormatState = function(state){
    	if (!state.id) {
    	    return state.id;
   	 	}
    	var usrId = state.id;
    	var usrNm = state.element.attributes.getNamedItem("data-usr-nm").value;
    	
    	var usrImgId = state.element.attributes.getNamedItem("data-usr-img-id").value;
    	var usrEmail = state.element.attributes.getNamedItem("data-usr-email").value;

    	var state = $(
    			'<div class="kt-user-card-v2 d-inline-block" data-usr-id="'+ usrId +'">'
					+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle float-left">'
						+'<img src="'+$.osl.user.usrImgUrlVal(usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
					+'</div>'
					+'<div class="kt-user-card-v2__details float-left">'
						+'<span class="kt-user-card-v2__name osl-word__break osl-word__break--w100">'+usrNm+'</span>'
						+'<span class="kt-user-card-v2__email">'+usrEmail+'</span>'
					+'</div>'
				+'</div>'
   	    );
    	
   	    return state;
    };
    
    
 	var selectUsrList = function(){
 		
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"<c:url value='/spr/spr2000/spr2000/selectSpr2001MmtUsrListAjax.do'/>", "async":"true"}, {location:"spr1003"});
 		
 		
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});

 				
 				$.osl.layerPopupClose();
 			}else{
 				
 				usrList = data.usrAllList;
 				
 				$.each(data.usrAllList, function(idx, value){
 					var str = '<option class="osl-word__break" value="' + value.usrId + '" data-usr-nm="'+value.usrNm+'" data-usr-img-id="'+value.usrImgId+'" data-usr-email="'+value.email+'">' 
 									+ value.usrNm
 								+ '</option>';
 					
 					$("#sprConferenceUsr").append(str);
 				});
 			}
 		});
 		
 		ajaxObj.send();
 	};
 	
 	
 	function matchCustom(params, data) {
 		
 	    if ($.trim(params.term) === '') {
 	      return data;
 	    }
 		
 	    
 	    if (typeof data.text === 'undefined') {
 	      return null;
 	    }
 	    
 	    
 	    var usrEmail = $(data.element).data("usr-email");

 	    
 	    if (data.id.indexOf(params.term) > -1) {
 	      return data;
 	    }
 	    
 	    else if (data.text.indexOf(params.term) > -1) {
 	      return data;
 	    }
 	    
 	    else if (usrEmail.indexOf(params.term) > -1) {
 	      return data;
 	    }

 	    
 	    return null;
 	}
 	
	var tagremove = function(){
		$('.osl-tagify__tag__removeBtn').click(function(){
			$(this).parent().remove();
		});
	}
	
	datatableSetting["2"] = function(){
		
		return $.osl.datatable.setting("sprAssignReqTable",{
			data: {
				source: {
					read: {
						url: "/spr/spr1000/spr1000/selectSpr1000SprReqListAjax.do",
						params:{
							sprId: paramSprId
						}
					}
				},
				 pageSize : 5,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100]
					 }
				 }
			},
			columns: [
				{field: 'reqOrd', title: '순번', textAlign: 'center', width: 50, search: true},
				{field: 'reqNm', title: '요청 제목', textAlign: 'center', width: 220, search: true},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 100, search: true, searchType:"date"},
				{field: 'reqUsrNm', title: '요청자', textAlign: 'center', width: 100, search: true,
					template: function (row) {
						if($.osl.isNull(row.reqUsrNm)){
							row.reqUsrNm = "";
						}
						var usrData = {
							html: row.reqUsrNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
						};
						return $.osl.user.usrImgSet(row.reqUsrImgId, usrData);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.reqUsrId);
					}
				},
				{field: 'regDtm', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"date",
					template: function (row) {
						var paramDatetime = new Date(row.regDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
				{field: 'sprPoint', title: '스토리 포인트', textAlign: 'center', width: 80, sortable: false, autoHide: false,
					template:function(row){
						var rtnVal = "";
						
						if(wizardData["reqSprPointList"].hasOwnProperty(row.reqId)){
							if(!$.osl.isNull(wizardData["reqSprPointList"][row.reqId])){
								rtnVal = wizardData["reqSprPointList"][row.reqId];
							}
						}
						
						return '<input type="text" class="form-control kt-align-center position-relative osl-planing-poker" autocomplete="off" name="sprPoint_'+row.reqId+'" id="sprPoint_'+row.reqId+'" min="0" max="999" maxlength="3" value="'+rtnVal+'"/>'
								+'<div class="position-fixed kt-portlet osl-planing-poker-portlet kt-hide">'
								+	'<div class="osl-planing-poker-portlet__body">'
								+		'<div class="card"><div class="osl-small-text--top">0</div>0<div class="osl-small-text-bottom">0</div></div>'
								+		'<div class="card"><div class="osl-small-text--top">½</div>½<div class="osl-small-text-bottom">½</div></div>'
								+		'<div class="card"><div class="osl-small-text--top">1</div>1<div class="osl-small-text-bottom">1</div></div>'
								+		'<div class="card"><div class="osl-point-text">2</div>2</div>'
								+		'<div class="card"><div class="osl-point-text">3</div>3</div>'
								+		'<div class="card"><div class="osl-point-text">5</div>5</div>'
								+		'<div class="card"><div class="osl-small-text--top">8</div>8<div class="osl-small-text-bottom">8</div></div>'
								+		'<div class="card"><div class="osl-small-text--top">13</div>13<div class="osl-small-text-bottom">13</div></div>'
								+		'<div class="card"><div class="osl-small-text--top">20</div>20<div class="osl-small-text-bottom">20</div></div>'
								+		'<div class="card"><div class="osl-point-text">40</div>40</div>'
								+		'<div class="card"><div class="osl-point-text">100</div>100</div>'
								+		'<div class="card"><div class="osl-point-text">?</div>?</div>'
								+		'<div class="card"><div class="osl-point-text"><i class="fas fa-mug-hot"></i></div><i class="fas fa-mug-hot"></i></div>'
								+	'</div>'
								+'</div>';
					}
				}
			],
			actionBtn:{
				"update": false,
				"delete": false,
				"dblClick": true,
				"title": ""
			},
			actionTooltip:{
				"update": "수정",
				"delete": "삭제",
				"dblClick": "상세보기"
			},
			actionFn:{
				"dblClick":function(rowData, datatableId, type, rowNum){
					var data = {
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
							paramReqUsrId: rowData.reqUsrId
						};
					var options = {
							idKey: rowData.reqId,
							modalTitle: $.osl.lang("req4100.title.detailTitle"),
							autoHeight: false,
					
							
						};
					
					$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4102View.do',data,options);
					
				}
			},
			rows:{
				afterTemplate: function(row, data, index){
					
					var targetInput = row.find("input#sprPoint_"+data.reqId);
					
					targetInput.off("blur").on("blur", function(e){
						var inputVal = 0;
						try{
							inputVal = parseInt(this.value);
						}catch(e){
							inputVal = 0;
						}
						if(!isNaN(inputVal)){
							wizardData["reqSprPointList"][data.reqId] = inputVal;
						}
						else if(targetInput.val() == ""){
							wizardData["reqSprPointList"][data.reqId] = null;
						}
					});
					
					if(!$.osl.isNull(wizardData["reqSprPointList"][data.reqId])){
						
						if(wizardData["reqSprPointList"].hasOwnProperty(data.reqId)){
							this.value = wizardData["reqSprPointList"][data.reqId];
						}
					}
					
					var target;
					$('.osl-planing-poker').focus(function(){
						target = $(this).next();
			    		target.removeClass('kt-hide');
			    		setTimeout(function() {
		    				$('.osl-planing-poker-portlet .card').css({
		    					transform: 'rotateY(0deg)'
		    				});
			    		},200);
			    	}).blur(function(){
			    		target.addClass('kt-hide');
		    			$('.osl-planing-poker-portlet .card').css({
		    				transform: 'rotateY(180deg)'
		    			});
			    	});
			    	
					
				}
			},
			callback:{
				initComplete: function(evt, list, datatableInfo){
					
					wizardData["reqListCnt"] = datatableInfo.lastResponse.meta.total;
				}
			}
		});
		
		
	}
	datatableSetting["3"] = function(){
		
		var sprAssignReqUsrTable = $.osl.datatable.setting("sprAssignReqUsrTable",{
			data: {
				source: {
					read: {
						url: "/spr/spr1000/spr1000/selectSpr1000SprReqListAjax.do",
						params:{
							sprId: paramSprId
						}
					}
				},
				pageSize : 5,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100],
						
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 3
							}
						}
					 }
				 }
			 },
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false,
					template: function(row){
    					return row.reqId;
    				}
				},
				{field: 'reqOrd', title: '순번', textAlign: 'center', width: 50, search: true},
				{field: 'reqNm', title: '요청 제목', textAlign: 'center', width: 100, search: true},
				{field: 'sprPoint', title: '스토리 포인트', textAlign: 'center', width: 80,template:function(row){
					var rtnVal = "";
					
					if(wizardData["reqSprPointList"].hasOwnProperty(row.reqId)){
						rtnVal = wizardData["reqSprPointList"][row.reqId];
					}
					
					return rtnVal;
				}},
				{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 80, template:function(row){
					var rtnVal = "";
					
					
					
					if(wizardData["reqUsrList"].hasOwnProperty(row.reqId)){
						if(wizardData["reqUsrList"][row.reqId].usrNm == undefined){
							rtnVal = "";
						}else{
							rtnVal = wizardData["reqUsrList"][row.reqId].usrNm;	
						}
					
					}else if(row.reqChargerNm != null){
						wizardData["reqUsrList"][row.reqId] = {usrId: row.reqChargerId, usrNm: row.reqChargerNm}; 
						rtnVal = row.reqChargerNm;
					}
					
					return '<input type="text" class="form-control kt-align-center" name="reqCharger_'+row.reqId+'" id="reqCharger_'+row.reqId+'" data-req-id="'+row.reqId+'" value="'+rtnVal+'" readonly="readonly" />';
				}},
			],
			rows:{
				minHeight:50,
			},
			actionBtn:{
				"title":"해제",
				"update": false,
				"delete": false,
				"dblClick": false,
				"clearCharger":true,
			},
			actionFn:{
				"clearCharger":function(rowData, datatableId, type, rowNum){
					
					
					var datatable = $.osl.datatable.list['sprAssignReqUsrTable'].targetDt;
					
					var targetCheckRow = datatable.row("[data-row="+rowNum+"]").nodes();
					
					
					var target = targetCheckRow.find("input[type=text]");
					
					target.val("");
					
					
					wizardData["reqUsrList"][rowData.reqId] = "";
					
				},
			},
			theme:{
				actionBtnIcon:{
					clearCharger: "fa fa-ban",
				}
			},
		});
		
		
		
		var sprUstListTable = $.osl.datatable.setting("sprUstListTable",{
			cardUiTarget: $("#sprUstListCardTable"),
			data: {
				source: {
					read: {
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do",
						params:{
							location:"spr1003",
						}
					}
				},
				pageSize : 4
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100],
						
						pages: {
							desktop: {
								layout: 'compact'
							},
							tablet: {
								layout: 'compact'
							},
						},
					 }
				 }
			 },
			columns: [
				{field: 'useNm', title: '사용유무', textAlign: 'center', width: 70,  search: true, searchType:"select", searchCd: "CMM00001", searchField:"useCd", sortField: "useCd"},
				{field: 'usrId', title: '아이디', textAlign: 'center', width: 150, search: true},
				{field: 'usrNm', title: '사용자 명', textAlign: 'left', width: 160, search: true},
				{field: 'telno', title: '연락처', textAlign: 'left', width: 110, search: true},
				{field: 'email', title: '이메일', textAlign: 'left', width: 170, search: true},
				{field: 'usrPositionNm', title: '직급', textAlign: 'center', width: 110, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직책', textAlign: 'center', width: 120, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 390, search: true, sortable: false},
				{field: 'regDtm', title: '등록일', textAlign: 'center', width: 120, search: true, searchType:"daterange"},
				{field: 'etc', title: '비고', textAlign: 'left', width: 400, search: true}
			],
			actionBtn:{
				"update": false,
				"delete": false,
				"click": false,
			},
			callback:{
				initComplete: function(evt,config){
					$("#sprUstListTable .kt-datatable__table").css({visibility: "hidden", height: 0});
				},
				ajaxDone: function(evt, list){
					var usrStr = '';
					$.each(list, function(idx, map){
						usrStr += 
							'<div class="kt-widget kt-margin-b-10 kt-widget--general-2 rounded osl-widget-draggable" data-usr-id="'+map.usrId+'" data-usr-name="'+$.osl.escapeHtml(map.usrNm)+'">'
								+'<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">'
									+'<div class="kt-widget__label kt-margin-r-10 osl-user__active--block">'
										+'<i class="fa fa-arrow-alt-circle-left"></i>'
									+'</div>'
									+'<div class="kt-media kt-media--circle kt-media--md">'
										+'<img src="'+$.osl.user.usrImgUrlVal(map.usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
									+'</div>'
									+'<div class="kt-widget__wrapper">'
										+'<div class="kt-widget__label">'
											+'<div class="kt-widget__title osl-word__break osl-word__break--w200" title='+map.usrNm+'>'
												+$.osl.escapeHtml(map.usrNm)
											+'</div>'
											+'<small>'+$.osl.escapeHtml(map.email)+'</small>'
											+'<span class="kt-widget__desc">'
												+'<span>'+$.osl.escapeHtml(map.usrDutyNm)+'</span>, <span>'+$.osl.escapeHtml(map.usrPositionNm)+'</span>'
											+'</span>'
										+'</div>'
									+'</div>'
								+'</div>'
							+'</div>';
					});
					$("#sprUstListCardTable").html(usrStr);
					
					
					$("#sprAssignReqUsrTable").on("click","input[name^=reqCharger_]", function(){
						
						var targetElem = $(".osl-widget-draggable.active");
						if(targetElem.length > 0){
							
							var targetUsrId = targetElem.data("usr-id");
						    var targetUsrNm = targetElem.data("usr-name");
						    
						    
						    var targetReqId = $(this).data("req-id");
						    
						    
						    this.value = targetUsrNm;
						    
						    
						    wizardData["reqUsrList"][targetReqId] = {usrId: targetUsrId, usrNm: targetUsrNm};
						}
					});
					
					
					$(".osl-widget-draggable").click(function(){
						
						var unActive = false;
						if($(this).hasClass("active")){
							unActive = true;
						}
						
						$(".osl-widget-draggable.active").removeClass("active");
						if(unActive === false){
							$(this).addClass("active");
							
							var targetElem = $(".osl-widget-draggable.active");
							
							var datatable = $.osl.datatable.list['sprAssignReqUsrTable'].targetDt;
							
							var length = datatable.getDataSet().length;
							
							var rownum = 0
							for(rownum; rownum < length ; rownum ++){
								var targetCheckRow = datatable.row("[data-row="+rownum+"]").nodes();
								
								var target = targetCheckRow.find("label.kt-checkbox").children("input[type=checkbox]");
								if(target.length > 0){
									if(target.is(":checked") == true){
										var targetReqId = target.val();
										
										
										var targetUsrId = targetElem.data("usr-id");
								   		var targetUsrNm = targetElem.data("usr-name");
								   		
								   		
									    $("#reqCharger_"+targetReqId).val(targetUsrNm);
									    
									    
									    wizardData["reqUsrList"][targetReqId] = {usrId: targetUsrId, usrNm: targetUsrNm};
									    
									    target.prop("checked",false);
									}
								}
							}
						}
					});
				}
			}
		});
		
		return {
			targetDt: {
				reload: function(){
					sprAssignReqUsrTable.targetDt.reload();
					sprUstListTable.targetDt.reload();
				}
			}
		};
	}
	
	datatableSetting["4"] = function(){
		
		var assignTable = $.osl.datatable.setting("sprAssignProcessTable",{
			data: {
				type:'local',
				serverSorting: false,
				serverPaging: false,
				source: [],
				pageSize: 4
			
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100],
						
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 3
							}
						}
					 }
				 }
			 },
			columns: [
				{field: 'rn', title: 'No.', textAlign: 'center', width: 50, autoHide: false, sortable: false},
				{field: 'processId', title: 'ID', textAlign: 'center', width: 150, search: true},
				{field: 'processNm', title: '이름 ', textAlign: 'center', width: 100, search: true},
			],
			actionBtn:{
				"title": "제외",
				"width": 80,
				"update": false,
				"delete": false,
				"dblClick": true
			},
			actionTooltip:{
				"dblClick": "프로세스 배정 제외"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-right",
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var data = {
					};
					var options = {
							modalTitle: "프로세스 상세",
							autoHeight: false
						};
					
			
					var rowDatas = [];
					rowDatas.push(rowData);
					
					fnAllProcessDelete(rowDatas);
				},
				
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					
					
					
						
						
					
					
					
						
							
							
						
					
				}
			}
		});
		
		
		
		var notAssignTable = $.osl.datatable.setting("sprNotAssignProcessTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1100/selectPrj1100ProcessListAjax.do"
					}
				},
				 pageSize : 5,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100],
						
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 3
							}
						}
					 }
				 }
			 },
			columns: [
				{field: 'rn', title: 'No.', textAlign: 'center', width: 50, autoHide: false, sortable: false},
				{field: 'processId', title: 'ID', textAlign: 'center', width: 150, search: true},
				{field: 'processNm', title: '이름 ', textAlign: 'center', width: 100, search: true},
			],
			actionBtn:{
				"title": "배정",
				"update": false,
				"delete": false,
				"dblClick": true,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick": "프로세스 배정"
			},
			rows:{
				beforeTemplate: function (row, data, index){
					
					if(sprProcessIdList.indexOf(data.processId) > -1){
						row.addClass("osl-datatable__row-assign--none");
					}
				}
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-left",
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var data = {
					};
					var options = {
							modalTitle: "프로세스 상세",
							autoHeight: false
						};
					
			
					var rowDatas = [];
					rowDatas.push(rowData);
					
					fnAllProcessInsert(rowDatas);
				},
				
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					var rowDatas = rowData;
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("common.user.auth.allUsrInsert",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							
							fnAllProcessInsert(rowDatas);
						}
					});
				}
			}
		});
		
		

		
		return {
			targetDt: {
				reload: function(){
					assignTable.targetDt.reload();
					notAssignTable.targetDt.reload();
				}
			}
		};
	}
	

	
	var fnAllProcessInsert = function(selDatas){
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			
			var datatable = $.osl.datatable.list["sprAssignProcessTable"].targetDt;
			
			
			if($.osl.isNull(datatable.dataSet)){
				datatable.dataSet = [];
				datatable.originalDataSet = [];
			}
			
			
			var processIdDupleList = 0;
			
			
			$.each(selDatas, function(idx, map){
				
				if(sprProcessIdList.indexOf(map.processId) != -1){
					processIdDupleList++;
					return true;
				}
				
				datatable.dataSet.push(map);
				datatable.originalDataSet.push(map);
				
				
				sprProcessIdList.push(map.processId);
			});
			
			
			var toastrMsg = "";
			var toastrType = "success";
			if(selDatas.length > processIdDupleList){
				toastrMsg += $.osl.lang("spr1003.alert.saveProcessMsg",(selDatas.length-processIdDupleList));
			}
			
			if(processIdDupleList > 0){
				
				if(toastrMsg.length > 0){
					toastrMsg += "</br>";
				}
				toastrMsg += $.osl.lang("spr1003.alert.saveProcessDupleMsg",processIdDupleList);
				toastrType = "warning";
			}
			
			
			if(processIdDupleList == selDatas.length){
				toastrMsg = $.osl.lang("spr1003.alert.saveProcessAllDupleMsg",processIdDupleList);
				toastrType = "error";
				$.osl.toastr(toastrMsg,{type: toastrType});
				return false;
			}
			
			$.osl.toastr(toastrMsg,{type: toastrType});
			
			
			datatable.insertData();
			
			datatable.reload();
			$.osl.datatable.list["sprNotAssignProcessTable"].targetDt.reload();
			$("div.tooltip.show").remove();
		 }
	};
	
	
	var fnAllProcessDelete = function(selDatas){
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			
			var datatable = $.osl.datatable.list["sprAssignProcessTable"].targetDt;
			
			
			var dataSet = datatable.dataSet;
			var originalDataSet = datatable.originalDataSet;
			
			if(!$.osl.isNull(dataSet)){
				
				$.each(selDatas, function(idx, map){
					$.each(originalDataSet, function(dataIdx, dataMap){
						if($.osl.isNull(dataMap)){
							return true;
						}
						
						else if(map.processId == dataMap.processId){
							originalDataSet.splice(dataIdx, 1);
							
							
							sprProcessIdList.splice(sprProcessIdList.indexOf(map.processId), 1);
							return false;
						}
					});
				});
				
				
				datatable.reload();
				$.osl.datatable.list["sprNotAssignProcessTable"].targetDt.reload();
				$("div.tooltip.show").remove();
			}
		}
	};
	
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLSpr1003Popup.init();
});
</script>

