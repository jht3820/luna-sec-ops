<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block">
		<div class="col-lg-5 col-md-5 col-sm-12 col-12 kt-padding-l-0">
			<h3 class="kt-font-boldest kt-font-brand">
				대시보드 (프로젝트 그룹)
			</h3>
		</div>
		<div class="col-lg-7 col-md-12 col-sm-12 col-12 text-right kt-padding-r-0">
			<div class="kt-portlet__head-wrapper">
				<div class="dataAutoRefreshDiv" id="dataAutoRefreshDiv" guide="autoRefresh">
					<i class="fa fa-clock kt-font-brand"></i>
					<span id="autoRefreshSpan">00분 00초</span> 후 자동 갱신&nbsp;-
					<i class="fa fa-cogs autoRefresh_timeIcon"></i>&nbsp;
					<select class="autoRefresh_select osl-h-px-34 kt-margin-r-10" id="timerVarSel" onchange="fnDashBoardSetting()">
						<option value="0.5">30초</option>
						<option value="1">1분</option>
						<option value="5" selected>5분</option>
						<option value="10">10분</option>
						<option value="30">30분</option>
						<option value="60">1시간</option>
					</select>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" id="dshWidgetSortCancel" data-flag="false">
						<i class="fa fa-history kt-padding-r-0"></i>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" onclick="fnAutoRefreshEnd();">
						<i class="fas fa-expand-arrows-alt kt-padding-r-0"></i>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" id="dashBoardSetting">
						<i class="fa fa-redo kt-padding-r-0"></i>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" onclick="fnDshWidgetSort(this);" data-flag="false">
						<i class="fa fa-times kt-padding-r-0"></i>
					</button>
					<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md" id="allPortletClose"><i class="fas fa-chevron-down"></i></a>
				</div>
			</div>
		</div>
	</div>
</div>

	<div class="kt-portlet kt-portlet--mobile" id="prjTopInfo">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<div class="kt-portlet__head-label">
				<h4 class="kt-font-boldest kt-font-brand">
					프로젝트 그룹
				</h4>
			</div>
			<div class="kt-portlet__head-toolbar">
	            <div class="kt-portlet__head-group">
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10">
						<i class="fas fa-redo-alt"></i>
					</button>
	            	<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fas fa-chevron-down"></i></a>
	            </div>
	         </div>
		</div>
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-3 col-3 kt-padding-20">
					<div class="border osl-min-h-px--250">차트1</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-6 kt-padding-20">
					<div class="border osl-min-h-px--250">차트2</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-3 kt-padding-20">
					<div class="border osl-min-h-px--250">차트3</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="kt-portlet kt-portlet--mobile" id="newReq">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<div class="kt-portlet__head-label">
				<h4 class="kt-font-boldest kt-font-brand">
					접수대기 [총 <span>11</span>건]
				</h4>
			</div>
			<div class="kt-portlet__head-toolbar">
	            <div class="kt-portlet__head-group">
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10" data-datatable-id="req4100ReqTable" data-datatable-action="select" title="접수 대기 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
						<i class="fas fa-redo-alt"></i>
					</button>
                 	<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fas fa-chevron-down"></i></a>
	            </div>
	         </div>
		</div>
		<div class="kt-portlet__body">
			<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="req4100ReqTable"></div>
		</div>
	</div>
	
	
	
	<div class="row">
		
		<div class="col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile" id="reqChargeSign">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h4 class="kt-font-boldest kt-font-brand">
							담당 요구사항 결재 목록
						</h4>
					</div>
					<div class="kt-portlet__head-toolbar">
			            <div class="kt-portlet__head-group">
							<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10" data-datatable-id="reqChargeSignTable" data-datatable-action="select" title="담당 요구사항 결재 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
								<i class="fas fa-redo-alt"></i>
							</button>
		                 	<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fas fa-chevron-down"></i></a>
			            </div>
			         </div>
				</div>
				<div class="kt-portlet__body">
					<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="reqChargeSignTable"></div>
				</div>
			</div>
		</div>
		
		
		<div class="col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile" id="reqChargeDpl">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h4 class="kt-font-boldest kt-font-brand">
							담당 배포계획 결재 목록
						</h4>
					</div>
					<div class="kt-portlet__head-toolbar">
			            <div class="kt-portlet__head-group">
							<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10" data-datatable-id="reqChargeDplTable" data-datatable-action="select" title="담당 배포계획 결재 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
								<i class="fas fa-redo-alt"></i>
							</button>
		                  <a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fas fa-chevron-down"></i></a>
			            </div>
			         </div>
				</div>
				<div class="kt-portlet__body">
					<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="reqChargeDplTable"></div>
				</div>
			</div>
		</div>
		
	</div>
	
	
	
	<div class="kt-portlet kt-portlet--mobile" data-target-div="process1">
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
						담당<span class="badge badge-success kt-margin-l-5">7</span>
						전체<span class="badge badge-success kt-margin-l-5">7</span>
					</span>
				</h5>
			</div>
			<div class="col-lg-5 col-md-12 col-sm-12 col-12 text-right kt-padding-r-0">
	            <div class="kt-portlet__head-group">
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10 osl-view-type" data-view-type="grid" data-target-process="process1">
						<i class="fas fa-columns"></i>
					</button>
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10 osl-title--all-view-content on">
					</button>
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10">
						<i class="fas fa-redo-alt"></i>
					</button>
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10">
						<i class="fas fa-expand"></i>
					</button>
	            	<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fas fa-chevron-down"></i></a>
	            </div>
	         </div>
		</div>
		<div class="kt-portlet__body kt-padding-10">
			<div class="osl-dash-gridkaban-bg osl-overflow--x-auto">
				
				<div class="osl-dsh-flowchart kt-margin-20">
				
					
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
				</div>
				

				
				<div class="osl-dsh-kanban kt-margin-20 kt-hide">
					
					<div class="kt-portlet osl-width-300 border kt-margin-b-0">
						<div class="kt-portlet__head row kt-margin-0 kt-padding-0">
							<div class="col-12 kt-hide">
							</div>
							<div class="col-6 text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="col-6 text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
							<div class="col-12 text-center border-top kt-padding-10 font-border">작업흐름 명</div>
						</div>
						<div class="kt-portlet__body osl-kaban--card__body" processid="1">
							
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
					 
					
					<i class="fas fa-arrow-circle-right"></i>
					
					
					<div class="kt-portlet osl-width-300 border kt-margin-b-0">
						<div class="kt-portlet__head row kt-margin-0 kt-padding-0">
							<div class="col-12 kt-hide">
								
							</div>
							<div class="col-6 text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="col-6 text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
							<div class="col-12 text-center border-top kt-padding-10 font-border">작업흐름 명</div>
						</div>
						<div class="kt-portlet__body osl-kaban--card__body"  processid="2">
							
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
				
			</div>
			
			
			<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0 kt-hide" id="processReqTable_1"></div>
			
		</div>
	</div>
	
	
	
	<div class="kt-portlet kt-portlet--mobile" data-target-div="process2">
		<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block">
			<div class="col-lg-7 col-md-12 col-sm-12 col-12 kt-padding-l-0 osl-display__flex osl-flex-flow--row osl-flex-flow--column-mobile">
				<h4 class="kt-font-boldest kt-font-brand kt-margin-r-10">
					<i class="fa fa-th-large kt-margin-r-5"></i>프로세스 명2
				</h4>
				<h5 class="kt-font-bolder kt-font-brand osl-display__flex osl-flex-flow--row osl-flex-flow--column-mobile-430">
					<span class="kt-margin-r-20">
						(생성일: <span>2020-11-06 14:31</span>)
					</span>
					<span>
						담당<span class="badge badge-success kt-margin-l-5 kt-margin-r-10">7</span>
						전체<span class="badge badge-success kt-margin-l-5">7</span>
					</span>
				</h5>
			</div>
			<div class="col-lg-5 col-md-12 col-sm-12 col-12 text-right kt-padding-r-0">
	            <div class="kt-portlet__head-group">
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10 osl-view-type" data-view-type="grid" data-target-process="process2">
						<i class="fas fa-columns"></i>
					</button>
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10 osl-title--all-view-content on">
					</button>
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10">
						<i class="fas fa-redo-alt"></i>
					</button>
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10">
						<i class="fas fa-expand"></i>
					</button>
	            	<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fas fa-chevron-down"></i></a>
	            </div>
	         </div>
		</div>
		<div class="kt-portlet__body kt-padding-10">
			<div class="osl-dash-gridkaban-bg osl-overflow--x-auto">
				
				<div class="osl-dsh-flowchart kt-margin-20">
					
					
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
				</div>
				
				
				<div class="osl-dsh-kanban kt-margin-20 kt-hide">
					
					<div class="kt-portlet osl-width-300 border kt-margin-b-0">
						<div class="kt-portlet__head row kt-margin-0 kt-padding-0">
							<div class="col-12 kt-hide">
							</div>
							<div class="col-6 text-center kt-padding-10 osl-cursor-pointer"> 담당 <span>1</span> </div>
							<div class="col-6 text-center kt-padding-10 border-left osl-cursor-pointer"> 전체 <span>1</span> </div>
							<div class="col-12 text-center border-top kt-padding-10 font-border">작업흐름 명</div>
						</div>
						<div class="kt-portlet__body osl-kaban--card__body" processid="3">
							
							
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
				
			</div>
			
			
			<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0 kt-hide" id="processReqTable_2"></div>
			
		</div>
	</div>
	
	
	
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__head kt-portlet__head--lg">
			
			<div class="kt-portlet__head-label">
				<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid">
					<input type="checkbox" value="0" data-datatable-id="spr1000Table">&nbsp;
					<span></span>
				</label>
				<h5 class="kt-font-boldest">
					<span class="badge badge-primary kt-margin-r-10">No. 1</span>
				</h5>
				<h5>
					<span class="badge badge-primary" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="스프린트 기간">
						<i class="far fa-calendar-alt kt-margin-r-10"></i>2020-10-16 ~ 2020-10-16
					</span>
				</h5>
			</div>
			
			
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
			</div>
			
		</div>
		
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-4">
					
					<div class="d-flex kt-padding-l-15 align-items-center">
						<div class="kt-media kt-media--xl kt-media--circle kt-media--primary osl-margin-r-2rm"><span>대기</span></div>
						<div class="d-flex flex-column osl-margin-r-auto osl-word__break">
							<h5 class="kt-font-boldest text-truncate" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="두번쨰 프로젝트 - 9월 2주차 스프린트"> 두번쨰 프로젝트 - 9월 2주차 스프린트</h5><span class="text-muted text-truncate" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="두번쨰 프로젝트 - 9월 2주차 스프린트</br>ㅁ</br>입니다.">두번쨰 프로젝트 - 9월 2주차 스프린트<br>ㅁ<br>입니다.</span>
						</div>
					</div>
					
					<div class="d-flex flex-wrap osl-margin-t-2rm kt-padding-l-20">
						<div class="osl-margin-r-3rm osl-margin-b-175rm d-flex flex-column"><span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>시작일</span>
							<h5><span class="badge badge-primary">2020-10-16</span></h5>
						</div>
						<div class="osl-margin-r-3rm osl-margin-b-175rm d-flex flex-column"><span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>종료일</span>
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
				
				<div class="col-4">
					<div class="osl-widget osl-flex-row-fluid flex-wrap">
						<div class="osl-widget-info__item osl-flex-row-fluid osl-spr-btn osl-cursor-pointer">
							<div class="osl-widget-info__item-icon">
								<img src="/media/osl/icon/reqAll.png">
							</div>
							<div class="osl-widget-info__item-info">
								<a href="#" class="osl-widget-info__item-title">전체</a>
								<div class="osl-widget-info__item-desc">0</div>
							</div>
						</div>
						<div class="osl-widget-info__item osl-flex-row-fluid osl-spr-btn osl-cursor-pointer">
							<div class="osl-widget-info__item-icon">
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
							<div class="osl-widget-info__item-icon">
								<img src="/media/osl/icon/reqDone.png">
							</div>
							<div class="osl-widget-info__item-info">
								<a href="#" class="osl-widget-info__item-title">완료</a>
								<div class="osl-widget-info__item-desc">0</div>
							</div>
						</div>
						<div class="osl-widget-info__item osl-flex-row-fluid">
							<div class="osl-widget-info__item-icon">
								<img src="/media/osl/icon/reqPointer.png">
							</div>
							<div class="osl-widget-info__item-info">
								<a href="#" class="osl-widget-info__item-title">평균 완료 시간</a>
								<div class="osl-widget-info__item-desc">0.0</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="col-4">
					<div class="border osl-min-h-px--170">차트</div>
                </div>
				
            </div>
            
			<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0 kt-hide" id="processReqTable_3"></div>
			
        </div>
		
    </div>
    
    
 <script>
"use strict";
var OSLDsh2000Popup = function () {
	
	var reqAuth = false;
	var datatableId = "req4100ReqTable";
	var prjRequestAcceptCd = "02";
	var documentSetting = function(){
		
		new KTPortlet('prjTopInfo', $.osl.lang("portlet"));
		new KTPortlet('newReq', $.osl.lang("portlet"));
		new KTPortlet('reqChargeList', $.osl.lang("portlet"));
		new KTPortlet('reqChargeSign', $.osl.lang("portlet"));
		new KTPortlet('reqChargeDpl', $.osl.lang("portlet"));	
		
		$('#allPortletClose').click(function(){
			
		});
		
		
		
		
		var prjRequestAcceptCd = $.osl.prjGrpAuthList[$.osl.selPrjGrpId].prjList[$.osl.selPrjId].prjRequestAcceptCd;
		
		
		if(prjRequestAcceptCd == "01"){
			$("button[data-datatable-id=req4100ReqTable][data-datatable-action=requestAccept]").removeClass("kt-hide");
		}

		
		$.osl.datatable.setting(datatableId,{
			data: {
				source: {
					read: {
						url: "/req/req4000/req4100/selectReq4100ReqListAjax.do"
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
								pagesNumber: 5
							}
						}
					 }
				 }
			 },
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'prjNm', title:'프로젝트명', textAlign: 'left', width: 150, autoHide: false, search: true},
				{field: 'reqOrd', title: '요청번호', textAlign: 'left', width: 110, autoHide: false},
				{field: 'reqProTypeNm', title:'처리유형', textAlign: 'left', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProType", sortField: "reqProType"},
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
				{field: 'regDtm', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"date",
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
				{field: 'reqUsrEmail', title:'요청자e-mail', textAlign: 'left', width: 180, search: true},
				{field: 'reqUsrDeptNm', title:'요청자 조직', textAlign: 'center', width: 300, sortable: false},
				{field: 'reqUsrNum', title: '요청자 연락처', textAlign: 'center', width: 100, search: true},
				{field: 'reqKey', title: '요구사항 key', textAlign: 'center', width: 300, sortable: false, search: true}
				
			],
			searchColumns:[
				{field: 'prjGrpNm', title: $.osl.lang("req4100.field.prjGrpNm"), searchOrd: 0},
				{field: 'reqGrpNm', title: $.osl.lang("req4100.field.reqGrpNm"), searchOrd: 2}
			],
			rows:{
				clickCheckbox: true
			},
			actionBtn:{
				"title" : $.osl.lang("req4100.actionBtn.title"),
				"dblClick": true,
				"copy" : true,
			},
			actionTooltip:{
				"update": $.osl.lang("req4100.actionBtn.updateBtn"),
				"delete": $.osl.lang("req4100.actionBtn.deleteBtn"),
				"dblClick" : $.osl.lang("req4100.actionBtn.detailBtn"),
				"copy" : $.osl.lang("req4100.actionBtn.copyBtn"),
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.lang("req4100.title.insertTitle"),
							closeConfirm: false,
							autoHeight:false,
						};
					
					$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
				},
				"update":function(rowData){
					if(rowData.reqProType != "01"){
						$.osl.alert($.osl.lang("req4100.alert.updateMsg"), {"type":"warning"});
						return false;
					}
					var data = {
							type:"update",
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
							paramReqUsrId: rowData.reqUsrId,
							paramReqGrpId: rowData.reqGrpId,
							datatableId: datatableId,
						};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.lang("req4100.title.updateTitle"),
							closeConfirm: false,
							autoHeight:false,
						};
					var pwOptions = {
							idKey: "req4100pw_"+datatableId,
							modalTitle: $.osl.lang("req4100.title.passowrdCheckTitle"),
							closeConfirm: false,
							autoHeight:false,
							modalSize: "sm",
						};
					
					if(rowData.reqPw == "Y"){
						
						checkAuth($.osl.user.userInfo.usrId , rowData.reqId);
						if(reqAuth){
							
							$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
						}else{
							
							$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4103View.do',data,pwOptions);
						}
					}else{
						
						$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
					}
				},
				"delete":function(rowDatas, datatableId, type){
					reqAuth = false;
					var pwCount = 0;
					var data = {
							type:"delete",
							paramRowData : JSON.stringify(rowDatas),
							datatableId: datatableId,
						};
					var pwOptions = {
							idKey: "req4100pw_"+datatableId,
							modalTitle: $.osl.lang("req4100.title.passowrdCheckTitle"),
							closeConfirm: false,
							autoHeight:false,
							modalSize: "sm",
						};
					
					
					$.each(rowDatas, function(idx, value){
						if(value.reqPw == "Y"){
							reqAuth = true;
							pwCount++;
						}
					});

					
					var rowCnt = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords().length;
					
					
					if(reqAuth){
						
						if(rowCnt == 1 || type=="info"){
							
							$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4103View.do',data,pwOptions);
						}else if(rowCnt >1){
							
							
							if(pwCount == 1){
								
								$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4103View.do',data,pwOptions);
							}else{
								
								$.osl.alert($.osl.lang("req4100.alert.multiPwMsg", pwCnt));
								return false;
							}
						}
					}else{
						
						var ajaxObj = new $.osl.ajaxRequestAction(
								{"url":"<c:url value='/req/req4000/req4100/deleteReq4100ReqListAjax.do'/>"}
								,{deleteDataList: JSON.stringify(rowDatas)});
						
						ajaxObj.setFnSuccess(function(data){
							if(data.errorYn == "Y"){
				   				$.osl.alert(data.message,{type: 'error'});
				   			}else{
				   				
				   				$.osl.toastr(data.message);
				   				
				   				
				   				$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
				   			}
						});
						
						
						ajaxObj.send();
					}
				},
				"dblClick":function(rowData, datatableId, type, rowNum){
					var data = {
							
							
							
							
						};
					var options = {
							
							modalTitle: $.osl.lang("req4100.title.detailTitle"),
							autoHeight: false,
							modalSize: 'xl'
							
						};
					
					$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6203View.do',data,options);
				},
				"copy" : function(rowDatas, datatableId, type, rowNum){
					var data;
					if(type == "list"){
						
						if(rowNum == 0){
							$.osl.alert($.osl.lang("req4100.alert.selectData"));
						}else if(rowNum == 1){
							
							if(rowDatas[0].reqPw == "Y"){
								$.osl.alert($.osl.lang("req4100.alert.LockData"));
							}else{
								
								data ={
									type:"copy",
									
									paramPrjId: rowDatas[0].prjId,
									paramReqId: rowDatas[0].reqId,
									paramReqUsrId: rowDatas[0].reqUsrId,
									changePrj : "Y"
								};
								var options = {
										idKey: rowDatas[0].reqId,
										modalTitle: $.osl.lang("req4100.title.detailTitle"),
										closeConfirm: false
									};
								
								$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
							}
						}else{
							
							$.osl.alert($.osl.lang("req4100.alert.selectCopyData", rowNum));
						}
					}else{
						
						
						if(rowDatas.reqPw == "Y"){
							$.osl.alert($.osl.lang("req4100.alert.LockData"));
						}else{
							data ={
								type:"copy",
								rowDatas : "["+JSON.stringify(rowDatas)+"]",
								paramPrjId: rowDatas.prjId,
								paramReqId: rowDatas.reqId,
								paramReqUsrId: rowDatas.reqUsrId,
								changePrj : "Y"
							};
							var options = {
									idKey: rowDatas.reqId,
									modalTitle: $.osl.lang("req4100.title.detailTitle"),
									closeConfirm: false
								};
							
							$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
						}
					}
				},
				"requestAccept": function(rowDatas, datatableId, type, rowNum){
					if(rowDatas == 0){
						$.osl.alert($.osl.lang("req4100.alert.selectData"));
						return false;
					}else{
						
						
						var selReqInfoList = [];
						
						
						var reqProChkCnt = 0;
						
						$.each(rowDatas, function(idx, map){
							
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
						
						$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6200View.do',data,options);
						
						if(reqProChkCnt > 0){
							$.osl.alert(reqProChkCnt+"건의 접수대기가 아닌 요구사항을 제외했습니다.");
						}
						
					}
				}
			},
			theme:{
				actionBtn:{
					"copy" : ""
				},
				actionBtnIcon:{
					"copy" : "fa flaticon2-copy",
				}
			}
		});
		
		

		
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
		
		
		
		
		$('.osl-view-type').click(function(){
			var targetType = $(this).data('view-type');
			var targetObj = $(this).data('target-process');
			var targetDiv = $('div[data-target-div='+targetObj+']');
			
			
			if(targetType=='grid'){
				
				targetDiv.find(".osl-dsh-flowchart").addClass('kt-hide');
				targetDiv.find(".osl-dsh-kanban").removeClass('kt-hide');
				$(this).data('view-type','kaban');
				return false;
			}else if(targetType=='kaban'){
				
				targetDiv.find(".osl-dsh-kanban").addClass('kt-hide');
				targetDiv.find(".osl-dsh-flowchart").removeClass('kt-hide');
				$(this).data('view-type','grid');
				return false;	
			}
		});
		
		
		$('.flowchart-operator-outputs,.flowchart-operator-inputs').click(function(){
			
			var target = $(this).parents('.kt-portlet__body');
			$(target).children('.kt_datatable').removeClass('kt-hide');
			
			
			var targetId = $(this).parents('.kt-portlet').data("target-div");
			if(targetId=='process1'){
				processTableSetting('1');
			}else if(targetId=='process2'){
				processTableSetting('2');
			}
		});
		
		
		$('.osl-spr-btn').click(function(){
			
			var target = $(this).parents('.kt-portlet__body');
			$(target).children('.kt_datatable').removeClass('kt-hide');
			
			processTableSetting('3');
		});
		
		
		
		new Sortable($('.osl-kaban--card__body[processid="1"]')[0], {
			group:'shared',
	        animation: 100,
	        
	        chosenClass: "chosen",
	        
	        onMove:function(evt,originalEvent){
				var UserAgent = navigator.userAgent;
				
				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
					return false;
				}else{
					return true;
				}
								
			},
	      	
			onAdd:function(evt){
				
			}
	    });
		new Sortable($('.osl-kaban--card__body[processid="2"]')[0], {
			group:'shared',
	        animation: 100,
	        
	        chosenClass: "chosen",
	        
	        onMove:function(evt,originalEvent){
				var UserAgent = navigator.userAgent;
				
				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
					return false;
				}else{
					return true;
				}
				
			},
	      	
			onAdd:function(evt){
				
			}
	    });
		new Sortable($('.osl-kaban--card__body[processid="3"]')[0], {
			group:'shared',
	        animation: 100,
	        
	        chosenClass: "chosen",
	        
	        onMove:function(evt,originalEvent){
				var UserAgent = navigator.userAgent;
				
				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
					return false;
				}else{
					return true;
				}
				
			},
	      	
			onAdd:function(evt){
				
			}
	    });
	};
	
	
	var checkAuth = function(usrId, reqId){
		var data = {
				usrId : usrId,
				reqId : reqId
		};
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/req/req4000/req4100/selectReq4100UserCheckAjax.do'/>", "async": true}
				, data);
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
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
		
    	ajaxObj.send();
	};
	
	
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
	
	return {
        
        init: function() {
        	documentSetting();
    	}
    };
}();

$.osl.ready(function(){
	OSLDsh2000Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
