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
						<i class="fa fa-vote-yea"></i><span data-lang-cd="req4100.button.requestAcceptBtn">접수</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req4100ReqTable" data-datatable-action="detail" title="요구사항 상세" data-title-lang-cd="req4100.actionBtn.requestAcceptTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="detail" tabindex="5">
						<i class="fas fa-external-link-alt"></i><span data-lang-cd="req4100.button.detailBtn">상세</span>
					</button>
				</div>
			</div>
			<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="req4100ReqTable"></div>
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
	
	
	
	var reqDatatableId = "req4100ReqTable";
	
	
	var dplDatatableId = "reqChargeDplTable";
	
	var sprDatatableId = "spr1000Table";
	
	var dshDatatableIdList = ["req4100ReqTable", "reqChargeDplTable","spr1000Table"];
	
	
	var portletAll=[];
	
	var totalSprPoint = 0;
	
	var scrollArray = $('.osl-kaban--card__body.kt-scroll');
	
	
	var timerVarSel;
	var secondTime;
	var timer;
	
	var documentSetting = function(){
		
		
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
		
		$("#dshboardChartReset").click(function(){
			fnChartDataLoad();
		});
		
		
		
		$.each(scrollArray,function(idx,map){
			fnKtScrollInit(map,"500");
		});
		
		
		portletAll.push(new KTPortlet('prjTopInfo', $.osl.lang("portlet")));
		portletAll.push(new KTPortlet('newReq', $.osl.lang("portlet")));
		
		
		$('#allPortletClose').click(function(){
			var parentPortlet = $(this).parents('.kt-portlet');
			
			
			if(parentPortlet.hasClass('kt-portlet--collapse')){
				$.each(portletAll,function(idx,map){
					
					map.expand();
					parentPortlet.removeClass('kt-portlet--collapse');
				});
			}else{
				$.each(portletAll,function(idx,map){
					
					map.collapse();
					parentPortlet.addClass('kt-portlet--collapse');
				});
			}
			
			
			$(".flowchart-operator-outputs--active").removeClass("flowchart-operator-outputs--active");
			
			$(".process-datatable-div").addClass("kt-hide");
			
			
			
		});
		
		fnDashBoardSetting();
		
		
		var prjRequestAcceptCd = $.osl.prjGrpAuthList[$.osl.selPrjGrpId].prjList[$.osl.selPrjId].prjRequestAcceptCd;
		
		
		if(prjRequestAcceptCd == "01"){
			$("button[data-datatable-id="+reqDatatableId+"][data-datatable-action=requestAccept]").removeClass("kt-hide");
		}
		
		
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
							row.reqUsrNm = "-";
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
						if($.osl.isNull(rowData.reqUsrId)){
							$.osl.alert("없는 사용자입니다.");
							return false;
						}else{
							$.osl.user.usrInfoPopup(rowData.reqUsrId);
						}
					}
				},
				{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 120, search: true,
					template: function (row) {
						if($.osl.isNull(row.reqChargerId)){
							return row.reqChargerNm = "-";
						}else{
							var chargerNm = row.reqChargerNm;
							if($.osl.isNull(row.reqChargerNm)){
								chargerNm = '-';
							}
							var usrData = {
								html: chargerNm,
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
							};
							return $.osl.user.usrImgSet(row.reqChargerImgId, usrData);
						}
					},
					onclick: function(rowData){
						if($.osl.isNull(rowData.reqChargerId)){
							return false;
						}else{
							$.osl.user.usrInfoPopup(rowData.reqChargerId);
						}
					}
				},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 340, search: true, autoHide: false,
					
				},
			],
			searchColumns:[
				{field: 'reqDesc', title: $.osl.lang("req4100.field.reqDesc"), searchOrd: 6}
			],
			actionBtn:{
				"title" : "기능 버튼",
				"update" : false,
				"delete" : false,
				"dblClick": true,
				"refresh" : true,
				"detail":true
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("req4100.actionBtn.requestAcceptTooltip"),
				"detail" : $.osl.lang("req4100.actionBtn.detailTooltip")
			},
			actionFn:{
				"refresh": function(rowData, datatableId, type, rowNum){
					
					searchReset(datatableId);
					
					$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
				},
				"dblClick":function(rowData, datatableId, type, rowNum){
					if(prjRequestAcceptCd == "01"){
						
						var rowDatas = [];
						rowDatas.push(rowData);
						
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

							
							if(rowDatas.length == reqProChkCnt){
								$.osl.alert("접수 가능한 요구사항이 선택되지 않았습니다.");
								return false;
							}
							
							$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6200View.do',data,options);
							
							if(reqProChkCnt > 0){
								$.osl.alert(reqProChkCnt+"건의 접수대기가 아닌 요구사항을 제외했습니다.");
							}
						}
					}else{
						
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

						
						if(rowDatas.length == reqProChkCnt){
							$.osl.alert("접수 가능한 요구사항이 선택되지 않았습니다.");
							return false;
						}
						
						$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6200View.do',data,options);
						
						if(reqProChkCnt > 0){
							$.osl.alert(reqProChkCnt+"건의 접수대기가 아닌 요구사항을 제외했습니다.");
						}
					}
				},
				"detail":function(rowDatas, datatableId, type, rowNum){
					var rowData;
					
					if(type == "list"){
						if(rowNum == 0){
							$.osl.alert($.osl.lang("req4100.alert.selectData"));
							return false;
						}else if(rowNum == 1){
							rowData = rowDatas[0];
						}else{
							$.osl.alert($.osl.lang("req4100.alert.selectDatas", rowNum));
							return false;
						}						
					}else{
						rowData = rowDatas;
					}
					
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
				}
			},
			theme:{
				actionBtn:{
					"dblClick" : "",
					"refresh" : " kt-hide",
					"detail" : ""
				},
				actionBtnIcon:{
					"dblClick" : "fa fa-vote-yea",
					"detail" : "fas fa-external-link-alt"
				}
			},
		});
		
		
		$("#"+reqDatatableId).on("kt-datatable--on-layout-updated", function(){
			if(prjRequestAcceptCd == "02"){
				
				$("#"+reqDatatableId).find("a[data-datatable-action=dblClick]").addClass("kt-hide");
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
					
					searchReset(datatableId);
					
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
					
					
					if(type == "list"){
						
						var selRecords = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords();
						
						
						if(selRecords.length == 0){
							$.osl.alert($.osl.lang("dpl2100.action.sign.nonSelect"));
							return true;
						}
						
						rowDatas = rowData;
						
					
					}else{
						rowDatas.push(rowData);
					}
					

					var usrId = $.osl.user.userInfo.usrId;
					
					
					var usrSign = false;
					
					
					$.each(rowDatas,function(idx,map){
						
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
								
								
					        	var signRes = OSLCmm6602Popup.getSignRes();
								
								
								if($.osl.isNull(signRes)){
									$.osl.alert("결재 사유를 입력해주세요.");
									return true;
								}
								
								$.osl.confirm($.osl.lang("dpl2100.message.confirm.signApr"),null,function(result) {
							        if (result.value) {
							        	
							        	var type = OSLCmm6602Popup.getType();
							        	
							        	
										$.osl.layerPopupClose();
							        	
							        	
							        	signDpl(rowDatas,signRes,type);
							        	
							        	
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
					
					
					if(type == "list"){
						
						var selRecords = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords();
						
						
						if(selRecords.length == 0){
							$.osl.alert($.osl.lang("dpl2100.action.sign.nonSelect"));
							return true;
						}
						
						rowDatas = rowData;
						
					
					}else{
						rowDatas.push(rowData);
					}
					
					var usrId = $.osl.user.userInfo.usrId;
					
					
					var usrSign = false;
					
					
					$.each(rowDatas,function(idx,map){
						
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
								
								
								if($.osl.isNull(signRes)){
									$.osl.alert("반려 사유를 입력해주세요.");
									return true;
								}
								
								$.osl.confirm($.osl.lang("dpl2100.message.confirm.signRjt"),null,function(result) {
							        if (result.value) {
							        	
							        	var type = OSLCmm6602Popup.getType();
							        	
										$.osl.layerPopupClose();
							        	
							        	
							        	signDpl(rowDatas,signRes,type);
							        	
							        	
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
		
		
		fnProcessList();
		
		
		
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
					
					searchReset(datatableId);
					
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
				
				"delete":function(rowDatas, datatableId, type, rowNum, elem){
					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/spr/spr1000/spr1000/deleteSpr1000SprList.do'/>"}
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
				
				"sprStart": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("spr1000.nonSelect"));
						return true;
					}
					
					else if(rowDatas.length > 1){
						$.osl.alert($.osl.lang("spr1000.manySelect"));
						return true;
					}
					
					
					var sprInfo = rowData[0];
					
					
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
				
				"sprEnd": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("spr1000.nonSelect"));
						return true;
					}
					
					else if(rowDatas.length > 1){
						$.osl.alert($.osl.lang("spr1000.manySelect"));
						return true;
					}
					
					
					var sprInfo = rowData[0];
					
					
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
						
						var sprTypeClass = "kt-media--primary";
						var sprTypeNm = map.sprTypeNm;
						
						if(map.sprTypeCd == "02"){
							sprTypeClass = "kt-media--danger";
						}else if(map.sprTypeCd == "03"){
							sprTypeClass = "kt-media--warning";
						}
						
						else if(map.useCd == "02"){
							sprTypeClass = "kt-media--dark";
							sprTypeNm = "미 사용";
						}
						
						var restDay = 0;
						
						if(map.sprTypeCd == "03"){
							restDay = 0;
						}else{
							restDay = $.osl.escapeHtml(map.restDay);
						}
						
						
						sprintStr +=
								
								'<div class="kt-portlet kt-portlet--mobile" id="sprPortlet_'+map.sprId+'">'
									
									+'<div class="kt-portlet__head kt-portlet__head--lg">'
										
										+'<div class="kt-portlet__head-label">'
											+'<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid"><input type="checkbox" value="'+idx+'" data-datatable-id="spr1000Table">&nbsp;<span></span></label>'
											+'<h5 class="kt-font-boldest"><span class="osl-badge-brand kt-margin-r-10">D - ' + restDay + '</span></h5>'
											+'<h4 class="kt-font-brand kt-font-boldest" title="'+$.osl.escapeHtml(map.sprNm)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top">'+$.osl.escapeHtml(map.sprNm)+'</h4>'
										+'</div>'
										+ '<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md kt-margin-r-10 invisible" data-datatable-id="sprReqTable_'+map.sprId+'" data-datatable-action="select" title="조회" data-auth-button="select" tabindex="5">'
											+ '<i class="fas fa-redo-alt"></i>'
										+ '</button>'
										
										
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
									
								+'</div>';
								
						rowCnt++;
						if(rowCnt == 2){
							sprintStr += '</div>';
							rowCnt = 0;
						}
					});
					
					
					$("#spr1000CardTable").html(sprintStr);
					
					$.each(list, function(idx, map){
						drawChart(map);
						portletAll.push(new KTPortlet("sprPortlet_"+map.sprId, $.osl.lang("portlet")));

					});
					
					KTApp.initTooltips();
					$('[data-toggle-second="tooltip"]').tooltip({
						template:'<div class="tooltip tooltip-brand" role="tooltip"><div class="tooltip-arrow arrow" style="left: 25px;"></div><div class="tooltip-inner"></div></div>'
					});
					
					$("#spr1000Table .kt-datatable__table").css({visibility: "hidden", height: 0});
					
					
					$('.osl-spr-btn').click(function(){
						
						var sprId = $(this).data("spr-id");
						
						var cate = $(this).data("type");
						
						$("#sprReqTable_"+sprId+"Wrap").removeClass('kt-hide');
						
						if($.osl.isNull($.osl.datatable.list["sprReqTable_"+sprId])){
							sprReqTable(sprId, cate);
							dshDatatableIdList.push("sprReqTable_"+sprId);
						}else{
							
							$.osl.datatable.list["sprReqTable_"+sprId].targetDt.setDataSourceParam("sprId", sprId);
							$.osl.datatable.list["sprReqTable_"+sprId].targetDt.setDataSourceParam("type", 'ass');
							$.osl.datatable.list["sprReqTable_"+sprId].targetDt.setDataSourceParam("cate", cate);
							$("button[data-datatable-id=sprReqTable_"+sprId+"][data-datatable-action=select]").click();
							
						}
					});
				}
			}
		});
	};
	var sprReqTable = function(sprId, cate){
		
		$.osl.datatable.setting("sprReqTable_"+sprId,{
			
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
					
					searchReset(datatableId);
					
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
	
	
	
	var fnProcessList = function(){
		var data = {
				delCd: "02"
		};
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100ProcessListAjax.do'/>", "async": true}
				, data);
		
    	ajaxObj.setFnSuccess(function(datas){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var processes = datas.data;
				$.each(processes, function(idx, value){
					if(dshDatatableIdList.indexOf("processReqTable_"+idx)<0){
						
						dshDatatableIdList.push("processReqTable_"+idx);
					}
					
					var str = '<div class="kt-portlet kt-portlet--mobile process-div" id="processPortlet'+idx+'" data-target-div="process'+idx+'">'
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
												+ '담당<span class="badge osl-badge-brand kt-margin-l-5 kt-margin-r-10 charger-badge">0</span>'
												+ '전체<span class="badge osl-badge-brand kt-margin-l-5 all-badge" >0</span>'
											+ '</span>'
										+ '</h5>'
									+ '</div>'
									+ '<div class="col-lg-5 col-md-12 col-sm-12 col-12 text-right kt-padding-r-0">'
										+ '<div class="kt-portlet__head-group">'
											+ '<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10 invisible" data-datatable-id="processReqTable_'+idx+'" data-datatable-action="select" title="조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">'
												+ '<i class="fas fa-redo-alt"></i>'
											+ '</button>'
											
											
											+ '<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10" data-datatable-id="processReqTable_'+idx+'" data-datatable-action="refresh" title="새로고침" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="refresh" tabindex="5">'
												+ '<i class="fas fa-redo-alt"></i>'
											+ '</button>'
											
											+ '<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air"><i class="fa fa-chevron-down"></i></a>'
										+ '</div>'
									+ '</div>'
								+ '</div>'
								+ '<div class="kt-portlet__body kt-padding-10">'
									+ '<div class="osl-dash-gridkaban-bg osl-overflow--x-auto">'
										
										+ '<div class="osl-dsh-flowchart kt-margin-20 chart-div">'
											
										+ '</div>'
									+ '</div>'
									+ '<div class="process-datatable-div kt-hide" id="processReqTable_'+idx+'">'
										+ '<div class="row">'
											+ '<div class="col-lg-7 col-md-7 col-sm-8 col-8">'
											+ '<div class="osl-datatable-search" data-datatable-id=processReqTable_'+idx+'"></div>'
											+ '</div>'
										+ '</div>'
										+ '<div class="kt_datatable kt-padding-20 osl-datatable-footer__divide process-datatables" id="processReqTable_'+idx+'"></div>';
									+ '</div>'
								+ '</div>'
							+ '</div>'
						+ '</div>'
					$("#processCard").append(str);
				});
				
				fnGetAllProcessFlow();
			}
    	});
		
    	ajaxObj.send();		
	};
	
	
	var fnGetAllProcessFlow = function(){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100FlowListAndChargerCntAjax.do'/>", "async": true}
    			,{"usrId" : $.osl.user.userInfo.usrId});
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
	           
	           var allProcessFlowList = {};
	           var flowList = data.flowList;
	           var flowLinkList = data.flowLinkList;

	           
	           var processFlowList = {};
	           
	           var processFlowLinkList = {};
	            
	           
	           if(!$.osl.isNull(flowList)){
	               
	              
	              $.each(flowList, function(idx, map){
	                  
	                 var processId = map.processId;
	                 
	                 if($.osl.isNull(processFlowList[processId])){
	                    
	                    processFlowList[processId] = [];
	                 }
	                 
	                 processFlowList[processId].push(map); 
	              });
	           }
	            
	           if(!$.osl.isNull(flowLinkList)){
	               
	              $.each(flowLinkList, function(idx, map){
	                  
	                 var processId = map.processId;
	                 
	                 if($.osl.isNull(processFlowLinkList[processId])){
	                    
	                    processFlowLinkList[processId] = [];
	                 }
	                  
	                 
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
	           
	           
	           var index = 0;
	           $.each(allProcessFlowList, function(processId, value){
	        	   fnFlowChart(index, processId, value.flowList, value.flowLinkList);
	        	   
	        	   processTableSetting(index, processId, value.flowList[0].flowId);
	        	   
	        	   portletAll.push(new KTPortlet('processPortlet'+index, $.osl.lang("portlet")));	
	        	   index++;
	           });
	
		   		
		   		fnProcessEvt();
	        }
	     });
	     
	     ajaxObj.send();   
	}
	

	
	var fnGetProcessFlow = function(index, processId){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100FlowListAndChargerCntAjax.do'/>", "async": true}
    			,{"paramProcessId": processId, "usrId" : $.osl.user.userInfo.usrId});
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
	      		var flowList = data.flowList;
	      		var flowLinkList = data.flowLinkList;

	        	
	        	fnFlowChart(index, processId, flowList, flowLinkList);

		   		
		   		fnProcessEvt();
	        }
	     });
	     
	     ajaxObj.send();   
	}
	
	
	var fnFlowChart = function(num, processId, flowList, flowLinkList){

		if($.osl.isNull(flowList) || flowList.length == 0){
			return true;
		}
		var list = [];
		
		
	    
	    var flowNextIdList = {};
	    
	    
	    if(!$.osl.isNull(flowLinkList) && flowLinkList.length > 0){
	       $.each(flowLinkList, function(idx, map){
	          
	          if(!flowNextIdList.hasOwnProperty(map.flowId)){
	             flowNextIdList[map.flowId] = [];
	          }
	          flowNextIdList[map.flowId].push(map.flowNextId);
	       });
	    }
	     
	    
	    var flowInfoList = {};
	      
	    
	    var startFlowId;
	    
	    var doneFlowId;
	    var doneFlow;
	      
	    
	    var addFlowCheck = [];
	     
	    
	    $.each(flowList, function(idx, map){
	       
	       if(map.flowStartCd == "01"){
	          
	          
	          
	          startFlowId = map.flowId;
	          list.push(map);
	       }
	        
	       
	       if(map.flowDoneCd == "01"){
	          doneFlowId = map.flowId;
	          doneFlow = map;
	       }
	       map["flowNextId"] = flowNextIdList[map.flowId];
	       flowInfoList[map.flowId] = map;
	    });
	
	    
	    var innerFlowAppend = function(currentFlowId) {
	    	  
	       
	       var flowInfo = flowInfoList[currentFlowId];
	      
	       
	       var nextFlowIds = null;
	       
	       if(!$.osl.isNull(flowInfoList[currentFlowId]) && flowInfoList[currentFlowId].hasOwnProperty("flowNextId")){
	    	   nextFlowIds = flowInfoList[currentFlowId]["flowNextId"];
	       }
	       
	       if($.osl.isNull(nextFlowIds)){
	    	   return true;
	       }
	       else if(!$.osl.isNull(nextFlowIds) && nextFlowIds.length == 0){
	    	   return true;
	       }
	       
	       else if(addFlowCheck.indexOf(currentFlowId) != -1){
	          return true;
	       }
	       
	       if(flowInfo.flowStartCd == "02" && flowInfo.flowDoneCd == "02"){
	          
	          
	          addFlowCheck.push(currentFlowId);
	          list.push(flowInfo);
	       }
	       
	       
	       if(!$.osl.isNull(nextFlowIds)){
	          
	          $.each(nextFlowIds, function(idx, map){
	             innerFlowAppend(map);
	          });
	       };
	       return true;
	    };
	      
	    
	    innerFlowAppend(startFlowId);
	      
	    
	    list.push(doneFlow);
	    
		
		fnFlowChartDraw(num, list, processId);
	};
	
	
	var fnFlowChartDraw = function(num, list, processId){
		
		var str = '';
		$.each(list, function(idx, value){
			if($.osl.isNull(value)){
				return true;
			}
			str += '<div class="flowchart-operator osl-flowchart__operator border" data-operator-id="previewOperator">'
					+ '<div class="flowchart-operator-function osl-min-h-px--24">';
				if(value.flowSignCd == "01"){
					str += '<li class="fa fa-file-signature" title="결재"></li>';	
				}
				if(value.flowSignStopCd == "01"){
					str += '<li class="far fa-stop-circle" title="결재 반려시 종료 유무"></li>';	
				}
				if(value.flowMiddleEndCd == "01"){
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
						+ '<div class="flowchart-operator-inputs text-center kt-padding-10 osl-cursor-pointer flow-charger" data-process-id="'+value.processId+'" data-flow-id="'+value.flowId+'"> 담당 <span>'+value.reqChargerCnt+'</span></div>'
						+ '<div class="flowchart-operator-outputs text-center kt-padding-10 border-left osl-cursor-pointer flow-all-charger" data-process-id="'+value.processId+'" data-flow-id="'+value.flowId+'"> 전체 <span>'+value.reqFlowCnt+'</span></div>'
					+ '</div>'
				+ '</div>';
				
			if(idx < list.length-1 ){
				
				str += '<i class="fa fa-arrow-right"></i>';
			}
		});
		
		
		var processRow = $("#processCard").children("div[data-target-div=process"+num+"]").find(".chart-div");
		$(processRow).empty();
		$(processRow).append(str);
	}
	
	
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
				{field: 'reqOrd', title: '요구사항 순번', textAlign: 'left', width: 120, autoHide: false},
				{field: 'reqProTypeNm', title: '결재 상태', textAlign: 'left', width: 110, autoHide: false},
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
			actionBtn:{
				"title" : "기능 버튼",
				"width" : "120",
				"dblClick": true,
				"update": false,
				"delete" : false,
				"refresh": true,
				"detail":true
			},
			actionTooltip:{
				"dblClick": "업무 처리",
				"detail" : "상세 보기"
			},
			actionFn:{
				"refresh": function(rowData, datatableId, type, rowNum){
					
					$("#processPortlet"+tablenum).find(".chart-div").empty();
					fnGetProcessFlow(tablenum, paramProcessId);
				},
				"dblClick":function(rowData, datatableId, type, rowNum){
					var reqProType = rowData.reqProType;
                    var reqId = rowData.reqId;
                    var prjId = rowData.prjId;
                    var reqNm = rowData.reqNm;
                    
                    if(reqProType != "02"){
                       $.osl.alert("처리중인 요구사항만 업무 처리가 가능합니다.");
                       return false;
                    }

                    var data = {
                          paramPrjId: prjId,
                          paramReqId: reqId
                    };
                    var options = {
                       modalSize: "fs",
                       idKey: "reqProcess"+reqId,
                       modalTitle: "["+reqNm+"] 요구사항 업무 처리",
                       closeConfirm: false,
                       callback:[{
	   						targetId: "cmm6201SaveSubmit",
	   						actionFn: function(thisObj){
	   							console.log("callback");
	   							
	   							
								$("#processPortlet"+tablenum).find(".chart-div").empty();
								fnGetProcessFlow(tablenum, paramProcessId);
								
	   							
	   							$("#"+datatableId).addClass("kt-hide");
	   							$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
	   						} 
	   					}]
                    };
                    $.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6201View.do',data,options);
				},
				"detail": function(rowData, datatableId, type, rowNum){
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
				}
			},
			theme : {
				actionBtn: {
					"dblClick" :  "",
					"refresh" : " kt-hide"
				},
				actionBtnIcon:{
					"dblClick" : "fa fa-chalkboard-teacher",
					"detail" : "fas fa-external-link-alt"
				}
			},
			callback:{
				ajaxDone: function(evt, list, datatableInfo){
					
					var datatableId = "processReqTable_"+tablenum;
					var datatable = $.osl.datatable.list[datatableId].targetDt;
					
					var totalCharger = 0;
					var totalAll = 0;
					
					
					var chargerSpans = $("#processPortlet"+tablenum).find(".flow-charger");
					$.each(chargerSpans, function(index, value){
						totalCharger += Number($(value).children().text());
						totalAll +=  Number($(value).siblings(".flow-all-charger").children().text());
					});
					
					
					$("#processPortlet"+tablenum).find(".charger-badge").text(totalCharger);
					$("#processPortlet"+tablenum).find(".all-badge").text(totalAll);

				}
			}
		});
	}
	
	
	var fnProcessEvt = function(){
		
		
		$(".flow-charger").click(function(){
			
			var item = $(this).parents(".kt-portlet__body");
			var datatableId = $(item).find(".process-datatable-div").attr("id");
			var datatable = $.osl.datatable.list[datatableId].targetDt;
			
			datatable.setDataSourceParam("dshProcess", "Y");
			datatable.setDataSourceParam("processId", $(this).data("processId"));
			datatable.setDataSourceParam("flowId", $(this).data("flowId"));
			datatable.setDataSourceParam("usrId", $.osl.user.userInfo.usrId);
			
			
			
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();			
			
			if($(item).find(".process-datatable-div").removeClass("kt-hide"));

			
			$(this).parents(".chart-div").find(".flowchart-operator-outputs--active").removeClass("flowchart-operator-outputs--active");
			
			$(this).addClass("flowchart-operator-outputs--active");
		});
		
		
		$(".flow-all-charger").click(function(){
			
			var item = $(this).parents(".kt-portlet__body");
			var datatableId = $(item).find(".process-datatable-div").attr("id");
			var datatable = $.osl.datatable.list[datatableId].targetDt;
			
			datatable.setDataSourceParam("dshProcess", "Y");
			datatable.setDataSourceParam("processId", $(this).data("processId"));
			datatable.setDataSourceParam("flowId", $(this).data("flowId"));
			datatable.setDataSourceParam("usrId", "");
			
			
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
			
			
			if($(item).find(".process-datatable-div").removeClass("kt-hide"));
			
			
			$(this).parents(".chart-div").find(".flowchart-operator-outputs--active").removeClass("flowchart-operator-outputs--active");
			
			$(this).addClass("flowchart-operator-outputs--active");
		});
				
		
		
	};
	
	
	
 	var drawChart = function(rowdata){
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"/spr/spr1000/spr1000/selectSpr1000ChartInfoAjax.do"},{sprId: rowdata.sprId});
 		
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				
 				var chartData = data.chartData;
 				var today = new Date();
 				var endDt  = today.getFullYear() + "-" + (today.getMonth()+1) + "-" + today.getDate();
 				
 				totalSprPoint = rowdata.sprPoint;
 				
 				var seriesData = getDataRangeData(rowdata.sprStDt, rowdata.sprEdDt, "1", chartData);
 				
 				
 				if(rowdata.sprTypeCd == '01'){
	 				$("#burnDownChart"+rowdata.sprId).text("데이터 없음")
 				}else{
	 				drawBurnDownChart(seriesData, rowdata.sprId);
 				}
 			}	
 		});
 		
 		ajaxObj.send();
 	}
 	
 	var drawBurnDownChart = function(dateRange, sprId){
 		 var chart = $.osl.chart.setting("apex","burnDownChart"+sprId,{
 			
				data:{										
					param:{
						dataArr: dateRange,	
						 
						 xKey:"time",
						 key:{
							 key1:"idealBurnDownLine",
							 key2:"burnDownSprPoint"
						 },
						 keyNm:{
							 keyNm1:"이상적인 번다운라인",
							 keyNm2:"실제 번다운라인"
						 },
						 
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
				        
				        labels: {
				        	hideOverlappingLabels :true,
				            formatter: function(value){
				            	return new Date(value).format("MM-dd");
				            }
				        },
				        
				        tickAmount: '5',
				        
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
 	
 	var getDataRangeData = function(sttDt, endDT, type, data){
 		

 		if(data.length!=0){
	 		
	 		var sprPoint = [];
	 		$.each(data, function(index, value){
	 			var _series = {};
	 			_series[value.reqEdDtm] = value.cumSprPoint;
	 			sprPoint.push(_series);
	 		});
 		}
 		
 		
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
	 	
 		}else if(type=='2'){
 			
 		}
 		var length = resDay.length
 		
 		var step = totalSprPoint / (length-1)
 		
 		
 		var end = totalSprPoint;
 		$.each(resDay, function(index, value){
 			
	 		if(length == 1){
	 			value['idealBurnDownLine'] = totalSprPoint;
	 		
	 		}else if(length == 2){
	 			value['idealBurnDownLine'] = end;
	 			end -= totalSprPoint;
	 		
	 		}else{
	 			value['idealBurnDownLine'] = end.toFixed(1);
	 			end -= step	
	 		}
 		})
 		if(data.length!=0){
	 		
	 		var today = new Date();
	 		
	 		for(var dayIndex = 0; dayIndex < resDay.length; dayIndex++){
	 			var match = false;
	 			
	 			var gap = new Date(resDay[dayIndex].time).getTime() - today.getTime()
	 			if(gap < 0){
		 			for(var dataIndex = 0 ; dataIndex < data.length ; dataIndex ++){
		 				if(resDay[dayIndex].time == data[dataIndex].reqEdDtm){
		 					match = true;
		 					
		 					resDay[dayIndex]['burnDownSprPoint'] = totalSprPoint - data[dataIndex].cumSprPoint
		 					break;
		 				}
		 			}
		 			
		 			if(!match){
		 				
		 				if(dayIndex == 0){
		 					resDay[dayIndex]['burnDownSprPoint'] = totalSprPoint;
		 				
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
 	
 	
	var fnDashBoardSetting = function(){
		
		timerVarSel = $('#timerVarSel').val();
		secondTime = (timerVarSel*60);
		clearInterval(timer);
		timer = setInterval(printTime,1000);
		
		
		fnGetAllProcessFlow();
		
		
		$.each(dshDatatableIdList, function(idx, value){
			fsRefresh(value);
		});
		
		
		fnChartDataLoad();
		
	};

	
	
	var fnChartDataLoad = function(){
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dsh/dsh2000/dsh2000/selectDsh2000DashBoardDataAjax.do'/>"});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				fnChartSetting(data);
			}	
		});
		
		
		ajaxObj.send();
		
	};
	
	
	
	var fnChartSetting = function(dshData){
		 
		
		var chartIdArr = []; 
		$.each($("div[data-dshboard-chart=prjChart]"), function(idx, map){
			
			chartIdArr.push($(map).attr("id"));
		});
		
		
		$.each(chartIdArr, function(idx, map){
			var dshChartObj = $.osl.chart.list[map];
			
			if(!$.osl.isNull(dshChartObj)){
				dshChartObj.targetCt.destroy();
			}
		});
		
		
		var processReqCnt = dshData.processReqCnt;
			
		
		var monthProcessReqCnt = dshData.monthProcessReqCnt;
		
		
		var reqCntChartData = [];
		
		var monthRatioChart = [];
		
		var quarterRatioChart = [];
		
		
		if(!$.osl.isNull(processReqCnt)){
			
			
			$.each(processReqCnt,function(idx, map){
		
				
				var tmpChartData = {
						"processId":map.processId, 
						"processNm":map.processNm,
						"reqAllcnt":map.allCnt,
						"reqChargerCnt":map.chargerCnt,
						"reqEndCnt":map.endCnt
					};
				
				
				reqCntChartData.push(tmpChartData); 
			});
		}
		
		
		var monthRatio_X_Label = ["01월","02월","03월","04월","05월","06월","07월","08월","09월","10월","11월","12월"];	
		var monthRatio_Y_Label = [];	
		var monthRatio_processNm = {};	
		var monthRatio_monthCnt = {};	
		var monthRatio_cahrt_data = [];	
		var monthRatio_bgColor_list = ["#4b73eb","#936de9","#ff5643","#58c3e5","#fba450","#eb4ba4","#89eb4b","#c4eb4b","#9f4beb","#fba450","#ff5643","#58c3e5","#fba450"];	
		var monthRatio_chart_color = []; 
		var monthRatio_chart_border = []; 
		
		
		var quarterRatio_X_Label = ["1분기", "2분기", "3분기", "4분기"];
		var quarterRatio_label_val = {"1분기":0, "2분기":1, "3분기":3, "4분기":4};
		var quarterRatio_month_idx = {"01월":0,"02월":0,"03월":0,"04월":1,"05월":1,"06월":1,"07월":2,"08월":2,"09월":2,"10월":3,"11월":3,"12월":3};
		var quarterRatio_chart_data = [0,0,0,0]; 
		
		var quarterCahrtData = []; 
		
		
		var defaultQuarterCahrt = [
			{"quarterNm":"1분기", "quarterVal":0},
			{"quarterNm":"2분기", "quarterVal":0},
			{"quarterNm":"3분기", "quarterVal":0},
			{"quarterNm":"4분기", "quarterVal":0},
		];
		
		
		
		if(!$.osl.isNull(monthProcessReqCnt)){
			
			$.each(monthProcessReqCnt, function(idx, map){
				
				var reqEdDtmMm = map.reqEdDuMm;
				
				reqEdDtmMm += "월";
				
				if(monthRatio_Y_Label.indexOf(map.processId) == -1){
					
					monthRatio_Y_Label.push(map.processId);
					
					
					var tempJson = {};
					tempJson[map.processId] = map.processNm;
					$.extend(monthRatio_processNm,tempJson);
				}
				
				
				if(Object.keys(monthRatio_monthCnt).indexOf(reqEdDtmMm) == -1){
					monthRatio_monthCnt[reqEdDtmMm] = {};
				}
				
				
				if(Object.keys(monthRatio_monthCnt[reqEdDtmMm]).indexOf(map.processId) == -1){
					
					
					var reqTotalCnt = map.reqTotalCnt;
					
					var reqEdMmCnt = map.reqEdMmCnt;
					
					var reqEdMmRatio = 0;
					
					
					if(reqEdMmCnt > 0 && reqTotalCnt > 0){
						reqEdMmRatio = ((reqEdMmCnt/reqTotalCnt)*100);
						reqEdMmRatio = reqEdMmRatio.toFixed(0);
					}
					
					monthRatio_monthCnt[reqEdDtmMm][map.processId] = reqEdMmRatio;
				}
			});
			
			
			$.each(monthRatio_Y_Label,function(idx, map){
				
				var mmCntDataArr = [];
				
				
				$.each(monthRatio_X_Label,function(inIdx, inMap){
					
					if($.osl.isNull(monthRatio_monthCnt[inMap])){
						mmCntDataArr.push(0);
					}else{
						
						if($.osl.isNull(monthRatio_monthCnt[inMap][map])){	
							mmCntDataArr.push(0);
						}else{	
							
							mmCntDataArr.push(monthRatio_monthCnt[inMap][map]);
						
							
							var mmCntVal = monthRatio_monthCnt[inMap][map];
							if(mmCntVal > 0){
								mmCntVal = (mmCntVal/3);
							}
							
							
							var quarterVal = quarterRatio_month_idx[inMap]; 
							
							
							if( $.osl.isNull(quarterCahrtData[quarterRatio_label_val[quarterVal]]) ){
								
								quarterCahrtData[quarterVal] = {};
								
								quarterCahrtData[quarterVal]["quarterNm"] = (quarterVal+1)+"분기";
								quarterCahrtData[quarterVal]["quarterVal"] = 0;
							}

							
							quarterRatio_chart_data[quarterVal] += mmCntVal;
						 	quarterCahrtData[quarterVal]["quarterVal"] = quarterRatio_chart_data[quarterVal]; 
						}
					}
				});
				
				
				var bgIdx = idx;
				
				
				if(idx > monthRatio_bgColor_list.length-1){
					bgIdx = idx%monthRatio_bgColor_list.length;
				}
				
				monthRatio_chart_color.push(monthRatio_bgColor_list[bgIdx]);
				monthRatio_chart_border.push(0);
				
				
				monthRatio_cahrt_data.push({
					processId:map,
		            processNm: monthRatio_processNm[map],
		            monthRatio: mmCntDataArr,
				});
			});
		}
	
		
		var settingQuarterData = [];
		
		$.each(quarterCahrtData, function(idx, map){
			
			if($.osl.isNull(map)){
				
				settingQuarterData.push(defaultQuarterCahrt[idx]);
			}else{
				map["quarterVal"] = Math.round(map["quarterVal"]);
				
				settingQuarterData.push(map);
			}
		});
		
		
		
		var reqCntChart = $.osl.chart.setting("apex","processReqCntChart",{
			
			
			data:{
				param:{
					
					dataArr: reqCntChartData,	
					
					xKey:"processNm",
					key:{
						 key1: "reqAllcnt", 
						 key2: "reqChargerCnt", 
						 key3: "reqEndCnt", 
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
					
					chartType:"mix"
				}
			},
			chart:{
				
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
				
				markers: {
				    size: 4, 
				    strokeWidth: 0, 
				},
				dataLabels:{
					enabled:true,
				 	enabledOnSeries: [0], 
					
					formatter:function(val, opts){
						return val;
					},
					
					background: {
						enabled:false
					},
					
					style: {
						colors: ["#ffffff"] 
					},
				},
				yaxis: {
					show:true,
					min:0,
				},
				zoom: {
		            enabled: false 
		        },
			}
		});
		
		
    	
		var processMonthRatioChart = $.osl.chart.setting("apex","processMonthRatioChart",{
			
			data:{
				param:{
					
					dataArr: monthRatio_cahrt_data,	
					
					xKeyArr: monthRatio_X_Label, 
					key:{
						 key1: "processNm", 
						 key2: "monthRatio", 
					},
					keyType:{
						 keyType1:"bar",
					},
					dataType: "local",
					
					chartType:"colum"
				}
			},
			chart:{
				
				colors: monthRatio_chart_color,
				title: {
					text: "각 프로세스 별 처리율(월)",
					align: "center",
					margin: 20,
				},
				stacked: true,
				stroke: {
		        	width: monthRatio_chart_border, 
		          	curve: 'straight',
		          	dashArray: monthRatio_chart_border 
				},
				dataLabels:{
					enabled:true,
					
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
		            enabled: false 
		        },
			}
		});
		
		
		
		var processQuarterRatioChart = $.osl.chart.setting("apex","processQuarterRatioChart",{
			
			
			data:{
				param:{
					
					dataArr: settingQuarterData,	
					
					xKey:"quarterNm",
					key:{
						 key1: "quarterVal", 
					},
					keyNm:{
						keyNm1:"분기별 처리율",
					},
					keyType:{
						 keyType1:"bar",
					},
					dataType: "local",
					
					chartType:"mix"
				}
			},
			chart:{
				
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
					
					formatter:function(val, opts){
						return Math.round(val)+"%";
					},
					
					background: {
						enabled:false
					},
					
					style: {
						colors: ["#ffffff"] 
					},
				},
				yaxis: {
					show:true,
					min:0,
					labels: {
						
						formatter: function(val, index) {
							return val+"%";
				    	}
					}
				},
				zoom: {
		            enabled: false 
		        },
			}
		});
		
	};
	
	
	
	var printTime = function() {
		var timerStr = Math.floor(secondTime/60) + "분 " + (secondTime%60) + "초";
		$('#autoRefreshSpan').html(timerStr);
		secondTime--;
		
		if (secondTime < 0) {
			clearInterval(timer);
			fnDashBoardSetting();
		}
	};

	
	var fnAutoRefreshEnd = function(){
		clearInterval(timer);
		$('#autoRefreshSpan').html("<i class='fa fa-infinity'></i>");
		timer = null;
	};
	
	
	var fnDshWidgetSort = function(thisObj){
		
		function innerFnCommonSortEnd(){
			
			$(".dshSortArrowAlt").removeClass("dshSortArrowAlt");
			
			
			timer = setInterval('printTime()',1000);
			
			
			$(thisObj).attr("data-flag","false");
			
			
			$(".dshWidgetSortCancelBtn").addClass("widgetCancelDisabled");
		}
		
		var flag = $(thisObj).attr("data-flag");
		
		
		if(flag == "false"){
			
			$(".dshSortableItem, .dshSortableItem > .dsh_title_box").addClass("dshSortArrowAlt");
			
			
			fnAutoRefreshEnd();
			
			
			$(thisObj).attr("data-flag","true");
			
			
			$(".widgetCancelDisabled").removeClass("widgetCancelDisabled");
			
			
			sortable.option("disabled",false);
			
			
			sortBeforeData = sortable.toArray();
		}else{ 
			if(!gfnIsNull(sortable)){
				sortable.option("disabled",true);

				
				var currentSortDataList = sortable.toArray();
				
				
				if(JSON.stringify(sortBeforeData) != JSON.stringify(currentSortDataList)){
					jConfirm("변경된 항목 정보를 저장하시겠습니까?", "알림창", function( result ) {
						if( result ){
							
							var sortDataArr = [];
							
							$.each(currentSortDataList, function(idx, map){
								
								sortDataArr.push({sortId: map, ord: (idx+1)});
							});

							
							
							
							
							var ajaxObj = new gfnAjaxRequestAction(
								{"url":"<c:url value='/dsh/dsh1000/dsh1000/insertDsh1000SortDataList.do'/>","loadingShow":true}
								,{sortDataArr: JSON.stringify(sortDataArr)});
							
							
							ajaxObj.setFnSuccess(function(data){
								toast.push("항목 정렬 정보를 저장했습니다.");
							});
							
							
							ajaxObj.send();
							
							
							innerFnCommonSortEnd();
						}
					});
				}else{
					
					innerFnCommonSortEnd();
				}
			}
		}
	};
	
	
	var fnDshWidgetSortCancel = function(){
		
		var currentSortDataList = sortable.toArray();
		
		
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
	
	
	
	var signDpl = function(rowDatas, signRes, type){
		
		
 		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/cmm/cmm6000/cmm6600/insertCmm6601SignInfoAjax.do'/>"}
				,{rowDatas: JSON.stringify(rowDatas), signRes:signRes, type:type});

 		
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert($.lang("cmm6601.sign.fail"),{type: 'error'});
 			}else{
 				
 				$.osl.toastr($.lang("cmm6601.sign.success"));
 			}
 		});
 		
 		
 		ajaxObj.send();
	};
	
	
	var searchReset = function(datatableId){
		
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item.active").attr("class", "dropdown-item");
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=-1]").attr("class", "dropdown-item active");
		
		
		var searchBarMenuStr = $(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=-1]").text();
		
		
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").parent().children(".btn.btn-secondary.dropdown-toggle").text(searchBarMenuStr);
		
		
		$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("style", "display:none;");
		$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("aria-hidden", "true");
		
		
		$("#searchData_"+datatableId).removeAttr("readonly");
		
		$("#searchData_"+datatableId).parent().children("span").children().children().removeClass("la-calendar");
		
		
		$("#searchData_"+datatableId).val("");

		
		
		$("#searchData_"+datatableId).attr("disabled","disabled");
	};
	
	
	var fsRefresh = function(datatableId){
		
		searchReset(datatableId);
		
		$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
	 };
	
	
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
	OSLDsh2000Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />