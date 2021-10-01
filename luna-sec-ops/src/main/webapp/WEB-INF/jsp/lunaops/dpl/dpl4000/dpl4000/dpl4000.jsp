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
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl4000DplTable" data-datatable-action="select" title="배포 계획 조회" data-title-lang-cd="" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
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
						<span data-lang-cd="">요구사항 배정 목록</span>
					</h4>
				</div>
				<div class="col-lg-9 col-md-12 col-sm-12 text-right kt-margin-t-15-tablet kt-margin-t-15-mobile">
					<div class="kt-portlet__head-group osl-float-left-tablet">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl4000AssReqTable" data-datatable-action="select" title="배정 요구사항 조회" data-title-lang-cd="" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
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
						<span data-lang-cd="">JOB 배정 목록</span>
					</h4>
				</div>
				<div class="col-lg-9 col-md-12 col-sm-12 text-right kt-margin-t-15-tablet kt-margin-t-15-mobile">
					<div class="kt-portlet__head-group osl-float-left-tablet">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl4000AssJobTable" data-datatable-action="select" title="배정 JOB 조회" data-title-lang-cd="" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
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

<script>
 "use strict";

 var OSLStm8000Popup = function() {
	 
	 var datatableId = "dpl4000DplTable";
	 var reqDatatableId = "dpl4000AssReqTable";
	 var jobDatatableId = "dpl4000AssJobTable";
	 
	 var documentSetting = function() {
		 
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
					{field: 'signStsNm', title: '결재 상태', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "REQ00004", searchField:"signStsCd", sortField: "signStsCd"},
					{field: 'signUsrNm', title: '결재자', textAlign: 'center', width: 100},
					{field: 'dplStsNm', title: '배포 상태', textAlign: 'center', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "DPL00001", searchField:"dplStsCd", sortField: "dplStsCd"},
					{field: 'dplVer', title: '배포 버전', textAlign: 'center', width: 100, search: true},
					{field: 'dplNm', title: '배포 명', textAlign: 'left', width: 300, autoHide: false, search: true},
					{field: 'dplTypeNm', title: '배포 방법', textAlign: 'center', width: 70, autoHide: false, search: true, searchType:"select", searchCd: "DPL00003", searchField:"dplTypeCd", sortField: "dplTypeCd"},
					{field: 'dplRevisionNum', title: '배포 리비전 번호', textAlign: 'center', width: 100
						,template: function(row){
							var dplRevisionNum = row.dplRevisionNum;
							
							if($.osl.isNull(dplRevisionNum)){
								dplRevisionNum = "Last Revision";
							}
							return dplRevisionNum;
						}
					},
					{field: 'dplDt', title: '배포 일자', textAlign: 'center', width: 100, search: true, searchType:"daterange"},
					{field: 'dplUsrNm', title: '배포자', textAlign: 'center', width: 100, search: true},
				],
				rows:{
					clickCheckbox: true
				},
				actionBtn:{
					"title": "상세",
					"width" : 50,
					"update": false,
					"delete": false,
					"detail" : true,
					"dblClick": true,
				},
				actionTooltip:{
					"detail": "배포 계획 상세 보기",
					"dblClick": "배포 계획 상세 보기",
				},
				actionFn:{
					"dblClick":function(rowData){
						var data = {
								paramPrjId : rowData.prjId,
								paramDplId : rowData.dplId
							};
						var options = {
								idKey: datatableId +"_"+ rowData.dplId,
								modalTitle: "["+rowData.dplNm +"] "+ "상세 정보",
								autoHeight: false,
								modalSize: 'xl'
							};
						
						$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1002View.do',data,options);
					},
					"detail":function(rowDatas, datatableId, type, rowNum, elem){
						var rowData;
						if(type == "list"){
							if(rowNum != 1){
								$.osl.alert("하나만 선택");
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
								modalTitle: "["+rowData.dplNm +"] "+ "상세 정보",
								autoHeight: false,
								modalSize: 'xl'
							};
						
						$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1002View.do',data,options);
					},
				},
				theme: {
					actionBtn:{
						 "dblClick": "",
						 "detail" : " kt-hide",
					 },
					 actionBtnIcon:{
						 "dblClick": " fas fa-external-link-alt",
						 "detail": " fas fa-external-link-alt"
					 }
				 }
			});
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