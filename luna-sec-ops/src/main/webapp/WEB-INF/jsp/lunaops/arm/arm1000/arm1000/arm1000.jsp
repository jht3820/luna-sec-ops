<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__body kt-padding-10">
				<ul class="kt-nav kt-nav--bold kt-nav--md-space nav nav-tabs osl-display__flex osl-flex-flow--column-mobile" role="tablist">
					<li class="kt-nav__item osl-display__flex osl-flex-row-fluid" id="menuTypeGet">
						<a class="kt-nav__link kt-padding-l-20 kt-padding-r-20 active" data-toggle="tab" href="#kt_profile_tab_personal_information" role="tab">
							<span class="kt-nav__link-icon"><i class="fas fa-inbox"></i></span>
							<span class="kt-nav__link-text flex-grow-0 kt-font-boldest kt-font-lg" data-lang-cd="arm1000.label.get">받은 메시지</span>
							<span class='badge osl-badge-lightgray osl-min-w-px-35 kt-margin-l-20 kt-font-bolder kt-font-lg kt-font-brand kt-hide' id="notReadGetCntBadge" name="notReadGetCntBadge">0</span>
						</a>
					</li>
					<li class="kt-nav__item osl-display__flex osl-flex-row-fluid kt-padding-t-5" id="menuTypeSend">
						<a class="kt-nav__link kt-padding-l-20 kt-padding-r-20" data-toggle="tab" href="#kt_profile_tab_account_information" role="tab">
							<span class="kt-nav__link-icon"><i class="fas fa-paper-plane"></i></span>
							<span class="kt-nav__link-text flex-grow-0 kt-font-boldest kt-font-lg" data-lang-cd="arm1000.label.send">보낸 메시지</span>
						</a>
					</li>
					<li class="kt-nav__item osl-display__flex osl-flex-row-fluid" id="menuTypeAlone">
						<a class="kt-nav__link kt-padding-l-20 kt-padding-r-20" data-toggle="tab" href="#kt_profile_change_password" role="tab">
							<span class="kt-nav__link-icon"><i class="fas fa-envelope-square"></i></span>
							<span class="kt-nav__link-text flex-grow-0 kt-font-boldest kt-font-lg" data-lang-cd="arm1000.label.alone">나에게 보낸 메시지</span>
							<span class='badge osl-badge-lightgray osl-min-w-px-35 kt-margin-l-20 kt-font-bolder kt-font-lg kt-font-brand kt-hide' id="notReadAloneCntBadge" name="notReadAloneCntBadge">0</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label">
					
					<span class="kt-font-boldest kt-font-lg" id="getAllCnt" name="getAllCnt">
						<span class="d-inline-block" data-lang-cd="arm1000.label.get">받은 메시지</span>
						<div class="badge osl-badge-lightgray kt-margin-l-20">
							<span class='kt-font-brand' id="notReadGetCnt" name="notReadGetCnt">0</span>
							<span id="getCnt" name="getCnt"></span>
						</div>
					</span>					
					
					<span class="kt-hide kt-font-boldest kt-font-lg" id="sendAllCnt" name="sendAllCnt">
						<span class="d-inline-block" data-lang-cd="arm1000.label.send">보낸 메시지</span>
						<div class="badge osl-badge-lightgray kt-margin-l-20">
							<span id="sendCnt" name="sendCnt"></span>
						</div>
					</span>
					
					<span class="kt-hide kt-font-boldest kt-font-lg" id="aloneAllCnt" name="aloneAllCnt">
						<span class="d-inline-block" data-lang-cd="arm1000.label.alone">나에게 보낸 메시지</span>
						<div class="badge osl-badge-lightgray kt-margin-l-20">
							<span class='kt-font-brand' id="notReadAloneCnt" name="notReadAloneCnt">0</span>
							<span id="aloneCnt" name="aloneCnt"></span>
						</div>
					</span>
				</div>
				<div class="kt-portlet__head-toolbar">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="arm1000ArmTable" data-datatable-action="select" title="메시지 조회" data-title-lang-cd="arm1000.button.tooltip.selectBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
						<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="arm1000ArmTable" data-datatable-action="detail" title="메시지 상세" data-title-lang-cd="arm1000.button.tooltip.dblClickBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="detail" tabindex="2">
						<i class="fas fa-edit"></i><span data-lang-cd="datatable.button.detailBtn">상세</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="arm1000ArmTable" data-datatable-action="insert" title="메시지 보내기" data-title-lang-cd="arm1000.button.tooltip.insertBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="3">
						<i class="fas fa-edit"></i><span data-lang-cd="datatable.button.insert">쓰기</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="arm1000ArmTable" data-datatable-action="reInsert" title="메시지 답장" data-title-lang-cd="arm1000.button.tooltip.reInsertBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="reInsert" tabindex="4">
						<i class="fas fa-envelope-open-text"></i><span data-lang-cd="arm1000.button.reInsertBtn">답장</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="arm1000ArmTable" data-datatable-action="check" title="메시지 읽음 처리" data-title-lang-cd="arm1000.button.tooltip.checkBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="check" tabindex="5">
						<i class="fas fa-envelope-open"></i><span data-lang-cd="arm1000.button.checkBtn">읽음</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="arm1000ArmTable" data-datatable-action="delete" title="메시지 삭제" data-title-lang-cd="arm1000.button.tooltip.deleteBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="6">
						<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
					</button>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-xl-5 col-lg-5 col-md-7 col-sm-12"> 
						<div class="osl-datatable-search" data-datatable-id="arm1000ArmTable"></div>
					</div>
				</div>
				<div class="kt_datatable kt-margin-b-0" id="arm1000ArmTable"></div>
			</div>
		</div>
	</div>
</div>

<script>
"use strict";
var OSLArm1000Popup = function () {
	var datatableId = "arm1000ArmTable";
	
	var documentSetting = function(){
		$.osl.datatable.setting(datatableId,{
			data: {
				source: {
					read: {
						url: "/arm/arm1000/arm1000/selectArm1000AlarmListAjax.do"
					},
					params: {
						armMenuType : "get"
					},
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				
				{field: 'checkCd', title: '읽음 상태', textAlign: 'center', width: 60, sortable: true,
					template: function (row) {
						var returnStr = "";
						if(row.checkCd == "02"){
							
							returnStr += "<i class='fas fa-envelope kt-font-brand kt-font-lg'></i>";
						}else{
							
							returnStr += "<i class='fas fa-envelope-open kt-font-metal kt-font-lg'></i>";
						}
							
						return returnStr;
					}
				},
				{field: 'usrNm', title: '받는 사람', textAlign: 'left', width: 120, sortField: 'usrNm', search:true, sortable: true,
					template: function (row) {
						if($.osl.isNull(row.usrNm)){
							row.sendUsrNm = "";
						}
						var usrData = {
							html: row.usrNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
						};
						return $.osl.user.usrImgSet(row.usrImgId, usrData);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'sendDtm', title: '날짜', textAlign: 'center', width: 100, sortField: "sendDtm", search: true, searchType:"daterange", autoHide:false, sortable: true,
					template: function (row) {
						var paramDatetime = new Date(row.sendDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
				{field: 'sendUsrNm', title: '보낸 사람', textAlign: 'left', width: 120, sortField: "sendUsrNm", search:true, sortable: true,
					template: function (row) {
						if($.osl.isNull(row.sendUsrNm)){
							row.sendUsrNm = "";
						}
						var usrData = {
							html: row.sendUsrNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
						};
						return $.osl.user.usrImgSet(row.sendUsrImgId, usrData);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.sendUsrId);
					}
				},
				{field: 'armTitle', title:'제목', textAlign: 'left', width: 300, sortField: "armTitle", search: true},
			],
			searchColumns:[
				{field: 'sendUsrId', title: $.osl.lang("arm1000.field.sendUsrId"), searchOrd: 1},
				{field: 'sendUsrEmail', title: $.osl.lang("arm1000.field.sendUsrEmail"), searchOrd: 2},
				
				{field: 'usrId', title: $.osl.lang("arm1000.field.usrId"), searchOrd: 4},
				{field: 'usrEmail', title: $.osl.lang("arm1000.field.usrEmail"), searchOrd: 5},
				{field: 'armContent', title: $.osl.lang("arm1000.field.armContent"), searchOrd: 7}
			],
			rows:{
				beforeTemplate : function(row, data, index){
					if($.osl.datatable.list[datatableId].targetDt.getDataSourceParam("armMenuType") != "send"){
						if(data.checkCd == '02'){
							
							$(row).css("font-weight", "bold");
						}
					}
				}
			},
			actionBtn:{
				"width": 120,
				"reInsert" : true,
				"update" : false,
				"dblClick" : true,
				"detail" : true,
				"check" : true,
				
			}, 
			actionTooltip:{
				"delete" : $.osl.lang("arm1000.button.tooltip.deleteBtn"),
				"reInsert" : $.osl.lang("arm1000.button.tooltip.reInsertBtn"),
				"dblClick" : $.osl.lang("arm1000.button.tooltip.dblClickBtn"),
				"detail" : $.osl.lang("arm1000.button.tooltip.dblClickBtn"),
				"check" : $.osl.lang("arm1000.button.tooltip.checkBtn"),
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.lang("arm1000.actionBtn.insertTitle"),
							closeConfirm: true,
							autoHeight:false,
							ftScrollUse: false,
						};
					
					$.osl.layerPopupOpen('/arm/arm1000/arm1000/insertArm1001View.do',data,options);
				},
				"reInsert":function(rowDatas, datatableId, type, rowNum){
					var data;
					var options;
					
					if(type == "list"){
						
						if(rowNum == 0){
							$.osl.alert($.osl.lang("arm1000.alert.message.selectMessage"));
							return false;
						}else if(rowNum == 1){
							data = {
									type:"reInsert",
									reSendUsrId : rowDatas[0].sendUsrId,
									atchfileId : rowDatas[0].atchFileId,
								};
							options = {
									idKey: "reInsert_"+rowDatas[0].armId,
									modalTitle: $.osl.lang("arm1000.actionBtn.reInsertTitle"),
									closeConfirm: false,
									autoHeight:false,
									ftScrollUse: false,
								};
						}else{
							
							$.osl.alert($.osl.lang("arm1000.alert.message.selectOneMessage", rowNum));
							return false;
						}
					}else{
						
						data = {
								type:"reInsert",
								reSendUsrId : rowDatas.sendUsrId,
							};
						options = {
								idKey: "reInsert_"+rowDatas.armId,
								modalTitle: $.osl.lang("arm1000.actionBtn.reInsertTitle"),
								closeConfirm: true,
								autoHeight:false,
								ftScrollUse: false,
							};
					}
					
					$.osl.layerPopupOpen('/arm/arm1000/arm1000/insertArm1001View.do',data,options);
				},
				"delete":function(rowDatas, datatableId, type){
					var data = {
							dataList : JSON.stringify(rowDatas)
					};

					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/arm/arm1000/arm1000/deleteArm1000AlarmInfoAjax.do'/>", "async":"true"}
							,data);
					
					
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
							$.osl.alert(data.message,{type: 'error'});

							
							$.osl.layerPopupClose();
						}else{
							
					    	mssArmLoad();
							OSLArm1000Popup.reload();
						}
					});
					
					
					ajaxObj.send();
					
				},
				"dblClick":function(rowData, datatableId, type, rowNum){
					var data = {
							armId : rowData.armId
					};
					var options = {
							idKey: rowData.armId,
							modalTitle: $.osl.lang("arm1000.actionBtn.dblClickTitle"),
							closeConfirm: true,
							autoHeight:false,
							ftScrollUse: false,
					};
					
					$.osl.layerPopupOpen('/arm/arm1000/arm1000/selectArm1002View.do',data,options);
				},
				"detail": function(rowDatas, datatableId, type, rowNum){
					var rowData;
					if(type == "list"){
						if(rowNum == 1){
							rowData = rowDatas[0];
						}else{
							$.osl.alert($.osl.lang("arm1000.alert.message.selectOneMessage", rowNum));
							return false;
						}
					}else{
						rowData = rowDatas;
					}
					var data = {
							armId : rowData.armId
					};
					var options = {
							idKey: rowData.armId,
							modalTitle: $.osl.lang("arm1000.actionBtn.dblClickTitle"),
							closeConfirm: true,
							autoHeight:false,
							ftScrollUse: false,
					};
					
					$.osl.layerPopupOpen('/arm/arm1000/arm1000/selectArm1002View.do',data,options);
				},
				"check" : function(rowDatas){
					var data = {
							dataList : JSON.stringify(rowDatas)
					};
					
					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/arm/arm1000/arm1000/updateArm1000AlarmInfoAjax.do'/>", "async":"true"}
							,data);
					
					
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
							$.osl.alert(data.message,{type: 'error'});

							
							$.osl.layerPopupClose();
						}else{
							
					    	mssArmLoad();
							OSLArm1000Popup.reload();
						}
					});
					
					
					ajaxObj.send();
				}
			},
			theme:{
				actionBtn:{
					"reInsert" : " osl-table-option-hide",
					"check" : " kt-hide",
					"detail" : " kt-hide"
				},
				actionBtnIcon:{
					"reInsert" : "fas fa-envelope-open-text"
				}
			},
			callback:{
				initComplete:function(evt, config){
					
					$("#menuTypeGet").click();
				},
	   			ajaxDone: function(evt, list, datatableInfo){
	   				checkNotRead();
	   			},
			}
		});
		
		$("#menuTypeGet").click(function(){
			
			searchReset();
			
			$.osl.datatable.list[datatableId].targetDt.setDataSourceParam("armMenuType","get");
			
 			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
		});
		
		$("#menuTypeSend").click(function(){
			
			searchReset();
			
			$.osl.datatable.list[datatableId].targetDt.setDataSourceParam("armMenuType","send");
			
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
		});
		
		$("#menuTypeAlone").click(function(){
			
			searchReset();
			
			$.osl.datatable.list[datatableId].targetDt.setDataSourceParam("armMenuType","alone");
			
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
		});
		
		
		
		$("#"+datatableId).on("kt-datatable--on-layout-updated", function(){
			actionBtnHide();
			
 			
 			
       	});
	};
	
	
	var checkNotRead = function(){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/arm/arm1000/arm1000/selectArm1000AlarmNotReadCntAjax.do'/>"});
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var allMessage = data.allMessage;
				var notRead = data.notRead;
				
				if(notRead.get>0){
					$("#notReadGetCntBadge").removeClass("kt-hide");
					$("#notReadGetCntBadge, #notReadGetCnt").text(notRead.get);
					$("#getCnt").text(" / " + allMessage.get);
					
				
				}else{
					$("#notReadGetCntBadge").addClass("kt-hide");
					
					$("#getCnt").text(" / " + allMessage.get);
				}
				
				$("#sendCnt").text(allMessage.send);
				
				if(notRead.alone>0){
					$("#notReadAloneCntBadge").removeClass("kt-hide");
					$("#notReadAloneCntBadge, #notReadAloneCnt").text(notRead.alone);
					$("#aloneCnt").text(" / " + allMessage.alone);
				
				}else{
					$("#notReadAloneCntBadge").addClass("kt-hide");
					$("#notReadAloneCnt").text("0");
					$("#aloneCnt").text(" / " + allMessage.alone);
				}
			}
    	});
		
    	ajaxObj.send();
	};
	
	
	var searchReset = function(){
		
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item.active").attr("class", "dropdown-item");
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=-1]").attr("class", "dropdown-item active");
		
		
		var searchBarMenuStr = $(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=-1]").text();
		
		
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").parent().children(".btn.btn-secondary.dropdown-toggle").text(searchBarMenuStr);
		
		
		$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("style", "display:none;");
		$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("aria-hidden", "true");
		
		
		$("#searchData_"+datatableId).removeAttr("readonly");
		
		$("#searchData_"+datatableId).parent().children("span").children().children().removeClass("la-calendar");
		
		
		$("#searchData_"+datatableId).val("");

		
		
		$("#searchData_"+datatableId).attr("disabled","disabled");
	}
	
	
	var actionBtnHide = function(){
		var datatableType = $.osl.datatable.list["arm1000ArmTable"].targetDt.getDataSourceParam('armMenuType');
		
		if(datatableType=="get"){
			
			$(".kt-nav__item").find('.kt-nav__link-icon,.kt-nav__link-text').removeClass("kt-font-brand");
			$("#menuTypeGet").find('.kt-nav__link-icon,.kt-nav__link-text').addClass("kt-font-brand");
			
			$("#sendAllCnt,#aloneAllCnt").addClass("kt-hide");
			$("#getAllCnt").removeClass("kt-hide");

			
			$('.osl-table-option-hide').removeClass("kt-hide");
			
			
			$('.btn[data-auth-button=check]').show();
 			$('.btn[data-auth-button=reInsert]').show();
 			
 			
 			$.osl.datatable.list["arm1000ArmTable"].targetDt.getColumnByField('checkCd').visible=true;
 			
 			
 			$.osl.datatable.list["arm1000ArmTable"].targetDt.getColumnByField('sendUsrNm').visible=true;
 			
 			
 			$.osl.datatable.list["arm1000ArmTable"].targetDt.getColumnByField('usrNm').visible=false;
 			$.osl.datatable.list["arm1000ArmTable"].targetDt.columnHide();
 			
		
		}else if(datatableType=="send"){
			
			$(".kt-nav__item").find('.kt-nav__link-icon,.kt-nav__link-text').removeClass("kt-font-brand");
			$("#menuTypeSend").find('.kt-nav__link-icon,.kt-nav__link-text').addClass("kt-font-brand");
			
			$("#getAllCnt,#aloneAllCnt").addClass("kt-hide");
			$("#sendAllCnt").removeClass("kt-hide");

			
			$('.osl-table-option-hide').addClass("kt-hide");
			
			
			$('.btn[data-auth-button=check]').hide();
 			$('.btn[data-auth-button=reInsert]').hide();
 		
 			
 			$.osl.datatable.list["arm1000ArmTable"].targetDt.getColumnByField('checkCd').visible = false;
 			
 			
 			$.osl.datatable.list["arm1000ArmTable"].targetDt.getColumnByField('sendUsrNm').visible=false;
 			
 			
 			$.osl.datatable.list["arm1000ArmTable"].targetDt.getColumnByField('usrNm').visible = true;
 			$.osl.datatable.list["arm1000ArmTable"].targetDt.columnHide();
 		
 		
		}else if(datatableType=="alone"){
			
			
			$(".kt-nav__item").find('.kt-nav__link-icon,.kt-nav__link-text').removeClass("kt-font-brand");
			$("#menuTypeAlone").find('.kt-nav__link-icon,.kt-nav__link-text').addClass("kt-font-brand");
			
			$("#getAllCnt,#sendAllCnt").addClass("kt-hide");
			$("#aloneAllCnt").removeClass("kt-hide");

			
			$('.osl-table-option-hide').addClass("kt-hide");
			
			
			$('.btn[data-auth-button=check]').hide();
 			$('.btn[data-auth-button=reInsert]').hide();
 			
 			
 			$.osl.datatable.list["arm1000ArmTable"].targetDt.getColumnByField('checkCd').visible=false;
 			
 			
 			$.osl.datatable.list["arm1000ArmTable"].targetDt.getColumnByField('sendUsrNm').visible=false;
 			
 			
 			$.osl.datatable.list["arm1000ArmTable"].targetDt.getColumnByField('usrNm').visible=false;
 			$.osl.datatable.list["arm1000ArmTable"].targetDt.columnHide();
		}
	}
	
	return {
        
        init: function() {
        	documentSetting();
        },
        reload: function(){
			
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
			checkNotRead();
        }
    };
}();

$.osl.ready(function(){
	OSLArm1000Popup.init();
});
</script>
