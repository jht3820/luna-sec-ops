<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form class="kt-form" id="">
	<div class="row">
		
		<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile" id="req2001ConfigurationList">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fas fa-stream kt-margin-r-5"></i>구성항목 목록
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm4000MstCodeTable" data-datatable-action="select" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1" data-original-title="구성항목 목록 조회">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
						</div>
						<div class="kt-portlet__head-group">
							<a href="#"	class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-tree-id="req2001Tree" data-tree-action="allNodeOpen">
								<i class="fa fa-plus"></i>
							</a> 
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action"	data-toggle="kt-tooltip" title="전체 접기" data-tree-id="req2001Tree" data-tree-action="allNodeClose">
								<i class="fa fa-minus"></i>
							</a>
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md">
								<i class="fa fa-chevron-down"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-12">
							<div class="osl-tree-search" data-tree-id="req2001Tree"></div>
						</div>
					</div>
					<div class="row kt-margin-t-25">
						<div class="col-12">
							<div class="osl-tree kt-scroll"
								data-height:"500" id="req2001Tree"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12">
			
			<div class="kt-portlet kt-portlet--mobile">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fas fa-layer-group kt-margin-r-5"></i>요구사항 배정 목록
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm4000MstCodeTable" data-datatable-action="select" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1" data-original-title="요구사항 배정 목록 조회">
							<i class="fa fa-list kt-margin-r-5"></i><span>조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm4000MstCodeTable" data-datatable-action="select" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1" data-original-title="요구사항 배정 목록 제외">
							<i class="fas fa-share-square kt-margin-r-5"></i><span>제외</span>
						</button>
					</div>
				</div>
				<div class="kt-portlet__body kt-padding-t-10">
					<div class="kt_datatable kt-margin-b-0" id="req2001ReqAssignTable"></div>
				</div>
			</div>
			
			
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fas fa-info-circle kt-margin-r-5"></i>선택 구성항목 메타 정보
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar"></div>
				</div>
				<div class="kt-portlet__body kt-padding-t-10">
					<div class="kt_datatable kt-margin-b-0" id="req2001MetaInfoTable"></div>
				</div>
			</div>
			
		</div>
		
	</div>



</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand"
		data-dismiss="modal">
		<i class="fa fa-window-close"></i>
		<span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span>
	</button>
</div>


<script>
"use strict";
var OSLReq2001Popup = function () {
	var documentSetting = function(){
		
		
    	new KTPortlet('req2001ConfigurationList', $.osl.lang("portlet"));
		
		
		
		var treeObj = $.osl.tree.setting("req2001Tree",{
			data:{
				url:"<c:url value='/stm/stm6000/stm6000/selectStm6000DeptListAjax.do'/>",
				key: "deptId",
				pKey: "upperDeptId",
				labelKey: "deptName"
			},
			search:{
				
				case_insensitive : true,
				
				show_only_matches: true,
				
				show_only_matches_children: true,
			},
			callback:{
				onclick: function(treeObj,selNode){
					
					
				},
				init: function(treeObj,data){
					
				}
			}
		});
		
		
		
		ktScrollInit("#req2001Tree", "555");
		
		
		$.osl.datatable.setting("req2001ReqAssignTable",{
			data: {
				source: {
					read: {
						
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				 pageSize : 3,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [3, 5, 10, 20, 30, 50, 100]
					 }
				 }
			 },
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false},
				{field: '', title: '요구사항 명', textAlign: 'center', width: 200},
				{field: '', title: '순번', textAlign: 'center', width: 50},
				{field: '', title: '처리유형', textAlign: 'center', width: 70},
				{field: '', title: '요청일', textAlign: 'center', width: 70},
			],
			actionBtn:{
				"dblClick": false
			}
		});
		
		
		
		$.osl.datatable.setting("req2001MetaInfoTable",{
			data: {
				source: {
					read: {
						
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				 pageSize : 3,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [3, 5, 10, 20, 30, 50, 100]
					 }
				 }
			 },
			columns: [
				{field: '', title: '메타 정보 명', textAlign: 'center', width: 250},
				{field: '', title: '메타 정보 내용', textAlign: 'center', width: 100},
				{field: '', title: '순서', textAlign: 'center', width: 50}
			],
			actionBtn:{
				"dblClick": false
			}
		});
		
	};
	
	
	function ktScrollInit (targetName, targetHeight) {
		KTUtil.scrollInit($(targetName)[0], {
	   		
	         disableForMobile: true, 
	         
	         resetHeightOnDestroy: true, 
	         
	         handleWindowResize: true, 
	         
	         height: targetHeight
	    });
	}
	
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLReq2001Popup.init();
});
</script>

