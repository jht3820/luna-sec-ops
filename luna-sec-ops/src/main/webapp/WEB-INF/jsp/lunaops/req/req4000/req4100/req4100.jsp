<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg flex-wrap kt-padding-t-10 kt-padding-b-10">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req4100ReqTable" data-datatable-action="requestProcessing" title="요구사항 업무 처리" data-title-lang-cd="req4100.actionBtn.requestAcceptTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="5">
					<i class="fa fa-chalkboard-teacher"></i><span data-lang-cd="req4100.button.requestAccept">업무 처리</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air kt-hide" data-datatable-id="req4100ReqTable" data-datatable-action="requestAccept" title="요구사항 접수" data-title-lang-cd="req4100.actionBtn.requestAcceptTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="5">
					<i class="fa fa-vote-yea"></i><span data-lang-cd="req4100.button.requestAccept">접수</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req4100ReqTable" data-datatable-action="select" title="요구사항 조회" data-title-lang-cd="req4100.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req4100ReqTable" data-datatable-action="insert" title="요구사항 추가" data-title-lang-cd="req4100.actionBtn.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
					<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req4100ReqTable" data-datatable-action="update" title="요구사항 수정" data-title-lang-cd="req4100.actionBtn.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req4100ReqTable" data-datatable-action="copy" title="요구사항 복사" data-title-lang-cd="req4100.actionBtn.copyTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="copy" tabindex="4">
					<i class="fa flaticon2-copy"></i><span data-lang-cd="req4100.button.copyBtn">복사</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req4100ReqTable" data-datatable-action="delete" title="요구사항 삭제" data-title-lang-cd="req4100.actionBtn.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="5">
					<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-5 col-md-6 col-sm-12">
				<div class="osl-datatable-search" data-datatable-id="req4100ReqTable"></div>
			</div>
		</div>
		<div class="kt_datatable osl-datatable-footer__divide kt-scroll ps" data-scroll-x="true" id="req4100ReqTable"></div>
	</div>
</div>

<script>
"use strict";
var OSLReq4100Popup = function () {
	
	var reqAuth = false;
	var datatableId = "req4100ReqTable";
	
	
	var reqDatatable;
	
	var documentSetting = function(){
		
		var prjRequestAcceptCd = $.osl.prjGrpAuthList[$.osl.selPrjGrpId].prjList[$.osl.selPrjId].prjRequestAcceptCd;
		
		
		if(prjRequestAcceptCd == "01"){
			$("button[data-datatable-id=req4100ReqTable][data-datatable-action=requestAccept]").removeClass("kt-hide");
		}
		
		reqDatatable = $.osl.datatable.setting(datatableId,{
			data: {
				source: {
					read: {
						url: "/req/req4000/req4100/selectReq4100ReqListAjax.do"
					}
				},
			},
			columns: [
				{field: 'reqId', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'prjNm', title:'프로젝트명', textAlign: 'left', width: 150, search: true},
				{field: 'reqOrd', title: '요청번호', textAlign: 'left', width: 110, autoHide: false},
				{field: 'reqProTypeNm', title:'처리유형', textAlign: 'left', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProType", sortField: "reqProType"},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 340, search: true,
					
				},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 100, search: true, searchType:"date"},
				{field: 'regDtm', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"date",
					template: function (row) {
						var paramDatetime = new Date(row.regDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
				{field: 'reqUsrNm', title: '요청자', textAlign: 'center', width: 120, search: true,
					template: function (row) {
						if($.osl.isNull(row.reqUsrNm)){
							row.reqUsrNm = "-";
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
						if($.osl.isNull(rowData.reqUsrId)){
							$.osl.alert("없는 사용자입니다.");
							return false;
						}else{
							$.osl.user.usrInfoPopup(rowData.reqUsrId);
						}
					}
				},
				{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 120, search: true,
					template: function (row) {
						if($.osl.isNull(row.reqChargerId)){
							return row.reqChargerNm = "-";
						}else{
							var chargerNm = row.reqChargerNm;
							if($.osl.isNull(row.reqChargerNm)){
								chargerNm = '-';
							}
							var usrData = {
								html: chargerNm,
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
							};
							return $.osl.user.usrImgSet(row.reqChargerImgId, usrData);
						}
					},
					onclick: function(rowData){
						if($.osl.isNull(rowData.reqChargerId)){
							return false;
						}else{
							$.osl.user.usrInfoPopup(rowData.reqChargerId);
						}
					}
				},
				{field: 'reqUsrEmail', title:'요청자e-mail', textAlign: 'left', width: 180, search: true},
				{field: 'reqUsrDeptNm', title:'요청자 조직', textAlign: 'center', width: 300, sortable: false},
				{field: 'reqUsrNum', title: '요청자 연락처', textAlign: 'center', width: 100, search: true},
				{field: 'reqKey', title: '요구사항 key', textAlign: 'center', width: 300, sortable: false, search: true}
				
			],
			searchColumns:[
				{field: 'prjGrpNm', title: $.osl.lang("req4100.field.prjGrpNm"), searchOrd: 0},
				{field: 'reqGrpNm', title: $.osl.lang("req4100.field.reqGrpNm"), searchOrd: 2},
				{field: 'reqGrpNo', title: $.osl.lang("req4100.field.reqGrpNo"), searchOrd: 3}
			],
			actionBtn:{
				"title" : $.osl.lang("req4100.actionBtn.title"),
				"dblClick": true,
				"copy" : true,
			},
			actionTooltip:{
				"update": $.osl.lang("req4100.actionBtn.updateBtn"),
				"delete": $.osl.lang("req4100.actionBtn.deleteBtn"),
				"dblClick" : $.osl.lang("req4100.actionBtn.detailBtn"),
				"copy" : $.osl.lang("req4100.actionBtn.copyBtn"),
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.lang("req4100.title.insertTitle"),
							closeConfirm: false,
							autoHeight:false,
						};
					
					$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
				},
				"update":function(rowData){
					if(rowData.reqProType != "01"){
						$.osl.alert($.osl.lang("req4100.alert.updateMsg"), {"type":"warning"});
						return false;
					}
					var data = {
							type:"update",
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
							paramReqUsrId: rowData.reqUsrId,
							paramReqGrpId: rowData.reqGrpId,
							datatableId: datatableId,
						};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.lang("req4100.title.updateTitle"),
							closeConfirm: false,
							autoHeight:false,
						};
					var pwOptions = {
							idKey: "req4100pw_"+datatableId,
							modalTitle: $.osl.lang("req4100.title.passowrdCheckTitle"),
							closeConfirm: false,
							autoHeight:false,
							modalSize: "sm",
						};
					
					$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
				},
				"delete":function(rowDatas, datatableId, type){
					
					 
					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/req/req4000/req4100/deleteReq4100ReqListAjax.do'/>"}
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
				"dblClick":function(rowData, datatableId, type, rowNum){
					var data = {
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
							paramReqUsrId: rowData.reqUsrId
						};
					var options = {
							idKey: rowData.reqId,
							modalTitle: '요구사항 상세',
							autoHeight: false,
							modalSize: 'xl',
							ftScrollUse: false
							
					 
							
						};
					
					
					$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6203View.do',data,options);
				},
				"copy" : function(rowDatas, datatableId, type, rowNum){
					var data;
					if(type == "list"){
						
						if(rowNum == 0){
							$.osl.alert($.osl.lang("req4100.alert.selectData"));
						}else if(rowNum == 1){
							
								
								data ={
									type:"copy",
									
									paramPrjId: rowDatas[0].prjId,
									paramReqId: rowDatas[0].reqId,
									paramReqUsrId: rowDatas[0].reqUsrId,
									changePrj : "Y"
								};
								var options = {
										idKey: rowDatas[0].reqId,
										modalTitle: $.osl.lang("req4100.title.detailTitle"),
										closeConfirm: false
									};
								
								$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
							
						}else{
							
							$.osl.alert($.osl.lang("req4100.alert.selectCopyData", rowNum));
						}
					}else{
						
							
							data ={
								type:"copy",
								rowDatas : "["+JSON.stringify(rowDatas)+"]",
								paramPrjId: rowDatas.prjId,
								paramReqId: rowDatas.reqId,
								paramReqUsrId: rowDatas.reqUsrId,
								changePrj : "Y"
							};
							var options = {
									idKey: rowDatas.reqId,
									modalTitle: $.osl.lang("req4100.title.detailTitle"),
									closeConfirm: false
								};
							
							$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4101View.do',data,options);
						
					}
				},
				"requestAccept": function(rowDatas, datatableId, type, rowNum){
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("req4100.alert.selectData"));
						return false;
					}else{
						
						
						var selReqInfoList = [];
						
						
						var reqProChkCnt = 0;
						
						$.each(rowDatas, function(idx, map){
							
							if(map.reqProType == "01"){
								selReqInfoList.push({prjId: map.prjId, prjGrpId: map.prjGrpId, reqId: map.reqId});
							}else{
								reqProChkCnt++;
								return true;
							}
						});
						
						var data = {
								paramSelReqInfoList: JSON.stringify(selReqInfoList)
						};
						var options = {
							modalSize: "xl",
							idKey: datatableId,
							modalTitle: $.osl.lang("prj1102.update.title"),
							closeConfirm: false,
							ftScrollUse: false
						};
						
						
						if(rowDatas.length == reqProChkCnt){
							$.osl.alert("접수 가능한 요구사항이 선택되지 않았습니다.");
							return false;
						}
						
						$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6200View.do',data,options);
						
						if(reqProChkCnt > 0){
							$.osl.alert(reqProChkCnt+"건의 접수대기가 아닌 요구사항을 제외했습니다.");
						}
					}
				},
				
				"requestProcessing": function(rowDatas, datatableId, type, rowNum){
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("req4100.alert.selectData"));
						return false;
					}
					else if(rowDatas.length > 1){
						$.osl.alert("요구사항을 1개만 선택해주세요.");
						return false;
					}
					
					
					if(rowDatas[0].reqProType != "02" && rowDatas[0].reqProType != "04"){
						$.osl.alert("최종완료, 처리중인 요구사항만 업무 처리가 가능합니다.");
						return false;
					}
					
					var data = {
							paramPrjId: rowDatas[0].prjId,
							paramReqId: rowDatas[0].reqId
					};
					var options = {
						modalSize: "fs",
						idKey: datatableId,
						modalTitle: "["+rowDatas[0].reqNm+"] 요구사항 업무 처리",
						closeConfirm: false,
						callback:[{
							targetId: "cmm6201ModalCallbackBtn",
							actionFn: function(thisObj){
								reqDatatable.targetDt.reload();
							}
						}]
					};
					$.osl.layerPopupOpen('/cmm/cmm6000/cmm6200/selectCmm6201View.do',data,options);
				}
			},
			theme:{
				actionBtn:{
					"copy" : ""
				},
				actionBtnIcon:{
					"copy" : "fa flaticon2-copy",
				}
			}
		});
	};
	
	
	var checkAuth = function(usrId, reqId){
		var data = {
				usrId : usrId,
				reqId : reqId
		};
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/req/req4000/req4100/selectReq4100UserCheckAjax.do'/>", "async": true}
				, data);
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var result = data.reqAuth;
				if(result == "Y"){
					reqAuth = true;
				}else{
					reqAuth = false;
				}
			}
    	});
		
    	ajaxObj.send();
	};
	
	return {
        
        init: function() {
        	documentSetting();
        },
        getReqDatatable: function(){
        	return reqDatatable;
        }
        
    };
}();

$.osl.ready(function(){
	OSLReq4100Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
