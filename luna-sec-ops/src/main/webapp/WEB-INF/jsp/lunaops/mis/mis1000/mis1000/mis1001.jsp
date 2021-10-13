<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form class="kt-form" id="mis1001">
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__body">
			
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>마일스톤 명</label>
						<input type="text" class="form-control" id="" name="" value="마일스톤 이름" required>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>등록자</label> 
						<input type="text" class="form-control" id="" name="" value="관리자" required>
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>마일스톤 설명</label> 
						<textarea id="misDesc" name="misDesc" value="마일스톤 설명" required></textarea>
					</div>
				</div>
				
				<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
					<div class="border osl-min-h-px--140">차트 1</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
					<div class="border osl-min-h-px--140">차트 2</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
					<div class="border osl-min-h-px--140">차트 3</div>
				</div>
				
			</div>			
			
		</div>
	</div>
	
	
	<div class="kt-portlet kt-portlet--mobile kt-margin-t-20-tablet kt-margin-t-20-mobile">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<h5 class="kt-font-boldest kt-font-brand">
					<i class="fa fa-th-large kt-margin-r-5"></i>요구사항 배정 목록
				</h5>
			</div>
			
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-wrapper">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm float-right btn-elevate btn-elevate-air" data-datatable-id="misDetailTable" data-datatable-action="select" title="스프린트 상세정보 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
						<i class="fa fa-list"></i><span>조회</span>
					</button>
				</div>
			</div>
			
		</div>
		<div class="kt-portlet__body">
			<div class="row">
				
				<div class="col-5">
					<div class="input-group">
						<div class="input-group-prepend"><button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">전체</button>
							<div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="misAssignProcessTable">
								<a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">전체</a>
								<a class="dropdown-item" href="javascript:void(0);" data-field-id="prjNm" data-opt-type="text">프로젝트 그룹명</a>
								<a class="dropdown-item" href="javascript:void(0);" data-field-id="startDt" data-opt-type="date">시작 일자</a>
								<a class="dropdown-item" href="javascript:void(0);" data-field-id="endDt" data-opt-type="date">종료 일자</a>
							</div>
						</div>
						
						<div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="misAssignProcessTable">
							<input type="text" class="form-control" aria-label="검색어를 입력해주세요" disabled="disabled" name="searchData_misAssignProcessTable" id="searchData_misAssignProcessTable" data-datatable-id="misAssignProcessTable">
							<!-- <span class="kt-input-icon__icon kt-input-icon__icon--right"><span><i class="la"></i></span></span>
							<input type="hidden" name="searchStartDt" id="searchStartDt_misAssignProcessTable" data-datatable-id="misAssignProcessTable">
							<input type="hidden" name="searchEndDt" id="searchEndDt_misAssignProcessTable" data-datatable-id="misAssignProcessTable"> -->
						</div>
						<div class="input-group-append">
							<button class="btn btn-brand osl-datatable-search__button" type="button" data-datatable-id="misAssignProcessTable">
								<i class="fa fa-search"></i><span class=""><span>검색</span></span>
							</button>
						</div>
					</div>
				</div>
				

				
				<div class="col-12">
					<div class="kt_datatable kt-margin-b-0" id="misDetailTable"></div>
				</div>
				
			</div>
		</div>
	</div>
	
	
	<div class="row">
		
		<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="mis1001ListTreePortlet">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>배정 산출물 목록
						</h5>
					</div>
					
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-tree-id="mis1001ListTree" data-tree-action="allNodeOpen"><i class="fa fa-plus"></i></a>
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 접기" data-tree-id="mis1001ListTree" data-tree-action="allNodeClose"><i class="fa fa-minus"></i></a>
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm float-right btn-elevate btn-elevate-air kt-margin-l-10" data-datatable-id="" data-datatable-action="select" title="배정 산출물 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
						</div>
					</div>
					
				</div>
				<div class="kt-portlet__body kt-scroll" id="mis1001ListTreePortletBody">
					<div class="osl-tree" id="mis1001ListTree"></div>
				</div>
			</div>
		</div>
		
		
		<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 kt-scroll">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>산출물 목록
						</h5>
					</div>
					
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm float-right btn-elevate btn-elevate-air" data-datatable-id="" data-datatable-action="" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="" data-auth-button="select" tabindex="5">
								<i class="fas fa-file-download"></i><span>전체 다운로드</span>
							</button>
						</div>
					</div>
					
				</div>
				<div class="kt-portlet__body kt-padding-0" id="mis1001ListFilePortletBody">
					
					<div class="osl-uppy-file osl-uppy-file--fullsize">
						<div class="osl-uppy-file-sumnail osl-uppy-file-bg">
							<div class="osl-uppy-file-sumnail-bg"></div>
							<span class="osl-uppy-iconFile">
								<svg aria-hidden="true" focusable="false" class="UppyIcon" width="38" height="38" viewBox="0 0 25 25">
									<g fill="#A7AFB7" fill-rule="nonzero">
										<path d="M5.5 22a.5.5 0 0 1-.5-.5v-18a.5.5 0 0 1 .5-.5h10.719a.5.5 0 0 1 .367.16l3.281 3.556a.5.5 0 0 1 .133.339V21.5a.5.5 0 0 1-.5.5h-14zm.5-1h13V7.25L16 4H6v17z"></path>
										<path d="M15 4v3a1 1 0 0 0 1 1h3V7h-3V4h-1z"></path>
									</g>
								</svg>
							</span>
						</div>
						<div class="osl-uppy-file-info-group">
							<div class="osl-uppy-file-name" title="iconFile">iconFile</div>
							<div class="osl-uppy-file-volume">120 KB</div>
						</div>
					</div>
					<div class="osl-uppy-file osl-uppy-file--fullsize">
						<div class="osl-uppy-file-sumnail osl-uppy-file-bg">
							<div class="osl-uppy-file-sumnail-bg"></div>
							<span class="osl-uppy-iconFile">
								<svg aria-hidden="true" focusable="false" class="UppyIcon" width="38" height="38" viewBox="0 0 25 25">
									<g fill="#A7AFB7" fill-rule="nonzero">
										<path d="M5.5 22a.5.5 0 0 1-.5-.5v-18a.5.5 0 0 1 .5-.5h10.719a.5.5 0 0 1 .367.16l3.281 3.556a.5.5 0 0 1 .133.339V21.5a.5.5 0 0 1-.5.5h-14zm.5-1h13V7.25L16 4H6v17z"></path>
										<path d="M15 4v3a1 1 0 0 0 1 1h3V7h-3V4h-1z"></path>
									</g>
								</svg>
							</span>
						</div>
						<div class="osl-uppy-file-info-group">
							<div class="osl-uppy-file-name" title="iconFile">iconFile</div>
							<div class="osl-uppy-file-volume">120 KB</div>
						</div>
					</div>
					<div class="osl-uppy-file osl-uppy-file--fullsize">
						<div class="osl-uppy-file-sumnail osl-uppy-file-bg">
							<div class="osl-uppy-file-sumnail-bg"></div>
							<span class="osl-uppy-iconFile">
								<svg aria-hidden="true" focusable="false" class="UppyIcon" width="38" height="38" viewBox="0 0 25 25">
									<g fill="#A7AFB7" fill-rule="nonzero">
										<path d="M5.5 22a.5.5 0 0 1-.5-.5v-18a.5.5 0 0 1 .5-.5h10.719a.5.5 0 0 1 .367.16l3.281 3.556a.5.5 0 0 1 .133.339V21.5a.5.5 0 0 1-.5.5h-14zm.5-1h13V7.25L16 4H6v17z"></path>
										<path d="M15 4v3a1 1 0 0 0 1 1h3V7h-3V4h-1z"></path>
									</g>
								</svg>
							</span>
						</div>
						<div class="osl-uppy-file-info-group">
							<div class="osl-uppy-file-name" title="iconFile">iconFile</div>
							<div class="osl-uppy-file-volume">120 KB</div>
						</div>
					</div>
					<div class="osl-uppy-file osl-uppy-file--fullsize">
						<div class="osl-uppy-file-sumnail osl-uppy-file-bg">
							<div class="osl-uppy-file-sumnail-bg"></div>
							<span class="osl-uppy-iconFile">
								<svg aria-hidden="true" focusable="false" class="UppyIcon" width="38" height="38" viewBox="0 0 25 25">
									<g fill="#A7AFB7" fill-rule="nonzero">
										<path d="M5.5 22a.5.5 0 0 1-.5-.5v-18a.5.5 0 0 1 .5-.5h10.719a.5.5 0 0 1 .367.16l3.281 3.556a.5.5 0 0 1 .133.339V21.5a.5.5 0 0 1-.5.5h-14zm.5-1h13V7.25L16 4H6v17z"></path>
										<path d="M15 4v3a1 1 0 0 0 1 1h3V7h-3V4h-1z"></path>
									</g>
								</svg>
							</span>
						</div>
						<div class="osl-uppy-file-info-group">
							<div class="osl-uppy-file-name" title="iconFile">iconFile</div>
							<div class="osl-uppy-file-volume">120 KB</div>
						</div>
					</div>
					<div class="osl-uppy-file osl-uppy-file--fullsize">
						<div class="osl-uppy-file-sumnail osl-uppy-file-bg">
							<div class="osl-uppy-file-sumnail-bg"></div>
							<span class="osl-uppy-iconFile">
								<svg aria-hidden="true" focusable="false" class="UppyIcon" width="38" height="38" viewBox="0 0 25 25">
									<g fill="#A7AFB7" fill-rule="nonzero">
										<path d="M5.5 22a.5.5 0 0 1-.5-.5v-18a.5.5 0 0 1 .5-.5h10.719a.5.5 0 0 1 .367.16l3.281 3.556a.5.5 0 0 1 .133.339V21.5a.5.5 0 0 1-.5.5h-14zm.5-1h13V7.25L16 4H6v17z"></path>
										<path d="M15 4v3a1 1 0 0 0 1 1h3V7h-3V4h-1z"></path>
									</g>
								</svg>
							</span>
						</div>
						<div class="osl-uppy-file-info-group">
							<div class="osl-uppy-file-name" title="iconFile">iconFile</div>
							<div class="osl-uppy-file-volume">120 KB</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
	</div>
</form>


<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand"
		data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>



<script>
"use strict";
var OSLMis1001Popup = function () {
	var documentSetting = function(){

		var formId = 'frMis1001';
		
		
		var formEditList = [];
		
		
		var formValidate = $.osl.validate(formId);
		
		
    	formEditList.push($.osl.editorSetting("misDesc", {
    		toolbar: false,
			disableResizeEditor: false,
			disableDragAndDrop: true,
			disabledEditor: true,
			height:180,
		}));
		
		
		$.osl.datatable.setting("misDetailTable",{
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
								pagesNumber: 3
							}
						}
					 }
				 }
			 },
			columns: [
				{field: '', title: '프로젝트 명', textAlign: 'center', width: 150},
				{field: '', title: '순번', textAlign: 'center', width: 70},
				{field: '', title: '요청제목', textAlign: 'center', width: 100},
				{field: '', title: '처리 결과', textAlign: 'center', width: 100},
				{field: '', title: '등록일', textAlign: 'center', width: 70}
			]
		});
		
		
		
		
		
		ktScrollInit("#mis1001ListTreePortletBody", "350");
		
		ktScrollInit("#mis1001ListfilePortletBody", "350");
		
		
		new KTPortlet('mis1001ListTreePortlet', $.osl.lang("portlet"));
		
		var treeObj = $.osl.tree.setting("mis1001ListTree",{
			data:{
				url:"<c:url value='/stm/stm2000/stm2000/selectStm2000MenuListAjax.do'/>",
				key: "menuId",
				pKey: "upperMenuId",
				labelKey: "menuNm"
			},
			search:{
				
				case_insensitive : true,
				
				show_only_matches: true,
				
				show_only_matches_children: true,
			},
			callback:{
				onclick: function(treeObj,selNode){
					
					selectMenuInfo(selNode.original.menuId);
				},
				init: function(treeObj,data){
					
				}
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
	OSLMis1001Popup.init();
});
</script>

