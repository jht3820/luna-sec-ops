<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<!-- begin :: form -->
<form class="kt-form" id="dpl1003">
	<input type="hidden" id="dpl1003ParamPrjGrpId" name="dpl1003ParamPrjGrpId" value="${requestScope.prjGrpId}">
	<input type="hidden" id="dpl1003ParamPrjId" name="dpl1003ParamPrjId" value="${requestScope.prjId}">
	<div class="kt-portlet kt-margin-b-0">
		<div class="kt-portlet__head">	
			<div class="kt-portlet__head-label">
				<div class="osl-datatable-search kt-margin-b-0" data-datatable-id="dpl1003Table"></div>
			</div>
			<div class="kt-portlet__head-toolbar">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1003Table" data-datatable-action="select" title="JOB 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span>조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1003Table" data-datatable-action="selectJob" title="JOB 선택" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
					<i class="fa flaticon2-check-mark"></i><span>선택</span>
				</button>
			</div>
		</div>
		<div class="kt-portlet__body">
			<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="dpl1003Table"></div>
		</div>
	</div>
</form>
<!-- end :: form -->
<!-- begin :: modal-footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>
<!-- end :: modal-footer -->
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLDpl1003Popup = function () {
	
	// 선태간 job 목록
	var checkJobList = [];
	
	var documentSetting = function(){
		
		var paramPrjGrpId = $("#dpl1003ParamPrjGrpId").val();
		var paramPrjId = $("#dpl1003ParamPrjId").val();
		
		// job 배정 테이블 셋팅
		$.osl.datatable.setting("dpl1003Table",{
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
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'jenNm', title: "Jenkins 명", textAlign: 'center', width: 140, search: true, sortable: true, sortField: "jenNm"},
				{field: 'jenUrl', title: "Jenkins URL", textAlign: 'center', width: 200, search: true, sortable: false},
				{field: 'jobId', title: "Job Id", textAlign: 'center', width: 130, autoHide: false, search: true, sortable: true, sortField: "jobId"},
				{field: 'jobTypeNm', title: "Job Type", textAlign: 'center', width: 100, search: true, sortable: true, searchType:"select", searchCd: "DPL00002", searchField:"jobTypeCd", sortField: "jobTypeCd"},
				{field: 'jobRestoreId', title: "원복 Job Id", textAlign: 'center', width: 130, search: true, sortable: true, sortField: "jobRestoreId"
					,template: function(row){
						var jobRestoredId = row.jobRestoreId;
						// 원복 job id 없을 경우 - 으로 표시
						if($.osl.isNull(jobRestoredId)){
							jobRestoredId = "-";
						}
						return jobRestoredId;
					}
				},
				{field: 'jobParameter', title: "Job 매개변수", textAlign: 'center', width: 120
					,template: function(row){
						var jobParameter = row.jobParameter;
						// Job 매개변수 없을 경우 - 으로 표시
						if($.osl.isNull(jobParameter)){
							jobParameter = "-";
						}
						return jobParameter;
					}
				}
			],
			actionBtn:{
				"title" : $.osl.lang("stm9200.common.notAssign"),
				"dblClick": false,
				"delete":false,
				"update":false,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("stm9200.toolTip.jobDelete")
			},
			actionFn:{
				/* "dblClick": function(rowData, datatableId, type, rowNum, elem){
					
					var rowDatas = [];
					rowDatas.push(rowData);
					// Job 배정제외
					fnJobDelete(rowDatas);
				}, */
				"selectJob":function(rowDatas, datatableId, type, rowNum, elem){
					
					//선택 레코드 없는 경우 알림
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					console.log(rowDatas);
					
					$.osl.confirm("배정 하시겠습니까?", {html:false}, function(result){
						if (result.value) {
							// JOB 배정제외
							//fnJobDelete(rowDatas);
						}
					});
				},
			},
			theme:{
				/* actionBtn:{
					"removeJob" : " kt-hide"
				},
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-down",
				} */
			},
		});
		
	}; 
	
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        },
        getJobInfo: function(){
        	return JSON.stringify(selectJobs);//선택한 사용자 정보
        }
        
    };
}();

$.osl.ready(function(){
	OSLDpl1003Popup.init();
});
</script>
<!-- end script -->
