<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1101">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramProcessId" id="paramProcessId" value="${param.paramProcessId}">
		<div class="kt-portlet">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>프로세스 정보
					</h5>
				</div>
			</div>
			<div class="kt-portlet__body kt-padding-15">
				<div class="row">
					<div class="col-lg-6 col-md-12 col-sm-12">
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span>프로세스명</span></label>
									<input type="text" class="form-control" placeholder="프로세스명" name="processNm" id="processNm" maxlength="50" opttype="-1" required>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="required"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>정렬 순서</span></label>
									<input type="number" class="form-control" placeholder="정렬 순서" name="processOrd" id="processOrd" value="1" opttype="-1" min="0" max="999" maxlength="3" >
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
									<select class="form-control kt-select2" id="useCd" name="useCd" readonly="readonly" opttype="-1">
									</select>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>프로세스 이관 가능 여부</label>
									<select class="form-control kt-select2" id="processTransferCd" name="processTransferCd" readonly="readonly" opttype="-1">
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>확정 유무</label>
									<select class="form-control kt-select2" id="processConfirmCd" name="processConfirmCd" readonly="readonly" opttype="-1">
									</select>
									<span class="form-text text-muted">* 확정된 프로세스만 업무처리가 가능합니다.</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span>프로세스 설명</span></label>
									<textarea class="form-control osl-min-h-px--220 osl-textarea__resize--none" name="processDesc" id="processDesc" maxlength="2000" opttype="-1"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6 col-md-12 col-sm-12">
				<div class="kt-portlet">
					<div class="kt-portlet__head kt-portlet__head--lg">
						<div class="kt-portlet__head-label">
							<h5 class="kt-font-boldest kt-font-brand">
								<i class="fa fa-th-large kt-margin-r-5"></i>프로세스 담당 목록 <label class="required"></label>
							</h5>
						</div>
						<div class="kt-portlet__head-toolbar">
							<div class="kt-portlet__head-wrapper">
								<c:if test="${param.type != 'insert' }">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1101ProcessAuthUsrTable" data-datatable-action="reset" title="담당자 배정 목록 초기화" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
										<i class="fa fa-list"></i><span>초기화</span>
									</button>
								</c:if>
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1101ProcessAuthUsrTable" data-datatable-action="selInUsrDelete" title="선택 담당자 배정 제외" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1">
									<span>배정 제외</span><i class="fa fa-arrow-alt-circle-right osl-padding-r0 osl-padding-l05"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="kt-portlet__body kt-padding-10 osl-min-h-px--400">
						<div class="osl-datatable-search" data-datatable-id="prj1101ProcessAuthUsrTable"></div>
						<div class="kt_datatable" id="prj1101ProcessAuthUsrTable"></div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-12 col-sm-12">
				<div class="kt-portlet">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-th-large kt-margin-r-5"></i>담당 대상 목록
								</h5>
							</div>
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-wrapper">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1101ProcessAuthNoneUsrTable" data-datatable-action="selAllUsrDelete" title="선택 담당자 배정 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1">
										<i class="fa fa-arrow-alt-circle-left"></i><span>배정 등록</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1101ProcessAuthNoneUsrTable" data-datatable-action="select" title="담당 대상 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
										<i class="fa fa-list"></i><span>조회</span>
									</button>
								</div>
							</div>
						</div>
						<div class="kt-portlet__body kt-padding-10">
							<div class="osl-datatable-search" data-datatable-id="prj1101ProcessAuthNoneUsrTable"></div>
							<div class="kt_datatable" id="prj1101ProcessAuthNoneUsrTable"></div>
						</div>
					</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1101SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
var OSLPrj1101Popup = function () {
	var formId = 'frPrj1101';
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var type = $("#type").val();
	
	
	var prjAuthUsrIdList = [];
	
	
	var prjAuthOriginalData = [];
	
	
	var paramPrjGrpId = $("#paramPrjGrpId").val();
	var paramPrjId = $("#paramPrjId").val();
	var paramProcessId = $("#paramProcessId").val();
	
    
    var documentSetting = function () {
    	
    	$("#prj1101SaveSubmit > span").text($.osl.lang("modal."+type+".saveBtnString"));
    	
    	
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"},
			{mstCd: "CMM00005", useYn: "Y",targetObj: "#processTransferCd", comboType:"OS"},
			{mstCd: "FLW00005", useYn: "Y",targetObj: "#processConfirmCd", comboType:"OS"},
		];
		
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		
		
    	$("#prj1101SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		
    		var authUsrList = $.osl.datatable.list["prj1101ProcessAuthUsrTable"].targetDt.originalDataSet;
    		if($.osl.isNull(authUsrList) || authUsrList.length == 0){
    			$.osl.alert("프로세스 기본 담당자는 필수 입니다.",{type: "warning"});
    			return false;
    		}
    		
    		$.osl.confirm($.osl.lang("prj1101."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	
    	        	saveFormAction();
    	        }
    		});
    	});
		
		
    	datatableSetting();
		
    	
		
		if(type == "update"){
			fnProcessInfoSelect();
		}
		
    };
    
    
    var saveFormAction = function() {
    	
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	
    	var authUsrList = $.osl.datatable.list["prj1101ProcessAuthUsrTable"].targetDt.originalDataSet;
    	if(!$.osl.isNull(authUsrList) && authUsrList.length > 0){
    		var usrIdList = [];
    		$.each(authUsrList, function(idx, map){
    			usrIdList.push({licGrpId: map.licGrpId, authTypeCd: map.authTypeCd, usrId: map.usrId});
    		});
    		fd.append("usrIdList",JSON.stringify(usrIdList));
    	}

    	
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1100/savePrj1100ProcessInfoAjax.do'/>", "async": true,"contentType":false,"processData":false ,"cache":false},fd);
    	
   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);
   				
   				
   				$.osl.layerPopupClose();
   				
   				
   				if($.osl.datatable.list.hasOwnProperty("prj1100PrjTable")){
	   				$.osl.datatable.list["prj1100PrjTable"].targetDt.reload();
   				}
   			}
   		});
   		
   		
   		ajaxObj.send();
    };
    
    
    var datatableSetting = function(){
    	
		$.osl.datatable.setting("prj1101ProcessAuthUsrTable",{
			data: {
				type:'local',
				serverSorting: false,
				serverPaging: false,
				source: [],
				pageSize: 4
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100]
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'usrNm', title: '사용자명', textAlign: 'left', width: 150, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직책', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd"},
				{field: 'usrDutyNm', title: '직급', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 150, search: true},
			],
			searchColumns:[
				{field: 'usrId', title: '사용자 ID', searchOrd: 1}
			],
			actionBtn:{
				"title": "제외",
				"update": false,
				"delete": false,
				"dblClick": true,
			},
			actionTooltip:{
				"dblClick": "담당자 배정 제외"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-right",
				}
			},
			actionFn:{
				"select": function(datatableId, elem){
					
					var searchTypeTarget = $(".osl-datatable-search__dropdown[data-datatable-id="+datatableId+"] > .dropdown-item.active");
					
					
					var searchData = $("#searchData_"+datatableId);

					
					var searchFieldId = searchTypeTarget.data("field-id");
					var searchType = searchTypeTarget.data("opt-type");
					var searchCd = $(this).data("opt-mst-cd");
					
					
					$.osl.datatable.list[datatableId].targetDt.setDataSourceQuery({});
					
					
					if(searchType != "all"){
						var searchDataValue = searchData.val();
						
						
						if(searchType == "select"){
							searchDataValue = $("#searchSelect_"+datatableId).val();
						}
						
						$.osl.datatable.list[datatableId].targetDt.search(searchDataValue,searchFieldId);
					}else{
						$.osl.datatable.list[datatableId].targetDt.search();
					}
				},
				"reset": function(rowData, datatableId, type, rownum, elem){
					var datatable = $.osl.datatable.list[datatableId].targetDt;
					
					
					datatable.dataSet = [];
					datatable.originalDataSet = [];
					prjAuthUsrIdList = [];
					
					
					if(prjAuthOriginalData.length > 0){
						$.each(prjAuthOriginalData, function(idx, map){
			   				
			   				datatable.dataSet.push(map);
							datatable.originalDataSet.push(map);
							
							
							prjAuthUsrIdList.push(map.usrId);
		   				});
					}
					
					
					datatable.insertData();
					
					datatable.reload();
				},
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					fnAllUsrDelete(rowDatas);
				},
				
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					var rowDatas = rowData;
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("common.user.auth.allUsrInDelete",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							
							fnAllUsrDelete(rowDatas);
						}
					});
				}
			}
		});
		
		
		$.osl.datatable.setting("prj1101ProcessAuthNoneUsrTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1100/selectPrj1100ProcessAuthNoneUsrListAjax.do"
					}
				},
				pageSize: 4,
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100],
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet: {
								layout: 'compact'
							}
						}
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'authTypeNm', title: '분류', textAlign: 'center', width: 80, search: true, searchType:"select", searchCd: "PRJ00018", searchField:"authTypeCd", sortField: "authTypeCd"},
				{field: 'usrNm', title: '사용자명', textAlign: 'left', width: 130, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직책', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직급', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 150, search: true, sortable: false},
			],
			searchColumns:[
				{field: 'usrId', title: '사용자 ID', searchOrd: 1}
			],
			actionBtn:{
				"title": "배정",
				"update": false,
				"delete": false,
				"dblClick": true,
				"lastPush": false,
			},
			actionTooltip:{
				"dblClick": "담당자 등록"
			},
			theme:{
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-left",
				}
			},
			rows:{
				beforeTemplate: function (row, data, index){
					
					if(prjAuthUsrIdList.indexOf(data.usrId) > -1){
						row.addClass("osl-datatable__row-assign--none");
					}
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					
					fnAllUsrInsert(rowDatas);
				},
				
				"selAllUsrDelete": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("common.user.auth.allUsrInsert",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							
							fnAllUsrInsert(rowDatas);
						}
					});
				}
			}
		});
	};
	
	var fnAllUsrInsert = function(selDatas){
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			
			var datatable = $.osl.datatable.list["prj1101ProcessAuthUsrTable"].targetDt;
			
			
			if($.osl.isNull(datatable.dataSet)){
				datatable.dataSet = [];
				datatable.originalDataSet = [];
			}
			
			
			var usrIdDupleList = 0;
			
			
			$.each(selDatas, function(idx, map){
				
				if(prjAuthUsrIdList.indexOf(map.usrId) != -1){
					usrIdDupleList++;
					return true;
				}
				
				datatable.dataSet.push(map);
				datatable.originalDataSet.push(map);
				
				
				prjAuthUsrIdList.push(map.usrId);
			});
			
			
			var toastrMsg = "";
			var toastrType = "success";
			if(selDatas.length > usrIdDupleList){
				toastrMsg += $.osl.lang("common.user.auth.saveMsg",(selDatas.length-usrIdDupleList));
			}
			if(usrIdDupleList > 0){
				
				if(toastrMsg.length > 0){
					toastrMsg += "</br>";
				}
				toastrMsg += $.osl.lang("common.user.auth.saveDupleMsg",usrIdDupleList);
				toastrType = "warning";
			}
			
			if(usrIdDupleList == selDatas.length){
				toastrMsg = $.osl.lang("common.user.auth.saveAllDupleMsg",usrIdDupleList);
				toastrType = "error";
				$.osl.toastr(toastrMsg,{type: toastrType});
				return false;
			}
			
			$.osl.toastr(toastrMsg,{type: toastrType});
			
			
			datatable.insertData();
			
			datatable.reload();
			
			$.osl.datatable.list["prj1101ProcessAuthNoneUsrTable"].targetDt.reload();
			$("div.tooltip.show").remove();
		 }
	};
	
	
	var fnAllUsrDelete = function(selDatas){
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			
			var datatable = $.osl.datatable.list["prj1101ProcessAuthUsrTable"].targetDt;
			
			
			var dataSet = datatable.dataSet;
			var originalDataSet = datatable.originalDataSet;
			
			if(!$.osl.isNull(dataSet)){
				
				$.each(selDatas, function(idx, map){
					$.each(originalDataSet, function(dataIdx, dataMap){
						if($.osl.isNull(dataMap)){
							return true;
						}
						
						else if(map.usrId == dataMap.usrId){
							originalDataSet.splice(dataIdx, 1);
							
							
							prjAuthUsrIdList.splice(prjAuthUsrIdList.indexOf(map.usrId), 1);
							return false;
						}
					});
				});
				
				
				datatable.reload();
				
				$.osl.datatable.list["prj1101ProcessAuthNoneUsrTable"].targetDt.reload();
				$("div.tooltip.show").remove();
			}
		}
	};
	
	
	var fnProcessInfoSelect = function(){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100ProcessInfoAjax.do'/>"}
				,{paramPrjGrpId: paramPrjGrpId, paramPrjId: paramPrjId, paramProcessId: paramProcessId, type: "local"});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var processInfo = data.processInfo;
   				
   				$.osl.setDataFormElem(processInfo, formId);
   				$("#useCd").val(processInfo.useCd).trigger('change.select2');
   				$("#processTransferCd").val(processInfo.processTransferCd).trigger('change.select2');
   				$("#processConfirmCd").val(processInfo.processConfirmCd).trigger('change.select2');
   				
   				if(data.hasOwnProperty("processAuthList") && data.processAuthList.length > 0){
   					
					prjAuthOriginalData = data.processAuthList;
   						 
	   				
	   				var datatable = $.osl.datatable.list["prj1101ProcessAuthUsrTable"].targetDt;
	   			
	   				
	   				datatable.eq(0).removeClass("kt-datatable--error");
	   				
	   				$.each(data.processAuthList, function(idx, map){
		   				
		   				datatable.dataSet.push(map);
						datatable.originalDataSet.push(map);
						
						
						prjAuthUsrIdList.push(map.usrId);
	   				});
					
					
					datatable.insertData();
					
					datatable.reload();
					$.osl.datatable.list["prj1101ProcessAuthNoneUsrTable"].targetDt.reload();
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
	OSLPrj1101Popup.init();
});

	
</script>