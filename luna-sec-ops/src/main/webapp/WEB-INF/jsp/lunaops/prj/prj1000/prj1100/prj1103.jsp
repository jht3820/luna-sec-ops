<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1103">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramProcessId" id="paramProcessId" value="${param.paramProcessId}">
	<input type="hidden" name="paramFlowId" id="paramFlowId" value="${param.paramFlowId}">
	<input type="hidden" name="paramFlowchartTarget" id="paramFlowchartTarget" value="${param.paramFlowchartTarget}">
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
								<label><i class="fa fa-project-diagram kt-margin-r-5"></i><span>단계 명</span></label>
								<input type="text" class="form-control" placeholder="단계 명" name="flowNm" id="flowNm" opttype="-1" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label><i class="fa fa-check-square kt-margin-r-5"></i>제목 배경 색상</label>
								<input type="color" class="form-control" placeholder="제목 배경 색상" name="flowTitleBgColor" id="flowTitleBgColor" value="#FFFFFF" opttype="-1" readonly="readonly" disabled="disabled">
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label><i class="fa fa-check-square kt-margin-r-5"></i>제목 글씨 색상</label>
								<input type="color" class="form-control" placeholder="제목 글씨 색상" name="flowTitleColor" id="flowTitleColor" value="#000000" opttype="-1" readonly="readonly" disabled="disabled">
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
											<input type="checkbox" name="flowSignCd" id="flowSignCd" opttype="-1" disabled="disabled"> 결재 필수
											<span></span>
										</label>
										<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand kt-hide">
											<input type="checkbox" name="flowSignStopCd" id="flowSignStopCd" opttype="-1"> 결재 반려 시 종료
											<span></span>
										</label>
										<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand kt-hide">
											<input type="checkbox" name="flowMiddleEndCd" id="flowMiddleEndCd" opttype="-1"> 중간 종료
											<span></span>
										</label>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-12 kt-hide">
									<div class="kt-checkbox-list">
										<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
											<input type="checkbox" name="flowRevisionCd" id="flowRevisionCd" opttype="-1"> 소스 저장소
											<span></span>
										</label>
										<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand">
											<input type="checkbox" name="flowDplCd" id="flowDplCd" opttype="-1"> 배포 계획
											<span></span>
										</label>
										<label class="kt-checkbox kt-checkbox--tick kt-checkbox--brand  kt-hide">
											<input type="checkbox" name="flowAuthCd" id="flowAuthCd" opttype="-1"> 허용 역할
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
								<textarea class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="flowDesc" id="flowDesc" maxlength="2000" opttype="-1" readonly="readonly"></textarea>
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
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
var OSLPrj1103Popup = function () {
	var formId = 'frPrj1103';
	var previewFlowChart = $("#flowPreviewMain");
	
	
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
						flowTitleBgColor:"#ffffff",
						flowTitleColor:"#000000",
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
    	
		
		fnFlowInfoSelect();
		
		$("#selectBasicItemBtn").click(function(){
			var data = {
					callPage:"OSLPrj1103Popup"
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
							OSLPrj1103Popup.addItemList(itemList);
						}
					}]
				};
			
			$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1304View.do',data,options);
		});
		

		$("#insertBasicItemBtn").click(function(){
			var data = {
					type:"insert",
					callPage:"OSLPrj1103Popup"
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
							OSLPrj1103Popup.addItemList(itemList);
						}
					}]
				};
			
			$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1305View.do',data,options);
		});
    };
	
	
	var fnFlowInfoSelect = function(){
		var paramFlowchartTarget = $("#paramFlowchartTarget").val();
		var flowData = $(paramFlowchartTarget).flowchart("getOperatorData",paramFlowId);
		
		
		$.osl.setDataFormElem(flowData.properties, formId);
		
		if(flowData.properties.hasOwnProperty("basicItemList") && !$.osl.isNull(flowData.properties.basicItemList)){
			basicItemList = flowData.properties.basicItemList;
			
			
			$.osl.customOpt.setting(basicItemList,  "basicItemList",
	    			
	    			{
						viewType: "preview",
						readOnly: true,
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
		previewFlowInfo.properties.flowStartCd = flowData.properties.flowStartCd;
		previewFlowInfo.properties.flowDoneCd = flowData.properties.flowDoneCd;
		previewFlowInfo.properties.flowMiddleEndCd = flowData.properties.flowMiddleEndCd;
		
		previewFlowChart.flowchart('setOperatorData', "previewOperator", previewFlowInfo);
	};
	
	return {
        
        init: function() {
        	documentSetting();
        }
    };
}();


$.osl.ready(function(){
	OSLPrj1103Popup.init();
});

	
</script>