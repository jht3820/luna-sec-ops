<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-l-5  kt-margin-r-5 btn-elevate btn-elevate-air" id="autoRefreshRedoBtn" title="전체 새로고침" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
							<i class="fa fa-redo kt-padding-r-0"></i>
						</button>
						<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" id="autoRefreshEndBtn" data-flag="false" title="자동 조회 중지" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
							<i class="fa fa-times kt-padding-r-0"></i>
						</button>
						<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air osl-dash--all-folding" id="allPortletClose" title="전체 위젯 접기" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
							<i class="fa fa-chevron-down"></i>
						</a>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>

	<div class="kt-portlet kt-portlet--mobile" id="prjTopInfo">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<div class="kt-portlet__head-label">
				<h4 class="kt-font-boldest kt-font-brand">
					<i class="fa fa-th-large kt-margin-r-5"></i>프로젝트 그룹
				</h4>
			</div>
			<div class="kt-portlet__head-toolbar">
	            <div class="kt-portlet__head-group">
					<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10" title="영역 새로고침" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" id="dshboardChartReset">
						<i class="fas fa-redo-alt"></i>
					</button>
	            	<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air"><i class="fa fa-chevron-down"></i></a>
	            </div>
	         </div>
		</div>
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-12 col-12 kt-padding-20">
					
					<div class="border osl-min-h-px--250" id="processReqCntChart" data-dshboard-chart="prjChart"></div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-12 kt-padding-20">
					
					<div class="border osl-min-h-px--250" id="processMonthRatioChart" data-dshboard-chart="prjChart"></div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12 col-12 kt-padding-20">
					
					<div class="border osl-min-h-px--250" id="processQuarterRatioChart" data-dshboard-chart="prjChart"></div>
				</div>
			</div>
		</div>
	</div>
	
	
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
	
	
	
	<div class="row">
		
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
							<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10 invisible" data-datatable-id="reqChargeDplTable" data-datatable-action="select" title="담당 배포계획 결재 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
								<i class="fas fa-redo-alt"></i>
							</button>
							<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10" data-datatable-id="reqChargeDplTable" data-datatable-action="refresh" title="담당 배포계획 결재 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="refresh" tabindex="5">
								<i class="fas fa-redo-alt"></i>
							</button>
		                  <a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air" data-skin="brand"><i class="fa fa-chevron-down"></i></a>
			            </div>
			         </div>
				</div>
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-9 col-9">
							<div class="osl-datatable-search" data-datatable-id="reqChargeDplTable"></div>
						</div>
					</div>
					<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="reqChargeDplTable"></div>
				</div>
			</div>
		</div>
		
	</div>
	
	
	
	<div id="processCard">
	</div>
	
	
	
	<div id="spr1000CardTable"></div>
	<div class="kt_datatable osl-datatable-footer__divide" id="spr1000Table">
		<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10 invisible" data-datatable-id="spr1000Table" data-datatable-action="select" title="조회" data-auth-button="select" tabindex="5">
			<i class="fas fa-redo-alt"></i>
		</button>
    </div>
    
 <script>
"use strict";
var OSLDsh2000Popup = function () {
	//비밀 요구사항인 경우 접근 권한 확인하기 위한 변수
	//var reqAuth = false;
	//요구사항
	var reqDatatableId = "req4100ReqTable";
	//var prjRequestAcceptCd = "02";
	//담당 배포 결재자
	var dplDatatableId = "reqChargeDplTable";
	//스프린트 데이터 테이블 아이디
	var sprDatatableId = "spr1000Table";
	//대시보드의 모든 데이터 테이블 아이디를 담을 변수
	var dshDatatableIdList = ["req4100ReqTable", "reqChargeDplTable","spr1000Table"];
	
	//portlet세팅
	var portletAll=[];
	//차트 스토리포인트 데이터 셋팅
	var totalSprPoint = 0;
	//scroll세팅
	var scrollArray = $('.osl-kaban--card__body.kt-scroll');
	
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
		// 차트 재조회
		$("#dshboardChartReset").click(function(){
			fnChartDataLoad();
		});
		
		
		//칸반 scroll 세팅
		$.each(scrollArray,function(idx,map){
			fnKtScrollInit(map,"500");
		});
		
		//folding portlet 세팅
		portletAll.push(new KTPortlet('prjTopInfo', $.osl.lang("portlet")));
		portletAll.push(new KTPortlet('newReq', $.osl.lang("portlet")));
		portletAll.push(new KTPortlet('reqChargeSign', $.osl.lang("portlet")));
		portletAll.push(new KTPortlet('reqChargeDpl', $.osl.lang("portlet")));
		portletAll.push(new KTPortlet('processPortlet1', $.osl.lang("portlet")));	
		portletAll.push(new KTPortlet('processPortlet2', $.osl.lang("portlet")));	
		//portletAll.push(new KTPortlet('sprPortlet1', $.osl.lang("portlet")));	
		
		$('#allPortletClose').click(function(){
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
			
			//$(this).data('original-title','전체 위젯 열기');
			//KTApp.initTooltips();
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
				}
			},
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
		$.osl.datatable.setting(dplDatatableId,{
			data: {
				source: {
					read: {
						url: "/dpl/dpl2000/dpl2100/selectDpl2100SignListAjax.do",
						params:{
							targetCd : '02',
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
				{field: 'rn', title: 'no.', textalign: 'center', width: 30, autohide: false, sortable: false},
				{field: 'nowSignTypeNm', title: '결재 상태', textalign: 'center', width: 70, autohide: false, search: true, searchType:"select", searchCd: "CMM00008", searchField:"nowSignTypeCd", sortField: "nowSignTypeCd"},
				{field: 'signReqUsrId', title: '요청자', textalign: 'center', width: 100,  search:true, sortable: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.signDrfUsrImgId, row.signDrfUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.signDrfUsrId);
					}	
				},
				{field: 'lastSignUsrNm', title: '결재자', textalign: 'center', width: 100, sortable: true, autohide: false,
					template: function (row) {
						return $.osl.user.usrImgSet(row.lastSignUsrImgId, row.lastSignUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.lastSignUsrId);
					}	
				},
				{field: 'signDtm', title: '결재 요청 일자', textalign: 'center', width: 100, sortable: true,
					template: function (row) {
						var paramDateTime = new Date(row.signDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDateTime, {fullTime: "d", returnFormat: "yyyy-mm-dd"});
		                return agoTimeStr.agoString;
					}
				},
				{field: 'dplNm', title: '배포계획명', textalign: 'center', width: 100, autohide:false, sortable: true, search: true},
				{field: 'signRes', title: '결재 의견', textalign: 'center', width: 100, autohide:true, sortable: false},
				{field: 'dplUsrNm', title: '배포자', textalign: 'center', width: 100, autohide:true,sortable: true, search:true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.dplUsrImgId, row.dplUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.dplUsrId);
					}
				}
			],
			rows:{
				clickcheckbox: true
			},
			actionBtn:{
				"dblClick": true,
				"refresh" : true,
				"update": false,
				"delete": false,
				"signApr": true,
				"signReject":true,
				"width" : 150
			},
			actionTooltip:{
				"title" : "상세",
				"dblClick": "상세보기",
				"refresh": "상세보기",
				"signApr": "결재 승인",
				"signReject": "결재 반려",
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
							paramPrjId : rowData.prjId,
							paramDplId : rowData.dplId
						};
					var options = {
							idKey: datatableId +"_"+ rowData.dplId,
							modalTitle: "["+rowData.dplNm+"] 상세 정보",
							autoHeight: false,
							modalSize: 'xl'
						};
					
					$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1002View.do',data,options);
				},
				"signApr":function(rowData, datatableId, type, rowNum, elem){
					var rowDatas = [];
					
					//외부 버튼 클릭 시 (체크박스 데이터 연동)
					if(type == "list"){
						//선택 레코드 수
						var selRecords = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords();
						
						//선택 레코드 없는 경우
						if(selRecords.length == 0){
							$.osl.alert($.osl.lang("dpl2100.action.sign.nonSelect"));
							return true;
						}
						
						rowDatas = rowData;
						
					//액션 버튼 클릭시 (각 로우 버튼)
					}else{
						rowDatas.push(rowData);
					}
					

					var usrId = $.osl.user.userInfo.usrId;
					
					//사용자 결재 순서 맞는지
					var usrSign = false;
					
					//본인 결재 차례 맞는지 검사
					$.each(rowDatas,function(idx,map){
						//본인 순서가 아니라면
						if(!(map.lastSignUsrId == usrId)){
							usrSign = true;
						}	
					});
					
					if(usrSign){
						$.osl.alert("결재 순서가 아닙니다.");
						return;
					}
					
					var data = {
							type : "signApr"
					};
					
					var options = {
						modalTitle: $.osl.lang("dpl2100.modal.title.signAprRes"),
						autoHeight: false,
						modalSize: "md",
						callback:[{
							targetId: "cmm6602SaveSubmit",
							actionFn: function(thisObj){
								
								//값 저장
					        	var signRes = OSLCmm6602Popup.getSignRes();
								
								//결재 사유 없을 경우 리턴
								if($.osl.isNull(signRes)){
									$.osl.alert("결재 사유를 입력해주세요.");
									return true;
								}
								
								$.osl.confirm($.osl.lang("dpl2100.message.confirm.signApr"),null,function(result) {
							        if (result.value) {
							        	
							        	var type = OSLCmm6602Popup.getType();
							        	
							        	//모달 창 닫기
										$.osl.layerPopupClose();
							        	
							        	//결재 승인
							        	signDpl(rowDatas,signRes,type);
							        	
							        	//새로 고침
							        	$("button[data-datatable-id="+dplDatatableId+"][data-datatable-action=select]").click();
							        }
							    });
							}
						}]
							
					};
					 
					$.osl.layerPopupOpen('/cmm/cmm6000/cmm6600/selectCmm6602View.do',data,options); 
					
				},
				"signReject":function(rowData, datatableId, type, rowNum, elem){
					var rowDatas = [];
					
					//외부 버튼 클릭 시 (체크박스 데이터 연동)
					if(type == "list"){
						//선택 레코드 수
						var selRecords = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords();
						
						//선택 레코드 없는 경우
						if(selRecords.length == 0){
							$.osl.alert($.osl.lang("dpl2100.action.sign.nonSelect"));
							return true;
						}
						
						rowDatas = rowData;
						
					//액션 버튼 클릭시 (각 로우 버튼)
					}else{
						rowDatas.push(rowData);
					}
					
					var usrId = $.osl.user.userInfo.usrId;
					
					//사용자 결재 순서 맞는지
					var usrSign = false;
					
					//본인 결재 차례 맞는지 검사
					$.each(rowDatas,function(idx,map){
						//본인 순서가 아니라면
						if(!(map.lastSignUsrId == usrId)){
							usrSign = true;
						}	
					});
					
					if(usrSign){
						$.osl.alert("결재 순서가 아닙니다.");
						return;
					}
					
					var data = {
							type : "signRjt"
					};
					var options = {
						modalTitle: $.osl.lang("dpl2100.modal.title.signRjtRes"),
						autoHeight: false,
						modalSize: "md",
						callback:[{
							targetId: "cmm6602SaveSubmit",
							actionFn: function(thisObj){
								
					        	var signRes = OSLCmm6602Popup.getSignRes();
								
								//반려 사유 없을 경우 리턴
								if($.osl.isNull(signRes)){
									$.osl.alert("반려 사유를 입력해주세요.");
									return true;
								}
								
								$.osl.confirm($.osl.lang("dpl2100.message.confirm.signRjt"),null,function(result) {
							        if (result.value) {
							        	//값 저장
							        	var type = OSLCmm6602Popup.getType();
							        	//모달 창 닫기
										$.osl.layerPopupClose();
							        	
							        	//결재 승인
							        	signDpl(rowDatas,signRes,type);
							        	
							        	//새로 고침
							        	$("button[data-datatable-id="+dplDatatableId+"][data-datatable-action=select]").click();
							        }
							    });
								
							}
						}]
							
					};
					 
					$.osl.layerPopupOpen('/cmm/cmm6000/cmm6600/selectCmm6602View.do',data,options); 
				},
			},
			theme:{
				actionBtn:{
					"refresh" : " kt-hide",
				},
				actionBtnIcon:{
					"signApr": "fas fa-check-square",
					"signReject":"fas fa-times",
				}
			},
		});
		
		//프로세스
		fnProcessList();
		
		
		//스프린트
		$.osl.datatable.setting("spr1000Table",{
			cardUiTarget: $("#spr1000CardTable"),
			data: {
				source: {
					read: {
						url: "/spr/spr1000/spr1000/selectSpr1000SprListAjax.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false},
				{field: 'sprTypeNm', title: '상태 ', textAlign: 'center', width: 100, searchType:"select", searchCd: "SPR00001", searchField:"sprTypeNm", sortField: "sprTypeNm"},
				{field: 'sprNm', title: '스프린트 이름', textAlign: 'center', width: 300, search:true},
				{field: 'sprDesc', title: '스프린트 설명', textAlign: 'center', width: 150, search:true},
				{field: 'sprStDt', title: '시작일', textAlign: 'center', width: 150, search: true, searchType:"date"},
				{field: 'sprEdDt', title: '종료일', textAlign: 'center', width: 150, search: true, searchType:"date"},
				{field: 'useNm', title: '사용 유무', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "CMM00001", searchField:"useCd", sortField: "useCd"},
			],
			searchColumns:[
				{field: 'sprDtm', title: '기간', searchOrd:4, searchType:"daterange"}
			],
			actionBtn:{
				"title": "기능 버튼",
				"dblClick": true,
				"refresh":true,
			},
			actionTooltip:{
				"title": "기능 버튼",
				"update": $.osl.lang("spr1000.datatable.action.update"),
				"delete": $.osl.lang("spr1000.datatable.action.delete"),
				"dblClick": $.osl.lang("spr1000.datatable.action.dblClick")
			},
			actionFn:{
				"refresh": function(rowData, datatableId, type, rowNum){
					//검색바 초기화
					searchReset(datatableId);
					//데이터 테이블 재조회
					$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
				},
				"insert":function(datatableId){
					var data = {type:"insert"};
					var options = {
						autoHeight: false,
						modalSize: "md",
						idKey: datatableId,
						closeConfirm: false,
						modalTitle: $.osl.lang("spr1002.insert.title"),
					};
					
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1002View.do',data,options);
				},
				"update":function(rowData, datatableId, type, rowNum, elem){
					var data = {
							type:"update"
							,paramPrjGrpId: rowData.prjGrpId
							,paramPrjId: rowData.prjId
							,paramSprId: rowData.sprId
						};
					var options = {
							autoHeight: false,
							modalSize: "md",
							idKey: datatableId,
							closeConfirm: false,
							modalTitle: $.osl.lang("spr1002.update.title"),
					};
					
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1002View.do',data,options);
				},
				//스프린트 삭제
				"delete":function(rowDatas, datatableId, type, rowNum, elem){
					//선택 프로젝트 그룹 휴지통으로 이동
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/spr/spr1000/spr1000/deleteSpr1000SprList.do'/>"}
							,{deleteDataList: JSON.stringify(rowDatas)});
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
			   				$.osl.alert(data.message,{type: 'error'});
			   			}else{
			   				//삭제 성공
			   				$.osl.toastr(data.message);
			   				
			   				//datatable 조회
			   				$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
			   			}
					});
					
					//AJAX 전송
					ajaxObj.send();
				},
				"dblClick": function(rowData, datatableId, type, rowNum, elem){
					var data = {
							paramSprId:rowData.sprId,
							paramSprStDt:rowData.sprStDt,
							paramSprEdDt:rowData.sprEdDt,
							paramSprDesc:rowData.sprDesc,
							paramSprTypeCd:rowData.sprTypeCd
						};
					
					var options = {
							autoHeight: false,
							modalSize: "xl",
							idKey: datatableId,
							closeConfirm: false,
							modalTitle: "스프린트 상세정보",
						};
					
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1001View.do',data,options);
				},
				//스프린트 시작
				"sprStart": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("spr1000.nonSelect"));
						return true;
					}
					//선택 레코드 1개 이상인 경우
					else if(rowDatas.length > 1){
						$.osl.alert($.osl.lang("spr1000.manySelect"));
						return true;
					}
					
					//스프린트 상태
					var sprInfo = rowData[0];
					
					//대기가 아닌 경우 시작 불가능
					if(sprInfo.sprTypeCd != "01" || sprInfo.useCd != "01"){
						$.osl.alert($.osl.lang("spr1000.sprTypeWaitMsg"));
						return true;
					}
					
					var data = {
							paramPrjGrpId: sprInfo.prjGrpId
							,paramPrjId: sprInfo.prjId
							,paramSprId: sprInfo.sprId
							,paramStartDt: sprInfo.sprStDt
							,paramEndDt: sprInfo.sprEdDt
						};
					var options = {
							modalTitle: "스프린트 시작",
							autoHeight: false,
							modalSize: "xl",
							idKey: datatableId,
							closeConfirm: false,
							ftScrollUse: false
						};
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1003View.do',data,options);
					
					
				},
				//스프린트 종료
				"sprEnd": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("spr1000.nonSelect"));
						return true;
					}
					//선택 레코드 1개 이상인 경우
					else if(rowDatas.length > 1){
						$.osl.alert($.osl.lang("spr1000.manySelect"));
						return true;
					}
					
					//스프린트 상태
					var sprInfo = rowData[0];
					
					//시작 중이 아닌 경우 시작 불가능
					if(sprInfo.sprTypeCd != "02"){
						$.osl.alert($.osl.lang("spr1000.sprTypeStartMsg"));
						return true;
					}
					
					var data = {
							paramPrjGrpId: sprInfo.prjGrpId
							,paramPrjId: sprInfo.prjId
							,paramSprId: sprInfo.sprId
							,paramSprNm: sprInfo.sprNm
							,paramSprDesc: sprInfo.sprDesc
							,paramStartDt: sprInfo.sprStDt
							,paramEndDt: sprInfo.sprEdDt
						};
					var options = {
							modalTitle: "스프린트 종료",
							autoHeight: false,
							modalSize: "xl",
							idKey: datatableId,
							backdrop: true,
							closeConfirm: false,
							
						};
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1004View.do',data,options);
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
			callback:{
				ajaxDone: function(evt, list){
					var sprintStr = '';
					var rowCnt = 0;
					$.each(list, function(idx, map){
						//스프린트 상태에 따라 값
						var sprTypeClass = "kt-media--primary";
						var sprTypeNm = map.sprTypeNm;
						
						if(map.sprTypeCd == "02"){
							sprTypeClass = "kt-media--danger";
						}else if(map.sprTypeCd == "03"){
							sprTypeClass = "kt-media--warning";
						}
						//상태가 대기이고 사용 유무가 아니오인경우
						else if(map.useCd == "02"){
							sprTypeClass = "kt-media--dark";
							sprTypeNm = "미 사용";
						}
						
						var restDay = 0;
						//종료일 경우 남은 일 수 0
						if(map.sprTypeCd == "03"){
							restDay = 0;
						}else{
							restDay = $.osl.escapeHtml(map.restDay);
						}
						
						//카드 UI
						sprintStr +=
								//
								'<div class="kt-portlet kt-portlet--mobile" id="sprPortlet_'+map.sprId+'">'
									//
									+'<div class="kt-portlet__head kt-portlet__head--lg">'
										//'
										+'<div class="kt-portlet__head-label">'
											+'<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid"><input type="checkbox" value="'+idx+'" data-datatable-id="spr1000Table">&nbsp;<span></span></label>'
											+'<h5 class="kt-font-boldest"><span class="osl-badge-brand kt-margin-r-10">D - ' + restDay + '</span></h5>'
											+'<h4 class="kt-font-brand kt-font-boldest" title="'+$.osl.escapeHtml(map.sprNm)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top">'+$.osl.escapeHtml(map.sprNm)+'</h4>'
										+'</div>'
										+ '<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10 invisible" data-datatable-id="sprReqTable_'+map.sprId+'" data-datatable-action="select" title="조회" data-auth-button="select" tabindex="5">'
											+ '<i class="fas fa-redo-alt"></i>'
										+ '</button>'
										//
										//
										+'<div class="kt-portlet__head-toolbar">'
											+'<div class="dropdown dropdown-inline">'
												+'<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-l-10 kt-margin-r-10" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" title="스프린트 메뉴" data-toggle-second="tooltip" data-theme="brand" data-placement="bottom">'
													+'<i class="fas fa-ellipsis-h"></i>'
												+'</button>'
												+'<div class="dropdown-menu dropdown-menu-right" data-datatable-rownum="'+idx+'">'
													+'<div class="dropdown-item" data-datatable-id="spr1000Table" data-datatable-expans="dropdown" data-datatable-action="sprStart"><i class="fas fa-play-circle kt-font-brand"></i>'+$.osl.lang("spr1000.menu.sprintStart")+'</div>'
													+'<div class="dropdown-item" data-datatable-id="spr1000Table" data-datatable-expans="dropdown" data-datatable-action="sprEnd"><i class="fas fa-stop-circle kt-font-brand"></i>'+$.osl.lang("spr1000.menu.sprintEnd")+'</div>'
													+'<div class="dropdown-divider"></div>'
													+'<div class="dropdown-item" data-datatable-id="spr1000Table" data-datatable-expans="dropdown" data-datatable-action="dblClick"><i class="fas fa-clipboard-list kt-font-brand"></i>'+$.osl.lang("spr1000.menu.sprintDetail")+'</div>'
												+'</div>'
											+'</div>'
											+'<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-l-10"><i class="fa fa-chevron-down"></i></a>'
										+'</div>'
										//
									+'</div>'
									+'<div class="kt-portlet__body">'
										+'<div class="row">'
											+ '<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">'
												+'<div class="d-flex kt-padding-l-15 align-items-center">'
													+'<div class="kt-media kt-media--xl kt-media--circle '+sprTypeClass+' osl-margin-r-2rm">'
														+'<span>'+sprTypeNm+'</span>'
													+'</div>'
													+'<div class="d-flex flex-column osl-margin-r-auto osl-word__break">'
														+'<h5 class="kt-font-boldest text-truncate" title="'+$.osl.escapeHtml(map.sprNm)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top"> '+$.osl.escapeHtml(map.sprNm)+'</h5>'
														+'<span class="text-muted text-truncate" title="'+$.osl.escapeHtml(map.sprDesc)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top">'+$.osl.escapeHtml(map.sprDesc)+'</span>'
													+'</div>'
												+'</div>'
												+'<div class="d-flex flex-wrap osl-margin-t-2rm kt-padding-l-20">'
													+'<div class="osl-margin-r-3rm osl-margin-b-175rm d-flex flex-column">'
														+'<span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>'+$.osl.lang("prj1000.startDate")+'</span>'
														+'<h5><span class="badge badge-primary">'+$.osl.escapeHtml(map.sprStDt)+'</span></h5>'
													+'</div>'
													+'<div class="osl-margin-r-3rm osl-margin-b-175rm d-flex flex-column">'
														+'<span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>'+$.osl.lang("prj1000.endDate")+'</span>'
														+'<h5><span class="badge badge-danger">'+$.osl.escapeHtml(map.sprEdDt)+'</span></h5>'
													+'</div>'
													+'<div class="osl-flex-row-fluid osl-margin-b-175rm">'
														+'<div class="osl-progress">'
															+'<div class="osl-margin-b-1rm"><i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i><span>'+$.osl.lang("prj1000.completedRatio")+'</span></div>'
															+'<div class="progress osl-prj-group-md">'
																+'<div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width:'+Math.trunc(map.sprEndPercent)+'%" aria-valuenow="'+Math.trunc(map.sprEndPercent)+'" aria-valuemin="0" aria-valuemax="100">'+Math.trunc(map.sprEndPercent)+'%</div>'
															+'</div>'
														+'</div>'
													+'</div>'
												+'</div>'
											+'</div>'
											+ '<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">'
												+ '<div class="osl-widget osl-flex-row-fluid flex-wrap">'
													+ '<div class="osl-widget-info__item osl-flex-row-fluid osl-spr-btn osl-cursor-pointer" data-spr-id="'+map.sprId+'" data-type="total">'
														+ '<div class="osl-widget-info__item-icon d-block">'
															+ '<img src="/media/osl/icon/reqAll.png">'
														+ '</div>'
													+ '<div class="osl-widget-info__item-info">'
														+ '<a href="#" class="osl-widget-info__item-title">전체</a>'
														+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqAllCnt)+'</div>'
														+ '</div>'
													+ '</div>'
													+ '<div class="osl-widget-info__item osl-flex-row-fluid osl-spr-btn osl-cursor-pointer" data-spr-id="'+map.sprId+'" data-type="ongoing">'
														+ '<div class="osl-widget-info__item-icon d-block">'
															+ '<img src="/media/osl/icon/reqInProgress.png">'
														+ '</div>'
														+ '<div class="osl-widget-info__item-info">'
															+ '<a href="#" class="osl-widget-info__item-title">진행 중</a>'
															+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqProgressCnt)+'</div>'
														+ '</div>'
													+ '</div>'
												+ '</div>'
												+ '<div class="osl-widget osl-flex-row-fluid flex-wrap">'
													+ '<div class="osl-widget-info__item osl-flex-row-fluid osl-spr-btn osl-cursor-pointer" data-spr-id="'+map.sprId+'" data-type="end">'
														+ '<div class="osl-widget-info__item-icon d-block">'
															+ '<img src="/media/osl/icon/reqDone.png">'
														+ '</div>'
														+ '<div class="osl-widget-info__item-info">'
															+ '<a href="#" class="osl-widget-info__item-title">완료</a>'
															+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqDoneCnt)+'</div>'
														+ '</div>'
													+ '</div>'
													+ '<div class="osl-widget-info__item osl-flex-row-fluid">'
														+ '<div class="osl-widget-info__item-icon d-block">'
															+ '<img src="/media/osl/icon/reqPointer.png">'
														+ '</div>'
														+ '<div class="osl-widget-info__item-info">'
															+ '<a href="#" class="osl-widget-info__item-title">평균 완료 시간</a>'
															+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.avgTime.toFixed(1))+'</div>'
														+ '</div>'
													+ '</div>'
												+ '</div>'
											+ '</div>'
											+ '<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12">'
												+'<div class="osl-card__data--empty osl-min-h-px--202" id="burnDownChart'+map.sprId+'">'
												+'</div>'
											+ '</div>'
										+'</div>'
										+ '<div class="kt-hide" id="sprReqTable_'+map.sprId+'Wrap">'
											+ '<div class="row">'
												+ '<div class="col-lg-5 col-md-6 col-sm-12">'
													+ '<div class="osl-datatable-search" data-datatable-id="sprReqTable_'+map.sprId+'"></div>'
												+ '</div>'
											+ '</div>'
											+ '<div id="sprReqTable_'+map.sprId+'"></div>'
										+ '</div>'
									+'</div>'
									//
								+'</div>';
								//
						rowCnt++;
						if(rowCnt == 2){
							sprintStr += '</div>';
							rowCnt = 0;
						}
					});
					
					//로드된 데이터 CARD형식으로 추가
					$("#spr1000CardTable").html(sprintStr);
					//차트 그리기
					$.each(list, function(idx, map){
						drawChart(map);
						portletAll.push(new KTPortlet("sprPortlet_"+map.sprId, $.osl.lang("portlet")));

					});
					//툴팁시작
					KTApp.initTooltips();
					$('[data-toggle-second="tooltip"]').tooltip({
						template:'<div class="tooltip tooltip-brand" role="tooltip"><div class="tooltip-arrow arrow" style="left: 25px;"></div><div class="tooltip-inner"></div></div>'
					});
					//스프린트 테이블 숨기기
					$("#spr1000Table .kt-datatable__table").css({visibility: "hidden", height: 0});
					
					//스프린트 진행상황 클릭 시 요구사항 테이블 활성화
					$('.osl-spr-btn').click(function(){
						//스프린트 아이디
						var sprId = $(this).data("spr-id");
						//스프린트 타입
						var cate = $(this).data("type");
						//테이블 보이기
						$("#sprReqTable_"+sprId+"Wrap").removeClass('kt-hide');
						//테이블이 존재하지 않는 경우 랜더링
						if($.osl.isNull($.osl.datatable.list["sprReqTable_"+sprId])){
							sprReqTable(sprId, cate);
							dshDatatableIdList.push("sprReqTable_"+sprId);
						}else{
							//검색
							$.osl.datatable.list["sprReqTable_"+sprId].targetDt.setDataSourceParam("sprId", sprId);
							$.osl.datatable.list["sprReqTable_"+sprId].targetDt.setDataSourceParam("type", 'ass');
							$.osl.datatable.list["sprReqTable_"+sprId].targetDt.setDataSourceParam("cate", cate);
							$("button[data-datatable-id=sprReqTable_"+sprId+"][data-datatable-action=select]").click();
							//$.osl.datatable.list["#sprReqTable_"+sprId].targetDt.select();
						}
					});
				}
			}
		});
		
	};
	var sprReqTable = function(sprId, cate){
		//스프린트에 배정된 요구사항 테이블 셋팅
		$.osl.datatable.setting("sprReqTable_"+sprId,{
			//요구사항 배정 테이블 셋팅
			data:{
				source:{
					read:{
						url: "/spr/spr1000/spr1100/selectSpr1100AssReqListAjax.do",
						params:{
							sprId:sprId,
							cate:cate,
							type:"ass"
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
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'prjNm', title:'프로젝트명', textAlign: 'left', width: 150, autoHide: false, search: true},
				{field: 'reqOrd', title: '요청번호', textAlign: 'left', width: 110, autoHide: false},
				{field: 'reqProTypeNm', title:'처리유형', textAlign: 'left', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProType", sortField: "reqProType"},
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
				{field: 'reqUsrEmail', title:'요청자e-mail', textAlign: 'left', width: 180, search: true},
			],
			searchColumns:[
				{field: 'prjGrpNm', title: $.osl.lang("req4100.field.prjGrpNm"), searchOrd: 0},
			],
			rows:{
				minHeight:50,
			}, 
			actionBtn:{
				"title":"기능 버튼",
				"delete":false,
				"update":false,
				"dblClick":true,
				"refresh" : true,
			},
			actionFn:{
				"refresh": function(rowData, datatableId, type, rowNum){
					//검색바 초기화
					searchReset(datatableId);
					//데이터 테이블 재조회
					$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
				},
				"dblClick": function(rowData, datatableId, type, rowNum){
					
					if(rowData.reqProType != "02"){
						$.osl.alert("처리중인 요구사항만 업무 처리가 가능합니다.");
						return false;
					}
					var data = {
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId
					};
					var options = {
						modalSize: "fs",
						idKey: datatableId,
						modalTitle: "["+rowData.reqNm+"] 요구사항 업무 처리",
						closeConfirm: false
					};
					
					$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6201View.do',data,options);
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
		});

	}
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
	
	
	/**
	* function : fnProcessList 
	* function 설명 : 프로세스 목록 가져와 그리기
	*/
	var fnProcessList = function(){
		var data = {
				delCd: "02"
		};
		
		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100ProcessListAjax.do'/>", "async": true}
				, data);
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(datas){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var processes = datas.data;
				$.each(processes, function(idx, value){
					//데이터테이블 아이디 추가
					dshDatatableIdList.push("processReqTable_"+idx);
					//그리기
					var str = '<div class="kt-portlet kt-portlet--mobile process-div" id="processPortlet'+idx+'" data-target-div="process'+idx+'" data-process-id="'+value.processId+'">'
								+ '<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block">'
									+ '<div class="col-lg-7 col-md-12 col-sm-12 col-12 kt-padding-l-0 osl-display__flex osl-flex-flow--row osl-flex-flow--column-mobile">'
										+ '<h4 class="kt-font-boldest kt-font-brand">'
											+ '<i class="fa fa-th-large kt-margin-r-5"></i>' + $.osl.escapeHtml(value.processNm)
										+ '</h4>'
										+ '<h5 class="kt-font-bolder kt-font-brand osl-display__flex osl-flex-flow--row osl-flex-flow--column-mobile-430">'
											+ '<span class="kt-margin-l-10">'
												+ '(생성일: <span>'+value.regDtm+'</span>)'
											+ '</span>'
											+ '<span class="kt-margin-l-20">'
												+ '담당<span class="badge osl-badge-brand kt-margin-l-5 kt-margin-r-10 chargerBadge">0</span>'
												+ '전체<span class="badge osl-badge-brand kt-margin-l-5" allBadge>0</span>'
											+ '</span>'
										+ '</h5>'
									+ '</div>'
									+ '<div class="col-lg-5 col-md-12 col-sm-12 col-12 text-right kt-padding-r-0">'
										+ '<div class="kt-portlet__head-group">'
											+ '<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10 invisible" data-datatable-id="processReqTable_'+idx+'" data-datatable-action="select" title="조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">'
												+ '<i class="fas fa-redo-alt"></i>'
											+ '</button>'
											/* + '<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10 osl-view-type" data-view-type="grid" data-target-process="process'+idx+'" title="칸반 그리드 전환" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">'
												+ '<i class="fas fa-columns"></i>'
											+ '</button>' */
											+ '<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10 osl-title--all-view-content on" title="빈 작업 흐름 숨기기" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">'
											+ '</button>'
											+ '<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10" data-datatable-id="processReqTable_'+idx+'" data-datatable-action="refresh" title="새로고침" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="refresh" tabindex="5">'
												+ '<i class="fas fa-redo-alt"></i>'
											+ '</button>'
											+ '<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10 osl-portlet-fullscreen-btn" title="영역 전체화면" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">'
												+ '<i class="fas fa-expand"></i>'
											+ '</button>'
											+ '<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air"><i class="fa fa-chevron-down"></i></a>'
										+ '</div>'
									+ '</div>'
								+ '</div>'
								+ '<div class="kt-portlet__body kt-padding-10">'
									+ '<div class="osl-dash-gridkaban-bg osl-overflow--x-auto">'
										/* begin :: 그리드 */
										+ '<div class="osl-dsh-flowchart kt-margin-20 chartDiv">'
											/* chart */
										+ '</div>'
									+ '</div>'
								+ '</div>'
								+ '<div class="process-datatable-div kt-hide">'
									+ '<div class="row">'
										+ '<div class="col-lg-7 col-md-7 col-sm-8 col-8">'
										+ '<div class="osl-datatable-search" data-datatable-id=processReqTable_'+idx+'"></div>'
										+ '</div>'
									+ '</div>'
									+ '<div class="kt_datatable kt-padding-20 osl-datatable-footer__divide process-datatables" id="processReqTable_'+idx+'"></div>';
								+ '</div>'
							+ '</div>'
						+ '</div>'
					$("#processCard").append(str);
				});
				
				fnGetProcessFlow();
			}
    	});
		//ajax 전송
    	ajaxObj.send();		
	};
	
	/**
	* function : fnGetProcessFlow
	* function : 프로젝트의 모든 작업흐름을 가져와 프로세스별로 구분 
	*/
	var fnGetProcessFlow = function(){
		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100FlowListAjax.do'/>", "async": true});
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
	           //같은 프로세스 id로 묶기
	           var allProcessFlowList = {};
	           var flowList = data.flowList;
	           var flowLinkList = data.flowLinkList;

	           // 프로세스 별 작업흐름 목록
	           var processFlowList = {};
	           // 작업흐름 연결 정보
	           var processFlowLinkList = {};
	            
	           // 프로젝트에 프로세스 ID 존재할 경우
	           if(!$.osl.isNull(flowList)){
	               
	              // 작업흐름 list loop
	              $.each(flowList, function(idx, map){
	                  
	                 var processId = map.processId;
	                 // 프로세스 id 해당 값 없을경우
	                 if($.osl.isNull(processFlowList[processId])){
	                    // 빈 배열 생성
	                    processFlowList[processId] = [];
	                 }
	                 // 프로세스 id 별로 작업흐름 데이터 push
	                 processFlowList[processId].push(map); 
	              });
	           }
	            
	           if(!$.osl.isNull(flowLinkList)){
	               // 작업흐름 연결 정보 list loop
	              $.each(flowLinkList, function(idx, map){
	                  
	                 var processId = map.processId;
	                 // 프로세스 id 해당 값 없을경우
	                 if($.osl.isNull(processFlowLinkList[processId])){
	                    // 빈 배열 생성
	                    processFlowLinkList[processId] = [];
	                 }
	                  
	                 // 프로세스 id 별로 작업흐름 연결 데이터 push
	                 processFlowLinkList[processId].push(map); 
	              });
	           }
	            
	           $.each(processFlowList, function(processId, flowData){
	               
	              if($.osl.isNull(allProcessFlowList[processId])){
	                 allProcessFlowList[processId] = [];
	              }
	               
	              allProcessFlowList[processId]["flowList"] = flowData;
	              allProcessFlowList[processId]["flowLinkList"] = processFlowLinkList[processId];
	           });
	           
	           //차트 그리기
	           var index = 0;
	           $.each(allProcessFlowList, function(processId, value){
	        	   fnFlowChart(index, processId, value.flowList, value.flowLinkList);
	        	   //데이터 테이블 아이디에 붙는 index, 첫번째 processId, flowId 임시 전달
	        	   processTableSetting(index, processId, value.flowList[0].flowId);
	        	   index++;
	           });
	
		   		//다그렸으므로 이벤트 적용
		   		fnProcessEvt();
	        }
	     });
	     //ajax 전송
	     ajaxObj.send();   
	}
	
	/**
	* function : fnFlowChart
	* function 설명 : 	프로세스 내부 작업 흐름 정렬하기
	*/
	var fnFlowChart = function(index, processId, flowList, flowLinkList){
		//작업흐름 데이터
		/* var flowList = data.flowList;
		var flowLinkList = data.flowLinkList; */

		if($.osl.isNull(flowList) || flowList.length == 0){
			return true;
		}
		var list = [];
		if($.osl.isNull(flowLinkList) || flowLinkList.length == 0){
			list = flowList;
			//그리기
			fnFlowChartDraw(list, processId);
			return true;
		}
		
		/* 대시보드 데이터 세팅 -- 시작 */
	      //작업흐름 Id별 다음 작업흐름 Id
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
	      
	      //작업흐름 Id: 정보 
	      var flowInfoList = {};
	      
	      //시작 작업흐름 Id
	      var startFlowId;
	      //종료 작업흐름 Id
	      var doneFlowId;
	      var doneFlow;
	      
	      //이미 추가된 작업흐름 index check
	      var addFlowCheck = [];
	      
	      //작업흐름 데이터 세팅 하기
	      $.each(flowList, function(idx, map){
	         //시작 작업흐름인 경우 맨 앞으로 작업흐름 추가
	         if(map.flowStartCd == "01"){
	            //시작 단계 추가
	            //$("#프로세스 영역 ID").prepend('작업흐름 UI');
	            //시작 작업흐름 Id
	            startFlowId = map.flowId;
	            list.push(map);
	         }
	         
	         //종료 작업흐름인경우 임시 저장
	         if(map.flowDoneCd == "01"){
	            doneFlowId = map.flowId;
	            doneFlow = map;
	         }
	         map["flowNextId"] = flowNextIdList[map.flowId];
	         flowInfoList[map.flowId] = map;
	      });
	
	      //작업흐름 추가 재귀
	      var innerFlowAppend = function(currentFlowId) {
	    	  
	         //현재 대상 작업흐름 정보
	         var flowInfo = flowInfoList[currentFlowId];
	        
	         //다음 작업흐름
	         var nextFlowIds = null;
	         
	         if(!$.osl.isNull(flowInfoList[currentFlowId]) && flowInfoList[currentFlowId].hasOwnProperty("flowNextId")){
	        	 nextFlowIds = flowInfoList[currentFlowId]["flowNextId"];
	         }
	         //size가 0이면 true
	         if(!$.osl.isNull(nextFlowIds) && nextFlowIds.length == 0){
	            return true;
	         }
	         //이미 추가된 작업흐름 skip
	         else if(addFlowCheck.indexOf(currentFlowId) != -1){
	            return true;
	         }
	         //시작단계와 종료단계는 skip
	         if(flowInfo.flowStartCd == "02" && flowInfo.flowDoneCd == "02"){
	            //해당 작업흐름 추가
	            //$("#프로세스 영역 ID").append('작업흐름 UI');
	            addFlowCheck.push(currentFlowId);
	            list.push(flowInfo);
	         }
	         
	         //종료 단계가 아닌 경우(다음 아이디 값이 있으므로)
	         if(!$.osl.isNull(nextFlowIds)){
	            //다음 작업흐름 loop
	            $.each(nextFlowIds, function(idx, map){
	               innerFlowAppend(map);
	            });
	         };
	         return true;
	      };
	      
	      //시작 단계 부터 재귀 호출
	      innerFlowAppend(startFlowId);
	      
	      //$("#작업흐름UI[data-flow-id="+doneFlowId+"]").appendTo("#프로세스 영역 ID")
	      list.push(doneFlow);
	      /* 대시보드 데이터 세팅 -- 종료 */
		//그리기
		fnFlowChartDraw(list, processId);
	};
	
	/**
	* function : fnFlowChartDraw
	* function : 프로세스 작업 흐름 그리기
	*/
	var fnFlowChartDraw = function(list, processId){
		var str = '';
		$.each(list, function(idx, value){
			str += '<div class="flowchart-operator osl-flowchart__operator border" data-operator-id="previewOperator">'
					+ '<div class="flowchart-operator-function osl-min-h-px--24">';
				if(value.flowSignCd == "01"){
					str += '<li class="fa fa-file-signature" title="결재"></li>';	
				}
				if(value.flowSignStopCd == "01"){
					str += '<li class="far fa-stop-circle" title="결재 반려시 종료 유무"></li>';	
				}
				if(value.flowEndCd == "01"){
					str += '<li class="fa fa-sign-out-alt" title="종료 분기"></li>';	
				}
				if(value.flowRevisionCd == "01"){
					str += '<li class="fa fa-code" title="리비전 저장유무"></li>';	
				}
				if(value.flowDplCd == "01"){
					str += '<li class="fa fa-puzzle-piece" title="배포계획 저장 유무"></li>';	
				}
				
				str	+= '</div>'
					+ '<div class="flowchart-operator-title">'
						+ '<div class="flowchart-operator-title__lebel">'+$.osl.escapeHtml(value.flowNm)+'</div>'
						+ '<div class="flowchart-operator-menu hide">'
							+ '<button type="button" class="btn btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">'
								+ '<i class="fa fa-bars kt-padding-r-0"></i>'
							+ '</button>'
							+ '<div class="dropdown-menu dropdown-menu-right">'
								+ '<div class="dropdown-item" data-flow-action="update">'
									+ '<i class="fa fa fa-edit kt-font-primary"></i>수정'
								+ '</div>'
								+ '<div class="dropdown-item" data-flow-action="delete">'
									+ '<i class="fa fa fa-trash kt-font-primary"></i>삭제'
								+ '</div>'
							+ '</div>'
						+ '</div>'
					+ '</div>'
					+ '<div class="flowchart-operator-inputs-outputs kt-margin-0">'
						+ '<div class="flowchart-operator-inputs text-center kt-padding-10 osl-cursor-pointer flow-charger" data-process-id="'+value.processId+'" data-flow-id="'+value.flowId+'"> 담당 <span>1</span></div>'
						+ '<div class="flowchart-operator-outputs text-center kt-padding-10 border-left osl-cursor-pointer flow-all-charger" data-process-id="'+value.processId+'" data-flow-id="'+value.flowId+'"> 전체 <span>1</span></div>'
					+ '</div>'
				+ '</div>';
				
			if(idx < list.length-1 ){
				/* 화살표 */
				str += '<i class="fa fa-arrow-right"></i>';
			}
		});
		
		//그리기
		var processRow = $("#processCard").children("div[data-process-id="+processId+"]").find(".chartDiv");
		$(processRow).append(str);
	}
	
	//프로세스 데이터 테이블 세팅  
	var processTableSetting = function(tablenum, paramProcessId, paramStartFlowId){
		$.osl.datatable.setting("processReqTable_"+tablenum,{
			data: {
				source: {
					read: {
						url: "/req/req4000/req4100/selectReq4100ReqFlowListAjax.do",
						params : {
							"dshProcess" : "Y",
							"processId" : paramProcessId,
							"flowId" : paramStartFlowId,
							"usrId" : $.osl.user.userInfo.usrId
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
				{field: 'prjNm', title:'프로젝트명', textAlign: 'left', width: 150, autoHide: false, search: true},
				{field: 'reqOrd', title: '요청번호', textAlign: 'left', width: 110, autoHide: false},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 340, search: true, autoHide: false},
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
				{field: 'reqUsrEmail', title:'요청자e-mail', textAlign: 'left', width: 180, search: true},
				{field: 'reqUsrNum', title: '요청자 연락처', textAlign: 'center', width: 100, search: true},
			],
			searchColumns:[
				{field: 'prjGrpNm', title: $.osl.lang("req4100.field.prjGrpNm"), searchOrd: 0},
				{field: 'reqGrpNm', title: $.osl.lang("req4100.field.reqGrpNm"), searchOrd: 2},
				{field: 'reqGrpNo', title: $.osl.lang("req4100.field.reqGrpNo"), searchOrd: 3}
			],
			rows:{
				clickCheckbox: true,
			},
			actionBtn:{
				"title" : "상세",
				"width" : "30",
				"dblClick": true,
				"update": false,
				"delete" : false,
				"refresh": true,
			},
			actionTooltip:{
				"dblClick": "상세보기"
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
						};
					
					$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4102View.do',data,options);
				},
			},
			theme : {
				actionBtn: {
					"dblClick" :  "",
					"refresh" : " kt-hide"
				},
				actionBtnIcon:{
					"dblClick" : "fas fa-external-link-alt"
				}
			},
			callback:{
				ajaxDone: function(evt, list){
					//현재 데이터 테이블 아이디
					var datatableId = "processReqTable_"+tablenum;
					var datatable = $.osl.datatable.list[datatableId].targetDt;
					
					//프로세스 담당, 전체 수 가져오기
					var flowCntList = datatable.lastResponse.meta.flowCntList;
					console.log("flowCnt : ", flowCntList);
					if($.osl.isNull(flowCntList[0])){
						$("#processPortlet"+tablenum).find(".chargerBadge").text('0');
						$("#processPortlet"+tablenum).find(".allBadge").text('0');
					}else{
						$("#processPortlet"+tablenum).find(".chargerBadge").text(flowCntList[0].reqChargerTotalCnt);
						$("#processPortlet"+tablenum).find(".allBadge").text(flowCntList[0].reqTotalCnt);
					}
					
					var chargerSpans = $("#processPortlet"+tablenum).find(".flow-charger");
					
					$.each(chargerSpans, function(index, value){
						$.each(flowCntList, function(idx, item){
							if($(value).data("flowId") == item.flowId){
								$(value).children().text(item.reqChargerCnt);
								$(value).siblings(".flow-all-charger").children().text(item.reqFlowCnt);
							}
						});
					});
				}
			}
		});
	}
	
	/**
	* function : fnProcessEvt
	* function 설명 : 프로세스 클릭 이벤트 적용
	*/
	var fnProcessEvt = function(){
		/* 
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
		 */
		$('.osl-portlet-fullscreen-btn').click(function(){
			//fullscreen대상 div
			var targetObj = $(this).parents('.kt-portlet');
			//fullscreen제거 시
			if(targetObj.hasClass('kt-portlet--fullscreen')){
				//움직이는 것 처럼 보이게 동작 후 fullscreen class 제거
				targetObj.stop().animate({top: '30%'},1000, function(){
					targetObj.removeClass('kt-portlet--fullscreen');
				});
			}else{
				//fullscreen 동작 시
				$('.kt-portlet').removeClass('kt-portlet--fullscreen');
				//기존 가지고 있는 top값 제거
				$('.kt-portlet').css({top:''});
				//fullscreen class 제거
				targetObj.addClass('kt-portlet--fullscreen');
				//top으로 올리기
				targetObj.stop().animate({top:'0%'},1000);
			}
		});
		
		//담당 버튼 클릭 시
		$(".flow-charger").click(function(){
			console.log("담당 클릭");
			//해당 데이터 테이블 id가져오기
			var item = $(this).parents(".process-div");
			var datatableId = $(item).children(".process-datatable-div").find(".process-datatables").attr("id");
			var datatable = $.osl.datatable.list[datatableId].targetDt;
			//param 넣기
			datatable.setDataSourceParam("dshProcess", "Y");
			datatable.setDataSourceParam("processId", $(this).data("processId"));
			datatable.setDataSourceParam("flowId", $(this).data("flowId"));
			datatable.setDataSourceParam("usrId", $.osl.user.userInfo.usrId);
			//조회하기
			//데이터 테이블 재조회
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
			
			//데이터 div 보이기
			if($(item).find(".process-datatable-div").removeClass("kt-hide"));
		});
		
		//전체 버튼 클릭 시
		$(".flow-all-charger").click(function(){
			console.log("전체 클릭");
			//해당 데이터 테이블 id가져오기
			var item = $(this).parents(".process-div");
			var datatableId = $(item).find(".process-datatables").attr("id");
			var datatable = $.osl.datatable.list[datatableId].targetDt;
			//param 넣기
			datatable.setDataSourceParam("dshProcess", "Y");
			datatable.setDataSourceParam("processId", $(this).data("processId"));
			datatable.setDataSourceParam("flowId", $(this).data("flowId"));
			datatable.setDataSourceParam("usrId", "");
			//조회하기
			//데이터 테이블 재조회
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
		});
				
		/*칸반 sortable*/
		/* 
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
				//여기에 동작 후 event 작성하시면 됩니다				
			},
	      	//해당 div로 이동될 대상의 동작(들어온)
			onAdd:function(evt){
				//여기에 동작 후 event 작성하시면 됩니다
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
				//여기에 동작 후 event 작성하시면 됩니다
			},
	      	//해당 div로 이동될 대상의 동작(들어온)
			onAdd:function(evt){
				//여기에 동작 후 event 작성하시면 됩니다
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
				//여기에 동작 후 event 작성하시면 됩니다
			},
	      	//해당 div로 이동될 대상의 동작(들어온)
			onAdd:function(evt){
				//여기에 동작 후 event 작성하시면 됩니다
			}
	    });
		 */
	};
	
	
	//차트그리기
 	var drawChart = function(rowdata){
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"/spr/spr1000/spr1000/selectSpr1000ChartInfoAjax.do"},{sprId: rowdata.sprId});
 		//AJAX 전송 성공 함수
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				
 				var chartData = data.chartData;
 				var today = new Date();
 				var endDt  = today.getFullYear() + "-" + (today.getMonth()+1) + "-" + today.getDate();
 				
 				totalSprPoint = rowdata.sprPoint;
 				//차트데이터 가공
 				var seriesData = getDataRangeData(rowdata.sprStDt, rowdata.sprEdDt, "1", chartData);
 				
 				//번다운차트 출력
 				if(rowdata.sprTypeCd == '01'){
	 				$("#burnDownChart"+rowdata.sprId).text("데이터 없음")
 				}else{
	 				drawBurnDownChart(seriesData, rowdata.sprId);
 				}
 			}	
 		});
 		
 		ajaxObj.send();
 	}
 	//번다운 차트 그리기
 	var drawBurnDownChart = function(dateRange, sprId){
 		 var chart = $.osl.chart.setting("apex","burnDownChart"+sprId,{
 			//차트 데이터 설정
				data:{										
					param:{
						dataArr: dateRange,	
						 //x축 키값
						 xKey:"time",
						 key:{
							 key1:"idealBurnDownLine",
							 key2:"burnDownSprPoint"
						 },
						 keyNm:{
							 keyNm1:"이상적인 번다운라인",
							 keyNm2:"실제 번다운라인"
						 },
						 //차트 타입
						 chartType:"line",
						 dataType: "local"
					}
				},
				fill:{
					type:false
				},
				chart:{
					toolbar: {
						show:false
					},
					height:180,
					//라인 색상
					colors: ["#ffb822","#840ad9"],
					title: {
						text: "번다운차트",
						align: "center",
					},
					stroke: {
				          curve: 'straight'
				    },
			        animations:{
						enabled:false
					},
				    dataLabels:{
				    	enabled:true,
				    	formatter:function(val, opts){
				    		var valIndex = new Date(opts.ctx.data.twoDSeriesX[opts.dataPointIndex]).format("MM-dd");
				    		var xlabelList = opts.w.globals.labels.map(function(x){return new Date(x).format("MM-dd")});
				    		//해당 데이터가 x라벨에 존재할 경우 표출 아니면 미표출
				    		if(xlabelList.includes(valIndex)){
				    			if($.osl.isNull(val)){
				    				return "";
				    			}
				    			return val;
				    		}else{
					    		return "";
				    		} 
				    	}
				    },
				    grid: {
				          borderColor: '#e7e7e7',
				          row: {
				            colors: ['#f3f3f3', 'transparent'], 
				            opacity: 0.5
				          },
				    },
					xaxis: {
				        type: 'datetime',
				        //출력 형태
				        labels: {
				        	hideOverlappingLabels :true,
				            formatter: function(value){
				            	return new Date(value).format("MM-dd");
				            }
				        },
				        //x축 몇개를 표시할 것인지
				        tickAmount: '5',
				        //중간에 점찍기
				        tickPlacement: 'between',
		        	},
					yaxis: {
						show:true
		        	},
		        	grid:{
		        		show:true
		        	}
				}
			});
		 }
 	//차트 데이터 정제
 	var getDataRangeData = function(sttDt, endDT, type, data){
 		//이상적인 번업라인 데이터 만들기

 		if(data.length!=0){
	 		//누적 스토리포인트 날짜:스토리포인트 형태로 변환
	 		var sprPoint = [];
	 		$.each(data, function(index, value){
	 			var _series = {};
	 			_series[value.reqEdDtm] = value.cumSprPoint;
	 			sprPoint.push(_series);
	 		});
 		}
 		
 		//시작일자와 종료일자 사이의 날짜를 일별로 자르기.
 		if(type=='1'){
 			var resDay = [];
	 	 	var stDay = new Date(sttDt);
	 	   	var edDay = new Date(endDT);    	
	 	  	while(stDay.getTime() <= edDay.getTime()){
	 	  			var ideal = 0;
	 	  			var _mon = (stDay.getMonth()+1);
	 	  			_mon = _mon < 10 ? '0'+_mon : _mon;
	 	  			var _day = stDay.getDate();
	 	  			_day = _day < 10 ? '0'+_day : _day;
	 	  			var _time = stDay.getFullYear() + '-' + _mon + '-' +  _day;
	 	  			if(_time == data.reqEdDtm){
	 	  				resDay.push({"time":stDay.getFullYear() + '-' + _mon + '-' +  _day})
	 	  			}else{  
		 	   		resDay.push({"time":stDay.getFullYear() + '-' + _mon + '-' +  _day});
	 	  			
	 	  			}
	 	   			stDay.setDate(stDay.getDate() + 1);
	 	   			ideal = ideal + 10
	 	   	}
	 	//주별로
 		}else if(type=='2'){
 			
 		}
 		var length = resDay.length
 		//전체 스토리포인트 총합 가져와서 / 일수로 나누기
 		var step = totalSprPoint / (length-1)
 		//이상적인 다운라인 데이터 작성
 		//일수
 		var end = totalSprPoint;
 		$.each(resDay, function(index, value){
 			//바로종료할경우
	 		if(length == 1){
	 			value['idealBurnDownLine'] = totalSprPoint;
	 		//2일만에 종료할경우
	 		}else if(length == 2){
	 			value['idealBurnDownLine'] = end;
	 			end -= totalSprPoint;
	 		//나머지
	 		}else{
	 			value['idealBurnDownLine'] = end.toFixed(1);
	 			end -= step	
	 		}
 		})
 		if(data.length!=0){
	 		//오늘 날짜
	 		var today = new Date();
	 		//실제 스토리포인트 데이터 작성
	 		for(var dayIndex = 0; dayIndex < resDay.length; dayIndex++){
	 			var match = false;
	 			//오늘 날짜보다 이후의 날짜는  추가하지않음.
	 			var gap = new Date(resDay[dayIndex].time).getTime() - today.getTime()
	 			if(gap < 0){
		 			for(var dataIndex = 0 ; dataIndex < data.length ; dataIndex ++){
		 				if(resDay[dayIndex].time == data[dataIndex].reqEdDtm){
		 					match = true;
		 					//매치할 경우 가져온 데이터에서 할당한다.
		 					resDay[dayIndex]['burnDownSprPoint'] = totalSprPoint - data[dataIndex].cumSprPoint
		 					break;
		 				}
		 			}
		 			//매치하지 않을 경우
		 			if(!match){
		 				//처음 시작은 0으로
		 				if(dayIndex == 0){
		 					resDay[dayIndex]['burnDownSprPoint'] = totalSprPoint;
		 				//매치하지 않을 경우 전의 sprPoint를 가져와서 할당한다.
		 				}else{
			 				resDay[dayIndex]['burnDownSprPoint'] = resDay[dayIndex - 1]['burnDownSprPoint']; 
		 				}
		 			}
	 			}else{
	 				resDay[dayIndex]['burnUpSprPoint'] = null;
					resDay[dayIndex]['burnDownSprPoint'] = null;
	 			}
	 		}
 		}
 		return resDay;
 	}		
 	
 	// 대시보드 세팅
	var fnDashBoardSetting = function(){
		//자동 새로고침 타이머 세팅
		timerVarSel = $('#timerVarSel').val();
		secondTime = (timerVarSel*60);
		clearInterval(timer);
		timer = setInterval(printTime,1000);
		
		//모든 데이터 테이블 검색 초기화 및 재호출
		$.each(dshDatatableIdList, function(idx, value){
			fsRefresh(value);
		});
		
		// 차트 데이터 조회
		fnChartDataLoad();
		
	};

	
	// 차트 데이터를 조회한다.
	var fnChartDataLoad = function(){
		
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dsh/dsh2000/dsh2000/selectDsh2000DashBoardDataAjax.do'/>"});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			// 에러일 경우 메시지 출력
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				fnChartSetting(data);
			}	
		});
		
		//AJAX 전송
		ajaxObj.send();
		
	};
	
	
	// 조회한 데이터로 차트 세팅
	var fnChartSetting = function(dshData){
		 
		// 차트 영역 값
		var chartIdArr = []; 
		$.each($("div[data-dshboard-chart=prjChart]"), function(idx, map){
			// 차트 영역 ID값 가져온다.
			chartIdArr.push($(map).attr("id"));
		});
		
		// 차트 영역 ID로 loop
		$.each(chartIdArr, function(idx, map){
			var dshChartObj = $.osl.chart.list[map];
			// 차트가 이미 존재할 경우 제거
			if(!$.osl.isNull(dshChartObj)){
				dshChartObj.targetCt.destroy();
			}
		});
		
		// 차트1 - 프로세스별 요구사항 수(프로세스별 총개수 + 최종 완료 개수)
		var processReqCnt = dshData.processReqCnt;
			
		// 차트2 - 각 프로세스 별 월별 처리율 수
		var monthProcessReqCnt = dshData.monthProcessReqCnt;
		
		// 프로세스 별 요구사항 수 차트 가공 데이터
		var reqCntChartData = [];
		// 각 프로세스 별 처리율 차트 가공 데이터
		var monthRatioChart = [];
		// 분기별 처리율 차트 가공 데이터
		var quarterRatioChart = [];
		
		// 차트 1 데이터가 있을 경우
		if(!$.osl.isNull(processReqCnt)){
			
			//차트1 데이터 가공
			$.each(processReqCnt,function(idx, map){
		
				// 프로세스 별 데이터 세팅
				var tmpChartData = {
						"processId":map.processId, 
						"processNm":map.processNm,
						"reqAllcnt":map.allCnt,
						"reqChargerCnt":map.chargerCnt,
						"reqEndCnt":map.endCnt
					};
				
				// 차트데이터에 추가
				reqCntChartData.push(tmpChartData); 
			});
		}
		
		// [차트2] 각 프로세스별 처리율 필요 데이터
		var monthRatio_X_Label = ["01월","02월","03월","04월","05월","06월","07월","08월","09월","10월","11월","12월"];	//월별 라벨
		var monthRatio_Y_Label = [];	//프로세스 목록
		var monthRatio_processNm = {};	//프로세스 명
		var monthRatio_monthCnt = {};	//프로세스별 요구사항 개수
		var monthRatio_cahrt_data = [];	//차트 데이터 세팅
		var monthRatio_bgColor_list = ["#4b73eb","#936de9","#ff5643","#58c3e5","#fba450","#eb4ba4","#89eb4b","#c4eb4b","#9f4beb","#fba450","#ff5643","#58c3e5","#fba450"];	//차트 배경색
		var monthRatio_chart_color = []; // 차트2 컬러 배열
		var monthRatio_chart_border = []; // 차트 2 테두리 width값 배열
		
		// [차트3] 분기별 처리율 필요 데이터
		var quarterRatio_X_Label = ["1분기", "2분기", "3분기", "4분기"];
		var quarterRatio_label_val = {"1분기":0, "2분기":1, "3분기":3, "4분기":4};
		var quarterRatio_month_idx = {"01월":0,"02월":0,"03월":0,"04월":1,"05월":1,"06월":1,"07월":2,"08월":2,"09월":2,"10월":3,"11월":3,"12월":3};
		var quarterRatio_chart_data = [0,0,0,0]; // 분기별 처리율 값 누적을 위한 배열
		
		var quarterCahrtData = []; // 실제 분기별 처리율 차트 데이터
		
		// 기본 분기별 차트 데이터
		var defaultQuarterCahrt = [
			{"quarterNm":"1분기", "quarterVal":0},
			{"quarterNm":"2분기", "quarterVal":0},
			{"quarterNm":"3분기", "quarterVal":0},
			{"quarterNm":"4분기", "quarterVal":0},
		];
		
		
		// 각 프로세스 별 월별 처리율 수 데이터가 있을 경우
		if(!$.osl.isNull(monthProcessReqCnt)){
			// 차트 데이터 가공
			$.each(monthProcessReqCnt, function(idx, map){
				
				var reqEdDtmMm = map.reqEdDuMm;
				//'월' 붙이기
				reqEdDtmMm += "월";
				
				if(monthRatio_Y_Label.indexOf(map.processId) == -1){
					//프로세스명
					monthRatio_Y_Label.push(map.processId);
					
					//json 조합
					var tempJson = {};
					tempJson[map.processId] = map.processNm;
					$.extend(monthRatio_processNm,tempJson);
				}
				
				//데이터 배열 만들기
				if(Object.keys(monthRatio_monthCnt).indexOf(reqEdDtmMm) == -1){
					monthRatio_monthCnt[reqEdDtmMm] = {};
				}
				
				//월별 프로세스별 요구사항 완료율 세팅
				if(Object.keys(monthRatio_monthCnt[reqEdDtmMm]).indexOf(map.processId) == -1){
					//완료율 계산
					//월별 요구사항 총 갯수
					var reqTotalCnt = map.reqTotalCnt;
					//월별 완료 갯수
					var reqEdMmCnt = map.reqEdMmCnt;
					//완료율
					var reqEdMmRatio = 0;
					
					//갯수가 0이상일 경우
					if(reqEdMmCnt > 0 && reqTotalCnt > 0){
						reqEdMmRatio = ((reqEdMmCnt/reqTotalCnt)*100);
						reqEdMmRatio = reqEdMmRatio.toFixed(0);
					}
					
					monthRatio_monthCnt[reqEdDtmMm][map.processId] = reqEdMmRatio;
				}
			});
			
			//data 세팅 - 프로세스 루프
			$.each(monthRatio_Y_Label,function(idx, map){
				//데이터 배열
				var mmCntDataArr = [];
				
				//월별 루프
				$.each(monthRatio_X_Label,function(inIdx, inMap){
					//월 데이터 없는경우
					if($.osl.isNull(monthRatio_monthCnt[inMap])){
						mmCntDataArr.push(0);
					}else{
						//월별 프로세스 데이터 체크
						if($.osl.isNull(monthRatio_monthCnt[inMap][map])){	//없는경우 0(배열 크기 맞추기 위함)
							mmCntDataArr.push(0);
						}else{	
							//있는경우 데이터 가져와서 push
							mmCntDataArr.push(monthRatio_monthCnt[inMap][map]);
						
							//분기별 % /3
							var mmCntVal = monthRatio_monthCnt[inMap][map];
							if(mmCntVal > 0){
								mmCntVal = (mmCntVal/3);
							}
							
							// 분기별 데이터 세팅
							var quarterVal = quarterRatio_month_idx[inMap]; // 분기별 구분값 - 0, 1, 2, 3
							
							// 분기별 구분값에 따라 분기 데이터가 없을 경우
							if( $.osl.isNull(quarterCahrtData[quarterRatio_label_val[quarterVal]]) ){
								// 빈 json 생성
								quarterCahrtData[quarterVal] = {};
								// 분기 생성
								quarterCahrtData[quarterVal]["quarterNm"] = (quarterVal+1)+"분기";
								quarterCahrtData[quarterVal]["quarterVal"] = 0;
							}

							//차트3 - 분기별 검사하고 데이터 추가
							quarterRatio_chart_data[quarterVal] += mmCntVal;
						 	quarterCahrtData[quarterVal]["quarterVal"] = quarterRatio_chart_data[quarterVal]; // 분기별 처리율 합산값 세팅
						}
					}
				});
				
				//배경색 인덱스
				var bgIdx = idx;
				
				//프로세스 수가 가진 색상을 넘어서는경우
				if(idx > monthRatio_bgColor_list.length-1){
					bgIdx = idx%monthRatio_bgColor_list.length;
				}
				
				monthRatio_chart_color.push(monthRatio_bgColor_list[bgIdx]);
				monthRatio_chart_border.push(0);
				
				//차트에 입력되는 데이터 세팅
				monthRatio_cahrt_data.push({
					processId:map,
		            processNm: monthRatio_processNm[map],
		            monthRatio: mmCntDataArr,
				});
			});
		}
	
		// 최종적으로 분기별 처리율 차트에 세팅될 데이터
		var settingQuarterData = [];
		// 가공한 분기별 차트 데이터 loop
		$.each(quarterCahrtData, function(idx, map){
			// 차트 데이터 없을 경우
			if($.osl.isNull(map)){
				// 해당하는 분기의 기본값(0) 세팅
				settingQuarterData.push(defaultQuarterCahrt[idx]);
			}else{
				map["quarterVal"] = Math.round(map["quarterVal"]);
				// 있을 경우 해당하는 값 세팅
				settingQuarterData.push(map);
			}
		});
		
		
		// [차트1] 프로세스 별 요구사항 수 차트
		var reqCntChart = $.osl.chart.setting("apex","processReqCntChart",{
			
			// 차트 데이터 세팅
			data:{
				param:{
					// 세팅 데이터
					dataArr: reqCntChartData,	
					//x축 키값
					xKey:"processNm",
					key:{
						 key1: "reqAllcnt", // bar 총 요구사항
						 key2: "reqChargerCnt", // line 담당 요구사항
						 key3: "reqEndCnt", // line 최종완료 요구사항
					},
					keyNm:{
						keyNm1:"총 요구사항",
						keyNm2:"담당 요구사항",
						keyNm3:"최종완료 요구사항"
					},
					keyType:{
						 keyType1:"bar",
						 keyType3:"line",
						 keyType4:"line"
					},
					dataType: "local",
					//차트 타입
					chartType:"mix"
				}
			},
			chart:{
				//색상
				colors: ["#840ad9", "#ffb822","#d90a4d"],
				title: {
					text: "프로세스별 요구사항 수",
					align: "center",
					margin: 20,
				},
				stroke: {
		        	width: [0, 5, 5],
		          	curve: 'straight',
		          	dashArray: [0, 0, 0]
				},
				// 라인차트 중간중간 점 표시 설정
				markers: {
				    size: 4, // 점의 사이즈
				    strokeWidth: 0, // 점 테두리 값
				},
				dataLabels:{
					enabled:true,
				 	enabledOnSeries: [0], // 데이터 라벨 표시여부 - 라벨을 표시하고 싶은 차트 index를 배열로 세팅
					// 데이터 레이블 표시
					formatter:function(val, opts){
						return val;
					},
					// 레이블 주위 테두리 설정
					background: {
						enabled:false
					},
					// 레이블 폰트 스타일
					style: {
						colors: ["#ffffff"] // 폰트 색상은 배열로 지정
					},
				},
				yaxis: {
					show:true,
					min:0,
				},
				zoom: {
		            enabled: false // 프로세스 별 요구사항 수 이므로 zoom fasle
		        },
			}
		});
		// end::차트 1 
		
    	// [차트2] 각 프로세스 별 처리율
		var processMonthRatioChart = $.osl.chart.setting("apex","processMonthRatioChart",{
			// 차트 데이터 세팅
			data:{
				param:{
					// 세팅 데이터
					dataArr: monthRatio_cahrt_data,	
					//x축 키값
					xKeyArr: monthRatio_X_Label, // 1~12월 라벨
					key:{
						 key1: "processNm", // 프로세스 명
						 key2: "monthRatio", // 월별 처리율
					},
					keyType:{
						 keyType1:"bar",
					},
					dataType: "local",
					//차트 타입
					chartType:"colum"
				}
			},
			chart:{
				//색상
				colors: monthRatio_chart_color,
				title: {
					text: "각 프로세스 별 처리율(월)",
					align: "center",
					margin: 20,
				},
				stacked: true,
				stroke: {
		        	width: monthRatio_chart_border, // 프로세스 수만큼 차트 배경색 배열 세팅
		          	curve: 'straight',
		          	dashArray: monthRatio_chart_border // 프로세스 수만큼 차트 테두리 배열 세팅
				},
				dataLabels:{
					enabled:true,
					// 데이터 레이블 표시
					formatter:function(val, opts){
						return val+"%";
					},
				},
				yaxis: {
					show:true,
					min: 0,
				    max: 100,
				    labels: {
				        formatter: function(val, index) {
				          return val+"%";
				        }
				     }
				},
				zoom: {
		            enabled: false // 프로세스 별 요구사항 수 이므로 zoom fasle
		        },
			}
		});
		// end::차트 2 
		
		// [차트3] 분기별 처리율
		var processQuarterRatioChart = $.osl.chart.setting("apex","processQuarterRatioChart",{
			
			// 차트 데이터 세팅
			data:{
				param:{
					// 세팅 데이터
					dataArr: settingQuarterData,	
					//x축 키값
					xKey:"quarterNm",
					key:{
						 key1: "quarterVal", // 분기별 처리율
					},
					keyNm:{
						keyNm1:"분기별 처리율",
					},
					keyType:{
						 keyType1:"bar",
					},
					dataType: "local",
					//차트 타입
					chartType:"mix"
				}
			},
			chart:{
				//색상
				colors: ["#58c3e5"],
				title: {
					text: "분기별 처리율",
					align: "center",
					margin: 20,
				},
				stroke: {
		        	width: [0],
		          	curve: 'straight',
		          	dashArray: [0]
				},
				dataLabels:{
					enabled:true,
					textAnchor: "middle",
					// 데이터 레이블 표시
					formatter:function(val, opts){
						return Math.round(val)+"%";
					},
					// 레이블 주위 테두리 설정
					background: {
						enabled:false
					},
					// 레이블 폰트 스타일
					style: {
						colors: ["#ffffff"] // 폰트 색상은 배열로 지정
					},
				},
				yaxis: {
					show:true,
					min:0,
					labels: {
						// y축 라벨 정수만 표시하기 위해 formatter 사용
						formatter: function(val, index) {
							return val+"%";
				    	}
					}
				},
				zoom: {
		            enabled: false // 분기별 처리율 이므로 zoom fasle
		        },
			}
		});
		// end::차트 3
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
	
	
	/*
	 * function명 : signDpl
	 * function설명 : 선택한 결재 대기 배포 정보들을 결재한다.
	 * @param rowDatas : 선택한 결재 정보들
	 * @param signRes : 결재 사유
	 * @param type : 결재 타입 (반려 혹은 승인)
	 */
	var signDpl = function(rowDatas, signRes, type){
		
		//AJAX 설정
 		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/cmm/cmm6000/cmm6600/insertCmm6601SignInfoAjax.do'/>"}
				,{rowDatas: JSON.stringify(rowDatas), signRes:signRes, type:type});

 		//AJAX 전송 성공 함수
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert($.lang("cmm6601.sign.fail"),{type: 'error'});
 			}else{
 				//결재 성공
 				$.osl.toastr($.lang("cmm6601.sign.success"));
 			}
 		});
 		
 		//AJAX 전송
 		ajaxObj.send();
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
	
	/*
	 * function명 : fsRefresh
	 * function설명 : 검색바 초기화 및 해당 데이터 테이블 재조회
	 * @param datatableId : 초기화 할 데이터 테이블 아이디
	 */
	var fsRefresh = function(datatableId){
		//검색바 초기화
		searchReset(datatableId);
		//데이터 테이블 재조회
		$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
	 };
	
	/*
	 * function명 : ktScrollInit
	 * function설명 : 스크롤 세팅 및 반응형 될 때 세로크기값을 계산해준다
	 * @param targetName : 스크롤 세팅할 대상 class, id
	 * @param targetHeight : 스크롤의 세로 사이즈
	 */
	var fnKtScrollInit = function(targetName, targetHeight) {
		KTUtil.scrollInit($(targetName)[0], {
	   		//모바일 스크롤 바 마우스 제어 비활성화
	        disableForMobile: true, 
	        //반응형 시 스크롤 유지 여부
	        resetHeightOnDestroy: true, 
	        //브라우저 창의 크기를 조정할 때 크기를 자동으로 조절 여부
	        handleWindowResize: true, 
	        //세로 사이즈
	        height: targetHeight
	    });
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

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />