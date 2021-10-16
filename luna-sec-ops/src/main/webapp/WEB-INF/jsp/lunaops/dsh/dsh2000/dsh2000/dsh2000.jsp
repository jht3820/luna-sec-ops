<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block">
		<div class="col-lg-5 col-md-5 col-sm-12 col-12 kt-padding-l-0">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i>대시보드 (프로젝트 그룹)
			</h4>
		</div>
		<div class="col-lg-7 col-md-12 col-sm-12 col-12 text-right osl-text-left-mobile-576 kt-padding-r-0">
			<div class="kt-portlet__head-wrapper">
				<div class="kt-margin-t-20-tablet kt-margin-t-20-mobile osl-font-lg" id="dataAutoRefreshDiv" guide="autoRefresh">
					<i class="fa fa-clock kt-font-brand kt-font-lg"></i>
					<span class="kt-font-boldest kt-margin-r-5" id="autoRefreshSpan">00분 00초</span>후 자동 갱신
					<i class="fas fa-cogs kt-font-brand kt-font-lg kt-margin-l-10 kt-margin-r-10"></i>
					<select class="form-control osl-w-px-70 kt-block-inline" id="timerVarSel">
						<option value="0.5">30초</option>
						<option value="1">1분</option>
						<option value="5" selected>5분</option>
						<option value="10">10분</option>
						<option value="30">30분</option>
						<option value="60">1시간</option>
					</select>
					<span class="osl-dash-btn-mobile osl-margin-t-20-mobile-576">
						<!-- 
						<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-l-5  kt-margin-r-5 btn-elevate btn-elevate-air" id="dshWidgetSortCancel" data-flag="false">
							<i class="fa fa-history kt-padding-r-0"></i>
						</button>
						<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-l-5  kt-margin-r-5 btn-elevate btn-elevate-air" id="dshWidgetSrotBtn">
							<i class="fas fa-expand-arrows-alt kt-padding-r-0"></i>
						</button>
						 -->
						<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-l-5  kt-margin-r-5 btn-elevate btn-elevate-air" id="autoRefreshRedoBtn">
							<i class="fa fa-redo kt-padding-r-0"></i>
						</button>
						<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" id="autoRefreshEndBtn" data-flag="false">
							<i class="fa fa-times kt-padding-r-0"></i>
						</button>
						<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air osl-dash--all-folding" id="allPortletClose"><i class="fa fa-chevron-down"></i></a>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- begin:: 대시보드 대제목 -->
	<div class="kt-portlet kt-portlet--mobile" id="prjTopInfo">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<div class="kt-portlet__head-label">
				<h4 class="kt-font-boldest kt-font-brand">
					<i class="fa fa-th-large kt-margin-r-5"></i>프로젝트 그룹
				</h4>
			</div>
			<div class="kt-portlet__head-toolbar">
	            <div class="kt-portlet__head-group">
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10" title="영역 새로고침" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
						<i class="fas fa-redo-alt"></i>
					</button>
	            	<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air"><i class="fa fa-chevron-down"></i></a>
	            </div>
	         </div>
		</div>
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-12 col-12 kt-padding-20">
					<div class="border osl-min-h-px--250">차트1</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-12 kt-padding-20">
					<div class="border osl-min-h-px--250">차트2</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 col-12 kt-padding-20">
					<div class="border osl-min-h-px--250">차트3</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end:: 대시보드 대제목 -->
	<!-- begin:: 접수대기 -->
	<div class="kt-portlet kt-portlet--mobile" id="newReq">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<div class="kt-portlet__head-label">
				<h4 class="kt-font-boldest kt-font-brand">
					<i class="fa fa-th-large kt-margin-r-5"></i>접수대기 
				</h4>
			</div>
			<div class="kt-portlet__head-toolbar">
	            <div class="kt-portlet__head-group">
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10 invisible" data-datatable-id="req4100ReqTable" data-datatable-action="select" title="조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
						<i class="fas fa-redo-alt"></i>
					</button>
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10" data-datatable-id="req4100ReqTable" data-datatable-action="refresh" title="접수 대기 재조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="refresh" tabindex="5">
						<i class="fas fa-redo-alt"></i>
					</button>
                 	<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air"><i class="fa fa-chevron-down"></i></a>
	            </div>
	        </div>
		</div>
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-9 col-9">
					<div class="osl-datatable-search" data-datatable-id="req4100ReqTable"></div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-3 col-3 kt-align-right">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air kt-hide" data-datatable-id="req4100ReqTable" data-datatable-action="requestAccept" title="요구사항 접수" data-title-lang-cd="req4100.actionBtn.requestAcceptTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="5">
						<i class="fa fa-vote-yea"></i><span data-lang-cd="req4100.button.requestAccept">접수</span>
					</button>
				</div>
			</div>
			<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="req4100ReqTable"></div>
		</div>
	</div>
	<!-- end:: 접수대기 -->
	
	<!-- begin:: 담당 요구사항 결재 목록, 담당 배포계획 결재 목록 -->
	<div class="row">
		<!-- begin:: 담당 요구사항 결재 목록 -->
		<div class="col-lg-6 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile" id="reqChargeSign">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h4 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>담당 요구사항 결재 목록
						</h4>
					</div>
					<div class="kt-portlet__head-toolbar">
			            <div class="kt-portlet__head-group">
							<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10" data-datatable-id="reqChargeSignTable" data-datatable-action="select" title="담당 요구사항 결재 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
								<i class="fas fa-redo-alt"></i>
							</button>
		                 	<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air"><i class="fa fa-chevron-down"></i></a>
			            </div>
			         </div>
				</div>
				<div class="kt-portlet__body">
					<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="reqChargeSignTable"></div>
				</div>
			</div>
		</div>
		<!-- end:: 담당 요구사항 결재 목록 -->
		<!-- begin:: 담당 배포계획 결재 목록 -->
		<div class="col-lg-6 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile" id="reqChargeDpl">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h4 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>담당 배포계획 결재 목록
						</h4>
					</div>
					<div class="kt-portlet__head-toolbar">
			            <div class="kt-portlet__head-group">
							<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10" data-datatable-id="reqChargeDplTable" data-datatable-action="select" title="담당 배포계획 결재 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
								<i class="fas fa-redo-alt"></i>
							</button>
		                  <a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air" data-skin="brand"><i class="fa fa-chevron-down"></i></a>
			            </div>
			         </div>
				</div>
				<div class="kt-portlet__body">
					<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="reqChargeDplTable"></div>
				</div>
			</div>
		</div>
		<!-- end:: 담당 배포계획 결재 목록 -->
	</div>
	<!-- end:: 담당 요구사항 결재 목록, 담당 배포계획 결재 목록 -->
	
	<!-- begin:: 프로세스 목록1 -->
	<div class="kt-portlet kt-portlet--mobile" data-target-div="process1" id="processPortlet1">
		<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block">
			<div class="col-lg-7 col-md-12 col-sm-12 col-12 kt-padding-l-0 osl-display__flex osl-flex-flow--row osl-flex-flow--column-mobile">
				<h4 class="kt-font-boldest kt-font-brand">
					<i class="fa fa-th-large kt-margin-r-5"></i>프로세스 명 1
				</h4>
				<h5 class="kt-font-bolder kt-font-brand osl-display__flex osl-flex-flow--row osl-flex-flow--column-mobile-430">
					<span class="kt-margin-l-10">
						(생성일: <span>2020-11-06 14:31</span>)
					</span>
					<span class="kt-margin-l-20">
						담당<span class="badge osl-badge-brand kt-margin-l-5">7</span>
						전체<span class="badge osl-badge-brand kt-margin-l-5">7</span>
					</span>
				</h5>
			</div>
			<div class="col-lg-5 col-md-12 col-sm-12 col-12 text-right kt-padding-r-0">
	            <div class="kt-portlet__head-group">
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10 osl-view-type" data-view-type="grid" data-target-process="process1" title="칸반 그리드 전환" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
						<i class="fas fa-columns"></i>
					</button>
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10 osl-title--all-view-content on" title="빈 작업 흐름 숨기기" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
					</button>
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10" title="영역 새로고침" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
						<i class="fas fa-redo-alt"></i>
					</button>
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10" title="영역 전체화면" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
						<i class="fas fa-expand"></i>
					</button>
	            	<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air"><i class="fa fa-chevron-down"></i></a>
	            </div>
	         </div>
		</div>
		<div class="kt-portlet__body kt-padding-10">
			<div class="osl-dash-gridkaban-bg osl-overflow--x-auto">
				<!-- begin :: 그리드 -->
				<div class="osl-dsh-flowchart kt-margin-20">
				
					<!-- flowchart 1 -->
					<div class="flowchart-operator osl-flowchart__operator border" data-operator-id="previewOperator">
						<div class="flowchart-operator-function hide"></div>
						<div class="flowchart-operator-title">
							<div class="flowchart-operator-title__lebel">작업흐름 명</div>
							<div class="flowchart-operator-menu hide">
								<button type="button" class="btn btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-bars kt-padding-r-0"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-right">
									<div class="dropdown-item" data-flow-action="update">
										<i class="fa fa fa-edit kt-font-primary"></i>수정
									</div>
									<div class="dropdown-item" data-flow-action="delete">
										<i class="fa fa fa-trash kt-font-primary"></i>삭제
									</div>
								</div>
							</div>
						</div>
						<div class="flowchart-operator-inputs-outputs kt-margin-0">
							<div class="flowchart-operator-inputs text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="flowchart-operator-outputs text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
						</div>
					</div>
					
					<!-- 화살표 1 -->
					<i class="fas fa-arrow-circle-right"></i>
					
					<!-- flowchart 2 -->
					<div class="flowchart-operator osl-flowchart__operator border" data-operator-id="previewOperator">
						<div class="flowchart-operator-function hide"></div>
						<div class="flowchart-operator-title">
							<div class="flowchart-operator-title__lebel">작업흐름 명</div>
							<div class="flowchart-operator-menu hide">
								<button type="button" class="btn btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-bars kt-padding-r-0"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-right">
									<div class="dropdown-item" data-flow-action="update">
										<i class="fa fa fa-edit kt-font-primary"></i>수정
									</div>
									<div class="dropdown-item" data-flow-action="delete">
										<i class="fa fa fa-trash kt-font-primary"></i>삭제
									</div>
								</div>
							</div>
						</div>
						<div class="flowchart-operator-inputs-outputs kt-margin-0">
							<div class="flowchart-operator-inputs text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="flowchart-operator-outputs text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
						</div>
					</div>
					
					<!-- 화살표 2 -->
					<i class="fas fa-arrow-circle-right"></i>
					
					<!-- flowchart 3 -->
					<div class="flowchart-operator osl-flowchart__operator border" data-operator-id="previewOperator">
						<div class="flowchart-operator-function hide"></div>
						<div class="flowchart-operator-title">
							<div class="flowchart-operator-title__lebel">작업흐름 명</div>
							<div class="flowchart-operator-menu hide">
								<button type="button" class="btn btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-bars kt-padding-r-0"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-right">
									<div class="dropdown-item" data-flow-action="update">
										<i class="fa fa fa-edit kt-font-primary"></i>수정
									</div>
									<div class="dropdown-item" data-flow-action="delete">
										<i class="fa fa fa-trash kt-font-primary"></i>삭제
									</div>
								</div>
							</div>
						</div>
						<div class="flowchart-operator-inputs-outputs kt-margin-0">
							<div class="flowchart-operator-inputs text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="flowchart-operator-outputs text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
						</div>
					</div>
					
					<!-- 화살표 3 -->
					<i class="fas fa-arrow-circle-right"></i>
					
					<!-- flowchart 4 -->
					<div class="flowchart-operator osl-flowchart__operator border" data-operator-id="previewOperator">
						<div class="flowchart-operator-function hide"></div>
						<div class="flowchart-operator-title">
							<div class="flowchart-operator-title__lebel">작업흐름 명</div>
							<div class="flowchart-operator-menu hide">
								<button type="button" class="btn btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-bars kt-padding-r-0"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-right">
									<div class="dropdown-item" data-flow-action="update">
										<i class="fa fa fa-edit kt-font-primary"></i>수정
									</div>
									<div class="dropdown-item" data-flow-action="delete">
										<i class="fa fa fa-trash kt-font-primary"></i>삭제
									</div>
								</div>
							</div>
						</div>
						<div class="flowchart-operator-inputs-outputs kt-margin-0">
							<div class="flowchart-operator-inputs text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="flowchart-operator-outputs text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
						</div>
					</div>
					
					<!-- 화살표 4 -->
					<i class="fas fa-arrow-circle-right"></i>
					
					<!-- flowchart 5 -->
					<div class="flowchart-operator osl-flowchart__operator border" data-operator-id="previewOperator">
						<div class="flowchart-operator-function hide"></div>
						<div class="flowchart-operator-title">
							<div class="flowchart-operator-title__lebel">작업흐름 명</div>
							<div class="flowchart-operator-menu hide">
								<button type="button" class="btn btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-bars kt-padding-r-0"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-right">
									<div class="dropdown-item" data-flow-action="update">
										<i class="fa fa fa-edit kt-font-primary"></i>수정
									</div>
									<div class="dropdown-item" data-flow-action="delete">
										<i class="fa fa fa-trash kt-font-primary"></i>삭제
									</div>
								</div>
							</div>
						</div>
						<div class="flowchart-operator-inputs-outputs kt-margin-0">
							<div class="flowchart-operator-inputs text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="flowchart-operator-outputs text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
						</div>
					</div>
					
					<!-- 화살표 5 -->
					<i class="fas fa-arrow-circle-right"></i>
					
					<!-- flowchart 6 -->
					<div class="flowchart-operator osl-flowchart__operator border" data-operator-id="previewOperator">
						<div class="flowchart-operator-function hide"></div>
						<div class="flowchart-operator-title">
							<div class="flowchart-operator-title__lebel">작업흐름 명</div>
							<div class="flowchart-operator-menu hide">
								<button type="button" class="btn btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-bars kt-padding-r-0"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-right">
									<div class="dropdown-item" data-flow-action="update">
										<i class="fa fa fa-edit kt-font-primary"></i>수정
									</div>
									<div class="dropdown-item" data-flow-action="delete">
										<i class="fa fa fa-trash kt-font-primary"></i>삭제
									</div>
								</div>
							</div>
						</div>
						<div class="flowchart-operator-inputs-outputs kt-margin-0">
							<div class="flowchart-operator-inputs text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="flowchart-operator-outputs text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
						</div>
					</div>
				</div>
				<!-- end :: 그리드 -->

				<!-- begin :: 칸반 -->
				<div class="osl-dsh-kanban kt-margin-20 kt-hide">
					<!-- kanban 1 -->
					<div class="kt-portlet osl-w-px-300 border kt-margin-b-0">
						<div class="kt-portlet__head row kt-margin-0 kt-padding-0">
							<div class="col-12 kt-hide">
							</div>
							<div class="col-6 text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="col-6 text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
							<div class="col-12 text-center border-top kt-padding-10 font-border">작업흐름 명</div>
						</div>
						<div class="kt-portlet__body osl-kaban--card__body" processid="1">
							<!-- kanban_card 1-1 -->
							<div class="card kt-margin-t-10">
								<div class="card-header kt-padding-10 kt-font-bolder">
									요구사항 순번
								</div>
								<div class="card-body kt-padding-10">
									<div class="row">
										<div class="col-3">
											<div class="kt-profile__main-pic kt-media osl-media">
												<img id="usrImage" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000328">
									    	</div>
									    	<div class="w-100 text-center">홍길동</div>
							    		</div>
										<div class="col-9">
											<h5 class="card-title">요구사항명</h5>
											<p class="card-text">요청 내용</p>
										</div>
									</div>
								</div>
								<div class="card-footer kt-padding-0">
									<div class="row kt-margin-0">
										<div class="col-3 kt-padding-0">
											<div class="badge badge-success float-left kt-margin-r-20 w-100"><i class="fas fa-clock kt-margin-r-5"></i><span>0</span>일</div>
										</div>
										<div class="col-9">
											<div class="float-left text-center w-100 h-100 osl-line-height--23">2020-06-09 00:00:00</div>
										</div>
									</div>
								</div>
							</div>
							
							<!-- kanban_card 1-2 -->
							<div class="card kt-margin-t-10">
								<div class="card-header kt-padding-10 kt-font-bolder">
									요구사항 순번
								</div>
								<div class="card-body kt-padding-10">
									<div class="row">
										<div class="col-3">
											<div class="kt-profile__main-pic kt-media osl-media">
												<img id="usrImage" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000328">
									    	</div>
									    	<div class="w-100 text-center">홍길동</div>
							    		</div>
										<div class="col-9">
											<h5 class="card-title">요구사항명</h5>
											<p class="card-text">요청 내용</p>
										</div>
									</div>
								</div>
								<div class="card-footer kt-padding-0">
									<div class="row kt-margin-0">
										<div class="col-3 kt-padding-0">
											<div class="badge badge-warning float-left kt-margin-r-20 w-100"><i class="fas fa-clock kt-margin-r-5"></i><span>0</span>일</div>
										</div>
										<div class="col-9">
											<div class="float-left text-center w-100 h-100 osl-line-height--23">2020-06-09 00:00:00</div>
										</div>
									</div>
								</div>
							</div>
							
							<!-- kanban_card 1-3 -->
							<div class="card kt-margin-t-10">
								<div class="card-header kt-padding-10 kt-font-bolder">
									요구사항 순번
								</div>
								<div class="card-body kt-padding-10">
									<div class="row">
										<div class="col-3">
											<div class="kt-profile__main-pic kt-media osl-media">
												<img id="usrImage" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000328">
									    	</div>
									    	<div class="w-100 text-center">홍길동</div>
							    		</div>
										<div class="col-9">
											<h5 class="card-title">요구사항명</h5>
											<p class="card-text">요청 내용</p>
										</div>
									</div>
								</div>
								<div class="card-footer kt-padding-0">
									<div class="row kt-margin-0">
										<div class="col-3 kt-padding-0">
											<div class="badge badge-danger float-left kt-margin-r-20 w-100"><i class="fas fa-clock kt-margin-r-5"></i><span>50</span>일</div>
										</div>
										<div class="col-9">
											<div class="float-left text-center w-100 h-100 osl-line-height--23">2020-06-09 00:00:00</div>
										</div>
									</div>
								</div>
							</div>
							
							<!-- kanban_card 1-4 -->
							<div class="card kt-margin-t-10">
								<div class="card-header kt-padding-10 kt-font-bolder">
									요구사항 순번
								</div>
								<div class="card-body kt-padding-10">
									<div class="row">
										<div class="col-3">
											<div class="kt-profile__main-pic kt-media osl-media">
												<img id="usrImage" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000328">
									    	</div>
									    	<div class="w-100 text-center">홍길동</div>
							    		</div>
										<div class="col-9">
											<h5 class="card-title">요구사항명</h5>
											<p class="card-text">요청 내용</p>
										</div>
									</div>
								</div>
								<div class="card-footer kt-padding-0">
									<div class="row kt-margin-0">
										<div class="col-3 kt-padding-0">
											<div class="badge badge-danger float-left kt-margin-r-20 w-100"><i class="fas fa-clock kt-margin-r-5"></i><span>50</span>일</div>
										</div>
										<div class="col-9">
											<div class="float-left text-center w-100 h-100 osl-line-height--23">2020-06-09 00:00:00</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					 
					<!-- 화살표 1 -->
					<i class="fas fa-arrow-circle-right"></i>
					
					<!-- kanban 2 -->
					<div class="kt-portlet osl-w-px-300 border kt-margin-b-0">
						<div class="kt-portlet__head row kt-margin-0 kt-padding-0">
							<div class="col-12 kt-hide">
								
							</div>
							<div class="col-6 text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="col-6 text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
							<div class="col-12 text-center border-top kt-padding-10 font-border">작업흐름 명</div>
						</div>
						<div class="kt-portlet__body osl-kaban--card__body"  processid="2">
							<!-- kanban_card 2-1 -->
							<div class="card kt-margin-t-10">
								<div class="card-header kt-padding-10 kt-font-bolder">
									요구사항 순번
								</div>
								<div class="card-body kt-padding-10">
									<div class="row">
										<div class="col-3">
											<div class="kt-profile__main-pic kt-media osl-media">
												<img id="usrImage" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000328">
									    	</div>
									    	<div class="w-100 text-center">홍길동</div>
							    		</div>
										<div class="col-9">
											<h5 class="card-title">요구사항명</h5>
											<p class="card-text">요청 내용</p>
										</div>
									</div>
								</div>
								<div class="card-footer kt-padding-0">
									<div class="row kt-margin-0">
										<div class="col-3 kt-padding-0">
											<div class="badge badge-danger float-left kt-margin-r-20 w-100"><i class="fas fa-clock kt-margin-r-5"></i><span>50</span>일</div>
										</div>
										<div class="col-9">
											<div class="float-left text-center w-100 h-100 osl-line-height--23">2020-06-09 00:00:00</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end :: 칸반 -->
			</div>
			
			<!-- begin :: grid datatable -->
			<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0 kt-hide" id="processReqTable_1"></div>
			<!-- end :: grid datatable -->
		</div>
	</div>
	<!-- end:: 프로세스 목록 1 -->
	
	<!-- begin:: 프로세스 목록 2 -->
	<div class="kt-portlet kt-portlet--mobile" data-target-div="process2" id="processPortlet2">
		<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block">
			<div class="col-lg-7 col-md-12 col-sm-12 col-12 kt-padding-l-0 osl-display__flex osl-flex-flow--row osl-flex-flow--column-mobile">
				<h4 class="kt-font-boldest kt-font-brand kt-margin-r-10">
					<i class="fa fa-th-large kt-margin-r-5"></i>프로세스 명 2
				</h4>
				<h5 class="kt-font-bolder kt-font-brand osl-display__flex osl-flex-flow--row osl-flex-flow--column-mobile-430">
					<span class="kt-margin-r-20">
						(생성일: <span>2020-11-06 14:31</span>)
					</span>
					<span>
						담당<span class="badge osl-badge-brand kt-margin-l-5 kt-margin-r-10">7</span>
						전체<span class="badge osl-badge-brand kt-margin-l-5">7</span>
					</span>
				</h5>
			</div>
			<div class="col-lg-5 col-md-12 col-sm-12 col-12 text-right kt-padding-r-0">
	            <div class="kt-portlet__head-group">
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10 osl-view-type" data-view-type="grid" data-target-process="process2" title="칸반 그리드 전환" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
						<i class="fas fa-columns"></i>
					</button>
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10 osl-title--all-view-content on" title="빈 작업 흐름 숨기기" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
					</button>
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10" title="영역 새로고침" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
						<i class="fas fa-redo-alt"></i>
					</button>
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10" title="영역 전체화면" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
						<i class="fas fa-expand"></i>
					</button>
	            	<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air"><i class="fa fa-chevron-down"></i></a>
	            </div>
	         </div>
		</div>
		<div class="kt-portlet__body kt-padding-10">
			<div class="osl-dash-gridkaban-bg osl-overflow--x-auto">
				<!-- begin :: 그리드 -->
				<div class="osl-dsh-flowchart kt-margin-20">
					<!-- flowchart 1 -->
					<div class="flowchart-operator osl-flowchart__operator border" data-operator-id="previewOperator">
						<div class="flowchart-operator-function hide"></div>
						<div class="flowchart-operator-title">
							<div class="flowchart-operator-title__lebel">작업흐름 명</div>
							<div class="flowchart-operator-menu hide">
								<button type="button" class="btn btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-bars kt-padding-r-0"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-right">
									<div class="dropdown-item" data-flow-action="update">
										<i class="fa fa fa-edit kt-font-primary"></i>수정
									</div>
									<div class="dropdown-item" data-flow-action="delete">
										<i class="fa fa fa-trash kt-font-primary"></i>삭제
									</div>
								</div>
							</div>
						</div>
						<div class="flowchart-operator-inputs-outputs kt-margin-0">
							<div class="flowchart-operator-inputs text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="flowchart-operator-outputs text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
						</div>
					</div>
					<i class="fas fa-arrow-circle-right"></i>
					<div class="flowchart-operator osl-flowchart__operator border" data-operator-id="previewOperator">
						<div class="flowchart-operator-function hide"></div>
						<div class="flowchart-operator-title">
							<div class="flowchart-operator-title__lebel">작업흐름 명</div>
							<div class="flowchart-operator-menu hide">
								<button type="button" class="btn btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-bars kt-padding-r-0"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-right">
									<div class="dropdown-item" data-flow-action="update">
										<i class="fa fa fa-edit kt-font-primary"></i>수정
									</div>
									<div class="dropdown-item" data-flow-action="delete">
										<i class="fa fa fa-trash kt-font-primary"></i>삭제
									</div>
								</div>
							</div>
						</div>
						<div class="flowchart-operator-inputs-outputs kt-margin-0">
							<div class="flowchart-operator-inputs text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="flowchart-operator-outputs text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
						</div>
					</div>
					
					<!-- 화살표 1 -->
					<i class="fas fa-arrow-circle-right"></i>
					
					<!-- flowchart 2 -->
					<div class="flowchart-operator osl-flowchart__operator border" data-operator-id="previewOperator">
						<div class="flowchart-operator-function hide"></div>
						<div class="flowchart-operator-title">
							<div class="flowchart-operator-title__lebel">작업흐름 명</div>
							<div class="flowchart-operator-menu hide">
								<button type="button" class="btn btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-bars kt-padding-r-0"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-right">
									<div class="dropdown-item" data-flow-action="update">
										<i class="fa fa fa-edit kt-font-primary"></i>수정
									</div>
									<div class="dropdown-item" data-flow-action="delete">
										<i class="fa fa fa-trash kt-font-primary"></i>삭제
									</div>
								</div>
							</div>
						</div>
						<div class="flowchart-operator-inputs-outputs kt-margin-0">
							<div class="flowchart-operator-inputs text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="flowchart-operator-outputs text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
						</div>
					</div>
				</div>
				<!-- end :: 그리드 -->
				<!-- begin :: 칸반 -->
				<div class="osl-dsh-kanban kt-margin-20 kt-hide">
					<!-- kanban -->
					<div class="kt-portlet osl-w-px-300 border kt-margin-b-0">
						<div class="kt-portlet__head row kt-margin-0 kt-padding-0">
							<div class="col-12 kt-hide">
							</div>
							<div class="col-6 text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="col-6 text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
							<div class="col-12 text-center border-top kt-padding-10 font-border">작업흐름 명</div>
						</div>
						<div class="kt-portlet__body osl-kaban--card__body" processid="3">
							
							<!-- kanban_card 3-1 -->
							<div class="card kt-margin-t-10">
								<div class="card-header kt-padding-10 kt-font-bolder">
									요구사항 순번
								</div>
								<div class="card-body kt-padding-10">
									<div class="row">
										<div class="col-3">
											<div class="kt-profile__main-pic kt-media osl-media">
												<img id="usrImage" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000328">
									    	</div>
									    	<div class="w-100 text-center">홍길동</div>
							    		</div>
										<div class="col-9">
											<h5 class="card-title">요구사항명</h5>
											<p class="card-text">요청 내용</p>
										</div>
									</div>
								</div>
								<div class="card-footer kt-padding-0">
									<div class="row kt-margin-0">
										<div class="col-3 kt-padding-0">
											<div class="badge badge-warning float-left kt-margin-r-20 w-100"><i class="fas fa-clock kt-margin-r-5"></i><span>0</span>일</div>
										</div>
										<div class="col-9">
											<div class="float-left text-center w-100 h-100 osl-line-height--23">2020-06-09 00:00:00</div>
										</div>
									</div>
								</div>
							</div>
							
							<!-- kanban_card 3-2 -->
							<div class="card kt-margin-t-10">
								<div class="card-header kt-padding-10 kt-font-bolder">
									요구사항 순번
								</div>
								<div class="card-body kt-padding-10">
									<div class="row">
										<div class="col-3">
											<div class="kt-profile__main-pic kt-media osl-media">
												<img id="usrImage" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000328">
									    	</div>
									    	<div class="w-100 text-center">홍길동</div>
							    		</div>
										<div class="col-9">
											<h5 class="card-title">요구사항명</h5>
											<p class="card-text">요청 내용</p>
										</div>
									</div>
								</div>
								<div class="card-footer kt-padding-0">
									<div class="row kt-margin-0">
										<div class="col-3 kt-padding-0">
											<div class="badge badge-danger float-left kt-margin-r-20 w-100"><i class="fas fa-clock kt-margin-r-5"></i><span>50</span>일</div>
										</div>
										<div class="col-9">
											<div class="float-left text-center w-100 h-100 osl-line-height--23">2020-06-09 00:00:00</div>
										</div>
									</div>
								</div>
							</div>
							
							<!-- kanban_card 3-3 -->
							<div class="card kt-margin-t-10">
								<div class="card-header kt-padding-10 kt-font-bolder">
									요구사항 순번
								</div>
								<div class="card-body kt-padding-10">
									<div class="row">
										<div class="col-3">
											<div class="kt-profile__main-pic kt-media osl-media">
												<img id="usrImage" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000328">
									    	</div>
									    	<div class="w-100 text-center">홍길동</div>
							    		</div>
										<div class="col-9">
											<h5 class="card-title">요구사항명</h5>
											<p class="card-text">요청 내용</p>
										</div>
									</div>
								</div>
								<div class="card-footer kt-padding-0">
									<div class="row kt-margin-0">
										<div class="col-3 kt-padding-0">
											<div class="badge badge-danger float-left kt-margin-r-20 w-100"><i class="fas fa-clock kt-margin-r-5"></i><span>50</span>일</div>
										</div>
										<div class="col-9">
											<div class="float-left text-center w-100 h-100 osl-line-height--23">2020-06-09 00:00:00</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end :: 칸반 -->
			</div>
			
			<!-- begin :: grid datatable -->
			<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0 kt-hide" id="processReqTable_2"></div>
			<!-- end :: grid datatable -->
		</div>
	</div>
	<!-- end:: 프로세스 목록 2 -->
	
	<!-- begin :: 스프린트 -->
	<div class="kt-portlet kt-portlet--mobile" id="sprPortlet1">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<!-- begin :: 순서, 기간 -->
			<div class="kt-portlet__head-label">
				<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid">
					<input type="checkbox" value="0" data-datatable-id="spr1000Table">&nbsp;
					<span></span>
				</label>
				<!-- <h5 class="kt-font-boldest">
					<span class="badge badge-primary kt-margin-r-10">No. 1</span>
				</h5>
				<h5>
					<span class="badge badge-primary" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="스프린트 기간">
						<i class="far fa-calendar-alt kt-margin-r-10"></i>2020-10-16 ~ 2020-10-16
					</span>
				</h5> -->
				<h4 class="kt-font-boldest text-truncate kt-font-brand" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="두번쨰 프로젝트 - 9월 2주차 스프린트"> 두번쨰 프로젝트 - 9월 2주차 스프린트</h4>
			</div>
			<!-- end :: 순서, 기간 -->
			<!-- begin :: 드롭다운 메뉴 -->
			<div class="kt-portlet__head-toolbar">
				<div class="dropdown dropdown-inline">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bars osl-padding-r0"></i></button>
					<div class="dropdown-menu dropdown-menu-right" data-datatable-rownum="0">
						<div class="dropdown-item" data-datatable-id="spr1000Table" data-datatable-expans="dropdown" data-datatable-action="update">
							<i class="fa fa-edit kt-font-brand"></i>
							스프린트 수정
						</div>
						<div class="dropdown-item" data-datatable-id="spr1000Table" data-datatable-expans="dropdown" data-datatable-action="delete">
							<i class="fa fa-trash kt-font-brand"></i>스프린트 삭제
						</div>
						<div class="dropdown-divider"></div>
						<div class="dropdown-item" data-datatable-id="spr1000Table" data-datatable-expans="dropdown" data-datatable-action="sprStart"><i class="fas fa-play-circle kt-font-brand"></i>스프린트 시작</div>
						<div class="dropdown-item" data-datatable-id="spr1000Table" data-datatable-expans="dropdown" data-datatable-action="sprEnd"><i class="fas fa-stop-circle kt-font-brand"></i>스프린트 종료</div>
						<div class="dropdown-divider"></div>
						<div class="dropdown-item" data-datatable-id="spr1000Table" data-datatable-expans="dropdown" data-datatable-action="dblClick"><i class="fas fa-clipboard-list kt-font-brand"></i>스프린트 상세정보</div>
					</div>
				</div>
				<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air"><i class="fa fa-chevron-down"></i></a>
			</div>
			<!-- end :: 드롭다운 메뉴 -->
			
		</div>
		<!-- begin :: 내용 영역 -->
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
					<!-- 진행 상태, 제목, 내용 -->
					<div class="d-flex kt-padding-l-15 align-items-center">
						<div class="kt-media kt-media--xl kt-media--circle kt-media--primary osl-margin-r-2rm"><span>대기</span></div>
						<div class="d-flex flex-column osl-margin-r-auto osl-word__break">
							<span class="text-muted text-truncate" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="두번쨰 프로젝트 - 9월 2주차 스프린트</br>ㅁ</br>입니다.">두번쨰 프로젝트 - 9월 2주차 스프린트<br>ㅁ<br>입니다.</span>
						</div>
					</div>
					<!-- 시작일, 종료일, 진척률 -->
					<div class="d-flex flex-wrap osl-margin-t-2rm kt-padding-l-20">
						<div class="osl-margin-r-3rm osl-margin-b-175rm d-flex flex-column"><span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>시작일</span>
							<h5><span class="badge badge-primary">2020-10-16</span></h5>
						</div>
						<div class="osl-margin-r-3rm kt-margin-0-mobile osl-margin-b-175rm d-flex flex-column"><span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>종료일</span>
							<h5><span class="badge badge-danger">2020-10-16</span></h5>
						</div>
						<div class="osl-flex-row-fluid osl-margin-b-175rm">
							<div class="osl-progress">
								<div class="osl-margin-b-1rm"><i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i><span>진척률</span></div>
								<div class="progress osl-prj-group-md">
									<div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width:0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- begin :: 진행 요구사항 개수, 평균 완료 시간 -->
				<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
					<div class="osl-widget osl-flex-row-fluid flex-wrap">
						<div class="osl-widget-info__item osl-flex-row-fluid osl-spr-btn osl-cursor-pointer">
							<div class="osl-widget-info__item-icon d-block">
								<img src="/media/osl/icon/reqAll.png">
							</div>
							<div class="osl-widget-info__item-info">
								<a href="#" class="osl-widget-info__item-title">전체</a>
								<div class="osl-widget-info__item-desc">0</div>
							</div>
						</div>
						<div class="osl-widget-info__item osl-flex-row-fluid osl-spr-btn osl-cursor-pointer">
							<div class="osl-widget-info__item-icon d-block">
								<img src="/media/osl/icon/reqInProgress.png">
							</div>
							<div class="osl-widget-info__item-info">
								<a href="#" class="osl-widget-info__item-title">진행 중</a>
								<div class="osl-widget-info__item-desc">0</div>
							</div>
						</div>
					</div>
					<div class="osl-widget osl-flex-row-fluid flex-wrap">
						<div class="osl-widget-info__item osl-flex-row-fluid osl-spr-btn osl-cursor-pointer">
							<div class="osl-widget-info__item-icon d-block">
								<img src="/media/osl/icon/reqDone.png">
							</div>
							<div class="osl-widget-info__item-info">
								<a href="#" class="osl-widget-info__item-title">완료</a>
								<div class="osl-widget-info__item-desc">0</div>
							</div>
						</div>
						<div class="osl-widget-info__item osl-flex-row-fluid">
							<div class="osl-widget-info__item-icon d-block">
								<img src="/media/osl/icon/reqPointer.png">
							</div>
							<div class="osl-widget-info__item-info">
								<a href="#" class="osl-widget-info__item-title">평균 완료 시간</a>
								<div class="osl-widget-info__item-desc">0.0</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end :: 진행 요구사항 개수, 평균 완료 시간 -->
				<!-- begin :: 차트 영역 -->
				<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
					<div class="border osl-min-h-px--170">차트</div>
                </div>
				<!-- end :: 차트 영역 -->
            </div>
            <!-- begin :: grid datatable -->
			<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0 kt-hide" id="processReqTable_3"></div>
			<!-- end :: grid datatable -->
        </div>
		<!-- end :: 내용 영역 -->
    </div>
    <!-- end :: 스프린트 -->
    
 <script>
"use strict";
var OSLDsh2000Popup = function () {
	//비밀 요구사항인 경우 접근 권한 확인하기 위한 변수
	//var reqAuth = false;
	var reqDatatableId = "req4100ReqTable";
	var prjRequestAcceptCd = "02";
	var portletAll=[];
	
	//타이머
	var timerVarSel;
	var secondTime;
	var timer;
	
	var documentSetting = function(){
		
		//function
		$("#timerVarSel").change(function(){
			fnDashBoardSetting();
		});
		$("#autoRefreshEndBtn").click(function(){
			fnAutoRefreshEnd();
		});
		$("#autoRefreshRedoBtn").click(function(){
			fnDashBoardSetting();
		});
		$("#dshWidgetSortBtn").click(function(){
			fnDshWidgetSort(this);
		});
		
		portletAll.push(new KTPortlet('prjTopInfo', $.osl.lang("portlet")));
		portletAll.push(new KTPortlet('newReq', $.osl.lang("portlet")));
		portletAll.push(new KTPortlet('reqChargeSign', $.osl.lang("portlet")));
		portletAll.push(new KTPortlet('reqChargeDpl', $.osl.lang("portlet")));
		portletAll.push(new KTPortlet('processPortlet1', $.osl.lang("portlet")));	
		portletAll.push(new KTPortlet('processPortlet2', $.osl.lang("portlet")));	
		portletAll.push(new KTPortlet('sprPortlet1', $.osl.lang("portlet")));	
		
		$('#allPortletClose').click(function(){
			//debugger;
			var parentPortlet = $(this).parents('.kt-portlet');
			
				//닫힌여부판단
				if(parentPortlet.hasClass('kt-portlet--collapse')){
					$.each(portletAll,function(idx,map){
						//열리기
						map.expand();
						parentPortlet.removeClass('kt-portlet--collapse');
					});
				}else{
					$.each(portletAll,function(idx,map){
						//닫히기
						map.collapse();
						parentPortlet.addClass('kt-portlet--collapse');
					});
				}
		});
		
		fnDashBoardSetting();
		
		//현재 프로젝트가 접수 기능 사용인지 체크
		var prjRequestAcceptCd = $.osl.prjGrpAuthList[$.osl.selPrjGrpId].prjList[$.osl.selPrjId].prjRequestAcceptCd;
		
		//접수 기능 사용인경우 접수 버튼 show
		if(prjRequestAcceptCd == "01"){
			$("button[data-datatable-id="+reqDatatableId+"][data-datatable-action=requestAccept]").removeClass("kt-hide");
		}
		
		//접수대기 데이터테이블 세팅
		$.osl.datatable.setting(reqDatatableId,{
			data: {
				source: {
					read: {
						url: "/req/req4000/req4100/selectReq4100ReqListAjax.do",
						params:{
							dshReqProTypeCd : "01",
							prjGrpId : $.osl.selPrjGrpId,
							prjId: $.osl.selPrjId, 
						}
					}
				},
				pageSize : 5,

			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100],
						//페이지 그룹단위 변경
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 5
							}
						}
					 }
				 }
			 },
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'prjNm', title: '프로젝트명', textAlign: 'left', width: 180, sortable: false},
				{field: 'reqOrd', title: '요청번호', textAlign: 'left', width: 110, autoHide: false, search: true},
				{field: 'reqGrpNo', title: '그룹 요구 번호', textAlign: 'left', width: 110, search: true,
					template: function (row) {
						if($.osl.isNull(row.reqGrpNo)){
							return $.osl.lang("req4100.message.nothing");
						}else{
							return row.reqGrpNo;
						}
					}
				},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 100, search: true, searchType:"date",
					template: function (row) {
						var paramDatetime = new Date(row.regDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
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
							return row.reqChargerNm = "-";
						}else{
							var usrData = {
								html: row.reqChargerNm,
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
							};
							return $.osl.user.usrImgSet(row.reqChargerImgId, usrData);
						}
					},
					onclick: function(rowData){
						if(rowData.reqChargerNm != "-"){
							$.osl.user.usrInfoPopup(rowData.reqChargerId);
						}
					}
				},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 340, search: true, autoHide: false,
					/* 
					template: function(row){
						var resultStr = $.osl.escapeHtml(row.reqNm);
						//비밀번호가 있는 경우
						if(row.reqPw == "Y"){
							resultStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
						}
						return resultStr;
					}
					 */
				},
			],
			searchColumns:[
				{field: 'reqDesc', title: $.osl.lang("req4100.field.reqDesc"), searchOrd: 6}
			],
			rows:{
				clickCheckbox: true
			},
			actionBtn:{
				"title" : "상세",
				"update" : false,
				"delete" : false,
				"dblClick": true,
				"refresh" : true,
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("req4100.actionBtn.detailBtn"),
			},
			actionFn:{
				"refresh": function(rowData, datatableId, type, rowNum){
					//검색바 초기화
					searchReset(datatableId);
					//데이터 테이블 재조회
					$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
				},
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
							//modalSize: 'xl'
							//closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4102View.do',data,options);
				},
				"requestAccept": function(rowDatas, datatableId, type, rowNum){
					if(rowDatas == 0){
						$.osl.alert($.osl.lang("req4100.alert.selectData"));
						return false;
					}else{
						
						//각 요구사항 Id,프로젝트 ID값 구하기
						var selReqInfoList = [];
						
						//선택 요구사항 중 처리유형이 "접수대기"가 아닌 요구사항 수
						var reqProChkCnt = 0;
						
						$.each(rowDatas, function(idx, map){
							//접수유형이 "접수대기"가 아닌 경우 제외
							if(map.reqProType == "01"){
								selReqInfoList.push({prjId: map.prjId, reqId: map.reqId});
							}else{
								reqProChkCnt++;
								return true;
							}
						});
						
						var data = {
								paramSelReqInfoList: JSON.stringify(selReqInfoList)
						};
						var options = {
							autoHeight: false,
							modalSize: "xl",
							idKey: datatableId,
							modalTitle: $.osl.lang("prj1102.update.title"),
							closeConfirm: false,
						};

						//선택 요구사항이 모두 접수 불가인경우 중지
						if(rowDatas.length == reqProChkCnt){
							$.osl.alert("접수 가능한 요구사항이 선택되지 않았습니다.");
							return false;
						}
						
						$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6200View.do',data,options);
						
						if(reqProChkCnt > 0){
							$.osl.alert(reqProChkCnt+"건의 접수대기가 아닌 요구사항을 제외했습니다.");
						}
					}
				}
			},
			theme:{
				actionBtn:{
					"dblClick" : "",
					"refresh" : " kt-hide",
				},
				actionBtnIcon:{
					"dblClick" : "fas fa-external-link-alt",
				}
			},
			callback :{
				ajaxDone: function(evt, list){
					var reqListCnt = $.osl.datatable.list.req4100ReqTable.targetDt.lastResponse.meta.total;
					$("#reqListCnt").text(reqListCnt);
				}
			}
		});
		

		//담당 요구사항 결재 목록 데이터테이블 세팅
		$.osl.datatable.setting("reqChargeSignTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				pageSize : 5,

			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100],
						//페이지 그룹단위 변경
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 5
							}
						}
					 }
				 }
			 },
			columns: [
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false},
				{field: '', title: '프로젝트 명', textAlign: 'center', width: 150},
				{field: '', title: '결재 상태', textAlign: 'center', width: 70},
				{field: '', title: '작업흐름', textAlign: 'center', width: 100},
				{field: '', title: '결재자', textAlign: 'center', width: 70},
				{field: '', title: '결재 요청 일자', textAlign: 'center', width: 150},
				{field: '', title: '요청자', textAlign: 'center', width: 70},
				{field: '', title: '반려 내용', textAlign: 'center', width: 200}
			],
			actionBtn:{
				"dblClick": false
			},
			actionTooltip:{
				"update": "수정",
				"delete": "삭제",
				"dblClick": "상세보기"
			},
			actionFn:{
				"insert":function(datatableId){
					
				},
				"update":function(rowData){
					
				},
				"delete":function(rowDataList){
					
					
				}
			}
		});
		
		
		//담당 배포계획 결재 목록 데이터테이블 세팅
		$.osl.datatable.setting("reqChargeDplTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				pageSize : 5,

			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100],
						//페이지 그룹단위 변경
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 5
							}
						}
					 }
				 }
		 	},
			columns: [
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false},
				{field: '', title: '프로젝트 명', textAlign: 'center', width: 150},
				{field: '', title: '결재 상태', textAlign: 'center', width: 70},
				{field: '', title: '요청자', textAlign: 'center', width: 70},
				{field: '', title: '결재자', textAlign: 'center', width: 70},
				{field: '', title: '결재 요청 일자', textAlign: 'center', width: 100},
				{field: '', title: '배포계획명', textAlign: 'center', width: 150},
				{field: '', title: '결재 의견', textAlign: 'center', width: 150},
				{field: '', title: '반려내용', textAlign: 'center', width: 150}
			],
			actionBtn:{
				"dblClick": false
			},
			actionTooltip:{
				"update": "수정",
				"delete": "삭제",
				"dblClick": "상세보기"
			},
			actionFn:{
				"insert":function(datatableId){
					
				},
				"update":function(rowData){
					
				},
				"delete":function(rowDataList){
					
					
				}
			}
		});
		
		//그리드 형, 칸반형
		$('.osl-view-type').click(function(){
			var targetType = $(this).data('view-type');
			var targetObj = $(this).data('target-process');
			var targetDiv = $('div[data-target-div='+targetObj+']');
			var targetParent = $(this).parents('.kt-portlet');
			//현재 viewType에 따라 show/hide
			if(targetType=='grid'){
				//칸반 형식으로 변경
				targetDiv.find(".osl-dsh-flowchart").addClass('kt-hide');
				targetDiv.find(".osl-dsh-kanban").removeClass('kt-hide');
				$(this).data('view-type','kaban');
				
				//데이터 테이블이 열려있을 때 숨김처리
				$(targetParent).find('.kt_datatable').addClass('kt-hide');
				return false;
			}else if(targetType=='kaban'){
				//데이터테이블 형식으로 변경
				targetDiv.find(".osl-dsh-kanban").addClass('kt-hide');
				targetDiv.find(".osl-dsh-flowchart").removeClass('kt-hide');
				$(this).data('view-type','grid');
				return false;	
			}
		});
		
		//프로세스 단계 카드 클릭 시 요구사항 테이블 활성화
		$('.flowchart-operator-outputs,.flowchart-operator-inputs').click(function(){
			//debugger;
			var target = $(this).parents('.kt-portlet__body');
			$(target).children('.kt_datatable').removeClass('kt-hide');
			
			//데이터 테이블 조회
			var targetId = $(this).parents('.kt-portlet').data("target-div");
			if(targetId=='process1'){
				processTableSetting('1');
			}else if(targetId=='process2'){
				processTableSetting('2');
			}
		});
		
		//스프린트 진행상황 클릭 시 요구사항 테이블 활성화
		$('.osl-spr-btn').click(function(){
			//debugger;
			var target = $(this).parents('.kt-portlet__body');
			$(target).children('.kt_datatable').removeClass('kt-hide');
			
			processTableSetting('3');
		});
		
		
		/*칸반 sortable*/
		new Sortable($('.osl-kaban--card__body[processid="1"]')[0], {
			group:'shared',
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        //이동될 div(나갈)
	        onMove:function(evt,originalEvent){
				var UserAgent = navigator.userAgent;
				//모바일 기기 일시 동작 정지
				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
					return false;
				}else{
					return true;
				}
				/*여기에 동작 후 event 작성하시면 됩니다*/				
			},
	      	//해당 div로 이동될 대상의 동작(들어온)
			onAdd:function(evt){
				/*여기에 동작 후 event 작성하시면 됩니다*/
			}
	    });
		new Sortable($('.osl-kaban--card__body[processid="2"]')[0], {
			group:'shared',
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        //이동될 div(나갈)
	        onMove:function(evt,originalEvent){
				var UserAgent = navigator.userAgent;
				//모바일 기기 일시 동작 정지
				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
					return false;
				}else{
					return true;
				}
				/*여기에 동작 후 event 작성하시면 됩니다*/
			},
	      	//해당 div로 이동될 대상의 동작(들어온)
			onAdd:function(evt){
				/*여기에 동작 후 event 작성하시면 됩니다*/
			}
	    });
		new Sortable($('.osl-kaban--card__body[processid="3"]')[0], {
			group:'shared',
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        //이동될 div(나갈)
	        onMove:function(evt,originalEvent){
				var UserAgent = navigator.userAgent;
				//모바일 기기 일시 동작 정지
				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
					return false;
				}else{
					return true;
				}
				/*여기에 동작 후 event 작성하시면 됩니다*/
			},
	      	//해당 div로 이동될 대상의 동작(들어온)
			onAdd:function(evt){
				/*여기에 동작 후 event 작성하시면 됩니다*/
			}
	    });
	};
	
	/**
	 * 비밀글인 경우 접근 권한있는지 확인
	 * param : usrId : 권한 체크하려는 회원 id
	 * param : reqId : 권한 체크하려는 요구사항 id
	 */
	var checkAuth = function(usrId, reqId){
		var data = {
				usrId : usrId,
				reqId : reqId
		};
		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/req/req4000/req4100/selectReq4100UserCheckAjax.do'/>", "async": true}
				, data);
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var result = data.reqAuth;
				if(result == "Y"){
					reqAuth = true;
				}else{
					reqAuth = false;
				}
			}
    	});
		//ajax 전송
    	ajaxObj.send();
	};
	
	//요구사항 데이터 테이블 세팅 
	var processTableSetting = function(tablenum){
		$.osl.datatable.setting("processReqTable_"+tablenum,{
			data: {
				source: {
					read: {
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				pageSize : 5,
	
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100],
						//페이지 그룹단위 변경
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 5
							}
						}
					 }
				 }
		 	},
			columns: [
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false},
				{field: '', title: '순번', textAlign: 'center', width: 100},
				{field: '', title: '처리 상태', textAlign: 'center', width: 100},
				{field: '', title: '결재 상태', textAlign: 'center', width: 100},
				{field: '', title: '결재자', textAlign: 'center', width: 100},
				{field: '', title: '담당자', textAlign: 'center', width: 100},
				{field: '', title: '요청 제목', textAlign: 'center', width: 150},
				{field: '', title: '요청 내용', textAlign: 'center', width: 150},
				{field: '', title: '작업 시작일자', textAlign: 'center', width: 130},
				{field: '', title: '작업 종료일자', textAlign: 'center', width: 130},
				{field: '', title: '작업 시작 예정일자', textAlign: 'center', width: 130},
				{field: '', title: '작업 종료 예정일자', textAlign: 'center', width: 130},
				{field: '', title: '요청일자', textAlign: 'center', width: 100},
				{field: '', title: '요청자', textAlign: 'center', width: 100},
				{field: '', title: '이메일', textAlign: 'center', width: 130},
				{field: '', title: '연락처', textAlign: 'center', width: 130}
			],
			actionBtn:{
				"dblClick": false
			},
			actionTooltip:{
				"update": "수정",
				"delete": "삭제",
				"dblClick": "상세보기"
			},
			actionFn:{
				"insert":function(datatableId){
					
				},
				"update":function(rowData){
					
				},
				"delete":function(rowDataList){
					
					
				}
			}
		});
	}

	var fnDashBoardSetting = function(){
		//자동 새로고침 타이머 세팅
		timerVarSel = $('#timerVarSel').val();
		secondTime = (timerVarSel*60);
		clearInterval(timer);
		timer = setInterval(printTime,1000);
	};

	//실시간 시간 구하기
	var printTime = function() {
		var timerStr = Math.floor(secondTime/60) + "분 " + (secondTime%60) + "초";
		$('#autoRefreshSpan').html(timerStr);
		secondTime--;
		
		if (secondTime < 0) {
			clearInterval(timer);
			fnDashBoardSetting();
		}
	};

	//자동 새로고침 끄기
	var fnAutoRefreshEnd = function(){
		clearInterval(timer);
		$('#autoRefreshSpan').html("<i class='fa fa-infinity'></i>");
		timer = null;
	};
	
	//대시보드 위젯 정렬 기능 활성화
	var fnDshWidgetSort = function(thisObj){
		//위젯 정렬 기능 비활성화 시 공통 소스
		function innerFnCommonSortEnd(){
			//arrow css 제거
			$(".dshSortArrowAlt").removeClass("dshSortArrowAlt");
			
			//자동 갱신 시작
			timer = setInterval('printTime()',1000);
			
			//버튼 상태 변경
			$(thisObj).attr("data-flag","false");
			
			//초기화 버튼 감추기
			$(".dshWidgetSortCancelBtn").addClass("widgetCancelDisabled");
		}
		
		var flag = $(thisObj).attr("data-flag");
		
		//비활성화 상태
		if(flag == "false"){
			//타이틀바에 arrow css 대입
			$(".dshSortableItem, .dshSortableItem > .dsh_title_box").addClass("dshSortArrowAlt");
			
			//자동 갱신 중지
			fnAutoRefreshEnd();
			
			//버튼 상태 변경
			$(thisObj).attr("data-flag","true");
			
			//초기화 버튼 보이기
			$(".widgetCancelDisabled").removeClass("widgetCancelDisabled");
			
			//위젯 이동 부여
			sortable.option("disabled",false);
			
			//현재 항목 정렬 정보 저장
			sortBeforeData = sortable.toArray();
		}else{ //활성화 상태
			if(!gfnIsNull(sortable)){
				sortable.option("disabled",true);

				//현재 항목 정렬정보 가져오기
				var currentSortDataList = sortable.toArray();
				
				//항목 정보 변경됬는지 체크
				if(JSON.stringify(sortBeforeData) != JSON.stringify(currentSortDataList)){
					jConfirm("변경된 항목 정보를 저장하시겠습니까?", "알림창", function( result ) {
						if( result ){
							//위치 이동된 경우 저장
							var sortDataArr = [];
							
							$.each(currentSortDataList, function(idx, map){
								//데이터 push
								sortDataArr.push({sortId: map, ord: (idx+1)});
							});

							//항목 Id 삭제 목록에 추가
							//sortableDelList.push(sortId);
							
							//AJAX 설정
							var ajaxObj = new gfnAjaxRequestAction(
								{"url":"<c:url value='/dsh/dsh1000/dsh1000/insertDsh1000SortDataList.do'/>","loadingShow":true}
								,{sortDataArr: JSON.stringify(sortDataArr)});
							
							//AJAX 전송 성공 함수
							ajaxObj.setFnSuccess(function(data){
								toast.push("항목 정렬 정보를 저장했습니다.");
							});
							
							//AJAX 전송
							ajaxObj.send();
							
							//위젯 정렬 기능 비활성화 시 공통 소스
							innerFnCommonSortEnd();
						}
					});
				}else{
					//위젯 정렬 기능 비활성화 시 공통 소스
					innerFnCommonSortEnd();
				}
			}
		}
	};
	
	//대시보드 위젯 정렬 초기화
	var fnDshWidgetSortCancel = function(){
		//현재 항목 정렬정보 가져오기
		var currentSortDataList = sortable.toArray();
		
		//항목 정보 변경됬는지 체크
		if(JSON.stringify(sortBeforeData) != JSON.stringify(currentSortDataList)){
			jConfirm("변경된 항목 정보를 초기화 하시겠습니까?", "알림창", function( result ) {
				if( result ){
					$.each(sortBeforeData, function(idx, map){
						$("#osl_main_wrap").append($(".dshSortableItem[sortid="+map+"]"));
					});
				}
			});
		}else{
			toast.push("변경된 항목 정보가 없습니다.");
		}
	};
	
	/**
	* searchReset : 검색바 초기화
	* param : datatableId 초기화 시킬 검색바의 데이터 테이블 아이디
	*/
	var searchReset = function(datatableId){
		//드롭다운 메뉴 선택 활성화 취소 및 재선택
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item.active").attr("class", "dropdown-item");
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=-1]").attr("class", "dropdown-item active");
		
		//검색 메뉴 명 가져오기
		var searchBarMenuStr = $(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=-1]").text();
		
		//검색 메뉴 버튼 변경
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").parent().children(".btn.btn-secondary.dropdown-toggle").text(searchBarMenuStr);
		
		//select 감추기
		$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("style", "display:none;");
		$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("aria-hidden", "true");
		
		//input 보이기
		$("#searchData_"+datatableId).removeAttr("readonly");
		//그려진 캘린터 아이콘이 있는 경우 지우기
		$("#searchData_"+datatableId).parent().children("span").children().children().removeClass("la-calendar");
		
		//input에 검색 값 비우기
		$("#searchData_"+datatableId).val("");

		//전체 검색 막기
		//input disabled
		$("#searchData_"+datatableId).attr("disabled","disabled");
	};
	
	return {
        // public functions
        init: function() {
        	documentSetting();
    	}
    };
}();

$.osl.ready(function(){
	OSLDsh2000Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
