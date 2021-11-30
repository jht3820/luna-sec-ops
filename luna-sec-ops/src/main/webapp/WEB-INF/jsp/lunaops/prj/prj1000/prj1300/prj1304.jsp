<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" id="callPage" name="callPage" value="${param.callPage}">
<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
<div class="row">
	
	<div class="col-xl-4">
		<div class="kt-portlet osl-content__border--light kt-margin-b-20" id="prj1300TemplateTreeMenu">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fas fa-copy kt-margin-r-5"></i>대상 목록
					</h5>
				</div>
				
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="prj1300TemplateTree" data-tree-action="select" title="템플릿 메뉴 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1" data-original-title="템플릿 메뉴 목록 조회">
							<i class="fa fa-list"></i><span>조회</span>
						</button>
					</div>
					<div class="kt-portlet__head-group">
						<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-tree-id="prj1300TemplateTree" data-tree-action="allNodeOpen"><i class="fa fa-plus"></i></a> 
						<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 접기" data-tree-id="prj1300TemplateTree" data-tree-action="allNodeClose"> <i class="fa fa-minus"></i> </a> 
					</div>
				</div>
				
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-12">
						<div class="osl-tree-search" data-tree-id="prj1300TemplateTree"></div>
					</div>
				</div>
				<div class="row kt-margin-t-20">
					<div class="col-12">
						<div class="osl-tree kt-scroll" data-height="410" id="prj1300TemplateTree"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="col-xl-8">
		
		<div class="kt-portlet osl-content__border--light">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fas fa-file-signature kt-margin-r-5"></i>기본 항목 목록
					</h5>
				</div>
				
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1304PrjTable" data-datatable-action="itemAllSelect" title="기본항목 전체선택" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="allSelect" tabindex="1" data-original-title="기본항목 전체선택">
							<i class="fa fa-external-link-alt"></i><span>전체선택</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1304PrjTable" data-datatable-action="itemSelect" title="기본항목 선택" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="2" data-original-title="기본항목 선택">
							<i class="fa fa-external-link-alt"></i><span>선택</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1304PrjTable" data-datatable-action="select" title="기본항목 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="3" data-original-title="기본항목 조회">
							<i class="fa fa-list"></i><span>조회</span>
						</button>
					</div>
				</div>
				
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-12">
						<div class="osl-datatable-search" data-datatable-id="prj1304PrjTable"></div>
					</div>
				</div>
				<div class="kt_datatable" id="prj1304PrjTable"></div>
			</div>
		</div>
		
	</div>
	
</div>
<button type="button" class="kt-hide" id="prj1304ModalCallBackBtn" name="prj1304ModalCallBackBtn"></button>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<script>
"use strict";
var OSLPrj1304Popup = function () {
	
	var formId = 'frPrj1302';
	
	var prj1304PrjTable = "prj1304PrjTable";
	
	//호출 페이지
	var callPage = $("#callPage").val();
	var paramPrjId = $("#paramPrjId").val();
	
	var itemList=[];
	
	var treeObj = null;
	var templateId = "";
	
	var templateumentSetting = function(){
		
		if($.osl.isNull(paramPrjId)){
			console.log(paramPrjId);
			paramPrjId = $.osl.selPrjId;
			console.log(paramPrjId);
		}
		
		//Portlet 세팅
		//new KTPortlet('prj1300TemplateTreeMenu', $.osl.lang("portlet"));
		
		/**************************************/
		/* 트리 메뉴 및 관련 메서드 시작                                      */
		/**************************************/
		// 조직 tree 세팅
		treeObj = $.osl.tree.setting("prj1300TemplateTree",{
			data:{
				url:"<c:url value='/prj/prj1000/prj1300/selectPrj1300TemplateListAjax.do'/>",
				param:{
					"paramPrjId": paramPrjId
				},
				key: "templateId",
				pKey: "upperTemplateId",
				labelKey: "templateNm"
			},
			search:{
				//대소문자 구분
				case_insensitive : true,
				//검색 결과 노드만 표시
				show_only_matches: true,
				//show_only_matches: true 일때 하위 노드도 같이 표시 할건지
				show_only_matches_children: true,
			},
			callback:{
				onclick: function(treeObj,selNode){
					var targetId = selNode.original.templateId;
					if(templateId == targetId){
						treeObj.jstree("deselect_all");
						templateId = "";
						$.osl.datatable.list[prj1304PrjTable].targetDt.setDataSourceParam("templateId", "");
					}else{
						templateId = targetId;
						$.osl.datatable.list[prj1304PrjTable].targetDt.setDataSourceParam("templateId", targetId);
					}

					$("button[data-datatable-id="+prj1304PrjTable+"][data-datatable-action=select]").click();
				}
			},
			contextmenu: {
				display: ["allNodeOpen","allNodeClose","selNodeOpen","selNodeClose"],
			},
		});
		
		$.osl.datatable.setting("prj1304PrjTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1300/selectPrj1302ItemListAjax.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'itemNm', title: '항목명', textAlign: 'center', width: 150, autoHide: false, search: true},
				{field: 'itemCodeNm', title: '항목 분류', textAlign: 'left', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "FLW00001", searchField:"itemCode", sortField: "itemCode"},
				{field: 'itemTypeNm', title: '항목 타입', textAlign: 'center', width: 150, autoHide: false, search: true, searchType:"select", searchCd: "FLW00003", searchField:"itemType", sortField: "itemType",
					template: function (row) {
						if($.osl.isNull(row.itemTypeNm)){
							return "-";
						}else{
							return row.itemTypeNm;
						}
					}
				},
				{field: 'itemEssentialNm', title: '필수', textAlign: 'center', width: 100},
				
			],
			actionBtn:{
				"title": "기능",
				"width": 100,
				"update": false,
				"delete": false,
				"itemSelect": true,
				/* ,"click": true */
			},
			actionTooltip:{
				"itemSelect": "선택",
			},
			actionFn:{
				"itemSelect":function(rowDatas, datatableId, type, rowNum, elem){
					if($.osl.isNull(rowDatas)){
						$.osl.alert($.osl.lang("prj1302.message.confirm.itemNotSelect"));
						return;
					}
		        	itemList = [];
		        	if(Array.isArray(rowDatas)){
		        		itemList = rowDatas;
		        	}else{
		        		itemList.push(rowDatas);
		        	}
		        	//itemId 생성
		        	$.each(itemList, function(idx, map){
		        		var separator = "";
		        		if(idx<10){
		        			separator = "0"+idx
		        		}else{
		        			separator = idx
		        		}
	        			map.itemId = 'ITM'+new Date().format('yyMMddHHmmssms')+separator;
		        	});
		        	
		        	//OSLPrj1102Popup.addItemList(itemList);

		        	$("#prj1304ModalCallBackBtn").click();
		        	
					//모달 창 닫기
					$.osl.layerPopupClose();
				},
				"itemAllSelect": function(rowDatas, datatableId, type, rowNum, elem){
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj1300.message.alert.treeSelect"));
						return false;
					}
					
		        	itemList = [];
	        		itemList = $.osl.datatable.list.prj1304PrjTable.targetDt.lastResponse.meta.allItemList;
	        		
		        	//itemId 생성
		        	$.each(itemList, function(idx, map){
		        		var separator = "";
		        		if(idx<10){
		        			separator = "0"+idx
		        		}else{
		        			separator = idx
		        		}
	        			map.itemId = 'ITM'+new Date().format('yyMMddHHmmssms')+separator;
		        	});
		        	
		        	//OSLPrj1102Popup.addItemList(itemList);

		        	$("#prj1304ModalCallBackBtn").click();
		        	
					//모달 창 닫기
					$.osl.layerPopupClose();
				}
			},
			theme:{
				actionBtn:{
					"itemSelect" : ""
				},
				actionBtnIcon:{
					"itemSelect" : "fa fa-external-link-alt",
				}
			}
		});
		
	}
	
	return {
	       // public functions
        init: function() {
        	templateumentSetting();
        },
        getItemList: function(){
        	return itemList;
        }
        
    };
}();

//Initialization
$.osl.ready(function(){
	OSLPrj1304Popup.init();
});

	
</script>