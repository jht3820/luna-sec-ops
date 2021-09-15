<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm9201">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}"/>
	<input type="hidden" name="paramJenId" id="paramJenId" value="${param.paramJenId}"/>
	<input type="hidden" name="paramJobId" id="paramJobId" value="${param.paramJobId}"/>
</form>
<div class="row">
	<!-- begin::배포 실행 권한 목록 영역 -->
	<div class="col-lg-6 col-md-12 col-sm-12">
		<div class="kt-portlet">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm9201.title.assignDplAuth">배포 실행 권한 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9201AssignDplAuthTable" data-datatable-action="selDplAuthDelete" data-title-lang-cd="stm9201.button.toolTip.dplAuthDelete" title="배포 실행 권한 제외" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1">
							<span data-lang-cd="stm9201.button.title.dplAuthDelete">배정 제외</span><i class="fa fa-arrow-alt-circle-right osl-padding-r0 osl-padding-l05"></i>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="selDplAuthDelete" data-datatable-action="select"  data-title-lang-cd="stm9201.button.toolTip.assignAuthSearch" title="배정 실행 권한 대상 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="2">
							<i class="fa fa-list"></i><span>조회</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body kt-padding-10 osl-min-h-px--400">
				<div class="osl-datatable-search" data-datatable-id="stm9201AssignDplAuthTable"></div>
				<div class="kt_datatable" id="stm9201AssignDplAuthTable"></div>
			</div>
		</div>
	</div>
	<!-- end::배포 실행 권한 목록 영역 -->
	
	<!-- begin::배포 실행 미배정 권한 목록 영역 -->
	<div class="col-lg-6 col-md-12 col-sm-12">
		<div class="kt-portlet">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm9201.title.notAssignDplAuth">미배정 권한 그룹 및 사용자</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9201NotAssignDplAuthTable" data-datatable-action="selDplAuthInsert" data-title-lang-cd="stm9201.button.toolTip.dplAuthInsert" title="배포 실행 권한 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1">
							<i class="fa fa-arrow-alt-circle-left"></i><span data-lang-cd="stm9201.button.title.dplAuthInsert">배정 등록</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm9201NotAssignDplAuthTable" data-datatable-action="select" data-title-lang-cd="stm9201.button.toolTip.notAssignAuthSearch" title="미배정 권한 대상 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="2">
							<i class="fa fa-list"></i><span>조회</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body kt-padding-10 osl-min-h-px--400">
				<div class="osl-datatable-search" data-datatable-id="stm9201NotAssignDplAuthTable"></div>
				<div class="kt_datatable" id="stm9201NotAssignDplAuthTable"></div>
			</div>
		</div>
	</div>
	<!-- end::배포 실행 미배정 권한 목록 영역 -->
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>

<script>
"use strict";
var OSLStm9201Popup = function () {

	// 버튼 문구 세팅
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	// 넘어온 파라미터 값
	var paramPrjId = $("#paramPrjId").val();
	var paramJenId = $("#paramJenId").val();
	var paramJobId = $("#paramJobId").val();
	
	// datatable Id
	var assignDplAuthTableId = "stm9201AssignDplAuthTable";
	var notAssignDplAuthTableId = "stm9201NotAssignDplAuthTable";
	
    // Private functions
    var documentSetting = function () {
    	
    	// 배정된 배포 실행 권한 datatable 세팅
		$.osl.datatable.setting(assignDplAuthTableId,{
			data: {
				source:{
					read:{
						url: "/stm/stm9000/stm9200/selectStm9200PrjAssignDplAuthListAjax.do",
						params : {
							prjId: paramPrjId,
							jenId: paramJenId,
							jobId: paramJobId
						}
					}
				},
				pageSize: 4
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
				{field: 'authTypeNm', title: '구분', textAlign: 'center', width: 80, search: true, searchType:"select", searchCd: "DPL00007", searchField:"authTypeCd"},
				{field: 'dplAuthTargetNm', title: '권한 대상 명', textAlign: 'left', width: 150, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.dplAuthTargetNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직급', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd"},
				{field: 'usrDutyNm', title: '직책', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 150, search: true},
			],
			searchColumns:[
				{field: 'dplAuthTargetId', title: '권한 대상 ID', searchOrd: 1}
			],
			actionBtn:{
				"title": "제외",
				"update": false,
				"delete": false,
				"dblClick": true,
			},
			actionTooltip:{
				"dblClick": $.osl.lang("stm9201.button.dplAuthDelete")
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-right",
				}
			},
			actionFn:{
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					// 배포 실행 권한 배정 제외
					fnDplAuthDelete(rowDatas);
				},
				// 배포 권한 배정제외
				"selDplAuthDelete": function(rowDatas, datatableId, type, rownum, elem){
					
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("stm9201.message.confirm.dplAuthDelete",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							// 배포 실행 권한 배정 제외
							fnDplAuthDelete(rowDatas);
						}
					});
				}
			}
		});
		
		// 미배정된 배포 실행 권한 datatable 세팅
		$.osl.datatable.setting(notAssignDplAuthTableId,{
			data: {
				source: {
					read: {
						url: "/stm/stm9000/stm9200/selectStm9200PrjNotAssignDplAuthListAjax.do",
						params : {
							prjId: paramPrjId,
							jenId: paramJenId,
							jobId: paramJobId
						}
					}
				},
				pageSize: 4,
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
				{field: 'authTypeNm', title: '구분', textAlign: 'center', width: 80, search: true, searchType:"select", searchCd: "DPL00007", searchField:"authTypeCd"},
				{field: 'dplAuthTargetNm', title: '권한 대상 명', textAlign: 'left', width: 130, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.dplAuthTargetNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직급', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직책', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 150, search: true, sortable: false},
			],
			searchColumns:[
				{field: 'dplAuthTargetId', title: '권한 대상 ID', searchOrd: 1}
			],
			actionBtn:{
				"title": "배정",
				"update": false,
				"delete": false,
				"dblClick": true,
				"lastPush": false,
			},
			actionTooltip:{
				"dblClick": $.osl.lang("stm9201.button.dplAuthInsert")
			},
			theme:{
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-left",
				}
			},
			actionFn:{
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					//배포 샐행 권한 배정 등록
					fnDplAuthInsert(rowDatas);
				},
				// 배포 실행 권한 배정
				"selDplAuthInsert": function(rowDatas, datatableId, type, rownum, elem){
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("stm9201.message.confirm.dplAuthInsert",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							// 배포 실행 권한 배정
							fnDplAuthInsert(rowDatas);
						}
					});
				}
			}
		});
		
		
		/**
		 * function 명 	: fnDplAuthInsert
		 * function 설명	: 배포 실행 권한을 배정한다.
		 * @param rowDatas : 미배정 데이터 테이블에서 선택한 row 데이터 목록
		 */
		var fnDplAuthInsert = function(rowDatas){
			
			 console.log(">> ", rowDatas);
			 
			//AJAX 설정
			var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/stm/stm9000/stm9200/insertStm9200DplAuthInfoAjax.do'/>"}
					,{paramPrjId : paramPrjId, paramJenId : paramJenId , paramJobId : paramJobId, dataList : JSON.stringify(rowDatas)});
			//AJAX 전송 성공 함수
			ajaxObj.setFnSuccess(function(data){
				if(data.errorYn == "Y"){
	   				$.osl.alert(data.message,{type: 'error'});
	   			}else{
	   				// 배정 등록 메시지 출력
	   				$.osl.toastr(data.message);
	   				
					// 데이터 테이블 재조회
					$.osl.datatable.list[assignDplAuthTableId].targetDt.reload();
					$.osl.datatable.list[notAssignDplAuthTableId].targetDt.reload();
	   			}
			});
			
			//AJAX 전송
			ajaxObj.send();
		};
		

		/**
		 * function 명 	: fnDplAuthDelete
		 * function 설명	: 배포 실행 권한을 배정 제외한다.
		 * @param rowDatas : 미배정 데이터 테이블에서 선택한 row 데이터 목록
		 */
		var fnDplAuthDelete = function(rowDatas){
			
			//AJAX 설정
			var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/stm/stm9000/stm9200/deleteStm9200DplAuthInfoAjax.do'/>"}
					,{paramPrjId : paramPrjId, paramJenId : paramJenId , paramJobId : paramJobId, dataList: JSON.stringify(rowDatas)});
			//AJAX 전송 성공 함수
			ajaxObj.setFnSuccess(function(data){
				if(data.errorYn == "Y"){
	   				$.osl.alert(data.message,{type: 'error'});
	   			}else{
	   				// 배정 제외 메시지 출력
	   				$.osl.toastr(data.message);
	   				
	   				// 데이터 테이블 재조회
					$.osl.datatable.list[assignDplAuthTableId].targetDt.reload();
					$.osl.datatable.list[notAssignDplAuthTableId].targetDt.reload();
	   			}
			});
			
			//AJAX 전송
			ajaxObj.send();
		};
		
    };
	
    return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

//Initialization
$.osl.ready(function(){
	OSLStm9201Popup.init();
});

	
</script>