<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block">
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
		<div class="col-lg-9 col-md-12 col-sm-12 text-right kt-margin-t-15-tablet kt-margin-t-15-mobile">
			<div class="kt-portlet__head-group osl-float-left-tablet">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl4000DplTable" data-datatable-action="select" title="배포 계획 조회" data-title-lang-cd="dpl4000.dpl.button.tooltip.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl4000DplTable" data-datatable-action="detail" title="배포 계획 상세" data-title-lang-cd="dpl4000.dpl.button.tooltip.detailTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="detail" tabindex="2">
					<i class="fas fa-external-link-alt"></i><span data-lang-cd="dpl4000.dpl.button.detailBtn">상세</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-5 col-md-6 col-sm-12">
				<div class="osl-datatable-search" data-datatable-id="dpl4000DplTable"></div>
			</div>
		</div>
		<div class="kt_datatable osl-datatable-footer__divide" id="dpl4000DplTable"></div>
	</div>
</div>
<div class="row">
	<div class="col-lg-6 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block">
				<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
					<h4 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>
						<span data-lang-cd="dpl4000.req.title">요구사항 배정 목록</span>
					</h4>
				</div>
				<div class="col-lg-9 col-md-12 col-sm-12 text-right kt-margin-t-15-tablet kt-margin-t-15-mobile">
					<div class="kt-portlet__head-group osl-float-left-tablet">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl4000AssReqTable" data-datatable-action="select" title="배정 요구사항 조회" data-title-lang-cd="dpl4000.req.button.tooltip.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl4000AssReqTable" data-datatable-action="detail" title="요구사항 상세" data-title-lang-cd="dpl4000.req.button.tooltip.detailTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="detail" tabindex="2">
							<i class="fas fa-external-link-alt"></i><span data-lang-cd="dpl4000.req.button.detailBtn">상세</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-5 col-md-6 col-sm-12">
						<div class="osl-datatable-search" data-datatable-id="dpl4000AssReqTable"></div>
					</div>
				</div>
				<div class="kt_datatable osl-datatable-footer__divide" id="dpl4000AssReqTable"></div>
			</div>
		</div>
	</div>
	<div class="col-lg-6 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block">
				<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
					<h4 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>
						<span data-lang-cd="dpl4000.job.title">JOB 배정 목록</span>
					</h4>
				</div>
				<div class="col-lg-9 col-md-12 col-sm-12 text-right kt-margin-t-15-tablet kt-margin-t-15-mobile">
					<div class="kt-portlet__head-group osl-float-left-tablet">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl4000AssJobTable" data-datatable-action="select" title="배정 JOB 조회" data-title-lang-cd="dpl4000.job.button.tooltip.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl4000AssJobTable" data-datatable-action="detail" title="JOB 상세" data-title-lang-cd="dpl4000.job.button.tooltip.detailTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="detail" tabindex="2">
							<i class="fas fa-external-link-alt"></i><span data-lang-cd="dpl4000.job.button.detailBtn">상세</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-5 col-md-6 col-sm-12">
						<div class="osl-datatable-search" data-datatable-id="dpl4000AssJobTable"></div>
					</div>
				</div>
				<div class="kt_datatable osl-datatable-footer__divide" id="dpl4000AssJobTable"></div>
			</div>
		</div>
	</div>
</div>
<!-- begin page script -->
<script>
 "use strict";

 var OSLStm8000Popup = function() {
	 
	 var datatableId = "dpl4000DplTable";
	 var reqDatatableId = "dpl4000AssReqTable";
	 var jobDatatableId = "dpl4000AssJobTable";
	 
	 //배포 계획 정보
	 var dplId;
	 var prjGrpId;
	 var prjId;
	 
	 var documentSetting = function() {
		 
		 //배포 계획 목록 가져오기
		 $.osl.datatable.setting(datatableId,{
			 data: {
				source: {
					read: {
						url: "/dpl/dpl1000/dpl1000/selectDpl1000DplListAjax.do"
					}
				},
				pageSize: 5
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [5, 10, 20, 30, 50, 100],
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'dplSignUseNm', title: '결재 사용 유무', textAlign: 'center', width: 120, search: true, searchType:"select", searchCd: "CMM00001", searchField:"dplSignUseCd", sortField: "dplSignUseCd"},
				{field: 'nowSignTypeNm', title: '결재 상태', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "REQ00004", searchField:"signStsCd", sortField: "signStsCd"
					,template: function(row){
						if($.osl.isNull(row.nowSignTypeNm)){
							return row.nowSignTypeNm = "-";
						}else{
							return row.nowSignTypeNm;
						}
					},
				},
				{field: 'lastSignUsrNm', title: '결재자', textAlign: 'left', width: 100
					,template: function(row){
						if($.osl.isNull(row.lastSignUsrNm)){
							return row.lastSignUsrNm = "-";
						}
						var usrData = {
							html: row.lastSignUsrNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
						};
						return $.osl.user.usrImgSet(row.lastSignUsrImgId, usrData);
					},
					onclick: function(rowData){
						if(row.lastSignUsrNm != "-"){
							$.osl.user.usrInfoPopup(rowData.lastSignUsrId);
						}
					}
				},
				{field: 'dplStsNm', title: '배포 상태', textAlign: 'center', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "DPL00001", searchField:"dplStsCd", sortField: "dplStsCd"},
				{field: 'dplVer', title: '배포 버전', textAlign: 'center', width: 100, search: true},
				{field: 'dplNm', title: '배포 명', textAlign: 'left', width: 300, autoHide: false, search: true},
				{field: 'dplTypeNm', title: '배포 방법', textAlign: 'center', width: 70, autoHide: false, search: true, searchType:"select", searchCd: "DPL00003", searchField:"dplTypeCd", sortField: "dplTypeCd"},
				{field: 'dplRevisionNum', title: '배포 리비전 번호', textAlign: 'center', width: 100
					,template: function(row){
						var dplRevisionNum = row.dplRevisionNum;
						// 배포 리비전 없을 경우 문구 변경
						if($.osl.isNull(dplRevisionNum)){
							dplRevisionNum = "Last Revision";
						}
						return dplRevisionNum;
					}
				},
				{field: 'dplDt', title: '배포 일자', textAlign: 'center', width: 100, search: true, searchType:"daterange"},
				{field: 'dplUsrNm', title: '배포자', textAlign: 'left', width: 100, search: true
					,template: function(row){
						if($.osl.isNull(row.dplUsrNm)){
							return row.dplUsrNm = "-";
						}
						var usrData = {
							html: row.dplUsrNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
						};
						return $.osl.user.usrImgSet(row.dplUsrImgId, usrData);
					},
					onclick: function(rowData){
						if(rowData.dplUsrNm != "-"){
							$.osl.user.usrInfoPopup(rowData.dplUsrId);
						}
					}	
				},
			],
			rows:{
				clickCheckbox: true
			},
			searchColumns:[
				{field: 'dplDesc', title:$.osl.lang("dpl4000.dpl.addSearch.deplDesc"), searchOrd: 8}
			],
			actionBtn:{
				"title": $.osl.lang("dpl4000.dpl.actionBtn.title"),
				"width" : 50,
				"update": false,
				"delete": false,
				"click" : true,
				"detail" : true,
				"dblClick": true,
			},
			actionTooltip:{
				"detail": $.osl.lang("dpl4000.dpl.actionBtn.tooltip.detailTooltip"),
				"dblClick": $.osl.lang("dpl4000.dpl.actionBtn.tooltip.detailTooltip"),
			},
			actionFn:{
				"click":function(rowData, datatableId, type, rowNum, elem){
					var datatable = $.osl.datatable.list[datatableId].targetDt;
					
					//현재 선택한 elem의 체크박스만 선택
					var targetCheckRow = datatable.row("[data-row="+rowNum+"]").nodes();
					var target = targetCheckRow.find("label.kt-checkbox").children("input[type=checkbox]");
					if(target.length > 0){
						
						if(target.is(":checked") == true){
							//checkBox 선택은 현재 클릭한 것만 적용하기 위해 전부 해제
							datatable.setActiveAll(false);
							
							target.prop("checked", true);
							datatable.setActive(target);
							dplId = rowData.dplId;
							prjGrpId = rowData.prjGrpId;
							prjId = rowData.prjId;
						}else{
							//선택된것처럼 row 컬러가 그대로 남아있으므로
							targetCheckRow.removeClass("osl-datatable__row--selected");
							targetCheckRow.addClass("kt-datatable__row--even");
							dplId="";
							prjGrpId="";
							prjId="";
						}
					}
					//요구사항 및 JOB 배정목록 재조회
					reloadList();		
				},
				"dblClick":function(rowData){
					var data = {
							paramPrjId : rowData.prjId,
							paramDplId : rowData.dplId
						};
					var options = {
							idKey: datatableId +"_"+ rowData.dplId,
							modalTitle: $.osl.lang("dpl4000.dpl.actionBtn.modalTitle", $.osl.escapeHtml(rowData.dplNm)),
							autoHeight: false,
							modalSize: 'xl'
						};
					
					$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1002View.do',data,options);
				},
				"detail":function(rowDatas, datatableId, type, rowNum, elem){
					var rowData;
					if(type == "list"){
						if(rowNum != 1){
							$.osl.alert($.osl.lang("dpl4000.message.selectOneDpl", rowNum));
							return false;
						}else{
							rowData = rowDatas[0];
						}
					}else{
						rowData = rowDatas;
					}
					
					var data = {
							paramPrjId : rowData.prjId,
							paramDplId : rowData.dplId
						};
					var options = {
							idKey: datatableId +"_"+ rowData.dplId,
							modalTitle: $.osl.lang("dpl4000.dpl.actionBtn.modalTitle", $.osl.escapeHtml(rowData.dplNm)),
							autoHeight: false,
							modalSize: "xl"
						};
					
					$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1002View.do',data,options);
				},
			},
			theme: {
				actionBtn:{
					"click": " kt-hide",
					"dblClick": "",
					"detail" : " kt-hide",
				 },
				 actionBtnIcon:{
					 "dblClick": " fas fa-external-link-alt",
					 "detail": " fas fa-external-link-alt"
				 }
			 }
		});
		 
		//요구사항 배정 테이블 셋팅
		$.osl.datatable.setting(reqDatatableId,{
			data:{
				source:{
					read:{
						url: "/dpl/dpl1000/dpl1100/selectDpl1100AssReqListAjax.do"
					}
				},
				pageSize: 4
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100]
					}
				}
			},
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 60, sortField: "rn"},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 240, autoHide: false, sortField: "reqNm", search:true,
					template: function(row){
						var resultStr = $.osl.escapeHtml(row.reqNm);
						//비밀번호가 있는 경우
						if(row.reqPw == "Y"){
							resultStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
						}
						return resultStr;
					}	
				},
				{field: 'reqOrd', title: '순번', textAlign: 'left', width: 60},
				{field: 'reqProTypeNm', title: '처리유형', textAlign: 'left', width: 60, sortField: "reqProTypeCd", search:true, searchType:"select", searchCd: "REQ00008", searchField:"reqProTypeCd", sortable: true, sortField:"reqProTypeCd"},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 120, sortField: "reqDtm",
					template: function (row) {
						var paramDatetime = new Date(row.reqDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				}
			],
			rows:{
				clickCheckbox: true
			},
			actionBtn:{
				"title" : $.osl.lang("dpl4000.req.actionBtn.title"),
				"dblClick": true,
				"detail": true,
				"delete":false,
				"update":false,
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("dpl4000.req.actionBtn.tooltip.detailTooltip"),
				"detail" : $.osl.lang("dpl4000.req.actionBtn.tooltip.detailTooltip"),
			},
			actionFn:{
				"dblClick": function(rowData){
					var data = {
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
						};
					console.log(data);
					debugger;
					var options = {
							idKey: rowData.reqId,
							modalTitle: $.osl.lang("dpl4000.req.actionBtn.modalTitle", $.osl.escapeHtml(rowData.reqNm)),
							modalSize : "fs"
						};
					
					$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6203View.do',data,options);
				},
				"detail":function(rowDatas, datatableId, type, rowNum, elem){
					var rowData;
					if(type == "list"){
						if(rowNum != 1){
							$.osl.alert($.osl.lang("dpl4000.message.selectOneReq", rowNum));
							return false;
						}else{
							rowData = rowDatas[0];
						}
					}else{
						rowData = rowDatas;
					}
					
					var data = {
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
						};
					var options = {
							idKey: rowData.reqId,
							modalTitle: $.osl.lang("dpl4000.req.actionBtn.modalTitle", $.osl.escapeHtml(rowData.reqNm)),
							modalSize : "fs"
						};
					
					$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6203View.do',data,options);
				},
			},
			theme:{
				actionBtn:{
					"dblClick" : " kt-hide",
					"detail" : "",
				},
				actionBtnIcon:{
					"dblClick": "fas fa-external-link-alt",
					"detail": "fas fa-external-link-alt",
				}
			}
		});
			
		//배정된 JOB 목록 조회
		$.osl.datatable.setting(jobDatatableId,{
			data:{
				source:{
					read:{
						url: "/dpl/dpl4000/dpl4000/selectDpl1300DplJobPagingListAjax.do",
					}
				},
				pageSize: 4
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100]
					}
				}
			},
			rows:{
				clickCheckbox: true,
			},
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'jobTypeNm', title: "유형", textAlign: 'center', width: 80, search: true, searchType:"select", searchCd:"DPL00002", searchField:"jobTypeCd", sortable: true, sortField: "jobTypeCd"},
				{field: 'jobId', title: 'JOB ID', textAlign: 'left', width: 180, search: true, sortable: true, sortField: "jobId"},
				{field: 'jobRestoreId', title: '원복 JOB ID', textAlign: 'center', width: 130, autoHide: false, search: true, sortable: true, sortField: "jobRestoreId"
					,template: function(row){
						var jobRestoredId = row.jobRestoreId;
						// 원복 job id 없을 경우 - 으로 표시
						if($.osl.isNull(jobRestoredId)){
							jobRestoredId = "-";
						}
						return jobRestoredId;
					}	
				},
				{field: 'bldResultMsg', title: '실행 결과', textAlign: 'center', width: 120, search: false, sortable: true, sortField: "bldResultMsg"},
				{field: 'jobParameter', title: 'Job 매개변수', textAlign: 'center', width: 120
					,template: function(row){
						var jobParameter = row.jobParameter;
						// Job 매개변수 없을 경우 - 으로 표시
						if($.osl.isNull(jobParameter)){
							jobParameter = "-";
						}
						return jobParameter;
					}
				}
			],
			actionBtn:{
				"title" : $.osl.lang("dpl4000.job.actionBtn.title"),
				"dblClick": true,
				"detail": true,
				"delete":false,
				"update":false,
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("dpl4000.job.actionBtn.tooltip.detailTooltip"),
				"detail" : $.osl.lang("dpl4000.job.actionBtn.tooltip.detailTooltip"),
			},
			actionFn:{
				"dblClick": function(rowData){
					var data = {
							paramPrjId: rowData.prjId,
							paramDplId: rowData.dplId,
							paramJenId : rowData.jenId,
							paramJobId: rowData.jobId,
						};
					var options = {
							idKey: rowData.jobId,
							modalTitle: $.osl.lang("dpl4000.job.actionBtn.modalTitle"),
							modalSize : "xl"
						};
					
					$.osl.layerPopupOpen('/stm/stm9000/stm9100/selectStm9102View.do',data,options);
				},
				"detail":function(rowDatas, datatableId, type, rowNum, elem){
					var rowData;
					if(type == "list"){
						if(rowNum != 1){
							$.osl.alert("dpl4000.message.selectOneJob", rowNum);
							return false;
						}else{
							rowData = rowDatas[0];
						}
					}else{
						rowData = rowDatas;
					}
					
					var data = {
							paramPrjId: rowData.prjId,
							paramDplId: rowData.dplId,
							paramJenId : rowData.jenId,
							paramJobId: rowData.jobId,
						};
					var options = {
							idKey: rowData.jobId,
							modalTitle: $.osl.lang("dpl4000.job.actionBtn.modalTitle"),
							closeConfirm: false,
							modalSize : "xl"
						};
					
					$.osl.layerPopupOpen('/stm/stm9000/stm9100/selectStm9102View.do',data,options);
				},
			},
			theme:{
				actionBtn:{
					"dblClick" : " kt-hide",
					"detail" : "",
				},
				actionBtnIcon:{
					"dblClick": "fas fa-external-link-alt",
					"detail": "fas fa-external-link-alt",
				}
			}
		});
	 };
	 
	 var reloadList = function(){
		 if(!$.osl.isNull(dplId)){
			 //param 주입
			 $.osl.datatable.list[reqDatatableId].targetDt.setDataSourceParam("dplId", dplId);
			 
			 $.osl.datatable.list[jobDatatableId].targetDt.setDataSourceParam("dplId", dplId);
			 $.osl.datatable.list[jobDatatableId].targetDt.setDataSourceParam("prjGrpId", prjGrpId);
			 $.osl.datatable.list[jobDatatableId].targetDt.setDataSourceParam("prjId", prjId);
			 
			 //목록 재조회
			 $("button[data-datatable-id="+reqDatatableId+"][data-datatable-action=select]").click(); 
			 $("button[data-datatable-id="+jobDatatableId+"][data-datatable-action=select]").click(); 
		 }
	 };

	 return {
		init: function(){
			documentSetting();
		}
	};
 }();
 
 $.osl.ready(function(){
	 OSLStm8000Popup.init();
 });
</script>
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />