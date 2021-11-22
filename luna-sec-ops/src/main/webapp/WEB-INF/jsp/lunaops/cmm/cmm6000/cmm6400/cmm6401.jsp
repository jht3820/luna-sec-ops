<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" id="paramUsrNm" name="paramUsrNm" value="<c:out value='${param.usrNm}' escapeXml='false'/>" />
<input type="hidden" id="paramPrjId" name="paramPrjId" value="<c:out value='${param.paramPrjId }' escapeXml='false'/>">
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__body">
		<div class="col-lg-8 col-md-8 col-sm-12 m-auto kt-margin-t-15">
			<div class="osl-datatable-search" data-datatable-id="cmm6401Table"></div>
		</div>
		<div class="kt-datatable" id="cmm6401Table"></div>
		<button type="button" class="btn btn-sm kt-margin-0 kt-padding-0 osl-width-0 invisible" id="selectUsr"/>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLCmm6401Popup = function () {
	var temp;
	
	
	var paramPrjId = $("#paramPrjId").val();
	
    var documentSetting = function () {
		var datatableId = "cmm6401Table";
    	var name = $.osl.escapeHtml($("#paramUsrNm").val());
    	
    	
    	$.osl.datatable.setting(datatableId,{
    		data : {
    			source:{
    				read:{
    					url:"/cmm/cmm6000/cmm6400/selectCmm6401UsrListAjax.do",
    					params:{
    						searchDataTxt : name,
    						paramPrjId : paramPrjId
    					}
    				}
    			}
    		},
    		columns:[
    			{field:'rn', title:'No.', textAlign:'center', width: 50},
    			{field:'usrNm', title:'사용자명', textAlign:'left', width: 120, autoHide:false, search:true,
    				template: function (row){
    					var usrData = {
								html: row.usrNm,
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
						};
						return $.osl.user.usrImgSet(row.usrImgId, usrData);
    				},
					onclick: function(row){
						$.osl.user.usrInfoPopup(row.usrId);
					}
    			},
    			{field:'usrId', title:'아이디', textAlign:'left', width: 180, search:true},
    			{field:'email', title:'이메일', textAlign:'left', width: 240, search:true},
    			{field:'telno', title:'연락처', textAlign:'left', width: 180, search:true},
    			{field:'deptName', title:'소속', textAlign:'left', width: 240, autoHide:false, search:true}
    		],
    		actionBtn:{
    			title : $.osl.lang("cmm6401.actionBtn.title"),
    			width : 80,
    			"update" : false,
    			"delete" : false,
    			"click": true,
    		},
    		actionTooltip:{
    			"click": $.osl.lang("cmm6401.actionBtn.clickBtn"),
    		},
    		actionFn:{
    			"click":function(rowData){
    				temp = rowData;
    				$("#selectUsr").click();
    			}
    		}
    	});
    	
    	
    	if(!$.osl.isNull(name)){
    		var menus = $(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]");
			menus.find("a.dropdown-item[data-field-id=-1]").attr("class", "dropdown-item");
			menus.children("a.dropdown-item[data-field-id=usrNm]").attr("class", "dropdown-item active");
			
			menus.siblings(".btn.btn-secondary.dropdown-toggle").text($.osl.lang("cmm6401.field.usrNm"));
		 
			
			menus.attr("aria-hidden", "true");
			 
			
			$("#searchData_"+datatableId).removeAttr("disabled");
			
			$("#searchData_"+datatableId).val(name);

			
			var detailDataTable = $.osl.datatable.list[datatableId].targetDt;
			detailDataTable.setDataSourceParam("searchDataTxt","");
    	}
     
    	$("#searchData_"+datatableId).on("keypress", function(e){
    		if(e.keyCode=='13'){
    			
    			$(".osl-datatable-search__button[data-datatable-id="+datatableId+"]").click();	
    		}
    	});
    	
    	$("#selectUsr").click(function(){
    		$.osl.layerPopupClose();
    	});
    };
    
    return {
        
        init: function() {
        	documentSetting();
        },
        getUsrInfo: function(){
        	return JSON.stringify(temp);
        }
    };
}();


$.osl.ready(function(){
	OSLCmm6401Popup.init();
});

	
</script>