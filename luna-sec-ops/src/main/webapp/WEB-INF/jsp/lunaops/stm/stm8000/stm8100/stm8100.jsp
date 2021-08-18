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
			<div class="kt-portlet__head-wrapper">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" title="리비전 확인 권한 설정" data-title-lang-cd="" data-datatable-id="stm8100LicPrjTree" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="authRevision" tabindex="1">
						<i class="fa fa-chevron-circle-right"></i><span data-lang-cd="">리비전 확인 권한 설정</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" title="소스 확인 권한 설정" data-title-lang-cd="" data-datatable-id="stm8100LicPrjTree" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="authCode" tabindex="2">
						<i class="fa fa-chevron-circle-right"></i><span data-lang-cd="">소스 확인 권한 설정</span>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<!-- begin:: 프로젝트 목록 트리 영역 -->
	<div class="col-lg-3 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile  kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="">전체 프로젝트 목록</span>
					</h4>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-group">
						<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-title-lang-cd="tree.label.contextmenu.allNodeOpen" data-tree-id="stm8100LicPrjTree" data-tree-action="allNodeOpen">
							<i class="fa fa-plus"></i>
						</a>
						<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 접기" data-title-lang-cd="tree.label.contextmenu.allNodeClose" data-tree-id="stm8100LicPrjTree" data-tree-action="allNodeClose">
							<i class="fa fa-minus"></i>
						</a>
						<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md">
							<i class="la la-angle-down"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="osl-tree-search" data-tree-id="stm8100LicPrjTree"></div>
					</div>
				</div>
				<div class="kt-separator kt-separator--space-sm kt-separator--border-solid"></div>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="osl-tree kt-scroll" data-height="566" id="stm8100LicPrjTree"></div>
					</div>
				</div>
			</div>
		</div>
	</div> 
	<!-- end:: 프로젝트 목록 트리 영역 -->
	
	<!-- begin::우측 배정/미배정 소스 저장소목록 영역 -->
	<div class="col-lg-9 col-md-12 col-sm-12 col-12">
		<!-- begin:: 배정 소스 저장소 목록-->
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="">소스 저장소 배정 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<div class="osl-datatable-search kt-margin-b-0 kt-margin-r-10" data-datatable-id="stm8100AssignStrgTable"></div>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8100AssignStrgTable" data-datatable-action="select" title="소스 저장소 배정 목록 조회" data-title-lang-cd="stm8100.toolTip.searchAssignStrg" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8100AssignStrgTable" data-datatable-action="removeStrg" title="소스 저장소 배정 제외" data-title-lang-cd="stm8100.toolTip.removeStrg" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="removeStrg" tabindex="2">
							<i class="fa fa-arrow-alt-circle-down"></i><span data-lang-cd="stm8100.common.notAssign">제외</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portelt__body">
				<div class="kt_datatable" id="stm8100AssignStrgTable"></div>
			</div>
		</div>
		<!-- end:: 배정 job 목록-->
		<!-- begin:: 미배정 job 목록-->
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm8100.title.notAssignStrgList">소스 저장소 미배정 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<div class="osl-datatable-search kt-margin-b-0 kt-margin-r-10" data-datatable-id="stm8100NotAssignStrgTable"></div>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8100NotAssignStrgTable" data-datatable-action="select" title="소스 저장소 미배정 목록 조회" data-title-lang-cd="stm8100.toolTip.searchNotAssignStrg" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8100NotAssignStrgTable" data-datatable-action="addStrg" title="소스 저장소 배정" data-title-lang-cd="stm8100.toolTip.addStrg" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="addStrg" tabindex="2">
							<i class="fa fa-arrow-alt-circle-up"></i><span data-lang-cd="stm8100.common.assign">배정</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portelt__body">
				<div class="kt_datatable" id="stm8100NotAssignStrgTable"></div>
			</div>
		</div>
		<!-- begin:: 미배정 소스 저장소 목록-->
	</div> 
	<!-- end::우측 배정/미배정 소스 저장소 목록 영역 -->
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLStm8100 = function () {
	//트리
	var treetableId = "stm8100LicPrjTree";
	//배정 목록 테이블
	var strgAssDatatableId = "stm8100AssignStrgTable";
	//미배정 목록 테이블
	var strgNonAssDatatableId = "stm8100NotAssignStrgTable";
	
	// 프로젝트 트리
	var prjTreeObj;
	
	//현재 선택 프로젝트 Id
	var selPrjId;
	// 현재 선택 프로젝트의 그룹 Id
	var selPrjGrpId;
	
	//배정 리스트
	var assList = [];
	//미배정 리스트
	var nonAssList = [];
	
	var documentSetting = function(){
		
		// 프로젝트 tree 세팅
		prjTreeObj = $.osl.tree.setting(treetableId,{
			data:{
				url:"<c:url value='/stm/stm1000/stm1000/selectStm1000LicencePrjAllListAjax.do'/>",
				key: "prjId",
				pKey: "prjGrpId",
				labelKey: "prjNm"
			},
			search:{
				//대소문자 구분
				case_insensitive : true,
				//검색 결과 노드만 표시
				show_only_matches: true,
				//show_only_matches: true 일때 하위 노드도 같이 표시 할건지
				show_only_matches_children: true,
			},
			callback:{
				onclick: function(treeObj,selNode){
					
					if($.osl.isNull(selNode) || $.osl.isNull(selNode.original)){
						$.osl.alert($.osl.lang("stm9200.message.alert.treeNodeSelect"));
						return false;
					}
					
					// 프로젝트 그룹 코드
					var prjGrpCd = selNode.original.prjGrpCd;

					// 프로젝트 그룹 선택 시 알림
					if(prjGrpCd == "01"){
						$.osl.toastr($.osl.lang("stm9200.message.toastr.projectSelect"));
						return false;
					}
					
					// 선택한 노드에서 프로젝트 그룹 ID, 프로젝트 Id를 가져온다.
					selPrjId = selNode.original.prjId;
					selPrjGrpId = selNode.original.prjGrpId;
					
					// 배정 데이터 테이블
					var assDataTableTarget = $.osl.datatable.list[strgAssDatatableId].targetDt;
					// 미배정 데이터 테이블
					var notAssDataTableTarget = $.osl.datatable.list[strgNonAssDatatableId].targetDt;
					
					// 배정 조회
					assDataTableTarget.setDataSourceParam("prjGrpId", selPrjGrpId);
					assDataTableTarget.setDataSourceParam("prjId", selPrjId);
					$("button[data-datatable-id="+strgAssDatatableId+"][data-datatable-action=select]").click();
					
					// 미배정 조회
					notAssDataTableTarget.setDataSourceParam("prjGrpId", selPrjGrpId);
					notAssDataTableTarget.setDataSourceParam("prjId", selPrjId);
					$("button[data-datatable-id="+strgNonAssDatatableId+"][data-datatable-action=select]").click();
				}
			}
		});
		
		//퍼펙트 스크롤 적용
		KTUtil.scrollInit($("#"+treetableId)[0], {
	        disableForMobile: true, 
	        resetHeightOnDestroy: true, 
	        handleWindowResize: true, 
	        height: 566
	    });
		
		// datatable 세팅 -----------------------
		
		// 소스 저장소 배정 테이블 셋팅
		$.osl.datatable.setting(strgAssDatatableId,{
			data:{
				source:{
					read:{
						url: "/stm/stm8000/stm8100/selectStm8100AssStrgListAjax.do"
					}
				},
				pageSize: 4
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100]
					}
				}
			},
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'strgTypeNm', title: '유형', textAlign: 'left', width: 40, search: true, searchType:"select", searchCd: "STM00004", searchField:"strgTypeCd", sortField: "strgTypeCd"},
				{field: 'strgRepTitle', title: '저장소명', textAlign: 'left', width: 200, search: true},
				{field: 'strgTxt', title: '저장소 설명', textAlign: 'left', width: 240, search: true},
				{field: 'strgRepUrl', title: '저장소 URL', textAlign: 'left', width: 240},
			],
			rows:{
				clickCheckbox: true
			},
			actionBtn:{
				"title" : "제외",
				"dblClick": true,
				"removeStrg" : true,
				"authRevision" : true,
				"authCode" : true,
				"delete":false,
				"update":false,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick" : "제외",
				"removeStrg" : "제외",
				"authRevision" : "리비전 확인 권한 설정",
				"authCode" : "소스 확인 권한 설정",
			},
			actionFn:{
				"dblClick": function(rowData, datatableId, type, rowNum, elem){
					assList.push(rowData);
					deleteRepo(selPrjId, JSON.stringify(assList));
				},
				"removeStrg": function(rowData, datatableId, type, rowNum, elem){
					assList = rowData;
					deleteRepo(selPrjId, JSON.stringify(assList));
				},
				"authRevision": function(rowData, datatableId, type, rowNum, elem){
					//리비전 권한 배정 팝업 호출
				},
				"authCode": function(rowData, datatableId, type, rowNum, elem){
					//소스 열람 권한 배정 팝업 호출
				},
			},
			theme:{
				actionBtn:{
					"removeStrg" : " kt-hide",
					"authRevision" :  " kt-hide",
					"authCode" :  " kt-hide",
				},
				actionBtnIcon:{
					"dblClick" : "fa fa-arrow-alt-circle-down",
				}
			},
		});
		
		//소스 저장소 미배정 테이블 셋팅
		$.osl.datatable.setting(strgNonAssDatatableId,{
			data:{
				source:{
					read:{
						url: "/stm/stm8000/stm8100/selectStm8100NonAssStrgListAjax.do"
					}
				},
				pageSize: 4
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100]
					}
				}
			},
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'strgTypeNm', title: '유형', textAlign: 'left', width: 40, search: true, searchType:"select", searchCd: "STM00004", searchField:"strgTypeCd", sortField: "strgTypeCd"},
				{field: 'strgRepTitle', title: '저장소명', textAlign: 'left', width: 200, search: true},
				{field: 'strgTxt', title: '저장소 설명', textAlign: 'left', width: 240, search: true},
				{field: 'strgRepUrl', title: '저장소 URL', textAlign: 'left', width: 240},
			],
			rows:{
				clickCheckbox: true
			},
			actionBtn:{
				"title" : "배정",
				"dblClick": true,
				"addStrg" : true,
				"delete":false,
				"update":false,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick" : "소스 저장소 배정",
				"addStrg" : "소스 저장소 배정",
			},
			actionFn:{
				"dblClick": function(rowData, datatableId, type, rowNum, elem){
					nonAssList.push(rowData);
					insertRepo(selPrjId, JSON.stringify(nonAssList));
				},
				"addStrg": function(rowData, datatableId, type, rowNum, elem){
					nonAssList = rowData;
					insertRepo(selPrjId, JSON.stringify(nonAssList));
				},
			},
			theme:{
				actionBtn:{
					"addStrg" : " kt-hide"
				},
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-up",
				}
			}
		});
	};
	
	/**
	* selectBtnClick : 소스 저장소 배정/미배정 목록 조회 버튼 클릭
	*/
	var selectBtnClick = function(){
		//소스 저장소 배정목록 조회
		$.osl.datatable.list[strgAssDatatableId].targetDt.setDataSourceParam("prjId", selPrjId);
		$("button[data-datatable-id="+strgAssDatatableId+"][data-datatable-action=select]").click();
		//소스 저장소 미배정 목록 조회
		$.osl.datatable.list[strgNonAssDatatableId].targetDt.setDataSourceParam("prjId", selPrjId);
		$("button[data-datatable-id="+strgNonAssDatatableId+"][data-datatable-action=select]").click();
	};
	
		
	/**
	 * function 명 	: insertRepo
	 * function 설명	: 프로젝트에 소스 저장소 배정
	 * param : 선택된 프로젝트 ID
	 * param : JSON.Stringify(선택된 소스 저장소 목록)
	 */
	var insertRepo = function(prjId, list){
		 var data = {
				selStrRepList : list,
				prjId : prjId
		};

		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm8000/stm8100/insertStm8100ServerListAjax.do'/>"}
				, data);
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				if(list.length>0){
					$.osl.toastr(data.message);
					nonAssList = [];
				}
				selectBtnClick();
			}
    	});
		//ajax 전송
    	ajaxObj.send();
	};
		
	/**
	 * function 명 	: deleteRepo
	 * function 설명	: 프로젝트에 소스 저장소 배정 제외
	 * param : 선택된 프로젝트 ID
	 * param : JSON.Stringify(선택된 소스 저장소 목록)
	 */
	var deleteRepo = function(prjId, list){
		 var data = {
				selStrRepList : list,
				prjId : prjId
		};
		
		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm8000/stm8100/deleteStm8100ServerListAjax.do'/>"}
				, data);
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				if(list.length>0){
					$.osl.toastr(data.message);
					assList = [];
				}
				selectBtnClick();
			}
    	});
		//ajax 전송
    	ajaxObj.send();
	};
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
}();

$.osl.ready(function(){
	OSLStm8100.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
