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
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type active" title="데이터 카드 형식으로 보기" data-title-lang-cd="spr1000.button.title.card" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="6" data-view-type="01">
						<i class="fa fa-table osl-padding-r0"></i>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="데이터 테이블 형식으로 보기" data-title-lang-cd="spr1000.button.title.grid" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="7" data-view-type="02">
						<i class="fa fa-list osl-padding-r0"></i>
					</button>
				</div>
			</div>
		</div>
		
	</div>
	
	
	<div class="kt-portlet__head kt-portlet__head--lg osl-portlet__head__block ">
		
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="spr1000Table"></div>
		</div>
		
		
		<div class="col-lg-9 col-md-12 col-sm-12 text-right osl-mobile-text--left kt-padding-r-0">
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr1000Table" data-datatable-action="select" title="스프린트 관리 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
				<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr1000Table" data-datatable-action="insert" title="스프린트 관리 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="6">
				<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">등록</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr1000Table" data-datatable-action="update" title="스프린트 관리 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="7">
				<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr1000Table" data-datatable-action="delete" title="스프린트 관리 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="8">
				<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr1000Table" data-datatable-action="sprStart" title="스프린트 관리 시작" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="excel" tabindex="">
				<i class="fas fa-play-circle"></i><span data-lang-cd="spr1000.button.sprStart">시작</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr1000Table" data-datatable-action="sprEnd" title="스프린트 관리 종료" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="print" tabindex="">
				<i class="fas fa-stop-circle"></i><span data-lang-cd="spr1000.button.sprEnd">종료</span>
			</button>
		</div>
		
	</div>
	

</div>

<div id="spr1000CardTable"></div>


<div class="kt_datatable osl-datatable-footer__divide" id="spr1000Table"></div>



<script>
"use strict";
var OSLSpr1000Popup = function () {
	var documentSetting = function(){
		var currentViewType = "01";
	
		
		$.osl.datatable.setting("spr1000Table",{
			cardUiTarget: $("#spr1000CardTable"),
			data: {
				source: {
					read: {
						url: "/spr/spr1000/spr1000/selectSpr1000SprListAjax.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false},
				{field: 'sprTypeNm', title: '상태 ', textAlign: 'center', width: 100},
				{field: 'sprNm', title: '스프린트 이름', textAlign: 'center', width: 300},
				{field: 'sprDesc', title: '스프린트 설명', textAlign: 'center', width: 150},
				{field: 'sprStDt', title: '시작일', textAlign: 'center', width: 150, search: true, searchType:"date"},
				{field: 'sprEdDt', title: '종료일', textAlign: 'center', width: 150, search: true, searchType:"date"},
				{field: 'useNm', title: '사용 유무', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "CMM00001", searchField:"useCd", sortField: "useCd"},
			],
			actionBtn:{
				"dblClick": true
			},
			actionTooltip:{
				"update": $.osl.lang("spr1000.datatable.action.update"),
				"delete": $.osl.lang("spr1000.datatable.action.delete"),
				"dblClick": $.osl.lang("spr1000.datatable.action.dblClick")
			},
			actionFn:{
				"insert":function(datatableId){
					var data = {type:"insert"};
					var options = {
						autoHeight: false,
						modalSize: "md",
						idKey: datatableId,
						closeConfirm: false,
						modalTitle: $.osl.lang("spr1002.insert.title"),
					};
					
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1002View.do',data,options);
				},
				"update":function(rowData, datatableId, type, rowNum, elem){
					var data = {
							type:"update"
							,paramPrjGrpId: rowData.prjGrpId
							,paramPrjId: rowData.prjId
							,paramSprId: rowData.sprId
						};
					var options = {
							autoHeight: false,
							modalSize: "md",
							idKey: datatableId,
							closeConfirm: false,
							modalTitle: $.osl.lang("spr1002.update.title"),
					};
					
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1002View.do',data,options);
				},
				
				"delete":function(rowDatas, datatableId, type, rowNum, elem){
					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/spr/spr1000/spr1000/deleteSpr1000SprList.do'/>"}
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
				"dblClick": function(rowData, datatableId, type, rowNum, elem){
					var data = {
							paramSprId:rowData.sprId,
							paramSprStDt:rowData.sprStDt,
							paramSprEdDt:rowData.sprEdDt,
							paramSprDesc:rowData.sprDesc,
							paramSprTypeCd:rowData.sprTypeCd
						};
					
					var options = {
							autoHeight: false,
							modalSize: "xl",
							idKey: datatableId,
							closeConfirm: false,
							modalTitle: "스프린트 상세정보",
						};
					
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1001View.do',data,options);
				},
				
				"sprStart": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("spr1000.nonSelect"));
						return true;
					}
					
					else if(rowDatas.length > 1){
						$.osl.alert($.osl.lang("spr1000.manySelect"));
						return true;
					}
					
					
					var sprInfo = rowData[0];
					
					
					if(sprInfo.sprTypeCd != "01" || sprInfo.useCd != "01"){
						$.osl.alert($.osl.lang("spr1000.sprTypeWaitMsg"));
						return true;
					}
					
					var data = {
							paramPrjGrpId: sprInfo.prjGrpId
							,paramPrjId: sprInfo.prjId
							,paramSprId: sprInfo.sprId
							,paramStartDt: sprInfo.sprStDt
							,paramEndDt: sprInfo.sprEdDt
						};
					var options = {
							modalTitle: "스프린트 시작",
							autoHeight: false,
							modalSize: "xl",
							idKey: datatableId,
							closeConfirm: false,
							ftScrollUse: false
						};
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1003View.do',data,options);
					
					
				},
				
				"sprEnd": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("spr1000.nonSelect"));
						return true;
					}
					
					else if(rowDatas.length > 1){
						$.osl.alert($.osl.lang("spr1000.manySelect"));
						return true;
					}
					
					
					var sprInfo = rowData[0];
					
					
					if(sprInfo.sprTypeCd != "02"){
						$.osl.alert($.osl.lang("spr1000.sprTypeStartMsg"));
						return true;
					}
					
					var data = {
							paramPrjGrpId: sprInfo.prjGrpId
							,paramPrjId: sprInfo.prjId
							,paramSprId: sprInfo.sprId
							,paramSprNm: sprInfo.sprNm
							,paramSprDesc: sprInfo.sprDesc
							,paramStartDt: sprInfo.sprStDt
							,paramEndDt: sprInfo.sprEdDt
						};
					var options = {
							modalTitle: "스프린트 종료",
							autoHeight: false,
							modalSize: "xl",
							idKey: datatableId,
							closeConfirm: false
						};
					$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1004View.do',data,options);
				}
			},
			callback:{
				initComplete: function(evt,config){
					fnViewerChange();
				},
				ajaxDone: function(evt, list){
					var sprintStr = '';
					var rowCnt = 0;
					$.each(list, function(idx, map){
						
						var sprTypeClass = "kt-media--primary";
						var sprTypeNm = map.sprTypeNm;
						
						if(map.sprTypeCd == "02"){
							sprTypeClass = "kt-media--danger";
						}else if(map.sprTypeCd == "03"){
							sprTypeClass = "kt-media--warning";
						}
						
						else if(map.useCd == "02"){
							sprTypeClass = "kt-media--dark";
							sprTypeNm = "미 사용";
						}
						
						if(rowCnt == 0){
							sprintStr += '<div class="row">';
						}
						
						
						sprintStr +=
							'<div class="col-lg-6 col-md-12 col-sm-12">'
								
								+'<div class="kt-portlet kt-portlet--mobile">'
									
									+'<div class="kt-portlet__head kt-portlet__head--lg">'
										
										+'<div class="kt-portlet__head-label">'
											+'<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid"><input type="checkbox" value="'+idx+'" data-datatable-id="spr1000Table">&nbsp;<span></span></label>'
											+'<h5 class="kt-font-boldest"><span class="badge badge-primary kt-margin-r-10">No. '+map.rn+'</span></h5>'
											+'<h5><span class="badge badge-primary" title="스프린트 기간" data-toggle="kt-tooltip" data-skin="brand" data-placement="top"><i class="far fa-calendar-alt kt-margin-r-10"></i>'+map.sprStDt+' ~ '+map.sprEdDt+'</span></h5>'
										+'</div>'
										
										
										+'<div class="kt-portlet__head-toolbar">'
											+'<div class="dropdown dropdown-inline">'
												+'<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'
													+'<i class="fa fa-bars osl-padding-r0"></i>'
												+'</button>'
												+'<div class="dropdown-menu dropdown-menu-right" data-datatable-rownum="'+idx+'">'
													+'<div class="dropdown-item" data-datatable-id="spr1000Table" data-datatable-expans="dropdown" data-datatable-action="update"><i class="fa fa-edit kt-font-brand"></i>'+$.osl.lang("spr1000.menu.update")+'</div>'
													+'<div class="dropdown-item" data-datatable-id="spr1000Table" data-datatable-expans="dropdown" data-datatable-action="delete"><i class="fa fa-trash kt-font-brand"></i>'+$.osl.lang("spr1000.menu.delete")+'</div>'
													+'<div class="dropdown-divider"></div>'
													+'<div class="dropdown-item" data-datatable-id="spr1000Table" data-datatable-expans="dropdown" data-datatable-action="sprStart"><i class="fas fa-play-circle kt-font-brand"></i>'+$.osl.lang("spr1000.menu.sprintStart")+'</div>'
													+'<div class="dropdown-item" data-datatable-id="spr1000Table" data-datatable-expans="dropdown" data-datatable-action="sprEnd"><i class="fas fa-stop-circle kt-font-brand"></i>'+$.osl.lang("spr1000.menu.sprintEnd")+'</div>'
													+'<div class="dropdown-divider"></div>'
													+'<div class="dropdown-item" id=""><i class="fas fa-clipboard-list kt-font-brand"></i>'+$.osl.lang("spr1000.menu.sprintDetail")+'</div>'
													+'<div class="dropdown-divider"></div>'
													+'<div class="dropdown-item" id=""><i class="fas fa-list kt-font-brand"></i>'+$.osl.lang("spr1000.menu.sprintMeetList")+'</div>'
													+'<div class="dropdown-item" id=""><i class="fas fa-list kt-font-brand"></i>'+$.osl.lang("spr1000.menu.sprintResultList")+'</div>'
													+'<div class="dropdown-divider"></div>'
													+'<div class="dropdown-item" id=""><i class="fas fa-print kt-font-brand"></i>'+$.osl.lang("spr1000.menu.sprintReport")+'</div>'
												+'</div>'
											+'</div>'
										+'</div>'
										
									+'</div>'
									
									+'<div class="kt-portlet__body">'
										+'<div class="d-flex kt-padding-l-15 align-items-center">'
											+'<div class="kt-media kt-media--xl kt-media--circle '+sprTypeClass+' osl-margin-r-2rm">'
												+'<span>'+sprTypeNm+'</span>'
											+'</div>'
											+'<div class="d-flex flex-column osl-margin-r-auto">'
												+'<h5 class="kt-font-boldest text-truncate" title="'+$.osl.escapeHtml(map.sprNm)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top"> '+$.osl.escapeHtml(map.sprNm)+'</h5>'
												+'<span class="text-muted text-truncate" title="'+$.osl.escapeHtml(map.sprDesc)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top">'+$.osl.escapeHtml(map.sprDesc)+'</span>'
											+'</div>'
										+'</div>'
										+'<div class="d-flex flex-wrap border-top kt-margin-t-20 kt-padding-t-10">'
											+'<div class="osl-widget osl-flex-row-fluid flex-wrap">'
												+'<div class="osl-widget-info__item osl-flex-row-fluid">'
													+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqAll.png"></div>'
													+'<div class="osl-widget-info__item-info">'
														+'<a href="#" class="osl-widget-info__item-title">'+$.osl.lang("prj1001.requestAll")+'</a>'
														+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqAllCnt)+'</div>'
													+'</div>'
												+'</div>'
												+'<div class="osl-widget-info__item osl-flex-row-fluid">'
													+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqInProgress.png"></div>'
													+'<div class="osl-widget-info__item-info">'
														+'<a href="#" class="osl-widget-info__item-title">'+$.osl.lang("prj1001.requestInProgress")+'</a>'
														+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqProgressCnt)+'</div>'
													+'</div>'
												+'</div>'
												+'<div class="osl-widget-info__item osl-flex-row-fluid">'
													+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqDone.png"></div>'
													+'<div class="osl-widget-info__item-info">'
														+'<a href="#" class="osl-widget-info__item-title">'+$.osl.lang("prj1001.requestDone")+'</a>'
														+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqDoneCnt)+'</div>'
													+'</div>'
												+'</div>'
												+'<div class="osl-widget-info__item osl-flex-row-fluid">'
													+'<div class="osl-widget-info__item-icon"><img src="/media/osl/icon/reqDone.png"></div>'
													+'<div class="osl-widget-info__item-info">'
														+'<a href="#" class="osl-widget-info__item-title">'+$.osl.lang("prj1001.requestDone")+'</a>'
														+'<div class="osl-widget-info__item-desc">'+$.osl.escapeHtml(map.reqDoneCnt)+'</div>'
													+'</div>'
												+'</div>'
											+'</div>'
										+'</div>'
									+'</div>'
									
								+'</div>'
								
							+'</div>';
						
						rowCnt++;
						if(rowCnt == 2){
							sprintStr += '</div>';
							rowCnt = 0;
						}
					});
					
					
					$("#spr1000CardTable").html(sprintStr);
					
					
					KTApp.initTooltips();
				}
			}
		});
		
		
		
		$(".btn-view-type").click(function(){
			var viewType = $(this).data("view-type");
			
			
			$(".btn-view-type.active").removeClass("active");
			$(this).addClass("active");
			
			currentViewType = viewType;
			
			
			fnViewerChange();
		});
		
		
		var fnViewerChange = function(){
			
			
			
			if(currentViewType == "01"){
				$("#spr1000Table .kt-datatable__table").css({visibility: "hidden", height: 0});
				$("#spr1000CardTable").show();
			
			}else{	
				$("#spr1000CardTable").hide();
				$("#spr1000Table .kt-datatable__table").css({visibility: "visible",height: "auto"});
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
	OSLSpr1000Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
