<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" id="paramReqGrpNm" name=""paramReqGrpNm"" value="<c:out value='${param.reqGrpNm}' escapeXml='false'/>" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__body">
		<div class="col-lg-8 col-md-8 col-sm-12 m-auto kt-margin-t-15">
			<div class="osl-datatable-search" data-datatable-id="req4104ReqGrpTable"></div>
		</div>
		<div class="kt-datatable" id="req4104ReqGrpTable"></div>
		<button type="button" class="btn btn-sm kt-margin-0 kt-padding-0 osl-width-0 invisible" id="selectReqGrp"/>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLReq4104Popup = function () {
	var temp;
    var documentSetting = function () {
		var datatableId = "req4104ReqGrpTable";
    	var name = $.osl.escapeHtml($("#paramReqGrpNm").val());
    	
    	
    	$.osl.datatable.setting(datatableId,{
    		data:{
				source:{
					read:{
						url:"/req/req4000/req4100/selectReq4104ReqGrpListAjax.do",
    					params:{
    						searchDataTxt : name,
    					}
					}
				}
			},
			columns : [
				{field: 'rn', title:"No.", textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'reqGrpNm', title: '그룹 요구사항 명', textAlign: 'left', width: 150, search: true, sortable: false,searchOrd: 1},
				{field: 'reqGrpLinkCnt', title: '연결 요구사항 수', textAlign: 'center', width: 150, search: false,
					template: function (row) {
						var reqGrpLinkCnt = row.reqGrpLinkCnt;
						if(reqGrpLinkCnt == 0){
							reqGrpLinkCnt = "0";
						}
						return reqGrpLinkCnt;
					},
				},
				{field: 'reqGrpUsrNm', title: '요청자 명', textAlign: 'left', width: 150, search: true, sortable:false,searchOrd: 2,
					template: function (row) {
						return $.osl.user.usrImgSet(row.reqUsrImgId, row.reqGrpUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.reqGrpUsrId);
					}
				},
				{field: 'reqGrpUsrEmail', title: '요청자 e-mail', textAlign: 'left', width: 150, search: true, sortable: true,searchOrd: 3},
				{field: 'reqGrpUsrDeptNm', title: '요청자 조직', textAlign: 'left', width: 300, sortable: false, search: false},
				{field: 'reqGrpUsrNum', title: '요청자 연락처', textAlign: 'left', width: 100, search: true, sortable: false, search: true,searchOrd: 4},
				{field: 'regGrpChargerNm', title: '담당자 명', textAlign: 'left', width: 150, search: true,sortable: false,searchOrd: 5,
					template: function (row) {
						return $.osl.user.usrImgSet(row.reqGrpChargerImgId, row.reqGrpChargerNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.reqGrpChargerId);
					}
				},
				{field: 'regDtmDay', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"daterange",searchOrd:10}
			],
			searchColumns:[
				{field: 'reqGrpChargerEmail', title: '담당자 EMAIL', searchType:"text",searchOrd: 6},
				{field: 'reqGrpChargerNum', title: '담당자 연락처', searchType:"text",searchOrd: 7},
				{field: 'reqGrpKey', title: '그룹 요구사항 Key', searchType:"text",searchOrd: 8},
				{field: 'useCD', title: '사용유무', searchType:"select", searchCd:"CMM00001",searchOrd: 9},
			],
    		actionBtn:{
    			title : $.osl.lang("req4104.actionBtn.title"),
    			width : 80,
    			"update" : false,
    			"delete" : false,
    			"click": true,
    		},
    		actionFn:{
    			"click":function(rowData){
    				temp = rowData;
    				$("#selectReqGrp").click();
    			}
    		}
    	});
    	
    	
    	if(name != ""){
    		
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item.active").attr("class", "dropdown-item");
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=reqGrpNm]").attr("class", "dropdown-item active");
			
			
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").parent().children(".btn.btn-secondary.dropdown-toggle").text($.osl.lang("req4104.field.reqGrpNm"));
		
			
			$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("style", "display:none;");
			$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("aria-hidden", "true");
			
			
			$("#searchData_"+datatableId).removeAttr("disabled");
			
			$("#searchData_"+datatableId).val(name);

			
			var detailDataTable = $.osl.datatable.list[datatableId].targetDt;
			
			detailDataTable.setDataSourceParam("searchDataTxt","");
			
    	} 
    	
    	$("#searchData_"+datatableId).on("keypress", function(e){
    		if(e.key == "Enter"){
    			
    			$(".osl-datatable-search__button[data-datatable-id="+datatableId+"]").click();	
    		}
    	});
    	
    	$("#selectReqGrp").click(function(){
    		$.osl.layerPopupClose();
    	});
    };
    
    return {
        
        init: function() {
        	documentSetting();
        },
        getReqGrpInfo: function(){
        	return JSON.stringify(temp);
        }
    };
}();


$.osl.ready(function(){
	OSLReq4104Popup.init();
});

	
</script>