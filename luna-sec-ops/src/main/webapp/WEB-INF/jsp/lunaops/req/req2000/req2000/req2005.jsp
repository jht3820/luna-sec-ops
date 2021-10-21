<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form class="kt-form" id="">
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h4 class="kt-font-boldest kt-font-brand">
							<i class="fas fa-info-circle kt-margin-r-5"></i>구성항목 배정 목록
						</h4>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req2005ConfigurationTable" data-datatable-action="select" title="데이터 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req2005ConfigurationTable" data-datatable-action="selAllUsrDelete" title="선택 사용자 배정 제외" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1">
								<i class="fa fa-arrow-alt-circle-right"></i><span>제외</span>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">	
					<div class="kt_datatable" id="req2005ConfigurationTable"></div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h4 class="kt-font-boldest kt-font-brand">
							<i class="fas fa-info-circle kt-margin-r-5"></i>구성항목 미 배정 목록
						</h4>
					</div>	
					
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req2005AllConfigurationTable" data-datatable-action="selAllUsrDelete" title="선택 사용자 배정 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1" id="">
							
								<i class="fa fa-arrow-alt-circle-left"></i><span>배정</span>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="req2005AllConfigurationTable" data-datatable-action="select" title="데이터 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">	
					<div class="kt_datatable" id="req2005AllConfigurationTable"></div>
				</div>
			</div>
		</div>
	</div>
	
	
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id=""><i class="fa fa-save"></i>
	<span class="osl-resize__display--show">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>


<script>
"use strict";
var OSLReq2005Popup = function () {
	var documentSetting = function(){
		
		
		$.osl.datatable.setting("req2005ConfigurationTable",{
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
				{field: 'deptName', title: '구성항목 명', textAlign: 'center', width: 70}
			],
			actionBtn:{
				"title": "제외",
				"update": false,
				"delete": false,
				"dblClick": true
			},
			actionTooltip:{
				"dblClick": "구성항목 배정 제외"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-right",
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					debugger;
					var rowDatas = [];
					rowDatas.push(rowData);
					
					fnAllUsrDelete(rowDatas);
				},
				
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					var rowDatas = rowData;
					
					
						
						
					
					
					
						
							
							fnAllUsrDelete(rowDatas);
						
					
				}
			}
		});
		
		
				
		
		$.osl.datatable.setting("req2005AllConfigurationTable",{
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
				{field: 'deptName', title: '구성항목 명', textAlign: 'center', width: 70}
			],
			actionBtn:{
				"title": "제외",
				"update": false,
				"delete": false,
				"dblClick": true
			},
			actionTooltip:{
				"dblClick": "구성항목 배정 등록"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-left",
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					console.log(data);
					var rowDatas = [];
					rowDatas.push(rowData);
					
					fnAllUsrInsert(rowDatas);
				},
				
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					
					
					
						
						
					
					
					
						
							
							fnAllUsrInsert(rowDatas);
						
					
				}
			}
		});
		
		
	};
	
	var fnAllUsrInsert = function(rowDatas){
		
		
				
				
		
		
			
   				
   			
   				
   				
   				
   				
				var inUsrDataTable = $.osl.datatable.list["req2005ConfigurationTable"].targetDt;
				var allUsrDataTable = $.osl.datatable.list["req2005AllConfigurationTable"].targetDt;
				
				
				
				
   			
		
		
		
		
	}
	
	
	var fnAllUsrDelete = function(rowDatas){
		
		
				
				
		
		
			
   				
   			
   				
   				
   				
   				
				var inUsrDataTable = $.osl.datatable.list["req2005ConfigurationTable"].targetDt;
				var allUsrDataTable = $.osl.datatable.list["req2005AllConfigurationTable"].targetDt;
				
				
				
				
   			
		
		
		
		
	}
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLReq2005Popup.init();
});
</script>

