<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i> <c:out value="${sessionScope.selMenuNm}" />
			</h4>
		</div>
	</div>
</div>
<div class="row">
	
	<div class="col-xl-4">
		<div class="kt-portlet kt-margin-b-20" id="prj1300TemplateTreeMenu">
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
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="prj1300TemplateTree" data-tree-action="insert" title="템플릿 메뉴 목록 추가" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2" data-original-title="템플릿 메뉴 목록 추가">
							<i class="fa fa-plus"></i><span>등록</span>
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
		
		<div class="kt-portlet">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fas fa-file-signature kt-margin-r-5"></i>기본 항목 목록
					</h5>
				</div>
				
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1301PrjTable" data-datatable-action="preview" title="기본항목 미리보기" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="preview" tabindex="1" data-original-title="기본항목 미리보기">
							<i class="fas fa-eye"></i><span>미리보기</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1301PrjTable" data-datatable-action="select" title="기본항목 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="2" data-original-title="기본항목 조회">
							<i class="fa fa-list"></i><span>조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1301PrjTable" data-datatable-action="insert" title="기본항목 추가" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="3" data-original-title="기본항목 추가">
							<i class="fa fa-plus"></i><span>추가</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1301PrjTable" data-datatable-action="update" title="기본항목 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="4" data-original-title="기본항목 수정">
							<i class="fa fa-edit"></i><span>수정</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1301PrjTable" data-datatable-action="delete" title="기본항목 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="5" data-original-title="기본항목 삭제">
							<i class="fa fa-trash-alt"></i><span>삭제</span>
						</button>
					</div>
				</div>
				
			</div>

			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-12">
						<div class="osl-datatable-search" data-datatable-id="prj1301PrjTable"></div>
					</div>
				</div>
				<div class="kt_datatable" id="prj1301PrjTable"></div>
			</div>
		</div>
		
	</div>
	
</div>

<script>
"use strict";
var OSLPrj1300Popup = function () {
	
	var prj1301PrjTable = "prj1301PrjTable";
	
	var formId = "frPrj1300";
	
	var treeObj = null;
	var templateId = "";
	
	var templateumentSetting = function(){
		
		
		
		
		
		
		
		
		treeObj = $.osl.tree.setting("prj1300TemplateTree",{
			data:{
				url:"<c:url value='/prj/prj1000/prj1300/selectPrj1300TemplateListAjax.do'/>",
				param:{
					paramPrjId: $.osl.selPrjId,
				},
				key: "templateId",
				pKey: "upperTemplateId",
				labelKey: "templateNm"
			},
			search:{
				
				case_insensitive : true,
				
				show_only_matches: true,
				
				show_only_matches_children: true,
			},
			callback:{
				onclick: function(treeObj,selNode){
					var targetId = selNode.original.templateId;
					if(templateId == targetId){
						treeObj.jstree("deselect_all");
						templateId = "";
						$.osl.datatable.list[prj1301PrjTable].targetDt.setDataSourceParam("templateId", "");
					}else{
						templateId = targetId;
						$.osl.datatable.list[prj1301PrjTable].targetDt.setDataSourceParam("templateId", targetId);
					}

					$("button[data-datatable-id="+prj1301PrjTable+"][data-datatable-action=select]").click();
				}
			},
			contextmenu: {
				display: ["allNodeOpen","allNodeClose","selNodeOpen","selNodeClose","insert","update","delete"],
				items: {
            		insert : {
            			"separator_before": true,
            			"separator_after": false,
            			"label": $.osl.lang("prj1300.contextmenu.insert"),
            			"title": $.osl.lang("prj1300.contextmenu.insert"),
            			"actionFn": "insert"
            		},
            		update : {
            			"separator_before": false,
            			"separator_after": false,
            			"label": $.osl.lang("prj1300.contextmenu.update"),
            			"title": $.osl.lang("prj1300.contextmenu.update"),
            			"actionFn": "update"
            		},
            		delete : {
            			"separator_before": false,
            			"separator_after": true,
            			"label": $.osl.lang("prj1300.contextmenu.delete"),
            			"title": $.osl.lang("prj1300.contextmenu.delete"),
            			"actionFn": "delete"
            		},
            	}
			},
			actionFn : {
				
				"insert" : function(obj){
					var data = {};
					var options = {};
					
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						data = {
								type:"insert",
								upperTemplateId : "",
								upperTemplateNm : "",
								lvl : 0,
								paramPrjId : $.osl.selPrjId
						};
						options = {
								idKey: "newTemplate",
								modalTitle:  $.osl.lang("prj1300.modal.title.insertTemplate"),
								autoHeight:false,
								closeConfirm: false
						};
					}else{
						
						var selectNode = treeObj.jstree().get_node(selectNodeIds[0]);
						var nodeData = selectNode.original;
						
						
						data = {
								type:"insert",
								upperTemplateId : nodeData.templateId,
								upperTemplateNm : nodeData.templateNm,
								lvl : nodeData.lvl,
								paramPrjId : nodeData.prjId
						};
						options = {
								idKey: nodeData.templateId,
								modalTitle:  $.osl.lang("prj1300.modal.title.insertTemplate"),
								autoHeight:false,
								closeConfirm: false
						};
					}
					
					$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1301View.do',data,options);
				},
				
				"update" : function(obj){
					
					
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj1300.message.alert.treeSelect"));
						return false;
					}
					
					
					var selectNode = treeObj.jstree().get_node(selectNodeIds[0]);
					var nodeData = selectNode.original;
					
					
					var data = {
							type:"update",
							templateId : templateId,
							paramPrjId : nodeData.prjId
					};
					var options = {
							idKey: nodeData.templateId,
							modalTitle: $.osl.lang("prj1300.modal.title.updateTemplate"),  
							autoHeight:false,
							closeConfirm: false
					};
					
					$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1301View.do',data,options);
				},
				
				"delete" :function(obj){
					
					var children = $("#confirmation-list").children('div');
					
					
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj1300.message.alert.treeSelect"));
						return false;
					}
					
					
					var selectNode = treeObj.jstree().get_node(selectNodeIds[0]);
					var nodeData = selectNode.original;
					
					
					deleteTemplateList(nodeData, selectNode.children_d);
					
				},
			}
		});
		
		$.osl.datatable.setting("prj1301PrjTable",{
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
				{field: 'itemCodeNm', title: '항목 분류', textAlign: 'left', width: 150, autoHide: false, search: true, searchType:"select", searchCd: "FLW00001", searchField:"itemCode", sortField: "itemCode"},
				{field: 'itemTypeNm', title: '항목 타입', textAlign: 'center', width: 200, autoHide: false, search: true, searchType:"select", searchCd: "FLW00003", searchField:"itemType", sortField: "itemType",
					template: function (row) {
						if($.osl.isNull(row.itemTypeNm)){
							return "-";
						}else{
							return row.itemTypeNm;
						}
					}
				},
				{field: 'itemEssentialNm', title: '필수', textAlign: 'center', width: 100},
				{field: 'itemOrd', title: '순서', textAlign: 'center', width: 100}
				
			],
			actionBtn:{
				"title": $.osl.lang("datatable.action.functionNm"),
				"width": 100,
				
			},
			actionTooltip:{
				"update": $.osl.lang("prj1301.actionBtn.updateBtn"),
				"delete": $.osl.lang("prj1301.actionBtn.deleteBtn")
			},
			actionFn:{
				"preview":function(rowData, datatableId, type, rowNum, elem){
					
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj1300.message.alert.treeSelect"));
						return false;
					}
					var data = {};
					if($.osl.isNull(rowData)){
						data = {
							type:"preview",
							paramPrjId: $.osl.selPrjId,
							paramTemplateId: templateId
						};
					}else{
						
						data = {
							type:"preview",
							paramPrjId: $.osl.selPrjId,
							paramTemplateId: templateId,
							paramDataList: JSON.stringify(rowData)
						};
					}
					
					
					var options = {
							idKey: rowData.reqId,
							modalTitle: "기본항목 미리보기",
							closeConfirm: false,
							autoHeight: false
						};
					
					$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1303View.do',data,options);
				},
				"insert":function(rowData, datatableId, type, rowNum, elem){
					
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj1300.message.alert.treeSelect"));
						return false;
					}
					
					var data = {
							type:"insert",
							paramPrjId: $.osl.selPrjId,
							paramTemplateId: templateId
						};
					var options = {
							idKey: rowData.reqId,
							modalTitle: $.osl.lang("prj1300.modal.title.insertItem"),
							closeConfirm: false,
							autoHeight: false
						};
					
					$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1302View.do',data,options);
				},
				"update":function(rowData, datatableId, type, rowNum, elem){
					
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj1300.message.alert.treeSelect"));
						return false;
					}
					
					var data = {
							type:"update",
							paramPrjId: rowData.prjId,
							paramTemplateId: rowData.templateId,
							paramItemId: rowData.itemId
						};
					var options = {
							idKey: rowData.reqId,
							modalTitle: $.osl.lang("prj1300.modal.title.updateItem"),
							closeConfirm: false,
							autoHeight: false
						};
					
					$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1302View.do',data,options);
				},

				"delete":function(rowDatas, datatableId, type, rowNum, elem){
					
					var selectNodeIds = treeObj.jstree("get_selected");
					if($.osl.isNull(selectNodeIds)){
						$.osl.alert($.osl.lang("prj1300.message.alert.treeSelect"));
						return false;
					}
					
					
					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/prj/prj1000/prj1300/deletePrj1302ItemAjax.do'/>"}
							,{deleteDataList: JSON.stringify(rowDatas)});
					
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
			   				$.osl.alert(data.message,{type: 'error'});
			   			}else{
			   				
			   				$.osl.toastr(data.message);
			   				
			   				$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
			   			}
					});
					
					
					ajaxObj.send();
				}
			}
		});
	}
	
	
	var deleteTemplateList = function(selectNodeData, childrenIds){
		
		
		var delTemplateList = [];
		
		
		delTemplateList.push({"templateId":selectNodeData.templateId, "upperTemplateId":selectNodeData.upperTemplateId, "templateNm":selectNodeData.templateNm, "prjId" : selectNodeData.prjId});
		
		$.each(childrenIds, function(idx, treeNodeId){
			
			var childNodeData = treeObj.jstree().get_node(treeNodeId).original;
			delTemplateList.push({"templateId":childNodeData.templateId, "upperTemplateId":childNodeData.upperTemplateId, "templateNm":childNodeData.templateNm, "prjId" : selectNodeData.prjId});
		});
		
		$.osl.confirm($.osl.lang("prj1300.message.confirm.deleteTemplate"),null,function(result) {
	        if (result.value) {
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/prj/prj1000/prj1300/deletePrj1300PrjTemplateAjax.do'/>"}
					,{deleteDataList: JSON.stringify(delTemplateList)});

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    			}else{
	    				
	    				$.osl.toastr(data.message);
	    				
	    				
	    				$("button[data-tree-id=prj1300TemplateTree][data-tree-action=select]").click();
	    				
	    				$("button[data-datatable-id=prj1301PrjTable][data-datatable-action=select]").click();
	    			}
	    		});
	    		
	    		
	    		ajaxObj.send();
	        }
	    });
		 
	}
	
	return {
	       
        init: function() {
        	templateumentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLPrj1300Popup.init();
});

</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
