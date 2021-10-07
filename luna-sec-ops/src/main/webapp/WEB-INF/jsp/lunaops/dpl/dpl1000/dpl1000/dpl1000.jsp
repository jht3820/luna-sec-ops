<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<!-- begin page DOM -->
<div class="kt-portlet kt-portlet--mobile">
	<!-- 카드형, 그리드형 보기 부분은 현재 주석처리
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>	
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type active" title="데이터 카드 형식으로 보기" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="6" data-view-type="01">
						<i class="fa fa-table osl-padding-r0"></i>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="데이터 테이블 형식으로 보기" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="7" data-view-type="02">
						<i class="fa fa-list osl-padding-r0"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block ">
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="dpl1000Table"></div>
		</div>
		<div class="col-lg-9 col-md-12 col-sm-12 text-right kt-padding-r-0">
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="select" title="배포 계획 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
				<i class="fa fa-list"></i><span>조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="insert" title="배포 계획  등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
				<i class="fa fa-plus"></i><span>등록</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="update" title="배포 계획  수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
				<i class="fa fa-edit"></i><span>수정</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl1000Table" data-datatable-action="delete" title="배포 계획  삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
				<i class="fa fa-trash-alt"></i><span>삭제</span>
			</button>
		</div>
	</div>
	<div id="dpl1000CardTable"></div>
	<div class="kt_datatable osl-datatable-footer__divide" id="dpl1000Table"></div>
	 -->
	 
	<!-- 배포 계획 목록 그리드형 보기만 -->
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
		<!-- begin::버튼영역 -->
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
		<!-- end::버튼 영역 -->
	</div>
	<div class="kt-portlet__body">
		<!-- begin:: datatable 영역 -->
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="dpl1000Table"></div>
		</div>
		<div class="kt_datatable osl-datatable-footer__divide" id="dpl1000Table"></div>
		<!-- end:: datatable 영역 -->
	</div>
</div>

<!-- begin page script -->
<script>
"use strict";
var OSLDpl1000Popup = function () {
	var documentSetting = function(){
		
		//데이터 테이블 세팅
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
				{field: 'nowSignTypeNm', title: '결재 상태', textAlign: 'center', width: 90, search: true, searchType:"select", searchCd: "REQ00008", searchField:"nowSignTypeCd", sortField: "nowSignTypeCd"
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
						// 결재자 명 존재하는지 체크
						if($.osl.isNull(lastSignUsrNm)){
							lastSignUsrNm = "-";
						}else{
							// 결재자 명 존재 시 사용자 이미지도 같이 표시
							lastSignUsrNm = $.osl.user.usrImgSet(row.lastSignUsrId, row.lastSignUsrNm);
						}
						return lastSignUsrNm;
					},
					onclick: function(rowData){
						// 결재자 존재 시
						if(!$.osl.isNull(rowData.lastSignUsrId)){
							// 클릭했을 경우 사용자 팝업 오픈
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
						// 배포 리비전 없을 경우 문구 변경
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
					
					// 배포 상태
					var dplStsCd = rowData.dplStsCd;
					// 결재 사용 유무
					var dplSignUseCd = rowData.dplSignUseCd;
					// 결재 상태
					var signType = rowData.nowSignTypeCd;
					
					// 배포 상태 체크 (성공일 경우 수정 불가)
					if(dplStsCd == "02"){
						$.osl.alert('성공된 배포 계획은 수정이 불가능합니다.');
						return false;
					}
					
					// 결재 승인인 경우 수정 불가
					if(signType == "03"){
						//lang
						$.osl.alert('결재 승인된 배포 계획은 수정이 불가능합니다.');
						return false;
					}
					
					// 결재 대기인 경우 수정 불가
					if(signType == "02"){
						//lang
						$.osl.alert('결재 대기중인 배포 계획은 수정이 불가능합니다.');
						return false;
					}
					
					// 결재 사용여부에 따른 유효성 체크 - 현재는 결재 부분 체크 주석처리
					/* if(dplSignUseCd == "01"){
						$.osl.alert('결재 승인된 배포 계획은 수정이 불가능합니다.');
						return false;
					} */
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
					
					// 결재상태에 따리 삭제 방지 - 추가
					var delFlag = false;
					
					$.each(rowDatas, function(idx, map){
						// TODO 추가
						// 결재 승인인 경우 수정 불가
						if(map.nowSignTypeCd == "03"){
							//lang
							$.osl.alert('결재 승인된 배포 계획은 삭제가 불가능합니다.');
							delFlag = true;
							return false;
						}
						
						// 결재 대기인 경우 수정 불가
						if(map.nowSignTypeCd == "02"){
							//lang
							$.osl.alert('결재 대기중인 배포 계획은 삭제가 불가능합니다.');
							delFlag = true;
							return false;
						}
					});
					
					if(delFlag){
						return false;
					}
					
					return;
					//AJAX 설정
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/dpl/dpl1000/dpl1000/deleteDpl1000DplListAjax.do'/>"}
							,{deleteDataList: JSON.stringify(rowDatas)});
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
			   				$.osl.alert(data.message,{type: 'error'});
			   			}else{
			   				//삭제 성공
			   				$.osl.toastr(data.message);
			   				
			   				//datatable 조회
			   				$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
			   			}
					});
					
					//AJAX 전송
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
				// 결재선 지정
				"signRequest":function(rowData, datatableId, type, rowNum, elem){
					
					var rowData;
					
					//외부 버튼 클릭 시 (체크박스 데이터 연동)
					if(type == "list"){
						//선택 레코드 수
						var selRecords = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords();
						
						//선택 레코드 없는 경우
						if(selRecords.length == 0){
							$.osl.alert($.osl.lang("datatable.action.update.nonSelect"));
							return true;
						}
						//선택 레코드 2개이상인경우 alert 띄우기
						else if(selRecords.length > 1){
							$.osl.alert($.osl.lang("datatable.action.update.manySelect",selRecords.length));
							return true;
						}
						else{
							var rowIdx = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords().data("row");
							
							rowData = $.osl.datatable.list[datatableId].targetDt.dataSet[rowIdx];
						}
					}
					
					//결재 상태
					var signType = rowData.nowSignTypeCd
					
					if(rowData.dplSignUseCd == '02'){
						//lang
						$.osl.alert("결재 사용 유무가 아니오인 경우 결재를 사용할 수 없습니다.");
						return true;
					}
					//결재 대기거나 승인인 경우 결재선 지정 불가능 (결재선 조회 팝업 오픈)
					if(signType == '02' || signType == '03'){
						var data = {
								prjId :  rowData.prjId,
								targetId :  rowData.dplId,
								targetCd : '02',
								ord : rowData.lastOrd,
								signType : rowData.nowSignTypeNm
						};
						var options = {
								//lang
								modalTitle: $.osl.lang("prj3000.modal.title.selectSignLine"),  
								autoHeight: false,
								modalSize: "md"
						};
						
						$.osl.layerPopupOpen('/cmm/cmm6000/cmm6600/selectCmm6601View.do',data,options);
					
					}
					//아니라면 결재선 지정 팝업 오픈
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
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLDpl1000Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
