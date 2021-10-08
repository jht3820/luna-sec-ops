<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6201" autocomplete="off">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}"/>
	<input type="hidden" name="paramReqId" id="paramReqId" value="${param.paramReqId}"/>
	<input type="hidden" name="processId" id="processId"/>
	<input type="hidden" name="atchFileId" id="atchFileId"/>
	<input type="hidden" name="reqChargerId" id="reqChargerId"/>
	<div class="osl-req__process-main d-flex">
		<div class="osl-req__process-title"><i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqInfo">요구사항 변경 이력</span></div>
		<div class="osl-req__process-history osl-mask-bg" id="osl-req__process-history" data-scroll-x="true">
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
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.chargerTitle">프로세스 선택</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.chargerDesc">이관 프로세스 선택</span></div>
						</div>
					</div>
				</div>
			</div>
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
											<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
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
										<span data-lang-cd="req4101.label.attachments">파일 첨부</span> 
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
						<div class="kt-portlet" id="cmm6201ReqGroupInfo">
							<div class="kt-portlet__head">
								<div class="kt-portlet__head-label">
									<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqInfo">그룹 요구사항 정보</span>
								</div>
								<div class="kt-portlet__head-toolbar">
									<div class="kt-portlet__head-group">
										<div class="kt-portlet__head-group">
											<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
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
									<div class="kt-portlet__head-group">
										<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
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
										<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
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
			
			</div>
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

	
	var formEditList = [];
	
	
	var fileUploadObj;
	
	
	var cmm6201ProcessAuthUsrTable;
	
    
    var documentSetting = function () {

    	
    	new KTPortlet('cmm6201RequestUsrInfo', $.osl.lang("portlet"));
    	new KTPortlet('cmm6201ReqGroupInfo', $.osl.lang("portlet"));
    	new KTPortlet('cmm6201ReqInfo', $.osl.lang("portlet"));
    	new KTPortlet('cmm6201NewRequestOpt', $.osl.lang("portlet"));
    	
    	
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
    	
		
		wizard.on('change', function(wizardObj) {
			if(wizardObj.currentStep == 2){
				if($.osl.isNull(cmm6201ProcessAuthUsrTable)){
					
					fnDatatableSetting();
				}else{
					
					cmm6201ProcessAuthUsrTable.targetDt.reload();
				}
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
								$("#"+formId+" #reqChargerId").val(selUsrInfo.usrId);
								$("#"+formId+" #reqChargerNm").val(selUsrInfo.usrNm);
							}
						}
					}]
    		};
    		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6400/selectCmm6401View.do',data,options);
    	});
    	
    	
    	fnRequestProcessData();
    };
	var fnDatatableSetting = function(){
		var paramProcessId = $("#frCmm6201 #processId").val();
		
		
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
	
	var fnSelChargerChg = function(chargerInfo){
		
		function innerFnChargerChg(){
			var usrId = chargerInfo.usrId;
			var usrNm = chargerInfo.usrNm;
			
			
			$("#reqChargerId").val(usrId);
			$("#reqChargerNm").val(usrNm);
		}
		
		
		var reqChargerId = $("#reqChargerId").val();
		
		
		if(!$.osl.isNull(reqChargerId)){
			$.osl.confirm("기존에 설정된 담당자가 변경됩니다.</br>계속 하시겠습니까?",{html:true}, function(result){
				if (result.value) {
					innerFnChargerChg();
				}
			});
		}else{
			innerFnChargerChg();
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
 				
 				
		    	$.osl.setDataFormElem(reqInfo, formId);
				
				
		    	$("#reqUsrId").val(reqInfo.reqUsrId);
				$("#reqGrpNm").val(reqInfo.reqGrpNm);
		    	$("#usrNm").val(reqInfo.reqUsrNm);
		    	$("#email").val(reqInfo.reqUsrEmail);
		    	$("#telno").val(reqInfo.reqUsrNum);
		    	$("#deptName").val(reqInfo.reqUsrDeptNm);
		    	$("#deptId").val(reqInfo.reqUsrDeptId);
		    	$("#usrImgId").attr("src",$.osl.user.usrImgUrlVal(reqInfo.reqUsrImgId));
		    	
		    	$("#reqPrjSelect").val($.osl.escapeHtml(reqInfo.prjId)).trigger('change.select2');
		    	$("#reqPrjSelect").prop("disabled", true);
		    	
		    	
		    	formEditList.push($.osl.editorSetting("reqDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:260
		    	}));
		    	formEditList.push($.osl.editorSetting("reqGrpDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:180
	    		}));
		    	formEditList.push($.osl.editorSetting("reqAcceptTxt", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:100
	    		}));
		    	
				
		    	fileUploadObj = $.osl.file.uploadSet("fileListDiv",{
		    		maxFileSize: "${requestScope.fileSumMaxSize}",
		    		meta: {"atchFileId": $("#atchFileId").val(), "fileSn": 0},
		    		height: 260,
		    		isDraggingOver: false,
		    		fileDownload: true,
		    		fileReadonly: true
		    	});
				
		    	
				$.osl.date.daterangepicker($("#reqStDtm"), {
						singleDatePicker: true, 
						timePicker: true, 
						timePicker24Hour: true,
						maxDate: moment($("#reqEdDtm").val(), "YYYY-MM-DD HH:mm"),
						locale: {
							format: 'YYYY-MM-DD HH:mm'
				        }
					},function(defaultConfig, start, end, label){
						var stDtStr = new Date(start._d).format("yyyy-MM-dd HH:mm");
						
						
						if($("#reqEdDtm").data('daterangepicker').startDate._d.getTime() < new Date(start._d).getTime()){
							$("#reqEdDtm").data('daterangepicker').setStartDate(stDtStr);
						}
						$("#reqEdDtm").data('daterangepicker').minDate = moment(stDtStr, "YYYY-MM-DD HH:mm");
				});
				$.osl.date.daterangepicker($("#reqEdDtm"), {
						singleDatePicker: true, 
						timePicker: true, 
						timePicker24Hour: true,
						minDate: moment($("#reqStDtm").val(), "YYYY-MM-DD HH:mm"),
						locale: {
							format: 'YYYY-MM-DD HH:mm'
				        }
					
					},function(defaultConfig, start, end, label){
						var edDtStr = new Date(start._d).format("yyyy-MM-dd HH:mm");
						
						$("#reqStDtm").data('daterangepicker').maxDate = moment(edDtStr, "YYYY-MM-DD HH:mm");
				});
				
				
				$.osl.date.daterangepicker($("#reqStDuDtm"), {
						singleDatePicker: true,
						maxDate: moment($("#reqEdDuDtm").val(), "YYYY-MM-DD")
					
					},function(defaultConfig, start, end, label){
						var stDtStr = new Date(start._d).format("yyyy-MM-dd");
						
						
						if($("#reqEdDuDtm").data('daterangepicker').startDate._d.getTime() < new Date(start._d).getTime()){
							$("#reqEdDuDtm").data('daterangepicker').setStartDate(stDtStr);
						}
						$("#reqEdDuDtm").data('daterangepicker').minDate = moment(stDtStr, "YYYY-MM-DD");
				});
				$.osl.date.daterangepicker($("#reqEdDuDtm"), {
						singleDatePicker: true,
						minDate: moment($("#reqStDuDtm").val(), "YYYY-MM-DD")
					
					},function(defaultConfig, start, end, label){
						var edDtStr = new Date(start._d).format("yyyy-MM-dd");
						
						$("#reqStDuDtm").data('daterangepicker').maxDate = moment(edDtStr, "YYYY-MM-DD");
				});
		    	
		    	
		    	fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
		    	
		    	
		    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
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