<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6500">
	<input type="hidden" name="paramDeptNm" id="paramDeptNm" value="${param.deptName}">
	<div class="row">
		<div class="col-xl-5">
			<div class="kt-portlet kt-portlet--mobile" id="cmm6500DeptTreeList">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h4 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>조직 목록
						</h4>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md" data-toggle="kt-tooltip" title="전체 펼치기" data-tree-id="cmm6500DeptTree" data-tree-action="allNodeOpen"><i class="fa fa-plus"></i></a>
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md" data-toggle="kt-tooltip" title="전체 접기" data-tree-id="cmm6500DeptTree" data-tree-action="allNodeClose"><i class="fa fa-minus"></i></a>
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-12">
							<div class="osl-tree-search" data-tree-id="cmm6500DeptTree"></div>
						</div>
					</div>
					<div class="kt-separator kt-separator--space-sm kt-separator--border-solid"></div>
					<div class="row">
						<div class="col-12">
							<div class="osl-tree" id="cmm6500DeptTree"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-7">
			<div class="kt-portlet kt-portlet--mobile" id="cmm6500DeptTreeInfo">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h4 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>조직 정보
						</h4>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="form-group">
						<label><i class="fa fa-align-left kt-margin-r-5"></i>상위 조직 ID</label>
						<input type="text" class="form-control" placeholder="상위 조직 ID" name="upperDeptId" id="upperDeptId" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>상위 조직 명</label>
						<input type="text" class="form-control" placeholder="상위 조직 명" name="upperDeptNm" id="upperDeptNm" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-align-left kt-margin-r-5"></i>조직 ID</label>
						<input type="text" class="form-control" placeholder="조직 ID" name="deptId" id="deptId" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>조직 명</label>
						<input type="text" class="form-control" placeholder="조직 명" name="deptName" id="deptName" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-list-ol kt-margin-r-5"></i>순번</label>
						<input type="text" class="form-control" placeholder="순번" name="ord" id="ord" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
						<input type="text" class="form-control" placeholder="사용유무" name="useNm" id="useNm" readonly="readonly">
					</div>
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i>비고</label>
						<div class="form-control h-100 osl-min-height--9rem" id="deptEtc"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="cmm6500SelDept"><i class="fa fa-check-square"></i><span class="osl-resize__display--show">조직 선택</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show">Close</span></button>
</div>
<script>
"use strict";
var OSLCmm6500Popup = function () {
	var formId = 'frCmm6500';
	
	var selDeptInfo;
	
    
    var documentSetting = function () {
    
    	
    	new KTPortlet('cmm6500DeptTreeList', $.osl.lang("portlet"));
    	new KTPortlet('cmm6500DeptTreeInfo', $.osl.lang("portlet"));
    	
    	var treeObj = $.osl.tree.setting("cmm6500DeptTree",{
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
					
					selDeptInfo = selNode.original;
					
					selectDeptInfo(selNode.original.deptId);
					
					var upperDeptNm = getUpperDeptNm(treeObj, selNode);
					
					
					$("#cmm6500SelDept").attr("data-dept-id", selDeptInfo.deptId);
   	    			$("#cmm6500SelDept").attr("data-dept-nm", upperDeptNm);
				},
				init: function(treeObj, data){
					
					
					var searchDeptNm = $.trim($("#paramDeptNm").val());
					if(!$.osl.isNull(searchDeptNm)){
						
						$('.osl-tree-search input[data-tree-id="cmm6500DeptTree"]').val(searchDeptNm);
						
						$('.osl-tree-search__button[data-tree-id="cmm6500DeptTree"]').click();
					}
					
				}
			}
		});
    	
    	
    	$("#cmm6500SelDept").click(function(){
    		if($.osl.isNull(selDeptInfo)){
    			$.osl.alert("왼쪽 트리에서 조직을 선택하세요.");
    		}else{
    			$.osl.layerPopupClose();
    		}
    	});

    };

    
    
    var getUpperDeptNm = function(treeObj, treeNode){
    	
    	var deptNmStr = "";
    	
    	var upperDeptNmList = treeObj.jstree().get_path(treeNode.id);
		
    	
    	$.each(upperDeptNmList, function(idx, deptNm){
    		deptNmStr += deptNm;
    		if(idx != upperDeptNmList.length-1){
    			deptNmStr += " > ";
    		}
    	});
    	
    	return deptNmStr;
    };
    
    
    
	var selectDeptInfo = function(deptId) {
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm6000/stm6000/selectStm6000DeptInfoAjax.do'/>", "async": false}
				,{"deptId": deptId, "view":"cmm1200"});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
				
		    	$.osl.setDataFormElem(data.deptInfoMap,"frCmm6500", ["deptId", "upperDeptId", "upperDeptNm", "deptName", "useNm", "ord"]);
				
		    	
				if($.osl.isNull(data.deptInfoMap.upperDeptId)){
					$("#upperDeptId").val("-");
				}
				
				
				if($.osl.isNull(data.deptInfoMap.upperDeptNm)){
					$("#upperDeptNm").val("-");
				}
				var deptEtc = data.deptInfoMap.deptEtc;
				if(!$.osl.isNull(deptEtc)){
					deptEtc =  $.osl.escapeHtml(deptEtc);
			    	
					$("#deptEtc").html(deptEtc.replace(/\n/g, '<br/>'));
				}
			}
		});
		
		
		ajaxObj.send();
	};
    	
    return {
        
        init: function() {
        	documentSetting();
        }
    };
}();


$.osl.ready(function(){
	OSLCmm6500Popup.init();
});

	

</script>