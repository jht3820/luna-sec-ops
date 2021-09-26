<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="strgRepId" id="strgRepId" value="<c:out value='${param.strgRepId}'/>">
<div class="kt-portlet kt-portlet--mobile kt-margin-b-10">
	<div class="kt-portlet__head">
		<div class="kt-portlet__head-label kt-portlet__head--lg">
			<h5 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="cmm6800.title.revision">리비전 목록</span>
			</h5>
		</div>
	</div>
</div>
<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
	<div class="kt-portlet__head">
		
		<div class="kt-portlet__head-label">
			<div class="osl-datatable-search kt-margin-b-0" data-datatable-id="cmm6800RepTable"></div>
		</div>
	</div>
	<div class="kt-portlet__head">
		<div class="kt-portlet__head-label kt-portlet__head--lg">
			<h6 class="kt-font-boldest kt-font-brand kt-margin-r-20">
				<span data-lang-cd="cmm6800.label.revisionNum">리비전 번호</span>
			</h6>
			<input type="text" class="osl-outline--secondary rounded kt-padding-10 kt-margin-r-10 osl-w-px-80 osl-h-px-35" placeholder="시작" authocomplate="off" regexstr="^[0-9]{0,4}$" maxlength="4" id="searchStNum" name="searchStNum">
			<span class="osl-h-px-38 font-weight-bolder osl-line-height--38">-</span>
			<input type="text" class="osl-outline--secondary rounded kt-padding-10 kt-margin-l-10 osl-w-px-80 osl-h-px-35" placeholder="종료"  authocomplate="off" regexstr="^[0-9]{0,4}$" maxlength="4" id="searchEdNum" name="searchEdNum">
		</div>
		<div class="kt-portlet__head-toolbar">
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air kt-margin-l-10" data-datatable-id="cmm6800RepTable" data-datatable-action="select" title="리비전 조회" data-title-lang-cd="cmm6800.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
				<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
			</button>
		</div>
	</div>
	<div class="kt-portlet__body kt-padding-15 osl-min-h-px--520">
		
		<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="cmm6800RepTable"></div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="cmm6800SaveSubmit"><i class="fa fa-check-square"></i><span data-lang-cd="cmm6800.complete">선택 완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>

<script>
"use strict";
var OSLCmm6800Popup = function() {
	
	var strgRepId = $("#strgRepId").val();
	
	var revisions=[];
	
	var searchStNum;
	var searchEdNum;
	
	var datatableId = "cmm6800RepTable";

	
	var okRevision = false;
	var okFileCode = false;
	
	var systemRoot = $("#systemRoot").val();
	
	
	var documentSetting = function() {
		
		
		$("#searchStNum").attr("placeholder",$.osl.lang("cmm6800.placeholder.revision.start"));
		$("#searchEdNum").attr("placeholder",$.osl.lang("cmm6800.placeholder.revision.end"));
		
		
		$("#cmm6800SaveSubmit > span").text($.osl.lang("cmm6800.complete"));
		$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
		
		
		if(!$.osl.isNull(systemRoot) && systemRoot){
			
			okRevision = true;
			okFileCode = true;
		}else{
			authCheck(strgRepId);
			
			
			if(!okRevision){
				$.osl.alert($.osl.lang("cmm6800.message.auth"));
				
				$.osl.layerPopupClose();
			}
		}
		
		
		getStrgRepInfo();
		
		
		$.osl.datatable.setting(datatableId,{
				data: {
					source: {
						read: {
							url: "/stm/stm8000/stm8000/selectStm8000RevisionListAjax.do",
							params : params
						}
					},
				},
				columns: [
					{field: 'revision', title: '리비전', textAlign: 'center', width: 40, autoHide: false, sortable: false},
					{field: 'comment', title: '내용', textAlign: 'left', width: 200, sortable: false, search:true,
						template : function(row){
							if($.osl.isNull((row.comment).trim())){
								return "-";
							}else{
								return row.comment;
							}
						},	
					},
					{field: 'author', title: '등록자', textAlign: 'center', width: 80, sortable: false, search:true},
					{field: 'logDate', title: '등록일', textAlign: 'center', width: 80, sortable: false, search:true, searchType:"daterange",
						template : function(row){
							var paramDatetime = new Date(row.logDate);
			                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
			                return agoTimeStr.agoString;
						},
					},
				],
				rows:{
					clickCheckbox: true
				},
				actionBtn:{
					"title": $.osl.lang("cmm6800.title.actionTitle"),
					"width": 30,
					"insert" : false,
					"update" : false,
					"delete" : false,
					"choose" : true,
				},
				actionTooltip:{
					"choose" : $.osl.lang("cmm6800.actionTooltip.chooseTooltip"),
				},
				actionFn:{
					"choose": function(rowDatas, datatableId, type, rowNum, elem){
						if(type == "list"){
							revisions = rowDatas;
						}else{
							revisions.push(rowDatas);
						}
						
						$("#cmm6800SaveSubmit").click();
					}
				},
				theme:{
					 actionBtn:{
						 "choose": ""
					 },
					 actionBtnIcon:{
	    				"choose": "fa flaticon2-check-mark",
	    			}
				},
				callback:{
					initComplete: function(evt, config){
					},
					ajaxDone: function(evt, list){
						$("#searchStNum").val($.osl.datatable.list[datatableId].targetDt.lastResponse.meta.searchStNum);
						$("#searchEdNum").val($.osl.datatable.list[datatableId].targetDt.lastResponse.meta.searchEdNum);
						
						searchStNum = $("#searchStNum").val();
						searchEdNum = $("#searchEdNum").val();
					}
				}
			}
		);

		$("#cmm6800SaveSubmit").click(function(){
			$.osl.layerPopupClose();
			
			
		});
	}
	
	var selectBtnClick = function(){
		searchStNum = $("#searchStNum").val();
		searchEdNum = $("#searchEdNum").val();
		
		
		var datatable = $.osl.datatable.list[datatableId].targetDt;
		datatable.setDataSourceParam("searchStNum", searchStNum);
		datatable.setDataSourceParam("searchEdNum", searchEdNum);						
		$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
	};
	
	
	var authCheck = function(strgRepId){
		var data = {
				strgRepId : strgRepId,
		};
		
		
    	var ajaxObj = new $.osl.ajaxRequestAction(
	   			{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000AuthCheckAjax.do'/>", "async": false}
				, data);
		
    	
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var result = data.result;
				
				
				if(result.resultRevision == "Y"){
					okRevision = true;
				}else{
					okRevision = false;
				}
				
				if(result.resultFileCode == "Y"){
					okFileCode = true;
				}else{
					okFileCode = false;
				}
			}
    	});
    	
		ajaxObj.send();
	};
	
	return {
		init: function(){
			documentSetting();
		},
		getRevisionList : function(){
			eturn JSON.stringify(revisions);
		}
	};
 }();
 
 
 $.osl.ready(function(){
	 OSLCmm6800Popup.init();
 });
</script>
