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
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type active" title="데이터 카드 형식으로 보기" data-title-lang-cd="prj1400.button.title.card" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="6" data-view-type="01">
						<i class="fa fa-table osl-padding-r0"></i>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="데이터 테이블 형식으로 보기" data-title-lang-cd="prj1400.button.title.grid" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="7" data-view-type="02">
						<i class="fa fa-list osl-padding-r0"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block ">
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="prj1400PrjTable"></div>
		</div>
		<div class="col-lg-9 col-md-12 col-sm-12 text-right kt-padding-r-0">
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1400PrjTable" data-datatable-action="select" title="데이터 조회" data-title-lang-cd="prj1400.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
				<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1400PrjTable" data-datatable-action="insert" title="신규 프로젝트 그룹 등록" data-title-lang-cd="prj1400.button.title.insert" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
				<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1400PrjTable" data-datatable-action="update" title="프로젝트 그룹 수정" data-title-lang-cd="prj1400.button.title.update" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
				<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1400PrjTable" data-datatable-action="delete" title="프로젝트 그룹 휴지통 이동(삭제)" data-title-lang-cd="prj1400.button.title.delete" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
				<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">휴지통 이동(삭제)</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" name="prjTrashListMoveBtn" id="prjTrashListMoveBtn" data-datatable-id="prj1400PrjTable" title="프로젝트 그룹 휴지통 목록" data-title-lang-cd="prj1400.button.title.trash" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
				<i class="fa fa-trash"></i><i class="fa fa-list"></i><span data-lang-cd="datatable.button.trash">휴지통 목록</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1400PrjTable" data-datatable-action="prjGrpRedo" title="프로젝트 그룹 복구" data-title-lang-cd="prj1400.button.title.redo" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3" hidden>
				<i class="fa fa-redo-alt"></i><span data-lang-cd="datatable.button.redo">복구</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1400PrjTable" data-datatable-action="prjGrpDelete" title="프로젝트 그룹 완전 삭제" data-title-lang-cd="prj1400.button.title.recordDelete" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4" hidden>
				<i class="fa fa-times-circle"></i><span data-lang-cd="datatable.button.recordDelete">완전 삭제</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" name="prjListMoveBtn" id="prjListMoveBtn" data-datatable-id="prj1400PrjTable" title="프로젝트 그룹 목록으로 이동" data-title-lang-cd="prj1400.button.title.prev" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5" hidden>
				<i class="fa fa-trash"></i><i class="fa fa-list"></i><span data-lang-cd="datatable.button.prev">돌아가기</span>
			</button>
		</div>
	</div>
</div>
<div id="prj1400CardTable"></div>
<div class="kt_datatable osl-datatable-footer__divide" id="prj1400PrjTable"></div>
<script>
"use strict";
var OSLPrj1400Popup = function () {
	var currentViewType = "01";
	
	var documentSetting = function(){
		var config = {
				cardUiTarget: $("#prj1400CardTable"),
				data: {
					source: {
						read: {
							url: "/prj/prj1000/prj1400/selectPrj1400ListAjaxView.do",
							params : {
								delCd: "02"
							}
						}
					},
				},
				columns: [
					{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
					{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false},
					{field: 'prjNm', title: '프로젝트 그룹명', textAlign: 'left', width: 200, search: true},
					{field: 'startDt', title: '시작 일자', textAlign: 'center', width: 100, search: true, searchType:"date"},
					{field: 'endDt', title: '종료 일자', textAlign: 'center', width: 100, search: true, searchType:"date"},
					{field: 'prjChildCnt', title: '등록 프로젝트 수', textAlign: 'center', width: 100
						,template: function (row) {return String(row.prjChildCnt)}},
					{field: 'reqAllCnt', title: '전체 요구사항 수', textAlign: 'center', width: 100
						,template: function (row) {return String(row.reqAllCnt)}},
					{field: 'reqInProgressCnt', title: '진행중 요구사항', textAlign: 'center', width: 100
						,template: function (row) {return String(row.reqInProgressCnt)}},
					{field: 'reqDoneCnt', title: '완료 요구사항', textAlign: 'center', width: 100
						,template: function (row) {return String(row.reqDoneCnt)}},
				],
				actionBtn:{
					"dblClick": true,
					"update": true,
					"delete": true,
					"title": $.osl.lang("datatable.action.functionNm"),
				},
				actionTooltip:{
					"dblClick": $.osl.lang("prj1400.datatable.action.dblClick"),
					"update": $.osl.lang("prj1400.datatable.action.update"),
					"delete": $.osl.lang("prj1400.datatable.action.delete")
				},
				actionFn:{
					"insert":function(datatableId, type, rowNum){
						var data = {type:"insert"};
						var options = {
								autoHeight: false,
								modalSize: "xl",
								idKey: datatableId,
								modalTitle: $.osl.lang("prj1401.insert.title"),
								closeConfirm: false,
							};
						
						$.osl.layerPopupOpen('/prj/prj1000/prj1400/selectPrj1401View.do',data,options);
					},
					"update": function(rowData, datatableId, type, rowNum, elem){
						var data = {
								type:"update"
								,paramPrjId: rowData.prjId
							};
						var options = {
								autoHeight: false,
								modalSize: "xl",
								idKey: datatableId,
								modalTitle: $.osl.lang("prj1401.update.title"),
								closeConfirm: false,
							};
						
						$.osl.layerPopupOpen('/prj/prj1000/prj1400/selectPrj1401View.do',data,options);
					},
					"delete":function(rowDatas, datatableId, c, rowNum, elem){
						
						var ajaxObj = new $.osl.ajaxRequestAction(
								{"url":"<c:url value='/prj/prj1000/prj1000/updatePrj1000PrjGrpTrashListAjax.do'/>"}
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
								paramPrjId: rowData.prjId
							};
							
						var options = {
								autoHeight: false,
								modalSize: "xl",
								idKey: datatableId+"_detail",
								modalTitle: $.osl.lang("prj1402.title"),
								closeConfirm: false,
							};
						$.osl.layerPopupOpen('/prj/prj1000/prj1400/selectPrj1402View.do',data,options);
					},
					
					"prjGrpRedo": function(rowData, datatableId, type){
						var rowDatas = rowData;
						
						
						if(rowDatas.length == 0){
							$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
							return true;
						}
						
						$.osl.confirm($.osl.lang("prj1400.confirm.prjGrpRedo",rowDatas.length),{html:true}, function(result){
							if (result.value) {
								
								fnPrjGrpRedoUpdate(rowDatas, datatableId);
							}
						});
					},
					
					"prjGrpDelete": function(rowData, datatableId, type){
						var rowDatas = rowData;
						
						
						if(rowDatas.length == 0){
							$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
							return true;
						}
						
						$.osl.confirm($.osl.lang("prj1400.confirm.prjGrpDelete",rowDatas.length),{html:true}, function(result){
							if (result.value) {
								
								fnPrjGrpDelete(rowDatas, datatableId);
							}
						});
					},
					
					"prjInsert": function(rowData, datatableId, type){
						var prjGrpInfo = rowData[0];
						var data = {
								type:"insert",
								paramPrjGrpId: prjGrpInfo.prjId,
								prjGrpNm: prjGrpInfo.prjNm,
								prjGrpStartDt: prjGrpInfo.startDt,
								prjGrpEndDt: prjGrpInfo.endDt
						};
						var options = {
								autoHeight: false,
								modalSize: "xl",
								idKey: datatableId,
								modalTitle: $.osl.lang("prj1004.insert.title"),
								closeConfirm: false,
							};
						
						$.osl.layerPopupOpen('/prj/prj1000/prj1000/selectPrj1001View.do',data,options);
					},
					
					"prjListMove": function(rowData, datatableId, type){
						var prjGrpInfo = rowData[0];
						
						
						var newForm = $("<form></form>");
						newForm.attr("name","prjListMoveForm");
						newForm.attr("method","post");
						newForm.attr("action","/prj/prj1000/prj1000/selectPrj1000PrjListView.do");
						newForm.attr("target","_self");
						newForm.appendTo("body");
						
						
						var input = $('<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="'+prjGrpInfo.prjId+'">');
						newForm.append(input);
						newForm.submit();
					},
				},
				callback:{
					initComplete: function(evt,config){
						fnViewerChange();
					},
					ajaxDone: function(evt, list){
						var prjGrpStr = '';
						var rowCnt = 0;
						$.each(list, function(idx, map){
							var prjGrpAuthList = '';
							var prjAuthTargetList = [];
							try{
								
								if(!$.osl.isNull(map.prjUsrChargerList)){
									var usrList = (map.prjUsrChargerList).split(",");
									
									$.each(usrList, function(usrListIdx, usrInfoStr){
										
										
										var usrInfo = usrInfoStr.split("|");
										
										
										prjAuthTargetList.push({
												authType: usrInfo[0],
												authTargetId: usrInfo[1],
												authImg: $.osl.user.usrImgUrlVal(usrInfo[2]),
												authTargetNm: $.osl.escapeHtml(usrInfo[3])
										});
									});
								}
								
								
								$.each(prjAuthTargetList, function(authIdx, authMap){
									
									if(authIdx > 10){
										
										var endAuthCnt = (prjAuthTargetList.length-authIdx);
										prjGrpAuthList += '<div class="kt-media kt-media--xs kt-media--circle osl-cursor__pointer" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="" data-original-title="그 외 담당자 +'+endAuthCnt+'"><span>'+endAuthCnt+'+</span></div>';
										return false;
									}else{
										prjGrpAuthList += '<div class="kt-media kt-media--xs kt-media--circle osl-cursor__pointer" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" title="'+authMap.authTargetNm+'" data-original-title="'+authMap.authTargetNm+'" onclick="$.osl.user.usrInfoPopup(\''+authMap.authTargetId+'\');"><img src="'+authMap.authImg+'"></div>';
									}
								});
							}catch(subE){
								
							}
							
							if(rowCnt == 0){
								prjGrpStr += '<div class="row">';
							}

							
							var rnStr = "No. "+map.rn;
							var rnClass = "badge-primary";
							
							
							var prjGrpDelCdMenuList = {
									
									"01":[
										'<div class="dropdown-item" data-datatable-id="prj1400PrjTable" data-datatable-expans="dropdown" data-datatable-action="prjGrpRedo"><i class="fa fa fa-redo-alt kt-font-primary"></i>'+$.osl.lang("prj1400.menu.projectRedo")+'</div>',
										'<div class="dropdown-divider"></div>',
										'<div class="dropdown-item" data-datatable-id="prj1400PrjTable" data-datatable-expans="dropdown" data-datatable-action="prjGrpDelete"><i class="fa fa-times-circle kt-font-primary"></i>'+$.osl.lang("prj1400.menu.recordDelete")+'</div>',
										'<div class="dropdown-divider"></div>',
										'<div class="dropdown-item" data-datatable-id="prj1400PrjTable" data-datatable-expans="dropdown" data-datatable-action="dblClick"><i class="fa fa-info-circle kt-font-primary"></i>'+$.osl.lang("prj1400.menu.projectDetail")+'</div>'
									],
									
									"02":[
										'<div class="dropdown-item" data-datatable-id="prj1400PrjTable" data-datatable-expans="dropdown" data-datatable-action="update"><i class="fa fa-edit kt-font-primary"></i>'+$.osl.lang("prj1400.menu.modify")+'</div>',
										'<div class="dropdown-item" data-datatable-id="prj1400PrjTable" data-datatable-expans="dropdown" data-datatable-action="delete"><i class="fa fa-trash kt-font-primary"></i>'+$.osl.lang("prj1400.menu.trashMove")+'</div>',
										'<div class="dropdown-item" data-datatable-id="prj1400PrjTable" data-datatable-expans="dropdown" data-datatable-action="prjListMove"><i class="fa fa-list-alt kt-font-primary"></i>'+$.osl.lang("prj1400.menu.projectListMove")+'</div>',
										'<div class="dropdown-divider"></div>',
										'<div class="dropdown-item" data-datatable-id="prj1400PrjTable" data-datatable-expans="dropdown" data-datatable-action="prjInsert"><i class="fa fa-plus kt-font-primary"></i>'+$.osl.lang("prj1400.menu.createProject")+'</div>',
										'<div class="dropdown-divider"></div>',
										'<div class="dropdown-item" data-datatable-id="prj1400PrjTable" data-datatable-expans="dropdown" data-datatable-action="dblClick"><i class="fa fa-info-circle kt-font-primary"></i>'+$.osl.lang("prj1400.menu.projectDetail")+'</div>'
									]
							};
							
							
							if(map.delCd == "01"){
								rnStr = '<i class="fa fa-trash-alt"></i>';
								rnClass = "badge-danger"
							}
							
							
							prjGrpStr += 
								'<div class="col-lg-6 col-md-12 col-sm-12">'
								+'<div class="kt-portlet kt-portlet--mobile osl-prj-info-obj">'
									+'<div class="kt-portlet__head kt-portlet__head--lg">'
										+'<div class="kt-portlet__head-label">'
											+'<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid"><input type="checkbox" value="'+idx+'" name="prjGrpCheckbox" id="prjGrpCheckbox_'+map.prjId+'" data-datatable-id="prj1400PrjTable">&nbsp;<span></span></label>'
											+'<h5 class="kt-font-boldest"><span class="badge '+rnClass+' kt-margin-r-10">'+rnStr+'</span></h5>'
											+'<div class="kt-media-group osl-margin-b-05">'
												+prjGrpAuthList
											+'</div>'
										+'</div>'
										+'<div class="kt-portlet__head-toolbar">'
											+'<div class="kt-portlet__head-wrapper">'
												+'<button type="button" class="btn btn-outline-primary btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" data-auth-button="select" data-toggle-second="tooltip" title="test" tabindex="1">'
													+'<i class="fa fa-bars osl-padding-r0"></i>'
												+'</button>'
												+'<div class="dropdown-menu dropdown-menu-right" data-datatable-rownum="'+idx+'">'
													+prjGrpDelCdMenuList[map.delCd].join('')
												+'</div>'
											+'</div>'
										+'</div>'
									+'</div>'
									+'<div class="kt-portlet__body">'
										+'<div class="row">'
											+'<div class="kt-padding-l-40 kt-padding-b-15 col-lg-4 col-md-4 col-sm-12">'
												+'<h5 class="kt-font-boldest text-truncate" title="'+$.osl.escapeHtml(map.prjNm)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top"> '+$.osl.escapeHtml(map.prjNm)+'</h5>'
												+'<span class="text-muted text-truncate" title="'+$.osl.escapeHtml(map.prjDesc)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top">'+$.osl.escapeHtml(map.prjDesc)+'</span>'
											+'</div>'
											+'<div class="col-lg-8 col-md-8 col-sm-12">'
												+'<div class="row">'
													+'<div class="col-lg-6 col-md-6 col-sm-12">'
														+'<div class="kt-pull-left kt-margin-r-25">'
															+'<div class="kt-padding-b-5"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i><span>'+$.osl.lang("prj1400.startDate")+'</span></div>'
															+'<h5><span class="badge badge-primary">'+$.osl.escapeHtml(map.startDt)+'</span></h5>'
														+'</div>'
														+'<div class="kt-pull-left ">'
															+'<div class="kt-padding-b-5"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i><span>'+$.osl.lang("prj1400.endDate")+'</span></div>'
															+'<h5><span class="badge badge-danger">'+$.osl.escapeHtml(map.endDt)+'</span></h5>'
														+'</div>'
													+'</div>'
													
												+'</div>'
											+'</div>'
										+'</div>'
									+'</div>'
									+'<div class="kt-portlet__foot kt-portlet__foot--sm">'
										+'<div class="row">'
											+'<div class="col-lg-6 col-md-6 col-sm-12">'
												+'<div class="osl-widget kt-padding-l-15">'
													+'<div class="osl-widget-info__item">'
														+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqPointer.png"></div>'
														+'<div class="osl-widget-info__item-info">'
															+'<div class="osl-widget-info__item-title osl-cursor__pointer">'+$.osl.lang("prj1400.projectCnt")+'</div>'
															+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.prjChildCnt)+'</div>'
														+'</div>'
													+'</div>'
													+'<div class="osl-widget-info__item">'
														+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqAll.png"></div>'
														+'<div class="osl-widget-info__item-info">'
															+'<div class="osl-widget-info__item-title osl-cursor__pointer">'+$.osl.lang("prj1400.requestAll")+'</div>'
															+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqAllCnt)+'</div>'
														+'</div>'
													+'</div>'
												+'</div>'
											+'</div>'
											+'<div class="col-lg-6 col-md-6 col-sm-12">'
												+'<div class="osl-widget kt-padding-l-15">'
													+'<div class="osl-widget-info__item">'
														+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqInProgress.png"></div>'
														+'<div class="osl-widget-info__item-info">'
															+'<div class="osl-widget-info__item-title osl-cursor__pointer">'+$.osl.lang("prj1400.requestInProgress")+'</div>'
															+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqInProgressCnt)+'</div>'
														+'</div>'
													+'</div>'
													+'<div class="osl-widget-info__item">'
														+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqDone.png"></div>'
														+'<div class="osl-widget-info__item-info">'
															+'<div class="osl-widget-info__item-title osl-cursor__pointer">'+$.osl.lang("prj1400.requestDone")+'</div>'
															+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqDoneCnt)+'</div>'
														+'</div>'
													+'</div>'
												+'</div>'
											+'</div>'
										+'</div>'
									+'</div>'
								+'</div>'
								+'</div>';
								rowCnt++;
								if(rowCnt == 2){
									prjGrpStr += '</div>';
									rowCnt = 0;
								}
						});
						
						
						$("#prj1400CardTable").html(prjGrpStr);
						
						
						KTApp.initTooltips();
						$('[data-toggle-second="tooltip"]').tooltip({
							template:'<div class="tooltip tooltip-primary bs-tooltip-bottom" role="tooltip"><div class="tooltip-arrow arrow" style="left: 25px;"></div><div class="tooltip-inner"></div></div>'
						});
					}
				}
			};
		
		
		$.osl.datatable.setting("prj1400PrjTable", config);
		
		
		
		
		$(".btn-view-type").click(function(){
			var viewType = $(this).data("view-type");
			
			
			$(".btn-view-type.active").removeClass("active");
			$(this).addClass("active");
			
			currentViewType = viewType;
			
			
			fnViewerChange();
		});
		
		
		$("#prjTrashListMoveBtn").click(function(){
			$.osl.datatable.list["prj1400PrjTable"].targetDt.options.data.source.read.params.delCd = "01";
			$(this).attr("hidden","hidden");
			$("#prjListMoveBtn").removeAttr("hidden");

			
			$("button[data-datatable-id=prj1400PrjTable][data-datatable-action=insert],"
					+"button[data-datatable-id=prj1400PrjTable][data-datatable-action=update],"
					+"button[data-datatable-id=prj1400PrjTable][data-datatable-action=delete]").attr("hidden","hidden");
			 
			
			$("button[data-datatable-id=prj1400PrjTable][data-datatable-action=prjGrpRedo],"
					+"button[data-datatable-id=prj1400PrjTable][data-datatable-action=prjGrpDelete]").removeAttr("hidden","hidden");
			
			
			$.osl.datatable.list["prj1400PrjTable"].targetDt.reload();
		});
		
		
		$("#prjListMoveBtn").click(function(){
			$.osl.datatable.list["prj1400PrjTable"].targetDt.options.data.source.read.params.delCd = "02";
			$(this).attr("hidden","hidden");
			$("#prjTrashListMoveBtn").removeAttr("hidden");
			
			
			$("button[data-datatable-id=prj1400PrjTable][data-datatable-action=insert],"
					+"button[data-datatable-id=prj1400PrjTable][data-datatable-action=update],"
					+"button[data-datatable-id=prj1400PrjTable][data-datatable-action=delete]").removeAttr("hidden");
			
			
			$("button[data-datatable-id=prj1400PrjTable][data-datatable-action=prjGrpRedo],"
					+"button[data-datatable-id=prj1400PrjTable][data-datatable-action=prjGrpDelete]").attr("hidden","hidden");
			
			
			$.osl.datatable.list["prj1400PrjTable"].targetDt.reload();
		});
	};
	
	
	var fnViewerChange = function(){
		
		if(currentViewType == "01"){	
			$("#prj1400PrjTable .kt-datatable__table").css({visibility: "hidden", height: 0});
			$("#prj1400CardTable").show();
		}else{	
			$("#prj1400PrjTable .kt-datatable__table").css({visibility: "visible",height: "auto"});
			$("#prj1400CardTable").hide();
		}
	}
	
	
	var fnPrjGrpRedoUpdate = function(redoDataList, datatableId){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1000/updatePrj1000PrjGrpTrashRedoListAjax.do'/>"}
				,{deleteDataList: JSON.stringify(redoDataList)});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);
   				
   				
   				$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
   			}
		});
		
		
		ajaxObj.send();
	}
	
	
	var fnPrjGrpDelete = function(deleteDataList, datatableId){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1400/deletePrj1400PrjGrpDeleteListAjax.do'/>"}
				,{deleteDataList: JSON.stringify(deleteDataList)});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);
   				
   				
   				$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
   			}
		});
		
		
		ajaxObj.send();
	}
	return {
        
        init: function() {
        	documentSetting();
        }
    };
}();

$.osl.ready(function(){
	OSLPrj1400Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
