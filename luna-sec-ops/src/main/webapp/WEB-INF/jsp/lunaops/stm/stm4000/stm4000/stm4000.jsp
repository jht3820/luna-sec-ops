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
	<div class="kt-portlet__body">
		<div class="row">
			
			<div class="col-xl-6">
				<div class="kt-portlet--contain osl-content__border--light">
					<div class="kt-blog-grid">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-window-maximize kt-margin-r-5"></i>공통코드 마스터
								</h5>
							</div>
							
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-wrapper">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm4000MstCodeTable" data-datatable-action="select" title="공통코드 마스터 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
										<i class="fa fa-list"></i><span>조회</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm4000MstCodeTable" data-datatable-action="insert" title="공통코드 마스터 추가" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
										<i class="fa fa-plus"></i><span>추가</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm4000MstCodeTable" data-datatable-action="update" title="공통코드 마스터 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
										<i class="fa fa-edit"></i><span>수정</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm4000MstCodeTable" data-datatable-action="delete" title="공통코드 마스터 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
										<i class="fa fa-trash-alt"></i><span>삭제</span>
									</button>
								</div>
							</div>
							
						</div>
						
						<div class="kt-portlet__body">
							<div class="kt-blog-grid__body">
								<div class="row">
									<div class="col-lg-5 col-md-6 col-sm-6">
										<div class="osl-datatable-search" data-datatable-id="stm4000MstCodeTable"></div>
									</div>
								</div>
								<div class="kt_datatable" id="stm4000MstCodeTable"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			
			<div class="col-xl-6">
				<div class="kt-portlet--contain osl-content__border--light">
					<div class="kt-blog-grid">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-window-restore kt-margin-r-5"></i>공통코드 디테일
								</h5>
							</div>
							
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-wrapper">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm4000DetailCodeTable" data-datatable-action="select" title="공통코드 디테일 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
										<i class="fa fa-list"></i><span>조회</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm4000DetailCodeTable" data-datatable-action="insert" title="공통코드 디테일 추가" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="6">
										<i class="fa fa-plus"></i><span>추가</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm4000DetailCodeTable" data-datatable-action="update" title="공통코드 디테일 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="7">
										<i class="fa fa-edit"></i><span>수정</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm4000DetailCodeTable" data-datatable-action="delete" title="공통코드 디테일 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="8">
										<i class="fa fa-trash-alt"></i><span>삭제</span>
									</button>
								</div>
							</div>
							
						</div>
						
						<div class="kt-portlet__body">
							<div class="kt-blog-grid__body">
								<div class="row">
									<div class="col-lg-5 col-md-6 col-sm-6">
										<div class="osl-datatable-search" data-datatable-id="stm4000DetailCodeTable"></div>
									</div>
								</div>
								<div class="kt_datatable" id="stm4000DetailCodeTable"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>

<script>
"use strict";
var OSLStm4000 = function () {
	var documentSetting = function(){
		
		$.osl.datatable.setting("stm4000MstCodeTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm4000/stm4000/selectStm4000CommonCodeMasterListAjax.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false},
				{field: 'mstCd', title: '공통 코드', textAlign: 'center', width: 90, autoHide: false, search: true},
				{field: 'upperMstCd', title: '상위 코드', textAlign: 'center', width: 90,
					template: function (row) {return $.osl.isNull(row.upperMstCd) ? "-" : row.upperMstCd;}
				},
				{field: 'mstCdNm', title: '코드 명', textAlign: 'left', width: 150, search: true, autoHide: false},
				{field: 'mstCdDesc', title: '코드 설명', textAlign: 'left', width: 200, search: true,
					
					template: function (row) {return !$.osl.isNull(row.mstCdDesc) ? row.mstCdDesc.replace(/(<([^>]+)>)/ig,"") : row.mstCdDesc;}		
				},
				{field: 'ord', title: '표시 순서', textAlign: 'center', width: 100},
				{field: 'useYn', title: '사용 유무', textAlign: 'center', width: 100 , search: true, searchType:"select", searchCd: "CMM00001", sortField: "useCd", 
					template: function (row) {return row.useYn == "Y" ? "예" : "아니오";}
				},
				{field: 'stmUseYn', title: '시스템 사용 유무', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "CMM00001", sortField: "useCd",
					template: function (row) {return row.stmUseYn == "Y" ? "예" : "아니오";}
				},
			],
			actionBtn:{
				"click": true
			},
			actionTooltip:{
				"update": "공통코드 마스터 수정",
				"delete": "공통코드 마스터 삭제",
				"click": "공통코드 디테일 조회"
			},
			actionFn:{
				"insert":function(datatableId){
					
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalTitle: "공통코드 마스터 등록",
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm4000/stm4000/selectStm4001View.do',data,options);
				},
				"update":function(rowData){
					
					var data = {
							type:"update",
							paramMstCd: rowData.mstCd,
							paramStmUseYn: rowData.stmUseYn,
							paramStmUseNm : rowData.stmUseYn == "Y" ? "예" : "아니오"
						};
					var options = {
							idKey: rowData.mstCd,
							modalTitle: "공통코드 마스터 수정",
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm4000/stm4000/selectStm4001View.do',data,options);
				},
				"delete":function(rowDataList){
					
					var params = "";
					var isStmUse = false;
					
					$.each(rowDataList, function(idx, map){
						var stmUseYn = map.stmUseYn;
						
						if(stmUseYn == "Y"){
							isStmUse = true;
							return false;
						}
							
						params +="&mstCd="+map.mstCd+"&stmUseYn="+stmUseYn;
					});
					
					if(isStmUse){
						$.osl.alert("시스템에서 사용중인 코드는 삭제할 수 없습니다.", "warning");
						return false;
					}
					
					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/stm/stm4000/stm4000/deleteStm4000CommonCodeMasterAjax.do'/>"}
								,params);
					
					ajaxObj.setFnSuccess(function(data){
				    	
						
						if(data.errorYn == "Y"){
							$.osl.alert(data.message, "warning");
							return false;
						}
						
						$.osl.toastr(data.message);
						
						$.osl.datatable.list["stm4000MstCodeTable"].targetDt.reload();
						
						$.osl.datatable.list["stm4000DetailCodeTable"].targetDt.reload();
					});
					
					
					ajaxObj.send();
				},
				"click":function(rowData){
					
					
					searchReset("stm4000DetailCodeTable");
					
					
					var detailDataTable = $.osl.datatable.list["stm4000DetailCodeTable"].targetDt;
					detailDataTable.setDataSourceParam("mstCd",rowData.mstCd);
					
					detailDataTable.setDataSourceParam("stmUseYn",rowData.stmUseYn);
					
					$("button[data-datatable-id=stm4000DetailCodeTable][data-datatable-action=select]").click();   
				}
			}
		});
		
		
		
		$.osl.datatable.setting("stm4000DetailCodeTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm4000/stm4000/selectStm4000CommonCodeDetailListAjax.do"
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false},
				{field: 'mstCd', title: '마스터 코드', textAlign: 'center', width: 100},
				{field: 'mstCdNm', title: '마스터 코드 명', textAlign: 'left', width: 150},
				{field: 'subCd', title: '서브 코드', textAlign: 'center', width: 90, autoHide: false, search: true},
				{field: 'subCdNm', title: '서브 코드 명', textAlign: 'left', width: 170, autoHide: false, search: true},
				{field: 'subCdRef1', title: '보조필드 1', textAlign: 'left', width: 150, search: true,
					template: function (row) {return $.osl.isNull(row.subCdRef1) ? "-" : row.subCdRef1;}
				},
				{field: 'subCdRef2', title: '보조필드 2', textAlign: 'left', width: 150, search: true,
					template: function (row) {return $.osl.isNull(row.subCdRef2) ? "-" : row.subCdRef2;}
				},
				{field: 'subCdRef3', title: '보조필드 3', textAlign: 'left', width: 150,
					template: function (row) {return $.osl.isNull(row.subCdRef3) ? "-" : row.subCdRef3;}
				},
				{field: 'subCdRef4', title: '보조필드 4', textAlign: 'left', width: 150,
					template: function (row) {return $.osl.isNull(row.subCdRef4) ? "-" : row.subCdRef4;}
				},
				{field: 'subCdRef5', title: '보조필드 5', textAlign: 'left', width: 150,
					template: function (row) {return $.osl.isNull(row.subCdRef5) ? "-" : row.subCdRef5;}
				},
				{field: 'subCdDesc', title: '서브코드 설명', textAlign: 'left', width: 200, search: true,
					
					template: function (row) {return !$.osl.isNull(row.subCdDesc) ? row.subCdDesc.replace(/(<([^>]+)>)/ig,"") : row.subCdDesc;}		
				},
				{field: 'ord', title: '표시 순서', textAlign: 'center', width: 100},
				{field: 'useYn', title: '사용 유무', textAlign: 'center', width: 100 , search: true, searchType:"select", searchCd: "CMM00001", 
					
					template: function (row) {return row.useYn == "Y" ? "예" : "아니오";}
				},
				{field: 'stmUseYn', title: '시스템 사용 유무', textAlign: 'center', width: 100, searchType:"select", searchCd: "CMM00001",
					template: function (row) {return row.stmUseYn == "Y" ? "예" : "아니오";}
				}
			],
			actionTooltip:{
				"update": "공통코드 디테일 수정",
				"delete": "공통코드 디테일 삭제"
			},
			actionFn:{
				"insert":function(datatableId){
					
					var paramData = $.osl.datatable.list["stm4000DetailCodeTable"].targetDt.getDataSourceParam();
					
					
					if(!$.osl.isNull(paramData) && $.osl.isNull(paramData.mstCd)){
						$.osl.alert("공통코드 마스터를 선택 후<br/>공통코드 디테일 등록이 가능합니다.");
						return false;
					}
					
					
					if(!$.osl.isNull(paramData) && !$.osl.isNull(paramData.stmUseYn) && paramData.stmUseYn == "Y"){
						$.osl.alert("공통코드 마스터가 시스템에서 사용중인 경우 <br/>공통코드 디테일을 추가할 수 없습니다.");
						return false;
					}
					
					var data = {
							type : "insert", 
							mstCd : paramData.mstCd,
							paramStmUseYn : paramData.stmUseYn
					};
					var options = {
							idKey: datatableId,
							modalTitle: "공통코드 디테일 등록",
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm4000/stm4000/selectStm4002View.do',data,options);
				},
				"update":function(rowData){
					
					var data = {
							type : "update", 
							mstCd : rowData.mstCd,
							subCd : rowData.subCd,
							paramStmUseYn: rowData.stmUseYn
					};
					var options = {
							idKey: rowData.subCd,
							modalTitle: "공통코드 디테일 수정",
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm4000/stm4000/selectStm4002View.do',data,options);
				},
				"delete":function(rowDataList){
					
					var params = "";
					var isStmUse = false;
					
					
					$.each(rowDataList, function(idx, map){
						var stmUseYn = map.stmUseYn;
						
						
						if(stmUseYn == "Y"){
							isStmUse = true;
							return false;
						}
						
						params += "&subCd="+map.subCd+"&stmUseYn="+stmUseYn+"&mstCd="+map.mstCd;
					});
					
					if(isStmUse){
						$.osl.alert("시스템에서 사용중인 코드는 삭제할 수 없습니다.", "warning");
						return false;
					}
					
					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/stm/stm4000/stm4000/deleteStm4000CommonCodeDetailAjax.do'/>"}
								,params);
					
					ajaxObj.setFnSuccess(function(data){
				    	
						
						if(data.errorYn == "Y"){
							$.osl.alert( data.message, "warning");
							return false;
						}
						
						$.osl.toastr(data.message);
						
						$.osl.datatable.list["stm4000DetailCodeTable"].targetDt.reload();
					});
					
					
					ajaxObj.send();
				}
			}
		});
		
		
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
	
	return {
        
        init: function() {
        	documentSetting();
        }
    };
}();


$.osl.ready(function(){
	OSLStm4000.init();
});
		
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
