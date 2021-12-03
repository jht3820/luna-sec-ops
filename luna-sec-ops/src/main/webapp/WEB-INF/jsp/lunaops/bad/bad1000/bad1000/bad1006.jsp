<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http:
<div class="kt-portlet kt-portlet--mobile  kt-margin-b-15">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h3 class="kt-portlet__head-title kt-font-boldest kt-font-brand">
				<c:if test="${not empty param.stmTypeCd}">
					<c:if test="${param.stmTypeCd eq '03' }">
						<i class="la la-image kt-margin-r-5"></i><span data-lang-cd="stm2100.type.gallery">[갤러리]</span>
					</c:if>
					<c:if test="${param.stmTypeCd eq '04' }">
						<i class="la la-youtube-play kt-margin-r-5"></i><span data-lang-cd="stm2100.type.movie">[영상]</span>
					</c:if>
					<c:out value="${param.stmNm }"/>
				</c:if>
				<c:if test="${empty param.stmTypeCd}">
					<span name="badTitle" id="badTitle"></span>
			</c:if>
			</h3>
			<input type="hidden" id="stmNm" name="stmNm" value='${param.stmNm}'/>
			<input type="hidden" id="stmTypeCd" name="stmTypeCd" value='${param.stmTypeCd}'/>
			<input type="hidden" id="stmDsTypeCd" name="stmDsTypeCd" value='${param.stmDsTypeCd}'/>
			<input type="hidden" id="menuId" name="menuId" value='${param.menuId}'/>
			<input type="hidden" id="stmRootYn" name="stmRootYn" value='${param.stmRootYn}'/>
			
			<input type="hidden" id="stmOptionCnt" name="stmOptionCnt"/>
			<input type="hidden" id="stmNtcYnCd" name="stmNtcYnCd"/>
			<input type="hidden" id="stmPwYnCd" name="stmPwYnCd"/>
			<input type="hidden" id="stmTagYnCd" name="stmTagYnCd"/>
			<input type="hidden" id="stmCmtYnCd" name="stmCmtYnCd"/>
			<input type="hidden" id="stmFileCnt" name="stmFileCnt"/>
			<input type="hidden" id="stmFileStrg" name="stmFileStrg"/>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1006BadTable" data-datatable-action="select" title="게시글 조회" data-title-lang-cd="bad1006.actionTooltip.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1006BadTable" data-datatable-action="insert" title="게시글 추가" data-title-lang-cd="bad1006.actionTooltip.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
					<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1006BadTable" data-datatable-action="update" title="게시글 수정" data-title-lang-cd="bad1006.actionTooltip.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1006BadTable" data-datatable-action="delete" title="게시글 삭제" data-title-lang-cd="bad1006.actionTooltip.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
					<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1006BadTable" data-datatable-action="dblClick" title="게시글 상세" data-title-lang-cd="bad1006.actionTooltip.dblClickTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="dblClick" tabindex="5">
					<i class="fa fa-external-link-alt"></i><span data-lang-cd="bad1006.actionBtn.dblClickBtn">상세</span>
				</button>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air btn-view-type active" title="카드형" data-title-lang-cd="bad1006.button.card" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="6" data-view-type="01">
						<i class="fa fa-table osl-padding-r0"></i>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="그리드형" data-title-lang-cd="bad1006.button.grid" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="7" data-view-type="02">
						<i class="fa fa-list osl-padding-r0"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
		<div class="row">
			<div class="col-lg-5 col-md-6 col-sm-6">
				<div class="osl-datatable-search kt-margin-b-0" data-datatable-id="bad1006BadTable"></div>
			</div>
		</div>
	</div>
</div>
<div class="kt-margin-b-15" id="bad1006BadCard"></div>
<div class="kt_datatable osl-datatable-footer__divide  kt-margin-b-0" id="bad1006BadTable"></div>

<script>
 "use strict";
 var OSLBad1006Popup = function() {
	 var datatableId = "bad1006BadTable";
	 
	 
	 var okManager;
	 var okWriter;
	 
	 
	 var id = $.osl.user.userInfo.usrId;
	 
	 
	 var currentViewType = "01";
	
	 
	 var rowDatas = [];
	
	 var targetId;
	 var targetType;
	 var targetData;
	 var searchTargetData;
	 
	 
	 var type;
	 
	 var documentSetting = function() {
		 type = $("#stmTypeCd").val();
		
		var searchAdd;
		
		getStmInfo();
		
		
		if($.osl.isNull($("#stmRootYn").val())){
			
			searchAdd = [
					{field: 'badContent', title:$.osl.lang("bad1006.field.badContent"), searchOrd: 2},
					{field: 'cmtContent', title:$.osl.lang("bad1006.field.cmtContent"), searchOrd: 4},
					{field: 'tagNm', title:$.osl.lang("bad1006.field.tagNm"), searchOrd: 5, 
						searchKeyCode: "-1", 
						searchKeyEvt : function(e, datatableInfo, searchDataTarget){
							
                            e.preventDefault(); 
							if(e.keyCode == 13 || e.keyCode == 32){
								
								$("button[data-datatable-id="+dataTableId+"][data-datatable-action=select]").click();
							}else{
								var txt = $("#searchData_"+dataTableId).val() + e.key;
								txt = txt.replace(/#/g,"");
								$("#searchData_"+dataTableId).val(txt);
							}
						},		
					}
				]
		}else{
			
			
			searchAdd = [
				{field: 'badContent', title:$.osl.lang("bad1006.field.badContent"), searchOrd: 2},
				{field: 'badNtcCheck', title:$.osl.lang("bad1006.field.badNtcCheck"), searchOrd: 4, searchType:"select", searchCd: "CMM00001"},
				{field: 'delCd', title:$.osl.lang("bad1006.field.delCd"), searchOrd: 5, searchType:"select", searchCd: "CMM00001"},
				{field: 'cmtContent', title:$.osl.lang("bad1006.field.cmtContent"), searchOrd: 6},
				{field: 'tagNm', title:$.osl.lang("bad1006.field.tagNm"), searchOrd: 7,
					searchKeyCode: "-1", 
					searchKeyEvt : function(e, datatableInfo, searchDataTarget){
						
                           e.preventDefault(); 
						if(e.keyCode == 13 || e.keyCode == 32){
							
							$("button[data-datatable-id="+dataTableId+"][data-datatable-action=select]").click();
						}else{
							var txt = $("#searchData_"+dataTableId).val() + e.key;
							txt = txt.replace(/#/g,"");
							$("#searchData_"+dataTableId).val(txt);
						}
					},		
				},
			];
		}
		
		
		checkUser();
		
		
		$.osl.datatable.setting(datatableId, {
			cardUiTarget: $("#bad1006BadCard"),
			 data: {
				 source: {
					 read: {
						url: "/bad/bad1000/bad1000/selectBad1000ListAjax.do",
						params : {
							stmTypeCd: $("#stmTypeCd").val(),
							menuId: $("#menuId").val(),
							dsTypeCd : $("#stmDsTypeCd").val(),
							stmRootYn : $("#stmRootYn").val(), 
						}
					 }
				 },
			 },
			 columns: [
				 {field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: "kt-checkbox--solid"}, sortable: false, autoHide: false},
				 {field: 'badNum', title: 'No.', textAlign: 'center', width: 50, autoHide: false, sortable: true},
				 {field: 'badTitle', title: '제목', textAlign: 'left', width: 400, autoHide: false, search: true, sortable: true,
					template: function(row){
						var returnStr = "";
						
						if($("#stmRootYn").val() == "Y"){
							if(row.delCd == "01"){
								returnStr += "<span class='kt-badge kt-badge--dark kt-badge--inline kt-badge--pill kt-margin-5'>"+$.osl.lang("bad1006.label.deleteBadge")+"</span>";
							}
						}
						
						if(row.badNtcCheck == "01"){
							returnStr += "<span class='kt-badge kt-badge--danger kt-badge--inline kt-badge--pill kt-margin-5'>"+$.osl.lang("bad1006.label.noticeBadge")+"</span>";
						}
						
						returnStr += $.osl.escapeHtml(row.badTitle);
						
						if(row.badCmtCnt > 0 && row.stmCmtYnCd == '01'){
							returnStr += "<span class='kt-badge kt-badge--metal kt-badge--inline kt-margin-10 kt-padding-10'>"+row.badCmtCnt+"</span>";
						}
						
						if(row.badPw == "01" && row.stmPwYnCd == '01'){
							returnStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
						}
						return returnStr;
					}, 
				 },
				 {field: 'badHit', title: '조회수', textAlign: 'center', width: 100, sortable: true},
				 {field: 'badFileCnt', title: '첨부파일 수', textAlign: 'center', width: 100},
				 {field: 'badUsrId', title: '작성자', textAlign: 'left', width: 180,
					template: function (row) {
						var usrData = {
								html: row.badUsrNm + " (" + row.badUsrId + ")",
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
						};
						return $.osl.user.usrImgSet(row.badUsrImgId, usrData);
					},
					onclick: function(row){
						$.osl.user.usrInfoPopup(row.badUsrId);
					}
					, autoHide: false, search: true, sortable: true},
				{field: 'badWtdtm', title:'작성일', textAlign: 'center', width: 150, search: true, searchType:"daterange", sortable: true,
					template: function(row){
						var paramDatetime = new Date(row.badWtdtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					},	
				}
			],
			searchColumns: searchAdd,
			actionBtn:{
				"title" : $.osl.lang("bad1006.actionBtn.title"),
				"width" : 200,
				"dblClick" : true,
			},
			actionTooltip:{
				"update" : $.osl.lang("bad1006.actionTooltip.updateTooltip"),
				"delete": $.osl.lang("bad1006.actionTooltip.deleteTooltip"),
				"dblClick": $.osl.lang("bad1006.actionTooltip.detailClick"),
			},
			actionFn:{
				"insert":function(rowData){
					var data = {
							type:"insert",
							menuId : $("#menuId").val(),
							stmNtcYnCd : $("#stmNtcYnCd").val(),
							stmPwYnCd : $("#stmPwYnCd").val(),
							stmTagYnCd : $("#stmTagYnCd").val(),
							stmCmtYnCd : $("#stmCmtYnCd").val(),
							stmFileCnt : $("#stmFileCnt").val(),
							stmFileStrg : $("#stmFileStrg").val(),
							stmOptionCnt : $("#stmOptionCnt").val()
						};
					var options = {
							idKey: "bad1008_insert",
							modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]",
							closeConfirm: true,
							autoHeight: false,
							modalSize: "xl",
						};
					
					if(okManager == true || okWriter == true){
						$.osl.layerPopupOpen('/bad/bad1000/bad1000/insertBad1008View.do',data,options);
					}else{
						$.osl.alert($.osl.lang("bad1000.notAuthority.insertMessage"), {"type":"warning"});
					}
				},
				"dblClick": function(rowData, datatableId, type, rowNum){
					if(type=="list"){ 
						
						var rowCnt = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords().length;
						if(rowCnt == 0){
							$.osl.alert($.osl.lang("bad1006.alert.selectBadInfoCnt", 0));
							return false;
						}
						if(rowCnt>1){
							$.osl.alert($.osl.lang("bad1006.alert.selectBadInfoCnt", rowCnt));
							return false;
						}
						if(rowCnt == 1){
							
							
							rowData = $.osl.datatable.list[datatableId].targetDt.getSelectedRecords().data("obj");
						}
					}
					
					if($.osl.isNull(rowData.stmOptionCnt)){
						rowData.stmOptionCnt = $("#stmOptionCnt").val();
						rowData.stmNtcYnCd = $("#stmNtcYnCd").val();
						rowData.stmCmtYnCd = $("#stmCmtYnCd").val();
						rowData.stmPwYnCd = $("#stmPwYnCd").val();
						rowData.stmTagYnCd = $("#stmTagYnCd").val();
						rowData.stmFileCnt = $("#stmFileCnt").val();
						rowData.stmFileStrg = $("#stmFileStrg").val();
					}
					var data = {
							stmTypeCd : $("#stmTypeCd").val(),
							stmNm : $.osl.escapeHtml($("#stmNm").val()),
							paramRow : JSON.stringify(rowData),
							backPageYn: "N",
							stmDsTypeCd: $("#stmDsTypeCd").val(),
							stmRootYn: $("#stmRootYn").val(),
						};
					var options = {
							idKey: "bad1007_"+ rowData.badId,
							modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+rowData.badNum,
							closeConfirm: false,
							autoHeight: false,
							modalSize: "lg",
						};
					var pwOptions = {
							idKey: "bad1004_"+rowData.badId,
							modalTitle: $.osl.lang("bad1006.title.passwordCheck"),
							closeConfirm: false,
							autoHeight: false,
							modalSize: "sm",
						};
					
					if(okManager == true || okWriter == true || rowData.badUsrId== $.osl.user.userInfo.usrId){
						if(okManager == true || rowData.badUsrId== $.osl.user.userInfo.usrId){
							
							
							$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1007View.do',data,options);
						}else{
							if(rowData.badPw == "01" && rowData.stmPwYnCd == '01'){
								$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1004PwView.do', data, pwOptions);
							}
							else{
			 					$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1007View.do',data,options);
							}
						}
					}else{
						$.osl.alert($.osl.lang("bad1006.notAuthority.selectMessage"), {"type":"warning"});
					}
				},
				"update":function(rowData, datatableId, type, rowNum){
					if($.osl.isNull(rowData.stmOptionCnt)){
						rowData.stmOptionCnt = $("#stmOptionCnt").val();
						rowData.stmNtcYnCd = $("#stmNtcYnCd").val();
						rowData.stmCmtYnCd = $("#stmCmtYnCd").val();
						rowData.stmPwYnCd = $("#stmPwYnCd").val();
						rowData.stmTagYnCd = $("#stmTagYnCd").val();
						rowData.stmFileCnt = $("#stmFileCnt").val();
						rowData.stmFileStrg = $("#stmFileStrg").val();
					}
					var data = {
							stmDsTypeCd: $("#stmDsTypeCd").val(),
							stmNm: $.osl.escapeHtml($("#stmNm").val()),
							stmRootYn: $("#stmRootYn").val(),
							paramRow : JSON.stringify(rowData),
						};
					var options = {
							idKey: "bad1009_"+rowData.badId,
							modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+rowData.badNum,
							closeConfirm: true,
							autoHeight: false,
							modalSize: "xl",
						};
					
					if(okManager == true || rowData.badUsrId == $.osl.user.userInfo.usrId){
	 					$.osl.layerPopupOpen('/bad/bad1000/bad1000/updateBad1009View.do',data,options);
					}else{
						$.osl.alert($.osl.lang("bad1006.notAuthority.updateMessage"), {"type":"warning"});
					}
				},
				"delete":function(rowDatas){
					var data = {
							menuId : $("#menuId").val(),
							stmTypeCd : $("#stmTypeCd").val(),
							deleteDataList : JSON.stringify(rowDatas),
							menuRootYn: "Y",
							cmtRootYn: "N",
					};
					var titleStr;
					if(rowDatas.length >= 1){
						if(rowDatas.length>1){
							var num = rowDatas[0].badNum;
							var ect = rowDatas.length-1;
							titleStr = $.osl.lang("bad1006.title.boardCheck.twoStep", num, ect);
						}else{
							titleStr = $.osl.lang("bad1006.title.boardCheck.oneStep", num);
						}
						titleStr +=  " " +$.osl.lang("bad1006.title.deleteReason");
					}
					var options = {
							idKey: "bad1005_"+rowDatas.badId,
							modalTitle: titleStr,
							closeConfirm: false,
							autoHeight: false,
							modalSize: "xl",
						};
					
					var selfCheck = "Y";
					$.each(rowDatas, function(idx, value){
						if(value.badUsrId != $.osl.user.userInfo.usrId){
							selfCheck = "N";
						}
					});
					
					if(okManager == true || (okWriter == true && selfCheck == "Y")){
						
						$.osl.layerPopupOpen('/bad/bad1000/bad1000/deleteBad1000View.do', data, options);
					}else{
						if(okWriter == true && selfCheck == "N"){
							$.osl.alert($.osl.lang("bad1006.notWriter.deleteMessage"), {"type":"warning"});
						}else{
							$.osl.alert($.osl.lang("bad1006.notAuthority.deleteMessage"), {"type":"warning"});
						}
					}
				}
			},
			theme: {
				actionBtn:{
					
					click: " kt-hide"
				}
			},
			callback:{
				 initComplete : function(evt, config){
					 viewTypeChange();
				 },
				 ajaxDone: function(evt, list){
					 
					
					$("#bad1006BadCard").empty();
					var resultStr = "";
					
					
					if(type == "03"){
						var tagList = $.osl.datatable.list[datatableId].targetDt.lastResponse.meta.tagList;
						var tagBadIdList = [];
						
						if(!$.osl.isNull(tagList)){
							$.each(tagList, function(idx, value){
								if(tagBadIdList.indexOf(value.badId)<0){
									tagBadIdList.push(value.badId);								 
								}
							});
						}
						resultStr = "<div class='row'>";
						$.each(list, function(idx, value){
							resultStr += "<div class='col-lg-4 col-md-6 col-sm-12 col-12'>" 
										+ "<div class='kt-portlet kt-portlet--mobile osl-gallery__card'>"
							 				+ "<div class='kt-portlet__head kt-portlet__head--sm kt-padding-10'>"
								 				+ "<div class='kt-portlet__head-label kt-font-boldest osl-word__break osl-line-height--38'>"
								 					+ "<label class='kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-0' data-bad-id='"+value.badId+"' data-bad-num='"+value.badNum+"' data-atch-file-id='"+value.atchFileId+"' data-bad-pw='"+$.osl.escapeHtml(value.badPw)+"' data-bad-usr-id='"+value.badUsrId+"'>"
									 					+ "<input type='checkbox' value='"+idx+"' class='checkBoxInput' name='badGrpCheckbox' id='badGrpCheckbox_"+value.badId+"' data-datatable-id='"+datatableId+"'>&nbsp;"
									 					+ "<span></span>"
									 				+ "</label>"
													+ "<span class='osl-word__break'>"+$.osl.escapeHtml(value.badTitle)+"</span>"
							 					+ "</div>" 
							 				+ "</div>" 
							 				+ "<div class='kt-portlet__body'>"
							 					+ "<div class='row osl-display--inline-flex kt-margin-b-10'>";
							 					var usrData = {
														html: value.badUsrNm + " (" + value.badUsrId + ")",
														imgSize: "sm",
														class:{
															cardBtn: "osl-width__fit-content"
														}
												};
				 						resultStr += "<div class='open-user kt-padding-l-10' data-open-id='"+value.badUsrId+"'>"+$.osl.user.usrImgSet(value.badUsrImgId, usrData)+"</div>"
				 									 + "<div class='osl-margin-left--auto osl-line-height--30'>";
				 						
				 						if($("#stmRootYn").val() == "Y"){
											if(value.delCd == "01"){
												resultStr += "<span class='kt-badge kt-badge--dark kt-badge--inline kt-badge--pill kt-margin-r-5'>"+$.osl.lang("bad1006.label.deleteBadge")+"</span>";
											}
										}
				 						
				 						if(value.badNtcCheck == "01"){
											resultStr += "<span class='kt-badge  kt-badge--danger kt-badge--inline kt-badge--pill kt-margin-r-5'>"+$.osl.lang("bad1006.label.noticeBadge")+"</span>";
										}
				 						
				 						if(value.badCmtCnt > 0  && value.stmCmtYnCd == '01'){
											resultStr += "<span class='kt-badge kt-badge--metal kt-badge--inline kt-margin-r-10 kt-padding-r-10'>"+value.badCmtCnt+"</span>";
										}
	 									resultStr += "</div>"
	 											+ "</div>"
								 				+ "<div class='kt-margin-b-10 osl-margin-auto osl-gallery__img'>"
								 					+ "<img class='kt-hide' src = '/cmm/fms/getImage.do?fileSn="+value.fileSn+"&atchFileId="+value.atchFileId+"'/>"
							 					+ "</div>"
												+ "<div class='row kt-margin-b-10 osl-display--inline-flex'>";
										var paramDatetime = new Date(value.badWtdtm);
						                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
						                resultStr += "<div class='kt-padding-l-15'>"+agoTimeStr.agoString+"</div>"
													+ "<div class='kt-padding-r-15 osl-margin-left--auto'>"+$.osl.lang("bad1006.label.hit")+" : "+value.badHit+"</div>"
												+ "</div>"
												+ "<div class='osl-h-px-34 osl-tag__list-div'>"; 
							
							if(!$.osl.isNull(tagBadIdList) && tagBadIdList.indexOf(value.badId) >= 0){
								resultStr += "<div class='btn btn-clean btn-icon kt-padding-0 border-0 osl-w-px-34 osl-h-px-34 tag-polding'>" 
												+ "<i class='fas fa-caret-right'></i>"
											+ "</div>";
								$.each(tagList, function(index, item){
									if(value.badId == item.badId){
										if(item.tagNm != null && item.tagNm != ""){
											
						                	resultStr += "<tag title='"+$.osl.escapeHtml(item.tagNm)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-padding-5 osl-display--inline-flex osl-margin-3' role='tag' value='"+$.osl.escapeHtml(item.tagNm)+"'>"
						                						+ "<div class='tagify__tag-text kt-margin-l-5 kt-margin-r-5'>"+$.osl.escapeHtml(item.tagNm)+"</div>"
				                						+ "</tag>";
										}
									}
								});
							}
								resultStr += "</div>" 
											+ "<div class='row osl-display--inline-flex osl-margin-left--auto'>";
							
	 						if(value.badPw == "01" && value.stmPwYnCd == '01'){
								resultStr += "<i class='la la-unlock kt-icon-xl kt-margin-r-5 osl-line-height--38'></i>";
							}
								resultStr += "<span class='btn btn-clean btn-icon info-btn' data-bad-id='"+value.badId+"' data-bad-num='"+value.badNum+"' data-atch-file-id='"+value.atchFileId+"' data-bad-pw='"+value.badPw+"' data-bad-usr-id='"+value.badUsrId+"' data-del-cd='"+value.delCd+"' title='게시글 상세' data-title-lang-cd='bad1006.actionTooltip.dblClickTooltip' data-toggle='kt-tooltip' data-skin='brand' data-placement='top'>"
												+ "<i class='la la-external-link'></i>"
											+ "</span>"
										+ "</div>"
									+ "</div>" 
								+ "</div>" 
							+ "</div>"; 
						});
						resultStr += "</div>";
						$("#bad1006BadCard").append(resultStr);
						
						
						KTApp.initTooltips();
						
						
						$('.osl-gallery__img>img').on('load',function(){
				    		$.each($(".osl-gallery__img>img"), function(idx, map){
					    		var w = map.naturalWidth;
					    		var h = map.naturalHeight;
					    		if(w<h){
					    			$(map).attr("class","h-100 osl-gallery__img-limite");
					    		}else{
					    			$(map).attr("class","osl-gallery__img-limite");
					    		}
					    		
					    		var parentsH = $(map).parent(".osl-gallery__img").height();
					    		$(map).attr("style", "margin-top:"+((parentsH-$(map).height())/2)+"px;");
					    		
					    		
					    		$(map).removeClass("kt-hide");
				    		});
				    	});
						 
						 
						 $(".tag-polding").click(function(){
							var topTagDiv = $(this).parents(".osl-tag__list-div");
							var icon = $(this).children("i");
							 
							if(topTagDiv.hasClass("osl-h-px-34")){
								topTagDiv.removeClass("osl-h-px-34");
								icon.removeClass("fa-caret-right");
								icon.addClass("fa-caret-down");
							}else{
								topTagDiv.addClass("osl-h-px-34");
								icon.removeClass("fa-caret-down");
								icon.addClass("fa-caret-right");
							}
						 });
						 
						
						$("tag").click(function(){
							
							$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item.active").attr("class", "dropdown-item");
							$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=tagNm]").attr("class", "dropdown-item active");
							
							$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").parent().children(".btn.btn-secondary.dropdown-toggle").text($.osl.lang("bad1006.field.tagNm"));
							
							
							$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("style", "display:none;");
							$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("aria-hidden", "true");
							
							$("#searchData_"+datatableId).removeAttr("disabled");
							
							$("#searchData_"+datatableId).val($(this).attr("value"));
							
			    			$(".osl-datatable-search__button[data-datatable-id="+datatableId+"]").click();	
						});
					}else{ 
						$.each(list, function(idx, value){
							resultStr = "<div class='kt-portlet kt-portlet--mobile osl-movie__card'>"
							 				+ "<div class='kt-portlet__head kt-portlet__head--sm kt-padding-10'>"
								 				+ "<div class='kt-portlet__head-label'>"
								 					+ "<label class='kt-checkbox kt-checkbox--single kt-checkbox--solid' data-bad-id='"+value.badId+"' data-bad-num='"+value.badNum+"' data-atch-file-id='"+value.atchFileId+"' data-bad-pw='"+$.osl.escapeHtml(value.badPw)+"' data-bad-usr-id='"+value.badUsrId+"'>"
									 					+ "<input type='checkbox' value='"+idx+"' class='checkBoxInput' name='badGrpCheckbox' id='badGrpCheckbox_"+value.badId+"' data-datatable-id='"+datatableId+"'>&nbsp;"
									 					+ "<span></span>"
									 				+ "</label>";
					 				var usrData = {
											html: value.badUsrNm + " (" + value.badUsrId + ")",
											imgSize: "sm",
											class:{
												cardBtn: "osl-width__fit-content"
											}
									};
					 				resultStr += "<div class='open-user kt-padding-l-10' data-open-id='"+value.badUsrId+"'>"+$.osl.user.usrImgSet(value.badUsrImgId, usrData)+"</div>"
 												 + "<div class='osl-margin-left--auto osl-line-height--30'>";
			 						
			 						if($("#stmRootYn").val() == "Y"){
										if(value.delCd == "01"){
											resultStr += "<span class='kt-badge kt-badge--dark kt-badge--inline kt-badge--pill kt-margin-r-5'>"+$.osl.lang("bad1006.label.deleteBadge")+"</span>";
										}
									}
			 						
			 						if(value.badNtcCheck == "01"){
										resultStr += "<span class='kt-badge  kt-badge--danger kt-badge--inline kt-badge--pill kt-margin-r-5'>"+$.osl.lang("bad1006.label.noticeBadge")+"</span>";
									}
			 						
			 						if(value.badCmtCnt > 0  && value.stmCmtYnCd == '01'){
										resultStr += "<span class='kt-badge kt-badge--metal kt-badge--inline kt-margin-r-10 kt-padding-r-10'>"+value.badCmtCnt+"</span>";
									}
			 						resultStr += "</div>"
			 									+ "</div>"
		 									+ "</div>"
							 				+ "<div class='kt-portlet__body'>"
							 					+ "<div class='kt-margin-b-10 osl-margin-auto osl-movie__img'>";
							 							
	 								resultStr += "</div>"
							 					
							 					+ "<div class='row kt-margin-b-10 kt-font-boldest osl-word__break'>"
							 						+ "<span>"+$.osl.escapeHtml(value.badTitle)+"</span>"
							 					+ "</div>";
									var paramDatetime = new Date(value.badWtdtm);
					                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
				 					
						 			resultStr += "<div class='row kt-margin-b-10 osl-display--inline-flex'>"
					 								+ "<div>"+agoTimeStr.agoString+"</div>"
													+ "<div class='osl-margin-left--auto'>"+$.osl.lang("bad1006.label.hit")+" : "+value.badHit+"</div>"
							 					+ "</div>"
							 					
												+ "<div class='row osl-display--inline-flex osl-margin-left--auto'>";
									
			 						if(value.badPw == "01" && value.stmPwYnCd == '01'){
										resultStr += "<i class='la la-unlock kt-icon-xl kt-margin-r-5 osl-line-height--38'></i>";
									}
										resultStr += "<span class='btn btn-clean btn-icon info-btn' data-bad-id='"+value.badId+"' data-bad-num='"+value.badNum+"' data-atch-file-id='"+value.atchFileId+"' data-bad-pw='"+value.badPw+"' data-bad-usr-id='"+value.badUsrId+"' data-del-cd='"+value.delCd+"'>"
														+ "<i class='la la-external-link'></i>"
													+ "</span>"
							 					+ "</div>"
	 										+ "</div>" 
										+ "</div>" 
							
							$("#bad1006BadCard").append(resultStr);
						});
					}

					
					$(".open-user").click(function(){
						var usrId = $(this).data("openId");
						if($.osl.isNull(usrId)){
							$.osl.alert($.osl.lang("bad1006.alert.notUser"));
							return false;
						}else{
							$.osl.user.usrInfoPopup(usrId);
						}
					});
					 
					
					$(".info-btn").click(function(){
						var rowData = {};
						rowData.stmOptionCnt = $("#stmOptionCnt").val();
						rowData.stmNtcYnCd = $("#stmNtcYnCd").val();
						rowData.stmCmtYnCd = $("#stmCmtYnCd").val();
						rowData.stmPwYnCd = $("#stmPwYnCd").val();
						rowData.stmTagYnCd = $("#stmTagYnCd").val();
						rowData.stmFileCnt = $("#stmFileCnt").val();
						rowData.stmFileStrg = $("#stmFileStrg").val();
						rowData.menuId = $("#menuId").val();
						rowData.badId = $(this).data("badId");
						rowData.delCd = $(this).data("delCd");
						rowData.atchFileId = $(this).data("atchFileId");
						rowData.badNum = $(this).data("badNum");
						rowData.badPw = $(this).data("badPw");
						rowData.badUsrId = $(this).data("badUsrId");
						
						var data = {
								stmTypeCd : $("#stmTypeCd").val(),
								stmNm : $.osl.escapeHtml($("#stmNm").val()),
								paramRow : JSON.stringify(rowData),
								backPageYn: "N",
								stmDsTypeCd: $("#stmDsTypeCd").val(),
								stmRootYn: $("#stmRootYn").val(),
							};
						var options = {
								idKey: "bad1007_"+ rowData.badId,
								modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+rowData.badNum,
								closeConfirm: false,
								autoHeight: false,
								modalSize: "lg",
							};
						var pwOptions = {
								idKey: "bad1004_"+rowData.badId,
								modalTitle: $.osl.lang("bad1006.title.passwordCheck"),
								closeConfirm: false,
								autoHeight: false,
								modalSize: "sm",
							};
						
						if(okManager == true || okWriter == true || rowData.badUsrId== $.osl.user.userInfo.usrId){
							if(okManager == true || rowData.badUsrId== $.osl.user.userInfo.usrId){
								
								
								$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1007View.do',data,options);
							}else{
								if(rowData.badPw == "01" && rowData.stmPwYnCd == '01'){
									$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1004PwView.do', data, pwOptions);
								}
								else{
				 					$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1007View.do',data,options);
								}
							}
						}else{
							$.osl.alert($.osl.lang("bad1006.notAuthority.selectMessage"), {"type":"warning"});
						}
					});
				}
			}
		});
		
		
		$(".btn-view-type").click(function(){
			var viewType = $(this).data("view-type");
			
			
			$(".btn-view-type.active").removeClass("active");
			$(this).addClass("active");
			
			currentViewType = viewType;
			
			
			viewTypeChange();
		});
	 }

	 
	 var viewTypeChange = function(){
		
		if(currentViewType == "01"){	
			$("#bad1006BadTable .kt-datatable__table").css({visibility: "hidden", height: 0});
			$("#bad1006BadCard").show();
		}else{	
			$("#bad1006BadTable .kt-datatable__table").css({visibility: "visible",height: "auto"});
			$("#bad1006BadCard").hide();
		}
	}
	 
	
    
	 var setStmInfo = function(data){
		
		var stmOptionCnt = 0;
		var stmNtcYnCd = data.stmNtcYnCd;
		var stmPwYnCd = data.stmPwYnCd;
		var stmTagYnCd = data.stmTagYnCd;
		var stmCmtYnCd = data.stmCmtYnCd;
		var stmFileCnt = data.stmFileCnt;
		var stmFileStrg = data.stmFileStrg;
		 
		stmOptionCnt = 0;
			if(data.stmNtcYnCd == '01'){
				stmOptionCnt++;
			}
			if(data.stmPwYnCd == '01'){
				stmOptionCnt++;
			}
			if(data.stmTagYnCd == '01'){
				stmOptionCnt++;
			}
			if(data.stmCmtYnCd == '01'){
				stmOptionCnt++;
			}
			
			
			$("#stmOptionCnt").val(stmOptionCnt);
			$("#stmNtcYnCd").val(stmNtcYnCd);
			$("#stmPwYnCd").val(stmPwYnCd);
			$("#stmTagYnCd").val(stmTagYnCd);
			$("#stmCmtYnCd").val(stmCmtYnCd);
			$("#stmFileCnt").val(stmFileCnt);
			$("#stmFileStrg").val(stmFileStrg);
	 }
	 
	 
	
    
	 var getStmInfo = function(){
		
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/bad/bad1000/bad1000/selectBad1000DsTypeGetAjax.do'/>", "async": false},
    			{"menuId": $("#menuId").val()});
		
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
				setStmInfo(data.stmInfo);
				if($.osl.isNull($("#stmRootYn").val())){
					
					$("#menuId").val(data.menuId);
					$("#stmDsTypeCd").val(data.stmInfo.stmDsTypeCd);
					$("#stmNm").val(data.stmInfo.stmNm);
					
					
					$("#badTitle").empty();
					var innerHtml ="";
					if(data.stmInfo.stmTypeCd == '03'){
						innerHtml = "<i class='la la-newspaper-o kt-margin-r-5'></i><span data-lang-cd='stm2100.type.gallery'>"+$.osl.lang("stm2100.type.gallery")+"</span>";
					}else{
						innerHtml = "<i class='la la-server kt-margin-r-5'></i><span data-lang-cd='stm2100.type.movie'>"+$.osl.lang("stm2100.type.movie")+"</span>";
					}
					innerHtml += $.osl.escapeHtml(data.stmInfo.stmNm);
					$("#badTitle").append(innerHtml);
					$("#stmTypeCd").val(data.stmInfo.stmTypeCd);
				}
			}
		});
    	
		ajaxObj.send();	
	 };
	 	
	 
	 var checkUser = function(){
		 var data = {
				 authGrpId : $.osl.selAuthGrpId,
				 menuId : $("#menuId").val(),
				 dsTypeCd : $("#stmDsTypeCd").val(),
		 };
		
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2100UserCheckAjax.do'/>", "async": false}
				, data);
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var result = data.result;
				if(result.resultManager == "Y"){
					okManager = true;	
				}else{
					okManager = false;
				}
				
				
				if(result.resultWriter == "Y" || result.resultWriter == "B"){
					okWriter = true;	
				}else{
					okWriter = false;
				}
			}
		});
		
    	
		ajaxObj.send();
	 };

	 
	 return {
		 init: function(){
			 documentSetting();
		 },
		 reload: function(){
			 $.osl.datatable.list["bad1006BadTable"].targetDt.reload();
		 },
	 };
 }();
 
 $.osl.ready(function(){
	 OSLBad1006Popup.init();
 });
</script>

