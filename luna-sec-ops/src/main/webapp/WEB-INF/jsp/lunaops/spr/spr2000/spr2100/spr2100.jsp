<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<input type="hidden" id="sprId" name="sprId" value="${param.sqrId }"/>
<input type="hidden" id="sprNm" name="sprNm" value="${param.sqrNm }"/>
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-5 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="spr1100.title.sprint">스프린트 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr1000SprTable" data-datatable-action="select" title="스프린트 조회" data-title-lang-cd="spr1100.actionBtn.title.sprSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="col-lg-8 col-md-8 col-sm-8 col-8 kt-padding-l-25">
					<div class="osl-datatable-search" data-datatable-id="spr1000SprTable"></div>
				</div>
				<div class="kt_datatable osl-datatable-footer__divide" id="spr1000SprTable"></div>
			</div>
		</div>
	</div> 
	
	<div class="col-lg-7 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span id="sprNmStr"></span><span data-lang-cd="spr2100.title">회고록 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2100RptTable" data-datatable-action="select" title="회고록 조회" data-title-lang-cd="spr2100.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2100RptTable" data-datatable-action="insert" title="회고록 추가" data-title-lang-cd="spr2100.actionBtn.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
							<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2100RptTable" data-datatable-action="update" title="회고록 수정" data-title-lang-cd="spr2100.actionBtn.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
							<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2100RptTable" data-datatable-action="delete" title="회고록 삭제" data-title-lang-cd="spr2100.actionBtn.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
							<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2100RptTable" data-datatable-action="dblClick" title="회고록 상세" data-title-lang-cd="spr2100.actionBtn.detailTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="dblClick" tabindex="5">
							<i class="fa flaticon2-document"></i><span data-lang-cd="spr2100.button.detailBtn">상세</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="col-lg-8 col-md-8 col-sm-8 col-8 kt-padding-l-25">
					<div class="osl-datatable-search" data-datatable-id="spr2100RptTable"></div>
				</div>
				<div class="kt_datatable" id="spr2100RptTable"></div>
			</div>
		</div> 
	</div>
</div>

<script>
"use strict";
var OSLSpr2100Popup = function () {
	
	var sprDatatableId = "spr1000SprTable";
	
	var mmrDatatableId = "spr2100RptTable";
	
	var documentSetting = function(){
		
		$.osl.datatable.setting(sprDatatableId,{
			data:{
				source:{
					read:{
						url: "/spr/spr1000/spr1000/selectSpr1000SprListAjax.do"
					}
				}
			},
			columns:[
				{field: 'sprTypeNm', title: '상태', textAlign: 'center', width: 80, search: true, searchType:"select", searchCd: "SPR00001", searchField:"sprTypeCd", sortable: true, sortField:"sprTypeCd"},
				{field: 'sprNm', title: '스프린트명', textAlign: 'left', width: 240, autoHide: false, search: true, sortField: "sprNm"},
				{field: 'sprStDt', title: '시작일', textAlign: 'center', width: 120, sortField: "sprStDt",
					template: function (row) {
						var paramDatetime = new Date(row.sprStDt);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
				{field: 'sprEdDt', title:'종료일', textAlign: 'center', width: 120, sortField: "sprEdDt",
					template: function (row) {
						var paramDatetime = new Date(row.sprEdDt);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}	
				},
			],
			searchColumns:[
				{field: 'sprDesc', title: '스프린트 설명', searchOrd: 3},
				{field: 'sprDtm', title: '기간', searchOrd:4, searchType:"daterange"}
			],
			actionBtn:{
				"title" : $.osl.lang("spr1100.actionBtn.title.selectBtn"),
				"click": true,
				"delete":false,
				"update":false,
			},
			actionTooltip:{
				"click" : $.osl.lang("spr1100.actionBtn.tooltip.clickToolTip"),
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
						
						
						$("#sprId").val("");
						$("#sprNm").val("");
						$("#sprNmStr").text("");
						selectBtnClick();
						
						
						
						searchReset(mmrDatatableId);
						
						$("button[data-datatable-id="+mmrDatatableId+"][data-datatable-action=select]").click();
						
					}
				},
				"click": function(rowData){
					$("#sprId").val(rowData.sprId);
					$("#sprNm").val(rowData.sprNm);
					$("#sprNmStr").text(rowData.sprNm + " ");
					selectBtnClick();
					
					
					searchReset(mmrDatatableId);
					
					$("button[data-datatable-id="+mmrDatatableId+"][data-datatable-action=select]").click();
				}
			}
		});

		
		$.osl.datatable.setting(mmrDatatableId,{
			data:{
				source:{
					read:{
						url: "/spr/spr2000/spr2100/selectSpr2100MmrListAjax.do"
					}
				},
			},
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 80, sortField: "rn"},
				{field: 'mmrNm', title: '회고록 제목', textAlign: 'left', width: 80, search:true},
				{field: 'mmrUsrNm', title: '작성자', textAlign: 'left', width: 80, search:true,
					template: function (row) {
						if($.osl.isNull(row.mmrUsrNm)){
							row.mmrUsrNm = "-";
						}
						var usrData = {
								html: row.mmrUsrNm,
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
						};
						return $.osl.user.usrImgSet(row.mmrUsrImgId, usrData);
					},
					onclick: function(row){
						if($.osl.isNull(row.mmrUsrId)){
							$.osl.alert("없는 회원입니다.");
						}else{
							$.osl.user.usrInfoPopup(row.mmrUsrId);
						}
					}	
				},
				{field: 'mmrDtm', title: '작성일', textAlign: 'center', width: 120, sortField: "reqDtm", search:true, searchType:"daterange",
					template: function (row) {
						var paramDatetime = new Date(row.mmrDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				}
			],
			actionBtn:{
				"title": $.osl.lang("spr2100.actionBtn.title"),
				"dblClick": true,
			},
			actionTooltip:{
				"update": $.osl.lang("spr2100.actionBtn.updateTooltip"),
				"delete" : $.osl.lang("spr2100.actionBtn.deleteTooltip"),
				"dblClick" : $.osl.lang("spr2100.actionBtn.detailTooltip")
			},
			actionFn:{
				"insert":function(rowData){
					if($.osl.isNull($("#sprId").val())){
						
						$.osl.alert($.osl.lang("spr2100.message.selectMsg"));
						return false;
					}
					var data = {
						type: "insert",
						sprId : $("#sprId").val(),
						sprNm : $("#sprNm").val(),
					};
					var options = {
						idKey: "spr2101_insert",
						modalTitle: "[ "+$.osl.lang("spr2100.title.insertTitle")+" ]",
						closeConfirm: true,
						autoHeight: false,
						modalSize: "xl",
					};
					$.osl.layerPopupOpen('/spr/spr2000/spr2100/saveSpr2101MmrView.do',data,options);
				},
				"update":function(rowData){
					var data = {
							type: "update",
							mmrId : rowData.mmrId,
							sprId : rowData.sprId
						};
						var options = {
							idKey: "spr2101_update",
							modalTitle: "[ "+$.osl.lang("spr2100.title.updateTitle")+" ]",
							closeConfirm: true,
							autoHeight: false,
							modalSize: "xl",
						};
						$.osl.layerPopupOpen('/spr/spr2000/spr2100/saveSpr2101MmrView.do',data,options);
				},
				"delete":function(rowData){
					var data = {
						dataList : JSON.stringify(rowData)
					};
					
			    	var ajaxObj = new $.osl.ajaxRequestAction(
			    			{"url":"<c:url value='/spr/spr2000/spr2100/deleteSpr2100MmrListAjax.do'/>"}
			    				, data);
					
			    	ajaxObj.setFnSuccess(function(data){
			    		if(data.errorYn == "Y"){
							$.osl.alert(data.message,{type: 'error'});
							
							$.osl.layerPopupClose();
						}else{
							$.osl.toastr(data.message);
							selectBtnClick();
						}
			    	});
			    	
					ajaxObj.send();
				},
				"dblClick": function(rowData){
					var data = {
							type: "update",
							mmrId : rowData.mmrId,
							sprId : rowData.sprId
						};
					var options = {
						idKey: "spr2101_detail",
						modalTitle: "[ "+$.osl.lang("spr2100.title.detailTitle")+" ]",
						closeConfirm: true,
						autoHeight: false,
						modalSize: "xl",
					};
					$.osl.layerPopupOpen('/spr/spr2000/spr2100/selectSpr2102View.do',data,options);
				}
			},
		});
	};
	
	
	var selectBtnClick = function(){
		var sprId = $("#sprId").val();
		$.osl.datatable.list[mmrDatatableId].targetDt.setDataSourceParam("sprId", sprId);
		$("button[data-datatable-id="+mmrDatatableId+"][data-datatable-action=select]").click();
	};
	
	
	var searchReset = function(datatableId){
		
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item.active").attr("class", "dropdown-item");
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=-1]").attr("class", "dropdown-item active");
		
		
		var searchBarMenuStr = $(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=-1]").text();
		
		
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").parent().children(".btn.btn-secondary.dropdown-toggle").text(searchBarMenuStr);
		
		
		$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("style", "display:none;");
		$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("aria-hidden", "true");
		
		
		$("#searchData_"+datatableId).removeAttr("readonly");
		
		$("#searchData_"+datatableId).parent().children("span").children().children().removeClass("la-calendar");
		
		
		$("#searchData_"+datatableId).val("");

		
		
		$("#searchData_"+datatableId).attr("disabled","disabled");
	};
	
	return {
        
        init: function() {
        	documentSetting();
        },
		reload: function() {
    		selectBtnClick();
    	}
    };
}();

$.osl.ready(function(){
	OSLSpr2100Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
