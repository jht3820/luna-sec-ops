<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6206">
	<input type="hidden" id="paramReqNm" name="paramReqNm" value="<c:out value='${param.reqNm}'/>" />
	<input type="hidden" id="paramReqProType" name="paramReqProType" value="${param.paramReqProType}" />
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__body">
			<div class="col-lg-8 col-md-8 col-sm-12 m-auto kt-margin-t-15">
				<div class="osl-datatable-search" data-datatable-id="cmm6206ReqTable"></div>
			</div>
			<div class="kt-datatable" id="cmm6206ReqTable"></div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-brand" id="cmm6206SaveSubmit"><i class="fa fa-check-square"></i><span class="osl-resize__display--show" data-lang-cd="common.name.select">선택</span></button>
		<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
	</div>
</form>
<script>
"use strict";
var OSLCmm6206Popup = function () {
	
	var selReqList = [];
	
    var documentSetting = function () {
		var datatableId = "cmm6206ReqTable";
    	var paramReqNm = $.osl.escapeHtml($("#frCmm6206 > #paramReqNm").val());
    	var paramReqProType = $("#frCmm6206 > #paramReqProType").val();
    	
    	
    	$.osl.datatable.setting(datatableId,{
    		data : {
    			source:{
    				read:{
    					url:"/req/req4000/req4100/selectReq4100ReqListAjax.do",
    					params:{
    						searchTargetId : "reqNm",
    						searchTargetData : paramReqNm,
    						paramReqProType: paramReqProType
    					}
    				}
    			}
    		},
    		columns:[
    			{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false,
    				template: function(row){
    					return row.prjId+"_"+row.reqId;
    				}	
    			},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'prjNm', title:'프로젝트명', textAlign: 'left', width: 150, autoHide: false, search: true},
				{field: 'reqOrd', title: '요청번호', textAlign: 'left', width: 110, autoHide: false},
				{field: 'reqProTypeNm', title:'처리유형', textAlign: 'left', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProType", sortField: "reqProType"},
				{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 340, search: true, autoHide: false,
					template: function(row){
						var resultStr = $.osl.escapeHtml(row.reqNm);
						
						if(row.reqPw == "Y"){
							resultStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
						}
						return resultStr;
					}
				},
				{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 100, search: true, searchType:"date"},
				{field: 'regDtm', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"date",
					template: function (row) {
						var paramDatetime = new Date(row.regDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
				{field: 'reqUsrNm', title: '요청자', textAlign: 'center', width: 120, search: true,
					template: function (row) {
						if($.osl.isNull(row.reqUsrNm)){
							row.reqUsrNm = "";
						}
						var usrData = {
							html: row.reqUsrNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
						};
						return $.osl.user.usrImgSet(row.reqUsrImgId, usrData);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.reqUsrId);
					}
				},
				{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 120, search: true,
					template: function (row) {
						if($.osl.isNull(row.reqChargerNm)){
							row.reqChargerNm = "";
						}
						var usrData = {
							html: row.reqChargerNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
						};
						return $.osl.user.usrImgSet(row.reqChargerImgId, usrData);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.reqChargerId);
					}
				},
				{field: 'reqUsrEmail', title:'요청자e-mail', textAlign: 'left', width: 180, search: true},
				{field: 'reqUsrDeptNm', title:'요청자 조직', textAlign: 'center', width: 300, sortable: false},
				{field: 'reqUsrNum', title: '요청자 연락처', textAlign: 'center', width: 100, search: true},
				{field: 'reqKey', title: '요구사항 key', textAlign: 'center', width: 300, sortable: false, search: true}
    		],
    		actionBtn:{
    			"update" : false,
    			"delete" : false,
    		},
			actionFn:{
    		},
    		callback:{
    			"onCheck": function(evt, ids, datatableInfo){
    				if(ids.length > 0){
    					$.each(ids, function(idx, map){
    						var prjId = map.split("_")[0];
    						var reqId = map.split("_")[1];
    						
    						selReqList.push({prjId: prjId, reqId: reqId});
    					});
    				}
    			},
	    		"unCheck": function(evt, ids, datatableInfo){
					
	    			if(ids.length > 0){
	    				$.each(ids, function(idx, map){
    						var prjId = map.split("_")[0];
    						var reqId = map.split("_")[1];
    						
    						$.each(selReqList, function(subIdx, subMap){
    							
    							if(prjId == subMap.prjId && reqId == subMap.reqId){
    								selReqList.splice(subIdx, 1);
    								return false;
    							}
    						});
    					});
	    			}
				}
    		}
    	});
    	
    	$("#searchData_"+datatableId).on("keypress", function(e){
    		if(e.keyCode == 13){
    			
    			$(".osl-datatable-search__button[data-datatable-id="+datatableId+"]").click();	
    		}
    	});
    	
    	$("#cmm6206SaveSubmit").click(function(){
    		$.osl.layerPopupClose();
    	});
    };
    
    return {
        
        init: function() {
        	documentSetting();
        },
        getSelReqList: function(){
        	return selReqList;
        }
    };
}();


$.osl.ready(function(){
	OSLCmm6206Popup.init();
});

	
</script>