<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form class="kt-form" id="frSpr1004">
	<input type="hidden" name="modalId" id="modalId" value="${param.modalId}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramSprId" id="paramSprId" value="${param.paramSprId}">
	<input type="hidden" name="paramStDt" id="paramStDt" value="${param.paramStartDt}">
	<input type="hidden" name="paramEdDt" id="paramEdDt" value="${param.paramEndDt}">
	<input type="hidden" name="paramSprDesc" id="paramSprDesc" value="${param.paramSprDesc}">
	<div class="kt-portlet__body">
		<div class="osl-wizard" id="kt_wizard_v3" data-ktwizard-state="step-first">
			
			<div class="osl-wizard__nav">			
				<div class="osl-wizard__nav-items osl-wizard__nav-items--clickable">
					
					<div class="osl-wizard__nav-item" data-ktwizard-type="step" data-ktwizard-state="current">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">1</div>
							<div class="wizard-label">
								<div class="wizard-title">요구사항 결과 확인</div>
								<div class="wizard-desc">스프린트 리뷰</div>
							</div>
						</div>
					</div>
					
					
					<div class="osl-wizard__nav-item" data-ktwizard-type="step">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">2</div>
							<div class="wizard-label">
								<div class="wizard-title">회고록 작성</div>
							</div>
						</div>
					</div>
					
					
					<div class="osl-wizard__nav-item" data-ktwizard-type="step">
						<div class="osl-wizard-wrapper">
							<div class="wizard-number">3</div>
							<div class="wizard-label">
								<div class="wizard-title">스프린트 결과 통계</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="osl-form__actions kt-padding-l-25" id="wizardStepBtnTmp">
				<button class="btn btn-outline-brand" data-ktwizard-type="action-prev">
					<i class="fas fa-chevron-circle-left"></i><span data-lang-cd="spr1003.wizard.btn.prev">이전</span>
				</button>
				<button class="btn btn-outline-brand kt-margin-l-20" data-ktwizard-type="action-submit">
					<span class="kt-margin-r-5" data-lang-cd="spr1003.wizard.btn.submit">완료</span><i class="fas fa-check-circle kt-padding-r-0"></i>
				</button>
				<button class="btn btn-outline-brand kt-margin-l-20" data-ktwizard-type="action-next">
					<span class="kt-margin-r-5" data-lang-cd="spr1003.wizard.btn.next">다음</span><i class="fas fa-chevron-circle-right kt-padding-r-0"></i>
				</button>
			</div>
			
			<div class="osl-wizard__content w-100 osl-h-px--500 kt-bg-light kt-padding-30 kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content" data-ktwizard-state="current">
				<div class="row kt-margin-t-20">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="osl-datatable-search" data-datatable-id="sprReqResultTable"></div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12">
								<button class="btn btn-brand float-right" id="newReqappend" type="button" data-datatable-id="sprReqResultTable">
									<i class="fa fa-search"></i><span class=""><span>신규 백로그 추가</span></span>
								</button>
							</div>
						</div>
						<div class="kt_datatable" id="sprReqResultTable"></div>
					</div>
				</div>
			</div>
			
			
			<div class="osl-wizard__content w-100 osl-h-px--500 kt-bg-light kt-padding-30 kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>회고록 제목</label>
							<input type="text" name="mmrNm" id="mmrNm" class="form-control" required>
						</div>
					</div>
				</div>
				<div class="row kt-margin-b-20">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="form-group form-group-last">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>회고록 내용</label>
							<textarea class="form-control" name="mmrDesc" id="mmrDesc" required></textarea>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="osl-wizard__content w-100 kt-bg-light kt-padding-30 kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content">
				<div class="row kt-padding-l-20 kt-padding-r-20">
					
					<div class="col-12 text-center kt-margin-t-20"><h1 class="font-weight-bold">${param.paramSprNm}</h1></div>
					
					
					
					<div class="col-12 text-right">${param.paramStartDt} - ${param.paramEndDt}</div>
					<div class="col-12 text-right">${param.paramSprDesc}</div>
					
					
					
					<div class="table border kt-margin-t-20">
						<div class="row kt-margin-0">
							<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">전체 배정 백로그</div>
							<div class="col-6 text-center kt-padding-15" id="sprStat01"></div>
						</div>
						<div class="row kt-margin-0 border-top">
							<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">최종 완료 백로그</div>
							<div class="col-6 text-center kt-padding-15" id="sprStat02"></div>
						</div>
						<div class="row kt-margin-0 border-top">
							<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">미 완료 백로그</div>
							<div class="col-6 text-center kt-padding-15" id="sprStat03"></div>
						</div>
						<div class="row kt-margin-0 border-top">
							<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">평균 완료 소요시간</div>
							<div class="col-6 text-center kt-padding-15" id="sprStat04"></div>
						</div>
						<div class="row kt-margin-0 border-top">
							<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">진척률</div>
							<div class="col-6 text-center kt-padding-15" id="sprStat05"></div>
						</div>
						<div class="row kt-margin-0 border-top">
							<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">완료 스토리 포인트 공수</div>
							<div class="col-6 text-center kt-padding-15" id="sprStat06"></div>
						</div>
					</div>
					
				</div>
				
				
				<div class="row kt-padding-l-20 kt-padding-r-20 kt-margin-t-40">
					<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-0 kt-padding-r-10">
						<div class="border osl-min-h-px--140" id="burnUpChart"></div>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-10 kt-padding-r-0">
						<div class="border osl-min-h-px--140" id="burnDownChart"></div>
					</div>
				</div>
				<div class="row kt-padding-l-20 kt-padding-r-20 kt-margin-t-40 ">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 kt-padding-l-0 kt-padding-r-0">
						<div class="border osl-min-h-px--140" id="velocityChart"></div>
					</div>
				</div>
				
				
				
				<div class="row kt-margin-t-20">
					<div class="col-lg-12 col-md-12 col-sm-12 kt-padding-20">
						<div class="row">
							
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="osl-datatable-search" data-datatable-id="sprDetailTable"></div>
							</div>
							
							
							<div class="col-lg-6 col-md-6 col-sm-12">
								<button type="button" class="btn btn-brand float-right" data-datatable-id="sprDetailTable" data-datatable-action="select" title="스프린트 상세정보 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
									<i class="fa fa-list"></i><span>조회</span>
								</button>
							</div>
							
						</div>
						
						<div class="kt_datatable" id="sprDetailTable"></div>
						
					</div>
				</div>
				
			</div>
			
		</div>
	</div>

	<div class="modal-footer">
		<button class="btn btn-outline-brand"	data-dismiss="modal">
			<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
		</button>
	</div>
</form>


<script>
"use strict";
var OSLSpr1004Popup = function () {
	
	var formId = 'frSpr1004'
	
	
	var formEditList = [];

	
	var datatableInitFlag = {3:false};
	var datatableSetting = {};
	
	
	var paramSprId = $("#paramSprId").val();
	
	var totalSprPoint = 0;
	
	var endSprPoint = 0;
	
	var formValidate = $.osl.validate(formId);
	
	
	var paramSprStDt = $("#paramStDt").val();
	
	var paramSprEdDt = $("#paramEdDt").val();
	
	
	var wizardData = {
		
		reqResultDescList: {}
	};
	
	var documentSetting = function(){
		
    	formEditList.push($.osl.editorSetting("mmrDesc", {formValidate: formValidate,'minHeight': 220, disableResizeEditor: false}));
		
    	
		datatableInitFlag[1] = 
			$.osl.datatable.setting("sprReqResultTable",{
				data: {
					source: {
						read: {
							url: "/spr/spr1000/spr1000/selectSpr1000SprReqListAjax.do",
							params:{
								sprId: paramSprId
							}
						}
					},
					
					pageSize : 5,
				},
				toolbar:{
					items:{
						pagination:{
							
							pageSizeSelect : [5, 10, 20, 30, 50, 100],
						}
					}
				},
				columns: [
					{field: 'reqOrd', title: '순번', textAlign: 'center', width: 50, search: true},
					{field: 'reqNm', title: '요청 제목', textAlign: 'center', width: 200, search: true},
					{field: 'reqProTypeNm', title: '처리유형', textAlign: 'left', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProType", sortField: "reqProType"},
					{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 100, search: true,
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
							return $.osl.user.usrImgSet(row.reqChargerId, usrData);
						},
						onclick: function(rowData){
							$.osl.user.usrInfoPopup(rowData.reqChargerId);
						}
					},
					{field: 'regDtm', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"date",
						template: function (row) {
							var paramDatetime = new Date(row.regDtm);
			                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
			                return agoTimeStr.agoString;
						}
					},
					{field: 'sprPoint', title: '스토리 포인트', textAlign: 'center', width: 80},
					{field: 'reqResultDescLen', title: '작성 여부', textAlign: 'center', width: 30, autoHide: false,
						template: function (row) {
							var rtnValue = '<i class="fa fa-hourglass"></i>';
							
							if(!$.osl.isNull(row.reqResultDescLen) && row.reqResultDescLen > 0){
								rtnValue = '<i class="fa fa-check-double kt-font-brand"></i>';
							}
			                return rtnValue;
						}
					}
				],
				actionBtn:{
					"title": "결과 작성",
					"width": 80,
					"update": false,
					"delete": false,
					"dblClick": false,
					"resultWrite": true
				},
				actionTooltip:{
					"resultWrite": "요구사항 결과 작성"
				},
				theme:{
					actionBtnIcon:{
						"resultWrite": "fas fa-edit",
					}
				},
				actionFn:{
					"resultWrite":function(rowData){
						var data = {
								paramPrjGrpId: rowData.prjGrpId
								,paramPrjId: rowData.prjId
								,paramReqId: rowData.reqId
								,paramSprId: paramSprId
							};
						var options = {
								modalTitle: "요구사항 결과 작성",
								autoHeight: false
							};
						$.osl.layerPopupOpen('/spr/spr1000/spr1000/selectSpr1005View.do',data,options);
					}
				},
			});
		
		
		datatableSetting[3] = function(){
			
    		return $.osl.datatable.setting("sprDetailTable",{
    			data: {
    				source: {
    					read: {
    						url: "/spr/spr1000/spr1000/selectSpr1000SprReqListAjax.do",
    						params:{
    							sprId: paramSprId
    						}
    					}
    				},
    				 pageSize : 5,
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
    				{field: 'prjNm', title: '프로젝트 명', textAlign: 'center', width: 150},
    				{field: 'reqOrd', title: '순번', textAlign: 'center', width: 50, search: true},
    				{field: 'reqNm', title: '요청 제목', textAlign: 'center', width: 200, search: true},
    				{field: 'reqProTypeNm', title: '진행 상태', textAlign: 'left', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProType", sortField: "reqProType"}, 
    				{field: 'reqChargerNm', title: '담당자', textAlign: 'center', width: 100, search: true,
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
    						return $.osl.user.usrImgSet(row.reqChargerId, usrData);
    					},
    					onclick: function(rowData){
    						$.osl.user.usrInfoPopup(rowData.reqChargerId);
    					}
    				},
    				{field: 'timeRequired', title: '실 소요시간', textAlign: 'center', width: 100,
    					template: function (row) {
    						if(row.reqProType == '01'){
    							return '-';
    						}else if(row.reqProType == '04'){
    							return $.osl.escapeHtml(String(row.endTimeRequired)); 
    						}
    						return $.osl.escapeHtml(String(row.notEndTimeRequired));
    					},
    				},
    				{field: 'sprPoint', title: '스토리포인트', textAlign: 'center', width: 80,
    					template: function (row) {
    						
    						if($.osl.isNull(row.sprPoint)){
    							return '-'
    						}else{
    							return $.osl.escapeHtml(String(row.sprPoint));	
    						}
    					}
    				}
    			],
    			actionBtn:{
    				select:false,
    				delete:false,
    				update:false,
    			},
    			callback:{
    				ajaxDone:function(evt, list){
    					
    	 				var reqChartDataList = [];
    	 				if($.osl.datatable.list["sprDetailTable"].targetDt.lastResponse.hasOwnProperty('data')){
    	 					reqChartDataList = $.osl.datatable.list["sprDetailTable"].targetDt.lastResponse.data;
    	 				}
    	 				
    	 				selectSprInfoStat();
    	 				
    	 				
    	 				drawAllChart();
    	 				
    				}
    			}
    		});
    		
    		
		};
		
		
		
		var wizard = new KTWizard('kt_wizard_v3', {
			startStep: 1, 
			clickableSteps: false, 		
		});
		
		
		wizard.on('beforeNext', function(wizardObj) {
			var reqEndCnt = $.osl.datatable.list.sprReqResultTable.targetDt.lastResponse.meta.reqEndCnt;
			
			if($("#"+formId).valid() !== true){
				wizardObj.stop();
			}
			if(reqEndCnt != '0'){
				wizardObj.stop();
				$.osl.toastr($.osl.lang("spr1004.alert.reqEndCnt",reqEndCnt),{"type":"error"});
			};
		});
		
		
		wizard.on('change', function(wizardObj) {
			if(datatableInitFlag.hasOwnProperty(wizardObj.currentStep)){
				
				if(!datatableInitFlag[wizardObj.currentStep]){
					datatableInitFlag[wizardObj.currentStep] = datatableSetting[wizardObj.currentStep]();
					
				}else if(datatableInitFlag[wizardObj.currentStep].hasOwnProperty("targetDt")){
					datatableInitFlag[wizardObj.currentStep].targetDt.reload();
				}
			}
		});
		
		
		var initWizard = function(wizard){
			
			var totalStep = wizard.totalSteps;
			
			var checkThis = wizard.currentStep;
			
			var checking = totalStep - checkThis;
			
			
			if(checking==0){
				$('[data-ktwizard-type="action-prev"]').css('display','inline-block');
				$('[data-ktwizard-type="action-next"]').css('display','none');
				$('[data-ktwizard-type="action-submit"]').css('display','inline-block');
			
			}else if(checking<totalStep-1){
				
				$('[data-ktwizard-type="action-prev"]').css('display','inline-block');
				$('[data-ktwizard-type="action-next"]').css('display','inline-block');
				$('[data-ktwizard-type="action-submit"]').css('display','none');
			
			}else{
				$('[data-ktwizard-type="action-next"]').css('display','inline-block');
				$('[data-ktwizard-type="action-prev"]').css('display','none');
				$('[data-ktwizard-type="action-submit"]').css('display','none');
			}
		};
		
		
		$('#frSpr1004 [data-ktwizard-type="action-submit"]').click(function(){
	       	
	   		var fd = $.osl.formDataToJsonArray(formId);
	       	
	   		
	   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/spr/spr1000/spr1000/updateSpr1003SprEnd.do'/>", "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

	   		
	   		ajaxObj.setFnSuccess(function(data){
	   			if(data.errorYn == "Y"){
	   				$.osl.alert(data.message,{type: 'error'});
	   			}else{
	   				
	   				$.osl.toastr(data.message);

	   				
	   				$.osl.layerPopupClose();
	   				
	   				
	   				if($("button[data-datatable-id=spr1000Table][data-datatable-action=select]").length > 0){
		   				$("button[data-datatable-id=spr1000Table][data-datatable-action=select]").click();
	   				}
	   				
	   			}
	   		});
	   		
	   		
	   		ajaxObj.send();
		});
		
		
		$('#newReqappend').click(function(){
			var data = {
					type: "insert"
			};
			var options = {
					modalTitle: "신규 백로그 추가",
					autoHeight: false
				};
			$.osl.layerPopupOpen('/req/req1000/req1000/selectReq1001View.do',data,options);
		});
		
	};
	
	var selectSprInfoStat = function(){
 		
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000SprInfoStatAjax.do'/>", "async":"false"},{sprId: paramSprId});
 		
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				
 				var sprStat= data.sprStat;
 				
 				$("#sprStat01").html($.osl.escapeHtml(sprStat.allCntSum));
 				
 				$("#sprStat02").html($.osl.escapeHtml(sprStat.endCntSum));
 				
 				$("#sprStat03").html($.osl.escapeHtml(sprStat.notEndCntSum));
 				
 				if($.osl.escapeHtml(sprStat.avgTime)=='NaN'){
	 				$("#sprStat04").html("0");
 				}else{
 					$("#sprStat04").html($.osl.escapeHtml(sprStat.avgTime.toFixed(2)+" 시간"));
 				}
 				
 				if($.osl.escapeHtml(sprStat.sprEndPercent)=='NaN'){
	 				$("#sprStat05").html($.osl.escapeHtml("0 %"));
 				}else{
 					$("#sprStat05").html($.osl.escapeHtml(sprStat.sprEndPercent.toFixed(2))+" %");
 				}
 				if($.osl.escapeHtml(sprStat.sprPerTime)=='NaN'){
	 				$("#sprStat06").html("0 시간   /  1 스토리 포인트");
 				}else{
 					$("#sprStat06").html($.osl.escapeHtml(sprStat.sprPerTime.toFixed(2)) + "시간 /  1 스토리 포인트");
 				}
 				
 				totalSprPoint = sprStat.sprPoint;
 			}
 		});
 		
 		ajaxObj.send();
 	};
 	
 	
 	var drawAllChart = function(){
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000ChartInfoAjax.do'/>", "async":"false"},{sprId: paramSprId});
 		
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				
 				var chartData = data.chartData;
 				
 				var today = new Date();
 				var endDt  = today.getFullYear() + "-" + (today.getMonth()+1) + "-" + today.getDate();
 				
 				var seriesData = getDataRangeData(paramSprStDt, endDt, "1", chartData);
 				
 				drawBurnUpChart(seriesData);
 				
 				
 				drawBurnDownChart(seriesData);
 				
 				endSprPoint = chartData[chartData.length - 1].cumSprPoint;
 				
				drawVelocityChart();
 			}	
 		});
 		
 		ajaxObj.send();
 	}
 	
 	
 	var drawBurnUpChart = function(dateRange){
		 var chart = $.osl.chart.setting("apex","burnUpChart",{
				
				data:{										
					param:{
						dataArr: dateRange,	
						 
						 xKey:"time",
						 key:{
							 key1:"idealBurnUPLine",
							 key2:"burnUpSprPoint"
						 },
						 keyNm:{
							 keyNm1:"idealBurnUPLine",
							 keyNm2:"Actual burnUpSprPoint"
						 },
						 
						 chartType:"line",
						 dataType: "local"
					}
				},
				fill:{
					type:false
				},
				chart:{
					
					colors: ["#586272", "#1cac81"],
					title: {
						text: "번업차트",
						align: "center",
					},
					stroke: {
				          curve: 'straight'
				    },
				    animations:{
						enabled:false
					},
				    markers: {
				          size: 1
				    },
				    grid: {
				          borderColor: '#e7e7e7',
				          row: {
				            colors: ['#f3f3f3', 'transparent'], 
				            opacity: 0.5
				          },
				    },
				    dataLabels:{
				    	enabled:true,
				    },
					xaxis: {
						type: 'datetime',
				        labels: {
				        	hideOverlappingLabels :true,
				            formatter: function(value){
				            	return new Date(value).format("MM-dd");
				            }
				        },
				        tickAmount: '10',
		        	},
					yaxis: {
						show:true
		        	},
		        	toolbar:{
		        		tools:{
		        			pan:false
		        		}
		        	},
		        	grid:{
		        		show:true
		        	}
				},
				callback:{
					
					initComplete: function(chartContext, config){
						$(".apexcharts-zoomout-icon").addClass("kt-margin-0");
						$(".apexcharts-reset-icon").addClass("kt-margin-0");
						$(".apexcharts-toolbar").addClass("kt-margin-10");
						$(".apexcharts-toolbar").attr("style", "top:-20px; right: 10px;");
						$(".apexcharts-toolbar").removeAttr("style[padding]");
					}
				}
			});
		 }
 	
 	var drawBurnDownChart = function(dateRange){
 		 var chart = $.osl.chart.setting("apex","burnDownChart",{
 			
				data:{										
					param:{
						dataArr: dateRange,	
						 
						 xKey:"time",
						 key:{
							 key1:"idealBurnDownLine",
							 key2:"burnDownSprPoint"
						 },
						 keyNm:{
							 keyNm1:"idealBurnDownLine",
							 keyNm2:"Actual burnDownSprPoint"
						 },
						 
						 chartType:"line",
						 dataType: "local"
					}
				},
				fill:{
					type:false
				},
				chart:{
					
					colors: ["#ffb822","#840ad9"],
					title: {
						text: "번다운차트",
						align: "center",
					},
					stroke: {
				          curve: 'straight'
				    },
				    animations:{
						enabled:false
					},
				    markers: {
				          size: 1
				        },
				    dataLabels:{
				    	enabled:true,
				    },
				    grid: {
				          borderColor: '#e7e7e7',
				          row: {
				            colors: ['#f3f3f3', 'transparent'], 
				            opacity: 0.5
				          },
				    },
					xaxis: {
				        type: 'datetime',
				        
				        labels: {
				        	hideOverlappingLabels :true,
				            formatter: function(value){
				            	return new Date(value).format("MM-dd");
				            }
				        },
				        
				        tickAmount: '10',
				        
				        tickPlacement: 'between',
		        	},
					yaxis: {
						show:true
		        	},
		        	toolbar:{
		        		tools:{
		        			pan:false
		        		}
		        	},
		        	grid:{
		        		show:true
		        	}
				},
				callback:{
					
					initComplete: function(chartContext, config){
						$(".apexcharts-zoomout-icon").addClass("kt-margin-0");
						$(".apexcharts-reset-icon").addClass("kt-margin-0");
						$(".apexcharts-toolbar").addClass("kt-margin-10");
						$(".apexcharts-toolbar").attr("style", "top:-20px; right: 10px;");
						$(".apexcharts-toolbar").removeAttr("style[padding]");
					}
				}
			});
		 }
 	
 	var drawVelocityChart = function(){
 		var chart = $.osl.chart.setting("apex","velocityChart",{
 			data:{
				
				url: "<c:url value='/spr/spr1000/spr1000/selectSpr1000VelocityChartInfoAjax.do'/>",
				
				param:{
					 data: paramSprId,
					 totalSprPoint: totalSprPoint,
					 endSprPoint: endSprPoint,
					 
					 key: {
						 key1: "sprPoint",
						 key2: "commitSprPoint",
						 key3: "actualVelocity",
						 key4: "commitVelocity",
					 },
					 
					 keyNm:{
						 keyNm1: "실제 완료 스토리포인트",
						 keyNm2: "약속된 완료 스토리포인트",
						 keyNm3: "실제 진행 속도",
						 keyNm4: "약속된 진행 속도",
					 },
					 keyType:{
						 keyType1:"bar",
						 keyType2:"bar",
						 keyType3:"line",
						 keyType4:"line"
					 }
					 ,
					 
					 xKey:"term",
					 
					 chartType:"mix"
				 },
				 type: "remote"
			},
			chart:{
				
				colors: ["#ffb822","#840ad9", "#ffb822","#840ad9"],
			    yaxis: {
					show:true,
					min:0
	        	},
				stroke: {
			    	width: [1, 1, 1, 1],
			        curve: 'straight',
			        dashArray: [0, 0, 5, 5]
			    },
			    animations:{
					enabled:false
				},
			},
			callback:{
				
				initComplete: function(chartContext, config){
					$(".apexcharts-zoomout-icon").addClass("kt-margin-0");
					$(".apexcharts-reset-icon").addClass("kt-margin-0");
					$(".apexcharts-toolbar").addClass("kt-margin-10");
					$(".apexcharts-toolbar").attr("style", "top:-20px; right: 10px;");
					$(".apexcharts-toolbar").removeAttr("style[padding]");
				}
			}
		});
	}
 	
 	
 	var getDataRangeData = function(sttDt, endDT, type, data){
 		
 		
 		
 		var sprPoint = [];
 		$.each(data, function(index, value){
 			var _series = {};
 			_series[value.reqEdDtm] = value.cumSprPoint;
 			sprPoint.push(_series);
 		});
 		
 		
 		if(type=='1'){
 			var resDay = [];
	 	 	var stDay = new Date(sttDt);
	 	   	var edDay = new Date(endDT);    	
	 	  	while(stDay.getTime() <= edDay.getTime()){
	 	  			var ideal = 0;
	 	  			var _mon = (stDay.getMonth()+1);
	 	  			_mon = _mon < 10 ? '0'+_mon : _mon;
	 	  			var _day = stDay.getDate();
	 	  			_day = _day < 10 ? '0'+_day : _day;
	 	  			var _time = stDay.getFullYear() + '-' + _mon + '-' +  _day;
	 	  			if(_time == data.reqEdDtm){
	 	  				resDay.push({"time":stDay.getFullYear() + '-' + _mon + '-' +  _day})
	 	  			}else{  
		 	   		resDay.push({"time":stDay.getFullYear() + '-' + _mon + '-' +  _day});
	 	  			
	 	  			}
	 	   			stDay.setDate(stDay.getDate() + 1);
	 	   			ideal = ideal + 10
	 	   	}
	 	
 		}else if(type=='2'){
 			
 		}
 		
 		
 		var length = resDay.length
 		
 		var step = totalSprPoint / length
 		
 		var start = 0;
 		$.each(resDay, function(index, value){
 			
	 		if(length == 1){
	 			value['idealBurnUPLine'] = totalSprPoint;
	 		
	 		}else if(length == 2){
	 			value['idealBurnUPLine'] = start;
	 			start += totalSprPoint;
	 		
	 		}else{
	 			value['idealBurnUPLine'] = start.toFixed(1);
	 			start += step;
	 		}
 		})
 		
 		
 		var end = totalSprPoint;
 		$.each(resDay, function(index, value){
 			
	 		if(length == 1){
	 			value['idealBurnDownLine'] = totalSprPoint;
	 		
	 		}else if(length == 2){
	 			value['idealBurnDownLine'] = end;
	 			end -= totalSprPoint;
	 		
	 		}else{
	 			value['idealBurnDownLine'] = end.toFixed(1);
	 			end -= step	
	 		}
 		})
 		
 		var today = new Date();
 		
 		for(var dayIndex = 0; dayIndex < resDay.length; dayIndex++){
 			var match = false;
 			
 			var gap = new Date(resDay[dayIndex].time).getTime() - today.getTime()
 			if(gap < 0){
	 			for(var dataIndex = 0 ; dataIndex < data.length ; dataIndex ++){
	 				if(resDay[dayIndex].time == data[dataIndex].reqEdDtm){
	 					match = true;
	 					
	 					resDay[dayIndex]['burnUpSprPoint'] = data[dataIndex].cumSprPoint
	 					resDay[dayIndex]['burnDownSprPoint'] = totalSprPoint - data[dataIndex].cumSprPoint
	 					break;
	 				}
	 			}
	 			
	 			if(!match){
	 				
	 				if(dayIndex == 0){
	 					resDay[dayIndex]['burnUpSprPoint'] = 0;
	 					resDay[dayIndex]['burnDownSprPoint'] = totalSprPoint;
	 				
	 				}else{
		 				resDay[dayIndex]['burnUpSprPoint'] = resDay[dayIndex - 1]['burnUpSprPoint']; 
		 				resDay[dayIndex]['burnDownSprPoint'] = resDay[dayIndex - 1]['burnDownSprPoint']; 
	 				}
	 			}
 			}
 		}
 	   	return resDay;
 	}
 	
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLSpr1004Popup.init();
});
</script>

