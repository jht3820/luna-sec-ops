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
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8200RepTable" data-datatable-action="select" title="전체 현황 조회" data-title-lang-cd="stm8200.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="3">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-5 col-md-6 col-sm-12">
				<div class="osl-datatable-search" data-datatable-id="stm8200RepTable"></div>
			</div>
		</div>
		<div class="kt_datatable osl-datatable-footer__divide" id="stm8200RepTable"></div>
	</div>
</div>

<script>
 "use strict";

 var OSLStm8200Popup = function() {
	 
	 var datatableId = "stm8200RepTable";
	 
	 var documentSetting = function() {
		$.osl.datatable.setting(datatableId,{
			data: {
				source: {
					read: {
						url: "/stm/stm8000/stm8200/selectStm8200AssStrgListAjax.do"
					}
				},
			},
			columns: [
				{field: 'useNm', title: '사용 여부', textAlign: 'center', width: 80, search: true, searchType:"select", searchCd: "CMM00001", searchField:"useCd", sortField:"useCd"},
				{field: 'prjGrpNm', title: '프로젝트 그룹명', textAlign: 'left', width: 240, search: true, sortField:"prjGrpNm"},
				{field: 'prjNm', title: '프로젝트명', textAlign: 'left', width: 240, search: true, sortField:"prjNm"},
				{field: 'strgTypeNm', title: '유형', textAlign: 'left', width: 40, search: true, searchType:"select", searchCd: "STM00004", searchField:"strgTypeCd", sortField: "strgTypeCd"},
				{field: 'strgRepTitle', title: '저장소명', textAlign: 'left', width: 240, search: true},
				{field: 'strgTxt', title: '저장소 설명', textAlign: 'left', width: 240, search: true,
					template: function(row){
						if($.osl.isNull(row.strgTxt)){
							return '-';
						}else{
							return row.strgTxt;
						}
					}	
				},
				{field: 'strgRepUrl', title: '저장소 URL', textAlign: 'left', width: 240},
			],
			rows:{
				minHeight: 50
			},
			actionBtn:{
				"update" : false,
				"delete" : false,
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
	 OSLStm8200Popup.init();
 });
</script>
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />