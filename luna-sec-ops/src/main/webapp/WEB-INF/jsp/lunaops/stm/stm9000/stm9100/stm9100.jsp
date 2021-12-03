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
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9100JobTable" data-datatable-action="selectedConnectJob" title="선택 Job 접속 확인" data-title-lang-cd="stm9100.button.jenkins.selectConnectionTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fab fa-usb"></i><span data-lang-cd="stm9100.button.common.selectConnection">선택 접속 확인</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9100JobTable" data-datatable-action="allConnectJob" title="전체 Job 접속 확인" data-title-lang-cd="stm9100.button.jenkins.allConnectionTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fab fa-usb"></i><span data-lang-cd="stm9100.button.common.allConnection">전체 접속 확인</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9100JobTable" data-datatable-action="select" title="Job 조회" data-title-lang-cd="stm9100.button.jenkins.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9100JobTable" data-datatable-action="insert" title="Job 추가" data-title-lang-cd="stm9100.button.jenkins.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
					<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9100JobTable" data-datatable-action="update" title="Job 수정" data-title-lang-cd="stm9100.button.jenkins.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9100JobTable" data-datatable-action="delete" title="Job 삭제" data-title-lang-cd="stm9100.button.jenkins.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
					<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-12">
				<div class="osl-datatable-search" data-datatable-id="stm9100JobTable"></div>
			</div>
		</div>
		<div class="kt_datatable" id="stm9100JobTable"></div>
	</div>
</div>

<script>
"use strict";
var OSLStm9100 = function () {
	var documentSetting = function(){
		
		
		$.osl.datatable.setting("stm9100JobTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm9000/stm9100/selectStm9100JobListAjax.do"
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false},
				{field: 'result', title: "접속 확인", textAlign: 'center', width: 80, autoHide: false
					,template: function(row){
						
						return '<i class="fas fa-circle"></i>';
					}	
				},
				{field: 'jenNm', title: "Jenkins 명", textAlign: 'center', width: 120},
				{field: 'jobTypeNm', title: "Job Type", textAlign: 'center', width: 120, search: true, searchType:"select", searchCd: "DPL00002", searchField:"jobTypeCd", sortField: "jobTypeCd"},
				{field: 'jobId', title: "Job Id", textAlign: 'center', width: 120, autoHide: false, search: true},
				{field: 'jobRestoreId', title: "원복 Job Id", textAlign: 'center', width: 120, autoHide: false, search: true
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
				},
				{field: 'useNm', title: "사용 유무", textAlign: 'center', width: 120, search: true, searchType:"select", searchCd: "CMM00001", searchField:"useCd", sortField: "useCd"}
			],
			searchColumns: [
				{field: 'jenNm', title:"Jenkins 명", searchOrd: 0},
				{field: 'jobDesc', title:"Job 설명", searchOrd: 5}
			],
			actionBtn:{
				"click": false,
				"dblClick": true,
				"detailJenkins":true,
				"title": $.osl.lang("datatable.action.functionNm"),
				"width" : 160
			},
			actionTooltip:{
				"update": $.osl.lang("stm9100.actionBtn.job.updateBtn"),
				"delete": $.osl.lang("stm9100.actionBtn.job.deleteBtn"),
				"dblClick": $.osl.lang("stm9100.actionBtn.job.dblClickBtn"),
				"detailJenkins": $.osl.lang("stm9100.actionBtn.job.detailJenkins")
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum, elem){
					
					var data = {type:"insert"};
					var options = {
						idKey: datatableId,
						modalTitle: $.osl.lang("stm9100.modal.job.insertJob"),
						closeConfirm: false
					};
					
					$.osl.layerPopupOpen('/stm/stm9000/stm9100/selectStm9101View.do',data,options);
				},
				"update":function(rowData, datatableId, type, rowNum, elem){
					
					var data = {
							type:"update",
							paramJenId: rowData.jenId,
							paramJobId: rowData.jobId
						};
					var options = {
							idKey: datatableId +"_"+ rowData.jenId+"_"+rowData.jobId,
							modalTitle: $.osl.lang("stm9100.modal.job.updateJob"),
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm9000/stm9100/selectStm9101View.do',data,options);
				},
				"delete":function(rowDatas, datatableId, type, rowNum, elem){
					
					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/stm/stm9000/stm9100/deleteStm9100JobInfoAjax.do'/>"}
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
				},
				
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
					
					var data = {
							paramJenId: rowData.jenId,
							paramJobId: rowData.jobId
					};
					var options = {
							idKey: datatableId +"_"+ rowData.jenId,
							modalTitle: "["+ rowData.jobId + "] " + $.osl.lang("stm9100.modal.job.detailJob"),
							closeConfirm: false,
							modalSize: "xl"
						};
					
					$.osl.layerPopupOpen('/stm/stm9000/stm9100/selectStm9102View.do',data,options);
					
				},
				
				"selectedConnectJob":function(rowDatas, datatableId, type, rowNum, elem){
					
					
					var selectRows = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords();
					
					
					if($.osl.isNull(rowDatas) || selectRows.length == 0){
						$.osl.alert($.osl.lang("stm9100.message.job.nonSelect"));
						return false;
					}
					
					
					fnJobConnectionCheck(selectRows, rowDatas, 0);
				},
				
				"allConnectJob":function(rowDatas, datatableId, type, rowNum, elem){
					
					var targetTableElmt = $.osl.datatable.list[datatableId].targetDt;
					
					targetTableElmt.setActiveAll(true);
					
					
					var selectRows = targetTableElmt.getSelectedRecords();
					
					var rowDataList = [];
					
					$.each(selectRows, function(idx, map){
						var rowIdx = $(map).data("row");
						rowDataList.push(targetTableElmt.getDataSet()[rowIdx]);
					});
					
					
					if($.osl.isNull(rowDataList) || selectRows.length == 0){
						$.osl.alert($.osl.lang("stm9100.message.job.nonSelect"));
						return false;
					}
					
					
					fnJobConnectionCheck(selectRows, rowDataList, 0);
				},
				
				"detailJenkins":function(rowData, datatableId, type, rowNum, elem){
					
					var data = {
							paramJenId: rowData.jenId,
							paramJenNm: rowData.jenNm
					};
					var options = {
							idKey: datatableId +"_"+ rowData.jenId,
							modalTitle: "["+ rowData.jenNm + "] " + $.osl.lang("stm9000.modal.jeknins.detailJenkins"),
							closeConfirm: false,
							modalSize: "xl"
						};
					
					$.osl.layerPopupOpen('/stm/stm9000/stm9000/selectStm9002View.do',data,options);
				}
			},
			theme: {
				 actionBtnIcon:{
					 "detailJenkins": "fa flaticon-settings-1"
				 }
			 }
		});
		
		
	};
	
	
	var fnJobConnectionCheck = function(selectRows, rowDatas, index){
		
		
		if(index >= rowDatas.length){
			return false;
		}
		
		
		var targetElmt = $(selectRows[index]).children("td[data-field='result']").find("i");
	
		
		targetElmt.removeClass("fa-circle");
		targetElmt.removeClass("fa-times-circle osl-color--red");
		targetElmt.removeClass("fa-check-circle osl-color--blue");
	
		
		targetElmt.addClass("fa-circle-notch fa-spin");
		
		var jenId = rowDatas[index].jenId;
		var jobId = rowDatas[index].jobId;
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm9000/stm9100/selectStm9100JobConfirmConnect.do'/>", "loadingShow":false}
				,{ "jenId" : jenId, "jobId" : jobId });
		
		
		ajaxObj.setFnSuccess(function(data){
			
			
			targetElmt.removeClass("fa-circle-notch fa-spin");
			
			
			if(data.resultCode == "JENKINS_FAIL"){
				targetElmt.addClass("fa-times-circle osl-color--red");
				$.osl.toastr(jobId + " " + data.resultMessage);
			
   			}else if(data.resultCode == "JENKINS_OK"){
				targetElmt.addClass("fa-check-circle osl-color--blue");
   				$.osl.toastr(jobId + $.osl.lang("stm9100.message.job.connectSuccess"));
   			}
			
			
			fnJobConnectionCheck(selectRows, rowDatas, ++index);
		});
		
		
		ajaxObj.send();
	}
	
	
	return {
        
        init: function() {
        	documentSetting();
        }
    };
}();


$.osl.ready(function(){
	OSLStm9100.init();
});
		
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
