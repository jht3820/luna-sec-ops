<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<input type="hidden" id="sprId" name="sprId" value="${param.sqrId }"/>
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
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="spr1000SprTable" data-datatable-action="select" title="스프린트 조회" data-title-lang-cd="spr1100.actionBtn.tooltip.sprSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-7 col-md-8 col-sm-12 col-12">
						<div class="osl-datatable-search kt-margin-r-10" data-datatable-id="spr1000SprTable"></div>
					</div>
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
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="spr1100.title.assignment">요구사항 배정 목록</span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req1100AssTable" data-datatable-action="select" title="요구사항 배정 조회" data-title-lang-cd="spr1100.actionBtn.title.assSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req1100AssTable" data-datatable-action="removeReq" title="요구사항 배정 제외" data-title-lang-cd="spr1100.actionBtn.tooltip.removeToolTip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="removeReq" tabindex="2">
							<i class="fa fa-arrow-alt-circle-down"></i><span data-lang-cd="spr1100.button.removeBtn">제외</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-5 col-md-6 col-sm-12 col-12">
						<div class="osl-datatable-search kt-margin-r-10" data-datatable-id="req1100AssTable"></div>
					</div>
				</div>
				<div class="kt_datatable osl-datatable-footer__divide" id="req1100AssTable"></div>
			</div>
		</div> 
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="spr1100.title.assignment">요구사항 미배정 목록 </span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req1100NonTable" data-datatable-action="select" title="요구사항 미배정 조회" data-title-lang-cd="spr1100.actionBtn.title.nonSelect" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req1100NonTable" data-datatable-action="addReq" title="요구사항 배정" data-title-lang-cd="spr1100.actionBtn.tooltip.addToolTip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="addReq" tabindex="2">
							<i class="fa fa-arrow-alt-circle-up"></i><span data-lang-cd="spr1100.button.addBtn">배정</span>
						</button>
					</div>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-5 col-md-6 col-sm-12 col-12">
						<div class="osl-datatable-search kt-margin-r-10" data-datatable-id="req1100NonTable"></div>
					</div>
				</div>
				<div class="kt_datatable osl-datatable-footer__divide" id="req1100NonTable"></div>
			</div>
		</div>
	</div> 
</div>

<script>
"use strict";
var OSLSpr1100Popup = function () {
	
	var sprDatatableId = "spr1000SprTable";
	
	var reqAssDatatableId = "req1100AssTable";
	
	var reqNonDatatableId = "req1100NonTable";
	
	var sprTypeCd = 0;
	
	var assList = [];
	
	var nonAssList = [];
	
	var documentSetting = function(){
		
		$.osl.datatable.setting(sprDatatableId,{
			data:{
				source:{
					read:{
						url: "/spr/spr1000/spr1000/selectSpr1000SprListAjax.do",
						params:{
							location:"spr1100"
						}
					}
				}
			},
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'sprTypeNm', title: '상태', textAlign: 'center', width: 80, search: true, searchType:"select", searchCd: "SPR00001", searchField:"sprTypeCd", sortable: true, sortField:"sprTypeCd"},
				{field: 'sprNm', title: '스프린트명', textAlign: 'left', width: 240, autoHide: false, search: true, sortField: "sprNm"},
				{field: 'sprStDt', title: '시작일', textAlign: 'center', width: 120, sortField: "sprStDt",search:true, searchType:"date",
					template: function (row) {
						var paramDatetime = new Date(row.sprStDt);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
				{field: 'sprEdDt', title:'종료일', textAlign: 'center', width: 120, sortField: "sprEdDt", search:true, searchType:"date",
					template: function (row) {
						var paramDatetime = new Date(row.sprEdDt);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}	
				},
			],
			searchColumns:[
				{field: 'sprDesc', title: '스프린트 설명', searchOrd: 3, search:true},
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
			rows:{
				minHeight:50,
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
						selectBtnClick();
						
						
						
						searchReset(reqAssDatatableId);
						
						$("button[data-datatable-id="+reqAssDatatableId+"][data-datatable-action=select]").click();
						
						searchReset(reqNonDatatableId);
						
						$("button[data-datatable-id="+reqNonDatatableId+"][data-datatable-action=select]").click();
					}
				},
				"click": function(rowData){
					$("#sprId").val(rowData.sprId);
					selectBtnClick();
					sprTypeCd = rowData.sprTypeCd;
					
					
					searchReset(reqAssDatatableId);
					
					$("button[data-datatable-id="+reqAssDatatableId+"][data-datatable-action=select]").click();
					
					searchReset(reqNonDatatableId);
					
					$("button[data-datatable-id="+reqNonDatatableId+"][data-datatable-action=select]").click();
					
				}
			}
		});

		
		$.osl.datatable.setting(reqAssDatatableId,{
			data:{
				source:{
					read:{
						url: "/spr/spr1000/spr1100/selectSpr1100AssReqListAjax.do"
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
			columns:[
				{field: 'rn', title: 'No.', textAlign: 'center', width: 80, sortField: "rn"},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 450, autoHide: false, sortField: "reqNm", search:true,
					
				},
				{field: 'reqOrd', title: '순번', textAlign: 'left', width: 80, search:true},
				{field: 'reqProTypeNm', title: '처리유형', textAlign: 'left', width: 80, sortField: "reqProTypeCd", search:true, searchType:"select", searchCd: "REQ00008", searchField:"reqProTypeCd", sortable: true, sortField:"reqProTypeCd"},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 120, sortField: "reqDtm",search:true, searchType:"date",
					template: function (row) {
						var paramDatetime = new Date(row.reqDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				}
			],
			rows:{
				minHeight:50,
			}, 
			actionBtn:{
				"title" : $.osl.lang("spr1100.actionBtn.title.removeBtn"),
				"delete":false,
				"update":false,
				"removeReq":true,
				"dblClick":true,
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("spr1100.actionBtn.tooltip.removeToolTip")
			},
			actionFn:{
				"dblClick": function(rowData){
					if(sprTypeCd != "01"){
						 $.osl.alert("대기중인 스프린트의 요구사항만 제외할 수 있습니다.",{type:"error"});
						 return
					 }
					assList.push(rowData);
					deleteReq($("#sprId").val(), JSON.stringify(assList));
				},
				 "removeReq":function(rowData, datatableId, type){
					 if(sprTypeCd != "01"){
						 $.osl.alert("대기중인 스프린트의 요구사항만 제외할 수 있습니다.",{type:"error"});
						 return
					 }
					assList = rowData;
					deleteReq($("#sprId").val(), JSON.stringify(assList));
				}, 
			},
			 theme:{
				actionBtn:{
					"removeReq" : " kt-hide"
				},
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-down",
				}
			},  
		});
		
		
		$.osl.datatable.setting(reqNonDatatableId,{
			data:{
				source:{
					read:{
						url: "/spr/spr1000/spr1100/selectSpr1100NonAssReqListAjax.do"
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
			columns:[
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 80, sortField: "rn"},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 450, autoHide: false, sortField: "reqNm", search:true,
					
				},
				{field: 'reqOrd', title: '순번', textAlign: 'left', width: 80 ,search:true},
				{field: 'reqProTypeNm', title: '처리유형', textAlign: 'left', width: 80, sortField: "reqProTypeCd", search:true, searchType:"select", searchCd: "REQ00008", searchField:"reqProTypeCd", sortable: true, sortField:"reqProTypeCd"},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 120, sortField: "reqDtm",search:true, searchType:"date",
					template: function (row) {
						var paramDatetime = new Date(row.reqDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				}
			],
			actionBtn:{
				"title" : $.osl.lang("spr1100.actionBtn.title.addBtn"),
				"dblClick": true,
				"addReq" : true,
				"delete":false,
				"update":false,
				"lastPush": false
			},
			actionTooltip:{
				"dblClick" : $.osl.lang("spr1100.actionBtn.tooltip.addToolTip")
			},
			actionFn:{
				"dblClick": function(rowData){
					nonAssList = [];
					nonAssList.push(rowData);
					insertReq($("#sprId").val(), JSON.stringify(nonAssList));
				},
				"addReq":function(rowData, datatableId, type){
					nonAssList = [];
					nonAssList = rowData;
					insertReq($("#sprId").val(), JSON.stringify(nonAssList));
				},
				
			},
			theme:{
				actionBtn:{
					"addReq" : " kt-hide"
				},
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-up",
				}
			}
		});
	};

	
	var selectBtnClick = function(){
		var sprId = $("#sprId").val();
		
		$.osl.datatable.list[reqAssDatatableId].targetDt.setDataSourceParam("sprId", sprId);
		$("button[data-datatable-id="+reqAssDatatableId+"][data-datatable-action=select]").click();
		
		$.osl.datatable.list[reqNonDatatableId].targetDt.setDataSourceParam("sprId", sprId);
		$("button[data-datatable-id="+reqNonDatatableId+"][data-datatable-action=select]").click();
	};
	
	
	var insertReq = function(sprId, list){
		
		
		var sprList = $.osl.datatable.list['spr1000SprTable'].targetDt.lastResponse.data
		$.each(sprList, function(index, value){
			if(sprId == value.sprId){
				
				var data = {
						paramSprId: sprId,
						dataList : list
					};
				if(value.sprTypeCd == "02"){
					var options = {
							idKey:"selectSpr1101",
							autoHeight: false,
							modalSize: "xl",
							closeConfirm: false,
							modalTitle: "스프린트 요구사항 배정",
					};
					$.osl.layerPopupOpen('/spr/spr1000/spr1100/selectSpr1101View.do',data,options);
				}else{
					
					var ajaxObj = new $.osl.ajaxRequestAction(
			    			{"url":"<c:url value='/spr/spr1000/spr1100/insertSpr1100ReqListAjax.do'/>"}
							, data);
					
			    	ajaxObj.setFnSuccess(function(data){
			    		if(data.errorYn == "Y"){
							$.osl.alert(data.message,{type: 'error'});
							
							$.osl.layerPopupClose();
						}else{
							if(list.length>0){
								$.osl.toastr(data.message);
								assList = [];
							}
							selectBtnClick();
						}
			    	});
					
			    	ajaxObj.send();
				} 
			}
		})
	};

	
	var deleteReq = function(sprId, list){
		var data = {
				dataList : list,
				sprId : sprId
		};
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/spr/spr1000/spr1100/deleteSpr1100ReqListAjax.do'/>"}
				, data);
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				if(list.length>0){
					$.osl.toastr(data.message);
					assList = [];
				}
				selectBtnClick();
			}
    	});
		
    	ajaxObj.send();
	}
	
	
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
        }
        
    };
}();

$.osl.ready(function(){
	OSLSpr1100Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
