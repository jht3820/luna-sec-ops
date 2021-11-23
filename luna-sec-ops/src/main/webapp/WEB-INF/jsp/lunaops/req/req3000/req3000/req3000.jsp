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
						<div id="req3002ConnectReqTable"></div>
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
    	
    	$.osl.datatable.setting("req3002ConnectReqTable",{
			data: {
				source: {
					read: {
						url: "/req/req3000/req3000/selectReq3001ListAjaxView.do",
						params:{
							reqGrpId: $("#reqGrpId").val()
    					},
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title:"No.", textAlign: 'center', width: 25, autoHide: false, sortable: false, autoHide: false},
				{field: 'reqOrd', title: '요구사항 번호', textAlign: 'left', width: 80, search:true, autoHide: false },
				{field: 'reqNm', title: '요구사항 명', textAlign: 'left', width: 100 , search:true, autoHide: false, sortable: false}
			],
			searchColumns:[
				{field: 'reqUsrNm', title: '요청자', searchOrd: 5},
				{field: 'reqChargerNm', title: '담당자', searchOrd: 6},
				{field: 'reqProType', title: '처리유형', searchOrd: 7, searchType:"select", searchCd:"REQ00001"},
			],
			actionBtn:{
				"title":"선택",
				"dblClick":true,
				"update":false,
				"delete":false
			},
			actionFn:{
				"dblClick":function(rowData,datatableId, type, rowNum){
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
					
				},
			}
		});
    	
        
    	$('.osl-tab-content__folding-btn').click(function(){
    		
       		if($('#req3000ReqGrpWrap').hasClass('osl-portlet-collapse__custom-size')){
       			
              	$('.osl-tab-content__folding-btn').removeClass('w-100');
       			
       			$('#req3000ReqGrpInfo').removeClass('kt-hide');
       			
       			$('.osl-portlet-expand,.osl-portlet-collapse').removeClass('osl-portlet-collapse__custom-size');
       		
       		}else{
       			
              	$('.osl-tab-content__folding-btn').addClass('w-100');
              	
       			$('#req3000ReqGrpInfo').addClass('kt-hide');
				
       			$('.osl-portlet-expand,.osl-portlet-collapse').addClass('osl-portlet-collapse__custom-size');
       		}
     	});
    	
        
    	$( window ).resize( function() {
			var windowWidth = $(window).width();
			
			if(windowWidth>=1024){
				
				if($('#req3000ReqGrpInfo').hasClass('kt-portlet--collapse')||$('#req3000ReqGrpInfo').hasClass('kt-hide')){
					
	            	$('#req3000ReqGrpInfo').addClass('kt-hide');
					
	     			$('.osl-portlet-expand,.osl-portlet-collapse').addClass('osl-portlet-collapse__custom-size');
					
	            	$('.osl-tab-content__folding-btn').addClass('w-100');
            	
				}else{
					
	     			$('.osl-portlet-expand,.osl-portlet-collapse').removeClass('osl-portlet-collapse__custom-size');
	       			
					$('.osl-tab-content__folding-btn').removeClass('w-100');
	     		}
     			
				portlet.expand();
          	
            }else{
				
            	if($('#req3000ReqGrpInfo').hasClass('kt-hide')||$('#req3000ReqGrpInfo').hasClass('kt-portlet--collapse')){
					
             		$('.osl-portlet-expand,.osl-portlet-collapse').removeClass('osl-portlet-collapse__custom-size');
					
            		$('#req3000ReqGrpInfo').removeClass('kt-hide');
         			
          			portlet.collapse();
           		
            	}else{
         			
          			portlet.expand();
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

