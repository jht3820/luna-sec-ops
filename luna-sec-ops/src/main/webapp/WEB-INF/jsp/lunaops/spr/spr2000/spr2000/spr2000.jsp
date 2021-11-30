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
			<div class="kt-portelt__body">
				<div class="col-lg-8 col-md-8 col-sm-8 col-8 kt-padding-25">
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
						<i class="fa fa-th-large kt-margin-r-5"></i><span id="sprNmStr"></span><span data-lang-cd="spr2000.title">회의록 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2000MmtTable" data-datatable-action="select" title="회의록 조회" data-title-lang-cd="spr2000.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2000MmtTable" data-datatable-action="insert" title="회의록 추가" data-title-lang-cd="spr2000.actionBtn.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
							<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2000MmtTable" data-datatable-action="update" title="회의록 수정" data-title-lang-cd="spr2000.actionBtn.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
							<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2000MmtTable" data-datatable-action="delete" title="회의록 삭제" data-title-lang-cd="spr2000.actionBtn.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
							<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr2000MmtTable" data-datatable-action="dblClick" title="회의록 상세" data-title-lang-cd="spr2000.actionBtn.detailTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="dblClick" tabindex="5">
							<i class="fa flaticon2-document"></i><span data-lang-cd="spr2000.button.detailBtn">상세</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portelt__body">
				<div class="col-lg-8 col-md-8 col-sm-8 col-8 kt-padding-25">
					<div class="osl-datatable-search" data-datatable-id="spr2000MmtTable"></div>
				</div>
				<div class="kt_datatable osl-datatable-footer__divide" id="spr2000MmtTable"></div>
			</div>
		</div> 
	</div>
</div>

<script>
"use strict";
var OSLSpr2000Popup = function () {
	
	var sprDatatableId = "spr1000SprTable";
	
	var mmtDatatableId = "spr2000MmtTable";
	
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
						
						
						
						searchReset(mmtDatatableId);
						
						$("button[data-datatable-id="+mmtDatatableId+"][data-datatable-action=select]").click();
					}
				},
				"click": function(rowData){
					$("#sprId").val(rowData.sprId);
					$("#sprNm").val(rowData.sprNm);
					$("#sprNmStr").text(rowData.sprNm + " ");
					selectBtnClick();
					
					
					searchReset(mmtDatatableId);
					
					$("button[data-datatable-id="+mmtDatatableId+"][data-datatable-action=select]").click();
				}
			}
		});

		
		$.osl.datatable.setting(mmtDatatableId,{
			data:{
				source:{
					read:{
						url: "/spr/spr2000/spr2000/selectSpr2000MmtListAjax.do"
					}
				},
			},
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 80, sortField: "rn"},
				{field: 'mmtNm', title: '회의록명', textAlign: 'left', width: 400, autoHide: false, sortField: "reqNm", search:true},
				{field: 'mmtMemCnt', title: '참여자 수', textAlign: 'center', width: 80,
					template:function(row){
						if($.osl.isNull(row.mmtMemCnt)){
							return 0;
						}else{
							return row.mmtMemCnt;
						}
					}
				},
				{field: 'mmtUsrNm', title: '작성자', textAlign: 'left', width: 120, search:true,
					template: function (row) {
						if($.osl.isNull(row.mmtUsrNm)){
							row.mmtUsrNm = "-";
						}
						var usrData = {
								html: row.mmtUsrNm,
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
						};
						return $.osl.user.usrImgSet(row.mmtUsrImgId, usrData);
					},
					onclick: function(row){
						if($.osl.isNull(row.mmtUsrId)){
							$.osl.alert("없는 회원입니다.");
						}else{
							$.osl.user.usrInfoPopup(row.mmtUsrId);
						}
					}	
				},
				{field: 'mmtDtm', title: '작성일', textAlign: 'center', width: 120, sortField: "reqDtm", search:true, searchType:"daterange",
					template: function (row) {
						var paramDatetime = new Date(row.mmtDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				}
			],
			searchColumns:[
				{field: 'mmtMemId', title: '참여인원ID', searchOrd: 3},
				{field: 'mmtMemNm', title: '참여인원명', searchOrd: 4},
				{field: 'mmtMemEmail', title: '참여인원 이메일', searchOrd: 5},
			],
			actionBtn:{
				"title": $.osl.lang("spr2000.actionBtn.title"),
				"dblClick": true,
			},
			actionTooltip:{
				"update": $.osl.lang("spr2000.actionBtn.updateTooltip"),
				"delete" : $.osl.lang("spr2000.actionBtn.deleteTooltip"),
				"dblClick" : $.osl.lang("spr2000.actionBtn.detailTooltip")
			},
			actionFn:{
				"insert":function(rowData){
					if($.osl.isNull($("#sprId").val())){
						
						$.osl.alert($.osl.lang("spr2000.message.selectMsg"));
						return false;
					}
					var data = {
						type: "insert",
						sprId : $("#sprId").val(),
						sprNm : $("#sprNm").val(),
					};
					var options = {
						idKey: "spr2001_insert",
						modalTitle: "[ "+$.osl.lang("spr2000.title.insertTitle")+" ]",
						closeConfirm: true,
						autoHeight: false,
						modalSize: "xl",
					};
					$.osl.layerPopupOpen('/spr/spr2000/spr2000/saveSpr2001MmtView.do',data,options);
				},
				"update":function(rowData){
					var data = {
							type: "update",
							mmtId : rowData.mmtId,
							sprId : rowData.sprId
						};
						var options = {
							idKey: "spr2001_update",
							modalTitle: "[ "+$.osl.lang("spr2000.title.updateTitle")+" ]",
							closeConfirm: true,
							autoHeight: false,
							modalSize: "xl",
						};
						$.osl.layerPopupOpen('/spr/spr2000/spr2000/saveSpr2001MmtView.do',data,options);
				},
				"delete":function(rowData){
					var data = {
						dataList : JSON.stringify(rowData)
					};
					
			    	var ajaxObj = new $.osl.ajaxRequestAction(
			    			{"url":"<c:url value='/spr/spr2000/spr2000/deleteSpr2000MmtListAjax.do'/>"}
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
							mmtId : rowData.mmtId,
							sprId : rowData.sprId
						};
					var options = {
						idKey: "spr2001_detail",
						modalTitle: "[ "+$.osl.lang("spr2000.title.detailTitle")+" ]",
						closeConfirm: true,
						autoHeight: false,
						modalSize: "xl",
					};
					$.osl.layerPopupOpen('/spr/spr2000/spr2000/selectSpr2002View.do',data,options);
				}
			},
		});
	};
	
	
	var selectBtnClick = function(){
		var sprId = $("#sprId").val();
		$.osl.datatable.list[mmtDatatableId].targetDt.setDataSourceParam("sprId", sprId);
		$("button[data-datatable-id="+mmtDatatableId+"][data-datatable-action=select]").click();
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
	OSLSpr2000Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
