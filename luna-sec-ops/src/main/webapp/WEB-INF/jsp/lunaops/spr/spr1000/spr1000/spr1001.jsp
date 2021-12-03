<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form class="kt-form" id="spr1001">
	<input type="hidden" id="sprId" name="sprId" value="${param.paramSprId}">
	<input type="hidden" id="sprStDt" name="sprStDt" value="${param.paramSprStDt}">
	<input type="hidden" id="sprEdDt" name="sprEdDt" value="${param.paramSprEdDt}">
	<input type="hidden" id="sprTypeCd" name="sprTypeCd" value="${param.paramSprTypeCd}">
	<input type="hidden" id="sprTypeNm" name="sprTypeNm" value="${param.paramSprTypeNm}">
	<input type="hidden" id="sprRestDay" name="sprRestDay" value="${param.paramSprRestDay}">
	<input type="hidden" id="sprEndPercent" name="sprEndPercent" value="${param.paramSprEndPercent}">
	<input type="hidden" id="sprUseCd" name="sprUseCd" value="${param.paramUseCd}">
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__body">
			<div class="row kt-padding-l-20 kt-padding-r-20">
				
				<div class="col-lg-5 col-md-12 col-sm-12 col-12 d-flex align-items-center">
					<div class="d-flex kt-padding-l-15">
						<div id="sprTypeCdCircle" class="kt-media kt-media--xl kt-media--circle osl-margin-r-2rm"><span id="sprTypeCdSpan"></span></div>
						<div class="d-flex flex-column osl-margin-r-auto osl-word__break">
							<h5 id="sprNm" class="kt-font-boldest text-truncate" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="">${param.paramSprNm}</h5>
							<span id="sprDesc" class="text-muted text-truncate" title="" data-toggle="kt-tooltip" data-skin="brand" data-placement="top" data-original-title="">${param.paramSprDesc}</span>
						</div>
					</div>	
				</div>
				
				<div class="col-lg-7 col-md-12 col-sm-12 col-12">
					<div class="d-flex flex-wrap osl-margin-t-2rm kt-padding-l-20">
						<div class="osl-margin-r-3rm osl-margin-b-175rm d-flex flex-column">
							<span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>시작일</span>
							<h5><span class="badge badge-primary">${param.paramSprStDt}</span></h5>
						</div>
						<div class="osl-margin-r-3rm osl-margin-b-175rm d-flex flex-column">
							<span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>종료일</span>
							<h5><span class="badge badge-danger">${param.paramSprEdDt}</span></h5>
						</div>
						<div class="osl-margin-r-3rm osl-margin-b-175rm d-flex flex-column">
							<span class="osl-margin-b-1rm"><i class="far fa-calendar-alt kt-font-brand kt-margin-r-5"></i>남은 일수</span>
							<h5><span class="badge badge-warning osl-min-width-85">${param.paramRestDay}</span></h5>
						</div>
						<div class="osl-flex-row-fluid osl-margin-b-175rm">
							<div class="osl-progress">
								<div class="osl-margin-b-1rm">
									<i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i>
									<span>진척률</span>
								</div>
								<div class="progress osl-prj-group-md">
									<div id="progressBar" class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width:0" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="d-flex flex-wrap">
				<div class="kt-pricing-v1">
					<div class="kt-pricing-v1__header">
						<div class="kt-iconbox osl-remove__box-shadow">
							<div class="kt-iconbox__icon">
								<div class="kt-iconbox__icon-bg"></div>
								<img src="/media/osl/icon/reqAll.png">
							</div>
						</div>
					</div>
					<div class="kt-pricing-v1__body">
						<div class="kt-iconbox__title">
							전체 배정 백로그
						</div>
						<div class="kt-pricing-v1__price" id="sprStat01">
							<span class="kt-pricing-v1__price-currency">개</span>
						</div>
					</div>
				</div>
				<div class="kt-pricing-v1">
					<div class="kt-pricing-v1__header">
						<div class="kt-iconbox osl-remove__box-shadow">
							<div class="kt-iconbox__icon">
								<div class="kt-iconbox__icon-bg"></div>
								<img src="/media/osl/icon/reqDone.png">
							</div>
						</div>
					</div>
					<div class="kt-pricing-v1__body">
						<div class="kt-iconbox__title">
							최종 완료 백로그
						</div>
						<div class="kt-pricing-v1__price" id="sprStat02">
							<span class="kt-pricing-v1__price-currency">개</span>
						</div>
					</div>
				</div>
				<div class="kt-pricing-v1">
					<div class="kt-pricing-v1__header">
						<div class="kt-iconbox osl-remove__box-shadow">
							<div class="kt-iconbox__icon">
								<div class="kt-iconbox__icon-bg"></div>
								<img src="/media/osl/icon/reqPointer.png">
							</div>
						</div>
					</div>
					<div class="kt-pricing-v1__body">
						<div class="kt-iconbox__title">
							미 완료 백로그
						</div>
						<div class="kt-pricing-v1__price" id="sprStat03">
							<span class="kt-pricing-v1__price-currency">개</span>
						</div>
					</div>
				</div>
				<div class="kt-pricing-v1">
					<div class="kt-pricing-v1__header">
						<div class="kt-iconbox osl-remove__box-shadow">
							<div class="kt-iconbox__icon">
								<div class="kt-iconbox__icon-bg"></div>
								<img src="/media/osl/icon/reqInProgress.png">
							</div>
						</div>
					</div>
					<div class="kt-pricing-v1__body">
						<div class="kt-iconbox__title">
							평균 완료 소요시간
						</div>
						<div class="kt-pricing-v1__price" id="sprStat04">
							<span class="kt-pricing-v1__price-currency">시간</span>
						</div>
					</div>
				</div>
				<div class="kt-pricing-v1">
					<div class="kt-pricing-v1__header">
						<div class="kt-iconbox osl-remove__box-shadow">
							<div class="kt-iconbox__icon">
								<div class="kt-iconbox__icon-bg"></div>
								<img src="/media/osl/icon/reqInProgress.png">
							</div>
						</div>
					</div>
					<div class="kt-pricing-v1__body">
						<div class="kt-iconbox__title">
							완료 스토리 포인트 공수
						</div>
						<div class="kt-pricing-v1__price" id="sprStat06">
							<span class="kt-pricing-v1__price-currency">시간 /  1 스토리 포인트</span>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<div class="kt-portlet">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<h5 class="kt-font-boldest kt-font-brand">
					<i class="fa fa-th-large kt-margin-r-5"></i>스프린트 차트
				</h5>
			</div>
		</div>
		<div class="kt-portlet__body">
			
			<div class="row kt-margin-0">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-0 kt-padding-r-10">
					<div class="border rounded-sm osl-card__data--empty osl-min-h-px--365" id="burnUpChart"></div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-10 kt-padding-r-0">
					<div class="border rounded-sm osl-card__data--empty osl-min-h-px--365" id="burnDownChart"></div>
				</div>
			</div>
			<div class="row kt-margin-0 kt-margin-t-20 osl-user__active--block" id="velocityChartWrap">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 kt-padding-l-0 kt-padding-r-0">
					<div class="border rounded-sm osl-min-h-px--140" id="velocityChart"></div>
				</div>
			</div>
			
		</div>
	</div>
	<div class="kt-portlet kt-margin-b-0">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<h5 class="kt-font-boldest kt-font-brand">
					<i class="fa fa-th-large kt-margin-r-5"></i>스프린트 데이터 테이블
				</h5>
			</div>
		</div>
		<div class="kt-portlet__body kt-padding-b-0">
			
			<div class="row kt-margin-0">
				
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
</form>


<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand"
		data-dismiss="modal">
		<i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span>
	</button>
</div>



<script>
"use strict";
var OSLSpr1001Popup = function () {
	
	var paramSprId = $("#sprId").val();
	
	var paramSprStDt = $("#sprStDt").val();
	
	var paramSprEdDt = $("#sprEdDt").val();
	
	var paramSprTypeCd = $("#sprTypeCd").val();
	
	var paramSprTypeNm = $("#sprTypeNm").val();
	
	var paramSprNm = $("#sprNm").val();
	
	var paramSprDesc = $("#sprDesc").val();
	
	var paramSprEndPercent = $("#sprEndPercent").val();
	
	var paramUseCd = $("#sprUseCd").val();
	
	var totalSprPoint = 0;
	
	var endSprPoint = 0;
	
	var chartDataMap = [];
	
	var endReqSpendTime = [];
	var documentSetting = function(){
		
			
			var sprTypeClass = "kt-media--primary";
			var sprTypeNm = paramSprTypeNm;
			
			if(paramSprTypeCd == "02"){
				sprTypeClass = "kt-media--danger";
			}else if(paramSprTypeCd == "03"){
				sprTypeClass = "kt-media--warning";
			}
			
			else if(paramUseCd == "02"){
				sprTypeClass = "kt-media--dark";
				sprTypeNm = "미 사용";
			}
			
			$("#sprTypeCdCircle").addClass(sprTypeClass);
			
			$("#sprTypeCdSpan").text(sprTypeNm);
			
			
			$("#progressBar").css("width", paramSprEndPercent+"%");
			
			$("#progressBar").attr("aria-valuenow", paramSprEndPercent);
			
			$("#progressBar").text(paramSprEndPercent+"%");
			
			
			$("#sprNm").data("original-title", paramSprNm);
			$("#sprDesc").data("original-title", paramSprDesc);
			
		
		$.osl.datatable.setting("sprDetailTable",{
			data: {
				source: {
					read: {
						url: "/spr/spr1000/spr1000/selectSpr1000SprReqListAjax.do",
						params:{
							sprId: paramSprId,
							sprType: paramSprTypeCd
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
							return row.reqChargerNm = "-";
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
						var spendTime = calcSpendTime(row);
						
						if(row.reqProType == "04"){
							endReqSpendTime.push(Number(spendTime));
						}
						return spendTime + "시간";
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
			rows:{
				minHeight:50,
			},
			callback:{
				ajaxDone:function(evt, list){
					
	 				var reqChartDataList = [];
	 				if($.osl.datatable.list["sprDetailTable"].targetDt.lastResponse.hasOwnProperty('data')){
	 					reqChartDataList = $.osl.datatable.list["sprDetailTable"].targetDt.lastResponse.data;
	 				}
	 				if($("#burnDownChart").children().length == 0){
		 				
		 				selectSprInfoStat();
		 				
		 				drawAllChart();
	 				}
				}
			}
		});
		
		
	};
	
	var selectSprInfoStat = function(){
 		
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000SprInfoStatAjax.do'/>", "async":"false"},{sprId: paramSprId,sprType: paramSprTypeCd});
 		
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				var timeSum = 0;
 				for(var index = 0;index < endReqSpendTime.length;index++){
 					timeSum+=endReqSpendTime[index];
 				}
 				
 				var sprStat= data.sprStat;
 				
 				$("#sprStat01").prepend($.osl.escapeHtml(sprStat.allCntSum));
 				
 				$("#sprStat02").prepend($.osl.escapeHtml(sprStat.endCntSum));
 				
 				$("#sprStat03").prepend($.osl.escapeHtml(sprStat.notEndCntSum));
 				
 				if(endReqSpendTime.length == 0){
	 				$("#sprStat04").prepend("0");
 				}else{
 					$("#sprStat04").prepend(endReqSpendTime.reduce(getMean,0).toFixed(2));
 				}
 			
 				
 				if($.osl.escapeHtml(sprStat.sprEndPercent)=='NaN'){
	 				$("#sprStat05").prepend($.osl.escapeHtml("0"));
 				}else{
 					$("#sprStat05").prepend($.osl.escapeHtml(sprStat.sprEndPercent.toFixed(2)));
 				}
 				var sprPerTime = timeSum/sprStat.endSprPoint;
 				
 				if($.osl.escapeHtml(sprStat.sprPerTime)=='NaN'){
	 				$("#sprStat06").prepend("0");
 				}else{
 					$("#sprStat06").prepend($.osl.escapeHtml(sprPerTime.toFixed(2)));
 				}
 				
 				
 				totalSprPoint = sprStat.sprPoint;
 			}
 		});
 		
 		ajaxObj.send();
 	};
 	
 	
 	var drawAllChart = function(){
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000ChartInfoAjax.do'/>", "async":"false"},{sprId: paramSprId,sprType: paramSprTypeCd});
 		
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				
 				var chartData = data.chartData;
 				
 				
 				var seriesData = getDataRangeData(paramSprStDt, paramSprEdDt, "1", chartData);
 				if(paramSprTypeCd == '01'){
 					$("#burnDownChart").text("데이터 없음");
 					$("#burnUpChart").text("데이터 없음");
 				}else{
	 				
	 				drawBurnUpChart(seriesData);
	 				
	 				drawBurnDownChart(seriesData);
 				}
 				
 				if(chartData.length == 0){
					endSprPoint = 0	 					
 				}else{
	 				
	 				endSprPoint = chartData[chartData.length - 1].cumSprPoint;
 				}
 				
 				if(paramSprTypeCd == "03"){
 					drawVelocityChart();
 					$("#velocityChartWrap").removeClass("osl-user__active--block");
 				}
 			}	
 		});
 		
 		ajaxObj.send();
 	}
 	
 	var getMean = function(accumulator, value, index, array){
		  var sumOfAccAndVal = accumulator + value;
		  if (index === array.length - 1) {
		    return (sumOfAccAndVal) / array.length;
		  }
		  return sumOfAccAndVal;
	};
 	
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
							 keyNm1:"이상적인 번업 라인",
							 keyNm2:"실제 번업 라인"
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
				    grid: {
				          borderColor: '#e7e7e7',
				          row: {
				            colors: ['#ffb822', 'transparent'], 
				            opacity: 0.5
				          },
				    },
					animations:{
						enabled:false
					},
				    dataLabels:{
				    	enabled:true,
				    	formatter:function(val, opts){
				    		var valIndex = new Date(opts.ctx.data.twoDSeriesX[opts.dataPointIndex]).format("MM-dd");
				    		var xlabelList = opts.w.globals.labels.map(function(x){return new Date(x).format("MM-dd")});
				    		
				    		if(xlabelList.includes(valIndex)){
				    			if($.osl.isNull(val)){
				    				return "";
				    			}
				    			return val;
				    		}else{
					    		return "";
				    		} 
				    	}
				    },
					xaxis: {
						type: 'datetime',
				        labels: {
				        	hideOverlappingLabels :true,
				            formatter: function(value){
				            	return new Date(value).format("MM-dd");
				            }
				        },
				        tickAmount: '15',
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
						$(".apexcharts-menu-item").addClass("osl-min-width-70");
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
							 keyNm1:"이상적인 번다운 라인",
							 keyNm2:"실제 번다운 라인"
						 },
						 
						 chartType:"line",
						 dataType: "local"
					}
				},
				fill:{
					type:false
				},
				chart:{
					
					colors: ["#ffb822", "#840ad9"],
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
				    dataLabels:{
				    	enabled:true,
				    	formatter:function(val, opts){
				    		var valIndex = new Date(opts.ctx.data.twoDSeriesX[opts.dataPointIndex]).format("MM-dd");
				    		var xlabelList = opts.w.globals.labels.map(function(x){return new Date(x).format("MM-dd")});
				    		
				    		if(xlabelList.includes(valIndex)){
				    			if($.osl.isNull(val)){
				    				return "";
				    			}
				    			return val;
				    		}else{
					    		return "";
				    		} 
				    	}
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
				        
				        tickAmount: '15',
				        
				        tickPlacement: 'between',
		        	},
					yaxis: {
						show:true,
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
						$(".apexcharts-menu-item").addClass("osl-min-width-70");
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
					 sprType: paramSprTypeCd,
					 
					 key: {
						 key1: "sprPoint",
						 key2: "commitSprPoint",
						 key3: "actualVelocity",
						 key4: "commitVelocity"
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
					 },
					 
					 xKey:"term",
					 
					 chartType:"mix"
				 },
				 type: "remote"
			},
			chart:{
				title: {
					text: "벨로시티 차트",
					align: "center",
				},
				
				colors: ["#840ad9", "#ffb822","#840ad9", "#ffb822"],
			 	stroke: {
		        	width: [5, 5, 5, 5],
		          	curve: 'straight',
		          	dashArray: [0, 0, 5, 5]
		       },
		       yaxis: {
		    	   show:true,
		    	   min:0,
	    	   },
			},
			callback:{
				
				initComplete: function(chartContext, config){
					$(".apexcharts-zoomout-icon").addClass("kt-margin-0");
					$(".apexcharts-reset-icon").addClass("kt-margin-0");
					$(".apexcharts-toolbar").addClass("kt-margin-10");
					$(".apexcharts-toolbar").attr("style", "top:-20px; right: 10px;");
					$(".apexcharts-toolbar").removeAttr("style[padding]");
					$(".apexcharts-menu-item").addClass("osl-min-width-70");
				}
			}
		});
	}
 	
 	
 	var getDataRangeData = function(sttDt, endDT, type, data){
 		
 		if(paramSprTypeCd == '01'){
 			return [];
 		}
 		
 		if(data.length != 0){
	 		
	 		var sprPoint = [];
	 		$.each(data, function(index, value){
	 			var _series = {};
	 			_series[value.reqEdDtm] = value.cumSprPoint;
	 			sprPoint.push(_series);
	 		});
 		}
 		
 		
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
 		
 		var step = totalSprPoint / (length-1)
 		
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
 		if(data.length != 0){
	 		
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
	 			}else{
	 				resDay[dayIndex]['burnUpSprPoint'] = null;
					resDay[dayIndex]['burnDownSprPoint'] = null;
	 			}
	 		}
 		}
 	   	return resDay;
 	}
 	
 	var calcSpendTime = function(rowData){
 		var wkInfo = rowData;
 		
 		
 		if($.osl.isNull(wkInfo.reqChargerId)){
 			return 0;
 		}
 		
 		if($.osl.isNull(wkInfo.reqStDuDtm) || $.osl.isNull(wkInfo.reqEdDuDtm)){
 			return 0;
 		}
 		
 		if(wkInfo.reqProType == "04"){
 			
 			
 	 		var spendTime = wkInfo.endTimeRequired;
 			
 		
 		}else if(wkInfo.reqProType == "01"){
 			
 			return 0;
 			
 		
 		}else if(paramSprTypeCd == "03"){
 			
 			var spendTime = wkInfo.notEndTimeRequired + 1;
 			
 		
 		}else{
 			
 			var spendTime = wkInfo.notEndTimeRequired;
 		}
 		
 		
 		var wkStTm = moment(wkInfo.wkStTm, "HHmm");
 		
 		var wkEdTm = moment(wkInfo.wkEdTm, "HHmm");
 		
 		var bkStTm = moment(wkInfo.bkStTm, "HHmm");
 		
 		var bkEdTm = moment(wkInfo.bkEdTm, "HHmm");
 		
 		var reqStDtm = moment(wkInfo.reqStDtm, 'YYYY-MM-DD HH:mm:ss');
 		
 		var reqEdDtm = moment(wkInfo.reqEdDtm, 'YYYY-MM-DD HH:mm:ss');
 		
 		var reqStDuDtm = moment(wkInfo.reqStDuDtm, 'YYYY-MM-DD');
 		
 		var reqEdDuDtm = moment(wkInfo.reqEdDuDtm, 'YYYY-MM-DD');
 		
 		
 		var reqStTm = moment(reqStDtm.format("HHmm"),"HHmm");
 		
 		var reqEdTm = moment(reqEdDtm.format("HHmm"),"HHmm");
 		
 		var nowTime = moment(moment().format("HHmm"),"HHmm");
 		
 		
 		var wkDiff = wkEdTm.diff(wkStTm);
 		var bkDiff = bkEdTm.diff(bkStTm);
 		
 		
 		if(wkDiff < 0){
 			wkDiff = wkDiff + 3600000 * 24;
 		}
 		
 		
 		var wkTime = wkDiff-bkDiff;
 		
 		
 		if(wkTime <= 0){
 			return 0;
 		}
 		
 		
 		var stDtWkTm = 0;
 		
 		
 		if(bkStTm.diff(reqStTm) < 0 ){
 			
 			stDtWkTm = wkEdTm.diff(reqStTm) - 3600000;
 		}else if(bkEdTm.diff(reqStTm) <= 0 && bkStTm.diff(reqStTm) >= 0){
 			
 			var restTime = bkEdTm.diff(reqStTm);
 			
 			stDtWkTm = wkEdTm.diff(reqStTm) - restTime;
 		}else{
 			
 			stDtWkTm = wkEdTm.diff(reqStTm)
 		}
 		
 		
 		var edDtWkTm = 0;
 		
 		if(wkInfo.reqProType == "04"){
 			
 	 		if(bkEdTm.diff(reqEdTm) < 0 ){
 	 			
 	 			edDtWkTm = reqEdTm.diff(wkStTm);
 	 		}else if(bkEdTm.diff(reqEdTm) <= 0 && bkStTm.diff(reqEdTm) >= 0){
 	 			
 	 			var restTime = reqEdTm.diff(bkStTm);
 	 			
 	 			edDtWkTm = wkEdTm.diff(reqStTm) - restTime;
 	 		}else{
 	 			
 	 			edDtWkTm = reqEdTm.diff(wkStTm) - 3600000;
 	 		}
 		
 		}else{
 			
 			if(paramSprTypeCd == "03"){
 				
 				
 	 			edDtWkTm = 0;
 				
	 		
 			}else{
 				
 				
	 	 		if(bkEdTm.diff(nowTime) < 0 ){
	 	 			
	 	 			
	 	 			edDtWkTm = reqEdTm.diff(wkStTm);
	 	 			
	 	 		}else if(bkEdTm.diff(nowTime) <= 0 && bkStTm.diff(nowTime) >= 0){
	 	 			
	 	 			
	 	 			var restTime = nowTime.diff(bkStTm);
	 	 			
	 	 			edDtWkTm = nowTime.diff(reqStTm) - restTime;
	 	 			
	 	 		}else{
	 	 			
	 	 			edDtWkTm = nowTime.diff(wkStTm) - 3600000;
	 	 		}
 			}
 		}
 		if($.osl.isNull(wkInfo.reqStDtm) || $.osl.isNull(wkInfo.reqEdDtm)){
 			
 			var reqSpendTime = moment.duration(wkTime).asHours()*spendTime;
 			
 		}else{
	 		
	 		var fullTime = moment.duration(wkTime).asHours()*(spendTime-2);
	 		
	 		var startTime = moment.duration(stDtWkTm).asHours();
	 		
	 		var endTime = moment.duration(edDtWkTm).asHours();
	 		
	 		var reqSpendTime = fullTime + startTime + endTime;
 		}
 		
 		return reqSpendTime.toFixed(1);
 	}
 	
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLSpr1001Popup.init();
});
</script>

