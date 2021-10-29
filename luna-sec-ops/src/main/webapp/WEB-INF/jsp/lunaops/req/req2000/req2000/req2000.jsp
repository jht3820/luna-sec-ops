<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />

<div class="row">
	<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12">
		
		<div class="kt-portlet kt-portlet--mobile">
			
			<div class="kt-portlet__head kt-portlet__head--lg">
				
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
					</h4>
				</div>
				
				
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req2000Table" data-datatable-action="select" title="구성항목 기준관리 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
							<i class="fa fa-list"></i><span>조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req2000Table" data-datatable-action="insert" title="구성항목 기준관리 추가" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="6">
							<i class="fa fa-plus"></i><span>추가</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req2000Table" data-datatable-action="update" title="구성항목 기준관리 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="7">
							<i class="fa fa-edit"></i><span>수정</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req2000Table" data-datatable-action="delete" title="구성항목 기준관리 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="8">
							<i class="fa fa-trash-alt"></i><span>삭제</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req2000Table" data-datatable-action="assign" title="구성항목 기준관리 항목 배정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="" tabindex="">
							<i class="fas fa-archive"></i><span>항목 배정</span>
						</button>
					</div>
				</div>
				
			</div>
			
			
			<div class="kt-portlet__body">
				<div class="kt_datatable" id="req2000Table"></div>
			</div>
			
		</div>
		
	</div>
	
	<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
	
		<div class="kt-portlet kt-portlet--mobile osl-content__border--light">
			
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>선택 구성항목 메타 정보
					</h4>
				</div>
			</div>
			
			
			<div class="kt-portlet__body">
				<div class="kt_datatable" id="req2000MetaInfoTable"></div>
			</div>
			
		</div>
		
		<div class="kt-portlet kt-portlet--mobile osl-content__border--light">
			
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>선택 구성항목 배정 목록
					</h4>
				</div>
			</div>
			
			
			<div class="kt-portlet__body">
				<div class="kt_datatable" id="req2000AssignTable"></div>
			</div>
			
		</div>
	</div>
</div>


<script>
"use strict";
var OSLReq2000Popup = function () {
	var documentSetting = function(){
		
		
		$.osl.datatable.setting("req2000Table",{
			data: {
				source: {
					read: {
						
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false},
				{field: '', title: '구성항목 명', textAlign: 'center', width: 300},
				{field: '', title: '순번', textAlign: 'center', width: 100},
				{field: '', title: '메타 정보 수', textAlign: 'center', width: 150},
				{field: '', title: '배정 항목 수', textAlign: 'center', width: 150},
				{field: '', title: '배정 요구사항 수', textAlign: 'center', width: 150},
				{field: '', title: '등록자', textAlign: 'center', width: 150},
				{field: '', title: '등록일', textAlign: 'center', width: 200}
			],
			actionBtn:{
				"dblClick": true
			},
			actionTooltip:{
				"update": "수정",
				"delete": "삭제",
				"dblClick": "상세보기"
			},
			actionFn:{
				"insert":function(datatableId){
					var data = {
					};
					var options = {
						modalTitle: "구성항목 등록",
						autoHeight: false
					};
					
					$.osl.layerPopupOpen('/req/req2000/req2000/selectReq2002View.do',data,options);
				},
				"update":function(rowData){
					var data = {
					};
					var options = {
						modalTitle: "구성항목 수정",
						autoHeight: false						
					};
					
					$.osl.layerPopupOpen('/req/req2000/req2000/selectReq2002View.do',data,options);
				},
				"delete":function(rowDataList){
					
				},
				"dblClick":function(rowData){
					var data = {
						};
					var options = {
							modalTitle: "구성항목 상세정보",
							autoHeight: false,
							modalSize: 'xl'
						};
					console.log(rowData);
					$.osl.layerPopupOpen('/req/req2000/req2000/selectReq2001View.do',data,options);
				},
				"assign":function(rowData) {
					var data = {
					};
					var options = {
						modalTitle: "구성항목 배정",
						autoHeight: false,
						modalSize: "xl"
					};
				
					$.osl.layerPopupOpen('/req/req2000/req2000/selectReq2005View.do',data,options);					
				}
			}
		});
		
		
		
		$.osl.datatable.setting("req2000MetaInfoTable",{
			data: {
				source: {
					read: {
						
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
			},
			columns: [
				{field: '', title: '메타정보 명', textAlign: 'center', width: 250},
				{field: '', title: '메타 정보 내용', textAlign: 'center', width: 250},
				{field: '', title: '순서', textAlign: 'center', width: 50}
			],
			actionBtn:{
				"dblClick": false
			}
		});
		
		
		
		$.osl.datatable.setting("req2000AssignTable",{
			data: {
				source: {
					read: {
						
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
			},
			columns: [
				{field: '', title: '구성항목 명', textAlign: 'center', width: 200},
				{field: '', title: '메타 정보 수', textAlign: 'center', width: 100},
				{field: '', title: '배정 항목 수', textAlign: 'center', width: 100}
			],
			actionBtn:{
				"dblClick": false
			}
		});
		
		
	};
	
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLReq2000Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
