<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6200" autocomplete="off">
	<input type="hidden" name="paramSelReqInfoList" id="paramSelReqInfoList" value='<c:out value="${param.paramSelReqInfoList}"/>'/>
	<input type="hidden" name="selReqChargerId" id="selReqChargerId"/>
	<div class="osl-wizard" id="requestAcceptWizard" data-ktwizard-state="step-first">
		<div class="osl-wizard__nav">
			<div class="osl-wizard__nav-items">
				<div class="osl-wizard__nav-item rounded-top" data-ktwizard-type="step" data-ktwizard-state="current">
					<div class="osl-wizard-wrapper">
						<div class="wizard-number">1</div>
						<div class="wizard-label">
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.mmtTitle">요구사항 목록</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.mmtDesc">선택 요구사항 목록 확인</span></div>
						</div>
					</div>
				</div>
				<div class="osl-wizard__nav-item rounded-top" data-ktwizard-type="step">
					<div class="osl-wizard-wrapper">
						<div class="wizard-number">2</div>
						<div class="wizard-label">
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.chargerTitle">프로세스 선택</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.chargerDesc">이관 프로세스 선택</span></div>
						</div>
					</div>
				</div>
				<div class="osl-wizard__nav-item rounded-top" data-ktwizard-type="step">
					<div class="osl-wizard-wrapper">
						<div class="wizard-number">3</div>
						<div class="wizard-label">
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.sprPtTitle">기본 항목 입력</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.sprPtDesc">요구사항 기본 항목 입력</span></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="osl-form__actions kt-padding-l-25 kt-padding-b-10" id="wizardStepBtnTmp">
			<div>
				<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info" data-ktwizard-state="current">
					<div class="kt-widget__top">
						<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.mmt">* 접수 승인&반려하려는 요구사항을 관리하세요.</span></h6>
					</div>
				</div>
				<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info">
					<div class="kt-widget__top">
						<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.charger">* 접수에 필요한 항목을 입력하세요.</span></h6>
					</div>
				</div>
				<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info">
					<div class="kt-widget__top">
						<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.process">* 이관 하려는 프로세스를 선택하세요.</span></h6>
					</div>
				</div>
			</div>
			<button type="button" class="btn btn-outline-danger kt-margin-r-20" id="cmm6200RejectSubmit" name="cmm6200RejectSubmit">
				<i class="fa fa-stop-circle"></i><span data-lang-cd="req4101.complete">접수 반려</span>
			</button>
			<button type="button" class="btn btn-outline-brand" data-ktwizard-type="action-prev">
				<i class="fas fa-chevron-circle-left"></i><span data-lang-cd="spr1003.wizard.btn.prev">이전</span>
			</button>
			<button type="button" class="btn btn-outline-brand kt-margin-l-20" id="cmm6200AcceptSubmit" name="cmm6200AcceptSubmit" data-ktwizard-type="action-submit">
				<i class="fa fa-check-square"></i><span data-lang-cd="req4101.complete">접수 승인</span>
			</button>
			<button type="button" class="btn btn-outline-brand kt-margin-l-20" data-ktwizard-type="action-next">
				<span class="kt-margin-r-5" data-lang-cd="spr1003.wizard.btn.next">다음</span><i class="fas fa-chevron-circle-right kt-padding-r-0"></i>
			</button>
		</div>
		<div class="osl-wizard__content w-100 kt-bg-light kt-padding-10" data-ktwizard-type="step-content" data-ktwizard-state="current">
			<div class="osl-background-around kt-padding-10">
				<div class="row">
					<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
						<div class="kt-portlet kt-portlet--mobile" id="newReqList">
							<div class="kt-portlet__head kt-portlet__head--lg">
								<div class="kt-portlet__head-label">
									<h5 class="kt-font-boldest kt-font-brand">
										<i class="fa fa-th-large kt-margin-r-5"></i><span>접수대기 요구사항 목록</span>
									</h5>
								</div>
								<div class="kt-portlet__head-toolbar">
									<div class="kt-portlet__head-wrapper">
										<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6200ReqTable" data-datatable-action="select" title="요구사항 조회" data-title-lang-cd="req4100.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
											<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
										</button>
									</div>
									<div class="kt-portlet__head-group">
										<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air osl-dash--all-folding" id="allPortletClose" title="전체 위젯 접기" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
											<i class="fa fa-chevron-down"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="kt-portlet__body osl-min-h-px--470">
								<div class="osl-datatable-search" data-datatable-id="cmm6200ReqTable"></div>
								<div class="kt_datatable" id="cmm6200ReqTable"></div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
						<div class="kt-portlet kt-portlet--mobile" id="selReqInfoPrtlet">
							<div class="kt-portlet__head kt-portlet__head--lg">
								<div class="kt-portlet__head-label">
									<h5 class="kt-font-boldest kt-font-brand">
										<i class="fa fa-th-large kt-margin-r-5"></i><span>선택 요구사항 정보</span>
									</h5>
								</div>
								<div class="kt-portlet__head-toolbar">
									<div class="kt-portlet__head-group">
										<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
									</div>
								</div>
							</div>
							<div class="kt-portlet__body position-relative kt-padding-0" id="selReqInfoPortletBody">
								<div class="osl-div-cover w-100 h-100">요구사항을 선택해주세요.</div>
								<div class="kt-padding-20">
									<div class="row">
										<div class="col-xl-2 kt-align-center">
											<a href="#" class="kt-media kt-media--xl kt-media--circle">
												<img type="img" id="usrImgId">
											</a>
										</div>
										<div class="col-xl-4 col-lg-6">
											<div class="form-group">
												<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.usrNm">요청자 이름</span></label>
												<input type="text" class="form-control" placeholder="요청자 이름" name="reqUsrNm" id="reqUsrNm" readonly="readonly">
											</div>
										</div>
										<div class="col-xl-6 col-lg-6">
											<div class="form-group">
												<label><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.email">요청자 e-mail</span></label>
												<input type="text" class="form-control" placeholder="요청자 e-mail" name="reqUsrEmail" id="reqUsrEmail" readonly="readonly">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-6 col-lg-6">
											<div class="form-group">
												<label><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.deptNm">요청자 소속</span></label>
												<input type="text" class="form-control" name="reqUsrDeptNm" placeholder="요청자 소속"  id="reqUsrDeptNm" readonly="readonly">
											</div>
										</div>
										<div class="col-xl-6 col-lg-6">
											<div class="form-group">
												<label><i class="fa fa-phone-square-alt kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.tel">요청자 연락처</span></label>
												<input type="text" class="form-control" placeholder="요청자 연락처" name="reqUsrNum" id="reqUsrNum" readonly="readonly">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-6">
											<div class="form-group">
												<label for="prjNm"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">프로젝트</span></label>
												<input type="text" class="form-control" placeholder="프로젝트" name="prjNm" id="prjNm" readonly="readonly">
											</div>
										</div>
										<div class="col-xl-6">
											<div class="form-group">
												<label><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDtm">요청 일자</span></label>
												<input type="date" class="form-control" placeholder="요청일" name="reqDtm" id="reqDtm" readonly="readonly">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqNm">그룹 요구사항 제목</span></label>
										<input type="text" class="form-control" placeholder="그룹 요구사항 제목" name="reqGrpNm" id="reqGrpNm" autocomplete="off"  readonly="readonly">
									</div>
									<div class="form-group">
										<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqNm">요청 제목</span></label>
										<input type="text" class="form-control" placeholder="요청 제목" name="reqNm" id="reqNm" autocomplete="off"  readonly="readonly">
									</div>
									<div class="form-group">
										<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDesc">요청 내용</span></label>
										<textarea name="reqDesc" id="reqDesc" autocomplete="off" readonly="readonly"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="osl-wizard__content w-100 kt-bg-light kt-padding-10" data-ktwizard-type="step-content">
			<div class="osl-background-around kt-padding-10">
				<div class="row">
					<div class="col-xl-3 col-lg-6 col-md-12 col-sm-12">
						<div class="kt-portlet kt-portlet--mobile" id="processList">
							<div class="kt-portlet__head kt-portlet__head--lg">
								<div class="kt-portlet__head-label">
									<h5 class="kt-font-boldest kt-font-brand">
										<i class="fa fa-th-large kt-margin-r-5"></i><span>프로세스 목록</span>
									</h5>
								</div>
								<div class="kt-portlet__head-toolbar">
									<div class="kt-portlet__head-wrapper">
										<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6200ProcessTable" data-datatable-action="select" title="프로세스 조회" data-title-lang-cd="prj1000.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
											<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
										</button>
									</div>
									<div class="kt-portlet__head-group">
										<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
									</div>
								</div>
							</div>
							<div class="kt-portlet__body osl-min-h-px--470">
								<div class="osl-datatable-search" data-datatable-id="cmm6200ProcessTable"></div>
								<div class="kt_datatable" id="cmm6200ProcessTable"></div>
							</div>
						</div>
					</div>
					<div class="col-xl-9 col-lg-6 col-md-12 col-sm-12">
						<div class="kt-portlet kt-portlet--mobile" id="processFlowList">
							<div class="kt-portlet__head kt-portlet__head--lg">
								<div class="kt-portlet__head-label">
									<h5 class="kt-font-boldest kt-font-brand">
										<i class="fa fa-th-large kt-margin-r-5"></i><span>작업흐름 목록</span>
									</h5>
								</div>
								<div class="kt-portlet__head-toolbar">
									<div class="kt-portlet__head-wrapper">
										<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-flow-action="zommCtrl" data-zoom="reset" title="프로세스 조회" data-title-lang-cd="prj1000.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
											<i class="fa fa-redo-alt"></i><span data-lang-cd="datatable.button.select">줌 리셋</span>
										</button>
										<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-flow-action="zommCtrl" data-zoom="in" title="프로세스 조회" data-title-lang-cd="prj1000.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
											<i class="fa fa-search-plus"></i><span data-lang-cd="datatable.button.select">확대</span>
										</button>
										<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-flow-action="zommCtrl" data-zoom="out" title="프로세스 조회" data-title-lang-cd="prj1000.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
											<i class="fa fa-search-minus"></i><span data-lang-cd="datatable.button.select">축소</span>
										</button>
									</div>
									<div class="kt-portlet__head-group">
										<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
									</div>
								</div>
							</div>
							<div class="kt-portlet__body osl-min-h-px--470 osl-process__flow-main">
								<div class="osl-process__flow-container">
									<div class="osl-mask" id="flowMaskDiv">
										<span>프로세스를 선택해주세요.</span>
									</div>
									<div class="osl-process__flow-chart d-inline-block kt-hidden" id="cmm6200FlowChartDiv">
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="osl-wizard__content w-100 kt-bg-light kt-padding-10" data-ktwizard-type="step-content">
			<div class="osl-background-around kt-padding-10">
				<div class="row">
					<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
						<div class="kt-portlet kt-portlet--mobile" id="ReqInfoPrtlet">
							<div class="kt-portlet__head kt-portlet__head--lg">
								<div class="kt-portlet__head-label">
									<h5 class="kt-font-boldest kt-font-brand">
										<i class="fa fa-th-large kt-margin-r-5"></i><span>접수 정보 입력</span>
									</h5>
								</div>
								<div class="kt-portlet__head-toolbar">
									<div class="kt-portlet__head-group">
										<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
									</div>
								</div>
							</div>
							<div class="kt-portlet__body osl-min-h-px--470">
								<div class="row">
									<div class="col-xl-6">
										<div class="form-group">
											<label class="required" for="prjNm"><i class="fa fa-edit kt-margin-r-5"></i><span>담당자명</span></label>
											<div class="input-group">
												<input type="text" class="form-control" placeholder="담당자명" name="selReqChargerNm" id="selReqChargerNm" opttype="-1" required>
												<button type="button" class="btn btn-brand input-group-append" id="searchReqChargerBtn" name="searchReqChargerBtn"><i class="fa fa-search"></i><span data-lang-cd="req4101.button.searchBtn">검색</span></button>
											</div>
											<span class="form-text text-muted">* 요구사항의 담당자를 선택해주세요.</span>
										</div>
									</div>
									<div class="col-xl-6">
										<div class="form-group">
											<label for="test"><i class="fa fa-user kt-margin-r-5"></i><span>기본 담당자 선택</span></label>
											<div>
												<span class="kt-switch kt-switch--outline kt-switch--icon kt-switch--brand">
													<label>
														<input type="checkbox" name="selChargerDefaultSwitch" id="selChargerDefaultSwitch">
														<span></span>
													</label>
												</span>
												<span class="form-text text-muted">* 이미 배정된 담당자가 우선 배정됩니다.</span>
												<span class="form-text text-muted">* 프로세스 기본 담당자가 배정됩니다.</span>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span>접수 의견</span></label>
									<textarea name="reqAcceptTxt" id="reqAcceptTxt" autocomplete="off" readonly="readonly" opttype="-1"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
						<div class="kt-portlet kt-portlet--mobile" id="newReqInfoPrtlet">
							<div class="kt-portlet__head kt-portlet__head--lg">
								<div class="kt-portlet__head-label">
									<h5 class="kt-font-boldest kt-font-brand">
										<i class="fa fa-th-large kt-margin-r-5"></i><span>접수 기본 항목 입력</span>
									</h5>
								</div>
								<div class="kt-portlet__head-toolbar">
									<div class="kt-portlet__head-group">
										<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" tabindex="1"><i class="fa fa-plus"></i></a>
										<div class="dropdown-menu dropdown-menu-right">
											<div class="dropdown-item" id="insertBasicItemBtn"><i class="fa fa-plus kt-font-brand"></i>신규 항목 추가</div>
											<div class="dropdown-item" id="selectBasicItemBtn"><i class="fa fa-list-alt kt-font-brand"></i>기본항목 불러오기</div>
										</div>
										<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
									</div>
								</div>
							</div>
							<div class="kt-portlet__body osl-min-h-px--470">
								<div class="row" id="basicItemList">
								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";

var OSLCmm6200Popup = function () {
	var formId = 'frCmm6200';
	
	
	var formEditList = {};
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var basicItemList = new Array();
	
	var basicItemInsertList = new Array();
	
	var basicItemDelList = new Array();
	
	
	var cmm6200ReqTableData;
	var cmm6200ProcessTableData;
	
	
	var paramSelReqInfoList = [];
	
	
	var atchFileId;

	
	var fileUploadObj;
	
	
	var flowChart = $("#cmm6200FlowChartDiv");
	var selProcessId;
	var selFlowId;
	
	
	var zoomObj;
	var currentZoom = 2;
	
	
	var reqChargerSetting = true;
	
	
    
    var documentSetting = function () {
    	$("#usrImgId").attr("src",$.osl.user.usrImgUrlVal(""));
    	
    	
    	paramSelReqInfoList = JSON.parse($("#paramSelReqInfoList").val());
    	
    	
    	formEditList["reqDesc"] = $.osl.editorSetting("reqDesc", {
    		toolbar: false,
			disableResizeEditor: false,
			disableDragAndDrop: true,
			disabledEditor: true,
			height:170
    	});
    	formEditList["reqAcceptTxt"] = $.osl.editorSetting("reqAcceptTxt", {
			disableResizeEditor: false,
			disableDragAndDrop: true,
			disabledEditor: false,
			height:60
    	});
    	
    	
    	new KTPortlet('newReqList', $.osl.lang("portlet"));
    	new KTPortlet('selReqInfoPrtlet', $.osl.lang("portlet"));
    	new KTPortlet('processList', $.osl.lang("portlet"));
    	new KTPortlet('processFlowList', $.osl.lang("portlet"));
    	new KTPortlet('ReqInfoPrtlet', $.osl.lang("portlet"));
    	new KTPortlet('newReqInfoPrtlet', $.osl.lang("portlet"));
    	
    	
		$("#selectBasicItemBtn").click(function(){
			var data = {
					callPage:"OSLCmm6200Popup"
				};
			var options = {
					idKey: "prj1304",
					modalTitle: "기본항목 리스트",
					modalSize: "xl",
					closeConfirm: false,
					autoHeight: false,
					callback: [{
						targetId: "prj1304ModalCallBackBtn",
						actionFn: function(thisObj){
							var itemList = OSLPrj1304Popup.getItemList();
							OSLCmm6200Popup.addItemList(itemList);
						}
					}]
				};
			
			$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1304View.do',data,options);
		});
		
		
		$("#insertBasicItemBtn").click(function(){
			var data = {
					type:"insert",
					callPage:"OSLCmm6200Popup"
				};
			var options = {
					idKey: "prj1305",
					modalTitle: "기본항목 추가",
					modalSize: "lg",
					closeConfirm: false,
					autoHeight: false,
					callback: [{
						targetId: "prj1305ModalCallBackBtn",
						actionFn: function(thisObj){
							var itemList = OSLPrj1305Popup.getItemList();
							OSLCmm6200Popup.addItemList(itemList);
						}
					}]
				};
			
			$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1305View.do',data,options);
		});
    	
    	
		var wizard = new KTWizard('requestAcceptWizard', {
			startStep: 1, 
			clickableSteps: false		
		});
    	
		
		wizard.on('beforeNext', function(wizardObj) {
			
			if(!$("#"+formId).valid()){
				wizardObj.stop();
			}
		});
		
		
		wizard.on('change', function(wizardObj) {
			
			if(wizardObj.currentStep == 2){
				
				if(!$.osl.isNull(cmm6200ProcessTableData)){
					cmm6200ProcessTableData.targetDt.reload();
				}else{
					cmm6200ProcessTableData = cmm6200ProcessTableDataSetting();
				}
			}else if(wizardObj.currentStep == 3){
				
	    		var selProcess = cmm6200ProcessTableData.targetDt.getSelectedRecords();
	    		 
	    		if(selProcess.length == 0 || selProcess.length > 1){
	    			$.osl.alert("1개의 프로세스를 선택해주세요.");
	    			wizardObj.goPrev();
	    		}else{
		    		
					var selProcessId = cmm6200ProcessTableData.targetDt.getSelectedRecords().find(".kt-checkbox > input[type=checkbox]").val();
		    		
		    		
		    		var ajaxObj = new $.osl.ajaxRequestAction(
		    				{"url":"<c:url value='/req/req4000/req4100/selectReq4100FlowInfoAjax.do'/>", "async":"false"}
		    				,{prjId: $.osl.selPrjId, processId: selProcessId});
		    		
		    		
		    		ajaxObj.setFnSuccess(function(data){
		    			if(data.errorYn == "Y"){
		    				$.osl.alert(data.message,{type: 'error'});
		    			}else{
		    				
		    				selFlowId = data.flowInfo.flowId
				    		
				    		basicItemListSelect(selProcessId, selFlowId);
		    			}
		    		});
		    		
		    		
		    		ajaxObj.send();
	    		}
				
			}
		});
		
		
		flowChart.flowchart({
				multipleLinksOnInput: true,
				multipleLinksOnOutput: true,
				canUserEditLinks: false,
				canUserMoveOperators: false,
				distanceFromArrow:1,
				linkWidth:1,
				defaultLinkColor: "#5867dd",
				defaultOperatorClass: "osl-flowchart__operator",
	            onLinkSelect: function(linkId){
	            	
	            	return false;
	            },
		});
		
		zoomObj = panzoom(flowChart[0],{
			maxZoom: 2,
			minZoom: 0.5,
			beforeWheel: function(e) {
		    	return true;
			}
		});
		
		
		zoomObj.on('zoom', function(e) {
			flowChart.flowchart('setPositionRatio', e.getTransform().scale);
		});
		
    	
    	$("#selChargerDefaultSwitch").on("change",function(){
    		var checked = this.checked;
    		
    		
    		if(checked){
    			$("#"+formId+" #selReqChargerNm").val("");
            	$("#"+formId+" #selReqChargerId").val("");
            	
    			$("#selReqChargerNm").attr("disabled","disabled");
    			$("#selReqChargerNm").addClass("rounded-lg");
    			$("#searchReqChargerBtn").addClass("kt-hide");
    			
    			
    			if($("#selReqChargerNm").hasClass("is-invalid")){
    				$("#"+formId).valid();
    				$("#selReqChargerNm").removeClass("is-invalid");
    			}
    		}
    		
    		else{
    			$("#selReqChargerNm").removeAttr("disabled");
    			$("#selReqChargerNm").removeClass("rounded-lg");
    			$("#searchReqChargerBtn").removeClass("kt-hide");
    		}
    	});
    	
    	
		$("#selReqChargerNm").keydown(function(e){
			if(e.keyCode == 13){
				
				$("#searchReqChargerBtn").click();
			}
			$("#"+formId+" #selReqChargerId").val("");
		});
    	
    	
    	$("#searchReqChargerBtn").click(function(){
    		var data = {
    				usrNm : $("#selReqChargerNm").val()
    		};
    		var options = {
    				idKey: "searchUsr",
					modalTitle: $.osl.lang("req4101.modalTitle.userSearch"),
					closeConfirm: true,
					autoHeight:false,
					modalSize: "xl",
					callback:[{
						targetId: "selectUsr",
						actionFn: function(thisObj){
							var selUsrInfo = OSLCmm6401Popup.getUsrInfo();
							if(!$.osl.isNull(selUsrInfo)){
								OSLCmm6200Popup.setUsrChargerNm(selUsrInfo);
							}
						}
					}]
    		};
    		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6400/selectCmm6401View.do',data,options);
    	});
    	
    	
    	$("form#"+formId+" button[data-flow-action=zommCtrl]").click(function(){
    		var zoomAction = $(this).data("zoom");
			
			if($.osl.isNull(zoomAction)){
				return true;
			}else{
				fnFlowChartZoom(zoomAction);
			}
    	});
    	
    	
    	$("#cmm6200RejectSubmit").click(function(){
    		$.osl.confirm("선택 요구사항을 접수 반려 처리하시겠습니까?",{html:true}, function(result){
				if (result.value) {
					
					var data = {
		    				paramSelReqInfoList : JSON.stringify(paramSelReqInfoList)
		    		};
		    		var options = {
		    				idKey: "cmm6209SubmitBtn",
							modalTitle: "접수 반려",
							closeConfirm: true,
							autoHeight:false,
							modalSize: "xl",
							callback:[{
								targetId: "cmm6209SubmitBtn",
								actionFn: function(thisObj){
									var selRejectDesc = OSLCmm6209Popup.getReqRejectDesc();
									
									
									fnReqRejectAction(selRejectDesc);
								}
							}]
		    		};
		    		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6209View.do',data,options);
				}
			});
    	});
    	
    	
    	$("#cmm6200AcceptSubmit").click(function(){
			
			
    		var defaultSwitchCd = ($("#selChargerDefaultSwitch").is(":checked"))?"01":"02";
    		var selReqChargerId;
    		
    		
    		if(defaultSwitchCd == "02"){
    			selReqChargerId = $("#selReqChargerId").val();
    		}
    		
    		
    		var reqAcceptTxt = $("#reqAcceptTxt").val();
    		
    		
    		var selProcess = cmm6200ProcessTableData.targetDt.getSelectedRecords();
    		 
    		if(selProcess.length == 0 || selProcess.length > 1){
    			$.osl.alert("1개의 프로세스를 선택해주세요.");
    			return false;
    		}
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		
    		$.osl.confirm("선택 요구사항을 접수 승인 처리하시겠습니까?",{html:true}, function(result){

    	   		
    			$.each(basicItemList, function(idx, map){
    				if(map.itemCode == "01"){ 
    					map.itemValue = $("#"+map.itemId).val();
    				}else if(map.itemCode == "02"){ 
    					map.itemValue = $("#"+map.itemId).val();
    				}else if(map.itemCode == "03"){ 
    				}else if(map.itemCode == "04"){ 
    					map.itemValue = $("#"+map.itemId).val();
    					map.itemValueNm = $("#"+map.itemId+"Nm").val();
    				}else if(map.itemCode == "05"){ 
    				}else if(map.itemCode == "06"){ 
    					map.itemValue = $("#"+map.itemId).val();
    					map.itemValueNm = $("#"+map.itemId+"Nm").val();
    				}
    			});
    	   		
    			
    			$.each(basicItemInsertList, function(idx, map){
    				if(map.itemCode == "01"){ 
    					map.itemValue = $("#"+map.itemId).val();
    				}else if(map.itemCode == "02"){ 
    					map.itemValue = $("#"+map.itemId).val();
    				}else if(map.itemCode == "03"){ 
    				}else if(map.itemCode == "04"){ 
    					map.itemValue = $("#"+map.itemId).val();
    					map.itemValueNm = $("#"+map.itemId+"Nm").val();
    				}else if(map.itemCode == "05"){ 
    				}else if(map.itemCode == "06"){ 
    					map.itemValue = $("#"+map.itemId).val();
    					map.itemValueNm = $("#"+map.itemId+"Nm").val();
    				}
    			});

    			if(basicItemList.length>0){
    				var itemOrd = basicItemList[basicItemList.length-1].itemOrd;
    		   		
    				$.each(basicItemInsertList, function(idx, map){
    					map.itemOrd = itemOrd+idx+1;
    					basicItemInsertList[idx] = map;
    				});
    			}else{
    		   		
    				$.each(basicItemInsertList, function(idx, map){
    					map.itemOrd = idx+1;
    					basicItemInsertList[idx] = map;
    				});
    				
    			}
    	   		
				if (result.value) {
		    		
		    		var selProcessId = cmm6200ProcessTableData.targetDt.getSelectedRecords().find(".kt-checkbox > input[type=checkbox]").val();

		    		
		    		var ajaxObj = new $.osl.ajaxRequestAction(
		    				{"url":"<c:url value='/req/req4000/req4100/updateReq4100ReqAcceptList.do'/>", "async":"false"}
		    				,{
		    					paramSelReqInfoList : JSON.stringify(paramSelReqInfoList),
		    					defaultSwitchCd: defaultSwitchCd,
		    					selReqChargerId: selReqChargerId,
		    					reqAcceptTxt: reqAcceptTxt,
		    					selProcessId: selProcessId,
		    					selFlowId: selFlowId,
		    					basicItemList: JSON.stringify(basicItemList),
		    					basicItemInsertList: JSON.stringify(basicItemInsertList),
		    					basicItemDelList: JSON.stringify(basicItemDelList)
		    				});
		    		
		    		
		    		ajaxObj.setFnSuccess(function(data){
		    			if(data.errorYn == "Y"){
		    				$.osl.alert(data.message,{type: 'error'});

		    				
		    				$.osl.layerPopupClose();
		    			}else{
		    				$.osl.toastr(data.message);
		    				
		    				
		    				$.osl.layerPopupClose();
		    				
		    				
		    				if(typeof OSLReq4100Popup != "undefined"){
		    					OSLReq4100Popup.getReqDatatable().targetDt.reload();
		    				}
		    			}
		    		});
		    		
		    		
		    		ajaxObj.send();
				}
			});
    	});
    	
    	
    	cmm6200ReqTableData = cmm6200ReqTableDataSetting();
    };


	
	var basicItemListSelect = function(selProcessId, flowId){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1300/selectPrj1102AllItemListAjax.do'/>", "async":"false"}
				,{prjId: $.osl.selPrjId, processId: selProcessId, flowId: flowId});
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				basicItemList = data.itemList;
		    	$.osl.customOpt.setting(basicItemList,  "basicItemList"); 
		    	
		    	$.osl.customOpt.setting(basicItemInsertList,  "basicItemList",
		    			
		    			{
							htmlAppendType: true,
							delAt: true,
							actionFn:{
								delete:function($this){
									var targetId = $this.data("itemId");
									$this.parents(".basicItemDiv:first").remove();
									basicItemDelList.push({"itemId":targetId});
			
									var delIdx = ""
									$.each(basicItemInsertList,function(idx, map){
										if(map.itemId == targetId){
												delIdx = idx;						
										}
									});
									if(delIdx!==""){
										basicItemInsertList.splice(delIdx,1);
									}
								}
							}
						}
	    		);
		    	
			}
		});
		
		
		ajaxObj.send();
	};
	
	
    var cmm6200ReqTableDataSetting = function(){
    	return $.osl.datatable.setting("cmm6200ReqTable",{
    		data: {
				source: {
					read: {
						url: "/req/req4000/req4100/selectReq4100SelReqListAjax.do",
						params:{
							paramSelReqInfoList: JSON.stringify(paramSelReqInfoList)
						}
					}
				},
				pageSize: 10,
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [5, 10, 20, 30, 50, 100]
					}
				}
			},
			columns: [
				{field: 'prjNm', title:'프로젝트명', textAlign: 'left', width: 150, autoHide: false, search: true},
				{field: 'reqOrd', title: '요청번호', textAlign: 'left', width: 110, autoHide: false, search: true},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 340, search: true, autoHide: false,
					template: function(row){
						var resultStr = $.osl.escapeHtml(row.reqNm);
						
						if(row.reqPw == "Y"){
							resultStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
						}
						return resultStr;
					}
				},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 100, search: true, searchType:"date"},
				{field: 'reqUsrNm', title: '요청자', textAlign: 'center', width: 120, search: true,
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
				{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 120, search: true,
					template: function (row) {
						if($.osl.isNull(row.reqChargerNm)){
							row.reqChargerNm = "";
						}
						var usrData = {
							html: row.reqChargerNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
						};
						return $.osl.user.usrImgSet(row.reqChargerImgId, usrData);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.reqChargerId);
					}
				},
				{field: 'regDtm', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"date",
					template: function (row) {
						var paramDatetime = new Date(row.regDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				}
			],
			searchColumns:[
				{field: 'reqGrpNm', title: "그룹 요구사항명", searchOrd: 0},
				{field: 'reqUsrEmail', title: "요청자 이메일"},
				{field: 'reqUsrNum', title: "요청자 연락처"},
				{field: 'reqKey', title: "요구사항 키"},
			],
			callback:{
				ajaxDone: function(evt, list){
					
			    	
				}
			},
			rows:{
				minHeight: 45
			},
			actionBtn:{
				"update": false,
				"delete": false,
				"click": true
			},
			actionFn:{
				"click": function(rowData, datatableId, type, rowNum, elem){
					
			    	
					$('.osl-div-cover').addClass('kt-hide');
					
					fnSelRequestInfo(rowData.prjId, rowData.reqId);
				},
			},
			callback:{
				ajaxDone: function(evt, list){
					
					if(reqChargerSetting && !$.osl.isNull(list) && list.length == 1){
						var reqInfo = list[0];
						
						
						var reqChargerId = reqInfo.reqChargerId;
						var reqChargerNm = reqInfo.reqChargerNm;
						
						
						if(!$.osl.isNull(reqChargerId)){
							$("#selReqChargerId").val(reqChargerId);
							$("#selReqChargerNm").val(reqChargerNm);
						}
						
						
						reqChargerSetting = false;
					}
				}
			}
		});
	};
	
	
	var cmm6200ProcessTableDataSetting = function(){
    	
    	return $.osl.datatable.setting("cmm6200ProcessTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1100/selectPrj1100ProcessListAjax.do",
						params:{
							paramPrjId: "",
							useCd: "01",
							processConfirmCd: "02",
							isFlowCnt: true
						}
					}
				},
				pageSize : 5,
			},
			toolbar:{
				layout: ['pagination'],
				items:{
					pagination:{
						pages: {
							desktop: {
								layout: 'compact'
							},
							tablet: {
								layout: 'compact'
							},
						},
					 },
					 info: false
				 }
			},
			rows:{
				minHeight: 45
			},
			columns: [
				{field: 'processId', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'processNm', title: '프로세스명', textAlign: 'center', width: 100, search: true},
				{field: 'regDtm', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"date",
					template: function (row) {
						var paramDatetime = new Date(row.regDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
			],
			actionBtn:{
				"update": false,
				"delete": false,
				"click": true,
				"autoHide": true
			},
			actionFn:{
				"click": function(rowData, datatableId, type, rowNum, elem){
					
					flowChart.flowchart("setData",{});
					
					
					fnSelectFlowList(rowData.processId);
					
					
					$("#flowMaskDiv").hide();
					
					
					flowChart.removeClass("kt-hidden");
					
					
					fnFlowChartZoom("reset");
				}
			}
		});
	};
	
	
	var fnSelRequestInfo = function(paramPrjId, paramReqId){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req4000/req4100/selectReq4100ReqInfoAjax.do'/>", "async":"false"}
				,{prjId: paramPrjId, reqId: paramReqId});
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				
				$.osl.layerPopupClose();
			}else{
				
		    	$.osl.setDataFormElem(data.reqInfoMap,formId);
				
		    	formEditList["reqDesc"].target.summernote('code', data.reqInfoMap.reqDesc);
			}
		});
		
		
		ajaxObj.send();
	};
	
	
	var fnSelectFlowList = function(selProcessId){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100FlowListAjax.do'/>"}
				,{paramPrjId: $.osl.selPrjId, paramProcessId: selProcessId});
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				var flowList = data.flowList;
   				var flowLinkList = data.flowLinkList;
   				
   				if(!$.osl.isNull(flowList) && flowList.length > 0){
   					var flowNextIdList = {};
   					
   					
   					if(!$.osl.isNull(flowLinkList) && flowLinkList.length > 0){
   						$.each(flowLinkList, function(idx, map){
   							
   							if(!flowNextIdList.hasOwnProperty(map.flowId)){
   								flowNextIdList[map.flowId] = [];
   							}
   							flowNextIdList[map.flowId].push(map.flowNextId);
   						});
   					}
   				
   					$.each(flowList, function(idx, map){
   						var flowNextId = [];
   						if(flowNextIdList.hasOwnProperty(map.flowId)){
   							flowNextId = flowNextIdList[map.flowId];
   						}
   						
   		   				var operatorData = {
   							top: map.flowTop,
   							left: map.flowLeft,
   							properties: {
   								id: map.flowId,
   								flowNextId: flowNextId,
   								title: $.osl.escapeHtml(map.flowNm),
   								editable: false,
   								inputs: {input_1: {label: '이전'}},
   								outputs: {output_1: {label: '다음'}},
   								flowTitleBgColor: map.flowTitleBgColor,
   								flowTitleColor: map.flowTitleColor,
   								flowEssentialCd: map.flowEssentialCd,
   								flowSignCd: map.flowSignCd,
   								flowSignStopCd: map.flowSignStopCd,
   								flowStartCd: map.flowStartCd,
   								flowMiddleEndCd: map.flowMiddleEndCd,
   								flowWorkCd: map.flowWorkCd,
   								flowRevisionCd: map.flowRevisionCd,
   								flowDplCd: map.flowDplCd,
   								flowAuthCd: map.flowAuthCd
   							}
   						};
   		   				
   		   				flowChart.flowchart('createOperator', map.flowId, operatorData);
   					});
   					
   					
   					if(!$.osl.isNull(flowLinkList) && flowLinkList.length > 0){
   						$.each(flowLinkList, function(idx, map){
   							
   							var linkData = {
   		   							fromConnector: "output_1",
   		   							fromOperator: map.flowId,
   		   							fromSubConnector: 0,
   		   							toConnector: "input_1",
   		   							toOperator: map.flowNextId,
   		   							toSubConnector: 0
   		   						};
   							
   							flowChart.flowchart('createLink', idx, linkData);
   						});
   					}
   				}
   			}
		});
		
		
		ajaxObj.send();
	};
	
	
	var fnFlowChartZoom = function(type){
		
		if(type == "reset"){
			
			zoomObj.pause();
			
			
			zoomObj.moveTo(0,0);
			zoomObj.zoomAbs(0,0,1);
			
			
			zoomObj.resume();
			return true;
		}
		
		var possibleZooms = [2,1.5,1,0.75,0.5];
		
		
		if(type == "in"){
			currentZoom--;
			if(currentZoom < 0){
				currentZoom = 0;
			}
		}
		
		else if(type == "out"){
			currentZoom++;
			if(currentZoom > (possibleZooms.length-1)){
				currentZoom = (possibleZooms.length-1);
			}
		}
		
		zoomObj.zoomAbs(0,0,possibleZooms[currentZoom]);
	};
	
	
	var fnReqRejectAction = function(rejectcContents){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req4000/req4100/updateReq4100ReqRejectList.do'/>"}
				,{paramRejectReqList : JSON.stringify(paramSelReqInfoList), paramRejectContents: rejectcContents});
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				$.osl.alert(data.message);
				
				
				if(typeof OSLReq4100Popup != "undefined"){
					OSLReq4100Popup.getReqDatatable().targetDt.reload();
				}
			}
			
			$.osl.layerPopupClose();
		});
		
		
		ajaxObj.send();
	};
	
    return {
        
        init: function() {
        	documentSetting();
        },
        setUsrChargerNm: function(usrInfo){
        	var selUsrInfo = JSON.parse(usrInfo);
        	
        	$("#"+formId+" #selReqChargerNm").val(selUsrInfo.usrNm);
        	$("#"+formId+" #selReqChargerId").val(selUsrInfo.usrId);
        	
        },
    	addItemList: function(itemList){
	    	basicItemInsertList = basicItemInsertList.concat(itemList);
	    	
	    	
	    	$.osl.customOpt.setting(itemList,  "basicItemList",
	    			
	    			{
						htmlAppendType: true,
						delAt: true,
						actionFn:{
							delete:function($this){
								var targetId = $this.data("itemId");
								$this.parents(".basicItemDiv:first").remove();
								basicItemDelList.push({"itemId":targetId});
		
								var delIdx = ""
								$.each(basicItemInsertList,function(idx, map){
									if(map.itemId == targetId){
											delIdx = idx;						
									}
								});
								if(delIdx!==""){
									basicItemInsertList.splice(delIdx,1);
								}
							}
						}
					}
    		); 
    	}
    };
}();


$.osl.ready(function(){
	OSLCmm6200Popup.init();
});

	
</script>