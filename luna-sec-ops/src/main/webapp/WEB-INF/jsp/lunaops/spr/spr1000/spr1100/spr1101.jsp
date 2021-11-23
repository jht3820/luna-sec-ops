<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form class="kt-form" id="frSpr1101">
	<input type="hidden" name="modalId" id="modalId" value="${param.modalId}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramSprId" id="paramSprId" value="${param.paramSprId}">
	<input type="hidden" name="paramStartDt" id="paramStartDt" value="${param.paramStartDt}">
	<input type="hidden" name="paramEndDt" id="paramEndDt" value="${param.paramEndDt}">
	<input type="hidden" name="dataList" id="dataList" value='${param.dataList}'>
	<button class="osl-user__active--block" id="reloadTable"></button>
	<div class="row">
		<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="">배정요구사항</span>
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="osl-datatable-search" data-datatable-id="sprAssignReqUsrTable"></div>
					<div class="kt_datatable" id="sprAssignReqUsrTable"></div>
				</div>
			</div>
		</div>
		<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet ">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="">담당자</span>
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="osl-datatable-search" data-datatable-id="sprUstListTable"></div>
					<div id="sprUstListCardTable"></div>
					<div class="kt_datatable osl-datatable-footer__divide" id="sprUstListTable"></div>
				</div>
			</div>
		</div>
	</div>
</form>
	
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="updateSpr1100Btn">
		<i class="fa fa-save"></i><span class="osl-resize__display--show">완료</span>
	</button>
	
	<button class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span>
	</button>
</div>
	



<script>
"use strict";
var OSLSpr1101Popup = function () {
	
	var mainFormId = 'frSpr1101';
	
	
	var paramSprId = $("#paramSprId").val();
	
	var dataList = $("#dataList").val();
	
	var msg = 0;
	
	var reqListCnt = 0;
	var insertParam = {
			reqSprPointList : {},
			reqUsrList : {}
	}
	
	
	var formValidate = $.osl.validate(mainFormId);
	
	var documentSetting = function(){
		
		$.osl.datatable.setting("sprAssignReqUsrTable",{
			data: {
				type:'local',
				serverSorting: false,
				serverPaging: false,
				source: [],
				pageSize: 5
			},
			toolbar:{
				 items:{
					 pagination:{
						 pageSizeSelect : [5, 10, 20, 30, 50, 100],
						
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 3
							}
						}
					 }
				 }
			 },
			columns: [
				{field: 'reqOrd', title: '순번', textAlign: 'center', width: 50, search: true},
				{field: 'reqNm', title: '요청 제목', textAlign: 'center', width: 100, search: true},
				{field: 'sprPoint', title: '스토리 포인트', textAlign: 'center', width: 80,template:function(row){
					
					var rtnVal = "";
					
					if(row.sprPoint != null){
						rtnVal = row.sprPoint;
					} 
					
					return '<input type="text" class="form-control kt-align-center" name="sprPoint_'+row.reqId+'" id="sprPoint_'+row.reqId+'" min="0" max="999" maxlength="3" value="'+rtnVal+'"/>';
				}},
				{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 80, template:function(row){
					var rtnVal = "";
					
					if(row.reqChargerNm != null){
						rtnVal = row.reqChargerNm;
						return rtnVal;
					}else if(row.reqChargerNm == null){
						rtnVal == "";
					}
					return '<input type="text" class="form-control kt-align-center" name="reqCharger_'+row.reqId+'" id="reqCharger_'+row.reqId+'" data-req-id="'+row.reqId+'" value="'+rtnVal+'" readonly="readonly" />';
				}},
			],rows:{
				afterTemplate: function(row, data, index){
					
					
					var targetInput = row.find("input#sprPoint_"+data.reqId);
					
					targetInput.off("blur").on("blur", function(e){
						
						var inputVal = 0;
						
						this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
						
						if(this.value < 0){
							this.value = 0;
						}
						inputVal = this.value;
						
						if(!isNaN(inputVal)){
							
							insertParam['reqSprPointList'][data.reqId] = inputVal;
							
						}
						else if(targetInput.val() == ""){
							
							insertParam['reqSprPointList'][data.reqId] = null;
							
						}
						
					});
					
				}
			},
			actionBtn:{
				"update": false,
				"delete": false,
				"dblClick": false
			}
		});
		
		
		$.osl.datatable.setting("sprUstListTable",{
			cardUiTarget: $("#sprUstListCardTable"),
			data: {
				source: {
					read: {
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				pageSize : 4
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100],
						
						pages: {
							desktop: {
								layout: 'compact'
							},
							tablet: {
								layout: 'compact'
							},
						},
					 }
				 }
			 },
			columns: [
				{field: 'useNm', title: '사용유무', textAlign: 'center', width: 70,  search: true, searchType:"select", searchCd: "CMM00001", searchField:"useCd", sortField: "useCd"},
				{field: 'usrId', title: '아이디', textAlign: 'center', width: 150, search: true},
				{field: 'usrNm', title: '사용자 명', textAlign: 'left', width: 160, search: true},
				{field: 'telno', title: '연락처', textAlign: 'left', width: 110, search: true},
				{field: 'email', title: '이메일', textAlign: 'left', width: 170, search: true},
				{field: 'usrPositionNm', title: '직급', textAlign: 'center', width: 110, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직책', textAlign: 'center', width: 120, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 390, search: true, sortable: false},
				{field: 'regDtm', title: '등록일', textAlign: 'center', width: 120, search: true, searchType:"daterange"},
				{field: 'etc', title: '비고', textAlign: 'left', width: 400, search: true}
			],
			actionBtn:{
				"update": false,
				"delete": false
			},
			callback:{
				initComplete: function(evt,config){
					$("#sprUstListTable .kt-datatable__table").css({visibility: "hidden", height: 0});
				},
				ajaxDone: function(evt, list){
					var usrStr = '';
					$.each(list, function(idx, map){
						usrStr += 
							'<div class="kt-widget kt-margin-b-10 kt-widget--general-2 rounded osl-widget-draggable" data-usr-id="'+map.usrId+'" data-usr-name="'+$.osl.escapeHtml(map.usrNm)+'">'
								+'<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">'
									+'<div class="kt-widget__label kt-margin-r-10 osl-user__active--block">'
										+'<i class="fa fa-arrow-alt-circle-left"></i>'
									+'</div>'
									+'<div class="kt-media kt-media--circle kt-media--md">'
										+'<img src="'+$.osl.user.usrImgUrlVal(map.usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
									+'</div>'
									+'<div class="kt-widget__wrapper">'
										+'<div class="kt-widget__label">'
											+'<div class="kt-widget__title osl-word__break osl-word__break--w200">'
												+$.osl.escapeHtml(map.usrNm)
											+'</div>'
											+'<small>'+$.osl.escapeHtml(map.email)+'</small>'
											+'<span class="kt-widget__desc">'
												+'<span>'+$.osl.escapeHtml(map.usrDutyNm)+'</span>, <span>'+$.osl.escapeHtml(map.usrPositionNm)+'</span>'
											+'</span>'
										+'</div>'
									+'</div>'
								+'</div>'
							+'</div>';
					});
					$("#sprUstListCardTable").html(usrStr);
					
					
					$("#sprAssignReqUsrTable").on("click","input[name^=reqCharger_]", function(){
						
						var targetElem = $(".osl-widget-draggable.active");
						if(targetElem.length > 0){
							
							var targetUsrId = targetElem.data("usr-id");
						    var targetUsrNm = targetElem.data("usr-name");
						    
						    
						    var targetReqId = $(this).data("req-id");
						    
						    
						    this.value = targetUsrNm;
						    
						    
						    insertParam['reqUsrList'][targetReqId] = {usrId: targetUsrId, usrNm: targetUsrNm};
						}
					});
					
					
					$(".osl-widget-draggable").click(function(){
						
						var unActive = false;
						if($(this).hasClass("active")){
							unActive = true;
						}
						
						$(".osl-widget-draggable.active").removeClass("active");
						if(unActive === false){
							$(this).addClass("active");
						}
					});
				}
			}
		});
		
		
		var reqList = JSON.parse(dataList);
		
		
		var datatable = $.osl.datatable.list["sprAssignReqUsrTable"].targetDt;
	
		
		datatable.eq(0).removeClass("kt-datatable--error");
		
		$.each(reqList, function(idx, map){
			
			datatable.dataSet.push(map);
			datatable.originalDataSet.push(map);
		
		});
			
		
		
		
		var dataSet = new Set(datatable.dataSet);
		var originalDataSet = new Set(datatable.originalDataSet);
		datatable.dataSet = Array.from(dataSet);
		datatable.originalDataSet = Array.from(originalDataSet);
		
		
		datatable.insertData();
		
		datatable.reload();
		
		$.osl.datatable.list["sprAssignReqUsrTable"].targetDt.reload();
		
		$("#updateSpr1100Btn").click(function(){
			insertSpr1100();
		})
		
	};
	
	var insertSpr1100 = function(sprId, list){
		
		$("input[name^=reqCharger_]").each(function(){
			if(this.value==""){
				$.osl.alert("담당자 배정이 완료되지 않았습니다.");
				return;
			}
		})
		
		$("input[name^=sprPoint_]").each(function(){
			if(this.value==""){
				$.osl.alert("스토리포인트 배정이 완료되지 않았습니다.");
				return;
			}
		})
		
		var fd = $.osl.formDataToJsonArray(mainFormId);
		
		fd.append("insertParam", JSON.stringify(insertParam));
		
		fd.append("dataList", list);
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/spr/spr1000/spr1100/insertSpr1100ReqListAjax.do'/>", "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
    			 , fd);
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
				
				
   				$.osl.layerPopupClose();
				
				$("button[data-datatable-id=req1100NonTable][data-datatable-action=select]").click();
				$("button[data-datatable-id=req1100AssTable][data-datatable-action=select]").click();
				
				
			}
    	});
		
		$.osl.confirm("배정하시겠습니까?",null,function(result) {
   	        if (result.value) {
		    	ajaxObj.send();
   	        }
		})
	}
	
	return {
        
        init: function() {
        	documentSetting();
        }
    };
}();

$.osl.ready(function(){
	OSLSpr1101Popup.init();
});
</script>

