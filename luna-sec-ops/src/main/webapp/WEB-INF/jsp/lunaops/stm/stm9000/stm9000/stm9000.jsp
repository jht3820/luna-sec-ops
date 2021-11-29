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
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JenkinsTable" data-datatable-action="selectedConnectJen" title="선택 Jenkins 접속 확인" data-title-lang-cd="stm9000.button.jenkins.selectConnectionTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fab fa-usb"></i><span data-lang-cd="stm9000.button.common.selectConnection">선택 접속 확인</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JenkinsTable" data-datatable-action="allConnectJen" title="전체 Jenkins 접속 확인" data-title-lang-cd="stm9000.button.jenkins.allConnectionTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fab fa-usb"></i><span data-lang-cd="stm9000.button.common.allConnection">전체 접속 확인</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JenkinsTable" data-datatable-action="select" title="Jenkins 조회" data-title-lang-cd="stm9000.button.jenkins.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JenkinsTable" data-datatable-action="insert" title="Jenkins 추가" data-title-lang-cd="stm9000.button.jenkins.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
					<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JenkinsTable" data-datatable-action="update" title="Jenkins 수정" data-title-lang-cd="stm9000.button.jenkins.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9000JenkinsTable" data-datatable-action="delete" title="Jenkins 삭제" data-title-lang-cd="stm9000.button.jenkins.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
					<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-12">
				<div class="osl-datatable-search" data-datatable-id="stm9000JenkinsTable"></div>
			</div>
		</div>
		<div class="kt_datatable" id="stm9000JenkinsTable"></div>
	</div>
</div>

<script>
"use strict";
var OSLStm9000 = function () {
	var documentSetting = function(){
		
		
		$.osl.datatable.setting("stm9000JenkinsTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm9000/stm9000/selectStm9000JenkinsListAjax.do"
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false},
				{field: 'result', title: "접속 확인", textAlign: 'center', width: 80, autoHide: false,
					template: function(row){
						
						return '<i class="fas fa-circle"></i>';
					}
				},
				{field: 'jenNm', title: "Jenkins 명", textAlign: 'center', width: 120, autoHide: false, search: true},
				{field: 'jenUrl', title: "Jenkins URL", textAlign: 'left', width: 240, search: true, autoHide: false},
				{field: 'regJobCnt', title: "시스템 등록 JOB 수", textAlign: 'center', width: 160,
					template: function(row){
						
						return row.regJobCnt == 0 ? "0" : row.regJobCnt;
					}
				},
				{field: 'jenUsrId', title: "Jenkins User Id", textAlign: 'center', width: 120, search: true},
				{field: 'useNm', title: "사용 유무", textAlign: 'center', width: 120, search: true, searchType:"select", searchCd: "CMM00001", searchField:"useCd", sortField: "useCd"}
			],
			searchColumns:[
				{field: 'jenDesc', title:"Jenkins 설명", searchOrd: 1}
			],
			actionBtn:{
				"click": false,
				"dblClick": true,
				"title": $.osl.lang("datatable.action.functionNm"),
				"width" : 120
			},
			actionTooltip:{
				"update": $.osl.lang("stm9000.actionBtn.jenkins.updateBtn"),
				"delete": $.osl.lang("stm9000.actionBtn.jenkins.deleteBtn"),
				"dblClick": $.osl.lang("stm9000.actionBtn.jenkins.dblClickBtn")
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum, elem){
					
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.lang("stm9000.modal.jeknins.insertJenkins"),
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm9000/stm9000/selectStm9001View.do',data,options);
				},
				"update":function(rowData, datatableId, type, rowNum, elem){
					
					var data = {
							type:"update",
							paramJenId: rowData.jenId,
						};
					var options = {
							idKey: datatableId +"_"+ rowData.jenId,
							modalTitle: $.osl.lang("stm9000.modal.jeknins.updateJenkins"),
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/stm/stm9000/stm9000/selectStm9001View.do',data,options);
				},
				"delete":function(rowDatas, datatableId, type, rowNum, elem){
					
					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/stm/stm9000/stm9000/deleteStm9000JenkinsInfoAjax.do'/>"}
							,{deleteDataList: JSON.stringify(rowDatas)});
					
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
			   				$.osl.alert(data.message,{type: 'error'});
			   			}else{
			   				
			   				$.osl.toastr(data.message);
			   				
			   				
			   				$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
			   				$("button[data-datatable-id='stm9000JobTable'][data-datatable-action=select]").click();
			   			}
					});
					
					
					ajaxObj.send();
				},
				
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
					
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
				},
				
				"selectedConnectJen":function(rowDatas, datatableId, type, rowNum, elem){
					
					
					var selectRows = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords();
					
					
					if($.osl.isNull(rowDatas) || selectRows.length == 0){
						$.osl.alert($.osl.lang("stm9000.message.jenkins.nonSelect"));
						return false;
					}
					
					
					fnJenkinsConnectionCheck(selectRows, rowDatas, 0);
					
				},
				
				"allConnectJen":function(rowDatas, datatableId, type, rowNum, elem){
					
					var targetTableElmt = $.osl.datatable.list[datatableId].targetDt;
					
					targetTableElmt.setActiveAll(true);

					
					var selectRows = targetTableElmt.getSelectedRecords();
					
					var rowDataList = [];
					
					$.each(selectRows, function(idx, map){
						var rowIdx = $(map).data("row");
						rowDataList.push(targetTableElmt.getDataSet()[rowIdx]);
					});
					
					
					if($.osl.isNull(rowDataList) || selectRows.length == 0){
						$.osl.alert($.osl.lang("stm9000.message.jenkins.nonSelect"));
						return false;
					}
					
					
					fnJenkinsConnectionCheck(selectRows, rowDataList, 0);
				}
			}
		});
		
		
	};
	
	
	var fnJenkinsConnectionCheck = function(selectRows, rowDatas, index){
		
		
		if(index >= rowDatas.length){
			return false;
		}
		
		
		var targetElmt = $(selectRows[index]).children("td[data-field='result']").find("i");
	
		
		targetElmt.removeClass("fa-circle");
		targetElmt.removeClass("fa-times-circle osl-color--red");
		targetElmt.removeClass("fa-check-circle osl-color--blue");
	
		
		targetElmt.addClass("fa-circle-notch fa-spin");
		
		var jenId = rowDatas[index].jenId;
		var jenNm = rowDatas[index].jenNm;
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm9000/stm9000/selectStm9000ConfirmConnect.do'/>", "loadingShow":false}
				,{"jenId": jenId});
		
		
		ajaxObj.setFnSuccess(function(data){
			
			
			targetElmt.removeClass("fa-circle-notch fa-spin");
			
			
			if(data.resultCode == "JENKINS_FAIL"){
				targetElmt.addClass("fa-times-circle osl-color--red");
				$.osl.toastr(jenNm + " " + data.resultMessage);
			
   			}else if(data.resultCode == "JENKINS_OK"){
				targetElmt.addClass("fa-check-circle osl-color--blue");
   				$.osl.toastr(jenNm + $.osl.lang("stm9000.message.jenkins.connectSuccess"));
   			}
			
			
			fnJenkinsConnectionCheck(selectRows, rowDatas, ++index);
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
	OSLStm9000.init();
});
		
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
