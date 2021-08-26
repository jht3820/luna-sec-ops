
var OSLCoreChartSetting = function () {
	차트 라이브러리 종류
	var chartLibrary = ["apex"];
	
	
	var chartSetting = function(chartLib, targetId, config){
		
		내부에서 추가된 charts 목록
		var charts = {};		
		차트 데이터 chartArrays
		var chartArrays = {};
		
		id값 없는 경우 skip
		if($.osl.isNull(targetId)){
		}
		chartLib값 없는 경우 apex로 기본 설정
		if($.osl.isNull(chartLib)){
			chartLib = "apex";
		}

		var targetObj = $("#"+targetId);
		if(targetObj.length > 0){
			chartLibrary["apex"] = function(){
				공통 설정
				var chartConfig = {
					data: {
						url:"",
						param:"",
						데이터 arr 데이터만 전달시
						dataArr:"",
						그래프 키값 key1, key2 ...순으로 입력
						key:{},
						x축 값
						xKey:"",
						y축 값
						yKey:"",
					},
					chart: {
						height: 320,
						type: "", line, area, bar, heatmap
						stacked: false,
						toolbar : {
							show: true,
							offsetX: 0,
							offsetY: 0,
							tools: {
								download: true,
								selection: true,
								zoom: false,
								zoomin: '<i class="fa fa-plus-circle osl-icon-transform__scale--150"><i>',
								zoomout: '<i class="fa fa-minus-circle osl-icon-transform__scale--150"><i>',
								pan: '<i class="fa fa-expand-arrows-alt osl-icon-transform__scale--150"><i>',
								reset: '<i class="fa flaticon2-refresh-1"><i>',
								customIcons: [
									
								]
							}
						},
						events:{
							차트가 그려지기 전 실행
							beforeMount: $.noop,
							차트가 그려진 후 실행
							mounted: $.noop,
							차크의 영역을 클릭하면 실행
							click: $.noop,
						}
					},
					grid:{
						show: false
					},
					noData:{
						text : $.osl.lang("stm2100.chart.noData"),
						align : "center",
						verticalAlign: "middle",
						offsetX: 0,
						offsetY: 0,
					},
					fill:{
						type : "gradient",
						gradient : {
							shadeIntensity: 1,
							opacityFrom: 0.7,
							opacityTo: 0.9,
							stops: [0, 90, 100]
						}
					},
					xaxis: {
						show: false
					},
					yaxis:{
						show: false
					},
					colors: [],
					series: [],
					callback: {
						
						initComplete: $.noop,
						
						ajaxDone: $.noop,
					},
					actionFn:{},
					
					reloaded: function(dataArr){
						차트 데이터 초기화 
						chartArrays=[];
						targetConfig.xaxis.categories = [];
						targetConfig.yaxis.categories = [];
						
						if($.osl.isNull(dataArr)){
							var ajaxObj = new $.osl.ajaxRequestAction({"url": targetConfig.data.url, "async": false}, targetConfig.data.param);
							ajax 전송 성공 함수
					    	ajaxObj.setFnSuccess(function(data){
					    		if(data.errorYn == "Y"){
									$.osl.alert(data.message,{type: 'error'});
								}else{
									targetConfig.lastResponse = data;
									apexEvt[targetConfig.data.param.chartType](data.chartData);
									charts.targetCt.updateSeries(targetConfig.series ,true);
									targetConfig.callback.ajaxDone(data, data.chartData);
								}
					    	});
				
					    	AJAX 전송
							ajaxObj.send();
						}else{
							apexEvt[targetConfig.data.param.chartType](dataArr);
							targetConfig.lastResponse = targetConfig.data.param.dataArr;
							charts.targetCt.updateSeries(targetConfig.series ,true);
						}
					}
				}

				config 깊은 복사
				var targetConfig = $.extend(true, {}, chartConfig);
					
				깊은 복사
				targetConfig = $.extend(true, targetConfig, config);
				
				var apexEvt = {
					"area": function(array){
						key값에 따라 객체 생성
						$.each(array, function(idx, value){
							for(var idx = 1; idx <= Object.keys(config.data.param.key).length ;idx++){
								if(!chartArrays.hasOwnProperty(config.data.param.key["key"+idx])){
									chartArrays[config.data.param.key["key"+idx]]=[]
								}
								chartArrays[config.data.param.key["key"+idx]].push( value[config.data.param.key["key"+idx]] );
							}키값에 따라 배열 생성
							
							if(!$.osl.isNull(config.data.param.xKey)){
								if(!chartArrays.hasOwnProperty(config.data.param.xKey)){
									chartArrays[config.data.param.xKey]=[];
								}
								chartArrays[config.data.param.xKey].push( value[config.data.param.xKey] );
							}
							if(!$.osl.isNull(config.data.param.yKey)){
								if(!chartArrays.hasOwnProperty(config.data.param.xKey)){
									chartArrays[config.data.param.yKey]=[];
								}
								chartArrays[config.data.param.yKey].push( value[config.data.param.yKey] );
							}
						});
						
						차트 데이터 셋팅
						for(var idx = 0; idx < Object.keys(config.data.param.key).length ;idx++){
							targetConfig.series[idx]={name:config.data.param.keyNm["keyNm"+(idx+1)]};
							if(!$.osl.isNull(chartArrays[config.data.param.key["key"+(idx+1)] ])){
								targetConfig.series[idx].data=chartArrays[config.data.param.key["key"+(idx+1)] ];
							}else{
								targetConfig.series[idx].data=[];
							}
						}
						
						x축  y축 데이터 셋팅
						if(!$.osl.isNull(config.data.param.xKey)){
							targetConfig.xaxis.categories = chartArrays[config.data.param.xKey ];
						}
						if(!$.osl.isNull(config.data.param.yKey)){
							targetConfig.yaxis.categories = chartArrays[config.data.param.yKey ];
						}
					},
					"heatmap": function(data){
						heatMap 기본 설정
						targetConfig = $.extend(true, targetConfig, {
							dataLabels: {
								enabled: false
							},
							chart: {
								toolbar: {
									show:false
								}
							},
							xaxis:{
								labels:{show:false},
								axisBorder:{show:false},
								axisTicks:{show:false},
								crosshairs:{show:false},
								tooltip: {enabled: false}
							},
							yaxis:{
								labels:{show:false},
								axisBorder:{show:false},
								axisTicks:{show:false},
								crosshairs:{show:false},
								tooltip: {enabled: false}
							},
							legend:{
								position: 'bottom',
								horizontalAlign: 'right'
							},
							plotOptions:{
								heatmap:{
									radius: 0,reverseNegativeShade: false,
									enableShades: false,
									useFillColorAsStroke: false
								}
							}
						});
						
						x:y = 2:1
						var dataSize = (data.length2);
						if(dataSize < 0){
							dataSize = 1;
						}
						var yCnt = Math.round(Math.sqrt(dataSize));
						var xCnt = Math.round(yCnt*2);
						var yCursor = 0;
						var xCursor = 0;
						
						var series = [];
						var seriesX = [];
						
						cursor
						var cursor = 0;
						
						요구사항 loop
						$.each(data, function(idx, info){
							x축 데이터
							seriesX.push({
								x: (xCursor).toString(),
							});
							seriesX[xCursor].y = info[targetConfig.data.param.yKey]; 
							for(var i = 1; i <= Object.keys(targetConfig.data.param.key).length ;i++){
								seriesX[xCursor][targetConfig.data.param.key["key"+i]] = info[targetConfig.data.param.key["key"+i]];
							}
							
							xCursor++;
							
							
							x축이 가득 차는경우 초기화
							if(xCursor >= xCnt || idx == (data.length-1)){
								xCursor = 0;
								series.push({
									name: yCursor,
									data: seriesX
								});
								yCursor++;
								seriesX = [];
							}
						});
						
						targetConfig.series = series;
					},
					"line": function(array){
						key값에 따라 객체 생성
						$.each(array, function(idx, value){
							for(var idx = 1; idx <= Object.keys(config.data.param.key).length ;idx++){
								if(!chartArrays.hasOwnProperty(config.data.param.key["key"+idx])){
									chartArrays[config.data.param.key["key"+idx]]=[]
								}
								chartArrays[config.data.param.key["key"+idx]].push( value[config.data.param.key["key"+idx]] );
							}키값에 따라 배열 생성
							
							if(!$.osl.isNull(config.data.param.xKey)){
								if(!chartArrays.hasOwnProperty(config.data.param.xKey)){
									chartArrays[config.data.param.xKey]=[];
								}
								chartArrays[config.data.param.xKey].push( value[config.data.param.xKey] );
							}
							if(!$.osl.isNull(config.data.param.yKey)){
								if(!chartArrays.hasOwnProperty(config.data.param.xKey)){
									chartArrays[config.data.param.yKey]=[];
								}
								chartArrays[config.data.param.yKey].push( value[config.data.param.yKey] );
							}
						});
						
						차트 데이터 셋팅
						for(var idx = 0; idx < Object.keys(config.data.param.key).length ;idx++){
							targetConfig.series[idx]={name:config.data.param.keyNm["keyNm"+(idx+1)]};
							if(!$.osl.isNull(chartArrays[config.data.param.key["key"+(idx+1)] ])){
								targetConfig.series[idx].data=chartArrays[config.data.param.key["key"+(idx+1)] ];
							}else{
								targetConfig.series[idx].data=[];
							}
						}
						
						x축  y축 데이터 셋팅
						if(!$.osl.isNull(config.data.param.xKey)){
							targetConfig.xaxis.categories = chartArrays[config.data.param.xKey ];
						}
						if(!$.osl.isNull(config.data.param.yKey)){
							targetConfig.yaxis.categories = chartArrays[config.data.param.yKey ];
						}
					},
					"colum": function(array){
						targetConfig.chart.type="bar";
						targetConfig.yaxis = {show:true};
						key값에 따라 객체 생성
						$.each(array, function(idx, value){
							for(var idx = 1; idx <= Object.keys(config.data.param.key).length ;idx++){
								if(!chartArrays.hasOwnProperty(config.data.param.key["key"+idx])){
									chartArrays[config.data.param.key["key"+idx]]=[]
								}
								chartArrays[config.data.param.key["key"+idx]].push( value[config.data.param.key["key"+idx]] );
							}키값에 따라 배열 생성
							
							if(!$.osl.isNull(config.data.param.xKey)){
								if(!chartArrays.hasOwnProperty(config.data.param.xKey)){
									chartArrays[config.data.param.xKey]=[];
								}
								chartArrays[config.data.param.xKey].push( value[config.data.param.xKey] );
							}
							if(!$.osl.isNull(config.data.param.yKey)){
								if(!chartArrays.hasOwnProperty(config.data.param.xKey)){
									chartArrays[config.data.param.yKey]=[];
								}
								chartArrays[config.data.param.yKey].push( value[config.data.param.yKey] );
							}
						});
						
						차트 데이터 셋팅
						for(var idx = 0; idx < Object.keys(config.data.param.key).length ;idx++){
							targetConfig.series[idx]={name:config.data.param.keyNm["keyNm"+(idx+1)]};
							if(!$.osl.isNull(chartArrays[config.data.param.key["key"+(idx+1)] ])){
								targetConfig.series[idx].data=chartArrays[config.data.param.key["key"+(idx+1)] ];
							}else{
								targetConfig.series[idx].data=[];
							}
						}
						
						x축  y축 데이터 셋팅
						if(!$.osl.isNull(config.data.param.xKey)){
							targetConfig.xaxis.categories = chartArrays[config.data.param.xKey ];
						}
						if(!$.osl.isNull(config.data.param.yKey)){
							targetConfig.yaxis.categories = chartArrays[config.data.param.yKey ];
						}
					}
				}
				
				외부 버튼 Evt 함수
				var btnEvt = {
					list : function(){
						각 버튼에 이벤트 걸기
						if($("[data-chart-id="+targetId+"][data-chart-action]").length > 0){
							$.each($("[data-chart-id="+targetId+"][data-chart-action]"), function(idx, map){
								var btnChartId = $(map).data("chart-id");
								var btnAction = $(map).data("chart-action");
								
								action별 동작 호출
								if(btnEvt.action.hasOwnProperty(btnAction)){
									btnEvt.action[btnAction](this, btnChartId, "list");
								}else{
									action 없는경우 사용자 설정 값에 해당 함수 있는지 체크
									if(targetConfig.actionFn.hasOwnProperty(btnAction)){
										$(this).off("click");
										$(this).click(function(event){
											중복 이벤트 중지
											event.cancelable = true;
											event.stopPropagation();
											event.preventDefault();
											event.returnValue = false;
											
											targetConfig.actionFn[btnAction](this, btnChartId, "list");
										});
									}
								}
							});
						}
					},
					action: {
						"select": function(elem, chartId, bubleFlag){
							$(elem).off("click");
							$(elem).click(function(event){
								if(bubleFlag != false){
									중복 이벤트 중지
									event.cancelable = true;
									event.stopPropagation();
									event.preventDefault();
									event.returnValue = false;
								}
								
								사용자 정의함수에 select가 있는 경우 함수 호출 - url이 없는 경우 재정의 해서 사용해야함
								if(charts.config.actionFn.hasOwnProperty("select")){
									해당 chart select 로직 가져오기
									charts.config.actionFn["select"](elem, chartId, charts.targetCt);
								}
								select없는 경우 데이터테이블 기본 조회 동작 - url이 있는 경우만 ajax로 reload
								else{
									if(!$.osl.isNull(targetConfig.data.param.url)){
										var ajaxObj = new $.osl.ajaxRequestAction({"url": targetConfig.data.url, "async": false}, targetConfig.data.param);
										ajax 전송 성공 함수
								    	ajaxObj.setFnSuccess(function(data){
								    		if(data.errorYn == "Y"){
												$.osl.alert(data.message,{type: 'error'});
											}else{
												targetConfig.lastResponse = data;
												차트 데이터 초기화 
												chartArrays=[];
												targetConfig.xaxis.categories = [];
												targetConfig.yaxis.categories = [];
												
												apexEvt[targetConfig.data.param.chartType](data.chartData);
												charts.targetCt.updateSeries(targetConfig.series ,true);
												
												
												targetConfig.callback.ajaxDone(data, data.chartData);
											}
								    	});
							
								    	AJAX 전송
										ajaxObj.send();
									}
								}
							});
						},
						
					}
				}

				차트 타입 설정
				targetConfig.chart.type=targetConfig.data.param.chartType;
				
				차트 데이터를 ajax로 조회
				if($.osl.isNull(targetConfig.data.param.dataArr)){
					차트 작성을 위한 데이터 조회
					var ajaxObj = new $.osl.ajaxRequestAction({"url": targetConfig.data.url, "async": false}, targetConfig.data.param);
					ajax 전송 성공 함수
			    	ajaxObj.setFnSuccess(function(data){
			    		if(data.errorYn == "Y"){
							$.osl.alert(data.message,{type: 'error'});
						}else{
							targetConfig.lastResponse = data;
							apexEvt[targetConfig.data.param.chartType](data.chartData);
							
							targetConfig.callback.ajaxDone(data, data.chartData);
						}
			    	});
		
			    	AJAX 전송
					ajaxObj.send();
				}else{
					차트 데이터가 있는 경우
					targetConfig.lastResponse = targetConfig.data.param.dataArr;
					apexEvt[targetConfig.data.param.chartType](targetConfig.data.param.dataArr);
				}
				
				전체 버튼 이벤트 대입
				btnEvt.list();
				
				차트 생성후 실행
				targetConfig.chart.events.mounted = function(chartContext, config){
					targetConfig.callback.initComplete(chartContext, config);
				}
				
				차트 생성
				var chartsInfo = new ApexCharts(document.querySelector("#"+targetId), targetConfig);
				charts = {"config": targetConfig, "targetCt": chartsInfo};
				
				생성된 데이터 저장
				$.osl.chart.list[targetId] = charts;
				chartsInfo.render();
				
				
			}
		}
		
		차트 라이브러리 종류에 따라 함수 실행
		if(chartLibrary.includes(chartLib)){
			chartLibrary[chartLib]();
		}else{
			$.osl.toastr("지원하지 않는 차트 라이브러리입니다.",{"type":"error"});
		}
		
	}
	
    return {
         public functions
        init: function() {
        	core에 차트 세팅
    		$.osl.chart.setting = chartSetting;
        }
    };
}();