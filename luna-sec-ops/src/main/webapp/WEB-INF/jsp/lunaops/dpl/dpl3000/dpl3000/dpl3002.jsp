<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form class="kt-form" id="frDpl3002">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramDplId" id="paramDplId" value="${param.paramDplId}">
	
	
	<div class="kt-portlet">
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>JOB 배정 목록
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl3002DplJobTable" data-datatable-action="select" title="배정 JOB 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span>조회</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="col-lg-4 col-md-8 col-sm-12 kt-padding-r-0">
					<div class="osl-datatable-search" data-datatable-id="dpl3002DplJobTable"></div>
				</div>
				<div class="kt_datatable osl-datatable-footer__divide" id="dpl3002DplJobTable"></div>
			</div>
		</div>
	</div>
	
	<div class="row">
		
		<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 ">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>JOB 빌드 목록
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button"
								class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl3002JobBldTable" data-datatable-action="select" title="JOB 빌드 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="2">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body osl-min-h-px--630">
					<div class="osl-datatable-search" data-datatable-id="dpl3002JobBldTable"></div>
					<div class="kt_datatable osl-datatable-footer__divide" id="dpl3002JobBldTable"></div>
				</div>
			</div>
		</div>
		
		
		<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>콘솔 로그
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="osl-contents-frame osl-min-h-px--580" id="contentsFrame">
						<pre>
							<code class="osl-font osl-bg-none kt-font-light" id="jobBuildConsoleLog"></code>
						</pre>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</form>

<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span>
	</button>
</div>



<script>
"use strict";
var OSLDpl3002Popup = function () {
	
	
	var paramPrjId = $("#paramPrjId").val();
	var paramDplId = $("#paramDplId").val();
	
	var documentSetting = function(){

		
		$.osl.datatable.setting("dpl3002DplJobTable",{
			data: {
				source: {
					read: {
						url: "/dpl/dpl3000/dpl3000/selectDpl3000DplJobListAjax.do",
						params : {
							prjId : paramPrjId,
							dplId : paramDplId
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
			columns: [
				{field: 'jenNm', title: "Jenkins 명", textAlign: 'center', width: 140, search: true, sortable: true, sortField: "jenNm"},
				{field: 'jenUrl', title: "Jenkins URL", textAlign: 'center', width: 200, search: false, sortable: false},
				{field: 'jobStartOrd', title: "실행 순번", textAlign: 'center', width: 60, autoHide: false, search: false, sortable: true, sortField: "jobStartOrd"},
				{field: 'bldNum', title: "빌드 번호", textAlign: 'center', width: 100, search: false, sortable: true, sortField: "bldNum"
					,template: function(row){
						var bldNum = row.bldNum;
						if($.osl.isNull(bldNum)){
							bldNum = "-";
						}
						return bldNum;
					}
				},
				{field: 'bldResultMsg', title: "실행 결과", textAlign: 'center', width: 130, search: true, sortable: true, sortField: "bldResultMsg"
					,template: function(row){
						var bldResultMsg = row.bldResultMsg;
						if($.osl.isNull(bldResultMsg)){
							bldResultMsg = "-";
						}
						return bldResultMsg;
					}
				},
				{field: 'jobTypeNm', title: "Job Type", textAlign: 'center', width: 60, search: true, sortable: true, searchType:"select", searchCd: "DPL00002", searchField:"jobTypeCd", sortField: "jobTypeCd", sortField: "jobTypeCd"},
				{field: 'jobId', title: "Job Id", textAlign: 'center', width: 130, autoHide: false, search:true, sortable: true, sortField: "jobId"},
				{field: 'jobParameter', title: "Job 매개변수", textAlign: 'center', width: 120
					,template: function(row){
						var jobParameter = row.jobParameter;
						
						if($.osl.isNull(jobParameter)){
							jobParameter = "-";
						}
						return jobParameter;
					}
				},
				{field: 'bldRestoreNum', title: "원복 빌드 번호", textAlign: 'center', width: 150, search: false},
				{field: 'jobRestoreId', title: "원복 Job Id", textAlign: 'center', width: 130, search: false
					,template: function(row){
						var jobRestoredId = row.jobRestoreId;
						
						if($.osl.isNull(jobRestoredId)){
							jobRestoredId = "-";
						}
						return jobRestoredId;
					}
				},
				{field: 'bldRestoreResultMsg', title: "원복 결과", textAlign: 'center', width: 150, search: false
					,template: function(row){
						var bldRestoreResultMsg = row.bldRestoreResultMsg;
						
						if($.osl.isNull(bldRestoreResultMsg)){
							bldRestoreResultMsg = "-";
						}
						return bldRestoreResultMsg;
					}
				}
			],
			actionBtn:{
				"title": "기능 버튼",
				"width":130,
				"click":true,
				"insert":false,
				"update":false,
				"delete":false
			},
			actionTooltip:{
				"click": "JOB 빌드 목록 조회"
			},
			actionFn:{
				"click":function(rowData, datatableId, type, rowNum, elem){
					
					
					var jobBldTableTarget = $.osl.datatable.list["dpl3002JobBldTable"].targetDt;
					
					
					jobBldTableTarget.setDataSourceParam("prjId", paramPrjId);
					jobBldTableTarget.setDataSourceParam("jenId", rowData.jenId);
					jobBldTableTarget.setDataSourceParam("jobId", rowData.jobId);
					$("button[data-datatable-id='dpl3002JobBldTable'][data-datatable-action=select]").click();
					
				}
			}
		});
		
		
		
		$.osl.datatable.setting("dpl3002JobBldTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm9000/stm9100/selectStm9100JobBuildListAjax.do"
					}
				},
				pageSize: 7
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [7, 20, 30, 50, 100],
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 3
							},
							mobile:{
								layout: 'default',
								pagesNumber: 1
							}
						}
					}
				}
			},
			columns: [
				{field: 'bldNum', title: "빌드 번호", textAlign: 'center', width: 70, sortable: true, sortField: "bldNum", autoHide: false, search: true},
				{field: 'bldResult', title: "빌드 상태", textAlign: 'center', width: 80, sortable: true, sortField: "bldResult", autoHide: false, search: true},
				{field: 'bldStartDtm', title: "빌드 시작 시간", textAlign: 'center', width: 130, sortable: true, sortable: true, sortField: "bldStartDtm", search: true, searchType:"daterange"
					,template: function(row){
						var bldStartDtm = row.bldStartDtm;
						return new Date(bldStartDtm).format("yyyy-MM-dd HH:mm:ss", true);
					}
				},
				{field: 'bldDurationTm', title: "소요 시간", textAlign: 'center', width: 70
					,template: function(row){
						var bldDurationTm = row.bldDurationTm;

						
						var tmpMin = (bldDurationTm/1000);
						var bldDurationMm = Math.round(tmpMin/60);
						
						var bldDurationSs = Math.round(((bldDurationTm/1000)%60));
						
						var durationStr = bldDurationSs + $.osl.lang("stm9102.label.second");
						if(bldDurationMm > 0){
							durationStr = bldDurationMm + $.osl.lang("stm9102.label.minute") + bldDurationSs + $.osl.lang("stm9102.label.second");
						}
						return durationStr;
					}
				},
				{field: 'regUsrNm', title: "배포자", textAlign: 'center', width: 110, sortable: true, sortField: "regUsrNm", search: true
					,template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.regUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.regUsrId);
					}	
				}
			],
			actionBtn:{
				"title": "",
				"click":true,
				"insert":false,
				"update":false,
				"delete":false
			},
			actionTooltip:{
			},
			actionFn:{
				
				"click":function(rowData, datatableId, type, rowNum, elem){
					
					fnSelectBldConsoleLogInfo(rowData);
				}
			},
			theme: {
				 actionBtnIcon:{
					 "click": " kt-hide" 
				 }
			},
			callback:{
				ajaxDone: function(evt, list){
					
					$("#jobBuildConsoleLog").html("<span class='kt-font-inverse-brand kt-padding-l-10 osl-font-lg osl-font'>"+$.osl.lang("stm9102.message.selectBuildInfo")+"</span>");
				}
			}
		});
    	
		
    	
	};
	
	
	var fnSelectBldConsoleLogInfo = function(rowData) {
    	
    	 var prjId = rowData.prjId;
    	 var dplId = rowData.dplId;
    	 var jenId = rowData.jenId;
    	 var jobId = rowData.jobId;
    	 var bldSeq = rowData.bldSeq;
    	 
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dpl/dpl1000/dpl1000/selectDpl1400DplSelBuildConsoleLogAjax.do'/>","loadingShow":false}
				,{prjId:prjId, dplId: dplId, jenId: jenId, jobId: jobId, bldSeq: bldSeq});
		
		ajaxObj.setFnSuccess(function(data){
			
			
			if(data.errorYn == "Y"){
				
				$("#jobBuildConsoleLog").html(data.message);
			}else{
				
				var buildInfo = data.dpl1400InfoMap;
				
				
				
				if($.osl.isNull(buildInfo) || $.osl.isNull(buildInfo.bldConsoleLog)){
					$("#jobBuildConsoleLog").html("<span class='kt-font-inverse-brand  kt-padding-l-10 osl-font-lg osl-font'>"+$.osl.lang("stm9102.message.notConsoleLog")+"</span>");
					return false;
				}
				
				
				$("#jobBuildConsoleLog").html(buildInfo.bldConsoleLog);
				$('#jobBuildConsoleLog').each(function(i, block) {hljs.highlightBlock(block);});
				
				
				$("#jobBuildConsoleLog").scrollTop(9999);
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
	OSLDpl3002Popup.init();
});
</script>

