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
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="signRequest" title="배포 계획 결재선 지정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="5">
				<i class="fa fa-file-signature"></i><span>결재선 지정</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="select" title="배포 계획 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
				<i class="fa fa-list"></i><span>조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="insert" title="배포 계획 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="6">
				<i class="fa fa-plus"></i><span>등록</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="update" title="배포 계획 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="7">
				<i class="fa fa-edit"></i><span>수정</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="delete" title="배포 계획 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="8">
				<i class="fa fa-trash-alt"></i><span>삭제</span>
			</button>
		</div>
		
	</div>
	<div class="kt-portlet__body">
		
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="dpl1000Table"></div>
		</div>
		<div class="kt_datatable osl-datatable-footer__divide" id="dpl1000Table"></div>
		
	</div>
</div>


<script>
"use strict";
var OSLDpl1000Popup = function () {
	var documentSetting = function(){
		
		
		$.osl.datatable.setting("dpl1000Table",{
			data: {
				source: {
					read: {
						url: "/dpl/dpl1000/dpl1000/selectDpl1000DplListAjax.do"
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'dplSignUseNm', title: '결재 사용 유무', textAlign: 'center', width: 110, search: true, searchType:"select", searchCd: "CMM00001", searchField:"dplSignUseCd", sortField: "dplSignUseCd"},
				{field: 'nowSignTypeNm', title: '결재 상태', textAlign: 'center', width: 90, search: true, searchType:"select", searchCd: "CMM00008", searchField:"nowSignTypeCd", sortField: "nowSignTypeCd"
					,template: function(row){
						var nowSignTypeNm = row.nowSignTypeNm
						if($.osl.isNull(nowSignTypeNm)){
							nowSignTypeNm = "-";
						}
						return nowSignTypeNm;
					}	
				},
				{field: 'lastSignUsrNm', title: '결재자', textAlign: 'center', width: 100
					,template: function(row){
						var lastSignUsrNm = row.lastSignUsrNm
						
						if($.osl.isNull(lastSignUsrNm)){
							lastSignUsrNm = "-";
						}else{
							
							lastSignUsrNm = $.osl.user.usrImgSet(row.lastSignUsrId, row.lastSignUsrNm);
						}
						return lastSignUsrNm;
					},
					onclick: function(rowData){
						
						if(!$.osl.isNull(rowData.lastSignUsrId)){
							
							$.osl.user.usrInfoPopup(rowData.lastSignUsrId);
						}
					}
				},
				{field: 'dplStsNm', title: '배포 상태', textAlign: 'center', width: 90, autoHide: false, search: true, searchType:"select", searchCd: "DPL00001", searchField:"dplStsCd", sortField: "dplStsCd"},
				{field: 'dplVer', title: '배포 버전', textAlign: 'center', width: 100, search: true},
				{field: 'dplNm', title: '배포 명', textAlign: 'left', width: 280, autoHide: false, search: true},
				{field: 'dplTypeNm', title: '배포 방법', textAlign: 'center', width: 70, autoHide: false, search: true, searchType:"select", searchCd: "DPL00003", searchField:"dplTypeCd", sortField: "dplTypeCd"},
				{field: 'dplRevisionNum', title: '배포 리비전 번호', textAlign: 'center', width: 100
					,template: function(row){
						var dplRevisionNum = row.dplRevisionNum;
						
						if($.osl.isNull(dplRevisionNum)){
							dplRevisionNum = "Last Revision";
						}
						return dplRevisionNum;
					}
				},
				{field: 'dplDt', title: '배포 일자', textAlign: 'center', width: 100, search: true, searchType:"daterange"},
				{field: 'dplUsrNm', title: '배포자', textAlign: 'center', width: 100, search: true
					,template: function (row) {
						return $.osl.user.usrImgSet(row.dplUsrImgId, row.dplUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.dplUsrId);
					}
				},
			],
			rows:{
				clickCheckbox: true
			},
			searchColumns:[
				{field: 'dplDesc', title:"배포 설명", searchOrd: 8}
			],
			actionBtn:{
				"dblClick": true, 
				"signRequest": true,
				"title": "기능 버튼",
				"width" : 160
			},
			actionTooltip:{
				"update": "배포 계획 수정",
				"delete": "배포 계획 삭제",
				"dblClick": "배포 계획 상세 보기",
				"signRequest": "결재선 지정"
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalTitle: '신규 배포 계획 생성',
							modalSize: 'xl',
							autoHeight: false,
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1001View.do',data,options);
				},
				"update":function(rowData, datatableId, type, rowNum, elem){
					
					
					var dplStsCd = rowData.dplStsCd;
					
					var dplSignUseCd = rowData.dplSignUseCd;
					
					var signType = rowData.nowSignTypeCd;
					
					
					if(dplStsCd == "02"){
						$.osl.alert('성공된 배포 계획은 수정이 불가능합니다.');
						return false;
					}
					
					
					if(signType == "03"){
						
						$.osl.alert('결재 승인된 배포 계획은 수정이 불가능합니다.');
						return false;
					}
					
					
					if(signType == "02"){
						
						$.osl.alert('결재 대기중인 배포 계획은 수정이 불가능합니다.');
						return false;
					}
					
					
					
					var data = {
						type:"update",
						paramPrjId: rowData.prjId,
						paramDplId: rowData.dplId,
						paramDplDelCd: rowData.dplDelCd
					};
					
					var options = {
						idKey: rowData.prjId+"_"+rowData.dplId,
						modalTitle: '배포 계획 수정',
						modalSize: 'xl',
						autoHeight: false,
						closeConfirm: false
					};
					
					$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1001View.do',data,options);
				},
				"delete":function(rowDatas, datatableId, type, rowNum, elem){
					
					
					var delFlag = false;
					
					$.each(rowDatas, function(idx, map){
						
						
						if(map.nowSignTypeCd == "03"){
							
							$.osl.alert('결재 승인된 배포 계획은 삭제가 불가능합니다.');
							delFlag = true;
							return false;
						}
						
						
						if(map.nowSignTypeCd == "02"){
							
							$.osl.alert('결재 대기중인 배포 계획은 삭제가 불가능합니다.');
							delFlag = true;
							return false;
						}
					});
					
					if(delFlag){
						return false;
					}
					
					return;
					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/dpl/dpl1000/dpl1000/deleteDpl1000DplListAjax.do'/>"}
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
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
					var data = {
							paramPrjId : rowData.prjId,
							paramDplId : rowData.dplId
						};
					var options = {
							idKey: datatableId +"_"+ rowData.dplId,
							modalTitle: "["+rowData.dplNm +"] "+ "상세 정보",
							autoHeight: false,
							modalSize: 'xl'
						};
					
					$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1002View.do',data,options);
				},
				
				"signRequest":function(rowData, datatableId, type, rowNum, elem){
					
					var rowData;
					
					
					if(type == "list"){
						
						var selRecords = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords();
						
						
						if(selRecords.length == 0){
							$.osl.alert($.osl.lang("datatable.action.update.nonSelect"));
							return true;
						}
						
						else if(selRecords.length > 1){
							$.osl.alert($.osl.lang("datatable.action.update.manySelect",selRecords.length));
							return true;
						}
						else{
							var rowIdx = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords().data("row");
							
							rowData = $.osl.datatable.list[datatableId].targetDt.dataSet[rowIdx];
						}
					}
					
					
					var signType = rowData.nowSignTypeCd
					
					if(rowData.dplSignUseCd == '02'){
						
						$.osl.alert("결재 사용 유무가 아니오인 경우 결재를 사용할 수 없습니다.");
						return true;
					}
					
					if(signType == '02' || signType == '03'){
						var data = {
								prjId :  rowData.prjId,
								targetId :  rowData.dplId,
								targetCd : '02',
								ord : rowData.lastOrd,
								signType : rowData.nowSignTypeNm
						};
						var options = {
								
								modalTitle: $.osl.lang("prj3000.modal.title.selectSignLine"),  
								autoHeight: false,
								modalSize: "md"
						};
						
						$.osl.layerPopupOpen('/cmm/cmm6000/cmm6600/selectCmm6601View.do',data,options);
					
					}
					
					else {
						var data = {
								prjId :  rowData.prjId,
								targetId :  rowData.dplId,
								targetCd :  '02'
						};
						
						var options = {
								modalTitle: $.osl.lang("prj3000.modal.title.saveSignLine"),
								autoHeight: false,
								modalSize: "xl"
						};
						 
						$.osl.layerPopupOpen('/cmm/cmm6000/cmm6600/selectCmm6600View.do',data,options); 
					}
					
					
				}
			},
			theme: {
				 actionBtnIcon:{
					 "dblClick": "fa fa-info-circle",
					 "signRequest": "fa fa-file-signature"
				 }
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
	OSLDpl1000Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
