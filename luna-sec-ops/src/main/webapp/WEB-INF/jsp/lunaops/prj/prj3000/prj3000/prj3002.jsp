<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj3002">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
		<div class="kt-portlet">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>프로젝트 그룹 정보
					</h5>
				</div>
			</div>
			<div class="kt-portlet__body kt-padding-15">
				<div class="row">
					<div class="col-lg-6 col-md-12 col-sm-12">
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="prj3002.label.upperDocId">상위 산출물 ID</span></label>
									<input type="text" class="form-control" placeholder="상위 산출물 ID" name="upperDocId" id="upperDocId" readonly="readonly">
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3002.label.upperDocNm">상위 산출물 명</span></label>
									<input type="text" class="form-control" placeholder="상위 산출물 명" name="upperDocNm" id="upperDocNm" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-align-left kt-margin-r-5"></i><span data-lang-cd="prj3002.label.docId">산출물 ID</span></label>
									<input type="text" class="form-control" placeholder="산출물 ID" name="docId" id="docId" value="${param.docId }"  readonly="readonly">
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3002.label.docNm">산출물 명</span></label>
									<input type="text" class="form-control" placeholder="산출물 명" name="docNm" id="docNm" minlength="2" maxlength="100"  readonly="readonly">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fas fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="prj3002.label.docEdDtm">산출물 마감일</span></label>
									<input type="text" class="form-control" placeholder="산출물 마감일" name="docEdDtm" id="docEdDtm" readonly="readonly">
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="prj3002.label.docOrd">순번</span></label>
									<input type="number" class="form-control" placeholder="순번" name="ord" id="ord"  readonly="readonly">
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12">
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj3002.label.signUseCd">결재 사용유무</span></label>
									<input class="form-control" placeholder="결재 사용 유무" id="signUseNm" name="signUseNm"  readonly="readonly">
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj3002.label.docUseCd">사용유무</span></label>
									<input class="form-control" placeholder="사용 유무" id="useNm" name="useNm"  readonly="readonly">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="form-group">
									<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3002.label.docDesc">비고</span></label>
									<div class="form-control h-100 osl-min-height--12rem" id="docDesc"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6 col-md-12 col-sm-12">
				<div class="kt-portlet">
					<div class="kt-portlet__head kt-portlet__head--lg">
						<div class="kt-portlet__head-label">
							<h5 class="kt-font-boldest kt-font-brand">
								<i class="fa fa-th-large kt-margin-r-5"></i>산출물 신규 연결 목록
							</h5>
						</div>
						<div class="kt-portlet__head-toolbar">
							<div class="kt-portlet__head-wrapper">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj3002PrjConTable" data-datatable-action="reset" title="초기화" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="reset" tabindex="1" id="prj3002PrjConReset">
									<span>연결 해제</span><i class="fa fa-arrow-alt-circle-right osl-padding-r0 osl-padding-l05"></i>
								</button>
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj3002PrjConTable" data-datatable-action="selConTargetDelete" title="선택 연결 대상 해제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="1" id="prj3002PrjConDelete">
									<span>연결 해제</span><i class="fa fa-arrow-alt-circle-right osl-padding-r0 osl-padding-l05"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="kt-portlet__body kt-padding-10 osl-min-h-px--400">
						<div class="osl-datatable-search" data-datatable-id="prj3002PrjConTable"></div>
						<div class="kt_datatable" id="prj3002PrjConTable"></div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-12 col-sm-12">
				<div class="kt-portlet">
						<div class="kt-portlet__head kt-portlet__head--lg">
							<div class="kt-portlet__head-label">
								<h5 class="kt-font-boldest kt-font-brand">
									<i class="fa fa-th-large kt-margin-r-5"></i>산출물 연결 대상 목록
								</h5>
							</div>
							<div class="kt-portlet__head-toolbar">
								<div class="kt-portlet__head-wrapper">
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj3002PrjConTargetTable" data-datatable-action="selTargetInsert" title="선택 연결 대상 배정 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1" id="prj3002PrjConTargetInsert">
										<i class="fa fa-arrow-alt-circle-left"></i><span>연결 등록</span>
									</button>
									<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj3002PrjConTargetTable" data-datatable-action="select" title="연결 대상 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
										<i class="fa fa-list"></i><span>조회</span>
									</button>
								</div>
							</div>
						</div>
						<div class="kt-portlet__body kt-padding-10">
							<div class="osl-datatable-search" data-datatable-id="prj3002PrjConTargetTable"></div>
							<div class="kt_datatable" id="prj3002PrjConTargetTable"></div>
						</div>
					</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj3002SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
var OSLPrj1004Popup = function () {
	var formId = 'frPrj3002';
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var docId = $('#docId').val();
	
	
	var type = 'insert';
	
	
	var prjConDocIdList = [];
	
	
	var prjDocConOriginalData = [];
	
	
	var dtParamPrjId = $("#dtParamPrjId").val();
	
    
    var documentSetting = function () {
    	
    	
    	$("#prj3002SaveSubmit > span").text($.osl.lang("prj3002.insert.saveBtnString"));
    	
		
    	$("#prj3002SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj3002.insert.saveString"),null,function(result) {
    	        if (result.value) {
    	        	
    	        	saveFormAction();
    	        }
    		});
    	});
		
    	
    	datatableSetting();
    	
		
    	selectDocInfo();
		
    };
    
    
    var saveFormAction = function() {
    	
   		var fd = $.osl.formDataToJsonArray(formId);

    	var docId = $("#docId").val();
    	
    	fd.append("nowDocId",docId);
		fd.append("type",type);
		
    	
    	var DocConList = $.osl.datatable.list["prj3002PrjConTable"].targetDt.originalDataSet;
    	if(!$.osl.isNull(DocConList) && DocConList.length > 0){
    		var targetIdList = [];
    		$.each(DocConList, function(idx, map){
    			targetIdList.push({licGrpId: map.licGrpId, prjId: map.prjId, targetCd: map.targetCd, targetId: map.targetId, docId: docId});
    		});
    		fd.append("targetIdList",JSON.stringify(targetIdList));
    	}
		
    	
    	
    	
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj3000/prj3000/insertPrj3002DocConInfo.do'/>", "async": true,"contentType":false,"processData":false ,"cache":false, "loadingShow": false},fd);
    	 $.osl.showLoadingBar(true,{target: "#frPrj3002", message: "산출물 정보를 연결중입니다.</br>잠시만 기다려주세요."});
   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);
   				
   				
   				$.osl.layerPopupClose();
   				
   				
   				$("button[data-datatable-id=prj3002PrjTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		ajaxObj.setFnComplete(function(data){
   			$.osl.showLoadingBar(false,{target: "#frPrj3002"});
   		});
   		
   		
   		ajaxObj.send();
    };
    
    
	var selectDocInfo = function() {
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj3000/prj3000/selectPrj3000DocInfoAjax.do'/>", "async": false}
				,{"docId": docId}); 
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				$("#"+formId)[0].reset();
				
				
		    	$.osl.setDataFormElem(data.docInfoMap,"frPrj3002", ["upperDocId", "upperDocNm", "docId", "docNm", "docEdDtm", "ord", "useNm", "signUseNm"]);
			
		    	var docDesc = data.docInfoMap.docDesc;
				
		    	
		    	if($.osl.isNull(data.docInfoMap.upperDocId)){
		    		$("#upperDocId").val("-");
		    	}
		    	
		    	
		    	if($.osl.isNull(data.docInfoMap.upperDocNm)){
		    		$("#upperDocNm").val("-");
		    	}
		    	
				
				if($.osl.isNull(data.docInfoMap.docEdDtm)){
					$("#docEdDtm").val("-");
				}
				
				
				if(!$.osl.isNull(docDesc)){
					docDesc =  $.osl.escapeHtml(docDesc);
			    	
					$("#docDesc").html(docDesc.replace(/\n/g, '<br/>'));
				}
				
				
				if(data.docConList.length > 0){
					
					type = 'update';
					
   					
					prjDocConOriginalData = data.docConList;
	   				
	   				var datatable = $.osl.datatable.list["prj3002PrjConTable"].targetDt;
	   			
	   				$.each(data.docConList, function(idx, map){
		   				
						
						datatable.originalDataSet.push(map);
						
						
						prjConDocIdList.push(map.targetId);
	   				});
					
					
					datatable.insertData();
					
					
					datatable.reload();
					$.osl.datatable.list["prj3002PrjConTargetTable"].targetDt.reload();
   				}
				
			}
		});
		
		
		ajaxObj.send();
	};
    
    
    
    var datatableSetting = function(){
    	
    	
		$.osl.datatable.setting("prj3002PrjConTable",{
			data: {
				type:'local',
				serverSorting: false,
				serverPaging: false,
				source: [],
				pageSize: 4
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100]
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'targetTypeNm', title: '구분', textAlign: 'center', width: 80, search: true, searchType:"select", searchCd: "PRJ00022", searchField:"targetCd"},
				{field: 'targetNm', title: '대상 명', textAlign: 'left', width: 200, search: true},
			],
			actionBtn:{
				"title": "제외",
				"update": false,
				"delete": false,
				"dblClick": true,
			},
			actionTooltip:{
				"dblClick": "담당자 배정 제외"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-right",
				}
			},
			actionFn:{
				"select": function(datatableId, elem){
					
					var searchTypeTarget = $(".osl-datatable-search__dropdown[data-datatable-id="+datatableId+"] > .dropdown-item.active");
					
					
					var searchData = $("#searchData_"+datatableId);

					
					var searchFieldId = searchTypeTarget.data("field-id");
					var searchType = searchTypeTarget.data("opt-type");
					var searchCd = $(this).data("opt-mst-cd");
					
					
					$.osl.datatable.list[datatableId].targetDt.setDataSourceQuery({});
					
					
					if(searchType != "all"){
						var searchDataValue = searchData.val();
						
						
						if(searchType == "select"){
							searchDataValue = $("#searchSelect_"+datatableId).val();
						}
						
						$.osl.datatable.list[datatableId].targetDt.search(searchDataValue,searchFieldId);
					}else{
						$.osl.datatable.list[datatableId].targetDt.search();
					}
				},
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					fnAllUsrDelete(rowDatas);
				},
				
				"selConTargetDelete": function(rowData, datatableId, type, rownum, elem){
					var rowDatas = rowData;
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("prj3002.allDocConDelete",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							
							fnAllUsrDelete(rowDatas);
						}
					});
				},
				"reset": function(rowData, datatableId, type, rownum, elem){
					var datatable = $.osl.datatable.list[datatableId].targetDt;
					
					
					datatable.dataSet = [];
					datatable.originalDataSet = [];
					prjConDocIdList = [];
					
					
					if(prjDocConOriginalData.length > 0){
						$.each(prjDocConOriginalData, function(idx, map){
			   				
			   				datatable.dataSet.push(map);
							datatable.originalDataSet.push(map);
							
							
							prjConDocIdList.push(map.targetId);
		   				});
					}
					
					datatable.insertData();
					
					datatable.reload();
					$.osl.datatable.list["prj3002PrjConTargetTable"].targetDt.reload();
				}
			}
		});
		
    	
		
		$.osl.datatable.setting("prj3002PrjConTargetTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj3000/prj3000/selectPrj3002DocConTargetListAjax.do",
						params:{
							docId: docId
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
				{field: 'targetTypeNm', title: '구분', textAlign: 'left', width: 80, search: true, searchType:"select", searchCd: "PRJ00022", searchField:"targetCd"},
				{field: 'targetNm', title: '대상명', textAlign: 'left', width: 160, search: true},
				{field: 'RegUsrNm', title: '등록자 명', textAlign: 'center', width: 100, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.regUsrId, row.regUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.regUsrId);
					}
				}
			],
			searchColumns:[
				{field: 'usrId', title: '사용자 ID', searchOrd: 1}
			],
			actionBtn:{
				"title": "배정",
				"update": false,
				"delete": false,
				"dblClick": true,
				"lastPush": false,
			},
			actionTooltip:{
				"dblClick": "담당자 등록"
			},
			theme:{
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-left",
				}
			},
			rows:{
				beforeTemplate: function (row, data, index){
					
					if(prjConDocIdList.indexOf(data.targetId) > -1){
						row.addClass("osl-datatable__row-assign--none");
					}
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					
					fnAllUsrInsert(rowDatas);
				},
				
				"selTargetInsert": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("prj3002.allDocConInsert",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							
							fnAllUsrInsert(rowDatas);
						}
					});
				}
			}
		});
	};
	
	
	
	
	var fnAllUsrInsert = function(selDatas){
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			
			var datatable = $.osl.datatable.list["prj3002PrjConTable"].targetDt;
			
			
			if($.osl.isNull(datatable.dataSet)){
				datatable.dataSet = [];
				datatable.originalDataSet = [];
			}
			
			
			var targetIdDupleList = 0;

			
			$.each(selDatas, function(idx, map){
				
				if(prjConDocIdList.indexOf(map.targetId) != -1){
					targetIdDupleList++;
					return true;
				}
				
				datatable.dataSet.push(map);
				datatable.originalDataSet.push(map);
				
				
				prjConDocIdList.push(map.targetId);
			});
			
			
			var toastrMsg = "";
			var toastrType = "success";
			
			if(selDatas.length > targetIdDupleList){
				toastrMsg += $.osl.lang("prj3002.insert.saveMsg",(selDatas.length-targetIdDupleList));
			}
			
			if(targetIdDupleList > 0){
				
				if(toastrMsg.length > 0){
					toastrMsg += "</br>";
				}
				toastrMsg += $.osl.lang("prj3002.insert.saveDupleMsg",targetIdDupleList);
				toastrType = "warning";
			}
			
			if(targetIdDupleList == selDatas.length){
				toastrMsg = $.osl.lang("prj3002.insert.saveAllDupleMsg",targetIdDupleList);
				toastrType = "error";
			}
			
			$.osl.toastr(toastrMsg,{type: toastrType});
			
			
			datatable.insertData();
			
			datatable.reload();
			
			$.osl.datatable.list["prj3002PrjConTargetTable"].targetDt.reload();
			$("div.tooltip.show").remove();
		 }
	};
	
	
	var fnAllUsrDelete = function(selDatas){
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			
			var datatable = $.osl.datatable.list["prj3002PrjConTable"].targetDt;
			
			
			var dataSet = datatable.dataSet;
			var originalDataSet = datatable.originalDataSet;
			
			if(!$.osl.isNull(dataSet)){
				
				$.each(selDatas, function(idx, map){
					$.each(originalDataSet, function(dataIdx, dataMap){
						if($.osl.isNull(dataMap)){
							return true;
						}
						
						else if(map.targetId == dataMap.targetId){
							originalDataSet.splice(dataIdx, 1);
							
							
							prjConDocIdList.splice(prjConDocIdList.indexOf(map.targetId), 1);
							return false;
						}
					});
				});
				
				
				datatable.reload();
				
				$.osl.datatable.list["prj3002PrjConTargetTable"].targetDt.reload();
				$("div.tooltip.show").remove();
			}
		}
	};
	
	return {
        
        init: function() {
        	documentSetting();
        }
    };
}();


$.osl.ready(function(){
	OSLPrj1004Popup.init();
});

	
</script>