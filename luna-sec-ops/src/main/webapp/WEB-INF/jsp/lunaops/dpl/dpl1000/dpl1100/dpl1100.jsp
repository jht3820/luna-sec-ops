<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<input type="hidden" id="dplId" name="dplId"/>
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
	<div class="col-lg-5 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="dpl1100.title.deploy">배포계획 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000DplTable" data-datatable-action="select" title="배포계획 조회" data-title-lang-cd="dpl1100.actionBtn.tooltip.dplSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-7 col-md-8 col-sm-12 col-12">
						<div class="osl-datatable-search kt-margin-b-0 kt-margin-r-10" data-datatable-id="dpl1000DplTable"></div>
					</div>
				</div>
				<div class="kt_datatable" id="dpl1000DplTable"></div>
			</div>
		</div>
	</div> 
	
	<div class="col-lg-7 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="dpl1100.title.assignment">요구사항 배정 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req1100AssTable" data-datatable-action="select" title="요구사항 배정 조회" data-title-lang-cd="dpl1100.actionBtn.title.assSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req1100AssTable" data-datatable-action="removeReq" title="요구사항 배정 제외" data-title-lang-cd="dpl1100.actionBtn.tooltip.removeToolTip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="removeReq" tabindex="2">
							<i class="fa fa-arrow-alt-circle-down"></i><span data-lang-cd="dpl1100.button.removeBtn">제외</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-5 col-md-6 col-sm-12 col-12">
						<div class="osl-datatable-search kt-margin-b-0 kt-margin-r-10" data-datatable-id="req1100AssTable"></div>
					</div>
				</div>
				<div class="kt_datatable" id="req1100AssTable"></div>
			</div>
		</div> 
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="dpl1100.title.assignment">요구사항 미배정 목록 </span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req1100NonTable" data-datatable-action="select" title="요구사항 미배정 조회" data-title-lang-cd="dpl1100.actionBtn.title.nonSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req1100NonTable" data-datatable-action="addReq" title="요구사항 배정" data-title-lang-cd="dpl1100.actionBtn.tooltip.addToolTip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="addReq" tabindex="2">
							<i class="fa fa-arrow-alt-circle-up"></i><span data-lang-cd="dpl1100.button.addBtn">배정</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-5 col-md-6 col-sm-12 col-12">
						<div class="osl-datatable-search kt-margin-b-0 kt-margin-r-10" data-datatable-id="req1100NonTable"></div>
					</div>
				</div>
				<div class="kt_datatable" id="req1100NonTable"></div>
			</div>
		</div>
	</div> 
</div>

<script>
"use strict";
var OSLDpl1100Popup = function () {
	
	var dplDatatableId = "dpl1000DplTable";
	
	var reqAssDatatableId = "req1100AssTable";
	
	var reqNonDatatableId = "req1100NonTable";
	
	
	var assList = [];
	
	var nonAssList = [];
	
	
	var dplStsCd = "";
	
	var documentSetting = function(){
		
		$.osl.datatable.setting(dplDatatableId,{
			data:{
				source:{
					read:{
						url: "/dpl/dpl1000/dpl1000/selectDpl1000DplListAjax.do"
					}
				}
			},
			columns:[
				
				{field: 'dplStsNm', title: '배포 상태', textAlign: 'center', width: 80, search: true, searchType:"select", searchCd: "DPL00001", searchField:"dplStsCd", sortable: true, sortField:"dplStsCd"},
				{field: 'dplNm', title: '배포계획명', textAlign: 'left', width: 220, autoHide: false, search: true, sortable: true, sortField: "dplNm"},
				{field: 'dplDt', title: '배포일', textAlign: 'center', width: 120, sortable: true,  sortField: "dplDt", search:true,  searchType:"daterange",
					template: function (row) {
						var paramDatetime = new Date(row.dplDt);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
				{field: 'dplVer', title: '버전', textAlign: 'center', width: 50, search: true, sortable: true, sortField: "dplVer"},
				{field: 'dplTypeNm', title: '배포 방법', textAlign: 'center', width: 60, search: true, searchType:"select", searchCd: "DPL00003", searchField:"dplTypeCd", sortable: true, sortField:"dplTypeCd"},
			],
			searchColumns:[
				{field: 'dplDesc', title: '배포계획 설명', searchOrd: 3},
			],
			actionBtn:{
				"title" : $.osl.lang("dpl1100.actionBtn.title.selectBtn"),
				"click": true,
				"dblClick":true,
				"delete":false,
				"update":false,
			},
			actionTooltip:{
				"click" : $.osl.lang("dpl1100.actionBtn.tooltip.clickToolTip"),
				"dblClick" : "배포 계획 상세보기",
			},
			actionFn:{
				"select": function(datatableId, elem, datatable){
					
					var searchTypeTarget = $(".osl-datatable-search__dropdown[data-datatable-id="+datatableId+"] > .dropdown-item.active");
					
					
					var searchData = $("#searchData_"+datatableId);

					
					var searchFieldId = searchTypeTarget.data("field-id");
					var searchType = searchTypeTarget.data("opt-type");
					var searchCd = $(this).data("opt-mst-cd");
					
					
					datatable.setDataSourceQuery({});
					
					
					if(searchType != "all"){
						var searchDataValue = searchData.val();
						
						
						if(searchType == "select"){
							searchDataValue = $("#searchSelect_"+datatableId).val();
						}
						
						datatable.search(searchDataValue,searchFieldId);
					}else{
						datatable.search();
						
						
						$("#dplId").val("");
						dplStsCd = "";
						selectBtnClick();
					}
				},
				"click": function(rowData){
					$("#dplId").val(rowData.dplId);
					dplStsCd = rowData.dplStsCd; 
					selectBtnClick();
				},
				
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
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
				}
			}
		});

		
		$.osl.datatable.setting(reqAssDatatableId,{
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
				{field: 'rn', title: 'No.', textAlign: 'center', width: 80, sortField: "rn"},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 450, autoHide: false, sortField: "reqNm", search:true,
				
				},
				{field: 'reqOrd', title: '순번', textAlign: 'left', width: 80},
				{field: 'reqProTypeNm', title: '처리유형', textAlign: 'left', width: 80, sortField: "reqProTypeCd", search:true, searchType:"select", searchCd: "REQ00008", searchField:"reqProTypeCd", sortable: true, sortField:"reqProTypeCd"},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 120, sortField: "reqDtm",
					template: function (row) {
						var paramDatetime = new Date(row.reqDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				}
			],
			actionBtn:{
				"title" : $.osl.lang("dpl1100.actionBtn.title.removeBtn"),
				"dblClick": true,
				"removeReq": true,
				"delete":false,
				"update":false,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("dpl1100.actionBtn.tooltip.removeToolTip")
			},
			actionFn:{
				"dblClick": function(rowData){
					assList.push(rowData);
					deleteReq($("#dplId").val(), JSON.stringify(assList));
				},
				"removeReq":function(rowData, datatableId, type){
					assList = rowData;
					deleteReq($("#dplId").val(), JSON.stringify(assList));
				},
			},
			theme:{
				actionBtn:{
					"removeReq" : " kt-hide"
				},
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-down",
				}
			},
		});
		
		
		$.osl.datatable.setting(reqNonDatatableId,{
			data:{
				source:{
					read:{
						url: "/dpl/dpl1000/dpl1100/selectDpl1100NonAssReqListAjax.do"
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
				{field: 'rn', title: 'No.', textAlign: 'center', width: 80, sortField: "rn"},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 450, autoHide: false, sortField: "reqNm", search:true,
				
				},
				{field: 'reqOrd', title: '순번', textAlign: 'left', width: 80},
				{field: 'reqProTypeNm', title: '처리유형', textAlign: 'left', width: 80, sortField: "reqProTypeCd", search:true, searchType:"select", searchCd: "REQ00008", searchField:"reqProTypeCd", sortable: true, sortField:"reqProTypeCd"},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 120, sortField: "reqDtm",
					template: function (row) {
						var paramDatetime = new Date(row.reqDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				}
			],
			actionBtn:{
				"title" : $.osl.lang("dpl1100.actionBtn.title.addBtn"),
				"dblClick": true,
				"addReq" : true,
				"delete":false,
				"update":false,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("dpl1100.actionBtn.tooltip.addToolTip")
			},
			actionFn:{
				"dblClick": function(rowData){
					nonAssList.push(rowData);
					insertReq($("#dplId").val(), JSON.stringify(nonAssList));
				},
				"addReq":function(rowData, datatableId, type){
					nonAssList = rowData;
					insertReq($("#dplId").val(), JSON.stringify(nonAssList));
				},
				
			},
			theme:{
				actionBtn:{
					"addReq" : " kt-hide"
				},
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-up",
				}
			}
		});
	};

	
	var selectBtnClick = function(){
		var dplId = $("#dplId").val();
		
		$.osl.datatable.list[reqAssDatatableId].targetDt.setDataSourceParam("dplId", dplId);
		$("button[data-datatable-id="+reqAssDatatableId+"][data-datatable-action=select]").click();
		
		$.osl.datatable.list[reqNonDatatableId].targetDt.setDataSourceParam("dplId", dplId);
		$("button[data-datatable-id="+reqNonDatatableId+"][data-datatable-action=select]").click();
	};
	
	
	var insertReq = function(dplId, list){
		
		if(dplStsCd != "01"){
			$.osl.alert($.osl.lang("dpl1100.message.alert.notAssignedReq"));
			return false;
		}
		
		var data = {
				selReqList : list,
				dplId : dplId
		};
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/dpl/dpl1000/dpl1100/insertDpl1100ReqListAjax.do'/>"}
				, data);
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				if(list.length>0){
					$.osl.toastr(data.message);
					nonAssList = [];
				}
				selectBtnClick();
			}
    	});
		
    	ajaxObj.send();
	}

	
	var deleteReq = function(dplId, list){
		var data = {
				selReqList : list,
				dplId : dplId
		};
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/dpl/dpl1000/dpl1100/deleteDpl1100ReqListAjax.do'/>"}
				, data);
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				if(list.length>0){
					$.osl.toastr(data.message);
					assList = [];
				}
				selectBtnClick();
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
	OSLDpl1100Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
