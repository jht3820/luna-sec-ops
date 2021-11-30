<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" id="usrId" name="usrId" value="<c:out value='${param.paramUsrId}' escapeXml='false'/>" />
<input type="hidden" id="prjNm" name="prjNm" value="<c:out value='${param.paramPrjNm}' escapeXml='false'/>" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__body">
		<div class="col-lg-8 col-md-8 col-sm-12 m-auto kt-margin-t-15">
			<div class="osl-datatable-search" data-datatable-id="cmm6000PrjTable"></div>
		</div>
		<div class="kt-datatable" id="cmm6000PrjTable"></div>
		<button type="button" class="btn btn-sm kt-margin-0 kt-padding-0 osl-width-0 invisible" id="selectPrj"/>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
var OSLCmm6000Popup = function () {
	var temp;
    var documentSetting = function () {
    	
		var datatableId = "cmm6000PrjTable";
    	var prjNm = $.osl.escapeHtml($("#prjNm").val());
    	
    	
    	$.osl.datatable.setting(datatableId,{
    		data : {
    			source:{
    				read:{
    					url:"/cmm/cmm6000/cmm6000/selectCmm6000PrjListAjax.do",
    					params:{
    						searchDataTxt : prjNm
    					}
    				}
    			}
    		},
    		columns:[
    			{field: 'rn', title:"No.", textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'upPrjNm', title: '프로젝트 그룹 명', textAlign: 'left', width: 150, search: true, sortable: false},
				{field: 'prjId', title: '프로젝트 Id', textAlign: 'center', width: 150, search: true},
				{field: 'prjNm', title: '프로젝트 명', textAlign: 'left', width: 150, search: true, sortable:false},
				{field: 'startDt', title: '프로젝트 시작일', textAlign: 'left', width: 150, search: true, sortable: true, searchType:"date"},
				{field: 'endDt', title: '프로젝트 종료일', textAlign: 'left', width: 150, sortable: true, search: true, searchType:"date"},
    		],
    		actionBtn:{
    			title : $.osl.lang("cmm6000.actionBtn.title"),
    			width : 80,
    			"update" : false,
    			"delete" : false,
    			"click": true,
    		},
    		actionTooltip:{
    			"click": $.osl.lang("cmm6000.actionBtn.clickBtn"),
    		},
    		actionFn:{
    			"click":function(rowData){
    				temp = rowData;
    				updateMainPrj(temp.prjId);
    				$("#selectPrj").click();
    			}
    		},
    		theme:{
    			actionBtnIcon:{
    				"click": "fa fa-external-link-alt",
    			}
    		}
    	});
    	
    	
    	if(prjNm != ""){
    		
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item.active").attr("class", "dropdown-item");
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=prjNm]").attr("class", "dropdown-item active");
			
			
			$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").parent().children(".btn.btn-secondary.dropdown-toggle").text($.osl.lang("cmm6000.field.prjNm"));
		
			
			$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("style", "display:none;");
			$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("aria-hidden", "true");
			
			
			$("#searchData_"+datatableId).removeAttr("disabled");
			
			$("#searchData_"+datatableId).val(prjNm);

			
			var detailDataTable = $.osl.datatable.list[datatableId].targetDt;
			detailDataTable.setDataSourceParam("searchDataTxt","");
			
    	} 
    	
    	$("#searchData_"+datatableId).on("keypress", function(e){
    		if(e.key == "Enter"){
    			
    			$(".osl-datatable-search__button[data-datatable-id="+datatableId+"]").click();	
    		}
    	});
    	
    	$("#selectPrj").click(function(){
    		$.osl.layerPopupClose();
    	}); 
    };
    
    var updateMainPrj = function(_prjId){
    		var data = {
    				prjId : _prjId
    		}
    		
    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/cmm/cmm6000/cmm6000/updateCmm6000UsrMainPrjAjax.do'/>"}, data);

       		
       		ajaxObj.setFnSuccess(function(data){
       			if(data.errorYn == "Y"){
       				$.osl.alert(data.message,{type: 'error'});
       			}else{
       				
       				$.osl.toastr(data.message);

       				
       				$.osl.layerPopupClose();
       			}
       		});
       		
       		
       		ajaxObj.send();

    }
    return {
        
        init: function() {
        	documentSetting();
        },
        getPrjInfo: function(){
        	return temp.prjNm;
        }
    };
}();


$.osl.ready(function(){
	OSLCmm6000Popup.init();
});

	
</script>