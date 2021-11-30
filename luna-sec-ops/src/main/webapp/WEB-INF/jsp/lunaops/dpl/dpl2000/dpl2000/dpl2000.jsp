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
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl2000Table" data-datatable-action="select" title="배포 계획 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
				<i class="fa fa-list"></i><span>조회</span>
			</button>
		</div>
		
	</div>
	<div class="kt-portlet__body">
		
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="dpl2000Table"></div>
		</div>
		<div class="kt_datatable osl-datatable-footer__divide" id="dpl2000Table"></div>
		
	</div>
</div>


<script>
"use strict";
var OSLDpl2000Popup = function () {
	var documentSetting = function(){
		
		
		$.osl.datatable.setting("dpl2000Table",{
			data: {
				source: {
					read: {
						url: "/dpl/dpl2000/dpl2000/selectDpl2000SignListAjax.do",
						params:{
							targetCd : '02'
						}
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'nowSignTypeNm', title: '결재 상태', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "CMM00008", searchField:"nowSignTypeCd", sortField: "nowSignTypeCd"},
				{field: 'signReqUsrId', title: '요청자', textAlign: 'center', width: 100, search: false,
					template: function (row) {
						var usrInfo = $.osl.user.userInfo
						return $.osl.user.usrImgSet(usrInfo.usrImgId, usrInfo.usrNm);
					},
					onclick: function(rowData){
						var usrInfo = $.osl.user.userInfo
						$.osl.user.usrInfoPopup(usrInfo.usrId);
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
				"dblClick": true, 
				"update":false,
				"delete":false,
				"title": "상세 조회",
				"width" : 160
			},
			actionTooltip:{
				"dblClick": "배포 계획 상세 보기",
			},
			actionFn:{
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
					var data = {
							paramPrjId : rowData.prjId,
							paramDplId : rowData.dplId
						};
					var options = {
							idKey: datatableId +"_"+ rowData.dplId,
							
							modalTitle: $.osl.lang("dpl2000.modal.title.dplDetail",rowData.dplNm),
							autoHeight: false,
							modalSize: 'xl',
								closeConfirm: true,
								keyboard:true,
								backdrop:true
						};
					
					$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1002View.do',data,options);
				},
			}
		});
			
				
	};
	
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLDpl2000Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
