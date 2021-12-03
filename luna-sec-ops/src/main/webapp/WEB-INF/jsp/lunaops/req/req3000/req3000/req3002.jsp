<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<form class="kt-form" id="frReq3002">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="prjId" id="prjId" value="${param.paramPrjId}">
	<input type="hidden" name="prjGrpId" id="prjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="reqGrpUsrId" id="reqGrpUsrId" value="${param.paramReqGrpUsrId}">
	<input type="hidden" name="reqGrpChargerId" id="reqGrpChargerId" value="${param.paramReqGrpChargerId}">
	<input type="hidden" name="reqGrpId" id="reqGrpId" value="${param.paramReqGrpId}">
	<input type="hidden" name="atchFileId" id="atchFileId">
	<div class="row">
		<div class="col-lg-5 col-md-12 col-sm-12 col-12 osl-tab-content--folding osl-portlet-collapse" id="req3000ReqGrpWrap">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="req3000ReqGrpInfo">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<i class="fa flaticon2-layers-1 kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqInfo">그룹 요구사항 정보</span>
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
			<div class="float-right osl-tab-content__folding-btn kt-hidden-tablet kt-hidden-mobile">
				<div class="btn btn-sm btn-icon btn-clean btn-icon-md"></div>
			</div>
		</div>
		<div class="col-lg-7 col-md-12 col-sm-12 col-12 osl-portlet-expand kt-margin-t-20-tablet kt-margin-t-20-mobile" id="req3000GrpLinkWrap">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="req3000GrpLinkInfo">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<i class="fa flaticon2-layers-1 kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqInfo"><span data-lang-cd="req3000.label.linkedReqInfo">연결된 요구사항 정보</span></span>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="col-lg-12 col-md-12 col-sm-12 col-12">
						<label class="kt-padding-l-10 kt-padding-r-10"><i class="fas fa-stream kt-margin-r-5"></i><span data-lang-cd="req3000.label.linkedReqTypeList">연결 요구사항 처리 유형별 현황</span></label>
						<div class="col-lg-12 col-md-12 col-sm-12 card">
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
						<label class="kt-padding-l-10 kt-padding-r-10 kt-margin-t-20"><i class="fas fa-stream kt-margin-r-5"></i><span data-lang-cd="req3000.label.linkedReqInfo">연결 요구사항 정보</span></label>
						
						<div id="processCard">
						</div>
						
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

//파일업로드 셋팅
var fileUploadObj;

//portlet세팅
var portletAll=[];

var OSLReq3002Popup = function () {
	var formId = 'frReq3002'
	
	//edit 목록
	var formEditList = [];
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	var documentSetting = function(){
		
		//포틀릿셋팅
		var portlet = new KTPortlet('req3000ReqGrpInfo', $.osl.lang("portlet"));
		
		//edit 세팅
    	formEditList.push($.osl.editorSetting("reqGrpDesc", {
    		toolbar: false,
			disableResizeEditor: false,
			disableDragAndDrop: true,
			disabledEditor: true,
			height:260
    	}));
    	
    	//파일 업로드 세팅
    	fileUploadObj = $.osl.file.uploadSet("fileListDiv",{
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": $("#atchFileId").val(), "fileSn": 0},
    		maxNumberOfFiles:260,
    		isDraggingOver: false,
    		fileDownload: true,
    		fileReadonly: true,
    		
    	});
    	fileUploadObj.reset();
    	//그룹 요구사항 정보 조회
    	selectReqGrpInfo();
    	//프로세스
		fnProcessList();
    	
        //folding 버튼 클릭   	
    	$('.osl-tab-content__folding-btn').click(function(){
    		//열기
       		if($('#req3000ReqGrpWrap').hasClass('osl-portlet-collapse__custom-size')){
       			//folding btn 사이즈 변경 제거
              	$('.osl-tab-content__folding-btn').removeClass('w-100');
       			//folding portlet 표출
       			$('#req3000ReqGrpInfo').removeClass('kt-hide');
       			//portlet 사이즈 변경 5%,95%
       			$('.osl-portlet-expand,.osl-portlet-collapse').removeClass('osl-portlet-collapse__custom-size');
       		//접기
       		}else{
       			//folding btn 사이즈 변경 제거
              	$('.osl-tab-content__folding-btn').addClass('w-100');
              	//folding portlet 숨김
       			$('#req3000ReqGrpInfo').addClass('kt-hide');
				//portlet 사이즈 변경 제거
       			$('.osl-portlet-expand,.osl-portlet-collapse').addClass('osl-portlet-collapse__custom-size');
       		}
     	});
    	
        //folding효과 resize시 물고 가기
    	$( window ).resize( function() {
			var windowWidth = $(window).width();
			/*pc(제어는 세로 접힘 class'osl-portlet-collapse__custom-size',folding portlet 숨김 -- 기존 portlet collapse구조와 상이)*/
			if(windowWidth>=1024){
				//접기
				if($('#req3000ReqGrpInfo').hasClass('kt-portlet--collapse')||$('#req3000ReqGrpInfo').hasClass('kt-hide')){
					//folding portlet 숨기기
	            	$('#req3000ReqGrpInfo').addClass('kt-hide');
					//portlet 사이즈 변경 5%,95%
	     			$('.osl-portlet-expand,.osl-portlet-collapse').addClass('osl-portlet-collapse__custom-size');
					//folding btn 사이즈 변경
	            	$('.osl-tab-content__folding-btn').addClass('w-100');
            	//열기
				}else{
					//portlet 사이즈 변경 제거
	     			$('.osl-portlet-expand,.osl-portlet-collapse').removeClass('osl-portlet-collapse__custom-size');
	       			//folding btn 사이즈 변경 제거
					$('.osl-tab-content__folding-btn').removeClass('w-100');
	     		}
     			//portlet 무조건 열기
				portlet.expand();
          	/*tablet,mobile(제어는 가로접힘 접힘 class'kt-portlet--collapse' -- 기존 portlet collapse구조와 동일)*/
            }else{
				//접기
            	if($('#req3000ReqGrpInfo').hasClass('kt-hide')||$('#req3000ReqGrpInfo').hasClass('kt-portlet--collapse')){
					//사이즈 변경제거
             		$('.osl-portlet-expand,.osl-portlet-collapse').removeClass('osl-portlet-collapse__custom-size');
					//folding portlet 표출
            		$('#req3000ReqGrpInfo').removeClass('kt-hide');
         			//portlet 닫기
          			portlet.collapse();
           		//열기
            	}else{
         			//portlet 열기
          			portlet.expand();
            	}
             }
           });
    	}
	
	/**
	 * 	그룹 요구사항 정보 조회
	*/
    var selectReqGrpInfo = function(){
		
    	var data = {
    			prjGrpId: $("#prjGrpId").val(),
    			prjId: $("#prjId").val(),
    			reqGrpId: $("#reqGrpId").val()
    	}
    	//Ajax 설정
    	var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req3000/req3000/selectReq3000ReqInfoAjax.do'/>", "async":"true"}
				,data);
    	//Ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
				
			}else{
				//요구사항 정보 세팅
		    	$.osl.setDataFormElem(data.reqInfoMap,"frReq3000");
				
		    	$("#reqGrpChargerNm").val(data.reqInfoMap.reqGrpChargerNm);
		    	$("#reqGrpUsrNm").val(data.reqInfoMap.reqGrpUsrNm);
		    	$("#reqGrpNo").val(data.reqInfoMap.reqGrpNo);
		    	$("#reqGrpDesc").summernote("code",data.reqInfoMap.reqGrpDesc);
		    	//$("#reqGrpDesc").val(data.reqInfoMap.reqGrpDesc);
		    	$("#reqGrpNm").val(data.reqInfoMap.reqGrpNm);
		    	$("#reqGrpLinkCnt").text(data.reqInfoMap.reqGrpLinkCnt);
				
		    	/* var _oriText = $("#reqGrpDesc").val();
		    	var newText = _oriText.replace(/<br>/gi,"");
		    	console.log(newText);
		    	$("#reqGrpDesc").val(newText); */
		    	
		    	//완료된 프로젝트 수 세기
		    	var endReqCnt = 0;
		    	$.each(data.reqGrpConList, function(index, item){
		    		if(item.reqProType == "4"){
		    			endReqCnt++;
		    		}
		    	});
		    	$("#reqOngoing").text(data.reqInfoMap.reqGrpLinkCnt - endReqCnt);
		    	$("#reqEnd").text(endReqCnt);
		    	
		    	//edit 세팅
		    	formEditList.push($.osl.editorSetting("reqGrpDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:260
		    	}));
		    	
		    	//파일Sn넣기
		    	fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
		    	
		    	//파일 목록 세팅
		    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
		    	
			}
    	});
		
		//AJAX 전송
		ajaxObj.send();
    };
    /**
	* function : fnProcessList 
	* function 설명 : 프로세스 목록 가져와 그리기
	*/
	var fnProcessList = function(){
		var data = {
				delCd: "02"
		};
		
		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100ProcessListAjax.do'/>", "async": true}
				, data);
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(datas){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var processes = datas.data;
				$.each(processes, function(idx, value){
					//그리기
					var str = '<div class="kt-portlet kt-portlet--mobile process-div" id="processPortlet'+idx+'" data-target-div="process'+idx+'">'
								+ '<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block">'
									+ '<div class="col-lg-7 col-md-12 col-sm-12 col-12 kt-padding-l-0 osl-display__flex osl-flex-flow--row osl-flex-flow--column-mobile">'
										+ '<h4 class="kt-font-boldest kt-font-brand">'
											+ '<i class="fa fa-th-large kt-margin-r-5"></i>' + $.osl.escapeHtml(value.processNm)
										+ '</h4>'
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
										/* begin :: 그리드 */
										+ '<div class="osl-dsh-flowchart kt-margin-20 chart-div">'
											/* chart */
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
			}
    	});
		//ajax 전송
    	ajaxObj.send();		
	};
    /**
	* function : fnGetAllProcessFlow
	* function : 프로젝트의 모든 작업흐름을 가져와 프로세스별로 구분 
	*/
	var fnGetAllProcessFlow = function(){
		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100FlowListAndChargerCntAjax.do'/>", "async": true}
    			,{"usrId" : $.osl.user.userInfo.usrId});
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
	           //같은 프로세스 id로 묶기
	           var allProcessFlowList = {};
	           var flowList = data.flowList;
	           var flowLinkList = data.flowLinkList;

	           // 프로세스 별 작업흐름 목록
	           var processFlowList = {};
	           // 작업흐름 연결 정보
	           var processFlowLinkList = {};
	            
	           // 프로젝트에 프로세스 ID 존재할 경우
	           if(!$.osl.isNull(flowList)){
	               
	              // 작업흐름 list loop
	              $.each(flowList, function(idx, map){
	                  
	                 var processId = map.processId;
	                 // 프로세스 id 해당 값 없을경우
	                 if($.osl.isNull(processFlowList[processId])){
	                    // 빈 배열 생성
	                    processFlowList[processId] = [];
	                 }
	                 // 프로세스 id 별로 작업흐름 데이터 push
	                 processFlowList[processId].push(map); 
	              });
	           }
	            
	           if(!$.osl.isNull(flowLinkList)){
	               // 작업흐름 연결 정보 list loop
	              $.each(flowLinkList, function(idx, map){
	                  
	                 var processId = map.processId;
	                 // 프로세스 id 해당 값 없을경우
	                 if($.osl.isNull(processFlowLinkList[processId])){
	                    // 빈 배열 생성
	                    processFlowLinkList[processId] = [];
	                 }
	                  
	                 // 프로세스 id 별로 작업흐름 연결 데이터 push
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
	           
	           //차트 그리기
	           var index = 0;
	           $.each(allProcessFlowList, function(processId, value){
	        	   fnFlowChart(index, processId, value.flowList, value.flowLinkList);
	        	   //데이터 테이블 아이디에 붙는 index, 첫번째 processId, flowId 임시 전달
	        	   processTableSetting(index, processId, value.flowList[0].flowId);
	        	   //포틀렛 세팅
	        	   portletAll.push(new KTPortlet('processPortlet'+index, $.osl.lang("portlet")));	
	        	   index++;
	           });
	
		   		//다그렸으므로 이벤트 적용
		   		fnProcessEvt();
	        }
	     });
	     //ajax 전송
	     ajaxObj.send();   
	}
	//프로세스 데이터 테이블 세팅  
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
						//페이지 그룹단위 변경
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
					//해당 프로세스 항목 지우기
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
	   							//다시 그리기
	   							//해당 프로세스 항목 지우기
								$("#processPortlet"+tablenum).find(".chart-div").empty();
								fnGetProcessFlow(tablenum, paramProcessId);
								
	   							//데이터 테이블 숨기기
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
					//현재 데이터 테이블 아이디
					var datatableId = "processReqTable_"+tablenum;
					var datatable = $.osl.datatable.list[datatableId].targetDt;
					
					var totalCharger = 0;
					var totalAll = 0;
					
					//단계에 담당, 전체 수 넣기
					var chargerSpans = $("#processPortlet"+tablenum).find(".flow-charger");
					$.each(chargerSpans, function(index, value){
						totalCharger += Number($(value).children().text());
						totalAll +=  Number($(value).siblings(".flow-all-charger").children().text());
					});
					
					//프로세스 담당, 전체 수 넣기
					$("#processPortlet"+tablenum).find(".charger-badge").text(totalCharger);
					$("#processPortlet"+tablenum).find(".all-badge").text(totalAll);

				}
			}
		});
	}

	/**
	* function : fnFlowChart
	* function 설명 : 	프로세스 내부 작업 흐름 정렬하기
	*/
	var fnFlowChart = function(num, processId, flowList, flowLinkList){

		if($.osl.isNull(flowList) || flowList.length == 0){
			return true;
		}
		var list = [];
		
		/* 대시보드 데이터 세팅 -- 시작 */
	    //작업흐름 Id별 다음 작업흐름 Id
	    var flowNextIdList = {};
	    
	    //작업흐름 연결 데이터 flowNextId 세팅
	    if(!$.osl.isNull(flowLinkList) && flowLinkList.length > 0){
	       $.each(flowLinkList, function(idx, map){
	          //값 없는 경우 생성
	          if(!flowNextIdList.hasOwnProperty(map.flowId)){
	             flowNextIdList[map.flowId] = [];
	          }
	          flowNextIdList[map.flowId].push(map.flowNextId);
	       });
	    }
	     
	    //작업흐름 Id: 정보 
	    var flowInfoList = {};
	      
	    //시작 작업흐름 Id
	    var startFlowId;
	    //종료 작업흐름 Id
	    var doneFlowId;
	    var doneFlow;
	      
	    //이미 추가된 작업흐름 index check
	    var addFlowCheck = [];
	     
	    //작업흐름 데이터 세팅 하기
	    $.each(flowList, function(idx, map){
	       //시작 작업흐름인 경우 맨 앞으로 작업흐름 추가
	       if(map.flowStartCd == "01"){
	          //시작 단계 추가
	          //$("#프로세스 영역 ID").prepend('작업흐름 UI');
	          //시작 작업흐름 Id
	          startFlowId = map.flowId;
	          list.push(map);
	       }
	        
	       //종료 작업흐름인경우 임시 저장
	       if(map.flowDoneCd == "01"){
	          doneFlowId = map.flowId;
	          doneFlow = map;
	       }
	       map["flowNextId"] = flowNextIdList[map.flowId];
	       flowInfoList[map.flowId] = map;
	    });
	
	    //작업흐름 추가 재귀
	    var innerFlowAppend = function(currentFlowId) {
	    	  
	       //현재 대상 작업흐름 정보
	       var flowInfo = flowInfoList[currentFlowId];
	      
	       //다음 작업흐름
	       var nextFlowIds = null;
	       
	       if(!$.osl.isNull(flowInfoList[currentFlowId]) && flowInfoList[currentFlowId].hasOwnProperty("flowNextId")){
	    	   nextFlowIds = flowInfoList[currentFlowId]["flowNextId"];
	       }
	       //size가 0이면 true
	       if($.osl.isNull(nextFlowIds)){
	    	   return true;
	       }
	       else if(!$.osl.isNull(nextFlowIds) && nextFlowIds.length == 0){
	    	   return true;
	       }
	       //이미 추가된 작업흐름 skip
	       else if(addFlowCheck.indexOf(currentFlowId) != -1){
	          return true;
	       }
	       //시작단계와 종료단계는 skip
	       if(flowInfo.flowStartCd == "02" && flowInfo.flowDoneCd == "02"){
	          //해당 작업흐름 추가
	          //$("#프로세스 영역 ID").append('작업흐름 UI');
	          addFlowCheck.push(currentFlowId);
	          list.push(flowInfo);
	       }
	       
	       //종료 단계가 아닌 경우(다음 아이디 값이 있으므로)
	       if(!$.osl.isNull(nextFlowIds)){
	          //다음 작업흐름 loop
	          $.each(nextFlowIds, function(idx, map){
	             innerFlowAppend(map);
	          });
	       };
	       return true;
	    };
	      
	    //시작 단계 부터 재귀 호출
	    innerFlowAppend(startFlowId);
	      
	    //$("#작업흐름UI[data-flow-id="+doneFlowId+"]").appendTo("#프로세스 영역 ID")
	    list.push(doneFlow);
	    /* 대시보드 데이터 세팅 -- 종료 */
		//그리기
		fnFlowChartDraw(num, list, processId);
	};
	
	/**
	* function : fnFlowChartDraw
	* function : 프로세스 작업 흐름 그리기
	*/
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
				/* 화살표 */
				str += '<i class="fa fa-arrow-right"></i>';
			}
		});
		
		//그리기
		var processRow = $("#processCard").children("div[data-target-div=process"+num+"]").find(".chart-div");
		$(processRow).empty();
		$(processRow).append(str);
	}
    
	/**
	* function : fnProcessEvt
	* function 설명 : 프로세스 클릭 이벤트 적용
	*/
	var fnProcessEvt = function(){
		//담당 버튼 클릭 시
		$(".flow-charger").click(function(){
			//해당 데이터 테이블 id가져오기
			var item = $(this).parents(".kt-portlet__body");
			var datatableId = $(item).find(".process-datatable-div").attr("id");
			var datatable = $.osl.datatable.list[datatableId].targetDt;
			//param 넣기
			datatable.setDataSourceParam("dshProcess", "Y");
			datatable.setDataSourceParam("processId", $(this).data("processId"));
			datatable.setDataSourceParam("flowId", $(this).data("flowId"));
			datatable.setDataSourceParam("usrId", $.osl.user.userInfo.usrId);
			
			//조회하기
			//데이터 테이블 재조회
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();			
			//데이터 div 보이기
			if($(item).find(".process-datatable-div").removeClass("kt-hide"));

			//같은 process에서 이미 눌린 버튼 이팩트 제거
			$(this).parents(".chart-div").find(".flowchart-operator-outputs--active").removeClass("flowchart-operator-outputs--active");
			//클릭한 대상 표시
			$(this).addClass("flowchart-operator-outputs--active");
		});
		
		//전체 버튼 클릭 시
		$(".flow-all-charger").click(function(){
			//해당 데이터 테이블 id가져오기
			var item = $(this).parents(".kt-portlet__body");
			var datatableId = $(item).find(".process-datatable-div").attr("id");
			var datatable = $.osl.datatable.list[datatableId].targetDt;
			//param 넣기
			datatable.setDataSourceParam("dshProcess", "Y");
			datatable.setDataSourceParam("processId", $(this).data("processId"));
			datatable.setDataSourceParam("flowId", $(this).data("flowId"));
			datatable.setDataSourceParam("usrId", "");
			//조회하기
			//데이터 테이블 재조회
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
			
			//데이터 div 보이기
			if($(item).find(".process-datatable-div").removeClass("kt-hide"));
			
			//같은 process에서 이미 눌린 버튼 이팩트 제거
			$(this).parents(".chart-div").find(".flowchart-operator-outputs--active").removeClass("flowchart-operator-outputs--active");
			//클릭한 대상 표시
			$(this).addClass("flowchart-operator-outputs--active");
		});
				
	};
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
    
}();

$.osl.ready(function(){
	OSLReq3002Popup.init();
});
</script>

