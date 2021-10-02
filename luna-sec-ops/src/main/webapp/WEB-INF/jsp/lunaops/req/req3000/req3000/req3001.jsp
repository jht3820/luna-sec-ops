<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form class="kt-form" id="frReq3001">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="prjId" id="prjId" value="${param.paramPrjId}">
	<input type="hidden" name="prjGrpId" id="prjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="reqGrpUsrId" id="reqGrpUsrId" value="${param.paramReqGrpUsrId}">
	<input type="hidden" name="reqGrpChargerId" id="reqGrpChargerId" value="${param.paramReqGrpChargerId}">
	<input type="hidden" name="reqGrpId" id="reqGrpId" value="${param.paramReqGrpId}">
	<input type="hidden" name="atchFileId" id="atchFileId">
	<input type="hidden" name="oriAtchFileId" id="oriAtchFileId">
	<div class="row">
		<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="form-group">
								<label><i class="fas fa-sort-amount-down kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpNo">그룹 요구사항 번호</span></label>
								<input type="text" class="form-control" id="reqGrpNo" name="reqGrpNo">
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpUsr">요청자</span></label>
								<div class="input-group">
									<input type="text" class="form-control" id="reqGrpUsrNm" name="reqGrpUsrNm" required="required">
									<button type="button" class="btn btn-brand input-group-append" id="searchUsrNmBtn" name="searchUsrNmBtn"><span data-lang-cd="req4101.button.searchBtn">검색</span></button>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
							<div class="form-group">
								<label class="required"><i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpCharger">그룹 요구사항 담당자</span></label>
								<div class="input-group">
									<input type="text" class="form-control" id="reqGrpChargerNm" name="reqGrpChargerNm" required="required">
									<button type="button" class="btn btn-brand input-group-append" id="searchChargerNmBtn" name="searchChargerNmBtn"><span data-lang-cd="req4101.button.searchBtn">검색</span></button>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpNm">그룹 요구사항 명</span></label>
								<input type="text" class="form-control" id="reqGrpNm" name="reqGrpNm" required="required" placeholder="연결된 그룹요구사항이 없습니다.">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpDesc">그룹 요구사항 내용</span></label>
								<textarea  name="reqGrpDesc" id="reqGrpDesc" required="required"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="form-group">
								<i class="fa fa-file-upload kt-margin-r-5"></i><span data-lang-cd="req3000.label.fileUpload">파일첨부</span>
								<button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="fileRemoveResetBtn">
									<span data-lang-cd="req3000.button.deleteResetBtn">삭제 초기화</span>
								</button>
								<div class="kt-uppy" id="req3001FileUpload">
									<div class="kt-uppy__dashboard"></div>
									<div class="kt-uppy__progress"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 osl-margin-t-20-1400">
				<div class="kt-portlet__head">	
					<div class="kt-portlet__head-toolbar">
						<i class="fas fa-stream kt-margin-r-5"></i><span data-lang-cd="req3000.label.linkedReqList">연결 요구사항 목록</span>
					</div>
					<div class="kt-portlet__head-label">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3001ConnectReqTable" data-datatable-action="select" title="연결 요구사항 조회" data-title-lang-cd="datatable.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="req3000.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3001ConnectReqTable" data-datatable-action="selInReqDelete" title="연결 요구사항 제거" data-title-lang-cd="datatable.button.title.delete" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="selInReqDelete" tabindex="2">
							<i class="fa fa-minus"></i><span data-lang-cd="req3000.button.delete">제거</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3001ConnectReqTable" data-datatable-action="reset" title="연결 요구사항 초기화" data-title-lang-cd="req3000.datatable.button.title.reset" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
							<i class="fas fa-undo-alt"></i><span data-lang-cd="req3000.button.reset">초기화</span>
						</button>
					</div>
				</div>
				<div class="kt-portlet__body osl-min-h-px--415">
					<div class="row">
						<div class="col-lg-8 col-md-8 col-sm-12">
							<div class="osl-datatable-search" data-datatable-id="req3001ConnectReqTable"></div>
						</div>
					</div>
					<div class="kt_datatable" id="req3001ConnectReqTable"></div>
				</div>
			</div>
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 kt-margin-t-20">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-toolbar">
						<i class="fas fa-stream kt-margin-r-5"></i><span data-lang-cd="req3000.label.unlinkedReqList">미연결 요구사항 목록</span>
					</div>
					<div class="kt-portlet__head-label">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3001UnconnectReqTable" data-datatable-action="select" title="미연결 요구사항 조회" data-title-lang-cd="datatable.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="req3000.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3001UnconnectReqTable" data-datatable-action="connect" title="미연결 요구사항 연결" data-title-lang-cd="req3000.datatable.button.title.connect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="connect" tabindex="2">
							<i class="fas fa-link"></i><span data-lang-cd="req3000.button.connect">연결</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req3001UnconnectReqTable" data-datatable-action="insert" title="미연결 요구사항 연결" data-title-lang-cd="datatable.button.title.insert" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="3">
							<i class="fa fa-plus"></i><span data-lang-cd="req3000.button.insert">추가</span>
						</button>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-lg-8 col-md-8 col-sm-12">
							<div class="osl-datatable-search" data-datatable-id="req3001UnconnectReqTable"></div>
						</div>
					</div>
					<div class="kt_datatable" id="req3001UnconnectReqTable"></div>	
				</div>
			</div>
		</div>
	</div>
	
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="req3000SaveSubmit"><span data-lang-cd="req3000.button.done">완료</span></button>
	<button type="button" class="btn btn-outline-brand"	data-dismiss="modal">
		<span data-lang-cd="modal.close">닫기</span>
	</button>
</div>


<script>
"use strict";


var OSLReq3001Popup = function () {
	var formId = 'frReq3001'
	
	var fileUploadObj;
	
	var formEditList = [];
	
	
   	var atchFileId = $("#atchFileId").val();	
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var reqConnectedList = [];
	
	
	var reqConnectedListOriginalData = [];
	
	
	var uploadRemoveFiles = [];
	
	
	var type;
	
	
	var reqGrpNo = $("#reqGrpNo").val();
	var reqGrpNm = $("#reqGrpNm").val();
	
	var documentSetting = function(){
		
		
		type = $("#type").val();
		
		
    	formEditList.push($.osl.editorSetting("reqGrpDesc", {formValidate: formValidate}));
		
		
    	
    	fileUploadObj = $.osl.file.uploadSet("req3001FileUpload",{
    		
    		url: '/req/req3000/req3000/insertReq3001ReqAtchFileInfo.do',
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": atchFileId, "fileSn": 0},
    		maxNumberOfFiles:20,
    		
    		allowedFileTypes: ['.jpg', '.jpeg', '.png', '.gif',".pdf", ".hwp", ".docx", ".pptx", "txt",".csv", ".xlsx"],
    		
    		
    		onBeforeUpload: function(files){
    			var rtnValue = files;
    			var uploadFiles = {};
    			if(type == "insert"){
    				
    				$.osl.file.makeAtchfileId(function(data){
    					if(data.errorYn == "Y"){
	   						$.osl.toastr(data.message);
	   						rtnValue = [];
	   					}else{
	   						$("#atchFileId").val(data.atchFileIdString);
	   						atchFileId = data.atchFileIdString;
	   					 	fileUploadObj.setMeta({atchFileId: data.atchFileIdString});
	   					 	
	   					 	
	   						
	   	    				$.each(files, function(idx, map){
	   	    					map.meta.atchFileId = data.atchFileIdString;
	   	    					
	   	    					var jsonTmp = {};
	    						jsonTmp[map.id] = map;
	    						uploadFiles = $.extend(uploadFiles, jsonTmp);
	   	    				});
	   						
	   	    				rtnValue = uploadFiles;
	   	    				
	   						
	   						submitInsertAction();
	   					}
    				});
    				
    			}else{
    				
    				atchFileId = $("#atchFileId").val();
    				if($.osl.isNull(atchFileId)){
    					
    					$.osl.file.makeAtchfileId(function(data){
    						
    						if(data.errorYn == "Y"){
    							$.osl.toastr(data.message);
    							rtnValue = [];
    						}else{
    							
    							
    							atchFileId = data.atchFileIdString;
    					
    							$("#atchFileId").val(atchFileId);
    						 	fileUploadObj.setMeta({atchFileId: atchFileId});
    						 	
    							
    		    				$.each(files, function(idx, map){
    		    					if(map.source != "database"){
    	        						map.meta.atchFileId = atchFileId;
    	        						map.meta.source = map.source;
    	        						
    	        						var jsonTmp = {};
    	        						jsonTmp[map.id] = map;
    	        						uploadFiles = $.extend(uploadFiles, jsonTmp);
    	        					}
    		    				});
    						}
    					});
    				}else{
    					atchFileId = $("#atchFileId").val();
    					
        				
        				$.each(files, function(idx, map){
        					if(map.source != "database"){
        						map.meta.atchFileId = atchFileId;
        						map.meta.source = map.source;
        						
        						var jsonTmp = {};
        						jsonTmp[map.id] = map;
        						uploadFiles = $.extend(uploadFiles, jsonTmp);
        					}
        				});
    				}
    				
    				rtnValue = uploadFiles;
    				
    				
					submitUpdateAction();
    			}
    		},
    		
    		onBeforeFileAdded: function(currentFile, files){
    			if(currentFile.source != "database" && currentFile.source != "remove"){
					var newNm = new Date().format("ssms")+"_"+currentFile.name;
					currentFile.name = newNm;
					currentFile.meta.name = newNm;
					currentFile.meta.atchFileId = $("#atchFileId").val();
					
	    			
	    			var fileSn = fileUploadObj.getState().meta.fileSn;
	    			currentFile.meta.fileSn = fileSn;
	    			fileUploadObj.setMeta({fileSn: (fileSn+1)});
				}
    		}
    	});
    	
    	
    	if(type != "insert"){
    		
    		selectReqGrpInfo();
    		
    		
    	   	fileUploadObj.on('file-removed', function(file) {
    	   		file["fileSn"] = file.meta.fileSn;
    	   		file.source = "remove";
    	   		uploadRemoveFiles.push(file);
    	   		
    	   		$("#fileRemoveResetBtn").removeClass("d-none");
    		});
    	   	
    	   	
    	   	$("#fileRemoveResetBtn").click(function(){
    	   		$("#fileRemoveResetBtn").addClass("d-none");
    	   		
    	   		$.each(uploadRemoveFiles, function(idx, map){
    	   			fileUploadObj.addFile({
    	   			    name: map.name,
    	   			    type: map.type,
    	   			    source: 'database',
    	   			    meta: {
    	   			    	atchFileId: map.meta.atchFileId,
    	   			    	fileSn: map.meta.fileSn
    	   			    },
    	   				data: map.data,
      				});
    	   		});

	    		setTimeout(function(){
	    			
	    			$.each(fileUploadObj.getFiles(), function(idx, map){
	    				
	    				if(map.source == "database"){
	    					var target = $("#uppy_"+$.escapeSelector(map.id)+" > .uppy-DashboardItem-preview");
	    					target.addClass("osl-cursor-pointer");
	    					target.off("click");
	    					target.click(function(){
	    						$.osl.file.fileDownload(map.meta.atchFileId, map.meta.fileSn);
	    					});
	    				}
	    			});
	    		},2000);
	    		
    	   		uploadRemoveFiles = [];
    		});
    	}
    	
    	
    	datatableSetting();
    	
	}
	
	var datatableSetting = function(){
		
		$.osl.datatable.setting("req3001ConnectReqTable",{
			data: {
				type:'local',
				serverSorting: false,
				serverPaging: false,
				source: [],
				pageSize: 5
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [5, 10, 20, 30, 50, 100]
					}
				}
			},
			toolbar:{
				items:{
					pagination:{
						
						pageSizeSelect : [5, 10, 20, 30, 50, 100],
						
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 3
							}
						}
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title:"No.", textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'prjNm', title: '프로젝트 명', textAlign: 'left', width: 150, search:true, autoHide: false, sortable: false},	
				{field: 'reqOrd', title: '요구사항 번호', textAlign: 'left', width: 100, search:true,autoHide: false},
				{field: 'reqNm', title: '요구사항 명', textAlign: 'left', width: 100 , search:true, autoHide: false, sortable: false}
			],
			searchColumns:[
				
				{field: 'reqChargerNm', title: '담당자', searchOrd: 4},
				{field: 'reqUsrNm', title: '요청자', searchOrd: 5},
				{field: 'reqProType', title: '처리유형', searchOrd: 6, searchType:"select", searchCd:"REQ00001"},
				
			],
			actionBtn:{
				"dblClick":true,
				"update":false,
				"delete":false,
			},
			rows:{
				minHeight:50,
			},
			actionFn:{
				"select":function(datatableId, elem){
					
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
				
				"dblClick":function(rowData, datatableId, type, rownum, elem){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					fnAllReqDelete(rowDatas);
					$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.reload();
				},
				"selInReqDelete":function(rowData, datatableId, type, rownum, elem){
					var rowDatas = rowData;
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("prj2100.allUsrInDelete",rowDatas.length),null, function(result){
						if (result.value) {
							
							fnAllReqDelete(rowDatas);
						}
					});
				},
				
				"reset": function(rowData, datatableId, type, rownum, elem){
					
					var datatable = $.osl.datatable.list[datatableId].targetDt;
					
					
					datatable.dataSet = [];
					datatable.originalDataSet = [];
					reqConnectedList = [];
					
					
					if(reqConnectedListOriginalData.length > 0){
						
						$.each(reqConnectedListOriginalData, function(idx, map){
							
			   				
			   				datatable.dataSet.push(map);
							datatable.originalDataSet.push(map);
							
							
							reqConnectedList.push(map.reqId);
							
		   				});
					}
					
					datatable.insertData();
					
					
					datatable.reload();
					
				}
			}
		});
		

		
		$.osl.datatable.setting("req3001UnconnectReqTable",{
			data: {
				source: {
					read: {
						url: "/req/req3000/req3000/selectReq3002ListAjaxView.do",
						params:{
							reqGrpId: $("#reqGrpId").val()
    					},
					}
				},
				pageSize:5,
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
				{field: 'rn', title:"No.", textAlign: 'center', width: 25, autoHide: false, sortable: false, autoHide: false},
				{field: 'prjNm', title: '프로젝트 명', textAlign: 'left', width: 150, search:true, autoHide: false, sortable: false},	
				{field: 'reqOrd', title: '요구사항 번호', textAlign: 'left', width: 100, search:true, autoHide: false },
				{field: 'reqNm', title: '요구사항 명', textAlign: 'left', width: 100 , search:true, autoHide: false, sortable: false}
			],
			searchColumns:[
				{field: 'reqUsrNm', title: '요청자', searchOrd: 5},
				{field: 'reqChargerNm', title: '담당자', searchOrd: 6},
				{field: 'reqProType', title: '처리유형', searchOrd: 7, searchType:"select", searchCd:"REQ00001"},
			],
			actionBtn:{
				"dblClick":true,
				"update":false,
				"delete":false
			},
			rows:{
				beforeTemplate: function (row, data, index){
					
					if(reqConnectedList.indexOf(data.reqId) > -1){
						row.addClass("osl-datatable__row-assign--none");
					}
				},
				minHeight:50,
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalSize: "xl",
							modalTitle: $.osl.lang("req1001.title"),
							closeConfirm: false,
						};
					$.osl.layerPopupOpen('/req/req1000/req1000/selectReq1001View.do',data,options);
				},
				"dblClick":function(rowData,datatableId, type, rowNum){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					fnAllReqConnect(rowDatas);
					$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.reload();
				},
				
				"connect":function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					fnAllReqConnect(rowDatas);
					$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.reload();
				}
			}
		});
		
		$("#req3001ConnectReqTable").on("kt-datatable--on-layout-updated", function(){
			actionHide("req3001ConnectReqTable");
       	});
		
		$("#req3001UnconnectReqTable").on("kt-datatable--on-layout-updated", function(){
			actionHide("req3001UnconnectReqTable");
       	});
	};
	
	
	
	var fnAllReqConnect = function(selDatas){
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			
			var datatable = $.osl.datatable.list["req3001ConnectReqTable"].targetDt;	
		}
		
		
		if($.osl.isNull(datatable.dataSet)){
			datatable.dataSet = [];
			datatable.originalDataSet = [];
		}
		
		
		var reqDupleList = 0;
		
		
		$.each(selDatas, function(idx, map){
			
			
			if(reqConnectedList.indexOf(map.reqId) != -1){
				reqDupleList++;
				return true;
			}
			
			datatable.dataSet.push(map);
			datatable.originalDataSet.push(map);
			
			
			reqConnectedList.push(map.reqId);
			
		});
		
		
		
		var toastrMsg = "";
		var toastrType = "success";
		
		if(selDatas.length > reqDupleList){
			toastrMsg += $.osl.lang("req3000.insert.saveMsg",(selDatas.length-reqDupleList));
		}
		
		
		
		
		if(reqDupleList == selDatas.length){
			
			toastrMsg = $.osl.lang("req3000.insert.saveDupleMsg",reqDupleList);
			toastrType = "error";
			
		}
		
		$.osl.toastr(toastrMsg,{type: toastrType});
		
		
		datatable.insertData();
		
		
		datatable.reload();
		
		$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.reload();
		$("div.tooltip.show").remove(); 
		
	};
	
	
	var fnAllReqDelete = function(selDatas){
		
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			
			var datatable = $.osl.datatable.list["req3001ConnectReqTable"].targetDt;
			
			
			var dataSet = datatable.dataSet;
			var originalDataSet = datatable.originalDataSet;
			
			if(!$.osl.isNull(dataSet)){
				
				$.each(selDatas, function(idx, map){
					$.each(originalDataSet, function(dataIdx, dataMap){
						if($.osl.isNull(dataMap)){
							return true;
						}
						
						else if(map.reqId == dataMap.reqId){
							originalDataSet.splice(dataIdx, 1);
							
							
							reqConnectedList.splice(reqConnectedList.indexOf(map.reqId), 1);
							return false;
						}
					});
				});
				
				
				datatable.reload();
				
				$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.reload();
				$("div.tooltip.show").remove();
				
			}
		}
	};
	
	
    var selectReqGrpInfo = function(){
    	var data = {
    			prjGrpId: $("#prjGrpId").val(),
    			prjId: $("#prjId").val(),
    			reqGrpId: $("#reqGrpId").val()
    	}
    	
    	var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req3000/req3000/selectReq3000ReqInfoAjax.do'/>", "async":"true"}
				,data);
    	
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				
				$.osl.layerPopupClose();
				
			}else{
				
				
		    	$.osl.setDataFormElem(data.reqInfoMap,"frReq3000");
				
				
		    	$("#reqGrpChargerNm").val(data.reqInfoMap.reqGrpChargerNm);
		    	$("#reqGrpUsrNm").val(data.reqInfoMap.reqGrpUsrNm);
		    	$("#reqGrpNo").val(data.reqInfoMap.reqGrpNo);
		    	$("#reqGrpDesc").val(data.reqInfoMap.reqGrpDesc);
		    	$("#reqGrpNm").val(data.reqInfoMap.reqGrpNm);
		    	
		    	$("#atchFileId").val(data.reqInfoMap.atchFileId);
		    	$("#oriAtchFileId").val(data.reqInfoMap.atchFileId);
		    	
		    	
		    	formEditList.push($.osl.editorSetting("reqGrpDesc", {formValidate: formValidate, disableResizeEditor: false}));
		    	
		    	
		    	fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
		    	
		    	
		    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
		    	
		    	
		    	
		    	if(data.reqGrpConList.length > 0){
		    		
   					
					reqConnectedListOriginalData = data.reqGrpConList;
   						 
	   				
	   				var datatable = $.osl.datatable.list["req3001ConnectReqTable"].targetDt;
	   			
	   				
	   				datatable.eq(0).removeClass("kt-datatable--error");
	   				
	   				$.each(data.reqGrpConList, function(idx, map){
		   				
		   				datatable.dataSet.push(map);
						datatable.originalDataSet.push(map);
						
						
						reqConnectedList.push(map.reqId);
	   				});
	   				
	   				
	   				
					var dataSet = new Set(datatable.dataSet);
					var originalDataSet = new Set(datatable.originalDataSet);
					datatable.dataSet = Array.from(dataSet);
					datatable.originalDataSet = Array.from(originalDataSet);
					
					
					datatable.insertData();
					
					datatable.reload();
					
					$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.reload();
					
   				}
			}
    	});
		
		
		ajaxObj.send();
    }
	
	var submitInsertAction = function(paramActhFileId){
		
		var form = $('#'+formId);
		
		
		if(!form.valid()){
			return;
		}
		
		if($.osl.isNull($("#reqGrpUsrId").val())||$("#reqGrpUsrId").val() == ""){
			$.osl.alert($.osl.lang("req3000.alert.checkUsrId"));
			return;
		}
		
		if($.osl.isNull($("#reqGrpChargerId").val())||$("#reqGrpChargerId").val() == ""){
			$.osl.alert($.osl.lang("req3000.alert.checkChargerId"));
			return;
		}
		
		$("#prjGrpId").val($.osl.selPrjGrpId);
		
		
   		var fd = $.osl.formDataToJsonArray(formId);
		
		fd.append("reqGrpDescNotBr", $("#reqGrpDesc").val());
		
    	var reqGrpLinkReqList = $.osl.datatable.list["req3001ConnectReqTable"].targetDt.originalDataSet;
    	if(!$.osl.isNull(reqGrpLinkReqList) && reqGrpLinkReqList.length > 0){
    		var reqIdList = [];
    		$.each(reqGrpLinkReqList, function(idx, map){
    			reqIdList.push({prjId:map.prjId, reqId: map.reqId, reqLinkOrd:map.rn});
    		});
    		fd.append("reqGrpLinkReqList",JSON.stringify(reqIdList));	
    	}
    	
    	
       	
       	fd.append("fileHistory",JSON.stringify(fileUploadObj.getFiles()));
		
      	
		$.each(fileUploadObj.getFiles(), function(idx, map){
			map.meta.atchFileId = $("#atchFileId").val();
			
			fd.append("file",map);
		});
      
		
   		
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/req/req3000/req3000/insertReq3001ReqGrpInfoAjax.do'/>"
   			, "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);
		
   		
   		ajaxObj.setFnSuccess(function(data){
   			
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   		   		$.osl.datatable.list["req3000Table"].targetDt.reload();
   			}
   		});
   		
  		
   		ajaxObj.send();
   		
      
	}
	

	
    var submitUpdateAction = function(){
		var form = $('#'+formId);    		
    	
		
		if (!form.valid()) {
			return;
		}
		
		if($.osl.isNull($("#reqGrpUsrId").val())||$("#reqGrpUsrId").val() == ""){
			$.osl.alert($.osl.lang("req3000.alert.checkUsrId"));
			return;
		}
		
		if($.osl.isNull($("#reqGrpChargerId").val())||$("#reqGrpChargerId").val() == ""){
			$.osl.alert($.osl.lang("req3000.alert.checkChargerId"));
			return;
		}
		
       	
   		var fd = $.osl.formDataToJsonArray(formId);
       	
       	
   		fd.append("reqGrpDescNotBr", $("#reqGrpDesc").val());
       	
   		
   		var reqGrpLinkReqList = $.osl.datatable.list["req3001ConnectReqTable"].targetDt.originalDataSet;
    	if(!$.osl.isNull(reqGrpLinkReqList) && reqGrpLinkReqList.length > 0){
    		var reqIdList = [];
    		$.each(reqGrpLinkReqList, function(idx, map){
    			reqIdList.push({prjId:map.prjId, reqId: map.reqId, reqLinkOrd:map.rn});
    		});
    		fd.append("reqGrpLinkReqList",JSON.stringify(reqIdList));	
    	}
       	
       	
       	var uploadFileList = [];
       	$.each(fileUploadObj.getFiles(), function(idx, map){
       		if(!map.hasOwnProperty("source") || map.source == "database"){
       			return true;
       		}
       		uploadFileList.push(map);
       	});
       	
       	uploadFileList = uploadFileList.concat(uploadRemoveFiles);
       	
		console.log(uploadFileList);
		
       	
       	fd.append("fileHistory",JSON.stringify(uploadFileList));
       	
   		
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/req/req3000/req3000/updateReq3001ReqInfoAjax.do'/>", "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   		   		$.osl.datatable.list["req3000Table"].targetDt.reload();
   			}
   		});
   		
	   	
	   	ajaxObj.send();
   		
   		
    };
    
  	
	$("#searchUsrNmBtn").click(function(){
		var data = {
				usrNm : $("#reqGrpUsrNm").val()
		};
		var options = {
				modalTitle:$.osl.lang("req3000.title.selectUsr"),
				idKey: "searchUsr",
				closeConfirm: true,
				autoHeight:false,
				modalSize: "xl",
				callback:[{
					targetId: "selectUsr",
					actionFn: function(thisObj){
						var temp = OSLCmm6401Popup.getUsrInfo();
						if(!$.osl.isNull(temp)){
							OSLReq3001Popup.setUsrInfo(temp);
						}
					}
				}]
		};
		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6400/selectCmm6401View.do',data,options);
	});
  	
	
	$("#searchChargerNmBtn").click(function(){
		var data = {
				usrNm : $("#reqGrpChargerNm").val()
		};
		var options = {
				modalTitle:$.osl.lang("req3000.title.selectCharger"),
				idKey: "searchUsr",
				closeConfirm: true,
				autoHeight:false,
				modalSize: "xl",
				callback:[{
					targetId: "selectUsr",
					actionFn: function(thisObj){
						var temp = OSLCmm6401Popup.getUsrInfo();
						if(!$.osl.isNull(temp)){
							OSLReq3001Popup.setChargerInfo(temp);
						}
					}
				}]
		};
		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6400/selectCmm6401View.do',data,options);
	});
	
	$("#req3000SaveSubmit").click(function(){
		var form = $("#"+formId);
		
		
		if(!form.valid()){
			return;
		}
		
		
		$.osl.confirm($.osl.lang("req3000.confirm."+type),null,function(result) {
			if (result.value) {
	        	fileUploadObj.upload();
	        }	
		});
	})
	
	
	$("#reqGrpUsrNm").change(function(){
		$("#reqGrpUsrId").val("");
	});
	
	
	$("#reqGrpChargerNm").change(function(){
		$("reqGrpChargerId").val("");
	});
	
	
	$("#reqGrpUsrNm").keydown(function(e){
		if(e.keyCode=='13'){
			
			$("#searchUsrNmBtn").click();
		}
	});
	
	
	$("#reqGrpChargerNm").keydown(function(e){
		if(e.keyCode=='13'){
			
			$("#searchUsrNmBtn").click();
		}
	});
	
	
	var actionHide = function(tableId){
		if(tableId == "req3001ConnectReqTable"){
			$.osl.datatable.list["req3001ConnectReqTable"].targetDt.getColumnByField('actions').visible=false;
			$.osl.datatable.list["req3001ConnectReqTable"].targetDt.columnHide();
			
		}else if(tableId == "req3001UnconnectReqTable"){
			$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.getColumnByField('actions').visible=false;
			$.osl.datatable.list["req3001UnconnectReqTable"].targetDt.columnHide();
		}
	}
	return {
        
        init: function() {
        	documentSetting();
        },setChargerInfo:function(temp){
    		var parseTemp = JSON.parse(temp);
    		
    		$("#reqGrpChargerNm").val(parseTemp.usrNm);
    		$("#reqGrpChargerId").val(parseTemp.usrId);
    	},setUsrInfo:function(temp){
    		var parseTemp = JSON.parse(temp);
    		
    		$("#reqGrpUsrNm").val(parseTemp.usrNm);
    		$("#reqGrpUsrId").val(parseTemp.usrId);
    	}
    };
    
   
    
}();

$.osl.ready(function(){
	OSLReq3001Popup.init();
});
</script>

