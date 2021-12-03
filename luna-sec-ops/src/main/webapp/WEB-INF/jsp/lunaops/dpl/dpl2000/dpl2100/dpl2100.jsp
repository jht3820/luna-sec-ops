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
			<input type="hidden" name="signRes" id="signRes">
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl2100Table" data-datatable-action="select" title="배포 계획 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
				<i class="fa fa-list"></i><span>조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl2100Table" data-datatable-action="signApr" title="결재 승인" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="signApr" tabindex="6">
				<i class="fas fa-check-square"></i><span>승인</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl2100Table" data-datatable-action="signReject" title="결재 반려" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="signReject" tabindex="7">
				<i class="fas fa-times"></i><span>반려</span>
			</button>
		</div>
		
	</div>
	<div class="kt-portlet__body">
		
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="dpl2100Table"></div>
		</div>
		<div class="kt_datatable osl-datatable-footer__divide" id="dpl2100Table"></div>
		
	</div>
</div>


<script>
"use strict";
var OSLDpl2100Popup = function () {
	
	
	var dpl2100DatatableId = "dpl2100Table";
	
	var documentSetting = function(){
		
		
		$.osl.datatable.setting("dpl2100Table",{
			data: {
				source: {
					read: {
						url: "/dpl/dpl2000/dpl2100/selectDpl2100SignListAjax.do",
						params:{
							targetCd : '02',
						}
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'nowSignTypeNm', title: '결재 상태', textAlign: 'center', width: 100,autoHide: false, search: true, searchType:"select", searchCd: "CMM00008", searchField:"nowSignTypeCd", sortField: "nowSignTypeCd"},
				{field: 'signReqUsrId', title: '요청자', textAlign: 'center', width: 100,autoHide: false, search: false,
					template: function (row) {
						return $.osl.user.usrImgSet(row.signDrfUsrImgId, row.signDrfUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.signDrfUsrId);
					}
				},
				{field: 'lastSignUsrNm', title: '결재자', textAlign: 'center', width: 100, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.lastSignUsrImgId, row.lastSignUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.lastSignUsrId);
					}
				},
				{field: 'signDtm', title: '결재 요청 일자', textAlign: 'center', width: 150, search: true,searchType:"daterange",
					template: function (row) {
						var paramDateTime = new Date(row.signDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDateTime, {fullTime: "d", returnFormat: "yyyy-mm-dd"});
		                return agoTimeStr.agoString;
					}
				},
				{field: 'dplNm', title: '배포 명', textAlign: 'left', width: 300, autoHide: false, search: true},
				{field: 'signRes', title: '결재 의견', textAlign: 'left', width: 250,  search: false,
					template: function(row){
					var signRes = row.signRes;
					
					
					if($.osl.isNull(signRes)){
						signRes = "결재 의견 없음";
					}
					return signRes;
				}},
				{field: 'dplUsrNm', title: '배포자', textAlign: 'center', width: 100, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.dplUsrImgId, row.dplUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.dplUsrId);
					}
				},
			],
			actionBtn:{
				"signApr":true,
				"signReject":true,
				"dblClick": true, 
				"update":false,
				"delete":false,
				"title": "Actions",
				"width" : 160
			},
			actionTooltip:{
				"dblClick": "배포 계획 상세 보기",
				"signApr" : "결재 승인",
				"signReject" : "결재 반려",
			},
			actionFn:{
				"signApr":function(rowData, datatableId, type, rowNum, elem){
					var rowDatas = [];
					
					
					if(type == "list"){
						
						var selRecords = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords();
						
						
						if(selRecords.length == 0){
							$.osl.alert($.osl.lang("dpl2100.action.sign.nonSelect"));
							return true;
						}
						
						rowDatas = rowData;
						
					
					}else{
						rowDatas.push(rowData);
					}
					
					var usrId = $.osl.user.userInfo.usrId;
					
					
					var usrSign = false;
					
					
					$.each(rowDatas,function(idx,map){
						
						if(!(map.lastSignUsrId == usrId)){
							usrSign = true;
						}	
					});
					
					if(usrSign){
						
						$.osl.alert($.osl.lang("cmm6602.message.alert.notSignOrd"));
						return;
					}
					
					var data = {
							type : "signApr"
					};
					
					var options = {
						modalTitle: $.osl.lang("dpl2100.modal.title.signAprRes"),
						autoHeight: false,
						modalSize: "md",
						callback:[{
							targetId: "cmm6602SaveSubmit",
							actionFn: function(thisObj){
								
								
					        	var signRes = OSLCmm6602Popup.getSignRes();
								
								
								if($.osl.isNull(signRes)){
									
									$.osl.alert($.osl.lang("cmm6602.message.alert.notEnterAprRes"));
									return true;
								}
								
								$.osl.confirm($.osl.lang("dpl2100.message.confirm.signApr"),{"html" : true},function(result) {
							        if (result.value) {
							        	
							        	var type = OSLCmm6602Popup.getType();
							        	
							        	
										$.osl.layerPopupClose();
							        	
							        	
							        	signDpl(rowDatas,signRes,type);
							        	
							        	
							        	$("button[data-datatable-id="+dpl2100DatatableId+"][data-datatable-action=select]").click();
							        }
							    });
								
							}
						}]
							
					};
					 
					$.osl.layerPopupOpen('/cmm/cmm6000/cmm6600/selectCmm6602View.do',data,options); 
					
				},
				"signReject":function(rowData, datatableId, type, rowNum, elem){
					var rowDatas = [];
					
					
					if(type == "list"){
						
						var selRecords = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords();
						
						
						if(selRecords.length == 0){
							$.osl.alert($.osl.lang("dpl2100.action.sign.nonSelect"));
							return true;
						}
						
						rowDatas = rowData;
						
					
					}else{
						rowDatas.push(rowData);
					}
					
					var usrId = $.osl.user.userInfo.usrId;
					
					
					var usrSign = false;
					
					
					$.each(rowDatas,function(idx,map){
						
						if(!(map.lastSignUsrId == usrId)){
							usrSign = true;
						}	
					});
					
					if(usrSign){
						$.osl.alert($.osl.lang("cmm6602.message.alert.notSignOrd"));
						return;
					}
					
					var data = {
							type : "signRjt"
					};
					var options = {
						modalTitle: $.osl.lang("dpl2100.modal.title.signRjtRes"),
						autoHeight: false,
						modalSize: "md",
						callback:[{
							targetId: "cmm6602SaveSubmit",
							actionFn: function(thisObj){
								
					        	var signRes = OSLCmm6602Popup.getSignRes();
								
								
								if($.osl.isNull(signRes)){
									$.osl.alert($.osl.lang("cmm6602.message.alert.notEnterRjtRes"));
									return true;
								}
								
								$.osl.confirm($.osl.lang("dpl2100.message.confirm.signRjt"),{"html" : true},function(result) {
							        if (result.value) {
							        	
							        	var type = OSLCmm6602Popup.getType();
							        	
										$.osl.layerPopupClose();
							        	
							        	
							        	signDpl(rowDatas,signRes,type);
							        	
							        	
							        	$("button[data-datatable-id="+dpl2100DatatableId+"][data-datatable-action=select]").click();
							        }
							    });
								
							}
						}]
							
					};
					 
					$.osl.layerPopupOpen('/cmm/cmm6000/cmm6600/selectCmm6602View.do',data,options); 
				},
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
					var data = {
							paramPrjId : rowData.prjId,
							paramDplId : rowData.dplId
						};
					var options = {
							idKey: datatableId +"_"+ rowData.dplId,
							modalTitle: $.osl.lang("dpl2100.modal.title.dplDetail",rowData.dplNm),
							autoHeight: false,
							modalSize: 'xl'
						};
					
					$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1002View.do',data,options);
				},
			},
			theme: {
				 actionBtnIcon:{
					 "dblClick": "fa fa-info-circle",
					 "signApr": "fas fa-check-square",
					 "signReject":"fas fa-times",
				 }
			 }
		});
			
				
	};
	
	
	var signDpl = function(rowDatas, signRes, type){
		
		
 		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/cmm/cmm6000/cmm6600/insertCmm6601SignInfoAjax.do'/>"}
				,{rowDatas: JSON.stringify(rowDatas), signRes:signRes, type:type});

 		
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert($.lang("cmm6601.sign.fail"),{type: 'error'});
 			}else{
 				
 				$.osl.toastr($.osl.lang("cmm6601.sign.success"));
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
	OSLDpl2100Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
