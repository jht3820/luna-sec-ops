<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form class="kt-form" id="frDpl3001">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramDplId" id="paramDplId" value="${param.paramDplId}">
	<input type="hidden" name="paramDplUsrId" id="paramDplUsrId" value="${param.paramDplUsrId}">
	<div class="row">
		
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet kt-portlet--mobile">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="">배정 JOB 목록</span>
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<!-- <button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl3001AssignJobTable" data-datatable-action="select" title="배정 JOB 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span>조회</span>
							</button> -->
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl3001AssignJobTable" data-datatable-action="jobExcute" title="선택 JOB 배포 실행" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-auth-button="insert" tabindex="2" id="jobDployExcute">
								<i class="fas fa-play-circle"></i><span>배포 실행</span>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body osl-min-h-px--555 kt-padding-10"">
					
					<div class="kt_datatable" id="dpl3001AssignJobTable"></div>
				</div>
			</div>
		</div>
		
		
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet kt-portlet--mobile">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="">배포 콘솔 로그</span>
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-btn-job kt-hide" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-auth-button="select" tabindex="1" id="mainJobBldLog" data-logbtn-type="main" data-jobid="" >
								<i class="fa fa-copy"></i><span></span>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-btn-job kt-hide" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-auth-button="insert" tabindex="2" id="subJobBldLog" data-logbtn-type="sub" data-jobid="" >
								<i class="fa fa-file"></i><span></span>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="osl-contents-frame osl-min-h-px-imp--415 osl-code-bg" id="contentsFrame">
						<pre>
							<code class="osl-code-bg" id="buildConsoleLog"></code>
						</pre>
					</div>	
					<div class="kt-margin-t-20">
						<div class="osl-progress">
							<div class="kt-padding-b-5">
								<i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i>
								배포 진행률 ( <span id="bldProgressPer">0</span>% )
							</div>
							<div class="progress osl-prj-group-md">
								<div class="progress-bar progress-bar-striped bg-info" role="progressbar" data-transitiongoal="100" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</form>


<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>



<script>
"use strict";
var OSLDpl3001Popup = function () {
	
	
	var paramPrjId = $("#paramPrjId").val();
	var paramDplId = $("#paramDplId").val();
	
	
	var jobStatusWaitTime = 5000;

	
	var buildResultWaitTime = 3000;
	
	
	var jobConsoleLog = {};
	
	
	var selJobStatusFlag = false;
	
	
	var buildStartItem = null;
	
	
	var jobBuildingConsoleLog = "";
	
	
	var buildJobInfo = {};
	
	
	var buildCompFlag = false;
	
	
	var selJobInfo;
	
	var documentSetting = function(){

		
		var loginUsrId = $.osl.user.userInfo.usrId;
		
		if($("#paramDplUsrId").val() != loginUsrId){
			$("#jobDployExcute").addClass("kt-hide");
		}
		
		
		$("#buildConsoleLog").html("<span class='kt-font-inverse-brand kt-padding-l-10 osl-font-lg osl-font'>좌측에서 JOB을 선택해주세요.</span>");
		
		
		fnJobStatusCheckLoop();
		
		
		$.osl.datatable.setting("dpl3001AssignJobTable",{
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
				pageSize: 10
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [10, 20, 30, 50, 100]
					}
				}
			},
			columns: [
				
				{field: 'jobStartOrd', title: "실행 순번", textAlign: 'center', width: 60, autoHide: false},
				{field: 'bldResultMsg', title: "실행 결과", textAlign: 'center', width: 130, search: false
					,template: function(row){
						var bldResultMsg = row.bldResultMsg;
						if($.osl.isNull(bldResultMsg)){
							bldResultMsg = "-";
						}
						return bldResultMsg;
					}
				},
				{field: 'jobTypeNm', title: "Job Type", textAlign: 'center', width: 60, search: false},
				{field: 'bldNum', title: "빌드 번호", textAlign: 'center', width: 100, search: false
					,template: function(row){
						var bldNum = row.bldNum;
						if($.osl.isNull(bldNum)){
							bldNum = "-";
						}
						return bldNum;
					}
				},
				{field: 'jobId', title: "Job Id", textAlign: 'center', width: 130, autoHide: false, search: false},
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
				},
				{field: 'jenNm', title: "Jenkins 명", textAlign: 'center', width: 140, search: true, sortable: true, sortField: "jenNm"},
				{field: 'jenUrl', title: "Jenkins URL", textAlign: 'center', width: 200, search: true, sortable: false}
				
			],
			actionBtn:{
				"title": "기능 버튼",
				"width":130,
				"click":true,
				"insert":false,
				"update":false,
				"delete":false,
				"jobExcute":true
			},
			actionTooltip:{
				"click":"배포 콘솔 로그 보기",
				"jobExcute":"배포 실행"
			},
			actionFn:{
				
				"click":function(rowData, datatableId, type, rowNum, elem){
					
					
					fnJobLogBtnView(rowData);
					
					
					if(!$.osl.isNull(buildJobInfo.jobData)){
						
						if(buildJobInfo.jobData.jobId != rowData.jobId){
							
							if(buildCompFlag){
								$(".progress .progress-bar").attr('data-transitiongoal', 0).progressbar2({display_text: 'center'});
								$("#bldProgressPer").text(0);
							}
						}
					}
					
					
					selJobInfo = rowData;
					
					
					fnSelectJobConsoleLog(rowData);
					
				},
				
				"jobExcute":function(rowDatas , datatableId, type, rowNum, elem){
					
					
					var selRowData = rowDatas;
					
					
					if($.osl.isNull(selRowData)){
						
						selRowData = selJobInfo;
					}
					
					
					
					
					if($.osl.isNull(selRowData)){
						$.osl.alert("실행(빌드)하려는 JOB을 선택해주세요.", {type: "warning"});
						return false;
					}
					
					
					fnJobLogBtnView(selRowData);
					
					
					fnSelectJobConsoleLog(selRowData);
					
					
					fnSelJobDeployExcute(selRowData, rowNum);
				}
			},
			theme: {
				 actionBtnIcon:{
					 
					 "jobExcute": "far fa-play-circle"
				 }
			},
			callback:{
				initComplete: function(evt,config){
				},
				ajaxDone: function(evt, list){

				}
			}
		});
    	
    	
    	
    	
		$(".osl-btn-job").click(function(){
			
			var btnType = $(this).data("logbtn-type");
			var selJobId = $(this).data("jobid");
			
			
			if(btnType == "main"){
				
				if(jobConsoleLog.hasOwnProperty("bldConsoleLog")){
					
					if($.osl.isNull(jobConsoleLog.bldConsoleLog)){
						$('#buildConsoleLog').html("<span class='kt-font-inverse-brand kt-padding-l-10 osl-font-lg osl-font'>선택한 JOB("+jobId+")의 콘솔 로그가 없습니다.</span>");
					}else{
						
						$('#buildConsoleLog').html(jobConsoleLog.bldConsoleLog);
						$('#buildConsoleLog').each(function(i, block) {hljs.highlightBlock(block);});
						$("#buildConsoleLog").scrollTop(9999999);
					}
				}
				
				$("button[data-logbtn-type=main]").addClass("active");
				$("button[data-logbtn-type=sub]").removeClass("active");
			
			
			}else if(btnType == "sub"){
				
				if(jobConsoleLog.hasOwnProperty("bldConsoleRestoreLog")){
					
					if($.osl.isNull(jobConsoleLog.bldConsoleRestoreLog)){
						$('#buildConsoleLog').html("<span class='kt-font-inverse-brand kt-padding-l-10 osl-font-lg osl-font'>선택한 JOB("+jobId+")의 콘솔 로그가 없습니다.</span>");
					}else{
						
						$('#buildConsoleLog').html(jobConsoleLog.bldConsoleRestoreLog);
						$('#buildConsoleLog').each(function(i, block) {hljs.highlightBlock(block);});
						$("#buildConsoleLog").scrollTop(9999999);
					}
				}
				$("button[data-logbtn-type=main]").removeClass("active");
				$("button[data-logbtn-type=sub]").addClass("active");
			}
		});
	};
	
	
	
	var fnJobLogBtnView = function(selectJobData){
		
		
		$("#mainJobBldLog").removeClass("kt-hide");
		$("#mainJobBldLog").addClass("active");
		$("#mainJobBldLog").data("jobid", selectJobData.jobId);
		$("#mainJobBldLog").find("span").text(selectJobData.jobId);
		
		
		if(selectJobData.jobRestoreId){
			$("#subJobBldLog").removeClass("kt-hide");
			$("#subJobBldLog").data("jobid", selectJobData.jobId);
			$("#subJobBldLog").find("span").text(selectJobData.jobRestoreId);
		}else{
			$("#subJobBldLog").addClass("kt-hide");
			$("#subJobBldLog").data("jobid", "");
			$("#subJobBldLog").find("span").text("");
		}
		
	}
	
	
	var fnSelJobDeployExcute = function(selJobData, rowNum){
		
		
		if($.osl.isNull(selJobData)){
			$.osl.alert("실행(빌드)하려는 JOB을 선택해주세요.", {type: "warning"});
			return false;
		}
		
		
		buildJobInfo = {};
		
		
		$.osl.confirm("선택 JOB("+selJobData.jobId+")을 수동 실행 하시겠습니까?", null,function(result) {
	        if (result.value) {
	        	
	        	
	        	buildJobInfo = {
						jobData: selJobData, 
						jobRowNum : rowNum	
				};
	        	
	        	var bldProgressChk = false;
				
	        	
	        	var datatable = $.osl.datatable.list["dpl3001AssignJobTable"].targetDt;
	        	
	        	var allJobList = datatable.getDataSet();
	        	
	        	var dataSet = datatable.dataSet[buildJobInfo.jobRowNum];
	        	
				
				if(!$.osl.isNull(allJobList)){
					$.each(allJobList, function(idx, map){
						if(!$.osl.isNull(map.bldResult)){
							var bldResult = map.bldResult.toLowerCase();
							
							if(bldResult == "progress" || bldResult == "start"){
								bldProgressChk = true;
							}
						}
					});
				}
	        	
				
				if(bldProgressChk){
					$.osl.alert("이미 실행중인 JOB이 존재합니다.", {type: "warning"});
				}else{
					
					
					if(!$.osl.isNull(selJobData)){
						
						selJobStatusFlag = true;
						
						$.osl.datatable.list["dpl3001AssignJobTable"].targetDt.reload();
					}
					
					
					$(".progress .progress-bar").attr('data-transitiongoal', 0).progressbar2({display_text: 'center'});
					$("#bldProgressPer").text(0);
					
					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/dpl/dpl3000/dpl3000/selectDpl3000JobBuildAjax.do'/>" ,"loadingShow":false}
							,selJobData);
					
					ajaxObj.setFnSuccess(function(data){
						
						
						
						
						if(data.errorYn == "Y"){
							
							$.osl.alert(data.message,{type: 'error'});
							
							
							$.osl.datatable.list["dpl3001AssignJobTable"].targetDt.reload();
							
						}else{
							
							jobBuildingConsoleLog = '';
							
							
							buildStartItem = selJobData;

							
				    		buildStartItem["bldNum"] = data.bldNum;
				    		buildStartItem["estimatedDuration"] = data.estimatedDuration;
				    		buildStartItem["timestamp"] = data.timestamp;

				    		
							if($("#paramDplId").val() == selJobData.dplId){
								
								$.osl.datatable.list["dpl3001AssignJobTable"].targetDt.reload();
							}
							
						}
					});
					
					
					ajaxObj.send();
				}
	        }
		});
	};
	
	
	 
	var fnSelectJobConsoleLog = function(selJobData){
		
		
		if($.osl.isNull(selJobData)){
			$.osl.alert("선택된 JOB이 없습니다.",{type: 'waring'});
			return false;
		}
		
		
		var prjId = selJobData.prjId;
		var dplId = selJobData.dplId;
		var jenId = selJobData.jenId;
		var jobId = selJobData.jobId;
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dpl/dpl3000/dpl3000/selectDpl3000DplConsoleLogView.do'/>","loadingShow":false}
				,{prjId:prjId, dplId:dplId, jenId:jenId, jobId:jobId});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				var localJobInfo = data.localJobInfo;
				
				
				if(!$.osl.isNull(localJobInfo)){
					
					
					jobConsoleLog = {
							bldConsoleLog: localJobInfo.bldConsoleLog, 
							bldConsoleRestoreLog : localJobInfo.bldConsoleRestoreLog	
					};
					
					
					var allJobList = $.osl.datatable.list["dpl3001AssignJobTable"].targetDt.getDataSet();
					
					
					var isConsoleLogSet = false;
					
					
					if(selJobStatusFlag){
						isConsoleLogSet = true;
					}else{
						
						$.each(allJobList,function(idx, map){
							if(map.jobId == localJobInfo.jobId){
								
								if(map.bldResult != "PROGRESS"){
									isConsoleLogSet = true;
									return false;
								}
							}
						});
					}
					
					
					if(isConsoleLogSet){
						$('#buildConsoleLog').html(localJobInfo.bldConsoleLog);
						$('#buildConsoleLog').each(function(i, block) {hljs.highlightBlock(block);});
						$("#buildConsoleLog").scrollTop(9999999);
					}else{
						
						$('#buildConsoleLog').html(jobBuildingConsoleLog);
						$('#buildConsoleLog').each(function(i, block) {hljs.highlightBlock(block);});
						$("#buildConsoleLog").append('<i class="fa fa-spinner fa-spin"></i>');
						$("#buildConsoleLog").scrollTop(9999999);
					}
				}else{
					
					$('#buildConsoleLog').html("<span class='kt-font-inverse-brand kt-padding-l-10 osl-font-lg osl-font'>선택한 JOB("+jobId+")의 콘솔 로그가 없습니다.</span>");
				}

			}
		});
		
		
		ajaxObj.send();	
		
	};
	
	
	 
	var fnSelectJobBuildResult = function(targetJobId, targetBldNum, targetJobInfo){
		
		
		selJobStatusFlag = false;
		
		
		var requestConsole = "N";
		
		
		if(!$.osl.isNull(buildJobInfo) && !$.osl.isNull(buildJobInfo.jobData)){
			
			if(targetJobId == buildJobInfo.jobData.jobId || targetJobId == buildJobInfo.jobData.jobRestoreId){
				
				requestConsole = "Y";
			}
		}
		
		
		if(targetJobInfo.dplId != $("#paramDplId").val()){
			
			selJobStatusFlag = true;
			return false;
		}
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dpl/dpl3000/dpl3000/selectDpl3000JobConsoleLogAjax.do'/>", "loadingShow": false}
				,{jenUrl: targetJobInfo.jenUrl
					, jenUsrId: targetJobInfo.jenUsrId
					,jenUsrTok: targetJobInfo.jenUsrTok
					,dplId: targetJobInfo.dplId
					,jenId: targetJobInfo.jenId
					,jobId: targetJobId
					,bldNum: targetBldNum
					,requestConsole: requestConsole
					});
		
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				return false;
			}
			
			
			var buildMap = data.buildMap;
			
			
			if($.osl.isNull(buildMap)){
				return false;
			}
			
			try{
				
				var consoleRefreshFlag = false;
				
				
				if(requestConsole == "Y" && !$.osl.isNull(data.consoleText)){
					
					
					if(!$.osl.isNull(buildJobInfo) && !$.osl.isNull(buildJobInfo.jobData)){
						
						
						var selJobItem = buildJobInfo.jobData;
						
						
						if(targetJobId == selJobItem.jobId || targetJobId == selJobItem.jobRestoreId){
							
							if($("button.osl-btn-job.active").data("jobid") == targetJobId){
								
								jobBuildingConsoleLog = data.consoleText;
								
								
								$("#buildConsoleLog").html(data.consoleText);
								$("#buildConsoleLog").each(function(i, block) {hljs.highlightBlock(block);});
								
								
								if(buildMap.building){
									$("#buildConsoleLog").append('<i class="fa fa-spinner fa-spin"></i>');
								}
								$("#buildConsoleLog").scrollTop(9999999);
							}else{
								
								if($("button.osl-btn-job[data-jobid="+targetJobId+"]").length > 0){
									$("button.bldLogBtn[data-jobid="+targetJobId+"]").animate({"background-color":"#4b73eb","color":"#fff"}, 500, function() {$(this).css({"background-color":"","color":""})});
								}
							}
						}
					}
				}
				
				
				if(buildMap.building){
		
					
					var timestamp = buildMap.timestamp;
					var estimatedDuration = buildMap.estimatedDuration;
					
					
					var today = new Date().getTime();
					
					
					var durationTime = (today-parseInt(timestamp));
					
					
					var arriveDurationTime = estimatedDuration-durationTime;
					
					
					arrTime = 99;
					
					
					if(arriveDurationTime > 0){
						
						var arrTime = (100*(durationTime/parseInt(estimatedDuration)));
						if(arrTime > 99){
							arrTime = 99;
						}
					}
					
					
					$(".progress .progress-bar").attr('data-transitiongoal', arrTime).progressbar2({display_text: 'center', percent_format: function(p) {return buildMap.fullDisplayName+': ' + p+'%';}});
					$("#bldProgressPer").text(Math.round(arrTime));
					
					
					consoleRefreshFlag = true;
				}else{
					
					var localBldInfo = data.localBldInfo;
					
					
					if(!$.osl.isNull(localBldInfo)){
						
						var dataTable = $.osl.datatable.list["dpl3001AssignJobTable"].targetDt;
						var allJobList = dataTable.getDataSet();
						
						
						$.each(allJobList,function(idx, map){
							
							if(map.jobId == localBldInfo.jobId){
								
								var selJobInfo = targetJobInfo;
								targetJobInfo["bldResult"] = localBldInfo.bldResult;
								targetJobInfo["bldResultMsg"] = localBldInfo.bldResultMsg;
								targetJobInfo["bldSeq"] = localBldInfo.bldSeq;
								targetJobInfo["bldNum"] = localBldInfo.bldNum;
								
								
								$.osl.datatable.list["dpl3001AssignJobTable"].targetDt.reload();
								
								
								$(".progress .progress-bar").attr('data-transitiongoal', 100).progressbar2({display_text: 'center', percent_format: function(p) {return buildMap.fullDisplayName+': ' + p+'%';}});
								$("#bldProgressPer").text("100");
								
								buildCompFlag = true;
								
								return false;
							}
							
							else if(!$.osl.isNull(map.jobRestoreId) && map.jobRestoreId != "-" && map.jobRestoreId == localBldInfo.jobId){
								
								var selJobInfo = targetJobInfo;
								targetJobInfo["bldRestoreResult"] = localBldInfo.bldResult;
								targetJobInfo["bldRestoreResultMsg"] = localBldInfo.bldResultMsg;
								targetJobInfo["bldRestoreSeq"] = localBldInfo.bldSeq;
								targetJobInfo["bldRestoreNum"] = localBldInfo.bldNum;
								
								
								$.osl.datatable.list["dpl3001AssignJobTable"].targetDt.reload();
								
								
								$(".progress .progress-bar").attr('data-transitiongoal', 100).progressbar2({display_text: 'center', percent_format: function(p) {return buildMap.fullDisplayName+': ' + p+'%';}});
								$("#bldProgressPer").text("100");
								
								buildCompFlag = true;
								
								return false;
							}
						});
						
						
						selJobStatusFlag = true;
						return false;
					}
					
					consoleRefreshFlag = true;
				}
				
				
				if(consoleRefreshFlag){
					setTimeout(function(){
						fnSelectJobBuildResult(targetJobId, targetBldNum, targetJobInfo);
					}, buildResultWaitTime);
				}else{
					
					selJobStatusFlag = true;
					return false;
				}
			}catch(error){
				console.log(error);
				return false;
			}
			
		});
		
		
		ajaxObj.setFnError(function(xhr, status, err){
			
	       	selJobStatusFlag = true;
	       	fnJobStatusCheckLoop();
		});
		
		
		ajaxObj.send();
		
	};
	
	
	
	var fnJobStatusCheckLoop = function(){
		
		var paramPrjId = $("#paramPrjId").val();
		var paramDplId = $("#paramDplId").val();
		
		if(!$.osl.isNull(paramDplId) && selJobStatusFlag){
			
			
			var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/dpl/dpl3000/dpl3000/selectDpl3000DplJobNormalListAjax.do'/>", "loadingShow": false}
					,{prjId:paramPrjId, dplId:paramDplId});
			
			ajaxObj.setFnSuccess(function(data){
				
				if(data.errorYn == "Y"){
					$.osl.alert(data.message,{type: 'error'});
				}else{
					
					var jobList = data.list;
					
					
					var afterStartChk = true;
					
					
					if(!$.osl.isNull(jobList)){
						
						var progressChk = false;
						$.each(jobList, function(idx, map){
							
							if(!$.osl.isNull(map.bldResult)){
								
								
								var bldResult = map.bldResult;
								
								var bldRestoreResult = map.bldRestoreResult;
								
								
								if(!$.osl.isNull(bldResult)){
									bldResult = bldResult.toLowerCase();
								}
								if(!$.osl.isNull(bldRestoreResult)){
									bldRestoreResult = bldRestoreResult.toLowerCase();
								}
								
								
								if(!$.osl.isNull(bldResult) && bldResult == "progress"){
									progressChk = true;
									
									fnSelectJobBuildResult(map.jobId, map.bldNum, map);
									return false;
								}else if(!$.osl.isNull(bldRestoreResult) && bldRestoreResult == "progress"){
									progressChk = true;
									
									fnSelectJobBuildResult(map.jobRestoreId, map.bldRestoreNum, map);
									return false;
								}
							}
							
						});
						
						
						
						if(!progressChk){
							$.osl.datatable.list["dpl3001AssignJobTable"].targetDt.reload();
						}
						
					}
					
					if(afterStartChk){
						
						setTimeout(fnJobStatusCheckLoop, jobStatusWaitTime);
					}
					
				}
			});
			
			
			ajaxObj.send();	
			
		}else{
			
			setTimeout(fnJobStatusCheckLoop, jobStatusWaitTime);
		}
		
		
	};
		
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLDpl3001Popup.init();
});
</script>

