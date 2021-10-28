<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="row">
	<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>메뉴 목록
					</h4>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-group">
						<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-tree-id="stm2000MenuTree" data-tree-action="allNodeOpen"><i class="fa fa-plus"></i></a>
						<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 접기" data-tree-id="stm2000MenuTree" data-tree-action="allNodeClose"><i class="fa fa-minus"></i></a>
						<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-12">
						<div class="osl-tree-search" data-tree-id="stm2000MenuTree"></div>
					</div>
				</div>
				<div class="kt-separator kt-separator--space-sm kt-separator--border-solid"></div>
				<div class="row">
					<div class="col-12">
						<div class="osl-tree kt-scroll" data-height="770" id="stm2000MenuTree"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile" id="stm2000MenuTreeInfo">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>메뉴 정보
					</h4>
				</div>
				<div class="kt-portlet__head-toolbar">
					
					<div class="kt-portlet__head-wrapper kt-margin-r-10">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-tree-id="stm2000MenuTree" data-tree-action="select" title="메뉴 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span>조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-tree-id="stm2000MenuTree" data-tree-action="insert" title="메뉴 추가" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
							<i class="fa fa-plus"></i><span>추가</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-tree-id="stm2000MenuTree" data-tree-action="update" title="메뉴 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
							<i class="fa fa-edit"></i><span>수정</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-tree-id="stm2000MenuTree" data-tree-action="delete" title="메뉴 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
							<i class="fa fa-trash-alt"></i><span>삭제</span>
						</button>
					</div>
					
					<div class="kt-portlet__head-group">
						<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<form class="kt-form" id="frStm2000">
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-align-left kt-margin-r-5"></i>상위 메뉴 ID</label>
								<input type="text" class="form-control" placeholder="상위 메뉴 ID" name="upperMenuId" id="upperMenuId" readonly="readonly">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-file-alt kt-margin-r-5"></i>상위 메뉴 명</label>
								<input type="text" class="form-control" placeholder="상위 메뉴 명" name="upMenuNm" id="upMenuNm" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-align-left kt-margin-r-5"></i>메뉴 ID</label>
								<input type="text" class="form-control" placeholder="메뉴 ID" id="menuId" name="menuId" readonly="readonly" >
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-file-alt kt-margin-r-5"></i>메뉴 명</label>
								<input type="text" class="form-control" placeholder="메뉴 명" name="menuNm" id="menuNm" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-edit kt-margin-r-5"></i>메뉴 경로</label>
								<input type="text" class="form-control" placeholder="메뉴 경로" name="menuPath" id="menuPath" readonly="readonly">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-edit kt-margin-r-5"></i>메뉴 URL</label>
								<input type="text" class="form-control" placeholder="메뉴 URL" name="menuUrl" id="menuUrl" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-image kt-margin-r-5"></i>메뉴 이미지 URL</label>
								<input type="text" class="form-control" placeholder="메뉴 이미지 URL" name="menuImgUrl" id="menuImgUrl" readonly="readonly">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-info-circle kt-margin-r-5"></i>메뉴 아이콘</label>
								<input type="text" class="form-control" placeholder="메뉴 아이콘" name="menuIcon" id="menuIcon" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-folder-open kt-margin-r-5"></i>메뉴 타입</label>
								<input type="text" class="form-control" placeholder="메뉴 타입" name="menuTypeNm" id="menuTypeNm" readonly="readonly">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-sliders-h kt-margin-r-5"></i>메뉴 레벨</label>
								<input type="text" class="form-control" placeholder="메뉴 레벨" name="lvl" id="lvl" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-list-ol kt-margin-r-5"></i>순번</label>
								<input type="text" class="form-control" placeholder="순번" name="ord" id="ord" readonly="readonly">
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-check-square kt-margin-r-5"></i>사용 유무</label>
								<input type="text" class="form-control" placeholder="사용 유무" name="useNm" id="useNm" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group kt-align-left">
								<label><i class="fa fa-project-diagram kt-margin-r-5"></i>프로젝트 유형</label>
								<input type="text" class="form-control" placeholder="프로젝트 유형" name="prjTypeNm" id="prjTypeNm" readonly="readonly">
							</div>
						</div>
						<div class="col-xl-6">

						</div>
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>메뉴 설명</label>
						<div class="form-control h-100 osl-min-height--12rem" id="menuDesc"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
"use strict";
var treeObj;
var OSLStm2000 = function () {
	
	var formId = "frStm2000";
	
	var documentSetting = function(){
  		
		
		treeObj = $.osl.tree.setting("stm2000MenuTree",{
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
		
		
		
		
		$("#stm2000MenuTreeInfo").find("button[data-tree-id='stm2000MenuTree']").click(function(){
			
			
			var action = $(this).data("tree-action");
			if(action != "select"){
				
				var selectNodeIds = treeObj.jstree("get_selected");
				
				if($.osl.isNull(selectNodeIds)){
					$.osl.alert("왼쪽 트리에서 메뉴를 선택해주세요.");
					return false;
				}
				
				
				var selectNode = treeObj.jstree().get_node(selectNodeIds[0]);
				var nodeData = selectNode.original;
				
				
				if(action == "insert"){
					
					
					if(nodeData.lvl >= 3){
						$.osl.alert("3레벨 이상 메뉴를 추가할 수 없습니다.");
						return false;
					}
					
					
					if(nodeData.useCd == "02"){
						$.osl.alert("미사용 메뉴에는 하위 메뉴를 추가할 수 없습니다.");
						return false;
					}
					
					
					var data = {
							type:"insert",
							upperMenuId : nodeData.menuId,
							upMenuNm : nodeData.menuNm,
							lvl : nodeData.lvl +1, 
							moduleType : nodeData.moduleType
					};
					var options = {
							idKey: nodeData.menuId,
							modalTitle: "신규 메뉴 등록",
							closeConfirm: false
					};
					
					$.osl.layerPopupOpen('/stm/stm2000/stm2000/selectStm2001View.do',data, options);
					
				
				}else if(action == "update"){
					
					
					var data = {
							type:"update",
							menuId : nodeData.menuId,
							lvl : nodeData.lvl
					};
					var options = {
							idKey: nodeData.menuId,
							modalTitle: "메뉴 수정",
							closeConfirm: false
					};
					
					$.osl.layerPopupOpen('/stm/stm2000/stm2000/selectStm2001View.do',data,options);
					
				
				}else if(action == "delete"){
					
					
					if(nodeData.lvl == 0 || $.osl.isNull(nodeData.upperMenuId)){
						$.osl.alert("최상위 메뉴(root)는 삭제할 수 없습니다.");
					
					}else if(!$.osl.isNull(selectNode.children)){
						$.osl.alert("하위 메뉴가 존재하기때문에 삭제할 수 없습니다. <br/>하위메뉴를 먼저 삭제해주세요.");
					}else{
						
						deleteMenuInfo(nodeData);
					}
				}
			}
		
		});
		
		
		KTUtil.scrollInit($("#stm2000MenuTree")[0], {
	        disableForMobile: true, 
	        resetHeightOnDestroy: true, 
	        handleWindowResize: true, 
	        height: 770
	    });
		
	};
	
    
	var selectMenuInfo = function(menuId) {
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2000/selectStm2000MenuInfoAjax.do'/>", "async": false}
				,{"menuId": menuId});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				$("#"+formId)[0].reset();
				
				
		    	$.osl.setDataFormElem(data.menuInfoMap,"frStm2000", ["upperMenuId", "upMenuNm", "menuId", "menuNm", "menuPath", "menuUrl", "menuImgUrl", "menuIcon","menuTypeNm", "lvl", "ord", "useNm", "prjTypeNm"]);
			
				
				if($.osl.isNull(data.menuInfoMap.upperMenuId)){
					$("#upperMenuId").val("-");
				}
				
				
				if($.osl.isNull(data.menuInfoMap.upMenuNm)){
					$("#upMenuNm").val("-");
				}
				
		    	
		    	var menuDesc = data.menuInfoMap.menuDesc;
		    	if(!$.osl.isNull(menuDesc)){
			    	
		    		menuDesc =  $.osl.escapeHtml(menuDesc);
					$("#menuDesc").html(menuDesc.replace(/\n/g, '<br/>'));
				}
				
			}
		});
		
		
		ajaxObj.send();
	};

    
	var deleteMenuInfo = function(selectNodeData){
				 
		$.osl.confirm("메뉴 정보 삭제는 시스템에 중대한 영향을 미칠 수 있습니다. 선택한 메뉴를 삭제 하시겠습니까?",null,function(result) {
	        if (result.value) {
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/stm/stm2000/stm2000/deleteStm2000MenuInfoAjax.do'/>"}
					,{"menuId":selectNodeData.menuId, "upperMenuId":selectNodeData.upperMenuId});

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    			}else{
	    				
	    				$("#"+formId)[0].reset();
	    				
	    				
	    				$.osl.toastr(data.message);
	    				
	    				
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
	OSLStm2000.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />


