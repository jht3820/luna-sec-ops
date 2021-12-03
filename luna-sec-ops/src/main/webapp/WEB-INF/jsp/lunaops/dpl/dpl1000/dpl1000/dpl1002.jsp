<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form class="kt-form" id="frDpl1002">
	<input type="hidden" id="paramPrjId" name="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" id="paramDplId" name="paramDplId" value="${param.paramDplId}">
	<input type="hidden" id="dplSignUseCd" name=""dplSignUseCd"" value="${dplInfo.dplSignUseCd}">
	<input type="hidden" id="regDtm" name="regDtm" value="${dplInfo.regDtm}">
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 osl-bg-none shadow-none" id="dplRecord">
		<div class="kt-portlet__head osl-swiper-container">
			<div class="swiper-container w-100 overflow-hidden">
				
				<ul class="nav nav-pills nav-pills-sm kt-margin-b-0 osl-flex-flow--row kt-margin-b-0 osl-position-nav swiper-wrapper osl-width__fit-content" role="tablist">
					<li class="nav-item swiper-slide">
						<a class="nav-link osl-tab-fixed active text-center" data-toggle="tab" href="#dplInfoTab" data-tab-id="dplInfo" role="tab">배포정보</a>
					</li>
					<li class="nav-item swiper-slide">
						<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#allHistoryTab" data-tab-id="dplInfoAll" role="tab">전체 이력</a>
					</li>
					<li class="nav-item swiper-slide">
						<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#bldHistoryTab" data-tab-id="dplInfoBuild" role="tab">빌드 이력</a>
					</li>
					<li class="nav-item swiper-slide">
						<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#dplSignHistoryTab" data-tab-id="dplInfoSign" role="tab">결재 이력</a>
					</li>
					
					<li class="nav-item swiper-slide">
						<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#dplChgHistoryTab" data-tab-id="dplInfoModify" role="tab">수정 이력</a>
					</li>
					<li class="nav-item swiper-slide">
						<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#dplReqRevisionTab" data-tab-id="dplRevision" role="tab">배정 리비전</a>
					</li>
					<li class="nav-item swiper-slide">
						<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#dplReqTab" data-tab-id="dplAssignReq" role="tab">배정 요구사항 목록</a>
					</li>
				</ul>
				
			</div>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm osl-position-left-btn swiper-button-prev">
				<i class="fas fa-angle-left"></i>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm osl-position-right-btn swiper-button-next">
				<i class="fas fa-angle-right"></i>
			</button>
		</div>
		
		<div class="kt-portlet__body kt-padding-10 kt-bg-light osl-tab-portlet__body">
			<div class="tab-content osl-tab-content kt-scroll" id="osl-tab-content__scroll">
				
				<div class="tab-pane active" id="dplInfoTab" data-tab-id="dplInfo" role="tabpanel">
					<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="dplInfo">
						<div class="kt-portlet__body">
							
							<div class="row">
								<div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12">
									<div class="row">
										<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
											<div class="form-group">
												<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 상태</label>
												<input class="form-control" type="text" id="dplStsNm" name="dplStsNm" readonly="readonly" value="<c:out value="${dplInfo.dplStsNm}"/>" >
											</div>	
										</div>
										<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
											<div class="form-group">
												<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 버전</label>
												<input class="form-control" type="text" id="dplVer" name="dplVer" readonly="readonly" value="<c:out value="${dplInfo.dplVer}"/>" >
											</div>	
										</div>
										<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
											<div class="form-group">
												<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 명</label>
												<input class="form-control" type="text" id="dplNm" name="dplNm" readonly="readonly" value="<c:out value="${dplInfo.dplNm}"/>" >
											</div>	
										</div>
										<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
											<div class="form-group">
												<label class="col-form-label"><i class="fa fa-calendar-alt kt-margin-r-5"></i>배포 일자</label>
												<input class="form-control" type="text" id="dplDt" name="dplDt" readonly="readonly" value="<c:out value="${dplInfo.dplDt}"/>" >
											</div>	
										</div>
										<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
											<div class="form-group">
												<label class="col-form-label"><i class="fa fa-user-cog kt-margin-r-5"></i>배포자</label>
												<input class="form-control" type="text" id="dplUsrNm" name="dplUsrNm" readonly="readonly" value="<c:out value="${dplInfo.dplUsrNm}"/>" >
											</div>
										</div>
										<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">	
											<div class="form-group">
												<label class="col-form-label"><i class="fa fa-file-signature kt-margin-r-5"></i>결재 사용 유무</label>
												<input class="form-control" type="text" id="dplSignUseNm" name="dplSignUseNm" readonly="readonly" value="<c:out value="${dplInfo.dplSignUseNm}"/>" >
											</div>
										</div>
										<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
											<div class="form-group">
												<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 리비전</label>
												<input class="form-control" type="text" id="dplRevisionNum" name="dplRevisionNum" readonly="readonly" value="<c:out value='${empty dplInfo.dplRevisionNum ? "Last Revision" :  dplInfo.dplRevisionNum }'/>" >
											</div>	
										</div>
										<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
											<div class="form-group">
												<label class="col-form-label"><i class="fab fa-cloudsmith kt-margin-r-5"></i>배포 방법</label>
												<input class="form-control" type="text" id="dplTypeNm" name="dplTypeNm" readonly="readonly" value="<c:out value="${dplInfo.dplTypeNm}"/>" >
											</div>	
										</div>
										<c:if test="${dplInfo.dplTypeCd == '01'}">
											<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
												<div class="form-group">
													<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>실패 후 처리</label>
													<input class="form-control" type="text" id="dplAutoAfterNm" name="dplAutoAfterNm" readonly="readonly" value="<c:out value="${dplInfo.dplAutoAfterNm}"/>" >
												</div>
											</div>
											<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
												<div class="form-group">
													<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>자동 실행 일시</label>
													<input class="form-control" type="text" id="dplAutoTm" name="dplAutoTm" readonly="readonly" value='<fmt:formatDate value="${dplInfo.dplAutoDtm}" pattern="yyyy-MM-dd HH:mm:ss"/>' >
												</div>	
											</div>
											<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
												<div class="form-group">
													<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>원복 타입</label>
													<input class="form-control" type="text" id="dplRestoreNm" name="dplRestoreNm" readonly="readonly" value="<c:out value="${dplInfo.dplRestoreNm}"/>" >											
												</div>	
											</div>
										</c:if>
									</div>
								</div>
								<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
									<c:choose>
										<c:when test="${dplInfo.dplTypeCd == '01'}">
											<c:if test="${dplInfo.dplSignUseCd == '01'}">
												<div class="form-group kt-margin-b-15">
													<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>결재 요청 의견</label>
													<textarea class="form-control osl-textarea__resize--none osl-min-h-px--150" id="dplSignTxt" name="dplSignTxt" readonly="readonly"><c:out value="${dplInfo.dplSignTxt}"/></textarea>
												</div>
												<div class="form-group">
													<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
													<textarea class="form-control osl-textarea__resize--none osl-min-h-px--150" id="dplDesc" name="dplDesc" readonly="readonly"><c:out value="${dplInfo.dplDesc}"/></textarea>
												</div>
											</c:if>
											<c:if test="${dplInfo.dplSignUseCd == '02'}">
												<div class="form-group">
													<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
													<textarea class="form-control osl-textarea__resize--none osl-min-h-px--150" id="dplDesc" name="dplDesc" readonly="readonly"><c:out value="${dplInfo.dplDesc}"/></textarea>
												</div>		
											</c:if>
										</c:when>
										<c:when test="${dplInfo.dplTypeCd == '02'}">
											<c:if test="${dplInfo.dplSignUseCd == '01'}">
												<div class="form-group kt-margin-b-15">
													<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>결재 요청 의견</label>
													<textarea class="form-control osl-textarea__resize--none osl-min-h-px--150" id="dplSignTxt" name="dplSignTxt" readonly="readonly"><c:out value="${dplInfo.dplSignTxt}"/></textarea>
												</div>
												<div class="form-group">
													<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
													<textarea class="form-control osl-textarea__resize--none osl-min-h-px--150" id="dplDesc" name="dplDesc" readonly="readonly"><c:out value="${dplInfo.dplDesc}"/></textarea>
												</div>		
											</c:if>
											<c:if test="${dplInfo.dplSignUseCd == '02'}">
												<div class="form-group">
													<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
													<textarea class="form-control osl-textarea__resize--none osl-min-h-px--150" id="dplDesc" name="dplDesc" readonly="readonly"><c:out value="${dplInfo.dplDesc}"/></textarea>
												</div>		
											</c:if>
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane" id="allHistoryTab" data-tab-id="dplInfoAll" role="tabpanel">
					<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
						<div class="kt-portlet__body">
							<div class="kt-timeline">
								
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane" id="bldHistoryTab" data-tab-id="dplInfoBuild" role="tabpanel">
					<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
						<div class="kt-portlet__body">
							<div class="kt-timeline">
								
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane" id="dplSignHistoryTab" data-tab-id="dplInfoSign" role="tabpanel">
					<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
						<div class="kt-portlet__body">
							<div class="kt-timeline">
								
								
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane" id="dplChgHistoryTab" data-tab-id="dplInfoModify" role="tabpanel">
					<div class="row">
						<div class="col-lg-8 col-md-12 col-sm-12 col-12">
							<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
								<div class="kt-portlet__body osl-min-h-px--545" id="dplPopModifyHisFrame">
									
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
				
				
				<div class="tab-pane" id="dplReqRevisionTab" data-tab-id="dplRevision" role="tabpanel">
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
				
				
				<div class="tab-pane" id="dplReqTab" data-tab-id="dplAssignReq" role="tabpanel">
					<div class="kt-portlet kt-margin-b-0">
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
		<i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span>
	</button>
</div>



<script>
"use strict";
var OSLDpl1002Popup = function () {

	var swiper;
	var formId = 'frDpl1002';
	
	
	var datatableInitFlag = {dplRevision: false, dplAssignReq:false};
	
	var datatableSetting = {};
	
	var documentSetting = function(){
		
		
		var dplSignUseCd = $("#dplSignUseCd").val();
		if(dplSignUseCd == "02"){
			
			$("a.nav-link[data-tab-id='dplInfoSign']").parents('.nav-item').addClass("kt-hide");
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
		fnKtScrollInit("#osl-tab-content__scroll", "550");

		
    	initSwiper();
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
					
					var data = {
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
							paramReqUsrId: rowData.reqUsrId
						};
					var options = {
							idKey: rowData.reqId,
							modalTitle: "요구사항 상세보기",
							autoHeight: false,
						};
					
					$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4102View.do',data,options);
				}
			}
		});
	};
	
	
	
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
				
				
				fnAllHistorySetting(allHistiryList, jobList);
				
				
				fnBldHistorySetting(bldHistoryList, jobList);
				
				
				if($("#dplSignUseCd").val() == "01"){
					
					fnSignHistorySetting(signHistoryList);
				}
				
				
				$(".osl-ribbon__btn[data-bld-info='console']").on("click", function(){
			    	
			    	fnConsoleLogPopupOpen($(this));
			   });
				
				
				fnOpenUsrPopup();
				
				
				KTApp.initTooltips();
			}
		});
		
		
		ajaxObj.send();
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
				modalTitle: "["+ jobType+"-"+bldNum+"] "+jobId +"  콘솔 로그",
				modalSize: 'xl',
				autoHeight: false,
				closeConfirm: false
			};
		
		$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1005View.do',data,options);
	};
	
	
	
	var fnAllHistorySetting = function(allHistiryList, jobList){
		
		
		$.each(allHistiryList,function(idx, map){
			
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
										+				'<div class="osl-ribbon__btn kt-padding-l-10 kt-padding-r-10" title="결과 콘솔로그" data-toggle="kt-tooltip" data-placement="top" data-bld-info="console" data-prj-id='+prjId+' data-dpl-id='+dplId+' data-jen-id='+jenId+' data-job-id='+$.osl.escapeHtml(jobId)+' data-bldseq='+bldSeq+' data-job-type='+$.osl.escapeHtml(map.jobTypeNm)+' data-bldnum='+map.bldNum+' data-job-type='+$.osl.escapeHtml(map.jobTypeNm)+'>'
										+					'<i class="fa fa-code"></i>'
										+				'</div>'
										+				'<div class="osl-ribbon__btn kt-padding-l-10 kt-padding-r-10" title="변경이력" data-toggle="kt-tooltip" data-placement="top">'
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
										+				'<div class="kt-user-card-v2 btn kt-margin-b-10 user-popup" data-user-id="'+bldUsrId+'">'
										+					'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
										+						'<img class="" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId='+bldUsrImgId+'" onerror=""/>'
										+					'</div>'
										+					'<div class="kt-user-card-v2__details">'
										+						'<span class="kt-user-card-v2__name text-left">'+bldUsrNm+'</span>'
										+					'</div>'
										+					'<div class="kt-margin-l-10 osl-email">'+bldUsrEmail+'</div>'
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
	
	
	
	var fnBldHistorySetting = function(bldHistoryList,jobList){
		var bldTimelineDiv = '';
		
		$.each(bldHistoryList,function(idx, bldInfo){
			var bldResult = bldInfo.bldResult;
			
			var prjId = bldInfo.prjId;
			var dplId = bldInfo.dplId;
			var jenId = bldInfo.jenId;
			var jobId = bldInfo.jobId;
			var bldSeq = bldInfo.bldSeq;
			
			
			var itemPosition = '';
			
			var itemColor = '';
			
			var itemIconPosition = '';
			
			var iconImg = '';
			
			var badgeColor = '';
			
			var bldBadge = '';
			
			var bldTitle = '';
			
			var bldUsrId = $.osl.escapeHtml(bldInfo.regUsrId);
			
			var bldUsrNm = $.osl.escapeHtml(bldInfo.regUsrNm);
			
			var bldUsrEmail = $.osl.escapeHtml(bldInfo.regUsrEmail);
			
			var bldUsrImgId = $.osl.escapeHtml(bldInfo.regUsrImgId);
			
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
									+				'<div class="osl-ribbon__btn kt-padding-l-10 kt-padding-r-10" title="결과 콘솔로그" data-toggle="kt-tooltip" data-placement="top" data-bld-info="console" data-prj-id='+prjId+' data-dpl-id='+dplId+' data-jen-id='+jenId+' data-job-id='+$.osl.escapeHtml(jobId)+' data-bldseq='+bldSeq+' data-job-type='+$.osl.escapeHtml(map.jobTypeNm)+' data-bldnum='+map.bldNum+' data-job-type='+$.osl.escapeHtml(map.jobTypeNm)+'>'
									+					'<i class="fa fa-code"></i>'
									+				'</div>'
									+				'<div class="osl-ribbon__btn kt-padding-l-10 kt-padding-r-10" title="변경이력" data-toggle="kt-tooltip" data-placement="top">'
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
									+				'<div class="kt-user-card-v2 btn kt-margin-b-10 user-popup" data-user-id="'+bldUsrId+'">'
									+					'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
									+						'<img class="" src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId='+bldUsrImgId+'" onerror=""/>'
									+					'</div>'
									+					'<div class="kt-user-card-v2__details">'
									+						'<span class="kt-user-card-v2__name text-left">'+bldUsrNm+'</span>'
									+					'</div>'
									+					'<div class="kt-margin-l-10 osl-email">'+bldUsrEmail+'</div>'
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
	
	var leadingZeros = function(n, digits) {
		  var zero = '';
		  n = n.toString();

		  if (n.length < digits) {
		    for (var i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
	}
	
	
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
	
	
	var drawSignInfoCard = function(signInfo, type, targetTab){
		
		
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
							+				'<div class="w-100 float-left">'
							+					'<div class="badge '+badgeColor+' kt-margin-r-15 float-left">'+signType+'</div>'
							+					'<div class="kt-font-bolder kt-padding-l-55">'+signTitle+'</div>'
							+				'</div>'
							+				'<div class="kt-timeline__item-info kt-font-dark kt-padding-b-0">'+signRes+'</div>'
							+			'</div>'
							+			'<div class="border-top kt-padding-t-10 kt-padding-l-20 kt-padding-r-20">'
							+				'<div class="kt-user-card-v2 btn kt-margin-b-10 user-popup" data-user-id="'+signUsrId+'">'
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

	
	
	var fnOpenUsrPopup = function(){
		var usrInfoDiv = $(".user-popup");
		$.each(usrInfoDiv,function(idx,map){
			var usrId = $(this).data("user-id");
			
			$(this).click(function(){
				
				if(!$.osl.isNull(usrId)){
					
					$.osl.user.usrInfoPopup(usrId);
				}				
			});
		});
	}
	
	
	
	var fnKtScrollInit = function(targetName, targetHeight) {
		KTUtil.scrollInit($(targetName)[0], {
	   		
	        disableForMobile: true, 
	        
	        resetHeightOnDestroy: true, 
	        
	        handleWindowResize: true, 
	        
	        height: targetHeight
	    });
	};
	
	
	
	function initSwiper() {
	   	
		swiper = new Swiper('.swiper-container', {
			
			slidesPerView: 'auto',
			
			grabCursor: true,
			
			slidesOffsetAfter: 40,
			
			spaceBetween: 5,
			
			navigation: {
				
	     		nextEl: '.swiper-button-next',
	     		
	      		prevEl: '.swiper-button-prev'
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
	OSLDpl1002Popup.init();
});
</script>

