<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6000" autocomplete="off">
	<input type="hidden" name="paramSelReqInfoList" id="paramSelReqInfoList" value='<c:out value="${param.paramSelReqInfoList}"/>'/>
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
			<button type="button" class="btn btn-outline-brand" data-ktwizard-type="action-prev">
				<i class="fas fa-chevron-circle-left"></i><span data-lang-cd="spr1003.wizard.btn.prev">이전</span>
			</button>
			<button type="button" class="btn btn-outline-brand kt-margin-l-20" id="req4101SaveSubmit1" data-ktwizard-type="action-submit">
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
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6000ReqTable" data-datatable-action="select" title="요구사항 조회" data-title-lang-cd="req4100.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
										<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
									</button>
									<!-- 
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6000ReqTable" data-datatable-action="insert" title="요구사항 추가" data-title-lang-cd="req4100.actionBtn.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
										<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
									</button>
									 -->
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6000ReqTable" data-datatable-action="delete" title="요구사항 삭제" data-title-lang-cd="req4100.actionBtn.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="5">
										<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
									</button>
								</div>
							</div>
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-group">
									<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
								</div>
							</div>
						</div>
						<div class="kt-portlet__body osl-min-h-px--470">
							<div class="osl-datatable-search" data-datatable-id="cmm6000ReqTable"></div>
							<div class="kt_datatable" id="cmm6000ReqTable"></div>
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
											<input type="text" class="form-control" placeholder="담당자명" name="reqChargerNm" id="reqChargerNm" opttype="-1" required>
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
													<input type="checkbox" name="test" id="test">
													<span></span>
												</label>
											</span>
											<span class="form-text text-muted">* 프로세스에 배정된 기본 담당자가 선택됩니다.</span>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span>접수 의견</span></label>
								<textarea name="reqAcceptTxt" id="reqAcceptTxt" autocomplete="off" readonly="readonly"></textarea>
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
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12">
					<div class="kt-portlet kt-portlet--mobile">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-th-large kt-margin-r-5"></i><span>프로세스 목록</span>
								</h5>
							</div>
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-group">
									<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
								</div>
							</div>
						</div>
						<div class="kt-portlet__body osl-min-h-px--470">
							<div class="osl-datatable-search" data-datatable-id="cmm6000ProcessTable"></div>
							<div class="kt_datatable" id="cmm6000ProcessTable"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-danger kt-margin-l-20" id="req4101SaveSubmit2"><i class="fa fa-stop-circle"></i><span data-lang-cd="req4101.complete">접수 반려</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";

var OSLCmm6000Popup = function () {
	var formId = 'frCmm6000';
	
	//edit 목록
	var formEditList = {};
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//데이터 테이블
	var cmm6000ReqTableData;
	var cmm6000ProcessTableData;
	//파라미터 프로젝트, 요구사항 Id
	var paramSelReqInfoList = [];
	
	//atchfileId
	var atchFileId;

	//파일 업로드 세팅
	var fileUploadObj;
	
	
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
    		toolbar: false,
			disableResizeEditor: false,
			disableDragAndDrop: true,
			disabledEditor: false,
			height:245
    	});
    	
    	//마법사 세팅
		var wizard = new KTWizard('requestAcceptWizard', {
			startStep: 1, 
			clickableSteps: true		
		});
    	
    	//데이터 테이블 목록
    	datatableSetting();
    };

	//선택 요구사항 목록
    var datatableSetting = function(){
    	cmm6000ReqTableData = $.osl.datatable.setting("cmm6000ReqTable",{
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
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
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
				"insert": function(rowDatas, datatableId, type, rowNum, elem){
					var data = {
							paramReqProType: "01"
		    		};
		    		var options = {
		    				idKey: "searchUsr",
							modalTitle: $.osl.lang("cmm16000.title"),
							closeConfirm: true,
							autoHeight:false,
							modalSize: "xl",
							callback:[{
								targetId: "cmm16000SaveSubmit",
								actionFn: function(thisObj){
									var selReqList = OSLCmm16000Popup.getSelReqList();
									if(!$.osl.isNull(selReqList)){
										console.log(selReqList);
									}
								}
							}]
		    		};
		    		$.osl.layerPopupOpen('/cmm/cmm10000/cmm16000/selectCmm16000View.do',data,options);
				},
				"delete": function(rowDatas, datatableId, type, rowNum, elem){
					if(paramSelReqInfoList.length > 0){
						//선택 요구사항 loop
						$.each(rowDatas, function(idx, map){
							var prjId = map.prjId;
							var reqId = map.reqId;
							
							//선택 요구사항을 파라미터 값에서 제외
							$.each(paramSelReqInfoList, function(subIdx, subMap){
								if(subMap.prjId == prjId && subMap.reqId == reqId){
									paramSelReqInfoList.splice(subIdx,1);
									return false;
								}
							});
						});
						
						//데이터 반영
						cmm6000ReqTableData.targetDt.options.data.source.read.params.paramSelReqInfoList = JSON.stringify(paramSelReqInfoList);
						cmm6000ReqTableData.targetDt.reload();
					}
				}
			}
		});
    	
    	var cmm6000ProcessTableData = $.osl.datatable.setting("cmm6000ProcessTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1100/selectPrj1100ProcessListAjax.do",
						params:{
							delCd: "02"
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
			columns: [
				{field: 'processId', title: 'ID', textAlign: 'center', width: 150, search: true},
				{field: 'processNm', title: '이름 ', textAlign: 'center', width: 100, search: true},
			],
			actionBtn:{
				"update": false,
				"delete": false
			},
			actionFn:{
				"click": function(rowData, datatableId, type, rowNum, elem){
					//같은 프로세스 선택인 경우 동작 중지
					if($(".osl-datatable__card.active")[0] == elem){
						return false;
					}
					var innerFn = function(rowData, datatableId, type, rowNum, elem){
						//선택 프로세스 Id
						selProcessId = rowData.processId;
						
						//작업흐름 데이터 초기화
						flowChart.flowchart("setData",{});
						
						//ajax로 작업흐름 데이터 조회하기
						fnSelectFlowList();
						
						//mask 제거
						$("#flowMaskDiv").hide();
						
						//플로우차트 div 열기
						$("#flowChartDiv").removeClass("kt-hidden");
						
						//zoom reset
						fnFlowChartZoom("reset");
						
						processEditMode = true;
						
						//작업흐름 추가,삭제 목록 초기화
						flowRemoveList = [];
						flowAddList = [];
						
						//선택 효과
						$(elem).parent().find(".osl-datatable__card.active").removeClass("active");
						$(elem).addClass("active");
						
						processChgCheck.flag = false;
					}
					//선택된 프로세스 이미 있을때 저장유무 확인
					if($(".osl-datatable__card.active").length > 0 && processEditMode && processChgCheck.flag){
						//모든 작업흐름이 연결되어있는지 확인
						var rtnValue = fnFlowDoneCheck();
						if(rtnValue === false){
							$.osl.confirm($.osl.lang("prj1100.alert.saveBefore"),{html: true},function(result) {
				    	        if (result.value) {
				    	        	innerFn(rowData, datatableId, type, rowNum, elem);
				    	        }
				    		});
						}else{
							//시작 단계, 종료 단계 confirm
							var startFlow = flowChart.flowchart("getOperatorData", rtnValue.startFlowId);
							var endFlow = flowChart.flowchart("getOperatorData", rtnValue.endFlowId);
							
							var confirmMsg = $.osl.lang("prj1100.alert.processSave",startFlow.properties.title,endFlow.properties.title);
							
							$.osl.confirm(confirmMsg,{html: true},function(result) {
				    	        if (result.value) {
				    	        	fnProcessDataSave(rtnValue.startFlowId, rtnValue.endFlowId);
				    	        }
				    		});
						}
						
					}else{
						innerFn(rowData, datatableId, type, rowNum, elem);
					}
				}
			},
		});
	}
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
		    	$.osl.setDataFormElem(data.reqInfoMap,"frCmm6000");
				
		    	formEditList["reqDesc"].target.summernote('code', data.reqInfoMap.reqDesc);
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
	
    return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLCmm6000Popup.init();
});

	
</script>