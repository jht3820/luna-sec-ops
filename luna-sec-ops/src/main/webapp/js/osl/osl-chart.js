
var OSLCoreChartSetting = function () {
	
	var chartLibrary = ["apex"];
	
	
	var chartSetting = function(chartLib, targetId, config){
		
		
		var charts = {};		
		
		var chartArrays = {};
		
		var targetObj = $("#"+targetId);
		
		
		if($.osl.isNull(targetId)){
			return true;
		}
		
		if($.osl.isNull(chartLib)){
			chartLib = "apex";
		}
		
		
		var defaultConfig = {
			data: {
				url:"",
				param:{
					xkey:"",
					ykey:"",
					key:{
						
						
					},
					keyNm:{
						
						
					},
					keyType:{
						
						
					},
					chartType: "",
					
					dataArr:[],
					
					xKeyArr:[],
				},
				type: "remote"
			},
			chart:{
				width:"100%",
				height:360,
				
				toolbar : {
					show: true,
					offsetX: 0,
					offsetY: 0,
					tools: {
						download: true,
						selection: true,
						zoom: false,
						zoomin: '<i class="fa fa-plus-circle osl-icon-transform__scale--150"></i>',
						zoomout: '<i class="fa fa-minus-circle osl-icon-transform__scale--150"></i>',
						pan: '<i class="fas fa-arrows-alt osl-icon-transform__scale--150"></i>',
						reset: '<i class="fa flaticon2-refresh-1"></i>',
						customIcons: [
							
						]
					}
				},
				
				colors:[],
				
				labels:{},
				
				legend:{},
				
				tooltip:{},
				
				title:{},
				
				
				xaxis:{
					show: false
				},
				
				yaxis:{
					show: false
				},
				option:{
					heatmap:{

					},
					area:{

					},
					line:{

					},
					bar:{

					},
					colum:{

					}
				}
			},
			callback:{
				
				initComplete: $.noop,
				
				ajaxDone: $.noop,
				
				reloaded: $.noop
			},
			actionFn:{
				
				beforeMount: $.noop,
				
				mounted: $.noop,
				
				click: $.noop
			},
		}
		
		
		
		var btnEvt = {
			list : function(){
				
				if($("[data-chart-id="+targetId+"][data-chart-action]").length > 0){
					$.each($("[data-chart-id="+targetId+"][data-chart-action]"), function(idx, map){
						var btnChartId = $(map).data("chart-id");
						var btnAction = $(map).data("chart-action");
						
						
						if(btnEvt.action.hasOwnProperty(btnAction)){
							btnEvt.action[btnAction](this, btnChartId, "list");
						}else{
							
							if(targetConfig.actionFn.hasOwnProperty(btnAction)){
								$(this).off("click");
								$(this).click(function(event){
									
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
							
							event.cancelable = true;
							event.stopPropagation();
							event.preventDefault();
							event.returnValue = false;
						}
						
						
						if(charts.config.actionFn.hasOwnProperty("select")){
							
							charts.config.actionFn["select"](elem, chartId, charts.targetCt);
						}
						
						else{
							
							var targetConfig = $.osl.chart.list[chartId].config;
							if($.osl.isNull(targetConfig.data.type != "local")){
								targetConfig.callback.reloaded();
							}
						}
					});
				},
				
			}
		}
		
		
		
		var chartEvt = {
			"area": $.noop,
			"line": $.noop,
			"heatmap": $.noop,
			"colum": $.noop,
		}

		
		chartLibrary["apex"] = function(){
			
			var targetConfig = $.extend(true, {}, defaultConfig);
			
			targetConfig = $.extend(true, targetConfig, config);
			
			
			targetConfig = $.extend(true, targetConfig, {
				chart: {
					width: targetConfig.chart.width,
					height: targetConfig.chart.height,
					type: targetConfig.data.param.chartType, 
					toolbar : targetConfig.chart.toolbar,
					events:{
						
						beforeMount: targetConfig.actionFn.beforeMount,
						
						mounted: targetConfig.actionFn.mounted,
						
						click: targetConfig.actionFn.click,
					},
					locales: [{
						"name": "en",
						"options": {
							"toolbar": {
								"exportToCSV": "CSV로 다운로드",
								"exportToSVG": "SVG로 다운로드",
								"exportToPNG": "PNG로 다운로드",
							}
					  }
					}]
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
				
				dataLabels:targetConfig.chart.dataLabels,
				
				markers:targetConfig.chart.markers,
				stroke: targetConfig.chart.stroke,
				xaxis: targetConfig.chart.xaxis,
				
				grid: targetConfig.chart.grid,
				yaxis: targetConfig.chart.yaxis,
				
				title: targetConfig.chart.title,
				
				colors: targetConfig.chart.colors,
				
				tooltip: targetConfig.chart.tooltip,
				plotOptions:{
					heatmap: targetConfig.chart.option.heatmap,
					area: targetConfig.chart.option.area,
					line: targetConfig.chart.option.line,
					bar: targetConfig.chart.option.bar,
					colum: targetConfig.chart.option.colum
				},
				
				series: [],
				callback:{
					reloaded: function(dataArr){
						
						chartArrays=[];
						targetConfig.xaxis.categories = [];
						targetConfig.yaxis.categories = [];
						
						if($.osl.isNull(targetConfig.data.param.dataType != "local")){
							var ajaxObj = new $.osl.ajaxRequestAction({"url": targetConfig.data.url, "async": false}, targetConfig.data.param);
							
					    	ajaxObj.setFnSuccess(function(data){
					    		if(data.errorYn == "Y"){
									$.osl.alert(data.message,{type: 'error'});
								}else{
									targetConfig.lastResponse = data;
									
									
									chartArrays=[];
									targetConfig.xaxis.categories = [];
									targetConfig.yaxis.categories = [];
									
									apexEvt[targetConfig.data.param.chartType](data.chartData);
									charts.targetCt.updateSeries(targetConfig.series ,true);
									targetConfig.callback.ajaxDone(data, data.chartData);
								}
					    	});
				
					    	
							ajaxObj.send();
						}else{
							apexEvt[targetConfig.data.param.chartType](dataArr);
							targetConfig.lastResponse = targetConfig.data.param.dataArr;
							charts.targetCt.updateSeries(targetConfig.series ,true);
						}
					}
				}
			});
			
			var notShowTools = {
				download: false,
				selection: false,
				zoom: false,
				zoomin: false,
				zoomout: false,
				pan: false,
				reset: false,
			}
			if(targetConfig.chart.toolbar.show == "false"){
				targetConfig.chart.toolbar.tools = notShowTools;
			}
			
			
			var apexEvt = $.extend(true, {}, chartEvt, {
				"area": function(array){
					
					$.each(array, function(idx, value){
						for(var idx = 1; idx <= Object.keys(config.data.param.key).length ;idx++){
							if(!chartArrays.hasOwnProperty(config.data.param.key["key"+idx])){
								chartArrays[config.data.param.key["key"+idx]]=[]
							}
							
							if($.osl.isNull(value[config.data.param.key["key"+idx]])){
								chartArrays[config.data.param.key["key"+idx]].push(null);
							}else{
								chartArrays[config.data.param.key["key"+idx]].push( value[config.data.param.key["key"+idx]] );
							}
						}
						
						
						if(!$.osl.isNull(config.data.param.xKey)){
							if(!chartArrays.hasOwnProperty(config.data.param.xKey)){
								chartArrays[config.data.param.xKey]=[];
							}
							chartArrays[config.data.param.xKey].push( value[config.data.param.xKey] );
						}
						
						if(!$.osl.isNull(config.data.param.yKey)){
							if(!chartArrays.hasOwnProperty(config.data.param.yKey)){
								chartArrays[config.data.param.yKey]=[];
							}
							chartArrays[config.data.param.yKey].push( value[config.data.param.yKey] );
						}
					});
					
					
					for(var idx = 0; idx < Object.keys(config.data.param.key).length ;idx++){
						targetConfig.series[idx]={name:config.data.param.keyNm["keyNm"+(idx+1)]};
						if(!$.osl.isNull(chartArrays[config.data.param.key["key"+(idx+1)] ])){
							targetConfig.series[idx].data=chartArrays[config.data.param.key["key"+(idx+1)] ];
						}else{
							targetConfig.series[idx].data=[];
						}
					}
					
					
					if(!$.osl.isNull(config.data.param.xKey)){
						targetConfig.xaxis.categories = chartArrays[config.data.param.xKey ];
					}else if(!$.osl.isNull(config.data.param.xKeyArr)){
						targetConfig.xaxis.categories = config.data.param.xKeyArr;
					}
					if(!$.osl.isNull(config.data.param.yKey)){
						targetConfig.yaxis.categories = chartArrays[config.data.param.yKey ];
					}
				},
				"heatmap": function(data){
					
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
					
					
					var dataSize = (data.length/2);
					if(dataSize < 0){
						dataSize = 1;
					}
					var yCnt = Math.round(Math.sqrt(dataSize));
					var xCnt = Math.round(yCnt*2);
					var yCursor = 0;
					var xCursor = 0;
					
					var series = [];
					var seriesX = [];
					
					
					var cursor = 0;
					
					
					$.each(data, function(idx, info){
						
						seriesX.push({
							x: (xCursor).toString(),
						});
						seriesX[xCursor].y = info[targetConfig.data.param.yKey]; 
						for(var i = 1; i <= Object.keys(targetConfig.data.param.key).length ;i++){
							seriesX[xCursor][targetConfig.data.param.key["key"+i]] = info[targetConfig.data.param.key["key"+i]];
						}
						
						xCursor++;
						
						
						
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
					
					$.each(array, function(idx, value){
						for(var idx = 1; idx <= Object.keys(config.data.param.key).length ;idx++){
							if(!chartArrays.hasOwnProperty(config.data.param.key["key"+idx])){
								chartArrays[config.data.param.key["key"+idx]]=[]
							}
							
							if($.osl.isNull(value[config.data.param.key["key"+idx]])){
								chartArrays[config.data.param.key["key"+idx]].push(null);
							}else{
								chartArrays[config.data.param.key["key"+idx]].push( value[config.data.param.key["key"+idx]] );
							}
							
						}
						
						
						if(!$.osl.isNull(config.data.param.xKey)){
							if(!chartArrays.hasOwnProperty(config.data.param.xKey)){
								chartArrays[config.data.param.xKey]=[];
							}
							
							chartArrays[config.data.param.xKey].push( value[config.data.param.xKey] );
							
						}
						
						if(!$.osl.isNull(config.data.param.yKey)){
							if(!chartArrays.hasOwnProperty(config.data.param.yKey)){
								chartArrays[config.data.param.yKey]=[];
							}
							chartArrays[config.data.param.yKey].push( value[config.data.param.yKey] );
						}
					});
					
					
					for(var idx = 0; idx < Object.keys(config.data.param.key).length ;idx++){
						targetConfig.series[idx]={name:config.data.param.keyNm["keyNm"+(idx+1)]};
						if(!$.osl.isNull(chartArrays[config.data.param.key["key"+(idx+1)] ])){
							targetConfig.series[idx].data=chartArrays[config.data.param.key["key"+(idx+1)] ];
						}else{
							targetConfig.series[idx].data=[];
						}
					}
					
					
					if(!$.osl.isNull(config.data.param.xKey)){
						targetConfig.xaxis.categories = chartArrays[config.data.param.xKey ];
					}else if(!$.osl.isNull(config.data.param.xKeyArr)){
						targetConfig.xaxis.categories = config.data.param.xKeyArr;
					}
					
					if(!$.osl.isNull(config.data.param.yKey)){
						targetConfig.yaxis.categories = chartArrays[config.data.param.yKey ];
					}
				},
				"colum": function(array){
					targetConfig.chart.type="bar";
					
					
					$.each(array, function(idx, value){
						targetConfig.series[idx] = [];
						
						targetConfig.series[idx].name = value[config.data.param.key.key1];
						if(!$.osl.isNull(value[config.data.param.key.key2] )){
							targetConfig.series[idx].data=value[config.data.param.key.key2 ];
						}else{
							targetConfig.series[idx].data=[];
						}
						
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
					
					
					if(!$.osl.isNull(config.data.param.xKey)){
						targetConfig.xaxis.categories = chartArrays[config.data.param.xKey ];
					}else if(!$.osl.isNull(config.data.param.xKeyArr)){
						targetConfig.xaxis.categories = config.data.param.xKeyArr;
					}
					
					if(!$.osl.isNull(config.data.param.yKey)){
						targetConfig.yaxis.categories = chartArrays[config.data.param.yKey ];
					}
				},
				"mix": function(array){
					targetConfig.chart.type="line";
					
					$.each(array, function(idx, value){
						
						for(var idx = 1; idx <= Object.keys(config.data.param.key).length ;idx++){
							if(!chartArrays.hasOwnProperty(config.data.param.key["key"+idx])){
								chartArrays[config.data.param.key["key"+idx]]=[]
							}
							
							if($.osl.isNull(value[config.data.param.key["key"+idx]])){
								chartArrays[config.data.param.key["key"+idx]].push(null);
							}else{
								chartArrays[config.data.param.key["key"+idx]].push( value[config.data.param.key["key"+idx]] );
							}
						}
						
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
					
					
					for(var idx = 0; idx < Object.keys(config.data.param.key).length ;idx++){
						targetConfig.series[idx]={name:config.data.param.keyNm["keyNm"+(idx+1)]};
						if(!$.osl.isNull(chartArrays[config.data.param.key["key"+(idx+1)] ])){
							targetConfig.series[idx].data=chartArrays[config.data.param.key["key"+(idx+1)] ];
							targetConfig.series[idx].type=config.data.param.keyType["keyType"+(idx+1)];
						}else{
							targetConfig.series[idx].data=[];
						}
					}
					
					
					if(!$.osl.isNull(config.data.param.xKey)){
						targetConfig.xaxis.categories = chartArrays[config.data.param.xKey ];
					}else if(!$.osl.isNull(config.data.param.xKeyArr)){
						targetConfig.xaxis.categories = config.data.param.xKeyArr;
					}
					
					if(!$.osl.isNull(config.data.param.yKey)){
						targetConfig.yaxis.categories = chartArrays[config.data.param.yKey ];
					}
				}
			});
			
			
			
			if($.osl.isNull(targetConfig.data.param.dataArr)){
				
				var ajaxObj = new $.osl.ajaxRequestAction({"url": targetConfig.data.url, "async": false}, targetConfig.data.param);
				
		    	ajaxObj.setFnSuccess(function(data){
		    		if(data.errorYn == "Y"){
						$.osl.alert(data.message,{type: 'error'});
					}else{
						
						targetConfig.lastResponse = data;
						
						
						apexEvt[targetConfig.data.param.chartType](data.chartData);
						targetConfig.callback.ajaxDone(data, data.chartData);
					}
		    	});
	
		    	
				ajaxObj.send();
			}else{
				
				targetConfig.lastResponse = targetConfig.data.param.dataArr;
				apexEvt[targetConfig.data.param.chartType](targetConfig.data.param.dataArr);
			}
			
			
			btnEvt.list();
			
			
			targetConfig.chart.events.mounted = function(chartContext, config){
				targetConfig.callback.initComplete(chartContext, config);
			}
			
			
			var chartsInfo = new ApexCharts(document.querySelector("#"+targetId), targetConfig);
			charts = {"config": targetConfig, "targetCt": chartsInfo};
			
			
			$.osl.chart.list[targetId] = charts;
			var test=chartsInfo.render();
			
			
		}
		
		
		
		if(targetObj.length > 0){
			
			if(chartLibrary.indexOf(chartLib)!=-1){
				chartLibrary[chartLib]();
			}else{
				$.osl.toastr("지원하지 않는 차트 라이브러리입니다.",{"type":"error"});
			}
		}
	}
	
    return {
        
        init: function() {
        	
    		$.osl.chart.setting = chartSetting;
        }
    };
}();