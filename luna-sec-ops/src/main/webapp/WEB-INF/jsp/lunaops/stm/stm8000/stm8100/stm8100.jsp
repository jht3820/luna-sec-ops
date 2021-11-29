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
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
			</div>
		</div>
	</div>
</div>
<div class="row">
	
	<div class="col-lg-3 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile  kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm8100.title.allProjectList">전체 프로젝트 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-group">
						<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-title-lang-cd="tree.label.contextmenu.allNodeOpen" data-tree-id="stm8100LicPrjTree" data-tree-action="allNodeOpen">
							<i class="fa fa-plus"></i>
						</a>
						<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 접기" data-title-lang-cd="tree.label.contextmenu.allNodeClose" data-tree-id="stm8100LicPrjTree" data-tree-action="allNodeClose">
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
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="osl-tree-search" data-tree-id="stm8100LicPrjTree"></div>
					</div>
				</div>
				<div class="kt-separator kt-separator--space-sm kt-separator--border-solid"></div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="osl-tree kt-scroll" data-height="566" id="stm8100LicPrjTree"></div>
					</div>
				</div>
			</div>
		</div>
	</div> 
	
	
	
	<div class="col-lg-9 col-md-12 col-sm-12 col-12">
		
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm8100.title.assRepList">소스 저장소 배정 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8100AssignStrgTable" data-datatable-action="select" title="소스 저장소 배정 목록 조회" data-title-lang-cd="stm8100.toolTip.selectAssignStrg" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8100AssignStrgTable" data-datatable-action="removeStrg" title="소스 저장소 배정 제외" data-title-lang-cd="stm8100.toolTip.removeStrg" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="removeStrg" tabindex="2">
							<i class="fa fa-arrow-alt-circle-down"></i><span data-lang-cd="stm8100.actionBtn.removeBtn">제외</span>
						</button>
						<div class="btn-group" role="group">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8100AssignStrgTable" data-datatable-action="authSetting" title="리비전 및 소스코드 열림 권한 설정" data-title-lang-cd="stm8100.toolTip.authSetting" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="authSetting" tabindex="3">
							<i class="fas fa-users-cog"></i><span data-lang-cd="stm8100.actionBtn.authSetting">권한 설정</span>
						</button>
					</div>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-6 col-md-7 col-sm-12 col-12">
						<div class="osl-datatable-search kt-margin-b-0 kt-margin-r-10" data-datatable-id="stm8100AssignStrgTable"></div>
					</div>
				</div>
				<div class="kt_datatable" id="stm8100AssignStrgTable"></div>
			</div>
		</div>
		
		
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm8100.title.nonAssRepList">소스 저장소 미배정 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8100NonAssignStrgTable" data-datatable-action="select" title="소스 저장소 미배정 목록 조회" data-title-lang-cd="stm8100.toolTip.selectNonAssignStrg" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8100NonAssignStrgTable" data-datatable-action="addStrg" title="소스 저장소 배정" data-title-lang-cd="stm8100.toolTip.addStrg" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="addStrg" tabindex="2">
							<i class="fa fa-arrow-alt-circle-up"></i><span data-lang-cd="stm8100.actionBtn.addBtn">배정</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-6 col-md-7 col-sm-12 col-12">
						<div class="osl-datatable-search kt-margin-b-0 kt-margin-r-10" data-datatable-id="stm8100NonAssignStrgTable"></div>
					</div>
				</div>
				<div class="kt_datatable" id="stm8100NonAssignStrgTable"></div>
			</div>
		</div>
		
	</div> 
	
</div>

<script>
"use strict";
var OSLStm8100 = function () {
	
	var treetableId = "stm8100LicPrjTree";
	
	var strgAssDatatableId = "stm8100AssignStrgTable";
	
	var strgNonAssDatatableId = "stm8100NonAssignStrgTable";
	
	
	var prjTreeObj;
	
	
	var selPrjId;
	
	var selPrjNm;
	
	var selPrjGrpId;
	
	
	var assList = [];
	
	var nonAssList = [];
	
	var documentSetting = function(){
		
		
		prjTreeObj = $.osl.tree.setting(treetableId,{
			data:{
				url:"<c:url value='/stm/stm1000/stm1000/selectStm1000LicencePrjAllListAjax.do'/>",
				key: "prjId",
				pKey: "prjGrpId",
				labelKey: "prjNm"
			},
			search:{
				
				case_insensitive : true,
				
				show_only_matches: true,
				
				show_only_matches_children: true,
			},
			callback:{
				onclick: function(treeObj,selNode){
					
					if($.osl.isNull(selNode) || $.osl.isNull(selNode.original)){
						$.osl.alert($.osl.lang("stm8100.message.alert.treeNodeSelect"));
						return false;
					}
					
					
					var prjGrpCd = selNode.original.prjGrpCd;

					
					if(prjGrpCd == "01"){
						$.osl.toastr($.osl.lang("stm8100.message.toastr.projectSelect"));
						return false;
					}
					
					
					selPrjId = selNode.original.prjId;
					selPrjNm = selNode.original.prjNm;
					selPrjGrpId = selNode.original.prjGrpId;
					
					
					
					searchReset(strgAssDatatableId);
					
					$("button[data-datatable-id="+strgAssDatatableId+"][data-datatable-action=select]").click();
					
					searchReset(strgNonAssDatatableId);
					
					$("button[data-datatable-id="+strgNonAssDatatableId+"][data-datatable-action=select]").click();
					
					
					
					var assDataTableTarget = $.osl.datatable.list[strgAssDatatableId].targetDt;
					
					var notAssDataTableTarget = $.osl.datatable.list[strgNonAssDatatableId].targetDt;
					
					
					assDataTableTarget.setDataSourceParam("prjGrpId", selPrjGrpId);
					assDataTableTarget.setDataSourceParam("prjId", selPrjId);
					$("button[data-datatable-id="+strgAssDatatableId+"][data-datatable-action=select]").click();
					
					
					notAssDataTableTarget.setDataSourceParam("prjGrpId", selPrjGrpId);
					notAssDataTableTarget.setDataSourceParam("prjId", selPrjId);
					$("button[data-datatable-id="+strgNonAssDatatableId+"][data-datatable-action=select]").click();
				}
			}
		});
		
		
		KTUtil.scrollInit($("#"+treetableId)[0], {
	        disableForMobile: true, 
	        resetHeightOnDestroy: true, 
	        handleWindowResize: true, 
	        height: 566
	    });
		
		
		
		
		$.osl.datatable.setting(strgAssDatatableId,{
			data:{
				source:{
					read:{
						url: "/stm/stm8000/stm8100/selectStm8100AssStrgListAjax.do"
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
				{field: 'strgTypeNm', title: '유형', textAlign: 'left', width: 40, search: true, searchType:"select", searchCd: "STM00004", searchField:"strgTypeCd", sortField: "strgTypeCd"},
				{field: 'strgRepTitle', title: '저장소명', textAlign: 'left', width: 200, search: true},
				{field: 'strgTxt', title: '저장소 설명', textAlign: 'left', width: 240, search: true},
				{field: 'strgRepUrl', title: '저장소 URL', textAlign: 'left', width: 240},
			],
			actionBtn:{
				"title" : $.osl.lang("stm8100.assignStrgTable.actionBtn.title"),
				"width" : 50,
				"dblClick": true,
				"removeStrg" : true,
				"authSetting" : true,
				"delete":false,
				"update":false,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("stm8100.assignStrgTable.tooltip.dblClick"),
				"removeStrg" : $.osl.lang("stm8100.assignStrgTable.tooltip.dblClick"),
				"authSetting" : $.osl.lang("stm8100.assignStrgTable.tooltip.authSetting"),
			},
			actionFn:{
				"dblClick": function(rowData, datatableId, type, rowNum, elem){
					$.osl.confirm($.osl.lang("stm8100.assignStrgTable.message.remove"), {"html" : true}, function(result){
						if(result.value){
							assList.push(rowData);
							deleteRepo(selPrjId, JSON.stringify(assList));
						}
					});
				},
				"removeStrg": function(rowData, datatableId, type, rowNum, elem){
					$.osl.confirm($.osl.lang("stm8100.assignStrgTable.message.remove"), {"html" : true}, function(result){
						if(result.value){
							assList = rowData;
							deleteRepo(selPrjId, JSON.stringify(assList));
						}
					});
				},
				"authSetting": function(rowData, datatableId, type, rowNum, elem){
					var strgRepData;
					if(type=="list"){
						if(rowNum == 0){
							$.osl.alert($.osl.lang("stm8100.assignStrgTable.message.selectRep"));
							return false;
						}else if(rowNum ==1){
							strgRepData = rowData[0];
						}else{
							$.osl.alert($.osl.lang("stm8100.assignStrgTable.message.selectOnlyOne"));
							return false;
						}
					}else{
						strgRepData = rowData;
					}
					
					var data = {
							prjGrpId : selPrjGrpId,
							prjId : selPrjId,
							prjNm : selPrjNm,
							strgRepId : strgRepData.strgRepId
					};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.escapeHtml(selPrjNm) + $.osl.escapeHtml(rowData.strgRepTitle) +" "+ $.osl.lang("stm8100.assignStrgTable.title.authPop"),
							closeConfirm: false,
							autoHeight:false,
							ftScrollUse: false
						};
					$.osl.layerPopupOpen('/stm/stm8000/stm8100/selectStm8101View.do',data,options);
				},
			},
			theme:{
				actionBtn:{
					"removeStrg" : " kt-hide",
					"authSetting" :  " kt-hide",
				},
				actionBtnIcon:{
					"dblClick" : "fa fa-arrow-alt-circle-down",
				}
			},
		});
		
		
		$.osl.datatable.setting(strgNonAssDatatableId,{
			data:{
				source:{
					read:{
						url: "/stm/stm8000/stm8100/selectStm8100NonAssStrgListAjax.do"
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
				{field: 'strgTypeNm', title: '유형', textAlign: 'left', width: 40, search: true, searchType:"select", searchCd: "STM00004", searchField:"strgTypeCd", sortField: "strgTypeCd"},
				{field: 'strgRepTitle', title: '저장소명', textAlign: 'left', width: 200, search: true},
				{field: 'strgTxt', title: '저장소 설명', textAlign: 'left', width: 240, search: true},
				{field: 'strgRepUrl', title: '저장소 URL', textAlign: 'left', width: 240},
			],
			actionBtn:{
				"title" : $.osl.lang("stm8100.nonAssignStrgTable.actionBtn.title"),
				"width" : 50,
				"dblClick": true,
				"addStrg" : true,
				"delete":false,
				"update":false,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("stm8100.nonAssignStrgTable.tooltip.dblClick"),
				"addStrg" : $.osl.lang("stm8100.nonAssignStrgTable.tooltip.dblClick"),
			},
			actionFn:{
				"dblClick": function(rowData, datatableId, type, rowNum, elem){
					nonAssList.push(rowData);
					insertRepo(selPrjId, JSON.stringify(nonAssList));
				},
				"addStrg": function(rowData, datatableId, type, rowNum, elem){
					nonAssList = rowData;
					insertRepo(selPrjId, JSON.stringify(nonAssList));
				},
			},
			theme:{
				actionBtn:{
					"addStrg" : " kt-hide"
				},
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-up",
				}
			}
		});
	};
	
	
	var selectBtnClick = function(){
		
		$.osl.datatable.list[strgAssDatatableId].targetDt.setDataSourceParam("prjId", selPrjId);
		$("button[data-datatable-id="+strgAssDatatableId+"][data-datatable-action=select]").click();
		
		$.osl.datatable.list[strgNonAssDatatableId].targetDt.setDataSourceParam("prjId", selPrjId);
		$("button[data-datatable-id="+strgNonAssDatatableId+"][data-datatable-action=select]").click();
	};
	
		
	
	var insertRepo = function(prjId, list){
		 var data = {
				selStrRepList : list,
				prjId : prjId
		};

		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm8000/stm8100/insertStm8100ServerListAjax.do'/>"}
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
	};
		
	
	var deleteRepo = function(prjId, list){
		 var data = {
				selStrRepList : list,
				prjId : prjId
		};
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm8000/stm8100/deleteStm8100ServerListAjax.do'/>"}
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
        },
        reload:function(){
			
			$("button[data-datatable-id="+strgAssDatatableId+"][data-datatable-action=select]").click();
			$("button[data-datatable-id="+strgNonAssDatatableId+"][data-datatable-action=select]").click();
        }
    };
}();

$.osl.ready(function(){
	OSLStm8100.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
