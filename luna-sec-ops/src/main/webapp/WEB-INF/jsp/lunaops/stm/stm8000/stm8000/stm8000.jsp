<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block">
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
		<div class="col-lg-9 col-md-12 col-sm-12 text-right kt-margin-t-15-tablet kt-margin-t-15-mobile">
			<div class="kt-portlet__head-group osl-float-left-tablet">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="selectedConnect" title="선택 저장소 연결 확인" data-title-lang-cd="stm8000.actionBtn.connectTooltip.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="selectedConnect" tabindex="1">
					<i class="fab fa-usb"></i><span data-lang-cd="stm8000.actionBtn.connect.select">선택 접속 확인</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="allConnect" title="전체 저장소 연결 확인" data-title-lang-cd="stm8000.actionBtn.connectTooltip.all" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="allConnect" tabindex="2">
					<i class="fas fa-bezier-curve"></i><span data-lang-cd="stm8000.actionBtn.connect.all">전체 접속 확인</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="select" title="저장소 조회" data-title-lang-cd="stm8000.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="3">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="insert" title="저장소 추가" data-title-lang-cd="stm8000.actionBtn.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="4">
					<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="update" title="저장소 수정" data-title-lang-cd="stm8000.actionBtn.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="5">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-l-5 btn-elevate btn-elevate-air" data-datatable-id="stm8000RepTable" data-datatable-action="delete" title="저장소 삭제" data-title-lang-cd="stm8000.actionBtn.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="6">
					<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-5 col-md-6 col-sm-12">
				<div class="osl-datatable-search" data-datatable-id="stm8000RepTable"></div>
			</div>
		</div>
		<div class="kt_datatable osl-datatable-footer__divide" id="stm8000RepTable"></div>
	</div>
</div>

<script>
 "use strict";

 var OSLStm8000Popup = function() {
	 
	 var datatableId = "stm8000RepTable";
	 
	 
	 var okRevision = false;
	 var okFileCode = false;
	 
	 var systemRoot = true;
	 
	 var documentSetting = function() {
		 $.osl.datatable.setting(datatableId,{
				data: {
					source: {
						read: {
							url: "/stm/stm8000/stm8000/selectStm8000ListAjax.do"
						}
					},
				},
				columns: [
					{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
					{field: 'result', title: '접속 확인', textAlign: 'center', width: 80, autoHide: false, sortable: false,
						template: function(row){
							
							return '<i class="fas fa-circle"></i>';
						}	
					},
					{field: 'useNm', title: '사용 여부', textAlign: 'center', width: 35, search: true, searchType:"select", searchCd: "CMM00001", searchField:"useCd", sortField:"useCd"},
					{field: 'strgTypeNm', title: '유형', textAlign: 'left', width: 40, search: true, searchType:"select", searchCd: "STM00004", searchField:"strgTypeCd", sortField: "strgTypeCd"},
					{field: 'strgRepTitle', title: '저장소명', textAlign: 'left', width: 200, search: true},
					{field: 'strgTxt', title: '저장소 설명', textAlign: 'left', width: 240, search: true,
						template: function(row){
							if($.osl.isNull(row.strgTxt)){
								return '-';
							}else{
								return row.strgTxt;
							}
						}	
					},
					{field: 'strgRepUrl', title: '저장소 URL', textAlign: 'left', width: 240},
				],
				rows:{
					clickCheckbox: true
				},
				actionBtn:{
					"title" : $.osl.lang("stm8000.title.actionTitle"),
					"dblClick": true,
					"selectedConnect" : true,
					"allConnect" : true
				},
				actionTooltip:{
					"update": $.osl.lang("stm8000.actionTooltip.updateTooltip"),
					"delete": $.osl.lang("stm8000.actionTooltip.deleteTooltip"),
					"dblClick" : $.osl.lang("stm8000.actionTooltip.dblClickTooltip"),
					"selectedConnect" : $.osl.lang("stm8000.actionTooltip.connectTooltip.select"),
					"allConnect" : $.osl.lang("stm8000.actionTooltip.connectTooltip.all"),
				},
				actionFn:{
					"insert":function(datatableId, type, rowNum){
						var data = {type:"insert"};
						var options = {
								idKey: datatableId,
								modalTitle: $.osl.lang("stm8000.title.insertTitle"),
								closeConfirm: false,
								autoHeight:false,
							};
						
						$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8001View.do',data,options);
					},
					"update":function(rowData, datatableId, type){
						var data = {
								type:"update",
								strgRepId: rowData.strgRepId,
							};
						var options = {
								idKey: datatableId,
								modalTitle: $.osl.lang("stm8000.title.updateTitle"),
								closeConfirm: false,
								autoHeight:false,
							};
						
						$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8001View.do',data,options);
					},
					"delete":function(rowDatas, datatableId, type){
						var data = {
								dataList : JSON.stringify(rowDatas),
							};
						
				    	var ajaxObj = new $.osl.ajaxRequestAction(
				    			{"url":"<c:url value='/stm/stm8000/stm8000/deleteStm8000ServerInfoAjax.do'/>"}
				    				, data);
						
				    	ajaxObj.setFnSuccess(function(data){
				    		if(data.errorYn == "Y"){
								$.osl.alert(data.message,{type: 'error'});
								
								$.osl.layerPopupClose();
							}else{
								$.osl.toastr(data.message);
								selectBtnClick();
							}
				    	});
				    	
						ajaxObj.send();
					},
					"dblClick":function(rowData, datatableId, type, rowNum){
						var data = {
								strgRepId: rowData.strgRepId,
								systemRoot : systemRoot, 
							};
						var options = {
								idKey: rowData.strgRepId,
								modalTitle: "["+$.osl.escapeHtml(rowData.strgRepTitle)+"] "+$.osl.lang("stm8000.title.dblClickTitle"),
								modalSize: "fs",
								closeConfirm: false
							};

						
						if(!$.osl.isNull(systemRoot) && systemRoot){
							
							okRevision = true;
							okFileCode = true;
						}else{
							authCheck(rowData.strgRepId);
						}
						
						if(okRevision){
							$.osl.layerPopupOpen('/cmm/cmm6000/cmm6800/selectCmm6800View.do',data,options);
						}else{
							$.osl.alert($.osl.lang("stm8000.message.auth"));
							return false;
						}
						
					},
					"selectedConnect" : function(rowDatas, datatableId, type, rowNum, elem){
						var selectRows;
						
						if(type == "list"){
							
							if(rowNum == 0){
								$.osl.alert($.osl.lang("stm8000.message.connect.selectCount", rowNum), {"type":"warrning"});
							}else {
								
								selectRows = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords();
								strgConnectionCheck(selectRows, rowDatas, 0);
							}
						}else{
							
							selectRows = $(elem).closest("tr");
							var datas = [];
							datas.push(rowDatas);
							strgConnectionCheck(selectRows, datas, 0);
						}
					},
					"allConnect" : function(rowDatas, datatableId, type, rowNum){
						var targetTableElmt = $.osl.datatable.list[datatableId].targetDt;
						
						targetTableElmt.setActiveAll(true);
						
						
						var selectRows = targetTableElmt.getSelectedRecords();
						
						var rowDataList = [];
						
						$.each(selectRows, function(idx, map){
							var rowIdx = $(map).data("row");
							rowDataList.push(targetTableElmt.getDataSet()[rowIdx]);
						});
						
						strgConnectionCheck(selectRows, rowDataList, 0);
					}
				},
				theme:{
					actionBtn:{
						"selectedConnect" : "",
						"allConnect" : " kt-hide"
					},
					actionBtnIcon:{
						"selectedConnect" : "fab fa-usb",
					}
				},
				callback:{
					initComplete: function(evt, config){
						
						$('table>.btn[data-auth-button=allConnect]').hide();
					},
					ajaxDone: function(evt, list){
					}
				}
		 });
	 }
	 
	
	var strgConnectionCheck = function(selectRows, rowDatas, index){
		
		
		if(index >= rowDatas.length){
			return false;
		}
		
		
		var targetElmt = $(selectRows[index]).children("td[data-field='result']").find("i");
	
		
		targetElmt.removeClass("fa-circle");
		targetElmt.removeClass("fa-times-circle osl-color--red");
		targetElmt.removeClass("fa-check-circle osl-color--blue");
	
		
		targetElmt.addClass("fa-circle-notch fa-spin");
		
		var repoId = rowDatas[index].strgRepId;
		var repoType = rowDatas[index].strgTypeCd;
		var repoName = rowDatas[index].strgRepTitle;
		
		var data = {
				strgRepId : repoId
		};
		
		
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000RepoConnectCheckAjax.do'/>"}
   				, data);
		
   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				
   				targetElmt.removeClass("fa-circle-notch fa-spin");
   				
   				targetElmt.addClass("fa-times-circle osl-color--red");
				$.osl.toastr("["+$.osl.escapeHtml(repoName)+"]" + $.osl.lang("stm8000.message.connect.fail.common"));
   				
   			}else{
   				
   				targetElmt.removeClass("fa-circle-notch fa-spin");
   				
   				
   				if(repoType == "01"){
   					if(data.connectResult == "SVN_OK"){
   	   					
   						targetElmt.addClass("fa-check-circle osl-color--blue");
   		   				$.osl.toastr("["+$.osl.escapeHtml(repoName)+"]" + $.osl.lang("stm8000.message.connect.success"));
   	   				}else if(data.connectResult == "SVN_AUTHENTICATION_EXCEPTION"){
   	   					
   	   					targetElmt.addClass("fa-times-circle osl-color--red");
   	   					$.osl.toastr("["+$.osl.escapeHtml(repoName)+"]" + $.osl.lang("stm8000.message.connect.fail.auth"));
   	   				}else{
   	   					
   	   					targetElmt.addClass("fa-times-circle osl-color--red");
   	   					$.osl.toastr("["+$.osl.escapeHtml(repoName)+"]" + $.osl.lang("stm8000.message.connect.fail.url"));
   	   				}
   				}else{
   					
   					targetElmt.addClass("fa-times-circle osl-color--red");
   					$.osl.toastr("["+$.osl.escapeHtml(repoName)+"]" + $.osl.lang("stm8000.message.connect.fail.common"));
   				}
   				
   				
   				strgConnectionCheck(selectRows, rowDatas, ++index);
   			}
   		});
  	 	
   		ajaxObj.send();
	};
	
	
	var authCheck = function(strgRepId){
		var data = {
				strgRepId : strgRepId,
		};
		
		
    	var ajaxObj = new $.osl.ajaxRequestAction(
	   			{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000AuthCheckAjax.do'/>", "async": false}
				, data);
		
    	
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var result = data.result;
				
				
				if(result.resultRevision == "Y"){
					okRevision = true;
				}else{
					okRevision = false;
				}
				
				if(result.resultFileCode == "Y"){
					okFileCode = true;
				}else{
					okFileCode = false;
				}
			}
    	});
    	
		ajaxObj.send();
	};
	
	
	var selectBtnClick = function(){
		$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
	};
	
	return {
		init: function(){
			documentSetting();
		}
	};
 }();
 
 $.osl.ready(function(){
	 OSLStm8000Popup.init();
 });
</script>
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />