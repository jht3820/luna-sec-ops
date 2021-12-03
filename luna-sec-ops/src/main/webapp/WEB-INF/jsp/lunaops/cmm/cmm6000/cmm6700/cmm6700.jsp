<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6700">
	<input type="hidden" id="paramDplNm" name="paramDplNm" value="<c:out value='${param.dplNm}'/>" />
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__body">
			<div class="col-lg-8 col-md-8 col-sm-12 m-auto kt-margin-t-15">
				<div class="osl-datatable-search" data-datatable-id="cmm6700DplTable"></div>
			</div>
			<div class="kt-datatable" id="cmm6700DplTable"></div>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-brand invisible" id="selectDplBtn"></button>
		<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
	</div>
</form>
<script>
"use strict";
var OSLCmm6700Popup = function () {
	
	
	var selDplData;
	
    var documentSetting = function () {
    	
		var datatableId = "cmm6700DplTable";
		
		
    	var paramDplNm = $.osl.escapeHtml($("#frCmm6700 > #paramDplNm").val());
    	
    	
    	$.osl.datatable.setting(datatableId,{
    		data : {
    			source:{
    				read:{
    					url:"/dpl/dpl1000/dpl1000/selectDpl1000DplListAjax.do",
    					params:{
    						paramSearchData : paramDplNm,
    						paramDplStsCd: '01' 
    					}
    				}
    			}
    		},
    		columns:[
    			{field: 'dplSignUseNm', title: '결재 사용 유무', textAlign: 'center', width: 110, search: true, searchType:"select", searchCd: "CMM00001", searchField:"dplSignUseCd", sortField: "dplSignUseCd"},
				{field: 'nowSignTypeNm', title: '결재 상태', textAlign: 'center', width: 90, search: true, searchType:"select", searchCd: "CMM00008", searchField:"nowSignTypeCd", sortField: "nowSignTypeCd"
					,template: function(row){
						var nowSignTypeNm = row.nowSignTypeNm
						if($.osl.isNull(nowSignTypeNm)){
							nowSignTypeNm = "-";
						}
						return nowSignTypeNm;
					}	
				},
				{field: 'lastSignUsrNm', title: '결재자', textAlign: 'center', width: 100, search: true
					,template: function(row){
						var lastSignUsrNm = row.lastSignUsrNm
						
						if($.osl.isNull(lastSignUsrNm)){
							lastSignUsrNm = "-";
						}else{
							
							lastSignUsrNm = $.osl.user.usrImgSet(row.lastSignUsrId, row.lastSignUsrNm);
						}
						return lastSignUsrNm;
					},
					onclick: function(rowData){
						
						if(!$.osl.isNull(rowData.lastSignUsrId)){
							
							$.osl.user.usrInfoPopup(rowData.lastSignUsrId);
						}
					}
				},
				{field: 'dplStsNm', title: '배포 상태', textAlign: 'center', width: 90, autoHide: false, search: true, searchType:"select", searchCd: "DPL00001", searchField:"dplStsCd", sortField: "dplStsCd"},
				{field: 'dplVer', title: '배포 버전', textAlign: 'center', width: 100, search: true},
				{field: 'dplNm', title: '배포 명', textAlign: 'left', width: 280, autoHide: false, search: true},
				{field: 'dplTypeNm', title: '배포 방법', textAlign: 'center', width: 70, autoHide: false, search: true, searchType:"select", searchCd: "DPL00003", searchField:"dplTypeCd", sortField: "dplTypeCd"},
				{field: 'dplRevisionNum', title: '배포 리비전 번호', textAlign: 'center', width: 100
					,template: function(row){
						var dplRevisionNum = row.dplRevisionNum;
						
						if($.osl.isNull(dplRevisionNum)){
							dplRevisionNum = "Last Revision";
						}
						return dplRevisionNum;
					}
				},
				{field: 'dplDt', title: '배포 일자', textAlign: 'center', width: 100, search: true, searchType:"daterange"},
				{field: 'dplUsrNm', title: '배포자', textAlign: 'center', width: 100, search: true
					,template: function (row) {
						return $.osl.user.usrImgSet(row.dplUsrImgId, row.dplUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.dplUsrId);
					}
				}
    		],
    		searchColumns:[
				{field: 'dplDesc', title:"배포 설명", searchOrd: 8}
			],
    		actionBtn:{
    			title : $.osl.lang("cmm6600.label.actionBtn"),
    			width : 80,
    			"insert" : false,
    			"update" : false,
    			"delete" : false,
    			"click" : true
    		},
			actionFn:{
				"click": function(rowData, datatableId, type, rowNum, elem){
					
					selDplData = rowData;
					
					$("#selectDplBtn").click();
				},
    		},
    		actionTooltip:{
    			"click": $.osl.lang("cmm6600.tooltip.click"),
    		}
    	});
    	
    	
    	if(!$.osl.isNull(paramDplNm)){
    		
    		var dropDownMenus = $(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]");
    		dropDownMenus.find("a.dropdown-item[data-field-id=-1]").attr("class", "dropdown-item");
    		dropDownMenus.children("a.dropdown-item[data-field-id=dplNm]").attr("class", "dropdown-item active");
    		
			
			dropDownMenus.siblings(".btn.btn-secondary.dropdown-toggle").text($.osl.lang("cmm6600.label.selDropDownMenu"));
		 
			
			dropDownMenus.attr("aria-hidden", "true");
			 
			
			$("#searchData_"+datatableId).removeAttr("disabled");
			
			$("#searchData_"+datatableId).val(paramDplNm);

			
			var cmm6700DataTable = $.osl.datatable.list[datatableId].targetDt;
			cmm6700DataTable.setDataSourceParam("paramSearchData", "");
    	}
    	
    	$("#searchData_"+datatableId).on("keypress", function(e){
    		if(e.keyCode == 13){
    			
    			$(".osl-datatable-search__button[data-datatable-id="+datatableId+"]").click();	
    		}
    	});
    	
    	
    	$("#selectDplBtn").click(function(){
    		$.osl.layerPopupClose();
    	});
    };
    
    return {
        
        init: function() {
        	documentSetting();
        },
        getSelDplInfo: function(){
        	return selDplData;
        }
    };
}();


$.osl.ready(function(){
	OSLCmm6700Popup.init();
});

	
</script>