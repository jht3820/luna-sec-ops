<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<form class="kt-form h-100" id="frReq3002">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="prjId" id="prjId" value="${param.paramPrjId}">
	<input type="hidden" name="prjGrpId" id="prjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="reqGrpUsrId" id="reqGrpUsrId" value="${param.paramReqGrpUsrId}">
	<input type="hidden" name="reqGrpChargerId" id="reqGrpChargerId" value="${param.paramReqGrpChargerId}">
	<input type="hidden" name="reqGrpId" id="reqGrpId" value="${param.paramReqGrpId}">
	<input type="hidden" name="atchFileId" id="atchFileId">
	<div class="row position-relative h-100 kt-margin-0">
		<div class="osl-tab-content--folding osl-portlet-collapse" id="req3000ReqGrpWrap">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 h-100" id="req3000ReqGrpInfo">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa flaticon2-layers-1 kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqInfo">그룹 요구사항 정보</span>
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar kt-hidden-desktop">
						<div class="kt-portlet__head-group">
							<a href="#" id="hideAndShowReqGrpInfo"  data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-up"></i></a>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="col-lg-12 col-md-12 col-sm-12 col-12 kt-padding-r-20">
						<div class="row">
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label><i class="fas fa-sort-amount-down kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpNo">그룹 요구사항 번호</span></label>
									<input type="text" class="form-control" id="reqGrpNo" name="reqGrpNo" readonly="readonly">
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label><i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpUsr">요청자</span></label>
									<div class="input-group">
										<input type="text" class="form-control" id="reqGrpUsrNm" name="reqGrpUsrNm" readonly="readonly" readonly="readonly">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
								<div class="form-group">
									<label><i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpCharger">그룹 요구사항 담당자</span></label>
									<div class="input-group">
										<input type="text" class="form-control" id="reqGrpChargerNm" name="reqGrpChargerNm" readonly="readonly" >
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpNm">그룹 요구사항 제목</span></label>
									<input type="text" class="form-control" id="reqGrpNm" name="reqGrpNm" readonly="readonly" placeholder="연결된 그룹요구사항이 없습니다.">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req3000.label.reqGrpDesc">그룹 요구사항 내용</span></label>
									<textarea name="reqGrpDesc" id="reqGrpDesc"></textarea>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<i class="fa fa-file-upload kt-margin-r-5"></i><span data-lang-cd="req3000.label.fileUpload">파일첨부</span>
									<div class="kt-uppy fileReadonly" id="fileListDiv">
										<div class="kt-uppy__dashboard"></div>
										<div class="kt-uppy__progress"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="osl-tab-content__folding-btn kt-hidden-tablet kt-hidden-mobile">
				<div class="btn btn-sm btn-icon btn-clean btn-icon-md"></div>
			</div>
		</div>
		<div class="osl-portlet-expand kt-margin-t-20-tablet kt-margin-t-20-mobile" id="req3000GrpLinkWrap">
			<div class="kt-portlet kt-portlet--mobile" id="req3000GrpLinkInfo">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa flaticon2-layers-1 kt-margin-r-5"></i>
							<span data-lang-cd="req4101.label.group.groupReqInfo">
								<span data-lang-cd="req3000.label.linkedReqInfo">연결된 요구사항 정보</span>
							</span>
						</h5>
					</div>
				</div>
			</div>
			<div class="kt-portlet">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest">
							<i class="fas fa-stream kt-margin-r-5"></i><span data-lang-cd="req3000.label.linkedReqTypeList">연결 요구사항 처리 유형별 현황</span>
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="osl-widget kt-padding-l-15">
						<div class="osl-widget-info__item">
							<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqAll.png"></div>
							<div class="osl-widget-info__item-info">
								<a href="#" class="osl-widget-info__item-title"><span data-lang-cd="req3000.label.total">전체</span></a>
								<div class="osl-widget-info__item-desc" id="reqGrpLinkCnt" name="reqGrpLinkCnt"></div>
							</div>
						</div>
						<div class="osl-widget-info__item">
							<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqInProgress.png"></div>
							<div class="osl-widget-info__item-info">
								<a href="#" class="osl-widget-info__item-title"><span data-lang-cd="req3000.label.ongoing">진행</span></a>
								<div class="osl-widget-info__item-desc" id="reqOngoing" name="reqOngoing"></div>
							</div>
						</div>
						<div class="osl-widget-info__item">
							<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqDone.png"></div>
							<div class="osl-widget-info__item-info">
								<a href="#" class="osl-widget-info__item-title"><span data-lang-cd="req3000.label.done">완료</span></a>
								<div class="osl-widget-info__item-desc" id="reqEnd" name="reqEnd"></div>
							</div>
						</div>
					</div>
				</div>	
				
			</div>
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="req3000GrpLinkInfo">
				<div class="kt-portlet__head">	
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest">
							<i class="fas fa-stream kt-margin-r-5"></i><span data-lang-cd="req3000.label.linkedReqInfo">연결 요구사항 정보</span>
						</h5>
					</div>			
					
					</div>
				<div class="kt-portlet__body kt-padding-10">
					<div class="osl-tab-content kt-padding-10">
						<div id="processCard">
					</div>
				</div>
			</div>
			
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand"	data-dismiss="modal">
		<i class="fa fa-window-close"></i>
		<span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span>
	</button>
</div>


<script>
"use strict";


var fileUploadObj;


var portletAll=[];

var OSLReq3002Popup = function () {
	var formId = 'frReq3002'
	
	
	var formEditList = [];
	
	
	var formValidate = $.osl.validate(formId);
	
	var documentSetting = function(){
		
		
		var portlet = new KTPortlet('req3000ReqGrpInfo', $.osl.lang("portlet"));
		
		
    	formEditList.push($.osl.editorSetting("reqGrpDesc", {
    		toolbar: false,
			disableResizeEditor: false,
			disableDragAndDrop: true,
			disabledEditor: true,
			height:260
    	}));
    	
    	
    	fileUploadObj = $.osl.file.uploadSet("fileListDiv",{
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": $("#atchFileId").val(), "fileSn": 0},
    		maxNumberOfFiles:260,
    		isDraggingOver: false,
    		fileDownload: true,
    		fileReadonly: true,
    		
    	});
    	fileUploadObj.reset();
    	
    	selectReqGrpInfo();
    	
		fnProcessList();
        
    	$('.osl-tab-content__folding-btn').click(function(){
    		
    		heightSize();
    		
       		if($('#req3000ReqGrpWrap').hasClass('osl-portlet-collapse__custom-size')){
       			$('#req3000ReqGrpInfo').css({width:'100%'});
       			$('.osl-portlet-collapse').stop().animate({
       				left: '0'
       			});
       			$('.osl-portlet-expand').animate({
       				width: '60%'
       			});
       			$('.osl-portlet-expand,.osl-portlet-collapse').removeClass('osl-portlet-collapse__custom-size');
       		
       		}else{
       			$('.osl-portlet-collapse').stop().animate({
       				left: '-34%'
       			},function(){
       				$('#req3000ReqGrpInfo').css({width:'0'});
       			});
       			$('.osl-portlet-expand').animate({
       				width: '94%'
       			});
       			$('.osl-portlet-expand,.osl-portlet-collapse').addClass('osl-portlet-collapse__custom-size');
       		}
     	});
    	
        
    	$( window ).resize( function() {
			var windowWidth = $(window).width();

    		
    		heightSize();
    		
			
			if(windowWidth>=1024){
				
				if($('.osl-portlet-expand,.osl-portlet-collapse').hasClass('osl-portlet-collapse__custom-size')||$('#req3000ReqGrpInfo').hasClass('kt-portlet--collapse')){
	       			$('.osl-portlet-collapse').stop().animate({
	       				left: '-34%',
	       				width: '39%'
	       			},function(){
	       				$('#req3000ReqGrpInfo').css({width:'0'});
	       			});
	       			$('.osl-portlet-expand').animate({
	       				width: '94%'
	       			});
	       			$('.osl-portlet-expand,.osl-portlet-collapse').addClass('osl-portlet-collapse__custom-size');
            	
				}else{
	       			$('.osl-portlet-collapse').stop().animate({
	       				left: '0'
	       			});
	       			$('.osl-portlet-expand').animate({
	       				width: '60%'
	       			});
	       			$('.osl-portlet-expand,.osl-portlet-collapse').removeClass('osl-portlet-collapse__custom-size');
	     		}
     			
				portlet.expand();
          	
            }else{
        		$('.osl-portlet-expand').css({width:'100%'});
        		$('.osl-portlet-collapse').css({width:'100%',left: '0'});
        		$('#req3000ReqGrpInfo').css({width:'100%'});
				
            	if($('.osl-portlet-expand,.osl-portlet-collapse').hasClass('osl-portlet-collapse__custom-size')||$('#req3000ReqGrpInfo').hasClass('kt-portlet--collapse')){
         			
          			portlet.collapse();
          			$('.osl-portlet-expand,.osl-portlet-collapse').addClass('osl-portlet-collapse__custom-size');
           		
            	}else{
         			
          			portlet.expand();
          			$('.osl-portlet-expand,.osl-portlet-collapse').removeClass('osl-portlet-collapse__custom-size');
            	}
             }
           });
    	}
	
	
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
		    	$("#reqGrpDesc").summernote("code",data.reqInfoMap.reqGrpDesc);
		    	
		    	$("#reqGrpNm").val(data.reqInfoMap.reqGrpNm);
		    	$("#reqGrpLinkCnt").text(data.reqInfoMap.reqGrpLinkCnt);
				
		    	
		    	
		    	
		    	var endReqCnt = 0;
		    	$.each(data.reqGrpConList, function(index, item){
		    		if(item.reqProType == "4"){
		    			endReqCnt++;
		    		}
		    	});
		    	$("#reqOngoing").text(data.reqInfoMap.reqGrpLinkCnt - endReqCnt);
		    	$("#reqEnd").text(endReqCnt);
		    	
		    	
		    	formEditList.push($.osl.editorSetting("reqGrpDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:260
		    	}));
		    	
		    	
		    	fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
		    	
		    	
		    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
		    	
			}
    	});
		
		
		ajaxObj.send();
    };
    
	var fnProcessList = function(){
		var data = {
				delCd: "02"
		};
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100ProcessListAjax.do'/>", "async": true}
				, data);
		
    	ajaxObj.setFnSuccess(function(datas){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var processes = datas.data;
				$.each(processes, function(idx, value){
					
					var str = '<div class="kt-portlet kt-portlet--mobile process-div" id="processPortlet'+idx+'" data-target-div="process'+idx+'">'
								+ '<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block">'
									+ '<div class="col-lg-7 col-md-12 col-sm-12 col-12 kt-padding-l-0 osl-display__flex osl-flex-flow--row osl-flex-flow--column-mobile">'
										+ '<h5 class="kt-font-boldest kt-font-brand">'
											+ '<i class="fa fa-th-large kt-margin-r-5"></i>' + $.osl.escapeHtml(value.processNm)
										+ '</h5>'
									+ '</div>'
									+ '<div class="col-lg-5 col-md-12 col-sm-12 col-12 text-right kt-padding-r-0">'
										+ '<div class="kt-portlet__head-group">'
											+ '<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10 invisible" data-datatable-id="processReqTable_'+idx+'" data-datatable-action="select" title="조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">'
												+ '<i class="fas fa-redo-alt"></i>'
											+ '</button>'
											+ '<button type="button" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air kt-margin-r-10" data-datatable-id="processReqTable_'+idx+'" data-datatable-action="refresh" title="새로고침" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="refresh" tabindex="5">'
												+ '<i class="fas fa-redo-alt"></i>'
											+ '</button>'
											+ '<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air"><i class="fa fa-chevron-down"></i></a>'
										+ '</div>'
									+ '</div>'
								+ '</div>'
								+ '<div class="kt-portlet__body kt-padding-10">'
									+ '<div class="osl-dash-gridkaban-bg osl-overflow--x-auto">'
										
										+ '<div class="osl-dsh-flowchart kt-margin-20 chart-div">'
											
										+ '</div>'
									+ '</div>'
									+ '<div class="process-datatable-div kt-hide" id="processReqTable_'+idx+'">'
										+ '<div class="row">'
											+ '<div class="col-lg-7 col-md-7 col-sm-8 col-8">'
											+ '<div class="osl-datatable-search" data-datatable-id=processReqTable_'+idx+'"></div>'
											+ '</div>'
										+ '</div>'
										+ '<div class="kt_datatable kt-padding-20 osl-datatable-footer__divide process-datatables" id="processReqTable_'+idx+'"></div>';
									+ '</div>'
								+ '</div>'
							+ '</div>'
						+ '</div>'
					$("#processCard").append(str);
				});
				
				fnGetAllProcessFlow();

		    	
				heightSize();
			}
    	});
		
    	ajaxObj.send();		
	};
    
	var fnGetAllProcessFlow = function(){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100FlowListAndChargerCntAjax.do'/>", "async": true}
    			,{"usrId" : $.osl.user.userInfo.usrId});
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
	           
	           var allProcessFlowList = {};
	           var flowList = data.flowList;
	           var flowLinkList = data.flowLinkList;

	           
	           var processFlowList = {};
	           
	           var processFlowLinkList = {};
	            
	           
	           if(!$.osl.isNull(flowList)){
	               
	              
	              $.each(flowList, function(idx, map){
	                  
	                 var processId = map.processId;
	                 
	                 if($.osl.isNull(processFlowList[processId])){
	                    
	                    processFlowList[processId] = [];
	                 }
	                 
	                 processFlowList[processId].push(map); 
	              });
	           }
	            
	           if(!$.osl.isNull(flowLinkList)){
	               
	              $.each(flowLinkList, function(idx, map){
	                  
	                 var processId = map.processId;
	                 
	                 if($.osl.isNull(processFlowLinkList[processId])){
	                    
	                    processFlowLinkList[processId] = [];
	                 }
	                  
	                 
	                 processFlowLinkList[processId].push(map); 
	              });
	           }
	            
	           $.each(processFlowList, function(processId, flowData){
	               
	              if($.osl.isNull(allProcessFlowList[processId])){
	                 allProcessFlowList[processId] = [];
	              }
	               
	              allProcessFlowList[processId]["flowList"] = flowData;
	              allProcessFlowList[processId]["flowLinkList"] = processFlowLinkList[processId];
	           });
	           
	           
	           var index = 0;
	           $.each(allProcessFlowList, function(processId, value){
	        	   fnFlowChart(index, processId, value.flowList, value.flowLinkList);
	        	   
	        	   processTableSetting(index, processId, value.flowList[0].flowId);
	        	   
	        	   portletAll.push(new KTPortlet('processPortlet'+index, $.osl.lang("portlet")));	
	        	   index++;
	           });
	
		   		
		   		fnProcessEvt();
	        }
	     });
	     
	     ajaxObj.send();   
	}
	
	var processTableSetting = function(tablenum, paramProcessId, paramStartFlowId){
		$.osl.datatable.setting("processReqTable_"+tablenum,{
			data: {
				source: {
					read: {
						url: "/req/req4000/req4100/selectReq4100ReqFlowListAjax.do",
						params : {
							"dshProcess" : "Y",
							"processId" : paramProcessId,
							"flowId" : paramStartFlowId,
							"usrId" : $.osl.user.userInfo.usrId
						}
					}
				},
				pageSize : 5,
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
								pagesNumber: 5
							}
						}
					 }
				 }
		 	},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'prjNm', title:'프로젝트명', textAlign: 'left', width: 150, autoHide: false, search: true},
				{field: 'reqOrd', title: '요구사항 순번', textAlign: 'left', width: 120, autoHide: false},
				{field: 'reqProTypeNm', title: '결재 상태', textAlign: 'left', width: 110, autoHide: false},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 340, search: true, autoHide: false},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 100, search: true, searchType:"date"},
				{field: 'reqUsrNm', title: '요청자', textAlign: 'center', width: 120, search: true,
					template: function (row) {
						if($.osl.isNull(row.reqUsrNm)){
							row.reqUsrNm = "";
						}
						var usrData = {
							html: row.reqUsrNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
						};
						return $.osl.user.usrImgSet(row.reqUsrImgId, usrData);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.reqUsrId);
					}
				},
				{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 120, search: true,
					template: function (row) {
						if($.osl.isNull(row.reqChargerNm)){
							return row.reqChargerNm = "-";
						}else{
							var usrData = {
								html: row.reqChargerNm,
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
							};
							return $.osl.user.usrImgSet(row.reqChargerImgId, usrData);
						}
					},
					onclick: function(rowData){
						if(rowData.reqChargerNm != "-"){
							$.osl.user.usrInfoPopup(rowData.reqChargerId);
						}
					}
				},
				{field: 'reqUsrEmail', title:'요청자e-mail', textAlign: 'left', width: 180, search: true},
				{field: 'reqUsrNum', title: '요청자 연락처', textAlign: 'center', width: 100, search: true},
			],
			searchColumns:[
				{field: 'prjGrpNm', title: $.osl.lang("req4100.field.prjGrpNm"), searchOrd: 0},
				{field: 'reqGrpNm', title: $.osl.lang("req4100.field.reqGrpNm"), searchOrd: 2},
				{field: 'reqGrpNo', title: $.osl.lang("req4100.field.reqGrpNo"), searchOrd: 3}
			],
			actionBtn:{
				"title" : "기능 버튼",
				"width" : "120",
				"dblClick": true,
				"update": false,
				"delete" : false,
				"refresh": true,
				"detail":true
			},
			actionTooltip:{
				"dblClick": "업무 처리",
				"detail" : "상세 보기"
			},
			actionFn:{
				"refresh": function(rowData, datatableId, type, rowNum){
					
					$("#processPortlet"+tablenum).find(".chart-div").empty();
					fnGetProcessFlow(tablenum, paramProcessId);
				},
				"dblClick":function(rowData, datatableId, type, rowNum){
					var reqProType = rowData.reqProType;
                    var reqId = rowData.reqId;
                    var prjId = rowData.prjId;
                    var reqNm = rowData.reqNm;
                    
                    if(reqProType != "02"){
                       $.osl.alert("처리중인 요구사항만 업무 처리가 가능합니다.");
                       return false;
                    }

                    var data = {
                          paramPrjId: prjId,
                          paramReqId: reqId
                    };
                    var options = {
                       modalSize: "fs",
                       idKey: "reqProcess"+reqId,
                       modalTitle: "["+reqNm+"] 요구사항 업무 처리",
                       closeConfirm: false,
                       callback:[{
	   						targetId: "cmm6201SaveSubmit",
	   						actionFn: function(thisObj){
	   							console.log("callback");
	   							
	   							
								$("#processPortlet"+tablenum).find(".chart-div").empty();
								fnGetProcessFlow(tablenum, paramProcessId);
								
	   							
	   							$("#"+datatableId).addClass("kt-hide");
	   							$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
	   						} 
	   					}]
                    };
                    $.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6201View.do',data,options);
				},
				"detail": function(rowData, datatableId, type, rowNum){
					var data = {
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
							paramReqUsrId: rowData.reqUsrId
						};
					var options = {
							idKey: rowData.reqId,
							modalTitle: $.osl.lang("req4100.title.detailTitle"),
							autoHeight: false,
						};
					
					$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4102View.do',data,options);
				}
			},
			theme : {
				actionBtn: {
					"dblClick" :  "",
					"refresh" : " kt-hide"
				},
				actionBtnIcon:{
					"dblClick" : "fa fa-chalkboard-teacher",
					"detail" : "fas fa-external-link-alt"
				}
			},
			callback:{
				ajaxDone: function(evt, list, datatableInfo){
					
					var datatableId = "processReqTable_"+tablenum;
					var datatable = $.osl.datatable.list[datatableId].targetDt;
					
					var totalCharger = 0;
					var totalAll = 0;
					
					
					var chargerSpans = $("#processPortlet"+tablenum).find(".flow-charger");
					$.each(chargerSpans, function(index, value){
						totalCharger += Number($(value).children().text());
						totalAll +=  Number($(value).siblings(".flow-all-charger").children().text());
					});
					
					
					$("#processPortlet"+tablenum).find(".charger-badge").text(totalCharger);
					$("#processPortlet"+tablenum).find(".all-badge").text(totalAll);

				}
			}
		});
	}

	
	var fnFlowChart = function(num, processId, flowList, flowLinkList){

		if($.osl.isNull(flowList) || flowList.length == 0){
			return true;
		}
		var list = [];
		
		
	    
	    var flowNextIdList = {};
	    
	    
	    if(!$.osl.isNull(flowLinkList) && flowLinkList.length > 0){
	       $.each(flowLinkList, function(idx, map){
	          
	          if(!flowNextIdList.hasOwnProperty(map.flowId)){
	             flowNextIdList[map.flowId] = [];
	          }
	          flowNextIdList[map.flowId].push(map.flowNextId);
	       });
	    }
	     
	    
	    var flowInfoList = {};
	      
	    
	    var startFlowId;
	    
	    var doneFlowId;
	    var doneFlow;
	      
	    
	    var addFlowCheck = [];
	     
	    
	    $.each(flowList, function(idx, map){
	       
	       if(map.flowStartCd == "01"){
	          
	          
	          
	          startFlowId = map.flowId;
	          list.push(map);
	       }
	        
	       
	       if(map.flowDoneCd == "01"){
	          doneFlowId = map.flowId;
	          doneFlow = map;
	       }
	       map["flowNextId"] = flowNextIdList[map.flowId];
	       flowInfoList[map.flowId] = map;
	    });
	
	    
	    var innerFlowAppend = function(currentFlowId) {
	    	  
	       
	       var flowInfo = flowInfoList[currentFlowId];
	      
	       
	       var nextFlowIds = null;
	       
	       if(!$.osl.isNull(flowInfoList[currentFlowId]) && flowInfoList[currentFlowId].hasOwnProperty("flowNextId")){
	    	   nextFlowIds = flowInfoList[currentFlowId]["flowNextId"];
	       }
	       
	       if($.osl.isNull(nextFlowIds)){
	    	   return true;
	       }
	       else if(!$.osl.isNull(nextFlowIds) && nextFlowIds.length == 0){
	    	   return true;
	       }
	       
	       else if(addFlowCheck.indexOf(currentFlowId) != -1){
	          return true;
	       }
	       
	       if(flowInfo.flowStartCd == "02" && flowInfo.flowDoneCd == "02"){
	          
	          
	          addFlowCheck.push(currentFlowId);
	          list.push(flowInfo);
	       }
	       
	       
	       if(!$.osl.isNull(nextFlowIds)){
	          
	          $.each(nextFlowIds, function(idx, map){
	             innerFlowAppend(map);
	          });
	       };
	       return true;
	    };
	      
	    
	    innerFlowAppend(startFlowId);
	      
	    
	    list.push(doneFlow);
	    
		
		fnFlowChartDraw(num, list, processId);
	};
	
	
	var fnFlowChartDraw = function(num, list, processId){
		
		var str = '';
		$.each(list, function(idx, value){
			if($.osl.isNull(value)){
				return true;
			}
			str += '<div class="flowchart-operator osl-flowchart__operator border" data-operator-id="previewOperator">'
					+ '<div class="flowchart-operator-function osl-min-h-px--24">';
				if(value.flowSignCd == "01"){
					str += '<li class="fa fa-file-signature" title="결재"></li>';	
				}
				if(value.flowSignStopCd == "01"){
					str += '<li class="far fa-stop-circle" title="결재 반려시 종료 유무"></li>';	
				}
				if(value.flowMiddleEndCd == "01"){
					str += '<li class="fa fa-sign-out-alt" title="종료 분기"></li>';	
				}
				if(value.flowRevisionCd == "01"){
					str += '<li class="fa fa-code" title="리비전 저장유무"></li>';	
				}
				if(value.flowDplCd == "01"){
					str += '<li class="fa fa-puzzle-piece" title="배포계획 저장 유무"></li>';	
				}
				
				str	+= '</div>'
					+ '<div class="flowchart-operator-title">'
						+ '<div class="flowchart-operator-title__lebel">'+$.osl.escapeHtml(value.flowNm)+'</div>'
						+ '<div class="flowchart-operator-menu hide">'
							+ '<button type="button" class="btn btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">'
								+ '<i class="fa fa-bars kt-padding-r-0"></i>'
							+ '</button>'
							+ '<div class="dropdown-menu dropdown-menu-right">'
								+ '<div class="dropdown-item" data-flow-action="update">'
									+ '<i class="fa fa fa-edit kt-font-primary"></i>수정'
								+ '</div>'
								+ '<div class="dropdown-item" data-flow-action="delete">'
									+ '<i class="fa fa fa-trash kt-font-primary"></i>삭제'
								+ '</div>'
							+ '</div>'
						+ '</div>'
					+ '</div>'
					+ '<div class="flowchart-operator-inputs-outputs kt-margin-0">'
						+ '<div class="flowchart-operator-inputs text-center kt-padding-10 osl-cursor-pointer flow-charger" data-process-id="'+value.processId+'" data-flow-id="'+value.flowId+'"> 담당 <span>'+value.reqChargerCnt+'</span></div>'
						+ '<div class="flowchart-operator-outputs text-center kt-padding-10 border-left osl-cursor-pointer flow-all-charger" data-process-id="'+value.processId+'" data-flow-id="'+value.flowId+'"> 전체 <span>'+value.reqFlowCnt+'</span></div>'
					+ '</div>'
				+ '</div>';
				
			if(idx < list.length-1 ){
				
				str += '<i class="fa fa-arrow-right"></i>';
			}
		});
		
		
		var processRow = $("#processCard").children("div[data-target-div=process"+num+"]").find(".chart-div");
		$(processRow).empty();
		$(processRow).append(str);
	}
    
	
	var fnProcessEvt = function(){
		
		$(".flow-charger").click(function(){
			
			var item = $(this).parents(".kt-portlet__body");
			var datatableId = $(item).find(".process-datatable-div").attr("id");
			var datatable = $.osl.datatable.list[datatableId].targetDt;
			
			datatable.setDataSourceParam("dshProcess", "Y");
			datatable.setDataSourceParam("processId", $(this).data("processId"));
			datatable.setDataSourceParam("flowId", $(this).data("flowId"));
			datatable.setDataSourceParam("usrId", $.osl.user.userInfo.usrId);
			
			
			
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();			
			
			if($(item).find(".process-datatable-div").removeClass("kt-hide"));

			
			$(this).parents(".chart-div").find(".flowchart-operator-outputs--active").removeClass("flowchart-operator-outputs--active");
			
			$(this).addClass("flowchart-operator-outputs--active");
		});
		
		
		$(".flow-all-charger").click(function(){
			
			var item = $(this).parents(".kt-portlet__body");
			var datatableId = $(item).find(".process-datatable-div").attr("id");
			var datatable = $.osl.datatable.list[datatableId].targetDt;
			
			datatable.setDataSourceParam("dshProcess", "Y");
			datatable.setDataSourceParam("processId", $(this).data("processId"));
			datatable.setDataSourceParam("flowId", $(this).data("flowId"));
			datatable.setDataSourceParam("usrId", "");
			
			
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
			
			
			if($(item).find(".process-datatable-div").removeClass("kt-hide"));
			
			
			$(this).parents(".chart-div").find(".flowchart-operator-outputs--active").removeClass("flowchart-operator-outputs--active");
			
			$(this).addClass("flowchart-operator-outputs--active");
		});
				
	};
	
	
	var heightSize = function(){
		
		var leftDiv = $('#req3000ReqGrpWrap').height();
		
		var rightDiv = $('#req3000GrpLinkWrap').height();
		
		
		if(leftDiv>rightDiv){
			
			$('#req3000GrpLinkWrap').height(leftDiv);
		
		}else if(leftDiv<rightDiv){
			
			$('#req3000ReqGrpWrap').height(rightDiv);
		}
	};
	return {
        
        init: function() {
        	documentSetting();
        }
    };
    
}();

$.osl.ready(function(){
	OSLReq3002Popup.init();
});
</script>

