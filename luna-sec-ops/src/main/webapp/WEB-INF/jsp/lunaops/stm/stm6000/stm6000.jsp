<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="row">
	<div class="col-xl-4">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm6000.title.deptList">조직 목록</span>
					</h4>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-group">
						<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-title-lang-cd="tree.label.contextmenu.allNodeOpen" data-tree-id="stm6000DeptTree" data-tree-action="allNodeOpen">
							<i class="fa fa-plus"></i>
						</a>
						<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 접기" data-title-lang-cd="tree.label.contextmenu.allNodeClose" data-tree-id="stm6000DeptTree" data-tree-action="allNodeClose">
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
						<div class="osl-tree-search" data-tree-id="stm6000DeptTree"></div>
					</div>
				</div>
				<div class="kt-separator kt-separator--space-sm kt-separator--border-solid"></div>
				<div class="row">
					<div class="col-12">
						<div class="osl-tree kt-scroll" data-height="410" id="stm6000DeptTree"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-8 ">
		<div class="kt-portlet kt-portlet--mobile" id="stm6000DeptTreeInfo">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm6000.title.deptInfo">조직 정보</span>
					</h4>
				</div>
				<div class="kt-portlet__head-toolbar">
					
					<div class="kt-portlet__head-wrapper kt-margin-r-10">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="stm6000DeptTree" data-tree-action="select" title="조직 조회" data-title-lang-cd="stm6000.button.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="stm6000DeptTree" data-tree-action="insert" title="조직 추가" data-title-lang-cd="stm6000.button.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
							<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="stm6000DeptTree" data-tree-action="update" title="조직 수정" data-title-lang-cd="stm6000.button.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
							<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="stm6000DeptTree" data-tree-action="delete" title="조직 삭제" data-title-lang-cd="stm6000.button.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
							<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
						</button>
					</div>
					
				</div>
			</div>
			<div class="kt-portlet__body">
				<form class="kt-form" id="frStm6000">
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="stm6000.label.upperDeptId">상위 조직 ID</span></label>
								<input type="text" class="form-control" placeholder="상위 조직 ID" name="upperDeptId" id="upperDeptId" readonly="readonly">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm6000.label.upperDeptNm">상위 조직 명</span></label>
								<input type="text" class="form-control" placeholder="상위 조직 명" name="upperDeptNm" id="upperDeptNm" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="stm6000.label.deptId">조직 ID</span></label>
								<input type="text" class="form-control" placeholder="조직 ID" id="deptId" name="deptId" readonly="readonly" >
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm6000.label.deptNm">조직명</span></label>
								<input type="text" class="form-control" placeholder="조직 명" name="deptName" id="deptName" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="stm6000.label.deptOrd">순번</span></label>
								<input type="text" class="form-control" placeholder="순번" name="ord" id="ord" readonly="readonly">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="stm6000.label.deptUseCd">사용유무</span></label>
								<input type="text" class="form-control" placeholder="사용유무"  name="useNm" id="useNm" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm6000.label.deptEtc">비고</span></label>
						<div class="form-control h-100 osl-min-height--12rem" id="deptEtc"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
"use strict";
var OSLStm6000Popup = function () {
	var treeObj;
	
	var formId = "frStm6000";
	
	var documentSetting = function(){
  		
		
		treeObj = $.osl.tree.setting("stm6000DeptTree",{
			data:{
				url:"<c:url value='/stm/stm6000/stm6000/selectStm6000DeptListAjax.do'/>",
				key: "deptId",
				pKey: "upperDeptId",
				labelKey: "deptName",
				type: "useCd"
			},
			types : {
                "02" : {"icon" : " fa fa-eye-slash"}
            },
			search:{
				
				case_insensitive : true,
				
				show_only_matches: true,
				
				show_only_matches_children: true,
			},
			actionFn:{
				"insert":function(treeObj, nodeData){
					if($.osl.isNull(nodeData)){
						$.osl.alert($.osl.lang("stm6000.message.alert.treeSelect"));
						return false;
					}
					
					
					if(nodeData.useCd == "02"){
						$.osl.alert($.osl.lang("stm6000.message.alert.notUsedDept"));
						return false;
					}
					
					
					var data = {
							type:"insert",
							upperDeptId : nodeData.deptId,
							upperDeptNm : nodeData.deptName,
							lvl : nodeData.lvl
					};
					var options = {
							idKey: nodeData.deptId,
							modalTitle: $.osl.lang("stm6000.modal.title.insertDept"),
							autoHeight:false,
							closeConfirm: false
					};
					
					$.osl.layerPopupOpen('/stm/stm6000/stm6000/selectStm6001View.do',data,options);
				},
				"update": function(treeObj, nodeData){
					if($.osl.isNull(nodeData)){
						$.osl.alert($.osl.lang("stm6000.message.alert.treeSelect"));
						return false;
					}
					
					
					var data = {
							type:"update",
							deptId : nodeData.deptId
					};
					var options = {
							idKey: nodeData.deptId,
							modalTitle: $.osl.lang("stm6000.modal.title.updateDept"),
							closeConfirm: false
					};
					
					$.osl.layerPopupOpen('/stm/stm6000/stm6000/selectStm6001View.do',data,options);
				},
				"delete": function(treeObj, nodeData){
					if($.osl.isNull(nodeData)){
						$.osl.alert($.osl.lang("stm6000.message.alert.treeSelect"));
						return false;
					}

					
					if(nodeData.lvl == 0 || $.osl.isNull(nodeData.upperDeptId)){
						$.osl.alert($.osl.lang("stm6000.message.alert.notRootDelete"));
					}else{
						
						deleteDeptList(nodeData, selectNode.children_d);
					}
				}
			},
			callback:{
				onclick: function(treeObj,selNode){
					
					selectDeptInfo(selNode.original.deptId);
				},
				init: function(treeObj,data){
					
				}
			}
		});
		
		
		KTUtil.scrollInit($("#stm6000DeptTree")[0], {
	        disableForMobile: true, 
	        resetHeightOnDestroy: true, 
	        handleWindowResize: true, 
	        height: 410
	    });
	};
	
    
	var selectDeptInfo = function(deptId) {
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm6000/stm6000/selectStm6000DeptInfoAjax.do'/>", "async": false}
				,{"deptId": deptId});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				$("#"+formId)[0].reset();
				
				
		    	$.osl.setDataFormElem(data.deptInfoMap,"frStm6000", ["deptId", "upperDeptId", "upperDeptNm", "deptName", "useNm", "ord"]);
			
		    	var deptEtc = data.deptInfoMap.deptEtc;
				
				
				if($.osl.isNull(data.deptInfoMap.upperDeptId)){
					$("#upperDeptId").val("-");
				}
				
				
				if($.osl.isNull(data.deptInfoMap.upperDeptNm)){
					$("#upperDeptNm").val("-");
				}
				
				if(!$.osl.isNull(deptEtc)){
					deptEtc =  $.osl.escapeHtml(deptEtc);
			    	
					$("#deptEtc").html(deptEtc.replace(/\n/g, '<br/>'));
				}
			}
		});
		
		
		ajaxObj.send();
	};


    
	var deleteDeptList = function(selectNodeData, childrenIds){
		
		
		var delDeptList = [];
		
		
		delDeptList.push({"deptId":selectNodeData.deptId, "upperDeptId":selectNodeData.upperDeptId, "deptName":selectNodeData.deptName});

		
		$.each(childrenIds, function(idx, treeNodeId){
			
			var childNodeData = treeObj.jstree().get_node(treeNodeId).original;
			delDeptList.push({"deptId":childNodeData.deptId, "upperDeptId":childNodeData.upperDeptId, "deptName":childNodeData.deptName});
		});
		
		$.osl.confirm($.osl.lang("stm6000.message.confirm.deleteDept"),null,function(result) {
	        if (result.value) {
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/stm/stm6000/stm6000/deleteStm6000DeptInfoAjax.do'/>"}
					,{deleteDataList: JSON.stringify(delDeptList)});

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    			
	    			}else if(data.checkYn == "Y"){

	    				
	    				var deptNmStr = "";
	    				
	    				if(!$.osl.isNull(data.result.resultData)){
		    				$.each(data.result.resultData, function(idx, deptNm){
		    					deptNmStr += deptNm + ", ";
		    				});
		    				
		    				deptNmStr = deptNmStr.substring(0, deptNmStr.lastIndexOf(","));
	    				}
	    				
	    				
	    				$.osl.alert(data.result.message, {text:deptNmStr, type:"warning"});
	    			}else{
	    				
	    				$.osl.toastr(data.message);
	    				
	    				
	    				$("#"+formId)[0].reset();
	    				
	    				
	    			}
	    		});
	    		
	    		
	    		ajaxObj.send();
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
	OSLStm6000Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />