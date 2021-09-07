<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<!-- begin :: form -->
<form class="kt-form" id="spr1001">
	<input type="hidden" id="sprId" name="sprId" value="${param.paramSprId}">
	<input type="hidden" id="sprStDt" name="sprStDt" value="${param.paramSprStDt}">
	<input type="hidden" id="sprEdDt" name="sprEdDt" value="${param.paramSprEdDt}">
	<div class="kt-portlet kt-portlet--mobile">
		<div class="kt-portlet__body">
			<div class="row kt-padding-l-20 kt-padding-r-20">
			
			<!-- begin :: 스프린트 이름 -->
				<div class="col-12 text-center kt-margin-t-20"><h1 class="font-weight-bold">${param.paramSprNm}</h1></div>
				<!-- end :: 스프린트 이름 -->
				
				<!-- begin :: 스프린트 시간, 관리자, 설명 -->
				<div class="col-12 text-right">${param.paramSprStDt} - ${param.paramSprEdDt}</div>
				<div class="col-12 text-right">관리자</div>
				<div class="col-12 text-right">${param.paramSprDesc}</div>
				<!-- end :: 스프린트 시간, 관리자, 설명 -->
				
				<!-- begin :: 스프린트 내용 table -->
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
						<div class="col-6 text-center kt-bg-light-dark kt-padding-15 border-right font-weight-bold">스토리 포인트 공수</div>
						<div class="col-6 text-center kt-padding-15" id="sprStat06"></div>
					</div>
				</div>
				<!-- end :: 스프린트 내용 table -->
			</div>
			
			<!-- begin :: 스프린트 차트 -->
			<div class="row kt-padding-l-20 kt-padding-r-20 kt-margin-t-20">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-0 kt-padding-r-10">
					<div class="border osl-min-h-px--140" id="burnUpChart"></div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-l-10 kt-padding-r-0">
					<div class="border osl-min-h-px--140" id="burnDownChart"></div>
				</div>
			</div>
			<!-- end :: 스프린트 차트 -->
			
			<!-- begin :: 스프린트 데이터테이블 전체영역-->
			<div class="row kt-margin-t-20">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="row">
						<!-- begin :: 스프린트 데이터테이블 검색영역 -->
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="osl-datatable-search" data-datatable-id="sprDetailTable"></div>
						</div>
						<!-- end :: 스프린트 데이터테이블 검색영역 -->
						<!-- begin :: 스프린트 데이터테이블 조회버튼 -->
						<div class="col-lg-6 col-md-6 col-sm-12">
							<button type="button" class="btn btn-brand float-right" data-datatable-id="sprDetailTable" data-datatable-action="select" title="스프린트 상세정보 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5">
								<i class="fa fa-list"></i><span>조회</span>
							</button>
						</div>
						<!-- end :: 스프린트 데이터테이블 조회버튼 -->
					</div>
					<!-- begin :: 스프린트 데이터테이블  -->
					<div class="kt_datatable" id="sprDetailTable"></div>
					<!-- end :: 스프린트 데이터테이블  -->
				</div>
			</div>
			<!-- end :: 스프린트 데이터테이블 전체영역 -->
		</div>
	</div>
</form>
<!-- end :: form -->
<!-- begin :: modal-footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand"
		data-dismiss="modal">
		<i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span>
	</button>
</div>
<!-- end :: modal-footer -->
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLSpr1001Popup = function () {
	//스프린트 아이디
	var paramSprId = $("#sprId").val();
	//시작일
	var paramSprStDt = $("#sprStDt").val();
	//종료일
	var paramSprEdDt = $("#sprEdDt").val();
	//배정된 요구사항 데이터
	var chartDataMap = [];
	
	var documentSetting = function(){
		
		// begin:: 스프린트 상세정보 데이터테이블 
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
						//페이지 그룹단위 변경
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
					//ajax로 전달받은 요구사항 값
	 				var reqChartDataList = [];
	 				if($.osl.datatable.list["sprDetailTable"].targetDt.lastResponse.hasOwnProperty('data')){
	 					reqChartDataList = $.osl.datatable.list["sprDetailTable"].targetDt.lastResponse.data;
	 				}
				}
			}
		});
		// end:: 스프린트 상세정보 데이터테이블 
		
		//스프린트 정보 출력
		selectSprInfoStat();
		
				
		//차트 출력
		drawAllChart();
		
	};
	
	var selectSprInfoStat = function(){
 		//AJAX 설정
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000SprInfoStatAjax.do'/>", "async":"true"},{sprId: paramSprId});
 		//AJAX 전송 성공 함수
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				//사용자 목록 저장
 				var sprStat= data.sprStat;
 				//전체 백로그
 				$("#sprStat01").html($.osl.escapeHtml(sprStat.allCntSum));
 				//완료 백로그
 				$("#sprStat02").html($.osl.escapeHtml(sprStat.endCntSum));
 				//미완료 백로그
 				$("#sprStat03").html($.osl.escapeHtml(sprStat.notEndCntSum));
 				//평균 완료시간
 				if($.osl.escapeHtml(sprStat.avgTime)=='NaN'){
	 				$("#sprStat04").html("0");
 				}else{
 					$("#sprStat04").html($.osl.escapeHtml(sprStat.avgTime));
 				}
 				//진척률
 				if($.osl.escapeHtml(sprStat.sprEndPercent)=='NaN'){
	 				$("#sprStat05").html($.osl.escapeHtml("0 %"));
 				}else{
 					$("#sprStat05").html($.osl.escapeHtml(sprStat.sprEndPercent)+" %");
 				}
 				if($.osl.escapeHtml(sprStat.sprPerTime)=='NaN'){
	 				$("#sprStat06").html("0 시간   /  1 스토리 포인트");
 				}else{
 					$("#sprStat06").html($.osl.escapeHtml(sprStat.sprPerTime.toFixed(2)) + "시간 /  1 스토리 포인트");
 				}
 			}
 		});
 		//AJAX 전송
 		ajaxObj.send();
 	};
 	
 	//차트그리기
 	var drawAllChart = function(){
 		var ajaxObj = new $.osl.ajaxRequestAction(
 				{"url":"<c:url value='/spr/spr1000/spr1000/selectSpr1000ChartInfoAjax.do'/>", "async":"true"},{sprId: paramSprId});
 		//AJAX 전송 성공 함수
 		ajaxObj.setFnSuccess(function(data){
 			if(data.errorYn == "Y"){
 				$.osl.alert(data.message,{type: 'error'});
 			}else{
 				
 				var chartData = data.chartData;
 				
 				//차트데이터 가공
 				var seriesData = getDataRangeData(paramSprStDt, paramSprEdDt, "1", chartData);
 				
 				//번업차트 출력
 				drawBurnUpChart(seriesData);
 				
 				//번다운차트 출력
 				drawBurnDownChart(seriesData);
 				
 			}	
 		});
 		
 		ajaxObj.send();
 	}
 	
 	//번업차트그리기	
 	var drawBurnUpChart = function(dateRange){
		 var chart = $.osl.chart.setting("apex","burnUpChart",{
				//차트 데이터 설정
				data:{										
					param:{
						dataArr: dateRange,	
						 //x축 키값
						 xKey:"time",
						 key:{
							 key1:"idealLine",
							 key2:"sprPoint"
						 },
						 keyNm:{
							 keyNm1:"idealLine",
							 keyNm2:"sprPoint"
						 },
						 //차트 타입
						 chartType:"line",
						 dataType: "local"
					}
				},
				fill:{
					type:false
				},
				chart:{
					//라인 색상
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
				        type: 'category',
				        labels: {
				            format: 'dd/MM',
				        }
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
					//차트가 작성 후 실행
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
 	//번다운 차트 그리기
 	var drawBurnDownChart = function(dateRange){
 		 var chart = $.osl.chart.setting("apex","burnDownChart",{
				//차트 데이터 설정
				data:{										
					param:{
						dataArr: dateRange,	
						 //x축 키값
						 xKey:"time",
						 key:{
							 key1:"idealLine",
							 key2:"sprPoint"
						 },
						 keyNm:{
							 keyNm1:"idealLine",
							 keyNm2:"sprPoint"
						 },
						 //차트 타입
						 chartType:"line",
						 dataType: "local"
					}
				},
				chart:{
					//라인 색상
					colors: ["#586272", "#1cac81"],
					title: {
						text: "번다운차트",
						align: "center",
					},
					stroke: {
				          curve: 'straight'
				    },
					xaxis: {
				        type: 'category',
				        labels: {
				            format: 'dd/MM',
				        }
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
					//차트가 작성 후 실행
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
 	
 	
 	//차트 데이터 정제
 	var getDataRangeData = function(sttDt, endDT, type, data){
 		//이상적인 번업라인 데이터 만들기
 		
 		//누적 스토리포인트 날짜:스토리포인트 형태로 변환
 		var sprPoint = [];
 		$.each(data, function(index, value){
 			var _series = {};
 			_series[value.reqEdDtm] = value.cumSprPoint;
 			sprPoint.push(_series);
 		});
 		
 		//시작일자와 종료일자 사이의 날짜를 일별로 자르기.
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
	 	//주별로
 		}else if(type=='2'){
 			
 		}
 		//이상적인 번업라인 데이터 작성
 		//일수
 		var length = resDay.length
 		//총 완료된 스토리포인트 최댓값 가져와서 / 일수로 나누기
 		var step = Object.values(sprPoint[sprPoint.length-1]) / length
 		
 		var start = 0;
 		$.each(resDay, function(index, value){
 			start += step	
 			value['idealLine'] = start.toFixed(1);
 		})
 		//스토리포인트 데이터 작성
 		for(var dayIndex = 0; dayIndex < resDay.length; dayIndex++){
 			var match = false;
 			for(var dataIndex = 0 ; dataIndex < data.length ; dataIndex ++){
 				if(resDay[dayIndex].time == data[dataIndex].reqEdDtm){
 					match = true;
 					//매치할 경우 가져온 데이터에서 할당한다.
 					resDay[dayIndex]['sprPoint'] = data[dataIndex].cumSprPoint
 					break;
 				}
 			}
 			//매치하지 않을 경우
 			if(!match){
 				//처음 시작은 0으로
 				if(dayIndex == 0){
 					resDay[dayIndex]['sprPoint'] = 0;
 				//매치하지 않을 경우 전의 sprPoint를 가져와서 할당한다.
 				}else{
	 				resDay[dayIndex]['sprPoint'] = resDay[dayIndex - 1]['sprPoint']; 
 				}
 			}
 		}
 	   	return resDay;
 	}
 	
	return {
        // public functions
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLSpr1001Popup.init();
});
</script>
<!-- end script -->
