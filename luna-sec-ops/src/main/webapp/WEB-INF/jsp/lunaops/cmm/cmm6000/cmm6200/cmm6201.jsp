<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6201" autocomplete="off">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}"/>
	<input type="hidden" name="paramReqId" id="paramReqId" value="${param.paramReqId}"/>
	<input type="hidden" name="processId" id="processId"/>
	<input type="hidden" name="flowId" id="flowId"/>
	<input type="hidden" name="atchFileId" id="atchFileId"/>
	<input type="hidden" name="reqChargerId" id="reqChargerId"/>
	<div class="osl-req__process-title"><i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqInfo">요구사항 변경 이력</span></div>
	<div class="osl-req__process-main d-flex">
		<div class="osl-req__process-history" id="osl-req__process-history" data-scroll-x="true"></div>
		<div class="osl-req__process-next__Flow">
			<div class="osl-req__process-mask__flow">
				<div class="flowchart-operator-process-title">
					<div class="flowchart-operator-title__lebel badge badge-info d-inline-block text-truncate"><span id="nextProcessNm">프로세스명</span></div>
				</div>
				<div class="flowchart-operator-title" style="background-color:'+bgColor+';color:'+color+';">
					<div class="flowchart-operator-title__lebel d-inline-block text-truncate"><span id="nextFlowNm">다음 단계명</span></div>
				</div>
				<div class="flowchart-operator-inputs-outputs">
					<div class="kt-user-card-v2 btn" data-usr-id="'+ chgUsrId +'">
						<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">
							<img src="/media/users/default.jpg" onerror="this.src='/media/users/default.jpg'" id="nextFlowChargerImg"/>
						</div>
						<div class="kt-user-card-v2__details kt-align-left">
							<span class="kt-user-card-v2__name text-truncate" id="nextFlowChargerNm">담당자명</span>
							<span class="kt-user-card-v2__email kt-margin-l-10 osl-line-height-rem-1_5" id="nextFlowEmail"></span>
						</div>
					</div>
					<div class="flowchart-operator-chg__dtm"><i class="fa fa-info-circle kt-margin-r-5"></i><span>다음 단계 내용</span></div>
				</div>
			</div>
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
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.mmtDesc">요구사항 정보 확인</span></div>
						</div>
					</div>
				</div>
				<div class="osl-wizard__nav-item" data-ktwizard-type="step">
					<div class="osl-wizard-wrapper">
						<div class="wizard-number">2</div>
						<div class="wizard-label">
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.sprPtTitle">기본 항목 입력</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.sprPtDesc">담당자 및 요구사항 항목 입력</span></div>
						</div>
					</div>
				</div>
				<div class="osl-wizard__nav-item" data-ktwizard-type="step">
					<div class="osl-wizard-wrapper">
						<div class="wizard-number">3</div>
						<div class="wizard-label">
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.chargerTitle">단계 선택</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.chargerDesc">다음 단계 선택</span></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="osl-form__actions kt-padding-l-25 kt-padding-b-10" id="wizardStepBtnTmp">
			<div>
				<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info" data-ktwizard-state="current">
					<div class="kt-widget__top">
						<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.mmt">* 요구사항 정보를 확인하세요.</span></h6>
					</div>
				</div>
				<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info">
					<div class="kt-widget__top">
						<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.charger">* 업무 처리에 필요한 정보를 입력하세요.</span></h6>
					</div>
				</div>
				<div class="kt-widget kt-widget--general-2 kt-widget--fit kt-padding-t-10 kt-margin-r-15" data-ktwizard-type="step-info">
					<div class="kt-widget__top">
						<h6 class="kt-font-bold"><span data-lang-cd="spr1003.wizard.info.process">* 다음 단계를 선택하세요.</span></h6>
					</div>
				</div>
			</div>
			<button type="button" class="btn btn-outline-brand" data-ktwizard-type="action-prev">
				<i class="fas fa-chevron-circle-left"></i><span data-lang-cd="spr1003.wizard.btn.prev">이전</span>
			</button>
			<button type="button" class="btn btn-outline-brand kt-margin-l-20" id="cmm6201SaveSubmit" name="cmm6201SaveSubmit" data-ktwizard-type="action-submit">
				<i class="fa fa-check-square"></i><span data-lang-cd="req4101.complete">처리 완료</span>
			</button>
			<button type="button" class="btn btn-outline-brand kt-margin-l-20" data-ktwizard-type="action-next">
				<span class="kt-margin-r-5" data-lang-cd="spr1003.wizard.btn.next">다음</span><i class="fas fa-chevron-circle-right kt-padding-r-0"></i>
			</button>
		</div>
		<div class="osl-wizard__content w-100 kt-bg-light kt-padding-10" data-ktwizard-type="step-content" data-ktwizard-state="current">
			<div class="osl-background-around kt-padding-10">
				<div class="row">
					<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
					 	<div class="kt-portlet" id="cmm6201ReqInfo">
					 		<div class="kt-portlet__head">
								<div class="kt-portlet__head-label">
									<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqInfo">요구사항 정보</span>
								</div>
								<div class="kt-portlet__head-toolbar">
									<div class="kt-portlet__head-group">
										<div class="kt-portlet__head-group">
											<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
										</div>
									</div>
								</div>
							</div>
							<div class="kt-portlet__body">
								<div class="row">
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
										<div class="form-group">
											<label for="exampleSelect1"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">프로젝트 그룹명</span></label>
											<input type="text" class="form-control" name="prjGrpNm" id="prjGrpNm" readonly="readonly">
										</div>
									</div>
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
										<div class="form-group">
											<label for="exampleSelect1"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">프로젝트명</span></label>
											<input type="text" class="form-control" name="prjNm" id="prjNm" readonly="readonly">
										</div>
									</div>
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
										<div class="form-group">
											<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDtm">요구사항 ID</span></label>
											<input type="text" class="form-control" name="reqId" id="reqId" readonly="readonly">
										</div>
									</div>
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
										<div class="form-group">
											<label><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDtm">요청 일자</span></label>
											<input type="date" class="form-control" name="reqDtm" id="reqDtm" readonly="readonly">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
										<div class="form-group">
											<label for="processNm"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">프로세스명</span></label>
											<input type="text" class="form-control" name="processNm" id="processNm" readonly="readonly">
										</div>
									</div>
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
										<div class="form-group">
											<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDtm">단계명</span></label>
											<input type="text" class="form-control" name="flowNm" id="flowNm" readonly="readonly">
										</div>
									</div>
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
										<div class="form-group">
											<label for="reqProTypeNm"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">처리 유형</span></label>
											<input type="text" class="form-control" name="reqProTypeNm" id="reqProTypeNm" readonly="readonly">
										</div>
									</div>
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
										<div class="form-group">
											<label for="reqOrd"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">요구사항 순번</span></label>
											<input type="text" class="form-control" name="reqOrd" id="reqOrd" readonly="readonly">
										</div>
									</div>
								</div>
								<div class="form-group kt-margin-b-20 form-group-last">
									<label>
										<i class="fa fa-file-upload kt-margin-r-5"></i>
										<span data-lang-cd="req4101.label.attachments">첨부 파일 목록</span> 
									</label>
									<div class="kt-uppy osl-max-h-px-260 fileReadonly" name="fileListDiv" id="fileListDiv">
										<div class="kt-uppy__dashboard"></div>
										<div class="kt-uppy__progress"></div>
									</div>
								</div>
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqNm">요청 제목</span></label>
									<input type="text" class="form-control" name="reqNm" id="reqNm"  readonly="readonly">
								</div>
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDesc">접수 의견</span></label>
									<textarea  class="kt-hide" name="reqAcceptTxt" id="reqAcceptTxt" required></textarea>
								</div>
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDesc">요청 내용</span></label>
									<textarea  class="kt-hide" name="reqDesc" id="reqDesc" required></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
						<div class="kt-portlet" id="cmm6201RequestUsrInfo">
							<div class="kt-portlet__head">
								<div class="kt-portlet__head-label">
									<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.title">요청자 정보</span>
								</div>
								<div class="kt-portlet__head-toolbar">
									<div class="kt-portlet__head-group">
										<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
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
						<div class="kt-portlet" id="cmm6201ReqGroupInfo">
							<div class="kt-portlet__head">
								<div class="kt-portlet__head-label">
									<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqInfo">그룹 요구사항 정보</span>
								</div>
								<div class="kt-portlet__head-toolbar">
									<div class="kt-portlet__head-group">
										<div class="kt-portlet__head-group">
											<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
										</div>
									</div>
								</div>
							</div>
							<div class="kt-portlet__body">
								<div class="row">
									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
										<div class="form-group">
											<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReq">그룹 요구사항 번호</span></label>
											<div class="input-group">
												<input type="text" class="form-control" name="reqGrpNo" id="reqGrpNo" readonly="readonly" placeholder="그룹 요구사항이 연결되어 있지 않습니다.">
											</div>
										</div>
									</div>
									<div class="col-xl-9 col-lg-9 col-md-6 col-sm-12">
										<div class="form-group">
											<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReq">그룹 요구사항</span></label>
											<div class="input-group">
												<input type="text" class="form-control" name="reqGrpNm" id="reqGrpNm" readonly="readonly" placeholder="그룹 요구사항이 연결되어 있지 않습니다.">
											</div>
										</div>
									</div>
								</div>
								<div class="form-group kt-margin-b-0">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqDesc">그룹 요구사항 내용</span></label>
									<textarea class="kt-hide" name="reqGrpDesc" id="reqGrpDesc"></textarea>
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
						<div class="kt-portlet" id="cmm6201ChargerUsrSel">
							<div class="kt-portlet__head">
								<div class="kt-portlet__head-label">
									<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.title">담당자 선택</span>
								</div>
								<div class="kt-portlet__head-toolbar">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6201ProcessAuthUsrTable" data-datatable-action="select" title="프로세스 조회" data-title-lang-cd="req4100.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
										<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">기본 담당자 조회</span>
									</button>
									<div class="kt-portlet__head-group">
										<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
									</div>
								</div>
							</div>
							<div class="kt-portlet__body">
								<div class="row">
									<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12">
										<div class="form-group">
											<label class="required" for="prjNm"><i class="fa fa-edit kt-margin-r-5"></i><span>담당자명</span></label>
											<div class="input-group">
												<input type="text" class="form-control" placeholder="담당자명" name="reqChargerNm" id="reqChargerNm" opttype="-1" required>
												<button type="button" class="btn btn-brand input-group-append" id="searchReqChargerBtn" name="searchReqChargerBtn"><i class="fa fa-search"></i><span data-lang-cd="req4101.button.searchBtn">검색</span></button>
											</div>
											<span class="form-text text-muted">* 요구사항의 담당자를 선택해주세요.</span>
										</div>
									</div>
									<div class="col-xl-8 col-lg-8 col-md-12 col-sm-12">
										<label><i class="fa fa-edit kt-margin-r-5"></i><span>프로세스 기본 담당자</span></label>
										<div class="osl-datatable-search" data-datatable-id="cmm6201ProcessAuthUsrTable"></div>
										<div class="kt_datatable" id="cmm6201ProcessAuthUsrTable"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
						<div class="kt-portlet" id="cmm6201ChargerUsrSel">
							<div class="kt-portlet__head">
								<div class="kt-portlet__head-label">
									<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.title">추가 항목 입력</span>
								</div>
								<div class="kt-portlet__head-toolbar">
									<div class="kt-portlet__head-group">
										<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
									</div>
								</div>
							</div>
							<div class="kt-portlet__body">
								<div class="row">
									<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
										<div class="form-group">
											<label for="reqStDtm"><i class="far fa-clock kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">업무 시작 일시</span></label>
											<input type="text" class="form-control" name="reqStDtm" id="reqStDtm">
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
										<div class="form-group">
											<label for="reqEdDtm"><i class="far fa-clock kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">업무 종료 일시</span></label>
											<input type="text" class="form-control" name="reqEdDtm" id="reqEdDtm">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
										<div class="form-group">
											<label for="reqStDtm" class="required"><i class="fa fa-clock kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">업무 시작 예정 일자</span></label>
											<input type="text" class="form-control" name="reqStDuDtm" id="reqStDuDtm" required>
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
										<div class="form-group">
											<label for="reqEdDtm" class="required"><i class="fa fa-clock kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">업무 종료 예정 일자</span></label>
											<input type="text" class="form-control" name="reqEdDuDtm" id="reqEdDuDtm" required>
										</div>
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
								<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
							</div>
						</div>
					</div>
					<div class="kt-portlet__body osl-min-h-px--470 osl-process__flow-main">
						<div class="osl-process__flow-container">
							<div class="osl-process__flow-chart d-inline-block" id="cmm6201FlowChartDiv">
								
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

var formValidate;
var OSLCmm6201Popup = function () {
	var formId = 'frCmm6201';

	
	formValidate = $.osl.validate(formId);
	
	
	var paramPrjId = $("#"+formId+" #paramPrjId").val();
	var paramReqId = $("#"+formId+" #paramReqId").val();
	var paramProId;
	var paramFlowId;

	
	var formEditList = [];
	
	
	var fileUploadObj;
	
	
	var cmm6201ProcessAuthUsrTable;
	
	
	var flowChart = $("#"+formId+" #cmm6201FlowChartDiv");

	
	var zoomObj;
	var currentZoom = 2;
	
	
	var flowLinkList = [];
	var flowList = [];
	
	
	var flowChgLogData = {};
	
	
	var selFlowId;
	
    
    var documentSetting = function () {

    	
    	new KTPortlet('cmm6201RequestUsrInfo', $.osl.lang("portlet"));
    	new KTPortlet('cmm6201ReqGroupInfo', $.osl.lang("portlet"));
    	new KTPortlet('cmm6201ReqInfo', $.osl.lang("portlet"));
    	new KTPortlet('cmm6201NewRequestOpt', $.osl.lang("portlet"));
    	new KTPortlet('cmm6201ProcessSel', $.osl.lang("portlet"));
    	
    	
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
    	
		
		wizard.on('beforeNext', function(wizardObj) {
			
			if(!$("#"+formId).valid()){
				wizardObj.stop();
			}
		});
		wizard.on('beforePrev', function(wizardObj) {
			
			if(!$("#"+formId).valid()){
				wizardObj.stop();
			}
		});
		
		
		wizard.on('change', function(wizardObj) {
			if(wizardObj.currentStep == 2){
				if($.osl.isNull(cmm6201ProcessAuthUsrTable)){
					
					fnDatatableSetting();
				}else{
					
					cmm6201ProcessAuthUsrTable.targetDt.reload();
				}
			}
			else if(wizardObj.currentStep == 3){
				if($.osl.isNull(selFlowId)){
					
					fnSelectFlowList(flowList, flowLinkList);
				}
				
				
				fnFlowChartZoom("reset");
			}
			
		});
		
		
		$("#"+formId+" #reqChargerNm").keydown(function(e){
			if(e.keyCode == 13){
				
				$("#"+formId+" #searchReqChargerBtn").click();
			}
			$("#"+formId+" #reqChargerId").val("");
		});
    	
    	
    	$("#"+formId+" #searchReqChargerBtn").click(function(){
    		var data = {
    				usrNm : $("#"+formId+" #reqChargerNm").val()
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
								var selUsrInfo = JSON.parse(selUsrInfo);
								
								
								fnUsrChargerChg(selUsrInfo);
							}
						}
					}]
    		};
    		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6400/selectCmm6401View.do',data,options);
    	});
    	
    	
    	$("#cmm6201SaveSubmit").click(function(){
    		
    		fnReqProcessAction();
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
            onOperatorSelect: function(operatorId){
				
				var selFlow = flowChart.flowchart("getOperatorData", operatorId);

				
				if(selFlow.properties.flowStatus != "01"){
					
					return false;
				}
				
				
            	$("#"+formId+" #nextFlowNm").text(selFlow.properties.title);
            	
				
				$("#"+formId+" .osl-flowchart__operator.active").removeClass("active");
            	
				
				$("#"+formId+" .osl-flowchart__operator[data-operator-id="+operatorId+"]").addClass("active");
				
				
				selFlowId = operatorId;
				return true;
			}
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
		
		
    	$("form#"+formId+" button[data-flow-action=zommCtrl]").click(function(){
    		var zoomAction = $(this).data("zoom");
			
			if($.osl.isNull(zoomAction)){
				return true;
			}else{
				fnFlowChartZoom(zoomAction);
			}
    	});
		
    	
    	fnRequestProcessData();
    };
    
    
	var fnDatatableSetting = function(){
		var paramProcessId = $("#"+formId+"  #processId").val();
		
		
		cmm6201ProcessAuthUsrTable = $.osl.datatable.setting("cmm6201ProcessAuthUsrTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1100/selectPrj1100ProcessAuthUsrListAjax.do",
						params:{
							type: "remote",
							paramPrjId: paramPrjId,
							paramReqId: paramReqId,
							processId: paramProcessId
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
				{field: 'usrNm', title: '사용자명', textAlign: 'left', width: 150, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직책', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd"},
				{field: 'usrDutyNm', title: '직급', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd"},
				{field: 'email', title: '이메일', textAlign: 'left', width: 150, search: true},
				{field: 'usrId', title: '사용자 ID', textAlign: 'left', width: 100, search: true},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 150, search: true},
			],
			searchColumns:[
				{field: 'usrId', title: '사용자 ID', searchOrd: 1}
			],
			actionBtn:{
				"title": "담당자 지정",
				"update": false,
				"delete": false,
				"dblClick": true,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick": "담당자 지정"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-left",
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					
					
					fnSelChargerChg(rowData);
				}
			}
		});
	};
	
	
	function fnUsrChargerChg(chargerInfo){
		var usrId = chargerInfo.usrId;
		var usrNm = chargerInfo.usrNm;
		var email = chargerInfo.email;
		var usrImgId = chargerInfo.usrImgId;
		
		
		$("#"+formId+" #reqChargerId").val(usrId);
		$("#"+formId+" #reqChargerNm").val(usrNm);

		
		$("#"+formId+" #nextFlowChargerNm").text(usrNm);
		$("#"+formId+" #nextFlowEmail").text(email);
		$("#"+formId+" #nextFlowChargerImg").attr("src",$.osl.user.usrImgUrlVal(usrImgId));
	}
	 
	
	var fnSelChargerChg = function(chargerInfo){
		
		var reqChargerId = $("#"+formId+" #reqChargerId").val();
		
		
		if(!$.osl.isNull(reqChargerId)){
			$.osl.confirm("기존에 설정된 담당자가 변경됩니다.</br>계속 하시겠습니까?",{html:true}, function(result){
				if (result.value) {
					fnUsrChargerChg(chargerInfo);
				}
			});
		}else{
			fnUsrChargerChg(chargerInfo);
		}
		
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
		                
		                
		                if(!flowChgLogData.hasOwnProperty(map.chgProcessId)){
		                	flowChgLogData[map.chgProcessId] = {};
		                }
		                if(!flowChgLogData[map.chgProcessId].hasOwnProperty(map.chgFlowId)){
		                	flowChgLogData[map.chgProcessId][map.chgFlowId] = {};
		                }
		                
		                flowChgLogData[map.chgProcessId][map.chgFlowId] = map;
		                
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
		 								+'<div class="kt-user-card-v2__details kt-align-left">'
		 									+'<span class="kt-user-card-v2__name text-truncate">'+chgUsrNm+'</span>'
		 									+'<span class="kt-user-card-v2__email kt-margin-l-10 osl-line-height-rem-1_5">'+chgUsrEmail+'</span>'
		 								+'</div>'
		 							+'</div>'
		 							+'<div class="flowchart-operator-chg__dtm"><i class="fa fa-clock kt-margin-r-5"></i>'+chgDtm+'</div>'
	 							+'</div>'
	 							+processNextLabel
	 						+'</div>';
 					});
 				}
 				$("#osl-req__process-history").html(reqChgStr);
 				var reqInfo = data.reqInfo;
 				
 				paramProId = reqInfo.processId;
 				paramFlowId = reqInfo.flowId;
 				
 				
		    	$.osl.setDataFormElem(reqInfo, formId);
				
 				
		    	fnUsrChargerChg({
		    		usrId: reqInfo.reqChargerId,
		    		usrNm: reqInfo.reqChargerNm,
		    		usrImgId: reqInfo.reqChargerImgId,
		    		email: reqInfo.reqChargerEmail
		    	});
 				
				
		    	$("#"+formId+" #reqUsrId").val(reqInfo.reqUsrId);
				$("#"+formId+" #reqGrpNm").val(reqInfo.reqGrpNm);
		    	$("#"+formId+" #usrNm").val(reqInfo.reqUsrNm);
		    	$("#"+formId+" #email").val(reqInfo.reqUsrEmail);
		    	$("#"+formId+" #telno").val(reqInfo.reqUsrNum);
		    	$("#"+formId+" #deptName").val(reqInfo.reqUsrDeptNm);
		    	$("#"+formId+" #deptId").val(reqInfo.reqUsrDeptId);
		    	$("#"+formId+" #usrImgId").attr("src",$.osl.user.usrImgUrlVal(reqInfo.reqUsrImgId));
		    	
		    	$("#"+formId+" #nextProcessNm").text(reqInfo.processNm);
		    	$("#"+formId+" #reqPrjSelect").val($.osl.escapeHtml(reqInfo.prjId)).trigger('change.select2');
		    	$("#"+formId+" #reqPrjSelect").prop("disabled", true);
		    	
		    	
		    	formEditList.push($.osl.editorSetting(formId+" #reqDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:260
		    	}));
		    	formEditList.push($.osl.editorSetting(formId+" #reqGrpDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:180
	    		}));
		    	formEditList.push($.osl.editorSetting(formId+" #reqAcceptTxt", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:100
	    		}));
		    	
				
		    	fileUploadObj = $.osl.file.uploadSet(formId+" #fileListDiv",{
		    		maxFileSize: "${requestScope.fileSumMaxSize}",
		    		meta: {"atchFileId": $("#"+formId+" #atchFileId").val(), "fileSn": 0},
		    		height: 260,
		    		isDraggingOver: false,
		    		fileDownload: true,
		    		fileReadonly: true
		    	});
				
		    	
				$.osl.date.daterangepicker($("#"+formId+" #reqStDtm"), {
						singleDatePicker: true, 
						timePicker: true, 
						timePicker24Hour: true,
						maxDate: moment($("#reqEdDtm").val(), "YYYY-MM-DD HH:mm"),
						locale: {
							format: 'YYYY-MM-DD HH:mm'
				        }
					},function(defaultConfig, start, end, label){
						var stDtStr = new Date(start._d).format("yyyy-MM-dd HH:mm");
						
						
						if($("#"+formId+" #reqEdDtm").data('daterangepicker').startDate._d.getTime() < new Date(start._d).getTime()){
							$("#"+formId+" #reqEdDtm").data('daterangepicker').setStartDate(stDtStr);
						}
						$("#"+formId+" #reqEdDtm").data('daterangepicker').minDate = moment(stDtStr, "YYYY-MM-DD HH:mm");
				});
				$.osl.date.daterangepicker($("#"+formId+" #reqEdDtm"), {
						singleDatePicker: true, 
						timePicker: true, 
						timePicker24Hour: true,
						minDate: moment($("#"+formId+" #reqStDtm").val(), "YYYY-MM-DD HH:mm"),
						locale: {
							format: 'YYYY-MM-DD HH:mm'
				        }
					
					},function(defaultConfig, start, end, label){
						var edDtStr = new Date(start._d).format("yyyy-MM-dd HH:mm");
						
						$("#"+formId+" #reqStDtm").data('daterangepicker').maxDate = moment(edDtStr, "YYYY-MM-DD HH:mm");
				});
				
				
				$.osl.date.daterangepicker($("#"+formId+" #reqStDuDtm"), {
						singleDatePicker: true,
						maxDate: moment($("#"+formId+" #reqEdDuDtm").val(), "YYYY-MM-DD")
					
					},function(defaultConfig, start, end, label){
						var stDtStr = new Date(start._d).format("yyyy-MM-dd");
						
						
						if($("#"+formId+" #reqEdDuDtm").data('daterangepicker').startDate._d.getTime() < new Date(start._d).getTime()){
							$("#"+formId+" #reqEdDuDtm").data('daterangepicker').setStartDate(stDtStr);
						}
						$("#"+formId+" #reqEdDuDtm").data('daterangepicker').minDate = moment(stDtStr, "YYYY-MM-DD");
				});
				$.osl.date.daterangepicker($("#"+formId+" #reqEdDuDtm"), {
						singleDatePicker: true,
						minDate: moment($("#"+formId+" #reqStDuDtm").val(), "YYYY-MM-DD")
					
					},function(defaultConfig, start, end, label){
						var edDtStr = new Date(start._d).format("yyyy-MM-dd");
						
						$("#"+formId+" #reqStDuDtm").data('daterangepicker').maxDate = moment(edDtStr, "YYYY-MM-DD");
				});
		    	
		    	
		    	fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
		    	
		    	
		    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
		    	
		    	
		    	flowLinkList = data.flowLinkList;
		    	flowList = data.flowList;
		    	
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
	
	
	var fnSelectFlowList = function(flowList, flowLinkList){
		selFlowId = null;
		
		flowChart.flowchart("setData",{});
		
		
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

			
			var currentFlowNextIds = flowNextIdList[paramFlowId];
			
			$.each(flowList, function(idx, map){
				var flowNextId = [];
				if(flowNextIdList.hasOwnProperty(map.flowId)){
					flowNextId = flowNextIdList[map.flowId];
				}
				
				
				var flowStatus = "01";
				
				
				if(paramFlowId == map.flowId){
					flowStatus = "03";
				}
				
				else if(flowChgLogData.hasOwnProperty(paramProId) && flowChgLogData[paramProId].hasOwnProperty(map.flowId)){
					flowStatus = "02";
				}
				
				else if(currentFlowNextIds.indexOf(map.flowId) == -1){
					flowStatus = "04";
				}
				
				
   				var operatorData = {
					top: map.flowTop,
					left: map.flowLeft,
					properties: {
						id: map.flowId,
						flowNextId: flowNextId,
						title: $.osl.escapeHtml(map.flowNm),
						editable: false,
						flowStatus: flowStatus,
						inputs: {input_1: {label: '이전'}},
						outputs: {output_1: {label: '다음'}},
						flowTitleBgColor: map.flowTitleBgColor,
						flowTitleColor: map.flowTitleColor,
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
	};
	
	
	
	var fnReqProcessAction = function(){
		
		if(!$("#"+formId).valid()){
			$.osl.alert("필수 값이 입력되지 않았습니다.");
			return false;
		}
		
		
   		var fd = $.osl.formDataToJsonArray(formId);
		
		fd.append("selFlowId",selFlowId);
		return true;
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req4000/req4100/updateReq4100ReqAcceptList.do'/>", "async":"false"}
				,{
					paramSelReqInfoList : JSON.stringify(paramSelReqInfoList),
					defaultSwitchCd: defaultSwitchCd,
					selReqChargerId: selReqChargerId,
					reqAcceptTxt: reqAcceptTxt,
					selProcessId: selProcessId
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