<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form class="kt-form" id="frDpl1002">
	<input type="hidden" id="paramPrjId" name="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" id="paramDplId" name="paramDplId" value="${param.paramDplId}">
	<input type="hidden" id="dplSignUseCd" name=""dplSignUseCd"" value="${dplInfo.dplSignUseCd}">
	<input type="hidden" id="regDtm" name="regDtm" value="${dplInfo.regDtm}">
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 osl-bg-none shadow-none" id="dplRecord">
		<div class="kt-portlet__head kt-bg-light">
			<div class="kt-portlet__head-label">
			</div>
			
			<div class="kt-portlet__head-toolbar">
				<ul class="nav nav-pills nav-pills-sm flex-flow--inherit" role="tablist">
					<li class="nav-item">
						<a class="nav-link active text-center" data-toggle="tab" href="#dplInfoTab" data-tab-id="dplInfo" role="tab">배포정보</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-center" data-toggle="tab" href="#allHistoryTab" data-tab-id="dplInfoAll" role="tab">전체 이력</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-center" data-toggle="tab" href="#bldHistoryTab" data-tab-id="dplInfoBuild" role="tab">빌드 이력</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-center" data-toggle="tab" href="#dplSignHistoryTab" data-tab-id="dplInfoSign" role="tab">결재 이력</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-center" data-toggle="tab" href="#dplChgHistoryTab" data-tab-id="dplInfoModify" role="tab">수정 이력</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-center" data-toggle="tab" href="#dplReqRevisionTab" data-tab-id="dplRevision" role="tab">배정 리비전</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-center" data-toggle="tab" href="#dplReqTab" data-tab-id="dplAssignReq" role="tab">배정 요구사항 목록</a>
					</li>
				</ul>
			</div>
			
		</div>
		
		<div class="kt-portlet__body kt-padding-0 kt-padding-t-10">
			<div class="tab-content">
				
				<div class="tab-pane kt-scroll active" id="dplInfoTab" data-tab-id="dplInfo" role="tabpanel">
					<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="dplInfo">
						<div class="kt-portlet__head">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-info-circle kt-margin-r-5"></i>배포 정보
								</h5>
							</div>
						</div>
						<div class="kt-portlet__body">
							
							<div class="row">
								<div class="col-6 kt-padding-r-20">
									<div class="form-group row">
										<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 상태</label>
										<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
											<input class="form-control" type="text" id="dplStsNm" name="dplStsNm" readonly="readonly" value="<c:out value="${dplInfo.dplStsNm}"/>" >
										</div>
									</div>	
								</div>
								<div class="col-6 kt-padding-l-20">
									<div class="form-group row">
										<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 버전</label>
										<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
											<input class="form-control" type="text" id="dplVer" name="dplVer" readonly="readonly" value="<c:out value="${dplInfo.dplVer}"/>" >
										</div>
									</div>	
								</div>
								<div class="col-6 kt-padding-r-20">
									<div class="form-group row">
										<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 명</label>
										<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
											<input class="form-control" type="text" id="dplNm" name="dplNm" readonly="readonly" value="<c:out value="${dplInfo.dplNm}"/>" >
										</div>
									</div>	
								</div>
								<div class="col-6 kt-padding-l-20">
									<div class="form-group row">
										<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-calendar-alt kt-margin-r-5"></i>배포 일자</label>
										<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
											<input class="form-control" type="text" id="dplDt" name="dplDt" readonly="readonly" value="<c:out value="${dplInfo.dplDt}"/>" >
										</div>
									</div>	
								</div>
								<div class="col-6 kt-padding-r-20">
									<div class="form-group row">
										<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-user-cog kt-margin-r-5"></i>배포자</label>
										<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
											<input class="form-control" type="text" id="dplUsrNm" name="dplUsrNm" readonly="readonly" value="<c:out value="${dplInfo.dplUsrNm}"/>" >
										</div>
									</div>
								</div>
								<div class="col-6 kt-padding-l-20">	
									<div class="form-group row">
										<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-file-signature kt-margin-r-5"></i>결재 사용 유무</label>
										<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
											<input class="form-control" type="text" id="dplSignUseNm" name="dplSignUseNm" readonly="readonly" value="<c:out value="${dplInfo.dplSignUseNm}"/>" >
										</div>
									</div>
								</div>
								<div class="col-6 kt-padding-r-20">
									<div class="form-group row">
										<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 리비전</label>
										<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
											<input class="form-control" type="text" id="dplRevisionNum" name="dplRevisionNum" readonly="readonly" value="<c:out value='${empty dplInfo.dplRevisionNum ? "Last Revision" :  dplInfo.dplRevisionNum }'/>" >
										</div>
									</div>	
								</div>
								<div class="col-6 kt-padding-l-20">
									<div class="form-group row">
										<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fab fa-cloudsmith kt-margin-r-5"></i>배포 방법</label>
										<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
											<input class="form-control" type="text" id="dplTypeNm" name="dplTypeNm" readonly="readonly" value="<c:out value="${dplInfo.dplTypeNm}"/>" >
										</div>
									</div>	
								</div>
								<c:if test="${dplInfo.dplTypeCd == '01'}">
									<div class="col-6 kt-padding-r-20">
										<div class="form-group row">
											<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>실패 후 처리</label>
											<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
												<input class="form-control" type="text" id="dplAutoAfterNm" name="dplAutoAfterNm" readonly="readonly" value="<c:out value="${dplInfo.dplAutoAfterNm}"/>" >
											</div>
										</div>
									</div>
									<div class="col-6 kt-padding-l-20">
										<div class="form-group row">
											<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>자동 실행 일시</label>
											<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
												<input class="form-control" type="text" id="dplAutoTm" name="dplAutoTm" readonly="readonly" value='<fmt:formatDate value="${dplInfo.dplAutoDtm}" pattern="yyyy-MM-dd HH:mm:ss"/>' >
											</div>
										</div>	
									</div>
									<div class="col-6 kt-padding-r-20">
										<div class="form-group row">
											<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>원복 타입</label>
											<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
												<input class="form-control" type="text" id="dplRestoreNm" name="dplRestoreNm" readonly="readonly" value="<c:out value="${dplInfo.dplRestoreNm}"/>" >											
											</div>
										</div>	
									</div>
								</c:if>
								<c:choose>
									<c:when test="${dplInfo.dplTypeCd == '01'}">
										<c:if test="${dplInfo.dplSignUseCd == '01'}">
											<div class="col-6 kt-padding-l-20">
												<div class="form-group row">
													<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>결재 요청 의견</label>
													<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
														<textarea class="form-control osl-textarea__resize--none" id="dplSignTxt" name="dplSignTxt" readonly="readonly"><c:out value="${dplInfo.dplSignTxt}"/></textarea>
													</div>
												</div>
											</div>
											<div class="col-6 kt-padding-r-20">
												<div class="form-group row">
													<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
													<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
														<textarea class="form-control osl-textarea__resize--none" id="dplDesc" name="dplDesc" readonly="readonly"><c:out value="${dplInfo.dplDesc}"/></textarea>
													</div>
												</div>		
											</div>
										</c:if>
										<c:if test="${dplInfo.dplSignUseCd == '02'}">
											<div class="col-6 kt-padding-l-20">
												<div class="form-group row">
													<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
													<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
														<textarea class="form-control osl-textarea__resize--none" id="dplDesc" name="dplDesc" readonly="readonly"><c:out value="${dplInfo.dplDesc}"/></textarea>
													</div>
												</div>		
											</div>
										</c:if>
									</c:when>
									<c:when test="${dplInfo.dplTypeCd == '02'}">
										<c:if test="${dplInfo.dplSignUseCd == '01'}">
											<div class="col-6 kt-padding-r-20">
												<div class="form-group row">
													<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>결재 요청 의견</label>
													<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
														<textarea class="form-control osl-textarea__resize--none" id="dplSignTxt" name="dplSignTxt" readonly="readonly"><c:out value="${dplInfo.dplSignTxt}"/></textarea>
													</div>
												</div>
											</div>
											<div class="col-6 kt-padding-l-20">
												<div class="form-group row">
													<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
													<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
														<textarea class="form-control osl-textarea__resize--none" id="dplDesc" name="dplDesc" readonly="readonly"><c:out value="${dplInfo.dplDesc}"/></textarea>
													</div>
												</div>		
											</div>
										</c:if>
										<c:if test="${dplInfo.dplSignUseCd == '02'}">
											<div class="col-6 kt-padding-r-20">
												<div class="form-group row">
													<label class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
													<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
														<textarea class="form-control osl-textarea__resize--none" id="dplDesc" name="dplDesc" readonly="readonly"><c:out value="${dplInfo.dplDesc}"/></textarea>
													</div>
												</div>		
											</div>
										</c:if>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane kt-scroll" id="allHistoryTab" data-tab-id="dplInfoAll" role="tabpanel">
					<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
						<div class="kt-portlet__head">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-info-circle kt-margin-r-5"></i>전체 이력
								</h5>
							</div>
						</div>
						<div class="kt-portlet__body">
							<div class="kt-timeline">
								
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane  kt-scroll" id="bldHistoryTab" data-tab-id="dplInfoBuild" role="tabpanel">
					<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
						<div class="kt-portlet__head">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-info-circle kt-margin-r-5"></i>빌드 이력
								</h5>
							</div>
						</div>
						<div class="kt-portlet__body">
							<div class="kt-timeline">
								
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane kt-scroll" id="dplSignHistoryTab" data-tab-id="dplInfoSign" role="tabpanel">
					<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
						<div class="kt-portlet__head">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-info-circle kt-margin-r-5"></i>결재 이력
								</h5>
							</div>
						</div>
						<div class="kt-portlet__body">
							<div class="kt-timeline">
								
								
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane kt-scroll" id="dplChgHistoryTab" data-tab-id="dplInfoModify" role="tabpanel">
					<div class="row">
						<div class="col-lg-8 col-md-12 col-sm-12 col-12">
							<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
								<div class="kt-portlet__head">
									<div class="kt-portlet__head-label">
										<h5 class="kt-font-boldest kt-font-brand">
											<i class="fa fa-info-circle kt-margin-r-5"></i>수정 이력
										</h5>
									</div>
								</div>
								<div class="kt-portlet__body osl-min-h-px--490" id="dplPopModifyHisFrame">
									
									<div class="kt-portlet osl-div__border-lightgray osl-max-h-px--100">
										<div class="kt-portlet__head kt-padding-t-10 kt-padding-b-10 osl-min-h-px--30">
											<div class="kt-portlet__head-label">
												<div class="kt-user-card-v2 btn">
													<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">
														<img class="" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000088" onerror=""/>
													</div>
													<div class="kt-user-card-v2__details">
														<span class="kt-user-card-v2__name text-left">홍길동</span>
													</div>
													<div class="kt-margin-l-10 osl-email">rlfehd@opensoftlab.kr</div>
												</div>
											</div>
											<div class="kt-portlet__head-toolbar text-muted align-items-center">
												2019-07-20 12:14:30
											</div>
										</div>
										<div class="kt-portlet__body kt-padding-t-10 kt-padding-b-10 osl-min-h-px--30">
											<span class="kt-padding-l-10">
												<i class="fas fa-edit kt-margin-r-5"></i>배포 상태가 수정되었습니다.
											</span>
										</div>
									</div>
									
									<div class="kt-portlet osl-div__border-lightgray osl-max-h-px--100">
										<div class="kt-portlet__head kt-padding-t-10 kt-padding-b-10 osl-min-h-px--30">
											<div class="kt-portlet__head-label">
												<div class="kt-user-card-v2 btn">
													<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">
														<img class="" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000088" onerror=""/>
													</div>
													<div class="kt-user-card-v2__details">
														<span class="kt-user-card-v2__name text-left">홍길동</span>
													</div>
													<div class="kt-margin-l-10 osl-email">rlfehd@opensoftlab.kr</div>
												</div>
											</div>
											<div class="kt-portlet__head-toolbar text-muted align-items-center">
												2019-07-20 12:14:30
											</div>
										</div>
										<div class="kt-portlet__body kt-padding-t-10 kt-padding-b-10 osl-min-h-px--30">
											<span class="kt-padding-l-10">
												<i class="fas fa-edit kt-margin-r-5"></i>배포 상태가 수정되었습니다.
											</span>
										</div>
									</div>	
								</div>	
							</div>	
						</div>
						<div class="col-lg-4 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-mobile">
							
							<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 border">
								<div class="kt-portlet__head">
									<div class="kt-portlet__head-label">
										<h5 class="kt-font-boldest">
											<i class="fas fa-edit kt-margin-r-5"></i>변경 <span class=" kt-font-danger">전</span> 내용
										</h5>
									</div>
								</div>
								<div class="kt-portlet__body osl-min-h-px--202">
								</div>
							</div>
							
							<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 border kt-margin-t-20">
								<div class="kt-portlet__head">
									<div class="kt-portlet__head-label">
										<h5 class="kt-font-boldest">
											<i class="fas fa-edit kt-margin-r-5"></i>변경 <span class="kt-font-info">후</span> 내용
										</h5>
									</div>
								</div>
								<div class="kt-portlet__body osl-min-h-px--202">
								</div>
							</div>
						</div>
					</div>	
				</div>
				
				
				<div class="tab-pane kt-scroll" id="dplReqRevisionTab" data-tab-id="dplRevision" role="tabpanel">
					<div class="kt-portlet">
						<div class="kt-portlet__head">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-list kt-margin-r-5"></i>배정된 요구사항 목록
								</h5>
							</div>
						</div>
						<div class="kt-portlet__body kt-padding-b-0">
							<div class="row">
								<div class="col-7">
								
									<div class="osl-datatable-search" data-datatable-id="dplAssignReqTable"></div>
								</div>
								
								<div class="col-5 text-right">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="select" title="배포 계획 생성 관리 관리 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
										<i class="fa fa-list"></i><span>조회</span>
									</button>
								</div>
							</div>
							
							<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="dplAssignReqTable"></div>
						</div>
					</div>
					<div class="kt-portlet kt-margin-t-20-desktop kt-margin-b-0">
						<div class="kt-portlet__head">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-list kt-margin-r-5"></i>배정 리비전
								</h5>
							</div>
						</div>
						<div class="kt-portlet__body">
							<div class="row">
								<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12 kt-padding-10 position-relative">
									<div class="osl-div-cover big">상단 배정된 요구사항을 선택해주세요.</div>
									<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0 osl-div__border-lightgray kt-rounded" id="dplReivisionListTable"></div>
								</div>
								<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12 kt-padding-10 kt-scroll">
									<div class="osl-div-cover"></div>
									<div class="osl-tree-search osl-div__border-lightgray kt-rounded kt-padding-10" id="dplPopRevisionFileTreeDiv"></div>
								</div>
								<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12 kt-padding-10">
									<div class="osl-div-cover"></div>
									<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0 osl-div__border-lightgray kt-rounded" id="dplPopRevisionFileGridTable"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane kt-scroll" id="dplReqTab" data-tab-id="dplAssignReq" role="tabpanel">
					<div class="kt-portlet kt-margin-b-0">
						<div class="kt-portlet__head">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-list kt-margin-r-5"></i>배정된 요구사항 목록
								</h5>
							</div>
						</div>
						<div class="kt-portlet__body kt-padding-b-0">
							<div class="row">
								<div class="col-7">
									<div class="osl-datatable-search" data-datatable-id="dpl1002DplReqTable"></div>
								</div>
								<div class="col-5 text-right">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="select" title="배포 계획 생성 관리 관리 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
										<i class="fa fa-list"></i><span>조회</span>
									</button>
								</div>
							</div>
							<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="dpl1002DplReqTable"></div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
	</div>
</form>

<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand"
		data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>



<script>
"use strict";
var OSLDpl1002Popup = function () {

	var formId = 'frDpl1002';
	
	
	var datatableInitFlag = {dplRevision: false, dplAssignReq:false};
	
	var datatableSetting = {};
	
	var documentSetting = function(){

		
		var dplSignUseCd = $("#dplSignUseCd").val();
		if(dplSignUseCd == "02"){
			
			$("a.nav-link[data-tab-id='dplInfoSign']").addClass("kt-hide");
		}
		
		
		fnSelectDplHistoryInfo();
		
		
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			
			var tabTarget = e.currentTarget;
			
			
			var tabDiv = $(tabTarget).attr('data-tab-id');
			
			
			if(datatableInitFlag.hasOwnProperty(tabDiv)){
				
				if(!datatableInitFlag[tabDiv]){
					datatableInitFlag[tabDiv] = datatableSetting[tabDiv]();
				
				}else if(datatableInitFlag.hasOwnProperty(tabDiv)){
					datatableInitFlag[tabDiv].reload();
				}
			}
		});
				
		
		var treeObj = $.osl.tree.setting("dplPopRevisionFileTreeDiv",{
			data:{
				url:"<c:url value='/stm/stm6000/stm6000/selectStm6000DeptListAjax.do'/>",
				key: "deptId",
				pKey: "upperDeptId",
				labelKey: "deptName"
			},
			search:{
				
				case_insensitive : true,
				
				show_only_matches: true,
				
				show_only_matches_children: true,
			},
			callback:{
				onclick: function(treeObj,selNode){
					
					selectDeptInfo(selNode.original.deptId);
				},
				init: function(treeObj,data){
					
				}
			}
		});
		
		
		fnKtScrollInit("#dplPopRevisionFileTreeDiv", "312.5");
		fnKtScrollInit("#dplInfoTab", "550");
		fnKtScrollInit("#allHistoryTab", "550");
		fnKtScrollInit("#bldHistoryTab", "550");
		fnKtScrollInit("#dplSignHistoryTab", "550");
		fnKtScrollInit("#dplChgHistoryTab", "550");
		fnKtScrollInit("#dplReqRevisionTab", "550");
		fnKtScrollInit("#dplReqTab", "550");
	};
	
	
	datatableSetting["dplRevision"] = function(){
		
		var dplAssignReqTable = $.osl.datatable.setting("dplAssignReqTable",{
			data: {
				source: {
					read: {
						url: "/dpl/dpl1000/dpl1100/selectDpl1100AssReqListAjax.do",
						params:{
							prjId : $("#paramPrjId").val(),
					    	dplId : $("#paramDplId").val(),
					    	
						}
					}
				},
				 pageSize : 3,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [3, 10, 20, 30, 50, 100],
						
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 3
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
				{field: 'rn', title: '순번', textAlign: 'center', width: 30, search: true},
				{field: 'reqOrd', title: '요구사항 순번', textAlign: 'center', width: 80, autoHide: false},
				{field: 'reqProTypeNm', title: '처리 상태', textAlign: 'center', width: 70, autoHide: false, search:true, searchType:"select", searchCd: "REQ00008", searchField:"reqProTypeCd", sortField: "reqProTypeCd"},
				{field: 'reqNm', title: '요구사항 명', textAlign: 'left', width: 250, autoHide: false, search: true},
				/* {field: '', title: '프로세스명', textAlign: 'center', width: 70, search: true},
				{field: '', title: '작업흐름 명', textAlign: 'center', width: 100, search: true}, */
				{field: 'reqUsrNm', title: '요청자', textAlign: 'center', width: 70, search: true},
				{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 70, search: true}
			],
			actionBtn:{
				"title": "기능 버튼",
				"width" : 120,
				"click": true,
				"dblClick": false,
				"insert": false,
				"update": false,
				"delete": false
			},
			actionTooltip:{
				"click": "배정리비전 조회"				
			},
			actionFn:{
				"click":function(rowData){
					$('.osl-div-cover.big').css('display','none');
					$('.osl-div-cover')[1].append('좌측 배정된 요구사항을 선택해주세요.');
				}
			}
		});
		
		
		var dplReivisionListTable = $.osl.datatable.setting("dplReivisionListTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				 pageSize : 3,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [3, 10, 20, 30, 50, 100],
						
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 3
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
				{field: '', title: '작업흐름 명', textAlign: 'center', width: 70},
				{field: '', title: 'Repository', textAlign: 'center', width: 100},
				{field: '', title: 'Revision', textAlign: 'center', width: 100},
				{field: '', title: '내용', textAlign: 'center', width: 100},
			],
			actionBtn:{
				"title": "기능 버튼",
				"width" : 120,
				"click": true,
				"dblClick": false,
				"insert": false,
				"update": false,
				"delete": false
			},
			actionTooltip:{
				"click": "배정리비전 조회"				
			},
			actionFn:{
				"click":function(rowData){
					$('.osl-div-cover').css('display','none');
				}
			}
		});
		
		
		var dplPopRevisionFileGridTable = $.osl.datatable.setting("dplPopRevisionFileGridTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				 pageSize : 3,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [3, 10, 20, 30, 50, 100],
						
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 3
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
				{field: '', title: 'type', textAlign: 'center', width: 70},
				{field: '', title: 'name', textAlign: 'center', width: 100},
				{field: '', title: 'path', textAlign: 'center', width: 100},
			],
			actionBtn:{
				"dblClick": false 
			}
		});
		
		return {
			reload: function(){
				
				dplAssignReqTable.targetDt.reload();
				dplReivisionListTable.targetDt.reload();
				dplPopRevisionFileGridTable.targetDt.reload();
			}
		};
	};
	
	
	datatableSetting["dplAssignReq"] = function(){
		$.osl.datatable.setting("dpl1002DplReqTable",{
			data: {
				source: {
					read: {
						url: "/dpl/dpl1000/dpl1100/selectDpl1100AssReqListAjax.do",
						params:{
							prjId : $("#paramPrjId").val(),
					    	dplId : $("#paramDplId").val(),
					    	
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
					{field: 'rn', title: '순번', textAlign: 'center', width: 30, search: true},
					{field: 'reqOrd', title: '요구사항 순번', textAlign: 'center', width: 80, autoHide: false},
					{field: 'reqProTypeNm', title: '처리 상태', textAlign: 'center', width: 70, autoHide: false, search:true, searchType:"select", searchCd: "REQ00008", searchField:"reqProTypeCd", sortField: "reqProTypeCd"},
					{field: 'reqNm', title: '요구사항 명', textAlign: 'left', width: 250, autoHide: false, search: true},
					/* {field: '', title: '프로세스명', textAlign: 'center', width: 70, search: true},
					{field: '', title: '작업흐름 명', textAlign: 'center', width: 100, search: true}, */
					{field: 'reqUsrNm', title: '요청자', textAlign: 'center', width: 70, search: true},
					{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 70, search: true}
			],
			actionBtn:{
				"title": "기능 버튼",
				"width" : 120,
				"click": false,
				"dblClick": true,
				"insert": false,
				"delete": false,
				"update": false
			},
			actionTooltip:{
				"dblClick": "요구사항 상세 보기",
			},
			actionFn:{
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
					
				}
			},
			theme: {
				 actionBtnIcon:{
					 "dblClick": "fa fa-info-circle"
				 }
			 }
		});
	};
	
	
	/**
	 * function 명 	: fnSelectDplHistoryInfo
	 * function 설명	: 배포 계획 전체 이력정보 조회
	 */
	 var fnSelectDplHistoryInfo = function() {
		 
    	var paramPrjId = $("#paramPrjId").val();
    	var paramDplId = $("#paramDplId").val();
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dpl/dpl1000/dpl1000/selectDpl1000DplHistoryListAjax.do'/>"}
				,{"prjId": paramPrjId, "dplId" : paramDplId});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
				var jobList = data.jobList;
				
				var bldHistoryList = data.dplAllBldHistoryList;
				
				var signHistoryList = data.dplSignHistoryList;
				
				var allHistiryList = bldHistoryList.concat(signHistoryList)
				
				allHistiryList.sort(function(a, b) { 
				    return b["regDtm"] - a["regDtm"];
				    
				});
				console.log(allHistiryList)
				
				
				fnAllHistorySetting(allHistiryList, jobList);
				
				
				fnBldHistorySetting(bldHistoryList, jobList);
				
				
				if($("#dplSignUseCd").val() == "01"){
					
					fnSignHistorySetting(signHistoryList);
				}
			}
		});
		
		
		ajaxObj.send();
	};
	
	
	/*
	 * function명 : fnAllHistorySetting
	 * function설명 : 전체 이력을 그린다
	 * @param allHistiryList : 전체 리스트
	 * @param jobList : 잡 리스트
	 */
	var fnAllHistorySetting = function(allHistiryList, jobList){
		
		
		$.each(allHistiryList,function(idx, map){
			
			if(map.type == "BLD"){
				
				var bldTimelineDiv ='';
				
				var bldResult = map.bldResult;
				
				var itemPosition = '';
				
				var itemColor = '';
				
				var itemIconPosition = '';
				
				var iconImg = '';
				
				var badgeColor = '';
				
				var bldBadge = '';
				
				var bldTitle = '';
				
				var signRes = '';
				
				var signUsrNm = $.osl.escapeHtml(map.regUsrNm);
				
				
				
				var signUsrImgId = $.osl.escapeHtml(map.regUsrImgId);
				
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
					bldBadge = "실패";
					bldTitle = "["+$.osl.escapeHtml(map.jobTypeNm)+"-"+map.bldNum+"] "+$.osl.escapeHtml(map.jobId);
					badgeColor = "badge-danger";
					bldResultMsg = $.osl.escapeHtml(map.bldResultMsg);
					cardType = '1';
					
				
				}else if(bldResult == "SUCCESS"){
					itemPosition = "osl-timeline-item-left";
					itemColor = "kt-timeline__item--success ";
					itemIconPosition = "flex-row-reverse-desktop";
					iconImg = "fa-check kt-font-success";
					bldBadge = "성공";
					bldTitle = "["+$.osl.escapeHtml(map.jobTypeNm)+"-"+map.bldNum+"] "+$.osl.escapeHtml(map.jobId);
					badgeColor = "badge-success";
					cardType = '1';
					
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
										+				'<div class="osl-ribbon__btn kt-padding-l-10 kt-padding-r-10" title="결과 콘솔로그" data-toggle="kt-tooltip" data-skin="info" data-placement="bottom">'
										+					'<i class="fa fa-code"></i>'
										+				'</div>'
										+				'<div class="osl-ribbon__btn kt-padding-l-10 kt-padding-r-10" title="변경이력" data-toggle="kt-tooltip" data-skin="info" data-placement="bottom">'
										+					'<i class="fas fa-list"></i>'
										+				'</div>'
										+			'</div>'
										+			'<div class="kt-timeline__item-text kt-margin-l-0 kt-margin-b-10 kt-padding-20">'
										+				'<div class="w-100 float-left kt-padding-r-90">'
										+					'<div class="badge '+badgeColor+' kt-margin-r-15 float-left">'+bldBadge+'</div>'
										+					'<div class="kt-font-bolder kt-padding-l-55">'+bldTitle+'</div>'
										+				'</div>'
										+				'<div class="kt-timeline__item-info kt-font-dark kt-padding-b-0">'+bldResultMsg+'</div>'
										+			'</div>'
										+			'<div class="border-top kt-padding-t-10 kt-padding-l-20 kt-padding-r-20">'
										+				'<div class="kt-user-card-v2 btn kt-margin-b-10">'
										+					'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
										+						'<img class="" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId='+signUsrImgId+'" onerror=""/>'
										+					'</div>'
										+					'<div class="kt-user-card-v2__details">'
										+						'<span class="kt-user-card-v2__name text-left">'+signUsrNm+'</span>'
										+					'</div>'
										+					'<div class="kt-margin-l-10 osl-email"></div>'
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
										+				'<span class="kt-margin-r-15 float-left">'+bldResultMsg+'</span>'
										+			'</div>'
										+		'</div>'
										+	'</div>'
										
				}
				
				
				$("#allHistoryTab .kt-timeline").append(bldTimelineDiv);
				
			}else if(map.type == "SIG"){
				
				var signTypeCd = map.signTypeCd;
				
				
				if(signTypeCd == '01' ){
					
					
					drawSignInfoCard(map, 2, "#allHistoryTab");
					
					drawSignInfoCard(map, 1, "#allHistoryTab");
				
				}else if(signTypeCd == '02'){
					
					
					drawSignInfoCard(map, 2, "#allHistoryTab");
					
					drawSignInfoCard(map, 3, "#allHistoryTab");
				
				}else if(signTypeCd == '03'){
					
					
					drawSignInfoCard(map, 4, "#allHistoryTab");
				
				}else if(signTypeCd == '04'){
					
					
					drawSignInfoCard(map, 5, "#allHistoryTab");
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
							+				'<span class="kt-margin-r-15 float-left">등록</span>'
							+			'</div>'
							+		'</div>'
							+	'</div>'
			
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
						+				'<span class="kt-margin-r-15 float-left">배포 계획</span>'
						+				'<span class="kt-font-bolder">'+$.osl.escapeHtml(dplNm)+'</span>'
						+				'<span class="kt-margin-r-15 float-left">생성</span>'
						+			'</div>'
						+		'</div>'
						+	'</div>'
		
		
		
		$("#allHistoryTab .kt-timeline").append(dplTimelineDiv);
	}
	
	
	/*
	 * function명 : fnBldHistorySetting
	 * function설명 : 빌드 이력을 그린다
	 * @param bldHistoryList : 빌드 리스트
	 * @param jobList : 잡 리스트
	 */
	var fnBldHistorySetting = function(bldHistoryList,jobList){
		var bldTimelineDiv = '';
		
		$.each(bldHistoryList,function(idx, bldInfo){
			var bldResult = bldInfo.bldResult;
			
			
			var itemPosition = '';
			
			var itemColor = '';
			
			var itemIconPosition = '';
			
			var iconImg = '';
			
			var badgeColor = '';
			
			var bldBadge = '';
			
			var bldTitle = '';
			
			var signRes = '';
			
			var signUsrNm = $.osl.escapeHtml(bldInfo.regUsrNm);
			
			
			
			var signUsrImgId = $.osl.escapeHtml(bldInfo.regUsrImgId);
			
			var dtmMargin = 'kt-margin-r-10';
			
			var bldResultMsg = '';
			
			var cardType = '';
			
			
			if(bldResult == "PROGRESS"){
				iconImg = "fa-sync-alt kt-font-brand";
				bldTitle = "["+$.osl.escapeHtml(bldInfo.jobTypeNm)+"-"+bldInfo.bldNum+"] "+$.osl.escapeHtml(bldInfo.jobId);
				bldResultMsg = $.osl.escapeHtml(bldInfo.bldResultMsg);
				cardType = '2';
				
			
			}else if(bldResult == "START"){
				return;
				
			
			}else if(bldResult == "FAILURE"){
				itemPosition = "osl-timeline-item-right";
				itemColor = "kt-timeline__item--danger ";
				dtmMargin = 'kt-margin-l-10';
				iconImg = "fa-times kt-font-danger";
				bldBadge = "실패";
				bldTitle = "["+$.osl.escapeHtml(bldInfo.jobTypeNm)+"-"+bldInfo.bldNum+"] "+$.osl.escapeHtml(bldInfo.jobId);
				badgeColor = "badge-danger";
				bldResultMsg = $.osl.escapeHtml(bldInfo.bldResultMsg);
				cardType = '1';
				
			
			}else if(bldResult == "SUCCESS"){
				itemPosition = "osl-timeline-item-left";
				itemColor = "kt-timeline__item--success ";
				itemIconPosition = "flex-row-reverse-desktop";
				iconImg = "fa-check kt-font-success";
				bldBadge = "성공";
				bldTitle = "["+$.osl.escapeHtml(bldInfo.jobTypeNm)+"-"+bldInfo.bldNum+"] "+$.osl.escapeHtml(bldInfo.jobId);
				badgeColor = "badge-success";
				bldResultMsg = $.osl.escapeHtml(bldInfo.bldResultMsg);
				cardType = '1';
				
			}
			
			if(cardType == '1'){
				
				
				bldTimelineDiv 		+=	'<div class="kt-timeline__item '+itemColor+itemPosition+'">'
									+		'<div class="kt-timeline__item-section '+itemIconPosition+'">'
									+			'<div class="kt-timeline__item-section-border">'
									+				'<div class="kt-timeline__item-section-icon">'
									+					'<i class="fas '+iconImg+'"></i>'
									+				'</div>'
									+			'</div>'
									+			'<span class="kt-timeline__item-datetime '+dtmMargin+'">'+getTimeStamp(bldInfo.regDtm)+'</span>'
									+		'</div>'
									+		'<div class="osl-timeline-content osl-ribbon osl-ribbon__top osl-ribbon__ver">'
									+			'<div class="osl-ribbon__target bg-success" style="top: -2px; right: 20px;">'
									+				'<div class="osl-ribbon__btn kt-padding-l-10 kt-padding-r-10" title="결과 콘솔로그" data-toggle="kt-tooltip" data-skin="info" data-placement="bottom">'
									+					'<i class="fa fa-code"></i>'
									+				'</div>'
									+				'<div class="osl-ribbon__btn kt-padding-l-10 kt-padding-r-10" title="변경이력" data-toggle="kt-tooltip" data-skin="info" data-placement="bottom">'
									+					'<i class="fas fa-list"></i>'
									+				'</div>'
									+			'</div>'
									+			'<div class="kt-timeline__item-text kt-margin-l-0 kt-margin-b-10 kt-padding-20">'
									+				'<div class="w-100 float-left kt-padding-r-90">'
									+					'<div class="badge '+badgeColor+' kt-margin-r-15 float-left">'+bldBadge+'</div>'
									+					'<div class="kt-font-bolder kt-padding-l-55">'+bldTitle+'</div>'
									+				'</div>'
									+				'<div class="kt-timeline__item-info kt-font-dark kt-padding-b-0">'+bldResultMsg+'</div>'
									+			'</div>'
									+			'<div class="border-top kt-padding-t-10 kt-padding-l-20 kt-padding-r-20">'
									+				'<div class="kt-user-card-v2 btn kt-margin-b-10">'
									+					'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
									+						'<img class="" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId='+signUsrImgId+'" onerror=""/>'
									+					'</div>'
									+					'<div class="kt-user-card-v2__details">'
									+						'<span class="kt-user-card-v2__name text-left">'+signUsrNm+'</span>'
									+					'</div>'
									+					'<div class="kt-margin-l-10 osl-email"></div>'
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
									+			'<span class="kt-timeline__item-datetime '+dtmMargin+'">'+getTimeStamp(bldInfo.regDtm)+'</span>'
									+		'</div>'
									+		'<div class="osl-timeline-content osl-ribbon osl-ribbon__top osl-ribbon__ver">'
									+			'<div class="kt-timeline__item-text kt-margin-l-0 kt-margin-b-10 kt-padding-20">'
									+				'<span class="kt-font-bolder">'+bldTitle+'</span>'
									+				'<span class="kt-margin-r-15 float-left">'+bldResultMsg+'</span>'
									+			'</div>'
									+		'</div>'
									+	'</div>'
									
			}
			
		});
		
		
		$.each(jobList, function(idx, jobInfo){
			bldTimelineDiv +=	'<div class="kt-timeline__item kt-timeline__item--brand osl-timeline-item-center kt-padding-t-20">'
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
							+				'<span class="kt-margin-r-15 float-left">등록</span>'
							+			'</div>'
							+		'</div>'
							+	'</div>'
			
		});
		
		var dplNm = $("#dplNm").val();
		var regDtm = $('#regDtm').val();
		bldTimelineDiv +=	'<div class="kt-timeline__item kt-timeline__item--brand osl-timeline-item-center kt-padding-t-20">'
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
						+				'<span class="kt-margin-r-15 float-left">배포 계획</span>'
						+				'<span class="kt-font-bolder">'+$.osl.escapeHtml(dplNm)+'</span>'
						+				'<span class="kt-margin-r-15 float-left">생성</span>'
						+			'</div>'
						+		'</div>'
						+	'</div>'
		
		
		
		$("#bldHistoryTab .kt-timeline").html(bldTimelineDiv);
	}
	
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
	
	function leadingZeros(n, digits) {
		  var zero = '';
		  n = n.toString();

		  if (n.length < digits) {
		    for (var i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
	}
	
	/*
	 * function명 : fnSignHistorySetting
	 * function설명 : 결재 히스토리를 셋팅한다.
	 * @param dplSignHistoryList : 해당 배포 계획의 결재 내역
	 */
	var fnSignHistorySetting = function(dplSignHistoryList){
		
		$.each(dplSignHistoryList,function(idx, signInfo){
			
			var signTypeCd = signInfo.signTypeCd;
			
			
			if(signTypeCd == '01' ){
				
				
				drawSignInfoCard(signInfo, 2, "#dplSignHistoryTab");
				
				drawSignInfoCard(signInfo, 1, "#dplSignHistoryTab");
			
			}else if(signTypeCd == '02'){
				
				
				drawSignInfoCard(signInfo, 2, "#dplSignHistoryTab");
				
				drawSignInfoCard(signInfo, 3, "#dplSignHistoryTab");
			
			}else if(signTypeCd == '03'){
				
				
				drawSignInfoCard(signInfo, 4, "#dplSignHistoryTab");
			
			}else if(signTypeCd == '04'){
				
				
				drawSignInfoCard(signInfo, 5, "#dplSignHistoryTab");
			}
			
		});
		
	};
	
	/*
	 * function명 : drawSignInfoCard
	 * function설명 : 셋팅할 결재 정보 카드를 만든다.
	 * @param signInfo : 결재 정보
	 * @param type : 카드 타입(1 : 기안 카드, 2: 결재 대기 카드, 3: 결재 승인 카드, 4:결재 최종 승인 카드, 5: 결재 반려 카드)
	 * @param targetTab : 만든 div를 넣을 탭
	 */
	var drawSignInfoCard = function(signInfo, type, targetTab){
		
		
		var itemPosition = '';
		
		var itemColor = '';
		
		var itemIconPosition = '';
		
		var iconImg = '';
		
		var badgeColor = '';
		
		var signType = '';
		
		var signTitle = '';
		
		var signRes = '';
		
		var signUsrNm = $.osl.escapeHtml(signInfo.signUsrNm);
		
		var signUsrEmail = $.osl.escapeHtml(signInfo.signUsrEmail);
		
		var signUsrImgId = $.osl.escapeHtml(signInfo.signUsrImgId);
		
		var dtmMargin = 'kt-margin-r-10';
		
		
		
		if(type == 1){
			itemPosition = "osl-timeline-item-left";
			itemColor = "kt-timeline__item--dark ";
			itemIconPosition = "flex-row-reverse-desktop";
			iconImg = "fa-edit kt-font-dark";
			signType = "기안";
			signTitle = "[기안] 기안서 작성";
			badgeColor = "badge-success";
		
		
		}else if(type == 2){
			itemPosition = "osl-timeline-item-left";
			itemColor = "kt-timeline__item--dark ";
			itemIconPosition = "flex-row-reverse-desktop";
			iconImg = "fa-edit kt-font-dark";
			signType = "요청";
			signTitle = "[대기] 결재 요청";
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
			signType = "승인";
			signTitle = "[승인] 결재 승인";
			badgeColor = "badge-success";
		
		
		}else if(type == 4){
			itemPosition = "osl-timeline-item-left";
			itemColor = "kt-timeline__item--success ";
			itemIconPosition = "flex-row-reverse-desktop";
			iconImg = "fa-check kt-font-success";
			signRes = $.osl.escapeHtml(signInfo.signRes);
			signType = "승인";
			signTitle = "[최종 승인] 결재 최종 승인";
			badgeColor = "badge-success";
		
		
		}else if(type ==5){
			itemPosition = "osl-timeline-item-right";
			itemColor = "kt-timeline__item--danger ";
			iconImg = "fa-times kt-font-danger";
			signRes = $.osl.escapeHtml(signInfo.signRes);
			signType = "반려";
			signTitle = "[반려] 결재 반려";
			badgeColor = "badge-danger";
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
							+			'<div class="kt-timeline__item-text kt-margin-l-0 kt-margin-b-10 kt-padding-20">'
							+				'<div class="w-100 float-left kt-padding-r-90">'
							+					'<div class="badge '+badgeColor+' kt-margin-r-15 float-left">'+signType+'</div>'
							+					'<div class="kt-font-bolder kt-padding-l-55">'+signTitle+'</div>'
							+				'</div>'
							+				'<div class="kt-timeline__item-info kt-font-dark kt-padding-b-0">'+signRes+'</div>'
							+			'</div>'
							+			'<div class="border-top kt-padding-t-10 kt-padding-l-20 kt-padding-r-20">'
							+				'<div class="kt-user-card-v2 btn kt-margin-b-10">'
							+					'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
							+						'<img class="" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId='+signUsrImgId+'" onerror=""/>'
							+					'</div>'
							+					'<div class="kt-user-card-v2__details">'
							+						'<span class="kt-user-card-v2__name text-left">'+signUsrNm+'</span>'
							+					'</div>'
							+					'<div class="kt-margin-l-10 osl-email">'+signUsrEmail+'</div>'
							+				'</div>'
							+			'</div>'
							+		'</div>'
							+	'</div>'
		
		
		$(targetTab+" .kt-timeline").append(timelineItemDiv);
	}
	
	/*
	 * function명 : ktScrollInit
	 * function설명 : 스크롤 세팅 및 반응형 될 때 세로크기값을 계산해준다
	 * @param targetName : 스크롤 세팅할 대상 class, id
	 * @param targetHeight : 스크롤의 세로 사이즈
	 */
	var fnKtScrollInit = function(targetName, targetHeight) {
		KTUtil.scrollInit($(targetName)[0], {
	   		
	        disableForMobile: true, 
	        
	        resetHeightOnDestroy: true, 
	        
	        handleWindowResize: true, 
	        
	        height: targetHeight
	    });
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

