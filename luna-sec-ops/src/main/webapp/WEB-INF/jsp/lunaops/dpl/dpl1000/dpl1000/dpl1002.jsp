<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form class="kt-form" id="frDpl1002">
	<input type="hidden" id="paramPrjId" name="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" id="paramDplId" name="paramDplId" value="${param.paramDplId}">
	<input type="hidden" id="datatableId" name="datatableId" value="${param.datatableId }">
	<input type="hidden" id="dplSignUseCd" name=""dplSignUseCd"" value="${dplInfo.dplSignUseCd}">
	<input type="hidden" id="regDtm" name="regDtm" value="${dplInfo.regDtm}">
	<input type="hidden" id="signTypeCd" name="signTypeCd" value="${signInfo.signTypeCd }">
	<input type="hidden" id="reqSignUsrId" name="reqSignUsrId" value="${signInfo.reqSignUsrId }">
	<input type="hidden" id="nextSignUsrId" name="nextSignUsrId" value="${signInfo.nextSignUsrId }">
	<input type="hidden" id="paramSignTypeCd" name="paramSignTypeCd" value="${param.paramSignTypeCd }">
	<input type="hidden" id="tabType" name="tabType" value="${param.tabType }">
	<input type="hidden" id="sprId" name="sprId" value="${param.sprId }">
	<input type="hidden" id="sprTypeCd" name="sprTypeCd" value="${param.sprTypeCd }">
	<div class="row flex-nowrap" id="dplRecord">
		<div class="osl-tab-icon-group">
			
			<ul class="nav nav-pills nav-pills-sm osl-flex-flow--column" role="tablist">
				
				<li class="nav-item kt-margin-r-0">
					<a class="nav-link osl-tab-fixed kt-margin-t-0 active" data-toggle="tab" href="#dplInfoTab" data-tab-id="dplInfo" role="tab">
						<i class="fas fa-info-circle kt-margin-r-5"></i><span data-lang-cd="dpl1002.title.tab.dplInfo">배포정보</span>
					</a>
				</li>
				
				<li class="nav-item kt-margin-r-0">
					<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#allHistoryTab" data-tab-id="dplInfoAll" role="tab">
						<i class="fas fa-list kt-margin-r-5"></i><span data-lang-cd="dpl1002.title.tab.dplAllHistory">전체 이력</span>
					</a>
				</li>
				
				<li class="nav-item kt-margin-r-0">
					<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#bldHistoryTab" data-tab-id="dplInfoBuild" role="tab">
						<i class="fas fa-layer-group kt-margin-r-5"></i><span data-lang-cd="dpl1002.title.tab.bldHistory">빌드 이력</span>
					</a>
				</li>
				
				<c:if test="${dplInfo.dplSignUseCd == '01'}">
					<li class="nav-item kt-margin-r-0">
						<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#dplSignHistoryTab" data-tab-id="dplInfoSign" role="tab">
							<i class="fas fa-file-signature kt-margin-r-5"></i><span data-lang-cd="dpl1002.title.tab.signHistory">결재 이력</span>
						</a>
					</li>
				</c:if>
				
				<li class="nav-item kt-margin-r-0">
					<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#dplChgHistoryTab" data-tab-id="dplInfoModify" role="tab">
						<i class="fas fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1002.title.tab.changeHistory">수정 이력</span>
					</a>
				</li>
				
				<li class="nav-item kt-margin-r-0">
					<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#dplReqRevisionTab" data-tab-id="dplRevision" role="tab">
						<i class="fas fa-bezier-curve kt-margin-r-5"></i><span data-lang-cd="dpl1002.title.tab.dplReqRevision">배정 리비전</span>
					</a>
				</li>
				
				<li class="nav-item kt-margin-r-0">
					<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#dplReqTab" data-tab-id="dplAssignReq" role="tab">
						<i class="fas fa-paste"></i><span data-lang-cd="dpl1002.title.tab.dplAssignReq">배정 요구사항 목록</span>
					</a>
				</li>
			</ul>
			
		</div>
		
		<div class="osl-tab-content-group kt-bg-light kt-padding-10">
			<div class="tab-content osl-tab-content kt-scroll" id="osl-tab-content__scroll">
				
				<div class="tab-pane active" id="dplInfoTab" data-tab-id="dplInfo" role="tabpanel">
					
					<div class="kt-portlet" id="dplInfoProtlet">
						<div class="kt-portlet__head">
							
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-bolder kt-font-brand">
									<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="dpl1002.title.header.dplInfo">배포 계획 정보</span>
								</h5>
							</div>
							
							<div class="kt-portlet__head-toolbar">
								<a href="javascript:void(0);" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md">
									<i class="fa fa-chevron-down"></i>
								</a>
							</div>
						</div>
						
						<div class="kt-portlet__body">
							<div class="row">
								<div class="col-lg-3 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="col-form-label"><i class="fas fa-server kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplStatus">배포 상태</span></label>
										<input class="form-control" type="text" id="dplStsNm" name="dplStsNm" readonly="readonly" value="<c:out value="${dplInfo.dplStsNm}"/>" >
									</div>	
								</div>
								<div class="col-lg-3 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplVersion">배포 버전</span></label>
										<input class="form-control" type="text" id="dplVer" name="dplVer" readonly="readonly" value="<c:out value="${dplInfo.dplVer}"/>" >
									</div>
								</div>	
								<div class="col-lg-3 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="col-form-label"><i class="fab fa-cloudsmith kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplType">배포 방법</span></label>
										<input class="form-control" type="text" id="dplTypeNm" name="dplTypeNm" readonly="readonly" value="<c:out value="${dplInfo.dplTypeNm}"/>" >
									</div>	
								</div>
								<div class="col-lg-3 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="col-form-label"><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplDt">배포 일자</span></label>
										<input class="form-control" type="text" id="dplDt" name="dplDt" readonly="readonly" value="<c:out value="${dplInfo.dplDt}"/>" >
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-3 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplNm">배포 명</span></label>
										<input class="form-control" type="text" id="dplNm" name="dplNm" title="<c:out value="${dplInfo.dplNm}"/>" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" readonly="readonly" value="<c:out value="${dplInfo.dplNm}"/>">
									</div>
								</div>
								<div class="col-lg-3 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="col-form-label"><i class="fa fa-user-cog kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplUser">배포자</span></label>
										<input class="form-control" type="text" id="dplUsrNm" name="dplUsrNm" readonly="readonly" value="<c:out value="${dplInfo.dplUsrNm}"/>" >
									</div>
								</div>
								<div class="col-lg-3 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplRevision">배포 리비전</span></label>
										<input class="form-control" type="text" id="dplRevisionNum" name="dplRevisionNum" readonly="readonly" value="<c:out value='${empty dplInfo.dplRevisionNum ? "Last Revision" :  dplInfo.dplRevisionNum }'/>" >
									</div>
								</div>
								<div class="col-lg-3 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplSignUse">결재 사용 여부</span></label>
										<input class="form-control" type="text" id="dplSignUseNm" name="dplSignUseNm" readonly="readonly" value="<c:out value="${dplInfo.dplSignUseNm}"/>" >
									</div>
								</div>
							</div>
							<div class="row">
								<c:if test="${dplInfo.dplSignUseCd == '01'}">
									<div class="col-lg-6 col-md-12 col-sm-12 col-12">
										<div class="form-group">
											<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplSignText">결재요청 의견</span></label>
											<textarea class="form-control osl-min-h-px--100 osl-textarea__resize--none" id="dplSignTxt" name="dplSignTxt" readonly="readonly"><c:out value="${dplInfo.dplSignTxt}"/></textarea>
										</div>
									</div>
								</c:if>
								<div class="col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplDesc">배포 설명</span></label>
										<textarea class="form-control osl-min-h-px--100 osl-textarea__resize--none" id="dplDesc" name="dplDesc" readonly="readonly"><c:out value="${dplInfo.dplDesc}"/></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<c:if test="${dplInfo.dplTypeCd == '01'}" >
						<div class="kt-portlet" id="autoDplInfoProtlet">
							<div class="kt-portlet__head">
								
								<div class="kt-portlet__head-label">
									<h5 class="kt-font-bolder kt-font-brand">
										<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="dpl1002.title.header.autoBldSetting">자동 배포 설정 정보</span>
									</h5>
								</div>
								
								<div class="kt-portlet__head-toolbar">
									<a href="javascript:void(0);" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md">
										<i class="fa fa-chevron-down"></i>
									</a>
								</div>
							</div>
							
							<div class="kt-portlet__body">
								<div class="row">
									<div class="col-lg-3 col-md-12 col-sm-12 col-12">
										<div class="form-group">
											<label class="col-form-label"><i class="fa fa-clock kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplAutoTime">자동 실행 시간</span></label>
											<input class="form-control" type="text" id="dplAutoTm" name="dplAutoTm" readonly="readonly" value="<fmt:formatDate value="${dplInfo.dplAutoDtm}" pattern="HH:mm:ss"/>">
										</div>
									</div>
									<div class="col-lg-3 col-md-12 col-sm-12 col-12">
										<div class="form-group">
											<label class="col-form-label"><i class="fas fa-clipboard-check kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplAutoAfter">실패 후 처리</span></label>
											<input class="form-control" type="text" id="dplAutoAfterNm" name="dplAutoAfterNm" readonly="readonly" value="<c:out value="${dplInfo.dplAutoAfterNm}"/>" >
										</div>
									</div>
									<div class="col-lg-3 col-md-12 col-sm-12 col-12">
										<div class="form-group">
											<label class="col-form-label"><i class="fas fa-undo kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplRestoreType">원복 타입</span></label>
											<input class="form-control" type="text" id="dplRestoreNm" name="dplRestoreNm" readonly="readonly" value="<c:out value="${dplInfo.dplRestoreNm}"/>" >
										</div>
									</div>
									<div class="col-lg-3 col-md-12 col-sm-12 col-12">
										<div class="form-group">
											<label class="col-form-label"><i class="fas fa-retweet kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.autoRepeatUse">반복 여부</span></label>
											<input class="form-control" type="text" id="dplAutoRepeatNm" name="dplAutoRepeatNm" readonly="readonly" value="<c:out value="${dplInfo.dplAutoRepeatNm}"/>" >
										</div>
									</div>
								</div>
								<c:if test="${dplInfo.dplAutoRepeatCd == '01'}">
									<div class="row">
										<div class="col-lg-3 col-md-12 col-sm-12 col-12">
											<div class="form-group">
												<label class="col-form-label"><i class="fas fa-history kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.autoRepeatCycle">반복 주기</span></label>
												<input class="form-control" type="text" id="dplRepeatCycleNm" name="dplRepeatCycleNm" readonly="readonly" value="<c:out value="${dplInfo.dplRepeatCycleNm}"/>">
											</div>
										</div>
										<div class="col-lg-3 col-md-12 col-sm-12 col-12">
											<div class="form-group">
												<label class="col-form-label"><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.autoRepeatEdDtm">반복 종료 일시</span></label>
												<input class="form-control" type="text" id="dplRepeatEdDtm" name="dplRepeatEdDtm" readonly="readonly" value="<c:out value="${dplInfo.dplRepeatEdDtm}"/>" >
											</div>
										</div>
										<div class="col-lg-3 col-md-12 col-sm-12 col-12">
											<div class="form-group">
												<label class="col-form-label"><i class="fas fa-calendar-day kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.autoDplRevisionSel">반복 배포 리비전 선택</span></label>
												<input class="form-control" type="text" id="autoDplRevisionSel" name="autoDplRevisionSel" readonly="readonly" value="<c:out value='${dplInfo.autoDplRevisionSelNm }'/>" >
											</div>
										</div>
										<c:if test="${dplInfo.dplRepeatCycleCd == '04'}">
											<div class="col-lg-3 col-md-12 col-sm-12 col-12">
												<div class="form-group">
													<label class="col-form-label"><i class="fas fa-calendar-day kt-margin-r-5"></i><span data-lang-cd="dpl1002.label.dplRepeatDayOfWeek">반복 요일</span></label>
													<input class="form-control" type="text" id="dplRepeatDay" name="dplRepeatDay" readonly="readonly" value="<c:out value="${dplInfo.dplRepeatDay}"/>" >
												</div>
											</div>
										</c:if>
									</div>
								</c:if>
							</div>
						</div>
					</c:if>
					
					
					<div class="kt-portlet kt-margin-b-0" id="dplAssignJobListPortlet">
						<div class="kt-portlet__head">
							
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-bolder kt-font-brand">
									<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="dpl1002.title.header.dplAssignJob">JOB 배정 목록</span>
								</h5>
							</div>
							
							<div class="kt-portlet__head-toolbar">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-datatable-id="dpl1002AssignJobTable" data-datatable-action="select" title="배정 JOB 목록 조회" data-title-lang-cd="dpl1002.assignJobDatatable.tooltip.assignJobSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
								</button>
								<a href="javascript:void(0);" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
							</div>
						</div>
						
						<div class="kt-portlet__body">
							
							<div class="col-lg-6 col-md-8 col-sm-12">
								<div class="osl-datatable-search" data-datatable-id="dpl1002AssignJobTable"></div>
							</div>
							
							<div class="kt_datatable" id="dpl1002AssignJobTable"></div>
						</div>
					</div>
					
				</div>
				
				
				<div class="tab-pane" id="allHistoryTab" data-tab-id="dplInfoAll" role="tabpanel">
					<div class="kt-portlet kt-margin-b-0">
						
						<div class="kt-portlet__body">
							<div class="kt-timeline">
								
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane" id="bldHistoryTab" data-tab-id="dplInfoBuild" role="tabpanel">
					<div class="kt-portlet kt-margin-b-0">
						
						<div class="kt-portlet__body">
							<div class="kt-timeline">
								
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane" id="dplSignHistoryTab" data-tab-id="dplInfoSign" role="tabpanel">
					<div class="kt-portlet kt-margin-b-0">
						
						<div class="kt-portlet__body">
							<div class="kt-timeline">
								
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane" id="dplChgHistoryTab" data-tab-id="dplInfoModify" role="tabpanel">
					<div class="row">
						<div class="col-lg-8 col-md-12 col-sm-12 col-12">
							<div class="kt-bg-light kt-padding-10">
								<div class="osl-background-around osl-h-px--503 kt-padding-10" id="dplPopModifyHisFrame">
								</div>	
							</div>	
						</div>
						<div class="col-lg-4 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
							
							<div class="kt-portlet kt-margin-b-0 border">
								<div class="kt-portlet__head">
									
									<div class="kt-portlet__head-label">
										<h5 class="kt-font-boldest">
											<i class="fas fa-edit kt-margin-r-5"></i><span data-lagn-cd="dpl1002.label.change">변경</span> <span class=" kt-font-danger"><span data-lagn-cd="dpl1002.label.before">전</span></span><span data-lagn-cd="dpl1002.label.content"> 내용 </span>
										</h5>
									</div>
								</div>
								
								<div class="kt-portlet__body osl-min-h-px--190 osl-desktop-flex-flow--row align-items-baseline" id="preDetailVal">
								</div>
							</div>
							
							<div class="kt-portlet kt-margin-b-0 border kt-margin-t-20">
								<div class="kt-portlet__head">
									
									<div class="kt-portlet__head-label">
										<h5 class="kt-font-boldest">
											<i class="fas fa-edit kt-margin-r-5"></i><span data-lagn-cd="dpl1002.label.change">변경</span> <span class="kt-font-info"><span data-lagn-cd="dpl1002.label.after">후</span></span><span data-lagn-cd="dpl1002.label.content"> 내용 </span>
										</h5>
									</div>
								</div>
								
								<div class="kt-portlet__body osl-min-h-px--190 osl-desktop-flex-flow--row align-items-baseline" id="chgDetailVal">
								</div>
							</div>
						</div>
					</div>	
				</div>
				
				
				<div class="tab-pane" id="dplReqRevisionTab" data-tab-id="dplRevision" role="tabpanel">
					<div class="kt-portlet" id="revsionReqListProtlet">
						<div class="kt-portlet__head">
							
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-bolder kt-font-brand">
									<i class="fa fa-list kt-margin-r-5"></i><span data-lang-cd="dpl1002.title.header.dplAssignReq">배정 요구사항 목록</span>
								</h5>
							</div>
							
							<div class="kt-portlet__head-toolbar">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-datatable-id="dpl1002ReqRevsionTable" data-datatable-action="select" title="배정 요구사항 목록 조회" data-title-lang-cd="dpl1002.reqDatatable.tooltip.assignReqSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
									<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
								</button>
							</div>
						</div>
						
						<div class="kt-portlet__body osl-min-h-px-imp--300">
							
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="osl-datatable-search" data-datatable-id="dpl1002ReqRevsionTable"></div>
							</div>
							
							<div class="kt_datatable" id="dpl1002ReqRevsionTable"></div>
						</div>
					</div>
					
					<div class="kt-portlet position-relative" id="repositoryListPortlet">
						<div class="osl-div-cover" id="repasitoryListMask" data-cover-target="repasitoryListMask">
							<span data-lang-cd="dpl1002.phrases.selectReq" id="repositotyMaskText">상단 배정된 요구사항을 선택해주세요.</span>
						</div>
						
						<div class="kt-portlet__head">
							
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-bolder kt-font-brand">
									<i class="fa fa-th-large kt-margin-r-5"></i>
									<span data-lang-cd="">저장소 목록</span>
								</h5>
							</div>
							
							<div class="kt-portlet__head-toolbar">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-datatable-id="dpl1002RepositoryListTable" data-datatable-action="select" title="소스 저장소 목록 조회" data-title-lang-cd="dpl1002.repositoryListDatatable.tooltip.repositorySelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
								</button>
								<a href="javascript:void(0);" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
							</div>
						</div>
						
						<div class="kt-portlet__body">
							
							<div class="col-lg-8 col-md-10 col-sm-12">
								<div class="osl-datatable-search" data-datatable-id="dpl1002RepositoryListTable"></div>
							</div>
							
							<div class="kt_datatable" id="dpl1002RepositoryListTable"></div>
						</div>
					</div>
					
					<div class="kt-portlet position-relative" id="revsionListProtlet">
						<div class="osl-div-cover" id="revsionListMask" data-cover-target="revisionList">
							<span data-lang-cd="dpl1002.phrases.selectRepo">저장소를 선택해주세요.</span>
						</div>
						<div class="kt-portlet__head">
							
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-bolder kt-font-brand">
									<i class="fa fa-list kt-margin-r-5"></i><span data-lang-cd="dpl1002.title.header.dplAssignReqRevision">배정 리비전 목록</span>
								</h5>
							</div>
							
							<div class="kt-portlet__head-toolbar">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-datatable-id="dpl1002ReivisionListTable" data-datatable-action="select" title="배정 리비전 목록 조회" data-title-lang-cd="dpl1002.reivisionListDatatable.tooltip.revisionSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
									<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
								</button>
								<a href="javascript:void(0);" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
							</div>
						</div>
						
						<div class="kt-portlet__body osl-min-h-px-imp--300">
							
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="osl-datatable-search" data-datatable-id="dpl1002ReivisionListTable"></div>
							</div>
							
							<div class="kt_datatable kt-margin-b-0 osl-div__border-lightgray kt-rounded" id="dpl1002ReivisionListTable"></div>
						</div>
					</div>
					
					
					<div class="kt-portlet position-relative" id="revsionFileTreeProtlet">
						<div class="osl-div-cover" id="revisionFileListMask" data-cover-target="revisionFileList">
							<span data-lang-cd="dpl1002.phrases.selectRevision">리비전을 선택하세요.</span>
						</div>
						<div class="kt-portlet__head">
							
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-bolder kt-font-brand">
									<i class="fa fa-th-large kt-margin-r-5"></i>
									<span id="selRevisionNum"></span><span data-lang-cd="dpl1002.title.header.revisionFileFolder">리비전 폴더 목록</span>
								</h5>
							</div>
							
							<div class="kt-portlet__head-toolbar">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air osl-tree-action" data-tree-id="dpl1002RevisionFileTree" data-tree-action="select" title="리비전 폴더 조회" data-title-lang-cd="dpl1002.revisionFileTree.tooltip.revisionFolderSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
									<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
								</button>
								<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" title="전체 펼치기" data-tree-id="dpl1002RevisionFileTree" data-title-lang-cd="tree.label.contextmenu.allNodeOpen" data-tree-action="allNodeOpen"><i class="fa fa-plus"></i></a> 
								<a href="javascript:void(0);" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" title="전체 접기" data-tree-id="dpl1002RevisionFileTree" data-title-lang-cd="tree.label.contextmenu.allNodeClose" data-tree-action="allNodeClose"><i class="fa fa-minus"></i>></a> 
								<a href="javascript:void(0);" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
							</div>
						</div>
						
						<div class="kt-portlet__body">
							<div class="osl-tree-search" data-tree-id="dpl1002RevisionFileTree"></div>
							<div class="kt-separator kt-separator--space-sm kt-separator--border-solid"></div>
							<div class="osl-tree kt-scroll" data-height="410" id="dpl1002RevisionFileTree"></div>
						</div>
					</div>
					
					
					<div class="kt-portlet position-relative kt-margin-b-0" id="revisionFileListProtlet">
						<div class="osl-div-cover" data-cover-target="revisionFileList" id="revisionFileListDiv">
							<span data-lang-cd="dpl1002.phrases.selectRevision">리비전을 선택하세요.</span>
						</div>
						<div class="kt-portlet__head">
							
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-bolder kt-font-brand">
									<i class="fa fa-list kt-margin-r-5"></i><span data-lang-cd="dpl1002.title.header.revisionFileList">파일 목록</span>
								</h5>
							</div>
							
							<div class="kt-portlet__head-toolbar">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-datatable-id="dpl1002RevisionFileTable" data-datatable-action="select" title="리비전 파일 목록 조회" data-title-lang-cd="dpl1002.revisionFileDatatable.tooltip.revisionFileSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
									<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
								</button>
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-datatable-id="dpl1002RevisionFileTable" data-datatable-action="detail" title="소스 코드 보기" data-title-lang-cd="dpl1002.revisionFileDatatable.tooltip.sourceCode" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="2">
									<i class="fas fa-external-link-alt"></i><span data-lang-cd="dpl1002.revisionFileDatatable.button.sourceCode">소스 코드 보기</span>
								</button>
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-datatable-id="dpl1002RevisionFileTable" data-datatable-action="diff" title="소스 코드 비교" data-title-lang-cd="dpl1002.revisionFileDatatable.tooltip.sourceCodeDiff" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="3">
									<i class="fas fa-code"></i><span data-lang-cd="dpl1002.revisionFileDatatable.button.codeDiff">DIFF</span>
								</button>
								<a href="javascript:void(0);" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
							</div>
						</div>
						
						<div class="kt-portlet__body osl-min-h-px-imp--300">
							
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="osl-datatable-search" data-datatable-id="dpl1002RevisionFileTable"></div>
							</div>
							
							<div class="kt_datatable kt-margin-b-0" id="dpl1002RevisionFileTable"></div>
						</div>
					</div>
					
					
				</div>
				
				
				<div class="tab-pane" id="dplReqTab" data-tab-id="dplAssignReq" role="tabpanel">
					<div class="kt-portlet kt-margin-b-0">
						<div class="kt-portlet__head">
							
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-bolder kt-font-brand">
									<i class="fa fa-list kt-margin-r-5"></i><span data-lang-cd="dpl1002.title.header.dplAssignReqRevision">배정 요구사항 목록</span>
								</h5>
							</div>
							
							<div class="kt-portlet__head-toolbar">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-datatable-id="dpl1002DplReqTable" data-datatable-action="select" title="배정 요구사항 목록 조회" data-title-lang-cd="dpl1002.toolTip.button.assignReqSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
									<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
								</button>
							</div>
						</div>
						
						<div class="kt-portlet__body osl-min-h-px--400">
							
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="osl-datatable-search" data-datatable-id="dpl1002DplReqTable"></div>
							</div>
							
							<div class="kt_datatable" id="dpl1002DplReqTable"></div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
	</div>
</form>

<div class="modal-footer">
	<button type="button" class="btn btn-outline-warning kt-hide" data-auth-button="update" id="dpl1004SignCancelSubmit">
		<i class="fa fa-check-square"></i><span data-lang-cd="dpl1002.button.signCancel">결재 회수</span>
	</button>
	<button type="button" class="btn btn-outline-primary kt-hide" data-auth-button="update" id="dpl1004SignAcceptSubmit">
		<i class="fa fa-check-square"></i><span data-lang-cd="dpl1002.button.signApr">결재 승인</span>
	</button>
	<button type="button" class="btn btn-outline-danger kt-hide" data-auth-button="update" id="dpl1004SignRejectSubmit">
		<i class="fa fa-check-square"></i><span data-lang-cd="dpl1002.button.signRjt">결재 반려</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>



<script>
"use strict";
var OSLDpl1002Popup = function () {

	var formId = 'frDpl1002';
	
	
	var modalTitle = $("h5.modal-title:first");
	var modalTitleText = modalTitle.text();
	
	
	var datatableId = $("#datatableId").val();
	
	
	var dpl1002AssignJobTable;
	
	var dpl1002DplReqRevsionDataTable;
	
	var dpl1002RepositoryListTable;
	
	var dpl1002ReivisionListTable;
	
	var dpl1002DplReqDataTable;
	
	
	var isDplHistorySelceted = false;
	
	
	var dplModifyList;
	
	
	var isDplModifyInfoSelected = false;
	
	
	var dpl1002RevisionTreeObj;
	
	
	var revisionAuthFlag = false;
	
	var fileCodeAuthFlag = false;
	
	
	var selectReqId;
	
	var processId;
	
	var revisionNum;
	
	var repositoryId;
	
	var repositoryTypeCd;
	
	var sprId = $("#sprId").val();
	
	var sprTypeCd = $("#sprTypeCd").val();
	
	
	var tabType = $("#tabType").val();
	var documentSetting = function(){
		
		var paramPrjId = $("#paramPrjId").val();
		var paramDplId = $("#paramDplId").val();
		
		
		modalTitle.text(modalTitleText+" - "+ $.osl.lang("dpl1002.title.tab.dplInfo"));
		
		
		new KTPortlet('dplInfoProtlet', $.osl.lang("portlet")); 
		new KTPortlet('autoDplInfoProtlet', $.osl.lang("portlet")); 
		new KTPortlet('dplAssignJobListPortlet', $.osl.lang("portlet")); 
		new KTPortlet('revsionReqListProtlet', $.osl.lang("portlet")); 
		new KTPortlet('repositoryListPortlet', $.osl.lang("portlet")); 
		new KTPortlet('revsionListProtlet', $.osl.lang("portlet")); 
    	new KTPortlet('revsionFileTreeProtlet', $.osl.lang("portlet")); 
    	new KTPortlet('revisionFileListProtlet', $.osl.lang("portlet")); 
		
		
		
		fnRightDivSize();
		
		fnAssignJobDataTableSetting(paramPrjId, paramDplId);
		
		
		fnSignBtnSetting();
		
		
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			
			var tabTarget = $(e.currentTarget);
			
			var tabDiv = tabTarget.attr('data-tab-id');
			
			var tabNm = tabTarget.text();
			
			
			modalTitle.text(modalTitleText+" - "+tabNm);
			
			
			fnRightDivSize();
			
			
			$('#osl-tab-content__scroll').scrollTop(0);
			
			
			if(tabDiv=='dplInfo'){
				
				if($.osl.isNull(dpl1002AssignJobTable)){
					fnAssignJobDataTableSetting(paramPrjId, paramDplId);
				}
			
			}else if(tabDiv=='dplInfoAll' || tabDiv=='dplInfoBuild' || tabDiv=='dplInfoSign'){
				if(!isDplHistorySelceted){
					
					fnSelectDplHistoryInfo(paramPrjId, paramDplId);
				}
			
			}else if(tabDiv=='dplInfoModify'){
				if(!isDplModifyInfoSelected){
					
					fnSelectDplModifyList(paramPrjId, paramDplId);
				}
			
			}else if(tabDiv=='dplRevision'){
				if($.osl.isNull(dpl1002DplReqRevsionDataTable)){
					
					fnDplAssignReqTableSetting(paramPrjId, paramDplId, "dpl1002ReqRevsionTable");
					
					fnDplReqRevsionTabSetting();
					repositorySetting();
				}
				
			
			}else if(tabDiv=='dplAssignReq'){
				if($.osl.isNull(dpl1002DplReqDataTable)){
					fnDplAssignReqTableSetting(paramPrjId, paramDplId, "dpl1002DplReqTable");
				}
			}
			
		});
		
		
		if(tabType == "sign") {
			$('a[data-toggle="tab"][data-tab-id="dplInfoSign"]').click();	
		}
		
		
		$('.frDpl1002').on("click", "div[data-usr-popup=open]", function(){
			var usrId = $(this).data("user-id");
			if(!$.osl.isNull(usrId)){
				
				$.osl.user.usrInfoPopup(usrId);
			}	
		});
		
		
		$("#dplChgHistoryTab").on("click", "span.osl-update-info-folding-hover", function(e){
			var num = $(this).data("num");
			var modifyInfo = dplModifyList[num];
			
			
			var preDetailVal = modifyInfo.preDetailVal;
			var chgDetailVal = modifyInfo.chgDetailVal;
			
			
			if($.osl.isNull(preDetailVal)){
				preDetailVal = "";
			}
			if($.osl.isNull(chgDetailVal)){
				chgDetailVal = "";
			}
			
			
			var dmp = new diff_match_patch();
			var diff = dmp.diff_main(preDetailVal, chgDetailVal);
			dmp.diff_cleanupEfficiency(diff);
			
			var oldVal = '';
			var newVal = '';
			
			
			for (var i = 0, j = diff.length; i < j; i++) {
		        var arr = diff[i];
		        if (arr[0] == 0) {	
		            oldVal += arr[1];
		            newVal += arr[1];
		        } else if (arr[0] == -1) { 
		            oldVal += "<span class='osl-code__text-remove'>" + $.osl.escapeHtml(arr[1]) + "</span>";
		        } else { 
		            newVal += "<span class='osl-code__text-add'>" + $.osl.escapeHtml(arr[1]) + "</span>";
		        }
		    }
			
			oldVal = '<span class="osl-word-break--break-all">'+ oldVal + '</span>'
			newVal = '<span class="osl-word-break--break-all">'+ newVal + '</span>'
			
			
			$("#preDetailVal").html(oldVal);
			$("#chgDetailVal").html(newVal);
		});
		
		
		fnKtScrollInit("#dpl1002RevisionFileTree", "260");
		fnKtScrollInit("#osl-tab-content__scroll", "550");
		fnKtScrollInit('#dplPopModifyHisFrame');
		fnKtScrollInit('#preDetailVal', "190");
		fnKtScrollInit('#chgDetailVal', "190");
		
		
		fnCheckRfrTarget(paramDplId, paramPrjId);
		
	}; 
	
	
	var fnCheckRfrTarget = function(paramDplId, paramPrjId) {
		
		
		var ajaxObj = new $.osl.ajaxRequestAction({"url":"/dpl/dpl1000/dpl1000/updateDpl1000CheckRfrAjax.do" , "loadingShow": false},
				{dplId:paramDplId, paramPrjId:paramPrjId});
		
		ajaxObj.setFnSuccess(function(data){
			
    	});
		
		ajaxObj.send();
	}
	
	
	var fnSignBtnSetting = function(){
		var dplSignUseCd = $("#dplSignUseCd").val();
		
		
		var signTypeCd = $("#signTypeCd").val();
		
		
		
		var paramSignTypeCd = $("#paramSignTypeCd").val();
		
		if(paramSignTypeCd == null || paramSignTypeCd == "" || paramSignTypeCd == '02'){
			
			if(dplSignUseCd == "01" && !$.osl.isNull(signTypeCd)){
				
				if(signTypeCd == "01"){
					
					var usrId = $.osl.user.userInfo.usrId;
					
					var reqSignUsrId = $("#reqSignUsrId").val();
					
					if(usrId == reqSignUsrId){
						$('#dpl1004SignCancelSubmit').removeClass("kt-hide");
						
						
						$('#dpl1004SignCancelSubmit').click(function(){
							$.osl.confirm($.osl.lang("dpl1002.message.confirm.signCancel"),{html:true}, function(result){
								
								if (result.value) {
									dplSignCancel();
								}
							});
						});
					}
				}
				
				
				if(signTypeCd == "01" || signTypeCd == "02"){
					
					
					var usrId = $.osl.user.userInfo.usrId;
					
					var nextSignUsrId = $("#nextSignUsrId").val();
					
					
					if(usrId == nextSignUsrId){
						$('#dpl1004SignAcceptSubmit').removeClass("kt-hide");
						$('#dpl1004SignRejectSubmit').removeClass("kt-hide");
						
						
						$('#dpl1004SignAcceptSubmit').click(function(){
							$.osl.confirm($.osl.lang("dpl2100.message.confirm.signApr"),{"html" : true},function(result) {
						        if (result.value) {
						        	
						        	
						        	dplSignAccept();
	
						        	
									$.osl.layerPopupClose();
						        	
						        }
						    });
						});
						
						
						$('#dpl1004SignRejectSubmit').click(function(){
							var data = {
									type : "signRjt"
							};
							var options = {
								modalTitle: $.osl.lang("cmm6602.title.main.signRjtRes"),
								autoHeight: false,
								modalSize: "md",
								callback:[{
									targetId: "cmm6602SaveSubmit",
									actionFn: function(thisObj){
										
							        	var signRes = OSLCmm6602Popup.getSignRes();
										
										
										if($.osl.isNull(signRes)){
											$.osl.alert($.osl.lang("cmm6602.message.notEnterRjtRes"));
											return true;
										}
										
										$.osl.confirm($.osl.lang("cmm6602.message.saveRjtRes"),{"html" : true},function(result) {
									        if (result.value) {
									        	
									        	var type = OSLCmm6602Popup.getType();
									        	
									        	
									        	dplSignReject(signRes);
									        	
									        	
												$.osl.layerPopupClose();
									        	
									        	
									        }
									    });
									}
								}]
							};
							 
							$.osl.layerPopupOpen('/cmm/cmm6000/cmm6600/selectCmm6602View.do',data,options); 
						});
					}
				}
			}
		}
	}
	
	
	var dplSignAccept = function(){
		var rowDatas = [];
		var rowData = {
						signLineId : '${dplInfo.signLineId}',
						signUsrId : $.osl.user.userInfo.usrId,
						lastOrd : '${signInfo.nextOrd}',
						maxOrd : '${signInfo.lastOrd}' 
					}
		rowDatas.push(rowData);
		 
		
 		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dpl/dpl2000/dpl2100/updateDpl2100DplSignAcceptAjax.do'/>"}
				,{rowDatas: JSON.stringify(rowDatas), paramPrjId:'${dplInfo.prjId}'});

 		
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				
 				$.osl.toastr(data.message);
 				
	        	
	        	$.osl.datatable.list[datatableId].targetDt.reload();
 			}
 		});
 		
 		
 		ajaxObj.send();
	};
	
	
	var dplSignReject = function(signRes){
		
 		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dpl/dpl2000/dpl2100/updateDpl2100DplSignRejectAjax.do'/>"}
				,{prjId: '${dplInfo.prjId}',
					dplId: '${dplInfo.dplId}',
					signRes: signRes,
					signLineId: '${signInfo.signLineId}', 
					paramPrjId:'${dplInfo.prjId}'});

 		
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				
 				$.osl.toastr(data.message);
 				
 				$.osl.datatable.list[datatableId].targetDt.reload();
 				
 				
				$.osl.layerPopupClose();
 			}
 		});
 		
 		
 		ajaxObj.send();
	};
	
	
	var dplSignCancel = function(){
		
 		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dpl/dpl2000/dpl2100/updateDpl2100DplSignCancelAjax.do'/>"}
				,{prjId: '${dplInfo.prjId}',
					dplId: '${dplInfo.dplId}',
					signRes: '결재 회수 처리',
					signLineId: '${signInfo.signLineId}', 
					paramPrjId:'${dplInfo.prjId}'});

 		
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				
 				$.osl.toastr(data.message);
 				
 				$.osl.datatable.list[datatableId].targetDt.reload();
 				
 				
				$.osl.layerPopupClose();
 			}
 		});
 		
 		
 		ajaxObj.send();
	};
	
	
	var fnAssignJobDataTableSetting = function(paramPrjId, paramDplId){
		
		
		dpl1002AssignJobTable = $.osl.datatable.setting("dpl1002AssignJobTable",{
			data: {
				source: {
					read: {
						url: "/dpl/dpl3000/dpl3000/selectDpl3000DplJobListAjax.do",
						params : {
							prjId : paramPrjId,
							dplId : paramDplId,
							sprId : sprId,
							sprTypeCd: sprTypeCd,
						}
					}
				},
				pageSize: 5
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [5, 10, 20, 30, 50, 100]
					}
				}
			},
			columns: [
				{field: 'jobStartOrd', title: "실행 순번", textAlign: 'center', width: 60, autoHide: false, search: false, sortable: true, sortField: "jobStartOrd"},
				{field: 'jenNm', title: "Jenkins 명", textAlign: 'center', width: 140, search: true, sortable: true, sortField: "jenNm"},
				{field: 'jenUrl', title: "Jenkins URL", textAlign: 'center', width: 200, search: false, sortable: false},
				{field: 'jobTypeNm', title: "Job Type", textAlign: 'center', width: 60, search: true, sortable: true, searchType:"select", searchCd: "DPL00002", searchField:"jobTypeCd", sortField: "jobTypeCd", sortField: "jobTypeCd"},
				{field: 'jobId', title: "Job Id", textAlign: 'center', width: 130, autoHide: false, search:true, sortable: true, sortField: "jobId"},
				{field: 'jobParameter', title: "Job 매개변수", textAlign: 'center', width: 120
					,template: function(row){
						var jobParameter = row.jobParameter;
						
						if($.osl.isNull(jobParameter)){
							jobParameter = "-";
						}
						return jobParameter;
					}
				},
				{field: 'jobRestoreId', title: "원복 Job Id", textAlign: 'center', width: 130, search: false
					,template: function(row){
						var jobRestoredId = row.jobRestoreId;
						
						if($.osl.isNull(jobRestoredId)){
							jobRestoredId = "-";
						}
						return jobRestoredId;
					}
				}
			],
			actionBtn:{
				"click":false,
				"dblClick":false,
				"insert":false,
				"update":false,
				"delete":false
			}
		});
	};
	
	
	var fnDplAssignReqTableSetting = function(paramPrjId, paramDplId, dataTableId){
		
		
		var reqRevisionConfig = {
				actionBtn:{
					"title" : $.osl.lang("datatable.action.functionNm"),
					"width" : 120,
					"click": true,
					"dblClick": true,
					"insert": false,
					"delete": false,
					"update": false
				},
				actionTooltip:{
					"click": $.osl.lang("dpl1002.reqDatatable.tooltip.selectRevision"),
					"dblClick": $.osl.lang("dpl1002.reqDatatable.tooltip.detailReq")
				},
				actionFn:{
					"click":function(rowData, datatableId, type, rowNum, elem){
						
						selectReqId = rowData.reqId;
						
						processId = rowData.processId;
						
						if(dpl1002RepositoryListTable != null){
							
							dpl1002RepositoryListTable.targetDt.setDataSourceQuery({});
							
							dpl1002RepositoryListTable.targetDt.setDataSourceParam("reqRepInfo", "Y");
							dpl1002RepositoryListTable.targetDt.setDataSourceParam("prjId", rowData.prjId);
							dpl1002RepositoryListTable.targetDt.setDataSourceParam("reqId", selectReqId);
							dpl1002RepositoryListTable.targetDt.setDataSourceParam("sprId", sprId);
							dpl1002RepositoryListTable.targetDt.setDataSourceParam("sprTypeCd", sprTypeCd);
							
							$("button[data-datatable-id=dpl1002RepositoryListTable][data-datatable-action=select]").click();
						}else{
							
							repositorySetting();
						}
					},
					"dblClick":function(rowData, datatableId, type, rowNum, elem){
						var data = {
								paramPrjId: rowData.prjId,
								paramReqId: rowData.reqId,
								paramReqUsrId: rowData.reqUsrId
							};
						var options = {
								idKey: rowData.reqId,
								modalTitle: $.osl.lang("req4102.title.assignReq"),
								autoHeight: false,
								modalSize: 'fs',
								ftScrollUse: false
							};
						
						
						if(rowData.reqProType == "01" || rowData.reqProType == "03"){
							data.reqProType = rowData.reqProType;
							options.modalSize = "lg";
							$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4102View.do',data,options);
						}else{
							
							$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6203View.do',data,options);
						}
					}
				}
		};
		
		
		var defReqTableConfig = {
				data: {
					source: {
						read: {
							url: "/dpl/dpl1000/dpl1100/selectDpl1100AssReqListAjax.do",
							params:{
								prjId : paramPrjId,
						    	dplId : paramDplId,
						    	sprId: sprId,
						    	sprTypeCd : sprTypeCd,
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
					{field: 'rn', title: 'No.', textAlign: 'center', width: 80, sortField: "rn", sortable: false},
					{field: 'reqGrpNo', title: '그룹 요구사항 번호', textAlign: 'center', width: 110, autoHide: false, search: true,
						template: function(row){
							var reqGrpNo = $.osl.escapeHtml(row.reqGrpNo);
							
							if($.osl.isNull(reqGrpNo)){
								reqGrpNo = "-";
							}
							return reqGrpNo;
						}
					},
					{field: 'reqGrpNm', title: '그룹 요구사항 명', textAlign: 'left', width: 110, search: true,
						template: function(row){
							var reqGrpNm = $.osl.escapeHtml(row.reqGrpNm);
							
							if($.osl.isNull(reqGrpNm)){
								reqGrpNm = "-";
							}
							return reqGrpNm;
						}
					},
					{field: 'reqOrd', title: '요청번호', textAlign: 'center', width: 80, autoHide: false, search: true},
					{field: 'reqProTypeNm', title: '처리유형', textAlign: 'center', width: 80, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProType", sortField: "reqProType"},
					{field: 'reqNm', title: '요청 제목', textAlign: 'left', width: 200, autoHide: false, sortField: "reqNm", search:true,
						template: function(row){
							var resultStr = $.osl.escapeHtml(row.reqNm);
							
							if(row.reqPw == "Y"){
								resultStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
							}
							return resultStr;
						}
					},
					{field: 'reqUsrNm', title: '요청자', textAlign: 'center', width: 150, search: true,
						template: function (row) {
							return $.osl.user.usrImgSet(row.reqUsrImgId, row.reqUsrNm);
						},
						onclick: function(rowData){
							$.osl.user.usrInfoPopup(rowData.reqUsrId);
						}
					},
					{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 120, sortField: "reqDtm",
						template: function (row) {
							var paramDatetime = new Date(row.reqDtm);
			                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
			                return agoTimeStr.agoString;
						}
					},
					{field: 'regDtm', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"daterange",
						template: function (row) {
							return new Date(row.regDtm).format("yyyy-MM-dd");
						}
					},
					{field: 'reqUsrEmail', title: '요청자 e-mail', textAlign: 'center', width: 150, search: true},
					{field: 'reqUsrDeptNm', title: '요청자 조직', textAlign: 'center', width: 300, sortable: false},
					{field: 'reqUsrNum', title: '요청자 연락처', textAlign: 'center', width: 100, search: true},
					{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 150, search: true,
						template: function (row) {
							var reqChargerNm = row.reqChargerNm;
							
							if(!$.osl.isNull(reqChargerNm)){
								reqChargerNm = $.osl.user.usrImgSet(row.reqChargerImgId, row.reqChargerNm)
							}else{
								reqChargerNm = "-";
							}
							
							return reqChargerNm;
						},
						onclick: function(rowData){
							$.osl.user.usrInfoPopup(rowData.reqChargerId);
						}
					},
					{field: 'reqChargerEmail', title: '담당자 e-mail', textAlign: 'center', width: 100, search: true,
						template: function (row) {
							var reqChargerEmail = row.reqChargerEmail;
							
							if($.osl.isNull(reqChargerEmail)){
								reqChargerEmail = "-";
							}
							return reqChargerEmail;
						}
					},
					{field: 'processNm', title: '프로세스 명', textAlign: 'center', width: 100, search: false,
						template: function (row) {
							var processNm = row.processNm;
							
							if($.osl.isNull(processNm)){
								processNm = "-";
							}
							return processNm;
						}
					},
					{field: 'flowNm', title: '단계 명', textAlign: 'center', width: 100, search: false,
						template: function (row) {
							var flowNm = row.flowNm;
							
							if($.osl.isNull(flowNm)){
								flowNm = "-";
							}
							return flowNm;
						}
					},
					{field: 'reqStDuDtm', title: '작업 시작 예정일', textAlign: 'center', width: 100, search: false,
						template: function (row) {
							var reqStDuDtm = row.reqStDuDtm;
							
							if($.osl.isNull(reqStDuDtm)){
								reqStDuDtm = "-";
							}
							return reqStDuDtm;
						}
					},
					{field: 'reqEdDuDtm', title: '작업 종료 예정일', textAlign: 'center', width: 100, search: false,
						template: function (row) {
							var reqEdDuDtm = row.reqEdDuDtm;
							
							if($.osl.isNull(reqEdDuDtm)){
								reqEdDuDtm = "-";
							}
							return reqEdDuDtm;
						}
					},
					{field: 'reqStDtm', title: '실제 작업 시작일', textAlign: 'center', width: 140, search: false,
						template: function (row) {
							var reqStDtm = row.reqStDtm;
							
							if($.osl.isNull(reqStDtm)){
								reqStDtm = "-";
							}
							return reqStDtm;
						}
					},
					{field: 'reqEdDtm', title: '실제 작업 종료일', textAlign: 'center', width: 140, search: false,
						template: function (row) {
							var reqEdDtm = row.reqEdDtm;
							
							if($.osl.isNull(reqEdDtm)){
								reqEdDtm = "-";
							}
							return reqEdDtm;
						}	
					},
				],
				actionBtn:{
					"title" : $.osl.lang("datatable.action.functionNm"),
					"width" : 120,
					"click": false,
					"dblClick": true,
					"insert": false,
					"delete": false,
					"update": false,
				},
				actionTooltip:{
					"dblClick": $.osl.lang("dpl1002.reqDatatable.tooltip.detailReq"),
				},
				actionFn:{
					"dblClick":function(rowData, datatableId, type, rowNum, elem){
						var data = {
								paramPrjId: rowData.prjId,
								paramReqId: rowData.reqId,
								paramReqUsrId: rowData.reqUsrId
							};
						var options = {
								idKey: rowData.reqId,
								modalTitle: $.osl.lang("dpl1002.title.modal.detailReq"),
								autoHeight: false,
								modalSize: 'fs',
								ftScrollUse: false
							};
						
						
						if(rowData.reqProType == "01" || rowData.reqProType == "03"){
							data.reqProType = rowData.reqProType;
							options.modalSize = "lg";
							$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4102View.do',data,options);
						}else{
							
							$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6203View.do',data,options);
						}
					}
				}
			};
		
		
		if(dataTableId == "dpl1002DplReqTable"){
			dpl1002DplReqDataTable = $.osl.datatable.setting("dpl1002DplReqTable", defReqTableConfig);
		
		}else if(dataTableId == "dpl1002ReqRevsionTable"){
			var targetConfig = $.extend(true, defReqTableConfig, reqRevisionConfig);
			dpl1002DplReqRevsionDataTable = $.osl.datatable.setting("dpl1002ReqRevsionTable", targetConfig);	
		}
	};
	
	
	var repositorySetting = function(){
		
		dpl1002RepositoryListTable = $.osl.datatable.setting("dpl1002RepositoryListTable",{
			data:{
				source:{
					read:{
						url: "/stm/stm8000/stm8100/selectStm8100AssStrgListAjax.do",
						params:{
							"reqRepInfo" : "Y",
							prjId : $("#paramPrjId").val(),
							reqId : selectReqId
						}
					}
				},
				pageSize: 5
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [5, 10, 20, 30, 50, 100]
					}
				}
			},
			columns:[
				{field: 'strgTypeNm', title: '유형', textAlign: 'left', width: 30, search: true, searchType:"select", searchCd: "STM00004", searchField:"strgTypeCd", sortField: "strgTypeCd"},
				{field: 'strgRepTitle', title: '저장소명', textAlign: 'left', width: 100, search: true},
				{field: 'strgRepUrl', title: '저장소 URL', textAlign: 'left', width: 170},
				{field: 'strgTxt', title: '저장소 설명', textAlign: 'left', width: 100, search: true},
			],
			actionBtn:{
				"title" : $.osl.lang("datatable.action.functionNm"),
				"update" : false,
				"delete" : false,
				"click": true,
				"autoHide": true
			},
			actionTooltip:{
				"click" : $.osl.lang("dpl1002.repositoryListDatatable.tooltip.selectRow")
			},
			actionFn:{
				"click": function(rowData, datatableId, type, rowNum, elem){
					
					repositoryId = rowData.strgRepId;
					
					revisionNum = "";
					
					
					var connectionResult = false;
					
					
					strgConnectionCheck(repositoryId, function(result){
						connectionResult = result;
					});
					
					
					if(!connectionResult){
						
						coverSwitch("all", false);
						return false;
					}else{
						
						
						fnSourceRepositoryAuthCheck(repositoryId);
						
						
						if(revisionAuthFlag){
							
							coverSwitch("revisionList", true);
						}else{
							$.osl.alert($.osl.lang("dpl1002.message.alert.notAuthRevision"));
							
							coverSwitch("all", false);
							return false;
						}
					}
					
					
					if(dpl1002ReivisionListTable != null){
						
						dpl1002ReivisionListTable.targetDt.setDataSourceQuery({});
						
						
						dpl1002ReivisionListTable.targetDt.setDataSourceParam("paramPrjId", $("#paramPrjId").val());
						dpl1002ReivisionListTable.targetDt.setDataSourceParam("paramStrgRepId", repositoryId);
						dpl1002ReivisionListTable.targetDt.setDataSourceParam("paramProId", processId);
						dpl1002ReivisionListTable.targetDt.setDataSourceParam("paramReqId", selectReqId);
						
						$("button[data-datatable-id=dpl1002ReivisionListTable][data-datatable-action=select]").click();
						
					}else{
						
		   		  		
		   		  		fnDplReqRevsionTabSetting();
					}
				}
			},callback:{
				ajaxDone: function(evt, list){
					repositoryId = null;
					
					if(!$.osl.isNull(selectReqId)){
						
						$("#repositotyMaskText").text($.osl.lang("dpl1002.phrases.noRepositoryData"));
					}
					
					if($.osl.isNull(list) || list.length == 0){
						
						coverSwitch("repasitoryListMask", false);
					}else{
						coverSwitch("repasitoryListMask", true);
					}
					
				}
			}
		});
	};
	
	
	var strgConnectionCheck = function(strgRepId, callbackFn){
		var data = {
				strgRepId : strgRepId
		};
		
		
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000RepoConnectCheckAjax.do'/>", "async": false}
   				, data);
		
   		
   		ajaxObj.setFnSuccess(function(data){
   			var rtnValue = true;
   			if(data.connectResult != "SVN_OK" || data.errorYn == "Y"){
				$.osl.alert($.osl.lang("dpl1002.message.alert.failConnectRepository"));
				rtnValue = false;
			}
   			
   			
   			callbackFn(rtnValue);
   			
   		});
  	 	
   		ajaxObj.send();
	};
	
	
	var fnDplReqRevsionTabSetting = function(){
		
    	dpl1002ReivisionListTable = $.osl.datatable.setting("dpl1002ReivisionListTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1100/selectPrj1100ReqRepRevisionListAjax.do",
					}
				},
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [5, 10, 20, 30, 50, 100]
					}
				}
			},
			columns:[
				{field: 'strgRepTitle', title: '저장소 명', textAlign: 'left', width: 100, autoHide: false, sortable: false,
					template : function(row){
						if($.osl.isNull(row.strgRepTitle)){
							return "-";
						}else{
							return row.strgRepTitle;
						}
					},
				},
				{field: 'revisionNum', title: '리비전', textAlign: 'center', width: 80, autoHide: false, sortable: false},
				{field: 'revisionComment', title: '내용', textAlign: 'left', width: 200, sortable: false, search:true,
					template : function(row){
						if($.osl.isNull(row.revisionComment)){
							return "-";
						}else{
							return row.revisionComment;
						}
					},
				}
			],
			actionBtn:{
				"title" : $.osl.lang("datatable.action.functionNm"),
				"width" : 80,
				"dblClick": false,
				"delete": false,
				"update":false,
				"click":true,
			},
			actionTooltip:{
				"click" : $.osl.lang("dpl1002.reivisionListDatatable.tooltip.selectRow")
			},
			actionFn:{
				"click": function(rowData, datatableId, type, rowNum, elem){
					
					revisionNum = rowData.revisionNum;
					repositoryId = rowData.strgRepId;
					repositoryTypeCd = rowData.strgTypeCd;
					
					
					fnSourceRepositoryAuthCheck(repositoryId);
					
					
					if(fileCodeAuthFlag){
						
						
						$("#selRevisionNum").text("["+revisionNum+"] ");
						
						
						coverSwitch("revisionFileList", true);
						
	    				
	    				dpl1002RevisionTreeObj.jstree().settings.data.param = {
	    					selectFileDirType : "dir",
	    					strgRepId : repositoryId,
	    					revision : revisionNum
	    				};
						
						
						$("button[data-tree-id=dpl1002RevisionFileTree][data-tree-action=select]").click();
						
						
						var dataTable = $.osl.datatable.list["dpl1002RevisionFileTable"].targetDt;
						dataTable.setDataSourceParam("revision",revisionNum);
						dataTable.setDataSourceParam("strgRepId",repositoryId);
						$("button[data-datatable-id=dpl1002RevisionFileTable][data-datatable-action=select]").click();
					}
					else{
						$.osl.alert($.osl.lang("dpl1002.message.alert.notAuthRevisionFile"));
						
						coverSwitch("revisionFileList", false);
					}
				},				
			},
			theme:{
				actionBtnIcon:{
					"click" : "fa fa-check-square",
				}
			},
			callback:{
				initComplete : function(evt, config){
					
					dirTreeSetting();
				},
				ajaxDone : function(evt, list){
					
					if($.osl.isNull(revisionNum)){
						coverSwitch("revisionFileList", false);
					}
				}
			}
		});
	};
	 
	 
	 var dirTreeSetting = function(){
    	
    	dpl1002RevisionTreeObj = $.osl.tree.setting("dpl1002RevisionFileTree",{
			data:{
				url:"<c:url value='/stm/stm8000/stm8000/selectStm8000DirListAjax.do'/>",
				key: "currentKey",
				
				pKey: "parentKey",
				
				labelKey: "name",
				param:{
					selectFileDirType : "dir",
					strgRepId : repositoryId,
					revision : revisionNum
				}
			},
			search:{
				
				case_insensitive : true,
				
				show_only_matches: true,
				
				show_only_matches_children: true,
			},
			callback:{
				onclick: function(treeObj, selNode){
					
					
					var dataTable = $.osl.datatable.list["dpl1002RevisionFileTable"].targetDt;
					dataTable.setDataSourceParam("strgRepId", repositoryId);
					dataTable.setDataSourceParam("revision", revisionNum);
					dataTable.setDataSourceParam("filePath", selNode.original.key);
					
					
					$("button[data-datatable-id=dpl1002RevisionFileTable][data-datatable-action=select]").click();
				}
			}
		});
    	
		
		$.osl.datatable.setting("dpl1002RevisionFileTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm8000/stm8000/selectStm8000FileListAjax.do",
						params : {
							selectFileDirType : "file",
						}
					}
				},
				pageSize: 7
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [7, 10, 20, 30, 50, 100],
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 3
							},
							tablet:{
								layout: 'default',
								pagesNumber: 1
							},
							mobile:{
								layout: 'default',
								pagesNumber: 1
							}
						}
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 15, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'type', title: '유형', textAlign: 'center', width: 80, autoHide: false, sortable: false},
				{field: 'name', title: '파일명', textAlign: 'left', width: 300, autoHide: false, search: true},
			],
			actionBtn:{
				"title" : $.osl.lang("datatable.action.functionNm"),
				"insert" : false,
				"update" : false,
				"delete" : false,
				"dblClick" : true,
				"detail": true,
				"click": true,
				"diff" : true,
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("dpl1002.revisionFileDatatable.tooltip.sourceCode"),
				"diff" : $.osl.lang("dpl1002.revisionFileDatatable.tooltip.sourceCodeDiff")
			},
			actionFn:{
				"click":function(rowData, datatableId, type, rowNum, elem){
					var datatable = $.osl.datatable.list[datatableId].targetDt;
					
					
					var targetCheckRow = datatable.row("[data-row="+rowNum+"]").nodes();
					var target = targetCheckRow.find("label.kt-checkbox").children("input[type=checkbox]");
					if(target.length > 0){
						if(target.is(":checked") == true){
							
							datatable.setActiveAll(false);
							
							target.prop("checked", true);
							datatable.setActive(target);
						}else{
							
							targetCheckRow.removeClass("osl-datatable__row--selected");
							targetCheckRow.addClass("kt-datatable__row--even");
						}
					}
				},
				"detail": function(rowDatas, datatableId, type, rowNum){
					var rowData;
					if(type == "list"){
						if(rowNum != 1){
							$.osl.alert($.osl.lang("cmm6800.revisionFile.message.selectOne", rowNum));
							return false;
						}else{
							rowData = rowDatas[0];
						}
					}else{
						rowData = rowDatas;
					}
					
					var data = {
							type : repositoryTypeCd,
							path: rowData.path,
							revision : revisionNum,
							strgRepId : repositoryId
						};
					var options = {
						idKey:"fileCode_"+revisionNum,
						modalTitle: "[Revision "+revisionNum+"] "+ rowData.name,
						autoHeight: false,
						ftScrollUse: false
					};
					
					if(fileCodeAuthFlag){
						$.osl.layerPopupOpen('/cmm/cmm6000/cmm6800/selectCmm6801View.do',data,options);
					}else{
						$.osl.alert($.osl.lang("cmm6800.message.auth"));
						return false;
					}
				},
				"dblClick": function(rowData){
					var data = {
						type : repositoryTypeCd,
						path: rowData.path,
						revision : revisionNum,
						strgRepId : repositoryId
					};
					var options = {
						idKey:"fileCode_"+revisionNum,
						modalTitle: "[Revision "+revisionNum+"] "+ rowData.name,
						autoHeight: false,
						ftScrollUse: false
					};
					
					if(fileCodeAuthFlag){
						$.osl.layerPopupOpen('/cmm/cmm6000/cmm6800/selectCmm6801View.do',data,options);
					}else{
						$.osl.alert($.osl.lang("cmm6800.message.auth"));
						return false;
					}
				},
				"diff":function(rowDatas, datatableId, type, rowNum){
					var rowData;
					
					
					if(type == "list"){
						if(rowNum != 1){
							$.osl.alert($.osl.lang("cmm6800.revisionFile.message.selectOne", rowNum), {"type":"warning"});
							return false;
						}else{
							rowData = rowDatas[0];
						}
					}else{
						
						rowData = rowDatas;
					}
					
					var data = {
						type : repositoryTypeCd,
						path: rowData.path,
						revision : revisionNum,
						strgRepId : repositoryId,
						searchStNum : "",
						searchEdNum : "",
						name : rowData.name,
					};
					var options = {
						idKey:"cmm6800_diff",
						modalTitle: "[Revision. "+revisionNum+"] "+rowData.name,
						autoHeight: false,
					};

					if(fileCodeAuthFlag){
						$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8003View.do',data,options);
					}else{
						$.osl.alert($.osl.lang("cmm6800.message.auth"));
						return false;
					}
				}
			},
			theme:{
				 actionBtn:{
					 "click": " kt-hide",
					 "detail" : " kt-hide",
					 "dblClick": "",
					 "diff" : "",
				 },
				 actionBtnIcon:{
					"click": "fa flaticon2-check-mark",
    				"detail": "fas fa-external-link-alt",
    				"dblClick": "fas fa-external-link-alt",
    				"diff": "fas fa-code",
    			}
			}
		});
	};
	
	
	
	 var fnSelectDplModifyList = function(paramPrjId, paramDplId) {
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dpl/dpl1000/dpl1000/selectDpl1000DplModifyListAjax.do'/>"}
				,{"paramPrjId": paramPrjId, "dplId" : paramDplId, "sprId":sprId, "sprTypeCd":sprTypeCd});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
				dplModifyList = data.dplModifyHistoryList;
				
				
				fnDplModifyHistorySetting(dplModifyList);
				
				
				KTApp.initTooltips();
			}
		});
		
		
		ajaxObj.send();
	};
	
	
	 var fnSelectDplHistoryInfo = function(paramPrjId, paramDplId) {
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dpl/dpl1000/dpl1000/selectDpl1000DplHistoryListAjax.do'/>"}
				,{"prjId": paramPrjId, "dplId" : paramDplId, "sprId":sprId,"sprTypeCd":sprTypeCd});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
				var jobList = data.jobList;
				
				var bldHistoryList = data.dplAllBldHistoryList;
				
				var signHistoryList = data.dplSignHistoryList;
				
				var allHistiryList = bldHistoryList.concat(signHistoryList);
				
				allHistiryList.sort(function(a, b) { 
				    return b["regDtm"] - a["regDtm"];
				});
				
				
				fnAllHistorySetting(allHistiryList, jobList);
				
				
				
				
				
				
					
				
				
				
				
				$(".osl-ribbon__btn[data-bld-info='console']").on("click", function(){
			    	
			    	fnConsoleLogPopupOpen($(this));
			   });
				
				
				KTApp.initTooltips();
			}
		});
		
		
		ajaxObj.send();
	};
	
	
	var fnDplModifyHistorySetting = function(dplModifyList){
		
		var dplModifyDetailStr = '';
		
		var dplDetailContent = '';
		
		var prevChgDetailId = '';
		
		
		$.each(dplModifyList, function(idx, map){
			
			var chgDetailNm = $.osl.lang(map.chgDetailLng);
			if($.osl.isNull(chgDetailNm)){
				chgDetailNm = map.chgDetailNm;
			}
			
			
			if(map.comSubCd == '09') {
				dplDetailContent += '<span class="kt-padding-l-10 osl-update-info-folding-hover osl-cursor--pointer" data-num="'+idx+'"><i class="fas fa-edit kt-margin-r-5"></i>'+chgDetailNm+'(이)가 입력되었습니다.</span>';
			
			} else if (map.comSubCd == '10') {
				dplDetailContent += '<span class="kt-padding-l-10 osl-update-info-folding-hover osl-cursor--pointer" data-num="'+idx+'"><i class="fas fa-edit kt-margin-r-5"></i>'+chgDetailNm+'(이)가 수정되었습니다.</span>';
			} else {
				return false;
			}
			
			if((dplModifyList.length-1) == idx || map.chgDetailId != dplModifyList[idx+1].chgDetailId){
				
				
				var agoTimeStr = $.osl.datetimeAgo(map.regDtm, {fullTime: "d", returnFormat: "yyyy-MM-dd HH:mm:ss"});
				
				
				dplModifyDetailStr 	+= '<div class="kt-portlet">'
										+ '<div class="kt-portlet__head kt-padding-t-10 kt-padding-b-10 osl-min-h-px-imp--30">'
											+ '<div class="kt-portlet__head-label">'
												+ '<div class="kt-user-card-v2 btn">'
													+ '<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
														+ '<img class="" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId='+map.chgUsrImgId+'" onerror=""/>'
													+ '</div>'
													+ '<div class="kt-user-card-v2__details" data-usr-popup="open" data-usr-id="'+map.chgUsrId+'">'
														+ '<span class="kt-user-card-v2__name text-left">'+map.chgUsrNm+'</span>'
														+ '<div class="osl-email">'+map.chgUsrEmail+'</div>'
													+ '</div>'
												+ '</div>'
											+ '</div>'
											+ '<div class="kt-portlet__head-toolbar text-muted align-items-center">'
												+ agoTimeStr.agoString
											+ '</div>'
										+ '</div>'
										+ '<div class="kt-portlet__body kt-padding-t-10 kt-padding-b-10 osl-min-h-px-imp--30 align-items-baseline">'
											+ dplDetailContent
										+ '</div>'
									+ '</div>';
									
				dplDetailContent = '';
			}
			
			
			prevChgDetailId = map.chgDetailId;
		});
		
		$("#dplPopModifyHisFrame").html(dplModifyDetailStr);
		
		isDplModifyInfoSelected = true;
	}
	
	
	var fnAllHistorySetting = function(allHistiryList, jobList){
		
		$.each(allHistiryList,function(idx, map){
			
			var paramDateTime = new Date(map.regDtm);
            var agoTimeStr = $.osl.datetimeAgo(paramDateTime, {fullTime: "d", returnFormat: "yyyy-mm-dd"});
			
			if(map.type == "BLD"){
				
				var bldTimelineDiv ='';
				
				var prjId = map.prjId;
				var dplId = map.dplId;
				var jenId = map.jenId;
				var jobId = map.jobId;
				var bldSeq = map.bldSeq;
				
				var bldResult = map.bldResult;
				
				var itemPosition = '';
				
				var itemColor = '';
				
				var itemIconPosition = '';
				
				var iconImg = '';
				
				var badgeColor = '';
				
				var bldBadge = '';
				
				var bldTitle = '';
				
				var signRes = '';
				
				var bldUsrId = $.osl.escapeHtml(map.regUsrId);
				
				var bldUsrNm = $.osl.escapeHtml(map.regUsrNm);
				
				var bldUsrEmail = $.osl.escapeHtml(map.regUsrEmail);
				
				var bldUsrImgId = $.osl.escapeHtml(map.regUsrImgId);
				
				var dtmMargin = 'kt-margin-r-10';
				
				var bldResultMsg = '';
				
				var cardType = '';
				
				
				if(bldResult == "PROGRESS"){
					iconImg = "fa-sync-alt kt-font-brand";
					bldTitle = "["+$.osl.escapeHtml(map.jobTypeNm)+"-"+map.bldNum+"] "+$.osl.escapeHtml(map.jobId);
					bldResultMsg = $.osl.escapeHtml(map.bldResultMsg);
					cardType = '2';
					
				
				}else if(bldResult == "START"){
					return;
					
				
				}else if(bldResult == "FAILURE"){
					itemPosition = "osl-timeline-item-right";
					itemColor = "kt-timeline__item--danger ";
					dtmMargin = 'kt-margin-l-10';
					iconImg = "fa-times kt-font-danger";
					bldBadge = $.osl.lang("dpl1002.label.buildFail");
					bldTitle = "["+$.osl.escapeHtml(map.jobTypeNm)+"-"+map.bldNum+"] "+$.osl.escapeHtml(map.jobId);
					badgeColor = "badge-danger";
					bldResultMsg = $.osl.escapeHtml(map.bldResultMsg);
					cardType = '1';
				
				}else if(bldResult == "SUCCESS"){
					itemPosition = "osl-timeline-item-left";
					itemColor = "kt-timeline__item--success ";
					itemIconPosition = "flex-row-reverse-desktop";
					iconImg = "fa-check kt-font-success";
					bldBadge = $.osl.lang("dpl1002.label.buildSuccess");
					bldTitle = "["+$.osl.escapeHtml(map.jobTypeNm)+"-"+map.bldNum+"] "+$.osl.escapeHtml(map.jobId);
					badgeColor = "badge-success";
					cardType = '1';
				
				}else if(bldResult == "STOPING"){
					iconImg = "fa-sync-alt kt-font-brand";
					bldTitle = "["+$.osl.escapeHtml(map.jobTypeNm)+"-"+map.bldNum+"] "+$.osl.escapeHtml(map.jobId);
					bldResultMsg = $.osl.escapeHtml(map.bldResultMsg);
					cardType = '2';
				
				}else if(bldResult == "ABORTED"){
					itemPosition = "osl-timeline-item-right";
					itemColor = "kt-timeline__item--danger ";
					dtmMargin = 'kt-margin-l-10';
					iconImg = "fa-times kt-font-danger";
					bldBadge = $.osl.lang("dpl1002.label.buildStop");
					bldTitle = "["+$.osl.escapeHtml(map.jobTypeNm)+"-"+map.bldNum+"] "+$.osl.escapeHtml(map.jobId);
					badgeColor = "badge-danger";
					bldResultMsg = $.osl.escapeHtml(map.bldResultMsg);
					cardType = '1';
				
				}else if(bldResult == "RESTORE"){
					iconImg = "fa-sync-alt kt-font-brand";
					bldTitle = "["+$.osl.escapeHtml(map.jobTypeNm)+"-"+map.bldNum+"] "+$.osl.escapeHtml(map.jobId);
					bldResultMsg = $.osl.escapeHtml(map.bldResultMsg);
					cardType = '2';
				}
				
				if(cardType == '1'){
					
					bldTimelineDiv 		+=	'<div class="kt-timeline__item '+itemColor+itemPosition+'">'
										+		'<div class="kt-timeline__item-section '+itemIconPosition+'">'
										+			'<div class="kt-timeline__item-section-border">'
										+				'<div class="kt-timeline__item-section-icon">'
										+					'<i class="fas '+iconImg+'"></i>'
										+				'</div>'
										+			'</div>'
										+			'<span class="kt-timeline__item-datetime '+dtmMargin+'">'+getTimeStamp(map.regDtm)+'</span>'
										+		'</div>'
										+		'<div class="osl-timeline-content osl-ribbon osl-ribbon__top osl-ribbon__ver">'
										+			'<div class="osl-ribbon__target bg-success" style="top: -2px; right: 20px;">'
										+				'<div class="osl-ribbon__btn" title="'+$.osl.lang("dpl1002.tooltip.bldConsoleLog")+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-bld-info="console" data-prj-id='+prjId+' data-dpl-id='+dplId+' data-jen-id='+jenId+' data-job-id='+$.osl.escapeHtml(jobId)+' data-bldseq='+bldSeq+' data-job-type='+$.osl.escapeHtml(map.jobTypeNm)+' data-bldnum='+map.bldNum+' data-job-type='+$.osl.escapeHtml(map.jobTypeNm)+'>'
										+					'<i class="fa fa-code"></i>'
										+				'</div>'
										+				'<div class="osl-ribbon__btn" title="'+$.osl.lang("dpl1002.tooltip.bldChangeHistory")+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">'
										+					'<i class="fas fa-list"></i>'
										+				'</div>'
										+			'</div>'
										+			'<div class="kt-timeline__item-text">'
										+				'<div class="float-left">'
										+					'<div class="badge '+badgeColor+' kt-margin-r-15 float-left">'+bldBadge+'</div>'
										+				'</div>'
										+				'<div class="float-left">'
										+					'<div class="kt-font-bolder">'+bldTitle+'</div>'
										+					'<div class="kt-timeline__item-info">'+bldResultMsg+'</div>'
										+				'</div>'
										+			'</div>'
										+			'<div class="osl-timeline__user-info">'
										+				'<div class="kt-user-card-v2 btn" data-user-id="'+bldUsrId+'" data-usr-popup="open">'
										+					'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
										+						'<img class="" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId='+bldUsrImgId+'" onerror=""/>'
										+					'</div>'
										+					'<div class="kt-user-card-v2__details">'
										+						'<span class="kt-user-card-v2__name text-left">'+bldUsrNm+'</span>'
										+						'<div class="osl-email">'+bldUsrEmail+'</div>'
										+					'</div>'
										+				'</div>'
										+			'</div>'
										+		'</div>'
										+	'</div>'
				
				}
				else if(cardType == '2'){
					
					
					bldTimelineDiv 		+=	'<div class="kt-timeline__item kt-timeline__item--brand osl-timeline-item-center kt-padding-t-20">'
										+		'<div class="kt-timeline__item-section">'
										+			'<div class="kt-timeline__item-section-border">'
										+				'<div class="kt-timeline__item-section-icon">'
										+					'<i class="fas '+iconImg+'"></i>'
										+				'</div>'
										+			'</div>'
										+			'<span class="kt-timeline__item-datetime '+dtmMargin+'">'+getTimeStamp(map.regDtm)+'</span>'
										+		'</div>'
										+		'<div class="osl-timeline-content osl-ribbon osl-ribbon__top osl-ribbon__ver">'
										+			'<div class="kt-timeline__item-text kt-margin-l-0 kt-margin-b-10 kt-padding-20">'
										+				'<span class="kt-font-bolder">'+bldTitle+'</span>'
										+				'<span class="kt-margin-r-15 kt-padding-l-5 float-left">'+bldResultMsg+'</span>'
										+			'</div>'
										+		'</div>'
										+	'</div>'
										
				}
				
				
				$("#allHistoryTab .kt-timeline").append(bldTimelineDiv);
				$("#bldHistoryTab .kt-timeline").append(bldTimelineDiv);
				
			}else if(map.type == "SIG"){
				
				var signTypeCd = map.signTypeCd;
				
				
				if(signTypeCd == '01' ){
					
					
					drawSignInfoCard(map, 2);
					
					drawSignInfoCard(map, 1);
				
				}else if(signTypeCd == '02'){
					
					
					drawSignInfoCard(map, 2);
					
					drawSignInfoCard(map, 3);
				
				}else if(signTypeCd == '03'){
					
					
					drawSignInfoCard(map, 4);
				
				}else if(signTypeCd == '04'){
					
					
					drawSignInfoCard(map, 5);
				
				}else if(signTypeCd == "05"){
		
					
					drawSignInfoCard(map, 6);
				}
			}	
		});
		
		var dplTimelineDiv = '';
		$.each(jobList, function(idx, jobInfo){
			dplTimelineDiv +=	'<div class="kt-timeline__item kt-timeline__item--brand osl-timeline-item-center kt-padding-t-20">'
							+		'<div class="kt-timeline__item-section">'
							+			'<div class="kt-timeline__item-section-border">'
							+				'<div class="kt-timeline__item-section-icon">'
							+					'<i class="fas fa-edit kt-font-brand"></i>'
							+				'</div>'
							+			'</div>'
							+			'<span class="kt-timeline__item-datetime kt-margin-r-10">'+getTimeStamp(jobInfo.regDtm)+'</span>'
							+		'</div>'
							+		'<div class="osl-timeline-content">'
							+			'<div class="kt-timeline__item-text kt-margin-l-0 kt-padding-20">'
							+				'<span class="kt-margin-r-15 float-left">JOB</span>'
							+				'<span class="kt-font-bolder">'+"["+$.osl.escapeHtml(jobInfo.jobTypeNm)+"] "+$.osl.escapeHtml(jobInfo.jobId)+'</span>'
							+				'<span class="kt-margin-r-15 kt-padding-l-5 float-left">'+$.osl.lang("dpl1002.label.jobAssign")+'</span>'
							+			'</div>'
							+		'</div>'
							+	'</div>';
			
		});
		
		var dplNm = $("#dplNm").val();
		var regDtm = $('#regDtm').val();
		
		dplTimelineDiv +=	'<div class="kt-timeline__item kt-timeline__item--brand osl-timeline-item-center kt-padding-t-20">'
						+		'<div class="kt-timeline__item-section">'
						+			'<div class="kt-timeline__item-section-border">'
						+				'<div class="kt-timeline__item-section-icon">'
						+					'<i class="fas fa-edit kt-font-brand"></i>'
						+				'</div>'
						+			'</div>'
						+			'<span class="kt-timeline__item-datetime kt-margin-r-10">'+getTimeStamp(regDtm)+'</span>'
						+		'</div>'
						+		'<div class="osl-timeline-content">'
						+			'<div class="kt-timeline__item-text kt-margin-l-0 kt-padding-20">'
						+				'<span class="kt-margin-r-15 float-left">'+$.osl.lang("dpl1002.label.dplPlan")+'</span>'
						+				'<span class="kt-font-bolder">'+$.osl.escapeHtml(dplNm)+'</span>'
						+				'<span class="kt-margin-r-15 kt-padding-l-5 float-left">'+$.osl.lang("dpl1002.label.dplCreate")+'</span>'
						+			'</div>'
						+		'</div>'
						+	'</div>';
		
		
		$("#allHistoryTab .kt-timeline").append(dplTimelineDiv);
		$("#bldHistoryTab .kt-timeline").append(dplTimelineDiv);
		$("#dplSignHistoryTab .kt-timeline").append(dplTimelineDiv);
		
		
		isDplHistorySelceted = true;
	};
	
	
	var getTimeStamp = function(time) {
		  var d = new Date(time);
		  var s =
		    leadingZeros(d.getFullYear(), 4) + '-' +
		    leadingZeros(d.getMonth() + 1, 2) + '-' +
		    leadingZeros(d.getDate(), 2) + ' ' +

		    leadingZeros(d.getHours(), 2) + ':' +
		    leadingZeros(d.getMinutes(), 2) + ':' +
		    leadingZeros(d.getSeconds(), 2);

		  return s;
	}
	
	var leadingZeros = function(n, digits) {
		  var zero = '';
		  n = n.toString();

		  if (n.length < digits) {
		    for (var i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
	}
	
	
	var drawSignInfoCard = function(signInfo, type){
		
		
		var itemPosition = '';
		
		var itemColor = '';
		
		var itemIconPosition = '';
		
		var iconImg = '';
		
		var badgeColor = '';
		
		var signType = '';
		
		var signTitle = '';
		
		var signRes = '';
		
		var signUsrId = $.osl.escapeHtml(signInfo.signUsrId);
		
		var signUsrNm = $.osl.escapeHtml(signInfo.signUsrNm);
		
		var signUsrEmail = $.osl.escapeHtml(signInfo.signUsrEmail);
		
		var signUsrImgId = $.osl.escapeHtml(signInfo.signUsrImgId);
		
		var dtmMargin = 'kt-margin-r-10';
		
		
		
		if(type == 1){
			itemPosition = "osl-timeline-item-left";
			itemColor = "kt-timeline__item--dark ";
			itemIconPosition = "flex-row-reverse-desktop";
			iconImg = "fa-edit kt-font-dark";
			signType = $.osl.lang("dpl1002.label.drafting");
			signTitle =  $.osl.lang("dpl1002.label.draftWrite");
			badgeColor = "badge-success";
		
		
		}else if(type == 2){
			itemPosition = "osl-timeline-item-left";
			itemColor = "kt-timeline__item--dark ";
			itemIconPosition = "flex-row-reverse-desktop";
			iconImg = "fa-edit kt-font-dark";
			signType = $.osl.lang("dpl1002.label.signRequest");
			signTitle = $.osl.lang("dpl1002.label.signWaiting");
			var signUsrId = $.osl.escapeHtml(signInfo.nextUsrId);
			signUsrNm = $.osl.escapeHtml(signInfo.nextUsrNm);
			signUsrEmail = $.osl.escapeHtml(signInfo.nextUsrEmail);
			signUsrImgId = $.osl.escapeHtml(signInfo.nextUsrImgId);
			badgeColor = "badge-dark";
			
		
		}else if(type == 3){
			itemPosition = "osl-timeline-item-left";
			itemColor = "kt-timeline__item--success ";
			itemIconPosition = "flex-row-reverse-desktop";
			iconImg = "fa-check kt-font-success";
			signRes = $.osl.escapeHtml(signInfo.signRes);
			signType = $.osl.lang("dpl1002.label.approval");
			signTitle = $.osl.lang("dpl1002.label.signApproval");
			badgeColor = "badge-success";
		
		
		}else if(type == 4){
			itemPosition = "osl-timeline-item-left";
			itemColor = "kt-timeline__item--success ";
			itemIconPosition = "flex-row-reverse-desktop";
			iconImg = "fa-check kt-font-success";
			signRes = $.osl.escapeHtml(signInfo.signRes);
			signType = $.osl.lang("dpl1002.label.approval");
			signTitle = $.osl.lang("dpl1002.label.lastSignApproval");
			badgeColor = "badge-success";
		
		
		}else if(type ==5){
			itemPosition = "osl-timeline-item-right";
			itemColor = "kt-timeline__item--danger ";
			iconImg = "fa-times kt-font-danger";
			signRes = $.osl.escapeHtml(signInfo.signRes);
			signType = $.osl.lang("dpl1002.label.reject");
			signTitle = $.osl.lang("dpl1002.label.signReject");
			badgeColor = "badge-danger";
			dtmMargin = 'kt-margin-l-10';
		
		}else if(type == 6) {
			itemPosition = "osl-timeline-item-right";
			itemColor = "kt-timeline__item--warning ";
			iconImg = "fa-exclamation kt-font-warning";
			signRes = $.osl.escapeHtml(signInfo.signRes);
			signType = $.osl.lang("dpl1002.label.collect");
			signTitle = $.osl.lang("dpl1002.label.signCollect");
			badgeColor = "badge-warning kt-font-light";
			dtmMargin = 'kt-margin-l-10';
		}
		
		
		if($.osl.isNull(signRes)){
			signRes ='';
		}
		
		
		var timelineItemDiv =	'<div class="kt-timeline__item '+itemColor+itemPosition+'">'
							+		'<div class="kt-timeline__item-section '+itemIconPosition+'">'
							+			'<div class="kt-timeline__item-section-border">'
							+				'<div class="kt-timeline__item-section-icon">'
							+					'<i class="fas '+iconImg+'"></i>'
							+				'</div>'
							+			'</div>'
							+			'<span class="kt-timeline__item-datetime '+dtmMargin+'">'+signInfo.signDtm+'</span>'
							+		'</div>'
							+		'<div class="osl-timeline-content">'
							+			'<div class="kt-timeline__item-text">'
							+				'<div class="float-left">'
							+					'<div class="badge '+badgeColor+' kt-margin-r-15 float-left">'+signType+'</div>'
							+				'</div>'
							+				'<div class="float-left">'
							+					'<div class="kt-font-bolder">'+signTitle+'</div>'
							+					'<div class="kt-timeline__item-info">'+signRes+'</div>'
							+				'</div>'
							+			'</div>'
							+			'<div class="osl-timeline__user-info">'
							+				'<div class="kt-user-card-v2 btn" data-user-id="'+signUsrId+'" data-usr-popup="open">'
							+					'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
							+						'<img class="" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId='+signUsrImgId+'" onerror=""/>'
							+					'</div>'
							+					'<div class="kt-user-card-v2__details">'
							+						'<span class="kt-user-card-v2__name text-left">'+signUsrNm+'</span>'
							+						'<div class="osl-email">'+signUsrEmail+'</div>'
							+					'</div>'
							+				'</div>'
							+			'</div>'
							+		'</div>'
							+	'</div>'
		
		
		$("#allHistoryTab .kt-timeline").append(timelineItemDiv);
		$("#dplSignHistoryTab .kt-timeline").append(timelineItemDiv);
	};

	
	var fnConsoleLogPopupOpen = function(targetElmt){
		
	 	
    	var prjId = $(targetElmt).data("prj-id");
    	var dplId = $(targetElmt).data("dpl-id");
    	var jenId = $(targetElmt).data("jen-id");
    	var jobId = $(targetElmt).data("job-id");
    	var jobType = $(targetElmt).data("job-type");
    	var bldNum = $(targetElmt).data("bldnum");
    	var bldseq = $(targetElmt).data("bldseq");
		
    	
    	var data = {
    			prjId : prjId,	
    			dplId : dplId,	
    			jenId : jenId,	
    			jobId : jobId,	
    			bldseq : bldseq	
    	};
    	
		var options = {
				idKey: prjId+"_"+dplId+"_"+jobId+"_consolelog",
				modalTitle: "["+ jobType+"-"+bldNum+"] "+jobId +" "+$.osl.lang("dpl1005.title.main"),
				modalSize: 'xl',
				autoHeight: false,
				closeConfirm: false
			};
		
		$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1005View.do',data,options);
	};
	
	
	var fnSourceRepositoryAuthCheck = function(repositoryId){
		
		var data = {strgRepId : repositoryId};
		
		
    	var ajaxObj = new $.osl.ajaxRequestAction(
	   			{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000AuthCheckAjax.do'/>", "async": false}
				, data);
		
    	
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				var result = data.result;
				
				
				if(result.resultRevision == "Y"){
					revisionAuthFlag = true;
				}else{
					revisionAuthFlag = false;
				}
				
				if(result.resultFileCode == "Y"){
					fileCodeAuthFlag = true;
				}else{
					fileCodeAuthFlag = false;
				}
			}
    	});
    	
		ajaxObj.send();
	};
	
	
	var fnKtScrollInit = function(targetName, targetHeight) {
		KTUtil.scrollInit($(targetName)[0], {
	   		
	        disableForMobile: true, 
	        
	        resetHeightOnDestroy: true, 
	        
	        handleWindowResize: true, 
	        
	        height: targetHeight
	    });
	};
	
	
	var fnRightDivSize = function(){
		var guideSize = $('.modal-body').innerWidth();
		var leftDivSize = $('.osl-tab-icon-group').width();
		$('.osl-tab-content-group').width(guideSize-leftDivSize-30);
	};
	
	
	var coverSwitch = function(target, hide){
		var targetStr = "";
		
		
		if(target === "all"){
			targetStr = "#"+formId+" .osl-div-cover"
		}else{
			targetStr = "#"+formId+" .osl-div-cover[data-cover-target="+target+"]";
		}
		
		
		if(hide){
			$(targetStr).addClass("kt-hide");
		}else{
			$(targetStr).removeClass("kt-hide");
		}
	};
	
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLDpl1002Popup.init();
});
</script>

