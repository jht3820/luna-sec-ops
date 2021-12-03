<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6800" autocomplete="off">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}"/>
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-10 osl-min-h-px--730">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label kt-portlet__head--lg">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="cmm6800.title.revision">소스 저장소 목록</span>
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6800AssignStrgTable" data-datatable-action="select" title="소스 저장소 조회" data-title-lang-cd="prj1000.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<div class="kt-portlet__head-group">
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body kt-padding-15">
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="osl-datatable-search kt-margin-b-0 kt-margin-r-10" data-datatable-id="cmm6800AssignStrgTable"></div>
						</div>
					</div>
					<div class="kt_datatable" id="cmm6800AssignStrgTable"></div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-10 osl-min-h-px--730 position-relative kt-padding-0 flex-grow-1">
				<div class="osl-div-cover osl-width--100-p osl-height--100-p" data-cover-target="revisionList">
					<span data-lang-cd="cmm6800.message.selectRevision">소스 저장소를 선택하세요.</span>
				</div>
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label kt-portlet__head--lg">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="cmm6800.title.revision">리비전 목록</span>
						</h5>
					</div>
				</div>
				
				<div class="kt-padding-10 border-bottom">
					<div class="col-lg-9 col-md-12 col-sm-12 col-12">
						<div class="osl-datatable-search kt-margin-b-0" data-datatable-id="cmm6800RepTable"></div>
					</div>
				</div>
				<div class="kt-padding-10 border-bottom osl-display__flex">
					<h6 class="kt-font-boldest kt-font-brand kt-padding-l-10 kt-margin-0 kt-margin-r-20">
						<span data-lang-cd="cmm6800.label.revisionNum">리비전 번호</span>
					</h6>
					<input type="text" class="osl-outline--secondary rounded kt-padding-10 kt-margin-r-10 osl-w-px-80 osl-h-px-35" placeholder="시작" authocomplate="off" regexstr="^[0-9]{0,4}$" maxlength="4" id="searchStNum" name="searchStNum">
					<span class="osl-h-px-38 font-weight-bolder osl-line-height--38">-</span>
					<input type="text" class="osl-outline--secondary rounded kt-padding-10 kt-margin-l-10 osl-w-px-80 osl-h-px-35" placeholder="종료"  authocomplate="off" regexstr="^[0-9]{0,4}$" maxlength="4" id="searchEdNum" name="searchEdNum">
					<div class="osl-display__flex-r">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air kt-margin-l-10" data-datatable-id="cmm6800RepTable" data-datatable-action="select" title="리비전 조회" data-title-lang-cd="cmm6800.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
					</div>
				</div>
				<div class="kt-portlet__body">
					
					<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="cmm6800RepTable"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="kt-portlet kt-margin-b-10 osl-min-h-px--575 position-relative kt-padding-0 flex-grow-1">
				<div class="osl-div-cover osl-width--100-p osl-height--100-p" data-cover-target="fileDirList">
					<span data-lang-cd="cmm6800.message.selectRevision">리비전을 선택하세요.</span>
				</div>
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span id="revisionNum"></span><span data-lang-cd="cmm6800.title.file">폴더 목록</span>
						</h5>
					</div>
				</div>
				<div class="kt-padding-10 border-bottom">
					<div class="col-lg-8 col-md-12 col-sm-12 col-12">
						<div class="osl-tree-search" data-tree-id="cmm6800RevisionFileTreeDiv"></div>
					</div>
				</div>
				<div class="kt-padding-10 border-bottom kt-align-right">
					<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-title-lang-cd="tree.label.contextmenu.allNodeOpen" data-tree-id="cmm6800RevisionFileTreeDiv" data-tree-action="allNodeOpen">
						<i class="fa fa-plus"></i>
					</a>
					<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 접기" data-title-lang-cd="tree.label.contextmenu.allNodeClose" data-tree-id="cmm6800RevisionFileTreeDiv" data-tree-action="allNodeClose">
						<i class="fa fa-minus"></i>
					</a>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="cmm6800RevisionFileTreeDiv" data-tree-action="select" title="리비전 파일 목록 조회" data-original-title="cmm6800.actionBtn.selectFileTooltip"  data-title-lang-cd="cmm6800.actionBtn.selectFileTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
						<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
					</button>
				</div>
				<div class="kt-portlet__body">
					
					<div class="osl-tree kt-scroll kt-margin-20" data-height="480" id="cmm6800RevisionFileTreeDiv"></div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="kt-portlet kt-margin-b-10 osl-min-h-px--575 position-relative kt-padding-0 flex-grow-1">
				<div class="osl-div-cover osl-width--100-p osl-height--100-p" data-cover-target="fileList">
					<span data-lang-cd="cmm6800.message.selectRevision">리비전을 선택하세요.</span>
				</div>
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="cmm6800.title.file">파일 목록</span>
						</h5>
					</div>
				</div>
				<div class="kt-padding-10 border-bottom">
					<div class="col-lg-9 col-md-12 col-sm-12 col-12">
						<div class="osl-datatable-search kt-margin-b-0" data-datatable-id="cmm6800RevisionFileTable"></div>
					</div>
				</div>
				<div class="kt-padding-10 border-bottom kt-align-right">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6800RevisionFileTable" data-datatable-action="select" title="파일 조회" data-title-lang-cd="cmm6800.actionBtn.selectFileTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
						<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6800RevisionFileTable" data-datatable-action="detail" title="소스보기" data-title-lang-cd="cmm6800.actionBtn.detailTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="detail" tabindex="2">
						<i class="fas fa-external-link-alt"></i><span data-lang-cd="cmm6800.actionBtn.detailBtn">상세</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6800RevisionFileTable" data-datatable-action="diff" title="DIFF" data-title-lang-cd="cmm6800.actionBtn.diffTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="diff" tabindex="3">
						<i class="fas fa-code"></i><span data-lang-cd="cmm6800.actionBtn.diffBtn">DIFF</span>
					</button>
				</div>
				<div class="kt-portlet__body">
					
					<div class="kt_datatable osl-datatable-footer__divide" id="cmm6800RevisionFileTable"></div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<input type="hidden" name="cmm6800ModalCallbackBtn" id="cmm6800ModalCallbackBtn"/>
	<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air kt-margin-l-10" data-datatable-id="cmm6800RepTable" data-datatable-action="choose" title="리비전 선택 완료" data-title-lang-cd="cmm6800.actionBtn.chooseTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="choose" tabindex="2">
		<i class="fa flaticon2-check-mark"></i><span data-lang-cd="cmm6800.actionBtn.chooseBtn">선택 완료</span>
	</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>


<script>
"use strict";
var OSLCmm6800Popup = function() {
	var formId = 'frCmm6800';
	
	var paramPrjId = $("#"+formId+" #paramPrjId").val();
	
	var strgRepId;
	
	var strgTypeCd;
	
	var linkUrl;
	
	var linkId;
	
	var linkPw;
	
	var linkRepo;
	
	var revision;
	
	var searchStNum;
	var searchEdNum;
	
	var treeObj;
	
	
	var cmm6800AssignStrgTable;
	
	
	var cmm6800RepTable;
	
	
	var cmm6800RevisionFileTable;
	
	
	var okRevision = false;
	var okFileCode = false;
	
	
	var revisions = [];
	
	var documentSetting = function() {
		
		
		$("#searchStNum").attr("placeholder",$.osl.lang("cmm6800.placeholder.revision.start"));
		$("#searchEdNum").attr("placeholder",$.osl.lang("cmm6800.placeholder.revision.end"));
		
		
		assignStrgTableSetting();
		
		
		KTUtil.scrollInit($("#cmm6800RevisionFileTreeDiv")[0], {
	        disableForMobile: true, 
	        resetHeightOnDestroy: true, 
	        handleWindowResize: true, 
	        height: 300
	    });
		
	}
	
	
	var coverSwitch = function(target, hide){
		var targetStr = "";
		
		
		if(target === "all"){
			targetStr = "#"+formId+" .osl-div-cover"
		}else{
			targetStr = "#"+formId+" .osl-div-cover[data-cover-target="+target+"]";
		}
		
		
		if(hide){
			$(targetStr).addClass("kt-hide");
		}else{
			$(targetStr).removeClass("kt-hide");
		}
	};
	
	
	var assignStrgTableSetting = function(){
		
		cmm6800AssignStrgTable = $.osl.datatable.setting("cmm6800AssignStrgTable",{
			data:{
				source:{
					read:{
						url: "/stm/stm8000/stm8100/selectStm8100AssStrgListAjax.do",
						params:{
							prjId: paramPrjId
						}
					}
				},
				pageSize: 5
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [5, 10, 20, 30, 50, 100]
					}
				}
			},
			rows:{
				minHeight: 40
			},
			columns:[
				{field: 'strgTypeNm', title: '유형', textAlign: 'left', width: 40, search: true, searchType:"select", searchCd: "STM00004", searchField:"strgTypeCd", sortField: "strgTypeCd"},
				{field: 'strgRepTitle', title: '저장소명', textAlign: 'left', width: 200, search: true},
				{field: 'strgRepUrl', title: '저장소 URL', textAlign: 'left', width: 260},
				{field: 'strgTxt', title: '저장소 설명', textAlign: 'left', width: 240, search: true},
			],
			actionBtn:{
				"title": "리비전 목록 조회",
				"update" : false,
				"delete" : false,
				"click": true,
				"autoHide": true
			},
			actionFn:{
				"click": function(rowData, datatableId, type, rowNum, elem){
					
					strgRepId = rowData.strgRepId;
					
					
					strgConnectionCheck(strgRepId, function(result){
						
						if(!result){
							
							coverSwitch("all", false);
							return true;
						}
						
						coverSwitch("revisionList", true);
						
						
						authCheck(strgRepId);
						
						
						if(!okRevision){
							$.osl.alert($.osl.lang("cmm6800.message.auth"));
							
							$.osl.layerPopupClose();
						}
						
						
						strgTypeCd = rowData.strgTypeCd;
		   		  		linkUrl = rowData.strgRepUrl;
		   		  		linkId = rowData.strgUsrId;
		   		  		
		   		  		if(strgTypeCd == "01"){
		   		  			
		   		  			linkPw = rowData.strgUsrPw;
		   		  		}else{
		   		  			
			   		  		linkPw = rowData.strgKey;
			   		  		linkRepo = rowData.strgRepNm;
		   		  		}
		   		  	
		   		  		
		   		  		revisionTableSetting();
					});
				}
			},callback:{
				ajaxDone: function(evt, list){
					strgRepId = null;
				}
			}
		});
	};
	
	
	var revisionTableSetting = function(){
		var params;
		if(strgTypeCd == "01"){
			params = {
					type : strgTypeCd,
					linkUrl : linkUrl,
					linkId : linkId,
					linkPw : linkPw,
			};
		}else{
			params = {
					type : strgTypeCd,
					linkUrl : linkUrl,
					linkId : linkId,
					linkPw : linkPw,
					linkRepo : linkRepo,
			};
		}

		
		cmm6800RepTable = $.osl.datatable.setting("cmm6800RepTable",{
				data: {
					source: {
						read: {
							url: "/stm/stm8000/stm8000/selectStm8000RevisionListAjax.do",
							params : params
						}
					},
					pageSize: 7,
				},
				toolbar:{
					items:{
						pagination:{
							pageSizeSelect : [7, 10, 20, 30, 50, 100],
							pages:{
								desktop: {
									layout: 'default',
									pagesNumber: 3
								},
								tablet:{
									layout: 'default',
									pagesNumber: 1
								},
								mobile:{
									layout: 'default',
									pagesNumber: 1
								}
							}
						}
					}
				},
				columns: [
					{field: 'checkbox', title: '#', textAlign: 'center', width: 15, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
					{field: 'revision', title: '리비전', textAlign: 'center', width: 80, autoHide: false, sortable: false},
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
					minHeight: 50
				},
				actionBtn:{
					"title": $.osl.lang("cmm6800.title.actionTitle.repository"),
					"width": 30,
					"insert" : false,
					"update" : false,
					"delete" : false,
					"click" : true,
					"choose" : true,
				},
				actionTooltip:{
					"click" : $.osl.lang("cmm6800.repository.actionTooltip.chooseTooltip"),
					"choose" : $.osl.lang("cmm6800.repository.actionTooltip.chooseTooltip"),
				},
				actionFn:{
					"select": function(datatableId, elem, datatable){
						
						var searchTypeTarget = $(".osl-datatable-search__dropdown[data-datatable-id="+datatableId+"] > .dropdown-item.active");
						
						
						var searchData = $("#searchData_"+datatableId);

						
						var searchFieldId = searchTypeTarget.data("field-id");
						var searchType = searchTypeTarget.data("opt-type");
						var searchCd = $(this).data("opt-mst-cd");
						
						
						datatable.setDataSourceQuery({});
						
						
						searchStNum = $("#searchStNum").val();
						searchEdNum = $("#searchEdNum").val();
						
						datatable.setDataSourceParam("searchStNum", searchStNum);
						datatable.setDataSourceParam("searchEdNum", searchEdNum);						

						
						if(searchType != "all"){
							var searchDataValue = searchData.val();
							
							
							if(searchType == "select"){
								searchDataValue = $("#searchSelect_"+datatableId).val();
							}
							datatable.search(searchDataValue,searchFieldId);
							
						}else{
							datatable.search();

							
							revision = "";
							$("#revisionNum").text("");
							
							
							treeLoad();
							
							revisionFileTableSetting();
						}
						
						
						coverSwitch("fileDirList", false);
						coverSwitch("fileList", false);
						
						
 						datatable.reload();
					},
					"click": function(rowData, datatableId, type, rowNum, elem){
						revision = rowData.revision;
						$("#revisionNum").text("["+revision+"] ");
						
						
						coverSwitch("fileDirList", true);
						coverSwitch("fileList", true);
						
						
	    				treeLoad();
						
						revisionFileTableSetting();
					},
					"choose": function(rowDatas, datatableId, type, rowNum){
						if(type == "list"){
							revisions = rowDatas;
						}else{
							revisions.push(rowDatas);
						}
						$("#cmm6800ModalCallbackBtn").click();
					}
				},
				theme:{
					 actionBtn:{
						 "click": " kt-hide",
						 "choose": " rootChoose"
					 },
					 actionBtnIcon:{
	    				"click": "fa flaticon2-check-mark",
	    				"choose": "fa flaticon2-check-mark",
	    			}
				},
				callback:{
					initComplete: function(evt, config){
						
						dirTreeSetting();
					},
					ajaxDone: function(evt, list){
						$("#searchStNum").val(cmm6800RepTable.targetDt.lastResponse.meta.searchStNum); 
						$("#searchEdNum").val(cmm6800RepTable.targetDt.lastResponse.meta.searchEdNum);
						
						searchStNum = $("#searchStNum").val();
						searchEdNum = $("#searchEdNum").val();
					}
				}
			}
		);
	};
	
	
	var revisionFileTableSetting = function(pathKey){
		if(!$.osl.isNull(cmm6800RevisionFileTable)){
			cmm6800RevisionFileTable.targetDt.setDataSourceParam("strgRepId", strgRepId);
			cmm6800RevisionFileTable.targetDt.setDataSourceParam("revision", revision);
			cmm6800RevisionFileTable.targetDt.setDataSourceParam("filePath", pathKey);
			cmm6800RevisionFileTable.targetDt.reload();
		}else{
			
			cmm6800RevisionFileTable = $.osl.datatable.setting("cmm6800RevisionFileTable",{
				data: {
					source: {
						read: {
							url: "/stm/stm8000/stm8000/selectStm8000FileListAjax.do",
							params : {
								selectFileDirType : "file",
								revision : revision,
								strgRepId : strgRepId,
								filePath: pathKey
							}
						}
					},
					pageSize: 7
				},
				toolbar:{
					items:{
						pagination:{
							pageSizeSelect : [7, 10, 20, 30, 50, 100],
							pages:{
								desktop: {
									layout: 'default',
									pagesNumber: 3
								},
								tablet:{
									layout: 'default',
									pagesNumber: 1
								},
								mobile:{
									layout: 'default',
									pagesNumber: 1
								}
							}
						}
					}
				},
				columns: [
					{field: 'checkbox', title: '#', textAlign: 'center', width: 15, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
					{field: 'type', title: '유형', textAlign: 'center', width: 80, autoHide: false, sortable: false},
					{field: 'name', title: '파일명', textAlign: 'left', width: 150, autoHide: false, search: true},
				],
				actionBtn:{
					"title": $.osl.lang("cmm6800.revisionFile.actionTitle"),
					"insert" : false,
					"update" : false,
					"delete" : false,
					"dblClick" : true,
					"detail": true,
					"click": true,
					"diff" : true,
				},
				actionTooltip:{
					"dblClick" : $.osl.lang("cmm6800.revisionFile.actionTooltip.dblClickTooltip"),
					"diff" : $.osl.lang("cmm6800.revisionFile.actionTooltip.diffTooltip")
				},
				actionFn:{
					"click":function(rowData, datatableId, type, rowNum, elem){
						var datatable = $.osl.datatable.list[datatableId].targetDt;
						
						
						var targetCheckRow = datatable.row("[data-row="+rowNum+"]").nodes();
						var target = targetCheckRow.find("label.kt-checkbox").children("input[type=checkbox]");
						if(target.length > 0){
							if(target.is(":checked") == true){
								
								datatable.setActiveAll(false);
								
								target.prop("checked", true);
								datatable.setActive(target);
							}else{
								
								targetCheckRow.removeClass("osl-datatable__row--selected");
								targetCheckRow.addClass("kt-datatable__row--even");
							}
						}
					},
					"detail": function(rowDatas, datatableId, type, rowNum){
						var rowData;
						if(type == "list"){
							if(rowNum != 1){
								$.osl.alert($.osl.lang("cmm6800.revisionFile.message.selectOne", rowNum));
								return false;
							}else{
								rowData = rowDatas[0];
							}
						}else{
							rowData = rowDatas;
						}
						
						var data = {
								type : strgTypeCd,
								path: rowData.path,
								revision : revision,
								strgRepId : strgRepId
							};
						var options = {
							idKey:"fileCode_"+revision,
							modalTitle: "[Revision "+revision+"] "+ rowData.name,
							autoHeight: false,
							ftScrollUse: false
						};
						
						if(okFileCode){
							$.osl.layerPopupOpen('/cmm/cmm6000/cmm6800/selectCmm6801View.do',data,options);
						}else{
							$.osl.alert($.osl.lang("cmm6800.message.auth"));
							return false;
						}
					},
					"dblClick": function(rowData){
						var data = {
							type : strgTypeCd,
							path: rowData.path,
							revision : revision,
							strgRepId : strgRepId
						};
						var options = {
							idKey:"fileCode_"+revision,
							modalTitle: "[Revision "+revision+"] "+ rowData.name,
							autoHeight: false,
							ftScrollUse: false
						};
						
						if(okFileCode){
							$.osl.layerPopupOpen('/cmm/cmm6000/cmm6800/selectCmm6801View.do',data,options);
						}else{
							$.osl.alert($.osl.lang("cmm6800.message.auth"));
							return false;
						}
					},
					"diff":function(rowDatas, datatableId, type, rowNum){
						var rowData;
						
						
						if(type == "list"){
							if(rowNum != 1){
								$.osl.alert($.osl.lang("cmm6800.revisionFile.message.selectOne", rowNum), {"type":"warning"});
								return false;
							}else{
								rowData = rowDatas[0];
							}
						}else{
							
							rowData = rowDatas;
						}
						
						var data = {
							type : strgTypeCd,
							path: rowData.path,
							revision : revision,
							strgRepId : strgRepId,
							searchStNum : $("#searchStNum").val(),
							searchEdNum : $("#searchEdNum").val(),
							name : rowData.name,
						};
						var options = {
							idKey:"cmm6800_diff",
							modalTitle: "[Revision. "+revision+"] "+rowData.name,
							autoHeight: false,
						};

						if(okFileCode){
							$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8003View.do',data,options);
						}else{
							$.osl.alert($.osl.lang("cmm6800.message.auth"));
							return false;
						}
					}
				},
				theme:{
					 actionBtn:{
						 "click": " kt-hide",
						 "detail" : " kt-hide",
						 "dblClick": "",
						 "diff" : "",
					 },
					 actionBtnIcon:{
						"click": "fa flaticon2-check-mark",
	    				"detail": "fas fa-external-link-alt",
	    				"dblClick": "fas fa-external-link-alt",
	    				"diff": "fas fa-code",
	    			}
				}
			});
		}
	};
	 
	var dirTreeSetting = function(){
		treeObj = $.osl.tree.setting("cmm6800RevisionFileTreeDiv",{
			data:{
				url:"<c:url value='/stm/stm8000/stm8000/selectStm8000DirListAjax.do'/>",
				key: "currentKey",
				
				pKey: "parentKey",
				
				labelKey: "name",
				param:{
					selectFileDirType : "dir",
					revision : revision,
					strgRepId : strgRepId
				}
			},
			search:{
				
				case_insensitive : true,
				
				show_only_matches: true,
				
				show_only_matches_children: true,
			},
			callback:{
				onclick: function(treeObj, selNode){
					
					revisionFileTableSetting(selNode.original.key);
				}
			}
		});
	};
	
	
	var treeLoad = function(){
		
		treeObj.jstree().settings.data.param = {
			selectFileDirType : "dir",
			revision : revision,
			strgRepId : strgRepId,
			searchStNum : searchStNum,
			searchEdNum : searchEdNum,
		};
		
		
		treeObj.jstree().refresh();
		$("button[data-tree-id=cmm6800RevisionFileTreeDiv][data-tree-action=select]").click();
		
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
	
	
	var strgConnectionCheck = function(strgRepId, callbackFn){
		var data = {
				strgRepId : strgRepId
		};
		
		
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000RepoConnectCheckAjax.do'/>", "async": false}
   				, data);
		
   		
   		ajaxObj.setFnSuccess(function(data){
   			var rtnValue = true;
   			if(data.connectResult != "SVN_OK" || data.errorYn == "Y"){
				$.osl.alert("연결할 수 없는 저장소입니다.");
				rtnValue = false;
			}
   			
   			
   			callbackFn(rtnValue);
   			
   		});
  	 	
   		ajaxObj.send();
	};
	
	return {
		init: function(){
			documentSetting();
		},
		getRevisionList : function(){
			return JSON.stringify(revisions);
		}
	};
 }();
 
 
 $.osl.ready(function(){
	 OSLCmm6800Popup.init();
 });
</script>
