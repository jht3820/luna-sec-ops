<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form class="kt-form" id="spr1001">
	<input type="hidden" id="sprId" name="sprId" value="${param.paramSprId}">
	<input type="hidden" id="sprStDt" name="sprStDt" value="${param.paramSprStDt}">
	<input type="hidden" id="sprEdDt" name="sprEdDt" value="${param.paramSprEdDt}">
	<input type="hidden" id="sprTypeCd" name="sprTypeCd" value="${param.paramSprTypeCd}">
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__body">
			<div class="row kt-padding-l-20 kt-padding-r-20">
			
			
				<div class="col-12 text-center kt-margin-t-20"><h1 class="font-weight-bold">${param.paramSprNm}</h1></div>
				
				
				
				<div class="col-12 text-right">${param.paramSprStDt} - ${param.paramSprEdDt}</div>
				<div class="col-12 text-right">관리자</div>
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
			
			
			<div class="row kt-padding-l-20 kt-padding-r-20 kt-margin-t-20">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-0 kt-padding-r-10">
					<div class="border osl-min-h-px--140" id="burnUpChart"></div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-10 kt-padding-r-0">
					<div class="border osl-min-h-px--140" id="burnDownChart"></div>
				</div>
			</div>
			
			
			
			<div class="row kt-margin-t-20">
				<div class="col-lg-12 col-md-12 col-sm-12">
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
</form>


<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand"
		data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>



<script>
"use strict";
var OSLSpr1001Popup = function () {
	
	var paramSprId = $("#sprId").val();
	
	var paramSprStDt = $("#sprStDt").val();
	
	var paramSprEdDt = $("#sprEdDt").val();
	
	var paramSprTypeCd = $("#sprTypeCd").val();
	
	var totalSprPoint = 0;
	
	var chartDataMap = [];
	
	var documentSetting = function(){
		
		
		$.osl.datatable.setting("sprDetailTable",{
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
						
						}else if(paramSprTypeCd == '03'){
							
							var timeRequired = new Date(paramSprEdDt) - new Date(row.reqStDtm);
							timeRequired = (timeRequired % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60).toFixed(2);
							return timeRequired;
						}
						
						else if(row.reqProType == '04'){
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
				}
			}
		});
		
		
		
		selectSprInfoStat();
		
		
		drawAllChart();
		
	};
	
	var selectSprInfoStat = function(){
 		
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000SprInfoStatAjax.do'/>", "async":"true"},{sprId: paramSprId});
 		
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
 					$("#sprStat04").html($.osl.escapeHtml(sprStat.avgTime.toFixed(2)));
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
 				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000ChartInfoAjax.do'/>", "async":"true"},{sprId: paramSprId});
 		
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				
 				var chartData = data.chartData;
 				
 				
 				var seriesData = getDataRangeData(paramSprStDt, paramSprEdDt, "1", chartData);
 				
 				
 				drawBurnUpChart(seriesData);
 				
 				
 				drawBurnDownChart(seriesData);
 				
 				
 				if(paramSprTypeCd == "03"){
 					drawVelocityChart();
 				}
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
				          curve: 'smooth'
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
					
					colors: ["#586272", "#1cac81"],
					title: {
						text: "번다운차트",
						align: "center",
					},
					stroke: {
				          curve: 'smooth'
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
 			value['idealBurnUPLine'] = start.toFixed(1);
 			start += step	
 		})
 		
 		
 		var end = totalSprPoint;
 		$.each(resDay, function(index, value){
 			value['idealBurnDownLine'] = end.toFixed(1);
 			end -= step	
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
	OSLSpr1001Popup.init();
});
</script>

