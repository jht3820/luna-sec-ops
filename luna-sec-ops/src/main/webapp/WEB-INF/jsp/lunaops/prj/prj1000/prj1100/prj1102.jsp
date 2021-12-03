<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1102">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramProcessId" id="paramProcessId" value="${param.paramProcessId}">
	<input type="hidden" name="paramFlowId" id="paramFlowId" value="${param.paramFlowId}">
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet" id="flowLeftDiv">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>단계 정보
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body kt-padding-15">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="osl-flowchart-preview" id="flowPreviewMain"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>단계 명</span></label>
								<input type="text" class="form-control" placeholder="단계 명" name="flowNm" id="flowNm" maxlength="50" opttype="-1" required>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>제목 배경 색상</label>
								<input type="color" class="form-control" placeholder="제목 배경 색상" name="flowTitleBgColor" id="flowTitleBgColor" value="#FFFFFF" opttype="-1" readonly="readonly">
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>제목 글씨 색상</label>
								<input type="color" class="form-control" placeholder="제목 글씨 색상" name="flowTitleColor" id="flowTitleColor" value="#000000" opttype="-1" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-lg-12 col-md-12 col-sm-12">
							<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i>단계 기능</label>
							<div class="row">
								<div class="col-lg-6 col-md-12 col-sm-12">
									<div class="kt-checkbox-list">
										<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
											<input type="checkbox" class="osl-flow-operator-func" name="flowSignCd" id="flowSignCd" opttype="-1"> 결재 필수
											<span></span>
										</label>
										<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
											<input type="checkbox" class="osl-flow-operator-func" name="flowSignStopCd" id="flowSignStopCd" opttype="-1"> 결재 반려 시 종료
											<span></span>
										</label>
										<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
											<input type="checkbox" class="osl-flow-operator-func" name="flowMiddleEndCd" id="flowMiddleEndCd" opttype="-1"> 중간 종료
											<span></span>
										</label>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-12">
									<div class="kt-checkbox-list">
										<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
											<input type="checkbox" class="osl-flow-operator-func" name="flowRevisionCd" id="flowRevisionCd" opttype="-1"> 소스 저장소
											<span></span>
										</label>
										<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
											<input type="checkbox" class="osl-flow-operator-func" name="flowDplCd" id="flowDplCd" opttype="-1"> 배포 계획
											<span></span>
										</label>
										<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand  kt-hide">
											<input type="checkbox" class="osl-flow-operator-func" name="flowAuthCd" id="flowAuthCd" opttype="-1"> 허용 역할
											<span></span>
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span>단계 설명</span></label>
								<textarea class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="flowDesc" id="flowDesc" maxlength="2000" opttype="-1"></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet" id="flowRightDiv">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>기본항목 미리보기
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" tabindex="1"><i class="fa fa-plus"></i></a>
							<div class="dropdown-menu dropdown-menu-right">
								<div class="dropdown-item" id="insertBasicItemBtn"><i class="fa fa-plus kt-font-brand"></i>신규 항목 추가</div>
								<div class="dropdown-item" id="selectBasicItemBtn"><i class="fa fa-list-alt kt-font-brand"></i>기본항목 불러오기</div>
							</div>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body kt-padding-10">
					<div class="row" id="basicItemList">
					
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1101SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
var OSLPrj1102Popup = function () {
	var formId = 'frPrj1102';
	var previewFlowChart = $("#flowPreviewMain");
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var type = $("#type").val();

	
	var basicItemList = new Array();
	
	var basicItemDelList = new Array();
	
	
	var paramPrjGrpId = $("#paramPrjGrpId").val();
	var paramPrjId = $("#paramPrjId").val();
	var paramProcessId = $("#paramProcessId").val();
	var paramFlowId = $("#paramFlowId").val();
	
    
    var documentSetting = function () {
    	
    	$("#flowRightDiv").css("min-height",$("#flowLeftDiv").height());

    	
    	$("#prj1101SaveSubmit > span").text($.osl.lang("modal."+type+".saveBtnString"));
		
    	
    	var data = {
			operators: {
				previewOperator: {
					top: 10,
					left: 10,
					properties: {
						id: "previewOperator",
						title: '단계 명',
						flowSignCd: "02",
						flowSignStopCd: "02",
						flowWorkCd: "02",
						flowRevisionCd: "02",
						flowDplCd: "02",
						flowAuthCd: "02",
						flowMiddleEndCd: "02",
						inputs: {
							input_1: {
								label: 'Input 1',
							}
						},
						outputs: {
							output_1: {
								label: 'Output 1',
							}
						}
					}
				}
			}
		};
    	
    	
		previewFlowChart.flowchart({
				canUserMoveOperators: false,
				canUserEditLinks: false,
				distanceFromArrow:1,
				linkWidth:1,
				defaultLinkColor: "#5867dd",
				defaultOperatorClass: "osl-flowchart__operator",
				data: data
		});
    	
    	
    	$("#flowNm, #flowTitleBgColor, #flowTitleColor").blur(function(){
    		
    		var targetId = this.id;
    		
    		
    		var previewOperator = previewFlowChart.flowchart("getOperatorData","previewOperator");
    		
    		
    		if(targetId == "flowNm"){
    			
    			previewOperator.properties.title = this.value;
    		}
    		
    		else if(targetId == "flowTitleBgColor"){
    			previewOperator.properties["flowTitleBgColor"] = this.value;
    			
    		}
    		
    		else if(targetId == "flowTitleColor"){
    			previewOperator.properties["flowTitleColor"] = this.value;
    		}
    		
    		previewFlowChart.flowchart("setOperatorData","previewOperator",previewOperator);
    	});
    	
		
    	$("#prj1101SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj1102."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	
    	        	saveFormAction();
    	        }
    		});
    	});
		
		
		if(type == "update"){
			fnFlowInfoSelect();
		}
		
		
		$(".osl-flow-operator-func").change(function(){
			var checkValue = (this.checked)?"01":"02";
			var optId = $(this).attr("id");
			
			var previewFlowInfo = previewFlowChart.flowchart('getOperatorData', "previewOperator");
			
			
			if(previewFlowInfo.properties.hasOwnProperty(optId)){
				previewFlowInfo.properties[optId] = checkValue;
				previewFlowChart.flowchart('setOperatorData', "previewOperator", previewFlowInfo);
			}
			
		});
		
		$("#prj1101SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj1102."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	
    	        	saveFormAction();
    	        }
    		});
    	});
		
		$("#selectBasicItemBtn").click(function(){
			var data = {
					callPage:"OSLPrj1102Popup"
				};
			var options = {
					idKey: "prj1304",
					modalTitle: "기본항목 리스트",
					modalSize: "xl",
					closeConfirm: false,
					autoHeight: false,
					callback: [{
						targetId: "prj1304ModalCallBackBtn",
						actionFn: function(thisObj){
							var itemList = OSLPrj1304Popup.getItemList();
							OSLPrj1102Popup.addItemList(itemList);
						}
					}]
				};
			
			$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1304View.do',data,options);
		});
		

		$("#insertBasicItemBtn").click(function(){
			var data = {
					type:"insert",
					callPage:"OSLPrj1102Popup"
				};
			var options = {
					idKey: "prj1305",
					modalTitle: "기본항목 추가",
					modalSize: "lg",
					closeConfirm: false,
					autoHeight: false,
					callback: [{
						targetId: "prj1305ModalCallBackBtn",
						actionFn: function(thisObj){
							var itemList = OSLPrj1305Popup.getItemList();
							OSLPrj1102Popup.addItemList(itemList);
						}
					}]
				};
			
			$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1305View.do',data,options);
		});
    };
    
    
    var saveFormAction = function() {
    	
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	var left = 0;
    	var top = 0;
    	
   		
		if($("#flowChartDiv").length > 0 && type == "insert"){
			
			var flowChartTf = $("#flowChartDiv").css("transform");
			var tfData = flowChartTf.match(/-?[\d\.]+/g);
			top = parseInt(tfData[tfData.length-1])*(-1);
			left = parseInt(tfData[tfData.length-2])*(-1);
			
			
			if(left < 0){
				left = 0;
			}
			if(top < 0){
				top = 0;
			}
		}

   		
		$.each(basicItemList, function(idx, map){
			map.itemOrd = idx+1;
			map.reqId = "ROOTSYSTEM_FLW";
			map.itemDivision = "01";
			basicItemList[idx] = map;
		});
   		
		
		if($("#flowChartDiv").length > 0){
			
			var newflowId = 'F'+new Date().format('yyMMddHHmmssms');
			
			if(type == "insert"){
	  			
	  			var operatorData = {
					top: (parseInt(top)+20),
					left: (parseInt(left)+20),
					properties: {
						id: newflowId,
						title: $("#flowNm").val(),
						flowDesc: $("#flowDesc").val(),
						editable: true,
						inputs: {input_1: {label: '이전'}},
						outputs: {output_1: {label: '다음'}},
						flowTitleBgColor: $("#flowTitleBgColor").val(),
						flowTitleColor: $("#flowTitleColor").val(),
						flowSignCd: $("#flowSignCd").is(":checked")? "01": "02",
						flowSignStopCd: $("#flowSignStopCd").is(":checked")? "01": "02",
						flowWorkCd: $("#flowWorkCd").is(":checked")? "01": "02",
						flowRevisionCd: $("#flowRevisionCd").is(":checked")? "01": "02",
						flowDplCd: $("#flowDplCd").is(":checked")? "01": "02",
						flowAuthCd: $("#flowAuthCd").is(":checked")? "01": "02",
						flowMiddleEndCd: $("#flowMiddleEndCd").is(":checked")? "01": "02",
						basicItemList: basicItemList,
						basicItemDelList: basicItemDelList,
					}
				};
	  			
	  			OSLPrj1100Popup.setFlowAddList(newflowId);
	  			$("#flowChartDiv").flowchart('createOperator', newflowId, operatorData);
			}
			else if(type == "update"){
				var flowInfo = $("#flowChartDiv").flowchart("getOperatorData",paramFlowId);
				flowInfo.properties.title = $("#flowNm").val();
				flowInfo.properties.flowDesc = $("#flowDesc").val();
				flowInfo.properties.flowTitleBgColor = $("#flowTitleBgColor").val();
				flowInfo.properties.flowTitleColor = $("#flowTitleColor").val();
				flowInfo.properties.flowSignCd = $("#flowSignCd").is(":checked")? "01": "02";
				flowInfo.properties.flowSignStopCd = $("#flowSignStopCd").is(":checked")? "01": "02";
				flowInfo.properties.flowWorkCd = $("#flowWorkCd").is(":checked")? "01": "02";
				flowInfo.properties.flowRevisionCd = $("#flowRevisionCd").is(":checked")? "01": "02";
				flowInfo.properties.flowDplCd = $("#flowDplCd").is(":checked")? "01": "02";
				flowInfo.properties.flowAuthCd = $("#flowAuthCd").is(":checked")? "01": "02";
				flowInfo.properties.flowMiddleEndCd = $("#flowMiddleEndCd").is(":checked")? "01": "02";

				flowInfo.properties.basicItemList = basicItemList;
				flowInfo.properties.basicItemDelList = basicItemDelList;
				
				$("#flowChartDiv").flowchart("setOperatorData",paramFlowId, flowInfo);
			}
		}
		
		
		$.osl.layerPopupClose();
    };
	
	
	var fnFlowInfoSelect = function(){
		var flowData = $("#flowChartDiv").flowchart("getOperatorData",paramFlowId);
		
		
		$.osl.setDataFormElem(flowData.properties, formId);
		
		if(!$.osl.isNull(flowData.properties.basicItemList)){
			basicItemList = flowData.properties.basicItemList;
			
			
			$.osl.customOpt.setting(basicItemList,  "basicItemList",
	    			
	    			{
						viewType: "preview",
						delAt: true,
						actionFn:{
							delete:function($this){
								var targetId = $this.data("itemId");
								$this.parents(".basicItemDiv:first").remove();
								basicItemDelList.push({"itemId":targetId,"reqId":"ROOTSYSTEM_FLW"});
								
								var delIdx = ""
								$.each(basicItemList,function(idx, map){
									if(map.itemId == targetId){
											delIdx = idx;						
									}
								});
								if(delIdx!==""){
									basicItemList.splice(delIdx,1);
								}
		
							}
						}
					},
					
					function(){
						
					}
    		); 
		}
		
		
		$("#flowNm").val(flowData.properties.title);
		
		
		var previewFlowInfo = previewFlowChart.flowchart('getOperatorData', "previewOperator");
		previewFlowInfo.properties.title = flowData.properties.title;
		previewFlowInfo.properties.flowTitleBgColor = flowData.properties.flowTitleBgColor;
		previewFlowInfo.properties.flowTitleColor = flowData.properties.flowTitleColor;
		previewFlowInfo.properties.flowSignCd = flowData.properties.flowSignCd;
		previewFlowInfo.properties.flowSignStopCd = flowData.properties.flowSignStopCd;
		previewFlowInfo.properties.flowWorkCd = flowData.properties.flowWorkCd;
		previewFlowInfo.properties.flowRevisionCd = flowData.properties.flowRevisionCd;
		previewFlowInfo.properties.flowDplCd = flowData.properties.flowDplCd;
		previewFlowInfo.properties.flowAuthCd = flowData.properties.flowAuthCd;
		previewFlowInfo.properties.flowMiddleEndCd = flowData.properties.flowMiddleEndCd;
		
		previewFlowChart.flowchart('setOperatorData', "previewOperator", previewFlowInfo);
	};
	
	return {
        
        init: function() {
        	documentSetting();
        },
    	addItemList: function(itemList){
	    	basicItemList = basicItemList.concat(itemList);
	    	
	    	
	    	$.osl.customOpt.setting(basicItemList,  "basicItemList",
	    			
	    			{
	    				htmlAppendType: true,
						delAt:true,
						actionFn:{
							delete:function($this){
								var targetId = $this.data("itemId");
								$this.parents(".basicItemDiv:first").remove();
								basicItemDelList.push({"itemId":targetId});
		
								var delIdx = ""
								$.each(basicItemInsertList,function(idx, map){
									if(map.itemId == targetId){
											delIdx = idx;						
									}
								});
								if(delIdx!==""){
									basicItemInsertList.splice(delIdx,1);
								}
							}
						}
					},
					
					function(){
						
					}
    		); 
    	}
    };
}();


$.osl.ready(function(){
	OSLPrj1102Popup.init();
});

	
</script>