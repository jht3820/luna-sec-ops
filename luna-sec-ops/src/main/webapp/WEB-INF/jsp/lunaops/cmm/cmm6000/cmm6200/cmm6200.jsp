<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6200" autocomplete="off">
	<input type="hidden" name="paramSelReqInfoList" id="paramSelReqInfoList" value='<c:out value="${param.paramSelReqInfoList}"/>'/>
	<input type="hidden" name="selReqChargerId" id="selReqChargerId"/>
	<div class="osl-wizard" id="requestAcceptWizard" data-ktwizard-state="step-first">
		<div class="osl-wizard__nav kt-margin-b-10">
			<div class="osl-wizard__nav-items osl-wizard__nav-items--clickable">
				<div class="osl-wizard__nav-item rounded-lg" data-ktwizard-type="step" data-ktwizard-state="current">
					<div class="osl-wizard-wrapper">
						<div class="wizard-number">1</div>
						<div class="wizard-label">
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.mmtTitle">요구사항 목록</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.mmtDesc">선택 요구사항 목록 확인</span></div>
						</div>
					</div>
				</div>
				<div class="osl-wizard__nav-item rounded-lg" data-ktwizard-type="step">
					<div class="osl-wizard-wrapper">
						<div class="wizard-number">2</div>
						<div class="wizard-label">
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.sprPtTitle">기본 항목 입력</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.sprPtDesc">요구사항 기본 항목 입력</span></div>
						</div>
					</div>
				</div>
				<div class="osl-wizard__nav-item rounded-lg" data-ktwizard-type="step">
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
		<div class="osl-form__actions kt-padding-l-25 kt-padding-b-10 kt-margin-b-10 rounded-lg" id="wizardStepBtnTmp">
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
		<div class="osl-wizard__content w-100" data-ktwizard-type="step-content" data-ktwizard-state="current">
			<div class="row">
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
					<div class="kt-portlet kt-portlet--mobile">
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
									<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
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
		<div class="osl-wizard__content w-100" data-ktwizard-type="step-content">
			<div class="row">
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
					<div class="kt-portlet kt-portlet--mobile">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-th-large kt-margin-r-5"></i><span>접수 정보 입력</span>
								</h5>
							</div>
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-group">
									<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
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
					<div class="kt-portlet kt-portlet--mobile" id="selReqInfoPrtlet">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-th-large kt-margin-r-5"></i><span>접수 기본 항목 입력</span>
								</h5>
							</div>
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-group">
									<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
								</div>
							</div>
						</div>
						<div class="kt-portlet__body osl-min-h-px--470">
						
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="osl-wizard__content w-100" data-ktwizard-type="step-content">
			<div class="row">
				<div class="col-xl-3 col-lg-12 col-md-12 col-sm-12">
					<div class="kt-portlet kt-portlet--mobile">
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
									<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
								</div>
							</div>
						</div>
						<div class="kt-portlet__body osl-min-h-px--470">
							<div class="osl-datatable-search" data-datatable-id="cmm6200ProcessTable"></div>
							<div class="kt_datatable" id="cmm6200ProcessTable"></div>
						</div>
					</div>
				</div>
				<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12">
					<div class="kt-portlet kt-portlet--mobile">
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
									<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
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
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";

var OSLCmm6200Popup = function () {
	var formId = 'frCmm6200';
	
	//edit 목록
	var formEditList = {};
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//데이터 테이블
	var cmm6200ReqTableData;
	var cmm6200ProcessTableData;
	
	//파라미터 프로젝트, 요구사항 Id
	var paramSelReqInfoList = [];
	
	//atchfileId
	var atchFileId;

	//파일 업로드 세팅
	var fileUploadObj;
	
	//프로세스
	var flowChart = $("#cmm6200FlowChartDiv");
	var selProcessId;
	
	//zoom
	var zoomObj;
	var currentZoom = 2;
	
    // Private functions
    var documentSetting = function () {
    	$("#usrImgId").attr("src",$.osl.user.usrImgUrlVal(""));
    	
    	//파라미터 프로젝트, 요구사항 Id
    	paramSelReqInfoList = JSON.parse($("#paramSelReqInfoList").val());
    	
    	//edit 세팅
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
    	
    	//마법사 세팅
		var wizard = new KTWizard('requestAcceptWizard', {
			startStep: 1, 
			clickableSteps: true		
		});
    	
		//스텝 변경 전 현재 단계에 데이터 저장
		wizard.on('beforeNext', function(wizardObj) {
			//form valid check
			if(!$("#"+formId).valid()){
				wizardObj.stop();
			}
		});
		
		//마법사 각 단계탭 클릭시 이벤트
		wizard.on('change', function(wizardObj) {
			//프로세스 탭인경우 reload
			if(wizardObj.currentStep == 3){
				//프로세스 데이터테이블이 생성되었는지 체크 
				if(!$.osl.isNull(cmm6200ProcessTableData)){
					cmm6200ProcessTableData.targetDt.reload();
				}else{
					cmm6200ProcessTableData = cmm6200ProcessTableDataSetting();
				}
			}
		});
		
		//flowchart 생성
		flowChart.flowchart({
				multipleLinksOnInput: false,
				multipleLinksOnOutput: false,
				canUserEditLinks: false,
				canUserMoveOperators: false,
				distanceFromArrow:1,
				linkWidth:1,
				defaultLinkColor: "#5867dd",
				defaultOperatorClass: "osl-flowchart__operator",
	            onLinkSelect: function(linkId){
	            	//링크 선택 불가
	            	return false;
	            },
		});
		
		zoomObj = panzoom(flowChart[0],{
			maxZoom: 2,
			minZoom: 0.5,
		});
		
		//줌 동작시 플로우차트 배율 변경
		zoomObj.on('zoom', function(e) {
			flowChart.flowchart('setPositionRatio', e.getTransform().scale);
		});
		
    	//기본 담당자 switch event
    	$("#selChargerDefaultSwitch").on("change",function(){
    		var checked = this.checked;
    		
    		//사용
    		if(checked){
    			$("#frCmm6200 #selReqChargerNm").val("");
            	$("#frCmm6200 #selReqChargerId").val("");
            	
    			$("#selReqChargerNm").attr("disabled","disabled");
    			$("#selReqChargerNm").addClass("rounded-lg");
    			$("#searchReqChargerBtn").addClass("kt-hide");
    			
    			//form valid 오류있는경우 제거
    			if($("#selReqChargerNm").hasClass("is-invalid")){
    				$("#"+formId).valid();
    				$("#selReqChargerNm").removeClass("is-invalid");
    			}
    		}
    		//미사용
    		else{
    			$("#selReqChargerNm").removeAttr("disabled");
    			$("#selReqChargerNm").removeClass("rounded-lg");
    			$("#searchReqChargerBtn").removeClass("kt-hide");
    		}
    	});
    	
    	//엔터키
		$("#selReqChargerNm").keydown(function(e){
			if(e.keyCode == 13){
				//해당 값으로 검색화면 띄우기
				$("#searchReqChargerBtn").click();
			}
		});
    	
    	//담당자 명 검색버튼 클릭 시
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
    	
    	//줌 컨트롤 버튼 이벤트
    	$("form#"+formId+" button[data-flow-action=zommCtrl]").click(function(){
    		var zoomAction = $(this).data("zoom");
			//동작 데이터 없는 경우 중지
			if($.osl.isNull(zoomAction)){
				return true;
			}else{
				fnFlowChartZoom(zoomAction);
			}
    	});
    	
    	//접수 반려
    	$("#cmm6200RejectSubmit").click(function(){
    		$.osl.confirm("선택 요구사항을 접수 반려 처리하시겠습니까?",{html:true}, function(result){
				if (result.value) {
					//반려 처리
					var data = {
		    				paramSelReqInfoList : JSON.stringify(paramSelReqInfoList)
		    		};
		    		var options = {
		    				idKey: "cmm6209SubmitBtn",
							modalTitle: $.osl.lang("req4101.modalTitle.userSearch"),
							closeConfirm: true,
							autoHeight:false,
							modalSize: "xl",
							callback:[{
								targetId: "cmm6209SubmitBtn",
								actionFn: function(thisObj){
									var selRejectDesc = OSLCmm6209Popup.getReqRejectDesc();
									
									//반려 처리
									fnReqRejectAction(selRejectDesc);
								}
							}]
		    		};
		    		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6209View.do',data,options);
				}
			});
    	});
    	
    	//접수 승인
    	$("#cmm6200AcceptSubmit").click(function(){
			//접수 승인 처리
			//기본 담당자 체크
    		var defaultSwitchCd = ($("#selChargerDefaultSwitch").is(":checked"))?"01":"02";
    		var selReqChargerId;
    		
    		//기본 담당자 사용 안하는 경우 검색된 담당자 입력
    		if(defaultSwitchCd == "02"){
    			selReqChargerId = $("#selReqChargerId").val();
    		}
    		
    		//접수 의견
    		var reqAcceptTxt = $("#reqAcceptTxt").val();
    		
    		//프로세스 체크 확인
    		var selProcess = cmm6200ProcessTableData.targetDt.getSelectedRecords();
    		 
    		if(selProcess.length == 0 || selProcess.length > 1){
    			$.osl.alert("1개의 프로세스를 선택해주세요.");
    			return false;
    		}
    		
    		$.osl.confirm("선택 요구사항을 접수 승인 처리하시겠습니까?",{html:true}, function(result){
				if (result.value) {
		    		//선택 프로세스 Id
		    		var selProcessId = cmm6200ProcessTableData.targetDt.getSelectedRecords().find(".kt-checkbox > input[type=checkbox]").val();
		    		
		    		//AJAX 설정
		    		var ajaxObj = new $.osl.ajaxRequestAction(
		    				{"url":"<c:url value='/req/req4000/req4100/updateReq4100ReqAcceptList.do'/>", "async":"false"}
		    				,{
		    					paramSelReqInfoList : JSON.stringify(paramSelReqInfoList),
		    					defaultSwitchCd: defaultSwitchCd,
		    					selReqChargerId: selReqChargerId,
		    					reqAcceptTxt: reqAcceptTxt,
		    					selProcessId: selProcessId
		    				});
		    		
		    		//AJAX 전송 성공 함수
		    		ajaxObj.setFnSuccess(function(data){
		    			if(data.errorYn == "Y"){
		    				$.osl.alert(data.message,{type: 'error'});

		    				//모달 창 닫기
		    				$.osl.layerPopupClose();
		    			}else{
		    				$.osl.toastr(data.message);
		    				
		    				//모달 창 닫기
		    				$.osl.layerPopupClose();
		    				
		    				//요구사항 목록 있는 경우 reload
		    				if(typeof OSLReq4100Popup != "undefined"){
		    					OSLReq4100Popup.getReqDatatable().targetDt.reload();
		    				}
		    			}
		    		});
		    		
		    		//AJAX 전송
		    		ajaxObj.send();
				}
			});
    	});
    	
    	//선택 요구사항 데이터테이블 초기화
    	cmm6200ReqTableData = cmm6200ReqTableDataSetting();
    };

	//선택 요구사항 목록
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
						//비밀번호가 있는 경우
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
					//요구사항 선택 mask
			    	$.osl.showLoadingBar(true, {target: "#selReqInfoPrtlet", message: "요구사항을 선택해주세요."});
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
					//요구사항 선택 mask 제거
			    	$.osl.showLoadingBar(false, {target: "#selReqInfoPrtlet"});
					
					//요구사항 조회
					fnSelRequestInfo(rowData.prjId, rowData.reqId);
				},
			}
		});
	};
	
	//프로세스 목록 데이터테이블 조회
	var cmm6200ProcessTableDataSetting = function(){
    	//프로세스 목록
    	return $.osl.datatable.setting("cmm6200ProcessTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1100/selectPrj1100ProcessListAjax.do",
						params:{
							paramPrjId: "",
							useCd: "01"
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
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false,
    				template: function(row){
    					return row.processId;
    				}	
    			},
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
					//작업흐름 데이터 초기화
					flowChart.flowchart("setData",{});
					
					//ajax로 작업흐름 데이터 조회하기
					fnSelectFlowList();
					
					//mask 제거
					$("#flowMaskDiv").hide();
					
					//플로우차트 div 열기
					flowChart.removeClass("kt-hidden");
					
					//zoom reset
					fnFlowChartZoom("reset");
				}
			}
		});
	};
	
	//요구사항 조회
	var fnSelRequestInfo = function(paramPrjId, paramReqId){
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req4000/req4100/selectReq4100ReqInfoAjax.do'/>", "async":"false"}
				,{prjId: paramPrjId, reqId: paramReqId});
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				//요구사항 정보 세팅
		    	$.osl.setDataFormElem(data.reqInfoMap,"frCmm6200");
				
		    	formEditList["reqDesc"].target.summernote('code', data.reqInfoMap.reqDesc);
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
	
	//작업흐름 데이터 조회
	var fnSelectFlowList = function(){
		//프로세스 정보 조회
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100FlowListAjax.do'/>"}
				,{paramPrjId: $.osl.selPrjId, paramProcessId: selProcessId});
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				//작업흐름 데이터
   				var flowList = data.flowList;
   				var flowLinkList = data.flowLinkList;
   				
   				if(!$.osl.isNull(flowList) && flowList.length > 0){
   					var flowNextIdList = {};
   					
   					//작업흐름 연결 데이터 flowNextId 세팅
   					if(!$.osl.isNull(flowLinkList) && flowLinkList.length > 0){
   						$.each(flowLinkList, function(idx, map){
   							//값 없는 경우 생성
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
   						//작업흐름 데이터
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
   								flowEndCd: map.flowEndCd,
   								flowWorkCd: map.flowWorkCd,
   								flowRevisionCd: map.flowRevisionCd,
   								flowDplCd: map.flowDplCd,
   								flowAuthCd: map.flowAuthCd
   							}
   						};
   		   				
   		   				flowChart.flowchart('createOperator', map.flowId, operatorData);
   					});
   					
   					//작업흐름 연결 데이터
   					if(!$.osl.isNull(flowLinkList) && flowLinkList.length > 0){
   						$.each(flowLinkList, function(idx, map){
   							//링크 데이터
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
		
		//AJAX 전송
		ajaxObj.send();
	};
	
	//flowchart zoom function
	var fnFlowChartZoom = function(type){
		//줌 초기화
		if(type == "reset"){
			//줌 일시정지
			zoomObj.pause();
			
			//위치, 배율 조정
			zoomObj.moveTo(0,0);
			zoomObj.zoomAbs(0,0,1);
			
			//줌 재개
			zoomObj.resume();
			return true;
		}
		//줌 가능한 수치
		var possibleZooms = [2,1.5,1,0.75,0.5];
		
		//줌인
		if(type == "in"){
			currentZoom--;
			if(currentZoom < 0){
				currentZoom = 0;
			}
		}
		//줌아웃
		else if(type == "out"){
			currentZoom++;
			if(currentZoom > (possibleZooms.length-1)){
				currentZoom = (possibleZooms.length-1);
			}
		}
		
		zoomObj.zoomAbs(0,0,possibleZooms[currentZoom]);
	};
	
	//요구사항 반려 처리
	var fnReqRejectAction = function(rejectcContents){
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req4000/req4100/updateReq4100ReqRejectList.do'/>"}
				,{paramRejectReqList : JSON.stringify(paramSelReqInfoList), paramRejectContents: rejectcContents});
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				$.osl.alert(data.message);
				
				//요구사항 목록 있는 경우 reload
				if(typeof OSLReq4100Popup != "undefined"){
					OSLReq4100Popup.getReqDatatable().targetDt.reload();
				}
			}
			//모달 창 닫기
			$.osl.layerPopupClose();
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
	
    return {
        // public functions
        init: function() {
        	documentSetting();
        },
        setUsrChargerNm: function(usrInfo){
        	var selUsrInfo = JSON.parse(usrInfo);
        	//담당자 명, Id
        	$("#frCmm6200 #selReqChargerNm").val(selUsrInfo.usrNm);
        	$("#frCmm6200 #selReqChargerId").val(selUsrInfo.usrId);
        	
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLCmm6200Popup.init();
});

	
</script>