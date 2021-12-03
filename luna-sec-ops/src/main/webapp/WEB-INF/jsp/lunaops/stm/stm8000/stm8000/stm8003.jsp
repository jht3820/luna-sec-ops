<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
<input type="hidden" name="strgRepId" id="strgRepId" value="<c:out value='${param.strgRepId}'/>">
<input type="hidden" name="revision" id="revision" value="<c:out value='${param.revision}'/>">
<input type="hidden" name="filePath" id="filePath" value="<c:out value='${param.path}'/>">
<input type="hidden" name="fileName" id="fileName" value="<c:out value='${param.name}'/>">
<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
	<div class="kt-portlet__head">
		<div class="kt-portlet__head-label kt-portlet__head--lg">
			<h5 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm8003.title">파일 리비전 목록</span>
			</h5>
		</div>
	</div>
	<div class="kt-portlet__head">
		<div class="kt-portlet__head-label kt-portlet__head--lg">
			<h6 class="kt-font-boldest kt-font-brand kt-margin-r-20">
				<span data-lang-cd="stm8003.revisionNum">리비전 번호</span>
			</h6>
			<input type="text" class="osl-outline--secondary rounded kt-margin-r-10 kt-padding-10 osl-w-px-80 osl-h-px-35" placeholder="시작" authocomplate="off" regexstr="^[0-9]{0,4}$" maxlength="4" id="searchStNum" name="searchStNum" value="${param.searchStNum}">
			<span class="osl-h-px-38 osl-line-height--38 font-weight-bolder">&nbsp;-&nbsp;</span>
			<input type="text" class="osl-outline--secondary rounded kt-margin-l-10 kt-padding-10 osl-w-px-80 osl-h-px-35" placeholder="종료"  authocomplate="off" regexstr="^[0-9]{0,4}$" maxlength="4" id="searchEdNum" name="searchEdNum" value="${param.searchEdNum}">
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-group">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8003FileTable" data-datatable-action="select" title="파일 리비전 조회" data-title-lang-cd="stm8003.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm8003FileTable" data-datatable-action="diff" title="DIFF" data-title-lang-cd="stm8003.actionBtn.diffTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="diff" tabindex="2">
					<i class="fas fa-code"></i><span data-lang-cd="stm8003.actionBtn.diffBtn">DIFF</span>
				</button>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body kt-padding-15">
		<div class="col-lg-7 col-md-12 col-sm-12 col-12">
			<div class="osl-datatable-search" data-datatable-id="stm8003FileTable"></div>
		</div>
		<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="stm8003FileTable"></div>
	</div>
</div>

<script>
"use strict";
var OSLStm8003Popup = function() {
	var type = $("#type").val();
	var strgRepId = $("#strgRepId").val();
	var filePath = $("#filePath").val();
	var fileName = $("#fileName").val();
	var searchStNum = $("#searchStNum").val();
	var searchEdNum = $("#searchEdNum").val();
	var revision = $("#revision").val();
	
	var datatableId = "stm8003FileTable";

	//기본 설정
	 var documentSetting = function() {
		
		//placeholder 세팅
		$("#searchStNum").attr("placeholder",$.osl.lang("stm8003.placeholder.revision.start"));
		$("#searchEdNum").attr("placeholder",$.osl.lang("stm8003.placeholder.revision.end"));
		
		//해당하는 파일의 버전별 리비전 정보 가져오기
		 $.osl.datatable.setting(datatableId,{
				data: {
					source: {
						read: {
							url: "/stm/stm8000/stm8000/selectStm8000FileRevisionListAjax.do",
							params : {
								type : type,
								strgRepId : strgRepId,
								filePath : filePath,
								searchStNum :searchStNum,
								searchEdNum :searchEdNum,
							}
						}
					},
				},
				columns: [
					{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
					{field: 'revision', title: '리비전', textAlign: 'center', width: 40, autoHide: false, sortable: false},
					{field: 'comment', title: '내용', textAlign: 'left', width: 240, sortable: false, search:true},
					{field: 'author', title: '등록자', textAlign: 'center', width: 80, sortable: false, search:true},
					{field: 'logDate', title: '등록일', textAlign: 'center', width: 80, sortable: false, search:true, searchType:"daterange",
						template : function(row){
							var paramDatetime = new Date(row.logDate);
			                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
			                return agoTimeStr.agoString;
						},
					},
				],
				actionBtn:{
					"title" : $.osl.lang("stm8003.actionBtn.title"),
					"widht" : 30,
					"insert" : false,
					"update" : false,
					"delete" : false,
					"dblClick" : true,
					"diff" : true,
				},
				actionTooltip:{
					"dblClick" : $.osl.lang("stm8003.actionBtn.diffTooltip"),
					"diff" : $.osl.lang("stm8003.actionBtn.diffTooltip")
				},
				actionFn:{
					"select": function(datatableId, elem, datatable){
						//검색 대상 가져오기
						var searchTypeTarget = $(".osl-datatable-search__dropdown[data-datatable-id="+datatableId+"] > .dropdown-item.active");
						
						//검색 값
						var searchData = $("#searchData_"+datatableId);

						//대상 정보 가져오기
						var searchFieldId = searchTypeTarget.data("field-id");
						var searchType = searchTypeTarget.data("opt-type");
						var searchCd = $(this).data("opt-mst-cd");
						
						//입력된 검색값 초기화
						datatable.setDataSourceQuery({});
						
						//시작, 종료 리비전 넣기
						searchStNum = $("#searchStNum").val();
						searchEdNum = $("#searchEdNum").val();
						
						datatable.setDataSourceParam("searchStNum", searchStNum);
						datatable.setDataSourceParam("searchEdNum", searchEdNum);						

						//전체가 아닌경우 해당 타입으로 검색
						if(searchType != "all"){
							var searchDataValue = searchData.val();
							
							//공통코드인경우 select값 가져오기
							if(searchType == "select"){
								searchDataValue = $("#searchSelect_"+datatableId).val();
							}
							datatable.search(searchDataValue,searchFieldId);
							
						}else{
							datatable.search();
						}
						
						//데이터 테이블 재호출
 						datatable.reload();
					},
					"dblClick": function(rowData){
						var data = {
								type : type,
								strgRepId : strgRepId,
								filePath : filePath,
								fileName : fileName,
								diffRevision01 : revision, //기준이 되는 revision
								diffRevision02 : rowData.revision,
							};
							var options = {
								idKey:"stm8003_diff",
								modalTitle: "["+fileName+"] DIFF",
								modalSize: "xl",
								autoHeight: false,
								ftScrollUse: false
							};
							
						$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8004View.do',data,options);
					},
					"diff": function(rowDatas, datatableId, type, rowNum){
						var rowData;
						//리스트인 경우
						if(type == "list"){
							if(rowNum != 1){
								$.osl.alert($.osl.lang("stm8003.message.selectFile", rowNum), {"type":"warning"});
								return false;
							}else{
								rowData = rowDatas[0];
							}
						}else{
							//인포인 경우
							rowData = rowDatas;
						}
						
						var data = {
								type : type,
								strgRepId : strgRepId,
								filePath : filePath,
								fileName : fileName,
								diffRevision01 : revision, //기준이 되는 revision
								diffRevision02 : rowData.revision,
							};
							var options = {
								idKey:"stm8003_diff",
								modalTitle: "["+fileName+"] DIFF",
								modalSize: "xl",
								autoHeight: false,
								ftScrollUse: false
							};
							
						$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8004View.do',data,options);
					}
				},
				theme:{
					 actionBtn:{
						 "dblClick": "",
						 "diff": " kt-hide"
					 }
				},
				callback:{
					initComplete: function(evt, config){
					},
					ajaxDone: function(evt, list){
					}
				}
			}
		);
	};

	return {
		init: function(){
			documentSetting();
		}
	};
 }();
 
 $.osl.ready(function(){
	 OSLStm8003Popup.init();
 });
</script>
