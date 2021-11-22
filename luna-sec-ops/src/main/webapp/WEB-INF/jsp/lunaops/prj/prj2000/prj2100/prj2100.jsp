<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-3 col-md-6 col-sm-12">
		<div class="kt-grid__item kt-portlet" id="osl_authGrp_aside">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>권한 그룹 목록
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj2100AuthTable" data-datatable-action="select" title="데이터 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span>조회</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="osl-datatable-search" data-datatable-id="prj2100AuthTable"></div>
				<div class="kt_datatable" id="prj2100AuthTable"></div>
			</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-6 col-sm-12">
		<div class="kt-grid__item kt-portlet" id="osl_authGrp_aside">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>배정 사용자 목록
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj2100AuthGrpInUsrTable" data-datatable-action="select" title="데이터 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span>조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj2100AuthGrpInUsrTable" data-datatable-action="selInUsrDelete" title="선택 사용자 배정 제외" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<span>배정 제외</span><i class="fa fa-arrow-alt-circle-right osl-padding-r0 osl-padding-l05"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="osl-datatable-search" data-datatable-id="prj2100AuthGrpInUsrTable"></div>
				<div class="kt_datatable" id="prj2100AuthGrpInUsrTable"></div>
			</div>
		</div>
	</div>
	<div class="col-lg-5 col-md-6 col-sm-12">
		<div class="kt-grid__item kt-portlet" id="osl_authGrp_aside">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>미 배정 사용자 목록
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj2100AuthGrpAllUsrTable" data-datatable-action="selAllUsrDelete" title="선택 사용자 배정 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1" id="prj2100AuthGrpAllUsrInsert">
							<i class="fa fa-arrow-alt-circle-left"></i><span>배정 등록</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj2100AuthGrpAllUsrTable" data-datatable-action="select" title="데이터 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span>조회</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="osl-datatable-search" data-datatable-id="prj2100AuthGrpAllUsrTable"></div>
				<div class="kt_datatable" id="prj2100AuthGrpAllUsrTable"></div>
			</div>
		</div>
	</div>
</div>

<script>
"use strict";
var OSLPrj2100 = function () {
	
	var selAuthGrpId;
	
	
	var documentSetting = function () {
		
		datatablesSetting();
	};
	
	
	var datatablesSetting = function(){
		
		$.osl.datatable.setting("prj2100AuthTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj2000/prj2000/selectPrj2000PrjAuthGrpPageList.do"
					}
				},
				pageSize: 5,
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [5, 10, 20, 30, 50, 100]
					}
				}
			},
			columns: [
				{field: 'authGrpNm', title: '권한그룹 명', textAlign: 'left', width: 200, autoHide: false, search: true},
				{field: 'usrTypNm', title: '사용자 유형', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00004", searchField:"usrTyp"},
				{field: 'acceptUseNm', title: '접수권한 유무', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "CMM00001", searchField:"acceptUseCd", sortField: "acceptUseCd"},
				{field: 'assignCnt', title: '배정 사용자 수', textAlign: 'center', width: 120,
					template: function (row) {return !$.osl.isNull(row.assignCnt) ? row.assignCnt.toString() : "0";}
				}
			],
			actionBtn:{
				"title": "상세",
				"update": false,
				"delete": false,
				"click":true,
				"dblClick": true
			},
			actionTooltip:{
				"click":"사용자 배정, 미 배정 목록",
				"dblClick": "권한 그룹 상세보기"
			},
			actionFn:{
				"click": function(rowData, row){
					
					var inUsrDataTable = $.osl.datatable.list["prj2100AuthGrpInUsrTable"].targetDt;
					var allUsrDataTable = $.osl.datatable.list["prj2100AuthGrpAllUsrTable"].targetDt;
					
					
					inUsrDataTable.setDataSourceParam("paramAuthGrpId",rowData.authGrpId);
					allUsrDataTable.setDataSourceParam("paramAuthGrpId",rowData.authGrpId);
					
					
					inUsrDataTable.reload();
					allUsrDataTable.reload();
					
					
					selAuthGrpId = rowData.authGrpId;
				},
				"dblClick":function(rowData){
					
					var data = {
							paramPrjId: rowData.prjId,
							paramAuthGrpId: rowData.authGrpId,
						};
					var options = {
							idKey: "detail_"+rowData.authGrpId,
							modalTitle: "권한 그룹 상세보기",
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/prj/prj2000/prj2000/selectPrj2002View.do',data,options);
				}
			}
		});
		
		
		$.osl.datatable.setting("prj2100AuthGrpInUsrTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj2000/prj2100/selectPrj2100InUsrListAjax.do"
					}
				},
				pageSize: 5,
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
				{field: 'usrNm', title: '사용자명', textAlign: 'left', width: 150, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직책', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직급', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 150, search: true, sortable: false},
			],
			searchColumns:[
				{field: 'usrId', title: '사용자 ID', searchOrd: 1}
			],
			actionBtn:{
				"title": "제외",
				"update": false,
				"delete": false,
				"dblClick": true
			},
			actionTooltip:{
				"dblClick": "사용자 배정 제외"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-right",
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					fnAllUsrDelete(rowDatas);
				},
				
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					var rowDatas = rowData;
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("common.user.auth.allUsrInDelete",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							
							fnAllUsrDelete(rowDatas);
						}
					});
				}
			}
		});
		
		
		$.osl.datatable.setting("prj2100AuthGrpAllUsrTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj2000/prj2100/selectPrj2100AllUsrListAjax.do"
					}
				},
				pageSize: 5,
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
				{field: 'usrNm', title: '사용자명', textAlign: 'left', width: 150, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직책', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직급', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 150, search: true, sortable: false},
			],
			searchColumns:[
				{field: 'usrId', title: '사용자 ID', searchOrd: 1}
			],
			actionBtn:{
				"title": "배정",
				"update": false,
				"delete": false,
				"dblClick": true,
				"lastPush": false,
			},
			actionTooltip:{
				"dblClick": "사용자 배정 등록"
			},
			theme:{
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-left",
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					fnAllUsrInsert(rowDatas);
					
				},
				
				"selAllUsrDelete": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("common.user.auth.allUsrInsert",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							
							fnAllUsrInsert(rowDatas);
						}
					});
				}
			}
		});
	}

	
	var fnAllUsrInsert = function(rowDatas){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj2000/prj2100/insertPrj2100AllUsrListAjax.do'/>"}
				,{paramAuthGrpId:selAuthGrpId, dataList: JSON.stringify(rowDatas)});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);
   				
   				
				var inUsrDataTable = $.osl.datatable.list["prj2100AuthGrpInUsrTable"].targetDt;
				var allUsrDataTable = $.osl.datatable.list["prj2100AuthGrpAllUsrTable"].targetDt;
				
				
				inUsrDataTable.reload();
				allUsrDataTable.reload();
   			}
		});
		
		
		ajaxObj.send();
	}
	
	
	var fnAllUsrDelete = function(rowDatas){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj2000/prj2100/deletePrj2100AllUsrListAjax.do'/>"}
				,{paramAuthGrpId:selAuthGrpId, dataList: JSON.stringify(rowDatas)});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);
   				
   				
				var inUsrDataTable = $.osl.datatable.list["prj2100AuthGrpInUsrTable"].targetDt;
				var allUsrDataTable = $.osl.datatable.list["prj2100AuthGrpAllUsrTable"].targetDt;
				
				
				inUsrDataTable.reload();
				allUsrDataTable.reload();
   			}
		});
		
		
		ajaxObj.send();
	}
	return {
		  
		  init: function() {
		  	documentSetting();
		  }
	};
}();


$.osl.ready(function(){
	OSLPrj2100.init();
});

</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
