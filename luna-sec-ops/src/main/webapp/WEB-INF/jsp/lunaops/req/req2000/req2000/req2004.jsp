<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form class="kt-form" id="">
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
		<div class="kt-portlet__body">	
			<div class="kt_datatable" id="req2004Table"></div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id=""><i class="fa fa-save"></i><span class="osl-resize__display--show">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>


<script>
"use strict";
var OSLReq2004Popup = function () {
	var documentSetting = function(){
		
		
		$.osl.datatable.setting("req2004Table",{
			data: {
				source: {
					read: {
						
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				
				 pageSize : 5,
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100]
					 }
				 }
			 },
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false},
				{field: '', title: '항목 명', textAlign: 'center', width: 100},
				{field: '', title: '필수', textAlign: 'center', width: 50},
				{field: '', title: '항목 타입', textAlign: 'center', width: 70},
				{field: '', title: '열 넓이', textAlign: 'center', width: 50},
				{field: '', title: '순서', textAlign: 'center', width: 50},
			],
			actionBtn:{
				"dblClick": false
			}
		});
		
		
	};
	
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLReq2004Popup.init();
});
</script>

