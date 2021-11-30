<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />

<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h3 class="kt-portlet__head-title kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h3>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm2100StmTable" data-datatable-action="select" title="게시판 조회" data-title-lang-cd="stm2100.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm2100StmTable" data-datatable-action="update" title="게시판 속성 수정" data-title-lang-cd="stm2100.actionBtn.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="2">
					<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm2100StmTable" data-datatable-action="detail" title="게시글 관리" data-title-lang-cd="stm2100.actionBtn.managmentTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="detail" tabindex="3">
					<i class="fa flaticon-settings-1"></i><span data-lang-cd="stm2100.button.detail">관리</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="stm2100StmTable" data-datatable-action="summery" title="게시판 통계" data-title-lang-cd="stm2100.actionBtn.summeryTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="summery" tabindex="4">
					<i class="fa flaticon-information"></i><span data-lang-cd="stm2100.button.summery">통계</span>
				</button>
				
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air btn-view-type active" title="카드형" data-title-lang-cd="stm2100.button.card" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5" data-view-type="01">
						<i class="fa fa-table osl-padding-r0"></i>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="그리드형" data-title-lang-cd="stm2100.button.grid" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="6" data-view-type="02">
						<i class="fa fa-list osl-padding-r0"></i>
					</button>
				</div>
				
			</div>
		</div>
	</div>
	<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block">
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search kt-margin-b-0" data-datatable-id="stm2100StmTable"></div>
		</div>
	</div>
</div>
<div id="stm2100StmCard"></div>
<div class="kt_datatable osl-datatable-footer__divide" id="stm2100StmTable"></div>

<script>
 "use strict";

 var OSLStm2100Popup = function() {
	 
	 var okManager;
	 var okWriter;
	 
	 var resultStr = "";
	 var currentViewType = "01";
	 var documentSetting = function() {	
		 var datatableId = "stm2100StmTable";
		 var config = {
			 cardUiTarget: $("#stm2100StmCard"),
			 data: {
				 source: {
					 read: {
						url: "/stm/stm2000/stm2100/selectStm2100ListAjax.do" 
					 }
				 },
			 },
			 columns: [
				 {field: 'checkbox', title: '#', textAlign: 'center', width: 50, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				 {field: 'stmTypeNm', title:'유형', textAlign: 'left', width: 100, search: true, searchType:"select", searchCd:"STM00001", searchField:"stmTypeCd", sortable: true},
				 {field: 'stmNm', title:'게시판명', textAlign: 'left', width: 300, autoHide: false, search: true, sortable: true},
				 {field: 'stmDsTypeNm', title: '공개범위', textAlign: 'left', width: 200, sortable: true},
				 {field: 'cnt', title: '전체글 수', textAlign: 'center', width: 150, sortable: false},
				 {field: 'badCnt', title: '유효글 수', textAlign: 'center', width: 150, sortable: false,
					 template : function(row){
						return String(parseInt(row.cnt) - parseInt(row.delCnt)); 
					 },
				 },
				 {field: 'delCnt', title: '삭제글 수', textAlign: 'center', width: 150, sortable: false},
			 ],
			 rows:{
				clickCheckbox: true
			},
			 actionBtn:{
				"title" : $.osl.lang("stm2100.actionBtn.title"),
				"width" : 120,
				"delete" : false,
				"detail": true,
				"summery" : true,
			},
			actionTooltip:{
				"update" : $.osl.lang("stm2100.actionBtn.updateBtn"),
				"detail": $.osl.lang("stm2100.actionBtn.detailBtn"),
				"summery": $.osl.lang("stm2100.actionBtn.summeryBtn"),
			},
			actionFn:{
				"update":function(rowData){
					var data = {
							type: "update",
							menuId: rowData.menuId,
							stmTypeCd: rowData.stmTypeCd,
							stmNm: rowData.stmNm,
							stmDsTypeCd : rowData.stmDsTypeCd,
						};
					var options = {
							idKey: rowData.menuId,
							modalTitle: "[ "+ $.osl.escapeHtml(rowData.stmNm)+ " ] "+$.osl.lang("stm2100.title.updateTitle"),
							closeConfirm: false,
							modalSize: "xl",
							autoHeight: false,
							backdrop: "static",
						};
					
					checkUser(rowData.menuId, rowData.stmDsTypeCd);
					if(okManager == true){
						$.osl.layerPopupOpen('/stm/stm2000/stm2100/selectStm2101View.do',data,options);
					}else{
						$.osl.alert($.osl.lang("stm2100.notAuthority"), {"type":"warning"});
						return false;
					}
				},
				"detail":function(rowDatas, datatableId, type, rowNum){
					var rowData;
					if(type == "list"){
						if(rowNum != 1){
							$.osl.alert($.osl.lang("stm2100.selectStmInfoCnt", rowNum), {"type":"warning"});
							return false;
						}else{
							rowData = rowDatas[0];
						}
					}else{
							rowData = rowDatas;
					}
					
					var data = {
							menuId: rowData.menuId,
							stmTypeCd: rowData.stmTypeCd,
							stmNm: $.osl.escapeHtml(rowData.stmNm),
							
							stmDsTypeCd : "01",
							stmRootYn : "Y",
						};
					var options = {
							idKey: "bad_" + rowData.menuId,
							modalTitle:"[ "+ $.osl.escapeHtml(rowData.stmNm) +" ] "+$.osl.lang("stm2100.title.detailTitle"),
							closeConfirm: false,
							modalSize: "fs",
							autoHeight: false,
						};
					checkUser(rowData.menuId, rowData.stmDsTypeCd);
					if(okManager == true || okWriter == true){
						if(rowData.stmTypeCd == "01" || rowData.stmTypeCd == "02"){
							$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1000View.do',data,options);
						}else{
							$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1006View.do',data,options);
						}
					}else{
						$.osl.alert($.osl.lang("stm2100.notAuthority"), {"type":"warning"});
					}
				},
				"summery" : function(rowDatas, datatableId, type, rowNum){
					var rowData;
					if(type == "list"){
						if(rowNum != 1){
							$.osl.alert($.osl.lang("stm2100.selectStmInfoCnt", rowNum), {"type":"warning"});
							return false;
						}else{
							rowData = rowDatas[0];
						}
					}else{
							rowData = rowDatas;
					}
					
					var data = {
							type:"dbClick",
							menuId: rowData.menuId,
							stmTypeCd: rowData.stmTypeCd,
							stmNm: $.osl.escapeHtml(rowData.stmNm),
						};
					var options = {
							idKey: "summery_"+rowData.menuId,
							modalTitle: "[ "+ $.osl.escapeHtml(rowData.stmNm) +" ] "+$.osl.lang("stm2100.title.summeryTitle"),
							closeConfirm: false,
							autoHeight: false,
						};
					
 					checkUser(rowData.menuId, rowData.stmDsTypeCd);
					if(okManager == true){
	 					$.osl.layerPopupOpen('/stm/stm2000/stm2100/selectStm2102View.do',data,options);
					}else{
						$.osl.alert($.osl.lang("stm2100.selectStmInfoCnt", rowNum), {"type":"warning"});
					}
				},
			 },
			 theme: {
				 actionBtn:{
					 "detail" : "",
					 "summery" : "",
				 },
				 actionBtnIcon:{
					 "detail": "fa flaticon-settings-1",
					 "summery" : "fa flaticon-information",
				 }
			 },
			 callback:{
				 initComplete : function(evt, config){
					viewTypeChange();
				 },
				 ajaxDone: function(evt, list){
					$("#stm2100StmCard").empty();
					var cnt = 0;
					$.each(list, function(idx, row){
						 resultStr = "";
						var summeryData = selectStm2102(idx, row);
		 				$("#stm2100StmCard").append(resultStr);
		 				
		 				
		 				drawChart(idx, row.menuId);
					 });
	 				
	 				
	 				$(".updateBtn").click(function(){
	 					var item =$(this).parents(".osl-bad__card-body").siblings(".stmInfoDiv");
	 					var data = {
								type: "update",
								menuId: $(item).data("menuId"),
								stmTypeCd: $(item).data("stmTypeCd"),
								stmNm: $(item).data("stmName"),
								stmDsTypeCd : $(item).data("stmDsTypeCd"),
							};
						var options = {
								idKey: $(item).data("menuId"),
								modalTitle: "[ "+$(item).data("stmName")+ " ] "+$.osl.lang("stm2100.title.updateTitle"),
								closeConfirm: false,
								modalSize: "xl",
								autoHeight: false,
								backdrop: "static",
							};
						
						checkUser($(item).data("menuId"), $(item).data("stmDsTypeCd"));
						if(okManager == true){
							$.osl.layerPopupOpen('/stm/stm2000/stm2100/selectStm2101View.do',data,options);
						}else{
							$.osl.alert($.osl.lang("stm2100.notAuthority.basic"), {"type":"warning"});
						}
	 				});
	 				
	 				$(".settingBtn").click(function(){
	 					var item =$(this).parents(".osl-bad__card-body").siblings(".stmInfoDiv");
	 					var data = {
								menuId: $(item).data("menuId"),
								stmTypeCd: $(item).data("stmTypeCd"),
								stmNm: $(item).data("stmName"),
								
								stmDsTypeCd : "01",
								stmRootYn : "Y",
							};
						var options = {
								idKey: "bad_"+ $(item).data("menId"),
								modalTitle:"[ "+ $(item).data("stmName") +" ] "+$.osl.lang("stm2100.title.detailTitle"),
								closeConfirm: false,
								modalSize: "fs",
								autoHeight: false,
							};
						checkUser($(item).data("menuId"), $(item).data("stmDsTypeCd"));
						if(okManager == true || okWriter == true){
							if(item.data("stmTypeCd") == "01" || item.data("stmTypeCd") == "02"){
								$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1000View.do',data,options);
							}else{
								$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1006View.do',data,options);
							}
						}else{
							$.osl.alert($.osl.lang("stm2100.notAuthority.basic"), {"type":"warning"});
						}
	 				});

					
					$(".badChargerList").click(function(){
						$.osl.user.usrInfoPopup($(this).data("user"));
					});
					
					$(".otherBadChargerList").click(function(){
						
						var item =$(this).parents(".stmInfoDiv");
						
						var data = {
								menuId : $(item).data("menuId"),
						};
						var options = {
								idKey: "charger_"+ $(item).data("menId"),
								modalTitle:"[ "+ $.osl.escapeHtml($(item).data("stmName")) +" ] "+$.osl.lang("stm2100.title.chargerTitle"),
								modalSize : "md",
								autoHeight: false,
						};
						$.osl.layerPopupOpen('/stm/stm2000/stm2100/selectStm2103View.do',data,options);
					});
					
				 }
			 }
		 };
		 
		 
		 $.osl.datatable.setting(datatableId, config);

		
		$(".btn-view-type").click(function(){
			var viewType = $(this).data("view-type");
			
			
			$(".btn-view-type.active").removeClass("active");
			$(this).addClass("active");
			
			currentViewType = viewType;
			
			
			viewTypeChange();
		});
		 
		 
		 var viewTypeChange = function(){
			
			if(currentViewType == "01"){	
				$("#stm2100StmTable .kt-datatable__table").css({visibility: "hidden", height: 0});
				$("#stm2100StmCard").show();
			}else{	
				$("#stm2100StmTable .kt-datatable__table").css({visibility: "visible",height: "auto"});
				$("#stm2100StmCard").hide();
			}
		}
		 
		 
			 var selectStm2102 = function(idx, row){
				 
				 var data = {
						 menuId : row.menuId,
						 currentViewType: currentViewType,
				 }
				 
				 var ajaxObj = new $.osl.ajaxRequestAction(
			    			{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2102BadSummeryInfoAjax.do'/>", "async": false}
							, data);
				 
				 
				 ajaxObj.setFnSuccess(function(data){
		    		if(data.errorYn == "Y"){
						 
						$.osl.alert(data.message,{type: 'error'});
						
						$.osl.layerPopupClose();
					}else{
						var ntcInfo = data.ntcInfo;
						var badCntInfo = data.badCntInfo;
						var badHitInfo = data.badHitInfo;
						var pwCnt = data.pwCnt;
						var badCmtInfo = data.badCmtInfo;
						var tagInfo = data.tagInfo;
						var fileSummery = data.fileSummery;
						var badChargerList = data.badChargerList;
						
						resultStr += "<div class='row kt-padding-10'>"
				 						+ "<div class='kt-portlet kt-portlet--mobile'>"
			 								+ "<div class='col-12 stmInfoDiv' data-menu-id='"+row.menuId+"' data-stm-type-cd='"+row.stmTypeCd+"' data-stm-name='"+$.osl.escapeHtml(row.stmNm)+"' data-stm-ds-type-cd='"+row.stmDsTypeCd+"'>"
					 							+ "<div class='kt-portlet__head kt-portlet__head--lg'>"
					 								+ "<div class='kt-portlet__head-label'>"
					 									+ "<label class='kt-checkbox kt-checkbox--single kt-checkbox--solid'>"
						 									+ "<input type='checkbox' value='"+idx+"' name='stmGrpCheckbox' id='stmGrpCheckbox_"+row.menuId+"' data-datatable-id='"+datatableId+"'>&nbsp;<span></span>"
					 									+ "</label>";
							 var boardType = "";
							 if(row.stmTypeCd == "01"){
								 boardType = "normal";
							 }else if(row.stmTypeCd == "02"){
								 boardType = "storage";
							 }else if(row.stmTypeCd == "03"){
								 boardType = "gallery";
							 }else{
								 boardType = "movie";
							 }
		 							 resultStr += "<h5 class='kt-font-boldest'>"
				 										+ "<span class='kt-margin-r-10 kt-font-dark'>"+$.osl.lang("stm2100.type."+boardType)+"</span>"
				 										+ "<span class='kt-margin-r-10 kt-font-dark'>"+$.osl.escapeHtml(row.stmNm)+"</span>"
				 									+ "</h5>"
				 								+ "</div>"
			 									+ "<div class='kt-media-group osl-margin-b-05'>";
			 									
			 									if(!$.osl.isNull(badChargerList)){
			 										var lastCount =  badChargerList.length;
			 										$.each(badChargerList, function(index, value){
			 											
			 											if(index < 6){
			 												
			 												
				 											if(value.authTypeCd=="01"){
				 												resultStr += "<a href='#' class='kt-media kt-media--xs kt-media--circle' data-toggle='kt-tooltip' data-skin='brand' data-placement='top' title='"+$.osl.escapeHtml(value.authTargetNm)+"("+$.osl.escapeHtml(value.prjNm)+")' data-original-title='"+$.osl.escapeHtml(value.authTargetNm)+"("+$.osl.escapeHtml(value.prjNm)+")'><span><i class='fa flaticon2-group kt-font-bold'></i></span></a>";
				 											}else{
				 												resultStr += "<a href='#' class='kt-media kt-media--xs kt-media--circle badChargerList' data-toggle='kt-tooltip' data-skin='brand' data-placement='top' title='"+$.osl.escapeHtml(value.authTargetNm)+"' data-original-title='"+$.osl.escapeHtml(value.authTargetNm)+"' data-user='"+value.authTargetId+"'><img src='/cmm/fms/getImage.do?fileSn=0&atchFileId="+value.authTargetImgId+"'></a>";
				 											}
			 												
				 											lastCount = badChargerList.length - (index+1);
			 											}else{
			 												if(index == 6){
			 													
				 												resultStr += "<a href='#' class='kt-media kt-media--xs kt-media--circle otherBadChargerList' data-toggle='kt-tooltip' data-skin='brand' data-placement='top' title='' data-original-title='"+$.osl.lang("stm2101.label.otherAdmin")+" "+lastCount+"'><span>+"+lastCount+"</span></a>";
			 												}
			 											}
			 										});
			 									}
													
									resultStr += "</div>"
				 							+ "</div>"
				 						+ "</div>" 
				 						+ "<div class='osl-bad__card-body'>"
				 							+ "<div class='row kt-margin-10 kt-margin-r-25 kt-margin-l-25'>"
					 							+ "<div class='col-lg-3 col-md-3 col-sm-3 col-3'>"
					 								+ "<label class='kt-margin-r-10'><i class='fa flaticon2-layers kt-margin-r-5'></i>"+$.osl.lang("stm2100.field.stmDsTypeNm")+"</label>"
					 								+ "<span>"+$.osl.escapeHtml(row.stmDsTypeNm)+"</span>"
					 							+ "</div>"
					 							+ "<div class='col-lg-3 col-md-3 col-sm-3 col-3'>"
					 								+ "<label class='kt-margin-r-10'><i class='fa flaticon2-layers kt-margin-r-5'></i>"+$.osl.lang("stm2100.field.cnt")+"</label>"
					 								+ "<span>"+$.osl.escapeHtml(row.cnt)+"</span>"
					 							+ "</div>"
					 							+ "<div class='col-lg-3 col-md-3 col-sm-3 col-3'>"
					 								+ "<label class='kt-margin-r-10'><i class='fa flaticon2-layers kt-margin-r-5'></i>"+$.osl.lang("stm2100.field.badCnt")+"</label>"
					 								+ "<span>"+$.osl.escapeHtml(String(parseInt(row.cnt) - parseInt(row.delCnt)))+"</span>"
					 							+ "</div>"
					 							+ "<div class='col-lg-3 col-md-3 col-sm-3 col-3'>"
					 								+ "<label class='kt-margin-r-10'><i class='fa flaticon2-layers kt-margin-r-5'></i>"+$.osl.lang("stm2100.field.delCnt")+"</label>"
					 								+ "<span>"+$.osl.escapeHtml(row.delCnt)+"</span>"
					 							+ "</div>"
					 						+ "</div>"
				 							+ "<div class='row kt-margin-10 kt-margin-r-25 kt-margin-l-25'>"
				 								
					 							+ "<div class='col-lg-6 col-md-12 col-sm-12 col-12'>"
					 								+ "<div>"
					 									+ "<i class='fa flaticon2-graphic kt-margin-r-5'></i>" + $.osl.lang("stm2100.label.summery")
			 										+ "</div>"
					 								+ "<div id='drawChart"+idx+"' name='drawChart"+idx+"'>"
				 											
			 										+ "</div>"
					 							+ "</div>"
					 							
					 							+ "<div class='col-lg-6 col-md-12 col-sm-12 col-12'>"
					 								
				 									+ "<div class='row kt-margin-t-5 kt-margin-b-5'>"
				 										
						 								+"<div class='col-lg-6 col-md-6 col-sm-6 col-6'>"
							 								+ "<div class='kt-padding-5'>"
							 									+ "<i class='fa flaticon-exclamation-1 kt-margin-r-5'></i>"
						 										+ "<span data-lang-cd='stm2102.label.notice'>"+$.osl.lang("stm2102.label.notice")+"</span>"
					 										+  "</div>";
			 							if(ntcInfo != "N"){
						 					if(ntcInfo.cnt != 0){
						 						resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
						 											+ $.osl.lang("stm2102.summery.noticeCntY", ntcInfo.cnt)
						 									+  "</div>"
						 									+  "<div class='kt-margin-5 kt-padding-l-20'>"
								 									+ $.osl.lang("stm2102.summery.ntcCurrentY", ntcInfo.badNtcStdtm)
						 									+ "</div>";
						 					}else{
						 						resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																	+ $.osl.lang("stm2102.summery.noticeCntN")
															+  "</div>"
															+  "<div class='kt-margin-5 kt-padding-l-20'>"
							 									+$.osl.lang("stm2102.summery.ntcCurrentN")
															+ "</div>";
						 					}
						 				}else{
							 					resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																	+ $.osl.lang("stm2102.summery.noticeCntN")
															+  "</div>"
															+  "<div class='kt-margin-5 kt-padding-l-20'>"
							 									+$.osl.lang("stm2102.summery.ntcCurrentN")
															+ "</div>";
						 				}
					 						resultStr += "</div>"
							 								
									 					 + "<div class='col-lg-6 col-md-6 col-sm-6 col-6'>"
							 								+  "<div class='kt-padding-5'>"
								 									+ "<i class='fa flaticon-chat-1 kt-margin-r-5'></i>"
							 										+ "<span data-lang-cd='stm2102.label.comment'>"+$.osl.lang("stm2102.label.comment")+"</span>"
					 										+  "</div>";
							 				if(badCmtInfo != "N"){
							 					resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
						 											+ $.osl.lang("stm2102.summery.cmtAllCntY", badCmtInfo.allCnt)
						 									+  "</div>"
						 									+  "<div class='kt-margin-5 kt-padding-l-20'>"
								 									+ $.osl.lang("stm2102.summery.cmtMaxInfoY", badCmtInfo.cnt )
						 									+ "</div>";
							 				}else{
							 					resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
						 											+ $.osl.lang("stm2102.summery.cmtAllCntN")
						 									+  "</div>"
						 									+  "<div class='kt-margin-5 kt-padding-l-20'>"
								 									+ $.osl.lang("stm2102.summery.cmtMaxInfoN")
						 									+ "</div>";
							 				}
								 			resultStr	+= "</div>" 
							 							+ "</div>" 
							 							
							 							+ "<div class='row kt-margin-t-5 kt-margin-b-5'>"
							 								
							 								+ "<div class='col-lg-6 col-md-6 col-sm-6 col-6'>"
								 								+ "<div class='kt-padding-5'>"
								 									+ "<i class='fa flaticon-edit-1 kt-margin-r-5'></i>"
							 										+ "<span data-lang-cd='stm2102.label.board'>"+$.osl.lang("stm2102.label.board")+"</span>"
						 										+  "</div>";
									 			if(badCntInfo != "N"){
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.badAllCntY", badCntInfo.badCntAll , badCntInfo.badCntDel)
																+  "</div>";
									 			}else{
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.badAllCntN")
																+  "</div>";	
									 			}
									 			if(badHitInfo != "N"){
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.badHitInfoY", badHitInfo.badHit)
																+  "</div>";
									 			}else{
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.badHitInfoN")
																+  "</div>";
									 			}
									 			if(pwCnt != 0){
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.badPwCntY", pwCnt)
																+  "</div>";
									 			}else{
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.badPwCntN")
																+  "</div>";
									 			}
						 					 	resultStr += "</div>"
								 					 		
									 					 	+ "<div class='col-lg-6 col-md-6 col-sm-6 col-6'>"
								 								+ "<div class='kt-padding-5'>"
								 									+ "<i class='fa flaticon-interface-9 kt-margin-r-5'></i>"
																	+ "<span data-lang-cd='stm2102.label.tag'>"+$.osl.lang("stm2102.label.tag")+"</span>"
																+  "</div>";
									 	if(!$.osl.isNull(tagInfo) && tagInfo != "N"){
									 		$.each(tagInfo, function(index, value){
									 			if(index < 3){ 
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.tagLabelY",index+1, $.osl.escapeHtml(value.tagNm))
																+  "</div>";
												}
									 		});
									 	}else{
									 				resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																		+ $.osl.lang("stm2102.summery.tagLabelN")
																+  "</div>";
									 	}
											 	resultStr += "</div>" 
												 			+ "</div>"
								 							
								 							+ "<div class='row kt-margin-t-5 kt-margin-b-5'>"
								 								
								 								+ "<div class='col-lg-6 col-md-6 col-sm-6 col-6'>"
									 								+ "<div class='kt-padding-5'>"
									 									+ "<i class='fa flaticon-tool-1 kt-margin-r-5'></i>"
								 										+ "<span data-lang-cd='stm2102.label.attachFile'>"+$.osl.lang("stm2102.label.attachFile")+"</span>"
							 										+  "</div>";
												if(fileSummery != "N"){
														resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																			+ $.osl.lang("stm2102.summery.fileAllCntY", parseInt(fileSummery.fileTotalCnt))
																	+  "</div>"
																	+ "<div class='kt-margin-5 kt-padding-l-20'>"
																			+ $.osl.lang("stm2102.summery.fileAllSizeY", $.osl.byteCalc(parseInt(fileSummery.fileTotalSize)))
																	+  "</div>";
												}else{
														resultStr += "<div class='kt-margin-5 kt-padding-l-20'>"
																			+ $.osl.lang("stm2102.summery.fileAllCntN")
																	+  "</div>"
																	+ "<div class='kt-margin-5 kt-padding-l-20'>"
																			+ $.osl.lang("stm2102.summery.fileAllCntN")
																	+  "</div>";
												}
								 					resultStr += "</div>" 
															+ "</div>" 
															
															+ "<div class='row kt-padding-t-15 kt-padding-b-15 kt-align-right'>"
																+ "<div class='col-12 kt-padding-0'>"
																	+ "<button type='button' class='btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air updateBtn' data-datatable-action='update' title='"+$.osl.lang("stm2100.actionBtn.updateTooltip")+"' data-title-lang-cd='stm2100.actionBtn.updateTooltip' data-toggle='kt-tooltip' data-skin='brand' data-placement='top' data-auth-button='update'>"
																		+ "<i class='fa fa-edit'></i>"
																		+ "<span data-lang-cd='datatable.button.update'>"+$.osl.lang("datatable.button.update")+"</span>"
																	+ "</button>"
																	+ "<button type='button' class='btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air settingBtn' data-datatable-action='detail' title='"+$.osl.lang("stm2100.actionBtn.managmentTooltip")+"' data-title-lang-cd='stm2100.actionBtn.managmentTooltip' data-toggle='kt-tooltip' data-skin='brand' data-placement='top' data-auth-button='detail'>"
																		+ "<i class='fa flaticon-settings-1'></i>"
																		+ "<span data-lang-cd='stm2100.button.detail'>"+$.osl.lang("stm2100.button.detail")+"</span>"
																	+ "</button>"
																+ "</div>"
															+ "</div>"
														+"</div>" 
													+ "</div>"
												+ "</div>"
											+ "</div>"
										+ "</div>" 
									+ "</div>";
					}
				});
			 
			 ajaxObj.send();
		 };
		 
		 
		 var drawChart = function(index, menuId){
			 var chart = $.osl.chart.setting("apex","drawChart"+index,{
				
				data:{
					
					url: "<c:url value='/stm/stm2000/stm2100/selectStm2102BadSummeryChartInfoAjax.do'/>",
					
					param:{
						 menuId : menuId,
						 
						 key: {
							 key1: "totalNewCnt",
							 key2: "delCnt",
						 },
						 
						 keyNm:{
							 keyNm1: $.osl.lang("stm2100.chart.deletePost"),
							 keyNm2: $.osl.lang("stm2100.chart.newPost"),
						 },
						 
						 xKey:"chartDate",
						 
						 chartType:"area"
					 },
					 type: "remote"
				},
				chart:{
					
					colors: ["#586272", "#1cac81"],
				},
				callback:{
					
					initComplete: function(chartContext, config){
						$(".apexcharts-zoomout-icon").addClass("kt-margin-0");
						$(".apexcharts-reset-icon").addClass("kt-margin-0");
						$(".apexcharts-toolbar").addClass("kt-margin-10");
						$(".apexcharts-toolbar").attr("style", "top:-20px; right: 10px;");
						$(".apexcharts-toolbar").removeAttr("style[padding]");
					}
				}
			});
		 }
		 
		 
		 var checkUser = function(menuId, stmDsTypeCd){
			 var data = {
					 authGrpId : $.osl.selAuthGrpId,
					 menuId : menuId,
					 dsTypeCd : stmDsTypeCd,
			 }
			
	    	var ajaxObj = new $.osl.ajaxRequestAction(
	    			{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2100UserCheckAjax.do'/>", "async": false}
					, data);
			
	    	ajaxObj.setFnSuccess(function(data){
	    		if(data.errorYn == "Y"){
					$.osl.alert(data.message,{type: 'error'});
					
					$.osl.layerPopupClose();
				}else{
					var result = data.result;
					
					okManager = true;	
					
					
					
					if(result.resultWriter == "Y" || result.resultWriter == "B"){
						okWriter = true;	
					}else{
						okWriter = false;
					}
				}
			});
			
	    	
			ajaxObj.send();
		 }
	 };
	 
	 return {
		 init: function(){
			 documentSetting();
		 }
	 };
 }();
 
 $.osl.ready(function(){
	 OSLStm2100Popup.init();
 });
</script>


<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />