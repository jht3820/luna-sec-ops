<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form class="kt-form" id="dpl1003">
	<input type="hidden" id="dpl1003ParamPrjGrpId" name="dpl1003ParamPrjGrpId" value="${requestScope.prjGrpId}">
	<input type="hidden" id="dpl1003ParamPrjId" name="dpl1003ParamPrjId" value="${requestScope.prjId}">
	<div class="kt-portlet kt-margin-b-0">
		<div class="kt-portlet__head">	
			<div class="kt-portlet__head-label">
				<div class="osl-datatable-search kt-margin-b-0" data-datatable-id="dpl1003PrjJobTable"></div>
			</div>
			<div class="kt-portlet__head-toolbar">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1003PrjJobTable" data-datatable-action="select" title="JOB 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span>조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1003PrjJobTable" data-datatable-action="selectJob" title="JOB 선택" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
					<i class="fa fa-external-link-alt"></i><span>선택</span>
				</button>
			</div>
		</div>
		<div class="kt-portlet__body">
			<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="dpl1003PrjJobTable"></div>
		</div>
	</div>
</form>


<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>



<script>
"use strict";
var OSLDpl1003Popup = function () {
	
	
	var dpl1003DatatableId = "dpl1003PrjJobTable";
	
	var documentSetting = function(){
		
		
		var dplJobList = OSLDpl1001Popup.getDplJob();
		
		var paramPrjGrpId = $("#dpl1003ParamPrjGrpId").val();
		var paramPrjId = $("#dpl1003ParamPrjId").val();
		
		
		$.osl.datatable.setting(dpl1003DatatableId,{
			data:{
				source:{
					read:{
						url: "/stm/stm9000/stm9200/selectStm9200PrjAssignJenkinsJobListAjax.do",
						params : {
							prjGrpId : paramPrjGrpId,
							prjId: paramPrjId
						}
					}
				},
				pageSize: 5
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [5, 10, 20, 30, 50, 100]
					}
				}
			},
			rows:{
				beforeTemplate: function (row, data, index){
					
					var jenId = data.jenId;
					var jobId = data.jobId;
					
					$.each(dplJobList, function(idx, map){
						
						if(map.jenId == jenId && map.jobId == jobId){
							row.addClass("osl-datatable__row-assign--none");
						}
					});
				},
				minHeight: 50
			},
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'jenNm', title: "Jenkins 명", textAlign: 'center', width: 140, search: true, sortable: true, sortField: "jenNm"},
				{field: 'jenUrl', title: "Jenkins URL", textAlign: 'center', width: 200, search: true, sortable: false},
				{field: 'jobId', title: "Job Id", textAlign: 'center', width: 130, autoHide: false, search: true, sortable: true, sortField: "jobId"},
				{field: 'jobTypeNm', title: "Job Type", textAlign: 'center', width: 100, search: true, sortable: true, searchType:"select", searchCd: "DPL00002", searchField:"jobTypeCd", sortField: "jobTypeCd"},
				{field: 'jobRestoreId', title: "원복 Job Id", textAlign: 'center', width: 130, search: true, sortable: true, sortField: "jobRestoreId"
					,template: function(row){
						var jobRestoredId = row.jobRestoreId;
						
						if($.osl.isNull(jobRestoredId)){
							jobRestoredId = "-";
						}
						return jobRestoredId;
					}
				},
				{field: 'jobParameter', title: "Job 매개변수", textAlign: 'center', width: 120
					,template: function(row){
						var jobParameter = row.jobParameter;
						
						if($.osl.isNull(jobParameter)){
							jobParameter = "-";
						}
						return jobParameter;
					}
				}
			],
			actionBtn:{
				"click":false,
				"dblClick": false,
				"insert":false,
				"delete":false,
				"update":false,
				"lastPush": false
			},
			actionFn:{
				"selectJob":function(rowDatas, datatableId, type, rowNum, elem){
					
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					
					var checkFlag = true;
					
					var isDuplJob = false;
					
					$.each(rowDatas, function(idx, map){
						if(checkFlag){
							$.each(dplJobList, function(dplJobIdx, dplJobData){
								
								if(map.jenId == dplJobData.jenId && map.jobId == dplJobData.jobId){
									$.osl.toastr("이미 배정된 JOB은 다시 배정할 수 없습니다.",{type: "warning"});
									checkFlag = false;
									isDuplJob = true;
									return false;
								}
							});
						}
					});
					
					
					if(!isDuplJob){
						$.osl.confirm("배포 계획에 선택한 JOB을 배정 하시겠습니까?", {html:false}, function(result){
							if (result.value) {
								
								OSLDpl1001Popup.setDplJob(rowDatas);
								$.osl.layerPopupClose();
							}
						});
					}
					
				},
			},
		});
		
	}; 
	
	
	return {
        
        init: function() {
        	documentSetting();
        }
    };
}();

$.osl.ready(function(){
	OSLDpl1003Popup.init();
});
</script>

