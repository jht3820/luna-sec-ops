<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />

<link rel='stylesheet' href='<c:url value='/plugins/custom/fullcalendar/main.css'/>' type='text/css'>

<script src="<c:url value='/plugins/custom/fullcalendar/main.js'/>"></script>
<script src="<c:url value='/plugins/custom/fullcalendar/locales-all.js'/>"></script>

<div class="kt-portlet kt-portlet--mobile osl-flex-flow--row osl-flex-flow--column-mobile osl-portlet__body-style--none kt-margin-b-0">
	<div class="kt-portlet kt-portlet--mobile osl-calendar osl-desktop-max-w-285 float-left kt-margin-b-0" id="prj5000">
		<div class="kt-portlet__head kt-hidden-desktop kt-hidden-tablet">
			<div class="kt-portlet__head-label">
				<h4 class="kt-font-boldest kt-font-brand">
					<i class="fa fa-th-large kt-margin-r-5"></i>검색 조건
				</h4>
			</div>
			<div class="kt-portlet__head-toolbar">
	         	<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
			</div>
		</div>
		<div class="kt-portlet__body osl-min-h-px--415">
			<div class="osl-flex-flow--row osl-flex-flow--column-mobile w-100" id="prj5000LeftDiv">
				<button type="button" id="saveBtn" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-b-10 btn-elevate btn-elevate-air w-100" title="일정 등록" data-title-lang-cd="prj5000.button.title.insert" data-toggle="kt-tooltip" data-skin="brand">
					<i class="fa fa-calendar-plus"></i><span data-lang-cd="prj5000.button.title.insert">일정등록</span>
				</button>
				<div class="prj5000Datepicker" id="prj5000Datepicker"></div>
				
				<div class="osl-calendar-group-list__leftList" id="eventGroupList" >
				
					<div class="eventGroupFrame" title="휴일">
						<div class="eventGroupChkBox">
							<label class="kt-checkbox kt-checkbox--success">
								<i class="fa fa-calendar-alt"></i><input type="checkbox" checked> 휴일
								<span></span>
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet kt-portlet--mobile osl-mobile-769-padding-l-20 osl-portlet__body-style--none kt-margin-b-0">
		<div class="kt-portlet__body osl-mobile-768-margin-t-20 kt-padding-0" id="prj5000RightDiv">
			<div class="kt-portlet kt-margin-b-0">
				<div class="kt-portlet__body osl-min-h-px--415">
					<div id="kt_calendar"></div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
"use strict";

var datepickerObj;
var calendar;


var evtDataMap = {};

var evtDataIsMap = [];

var evtPrjTreeDataMap = {};

var evtUsrDataMap = {};

var evtReqDataMap = {};

var evtHoliDataMap = [];

var OSLPrj5000Popup = function () {
	
	
	
	var mousewheelevt=(/Firefox/i.test(navigator.userAgent))? "DOMMouseScroll" : "mousewheel";

	
	function wheel(e) {
		e = e || window.event;
	  if (e.preventDefault)
	      e.preventDefault();
	  e.returnValue = false;  
	}
	
	function disable_scroll(){
	     if (document.attachEvent){
	         document.attachEvent("on"+mousewheelevt, wheel);
	     }
	     else if (document.addEventListener) {
	         document.addEventListener(mousewheelevt, wheel, {passive: false});                 
	     }
	}

	
	function enable_scroll() {
	     if (document.removeEvent){
	         document.removeEvent("on"+mousewheelevt, wheel);
	     }
	     else if (document.removeEventListener) {
	         document.removeEventListener(mousewheelevt, wheel, {passive: false});  
	     }
	}
	
	var documentSetting = function(){
		var portlet = new KTPortlet('prj5000', $.osl.lang("portlet"));

		var ww = window.innerWidth;
		if(ww<768){
			portlet.collapse();
		}else{
			portlet.expand();
		}

		$(window).resize(function(){
			var ww = window.innerWidth;
			if(ww<=768){
				portlet.collapse();
			}else{
				portlet.expand();
			}
		})
		
		
		datepickerObj = $("#prj5000Datepicker");
		
		
		var yearRange = {
				minYear: new Date().getFullYear()-5,
				maxYear: new Date().getFullYear()+5
		};
		
		$.osl.date.init();
		
		$.osl.date.datepicker(datepickerObj,{
			yearRange: yearRange.minYear+":"+yearRange.maxYear,
			changeYear: true,
			changeMonth: true,
			showMonthAfterYear: true
			
		},function( defaultConfig, selDate) {
			
			calendar.gotoDate(selDate.date);
	        
	      	
			fnEvtdayDataSetting();
		});
		
		
		var todayDate = moment().startOf('day');
        var YM = todayDate.format('YYYY-MM');
        var YESTERDAY = todayDate.clone().subtract(1, 'day').format('YYYY-MM-DD');
        var TODAY = todayDate.format('YYYY-MM-DD');
        var TOMORROW = todayDate.clone().add(1, 'day').format('YYYY-MM-DD');

        var calendarEl = document.getElementById('kt_calendar');
        calendar = new FullCalendar.Calendar(calendarEl, {

			headerToolbar: {
				start:'today customPrevBtn,customNextBtn',
			    center: 'title',
			    end:'eventLoad dayGridMonth,timeGridWeek,timeGridDay,timeGridFourDay'
			},
			buttonIcons:{
				customPrevBtn:'fc-icon-chevron-left',
				customNextBtn:'fc-icon-chevron-right'
			},
            height: 650,
            contentHeight: 600,
			initialDate: new Date(),
			locale : $.osl.lang("prj5000.button.title.local"),

			
			
			
			editable: true,
			
			dayMaxEventRows: true,
			
			navLinks: true,
			
			selectable: true,
			
			nowIndicator: true,
			
			customButtons: {
				today:{
					text: $.osl.lang("prj5000.button.title.today"),
					click: function(){
						calendar.today();
						
						fnEvtdayDataSetting();
						
						
						datepickerObj.datepicker("setDate", calendar.getDate().format("yyyy-MM-dd"));
					}
				},
				customPrevBtn:{
					click: function(){
						calendar.prev();
						
						fnEvtdayDataSetting();
						
						
						datepickerObj.datepicker("setDate", calendar.getDate().format("yyyy-MM-dd"));
					}
				},
				customNextBtn:{
					click: function(){
						calendar.next();
						
						fnEvtdayDataSetting();
						
						
						datepickerObj.datepicker("setDate", calendar.getDate().format("yyyy-MM-dd"));
					}
				},
				
				eventLoad:{
					text: $.osl.lang("prj5000.button.title.dataSelect"),
					click: function(){
						
						fnSelectEventList();
					}
				}
			},

			
			views: {
				dayGridMonth: {
					dayMaxEventRows: 4
				},
				timeGridFourDay: {
					type: 'timeGrid',
					duration: { days: 4 },
					buttonText: $.osl.lang("prj5000.button.title.fourDay")
				},
			},

		    select: function(info) {
		    	
		    	var endDate = info.end;
		    	
		    	
		    	if(info.allDay){
		    		if(info.end == null){
		    			endDate = info.start;
		    		}else{
			    		endDate = new Date(info.end.setDate(new Date(info.end).getDate()-1));
		    		}
		    	}

		    	var data = {
			    		"type" : "insert",
						"selCalendarStartDate" : info.start.format("yyyy-MM-dd"),
						"selCalendarEndDate" : endDate.format("yyyy-MM-dd"),
						"selCalendarStartTime" : info.start.format("HH:mm"),
						"selCalendarEndTime" : endDate.format("HH:mm"),
						"evtAllDayCd" : (info.allDay)?"01": "02"
					};
		    	
				var options = {
						modalTitle: $.osl.lang("prj5001.insert.title"),
						closeConfirm: false,
						autoHeight: false,
						modalSize: 'md'
					};
				
				$.osl.layerPopupOpen('/prj/prj5000/prj5000/selectPrj5001View.do',data,options);
		    	
				calendar.unselect();
		    },
			
			eventClick: function(info){
				
				var prjEvtId = info.event.id;
				var prjId = info.event.prjId;
				
				
				var evtEndDate = info.event.end;
				
				
				if(evtEndDate == null){
					evtEndDate = info.event.start;
				}else{
					
					if(info.event.allDay){
						evtEndDate = new Date(info.event.end.setDate(new Date(info.event.end).getDate()-1));
					}
				}

				var paramType = "update";
				
				
				if(info.event.extendedProps.eventType == "01"){
					
					var data = {
							"type" : "view",
							"evtType": info.event.extendedProps.eventType,
							"holiId": prjEvtId,
							"selCalendarStartDate" : info.event.start.format("yyyy-MM-dd"),
							"selCalendarEndDate" : evtEndDate.format("yyyy-MM-dd"),
							"selCalendarStartTime" : info.event.start.format("HH:mm"),
							"selCalendarEndTime" : evtEndDate.format("HH:mm"),
							"holiAllDayCd" : (info.event.allDay)? "01": "02"
						};
					var options = {
							
							modalTitle: $.osl.lang("prj5001.insert.title"),
							closeConfirm: false,
							autoHeight: false,
							modalSize: 'md'
						};
					
					
					
					
					return true;
				}
				
				
				if(info.event.extendedProps.eventType == "04"){
					
					var data = {
							"type" : "view",
							"evtType": info.event.extendedProps.eventType,
				    		"paramPrjId": info.event.extendedProps.prjId,
				    		"paramPrjGrpId": info.event.extendedProps.prjGrpId,
							"paramPrjEvtId": info.event.extendedProps.reqId,
							"selCalendarStartDate" : info.event.start.format("yyyy-MM-dd"),
							"selCalendarEndDate" : evtEndDate.format("yyyy-MM-dd"),
							"selCalendarStartTime" : info.event.start.format("HH:mm"),
							"selCalendarEndTime" : evtEndDate.format("HH:mm"),
							"holiAllDayCd" : (info.event.allDay)? "01": "02",
							"reqId": info.event.extendedProps.reqId,
							"eventPrjId": info.event.extendedProps.prjId
						};
					var options = {
							idKey: info.event.extendedProps.reqId,
							modalTitle: $.osl.lang("prj5001.insert.title"),
							closeConfirm: false,
							autoHeight: false,
							modalSize: 'md'
						};
					
					$.osl.layerPopupOpen('/prj/prj5000/prj5000/selectPrj5001View.do',data,options);
					
					return true;
				}
				
				
				if(!info.event.startEditable){
					paramType = "view";
				}else{
					
					var loginUsrId = "${sessionScope.loginVO.usrId}";
					if(info.event.extendedProps.usrId != loginUsrId){
						paramType = "view";
					}
				}
				

				var data = {
			    		"type" : paramType,
			    		"evtType": info.event.extendedProps.eventType,
			    		"paramPrjId": info.event.extendedProps.prjId,
			    		"paramPrjGrpId": info.event.extendedProps.prjGrpId,
			    		"paramPrjEvtId": prjEvtId,
						"selCalendarStartDate" : info.event.start.format("yyyy-MM-dd"),
						"selCalendarEndDate" : evtEndDate.format("yyyy-MM-dd"),
						"selCalendarStartTime" : info.event.start.format("HH:mm"),
						"selCalendarEndTime" : evtEndDate.format("HH:mm"),
						"evtAllDayCd" : (info.event.allDay)? "01": "02"
					};
				var options = {
						
						modalTitle: $.osl.lang("prj5001."+paramType+".title"),
						closeConfirm: false,
						autoHeight: false,
						modalSize: 'md'
					};
				
				$.osl.layerPopupOpen('/prj/prj5000/prj5000/selectPrj5001View.do',data,options);
				
			},
			
			eventDrop: function(info) {
				var evtEndDate = info.event.endStr;

				var loginUsrId = "${sessionScope.loginVO.usrId}";
				if(info.event.extendedProps.usrId != loginUsrId){
					$.osl.alert("등록자만 수정이 가능합니다.");
					fnSelectEventList();
					return;
				}
				
				
				if($.osl.isNull(evtEndDate)){
					evtEndDate = info.event.start;
				}else{
					evtEndDate = info.event.end;
					
					if(info.event.allDay){
						
						evtEndDate = new Date(evtEndDate.setDate(evtEndDate.getDate()-1));
					}
				}
				
				var evtEndTime = evtEndDate.format("HH:mm");
				var evtStartDate = info.event.start.format("yyyy-MM-dd");
				var evtEndDate = evtEndDate.format("yyyy-MM-dd");
				var evtStartTime = info.event.start.format("HH:mm");
				
				var paramData = 
					{
						prjEvtId: info.event.id,
						evtStartDate: evtStartDate,
						evtEndDate: evtEndDate,
						evtStartTime: evtStartTime,
						evtEndTime: evtEndTime,
						evtAllDayCd: (info.event.allDay)? "01": "02"
					};
				
				fnEventUpdate(paramData, info);
			},
			
			eventResize: function(info) {
				var evtEndDate = info.event.endStr;
				
				var loginUsrId = "${sessionScope.loginVO.usrId}";
				if(info.event.extendedProps.usrId != loginUsrId){
					$.osl.alert("등록자만 수정이 가능합니다.");
					fnSelectEventList();
					return;
				}
				
				
				if($.osl.isNull(evtEndDate)){
					evtEndDate = info.event.start;
				}else{
					evtEndDate = info.event.end;
					
					if(info.event.allDay){
						
						evtEndDate = new Date(evtEndDate.setDate(evtEndDate.getDate()-1));
					}
				}
				
				var evtStartDate = info.event.start.format("yyyy-MM-dd");
				var evtStartTime = info.event.start.format("HH:mm");
				var evtEndTime = evtEndDate.format("HH:mm");
				var evtEndDate = evtEndDate.format("yyyy-MM-dd");
				
				var paramData = 
				{
					prjEvtId: info.event.id,
					evtStartDate: evtStartDate,
					evtEndDate: evtEndDate,
					evtStartTime: evtStartTime,
					evtEndTime: evtEndTime,
					evtAllDayCd: (info.event.allDay)? "01": "02"
				};
				
				
				fnEventUpdate(paramData, info);
			},
			viewDidMount: function(calendarData){
				if(calendarData.view.type == "dayGridMonth"){
				
				$("#kt_calendar").on(mousewheelevt, function(e){
					var evt = window.event || e;
					var delta;          
					delta = evt.detail ? evt.detail*(-120) : evt.wheelDelta;                     
					if(mousewheelevt === "DOMMouseScroll"){
						delta = evt.originalEvent.detail ? evt.originalEvent.detail*(-120) : evt.wheelDelta;
					}           
			
					
					if(delta > 0){
						calendar.getCurrentData().options.customButtons.customPrevBtn.click();
					}
					
					if(delta < 0){             
						calendar.getCurrentData().options.customButtons.customNextBtn.click();
					}  
				});
			
				
				$("#kt_calendar").hover(
					function(){
						enable_scroll();
					},
					function(){
						disable_scroll();
					}
				);
				
				$("#kt_calendar").on("mouseleave", function() {enable_scroll()});
				
				$("#kt_calendar").on("mouseenter", function() {disable_scroll()});
			}else{
				
				enable_scroll();
				$("#kt_calendar").off(mousewheelevt);
				$("#kt_calendar").off("hover, mouseleave, mouseenter");
			}
		}
        });
        calendar.render();
        
        
        datepickerObj.datepicker("setDate", new Date());
        
    	
    	fnSelectEventList();
    	
    	$("#saveBtn").on('click',function(e){
    		fnInsertEvtdayInfo()
		});
    	
	};

	
	function fnSelectEventList(){
		
		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj5000/prj5000/selectPrj5000EventListAjax.do'/>",
			"async": false,"contentType":false,"processData":false ,"cache":false},{target: "prjGrpId"});
		
		
		ajaxObj.setFnSuccess(function(data){
		  	if(data.errorYn == "N"){
		  		var evtList = data.evtList;
		  		var holiList = data.holiList;
		  		
		  		calendar.removeAllEvents();
		  		
		  		
		  		evtDataIsMap = [];
		  		evtDataMap = {};
		  		evtPrjTreeDataMap = [];
		  		var selPrjId = data.selPrjId;
		  		
		  		
		  		if(calendar.isRendered){
		  			
		  			if(!$.osl.isNull(holiList) && holiList.length > 0){
			  			
			  			$.each(holiList, function(idx, map){
			  				
			  				var holiYearVal = new Date(map.holiStartDate).format("yyyy");
			  				var holiMonthVal = new Date(map.holiStartDate).format("MM");
			  				
			  				
			  				if(!evtDataMap.hasOwnProperty(holiYearVal)){
			  					evtDataMap[holiYearVal] = {};
			  				}
			  				
			  				if(!evtDataMap[holiYearVal].hasOwnProperty(holiMonthVal)){
			  					evtDataMap[holiYearVal][holiMonthVal] = [];
			  				}
			  				
			  				evtDataMap[holiYearVal][holiMonthVal].push(map);
			  				evtHoliDataMap.push(map);
			  			});
		  			}
		  			
		  			var eventHolidayList =
 						 '<div class="eventGroupFrame" title="휴일">'
						+'		<div class="eventGroupChkBox">'
						+'			<label class="kt-checkbox kt-checkbox--success">'
						+'				<i class="fa fa-calendar-alt"></i><input type="checkbox" name="CHK_holiday" id="CHK_holiday" data-event-group-type="01" data-event-group-id="holiday" onchange="fnToggleEvent(this)" checked> 휴일'
						+'				<span></span>'
						+'			</label>'
						+'		</div>'
						+'</div>' ;
					var eventReqList = 
 						 '<div class="eventGroupFrame" title="요구사항">'
						+'		<div class="eventGroupChkBox">'
						+'			<label class="kt-checkbox kt-checkbox--success">'
						+'				<i class="fa fa-edit"></i><input class="prjEvtList" type="checkbox" name="CHK_reqlist" id="CHK_reqlist" data-event-group-type="04" data-event-group-id="reqlist" onchange="fnToggleEvent(this)" checked> 요구사항'
						+'				<span></span>'
						+'			</label>'
						+'		</div>'
						+'</div>' ;
	 				var eventPrjList = '';
	 				var eventPrjUsrList = '';
	 				
		  			
		  			if(!$.osl.isNull(evtList) && evtList.length > 0){
		  				
		  				
		  				
		  				
		  				var usrDupleList = [];
			  			
			  			var eventLoginUsr = "";
			  			var loginUsrId = "${sessionScope.loginVO.usrId}";
							
			  			
			  			$.each(evtList, function(idx, map){

			  				
			  				if(!evtPrjTreeDataMap.hasOwnProperty(map.prjGrpId)){
			  					evtPrjTreeDataMap[map.prjGrpId] = {};
			  				}
			  				
			  				if(!evtPrjTreeDataMap[map.prjGrpId].hasOwnProperty(map.prjId)){
			  					evtPrjTreeDataMap[map.prjGrpId][map.prjId] = [];
	
			  					
			  					var checked = "checked";
			  					
			  					
			  					if(map.prjId != selPrjId){
			  						checked = "";
			  					}
			  					
			  					
			  					eventPrjList += 
			 						 '<div class="eventGroupFrame" title="프로젝트 :  '+$.osl.escapeHtml(map.prjNm)+'">'
									+'		<div class="eventGroupChkBox">'
									+'			<label class="kt-checkbox kt-checkbox--success">'
									+'				<i class="fa fa-box"></i>'
									+'				<input class="prjEvtList" type="checkbox" name="CHK_'+map.prjId+'" id="CHK_'+map.prjId+'" title="'+$.osl.escapeHtml(map.prjId)+'" data-event-group-type="02" data-event-group-id="'+map.prjGrpId+'" data-event-prj-id="'+map.prjId+'" onchange="fnToggleEvent(this)" checked> '+$.osl.escapeHtml(map.prjNm)+''
									+'				<span></span>'
									+'			</label>'
									+'		</div>'
									+'</div>' ;
			  				}
		  					
		  					if(usrDupleList.indexOf(map.usrId) == -1){
		  						
		  						if(map.evtType == "03"){
				  					
		  				  			if(loginUsrId==map.usrId){
					  					eventLoginUsr += 
				 						 	 '<div class="eventGroupFrame" title="사용자 :  '+map.usrNm+'">'
											+'		<div class="eventGroupChkBox">'
											+'			<label class="kt-checkbox kt-checkbox--success">'
											+'				<i class="fa fa-user"></i>'
											+'				<input class="prjEvtList" type="checkbox" name="CHK_'+map.usrId+'" id="CHK_'+map.usrId+'" title="'+$.osl.escapeHtml(map.usrId)+'" data-event-group-type="03" data-event-group-id="'+map.usrId+'" onchange="fnToggleEvent(this)" checked> '+$.osl.escapeHtml(map.usrNm)+''
											+'				<span></span>'
											+'			</label>'
											+'		</div>'
											+'</div>' ;
					  				}else{
					  					eventPrjUsrList += 
				 						 	 '<div class="eventGroupFrame" title="사용자 :  '+map.usrNm+'">'
											+'		<div class="eventGroupChkBox">'
											+'			<label class="kt-checkbox kt-checkbox--success">'
											+'				<i class="fa fa-user"></i>'
											+'				<input class="prjEvtUsrList" type="checkbox" name="CHK_'+map.usrId+'" id="CHK_'+map.usrId+'" title="'+$.osl.escapeHtml(map.usrId)+'" data-event-group-type="03" data-event-group-id="'+map.usrId+'" onchange="fnToggleEvent(this)"> '+$.osl.escapeHtml(map.usrNm)+''
											+'				<span></span>'
											+'			</label>'
											+'		</div>'
											+'</div>' ;
					  				}
		  				  		
				  					usrDupleList.push(map.usrId);
				  					evtUsrDataMap[map.usrId] = [];
		  						}
		  					}
			  				
			  				
			  				if(map.evtType == "03"){
			  					if(map.usrId == loginUsrId){
				  					map.evtNm = "["+map.usrNm+"] "+map.evtNm;
				  					if(loginUsrId!=map.usrId){
						  				map.display=false;
				  					}
					  				evtUsrDataMap[map.usrId].push(map);
			  					}else{
				  					if(map.evtUseCd == "01"){
					  					map.evtNm = "["+map.usrNm+"] "+map.evtNm;
					  					if(loginUsrId!=map.usrId){
							  				map.display=false;
					  					}
						  				evtUsrDataMap[map.usrId].push(map);
				  					}
			  					}
			  				}
			  				
			  				else if(map.evtType == "02"){
				  				evtPrjTreeDataMap[map.prjGrpId][map.prjId].push(map);
			  				}else if(map.evtType == "04"){
			  					evtReqDataMap[map.prjEvtId] = map;
			  				}
			  				
			  				
			  				var evtYearVal = new Date(map.evtStartDate).format("yyyy");
			  				var evtMonthVal = new Date(map.evtStartDate).format("MM");
			  				
			  				
			  				if(!evtDataMap.hasOwnProperty(evtYearVal)){
			  					evtDataMap[evtYearVal] = {};
			  				}
			  				
			  				if(!evtDataMap[evtYearVal].hasOwnProperty(evtMonthVal)){
			  					evtDataMap[evtYearVal][evtMonthVal] = [];
			  				}
			  				
			  				
			  				if(map.evtType == "04"){
			  					
			  					if(map.evtStartTime == map.evtEndTime && map.evtStartTime == "00:00"){
			  						map.evtAllDayCd = "01";
			  					}
			  				}
			  				
			  				if(map.evtType == "03"){

			  					if(map.usrId == loginUsrId){
			  						evtDataMap[evtYearVal][evtMonthVal].push(map);
			  					}else{
				  					if(map.evtUseCd == "01"){
				  						
				  						evtDataMap[evtYearVal][evtMonthVal].push(map);
				  					}
			  					}
			  				}else{
			  					
				  				evtDataMap[evtYearVal][evtMonthVal].push(map);			  					
			  				}
			  			});
			  			
		  			}
		  			
		  			
		  			$("#eventGroupList").html(eventHolidayList+eventPrjList+eventReqList+eventLoginUsr+eventPrjUsrList);
		  			
		  			fnEvtdayDataSetting();
		  			console.log(evtUsrDataMap);
		  		}
		  		$.osl.toastr(data.message);
		  	}else{
		  		$.osl.alert(data.message);
		  	}
		});
		
		
		ajaxObj.send();
	}
	
	
	function fnEventUpdate(paramData, event){
		
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj5000/prj5000/savePrj5001PrjEvtInfo.do'/>"}
   			,{
   				"type" : "update",
   				prjEvtId: paramData.prjEvtId,
				evtStartDate: paramData.evtStartDate,
				evtEndDate: paramData.evtEndDate,
				evtStartTime: paramData.evtStartTime,
				evtEndTime: paramData.evtEndTime,
				evtAllDayCd: paramData.evtAllDayCd
			});

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.toastr(data.message);
   		  		event.revert();
   		  		return;
   			}
   		});
   		
   		
   		ajaxObj.send();
	}
	
	
	function fnEvtdayDataSetting(){
		
		var currentDate = calendar.getDate();
		
		
		var beforeYear = new Date(currentDate.getFullYear(), (currentDate.getMonth()-1), currentDate.getDate()).format("yyyy");
		var beforeMonth = new Date(currentDate.getFullYear(), (currentDate.getMonth()-1), currentDate.getDate()).format("MM");
		
		
		var currentYear = currentDate.format("yyyy");
		var currentMonth = currentDate.format("MM");
		
		
		var afterYear = new Date(currentDate.getFullYear(), (currentDate.getMonth()+1), currentDate.getDate()).format("yyyy");
		var afterMonth = new Date(currentDate.getFullYear(), (currentDate.getMonth()+1), currentDate.getDate()).format("MM");

		var evtRangeData = [];
		
		
		try{
			if(!$.osl.isNull(evtDataMap[beforeYear][beforeMonth]) && evtDataIsMap.indexOf(beforeYear+"-"+beforeMonth) == -1){
				
				evtRangeData = evtRangeData.concat(evtDataMap[beforeYear][beforeMonth]);
				evtDataIsMap.push(beforeYear+"-"+beforeMonth);
			}
			if(!$.osl.isNull(evtDataMap[currentYear][currentMonth]) && evtDataIsMap.indexOf(currentDate.format("yyyy-MM")) == -1){
				
				evtRangeData = evtRangeData.concat(evtDataMap[currentYear][currentMonth]);
				evtDataIsMap.push(currentDate.format("yyyy-MM"));
			}
			if(!$.osl.isNull(evtDataMap[afterYear][afterMonth]) && evtDataIsMap.indexOf(afterYear+"-"+afterMonth) == -1){
				
				evtRangeData = evtRangeData.concat(evtDataMap[afterYear][afterMonth]);
				evtDataIsMap.push(afterYear+"-"+afterMonth);
			}
		}catch(e){
			
		}
		
		if(evtRangeData.length > 0){
			$.each(evtRangeData, function(idx, map){
				var evtStartFullDate = map.evtStartFullDate;
				var evtEndFullDate = map.evtEndFullDate;
				var evtAllDayCd = map.evtAllDayCd;
				var classNames = "osl-calendar-event";
				var evtNm = $.osl.escapeHtml(map.evtNm);
				var reqId;
				var display = map.display;
				
				
				if($.osl.isNull(display) || display){
					display = "auto";
				}else{
					display = "none";
				}
				
				var allDay = false;
				
				var evtBgColor = map.evtBgColor;
				var evtColor = map.evtColor;
				var prjEvtId = map.prjEvtId;
				var eventTypeNm = "event";
				
				
				var editable = true;
				
				
				if(map.evtType == "01"){
					evtStartFullDate = map.holiStartFullDate;
					evtEndFullDate = map.holiEndFullDate;
					evtAllDayCd = map.holiAllDayCd;
					classNames = "osl-holiday";
					evtNm = "[휴일] "+$.osl.escapeHtml(map.holiNm);
					evtBgColor = map.holiBgColor;
					evtColor = map.holiColor;
					prjEvtId = map.holiId;
					eventTypeNm = "holiday";
					editable = false;
				}
				
				else if(map.evtType == "04"){
					evtNm = $.osl.escapeHtml(map.evtNm);
					reqId = map.reqId;
				}
				
				
				if(evtAllDayCd == "01"){
					evtEndFullDate = new Date(evtEndFullDate);
					evtEndFullDate = new Date(evtEndFullDate.setDate(evtEndFullDate.getDate()+1)).format("yyyy-MM-dd HH:mm");
					allDay = true;
					classNames = "osl-calendar-allday";
				}
				
				if(map.evtType == "04"){
					editable = false;
				}
				
				
				if(map.evtType == "03"){
					evtNm = $.osl.escapeHtml(map.evtNm);
				}
				
				calendar.addEvent({
					title: evtNm
					, start: evtStartFullDate
					, end: evtEndFullDate
					, editable: editable
					, allDay: allDay
					, classNames: classNames
					, backgroundColor: evtBgColor
					, borderColor: evtBgColor
					, textColor: evtColor
					, eventType: map.evtType
					, eventTypeNm: eventTypeNm
					, id: prjEvtId
					, usrId: map.usrId
					, prjId: map.prjId
					, prjGrpId: map.prjGrpId
					, reqId: reqId
					, display: display
				});
			});
		}
	}
	
	function fnInsertEvtdayInfo(){
		var selCalendarDate = datepickerObj.datepicker("getDate").format("yyyy-MM-dd");
		
		var data = {
				"type" : "insert",
				"selCalendarStartDate" : selCalendarDate,
				"selCalendarEndDate" : selCalendarDate,
				"selCalendarStartTime" : "00:00",
				"selCalendarEndTime" : "00:00"
			};
		var options = {
				
				modalTitle: $.osl.lang("prj5001.insert.title"),
				closeConfirm: false,
				autoHeight: false,
				modalSize: 'md'
			};
		
		$.osl.layerPopupOpen('/prj/prj5000/prj5000/selectPrj5001View.do',data,options);
	}
	
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();


function fnToggleEvent(thisObj){
	
	
	var evtGrpType = $(thisObj).data("event-group-type");
	var evtGrpId = $(thisObj).data("event-group-id");
	var evtPrjId = $(thisObj).data("event-prj-id");
	var evtGrpVal = thisObj.checked;
	var prjEvtIdStr = "prjEvtId";
	var targetEvtList = [];
	
	
	if(evtGrpType == "01"){
		var targetEvtList = evtHoliDataMap;
		prjEvtIdStr = "holiId";
	}
	
	else if(evtGrpType == "02"){
		
		var targetPrjEvtList = evtPrjTreeDataMap[evtGrpId][evtPrjId];
		$.each(targetPrjEvtList, function(idx, map){
			if(map.evtType != "03"){
				targetEvtList.push(map);
			}
		});
		
		if(evtGrpVal){
			$(".prjEvtList").prop("checked", true);
		}else{
			$(".prjEvtList").prop("checked", false);
			$(".prjEvtUsrList").prop("checked", false);
		}
		
		
		$.each(evtUsrDataMap, function(idx, map){
			var targetUsrEvtList = map;
			$.each(targetUsrEvtList, function(idx, map){
				
				if(map.evtType == "03"){
					targetEvtList.push(map);
				}
			});
		});

		var targetReqEvtList = evtReqDataMap;
		$.each(targetReqEvtList, function(idx, map){
			
			if(map.evtType == "04"){
				targetEvtList.push(map);
			}
		});
	}
	
	else if(evtGrpType == "03"){
		
		var targetUsrEvtList = evtUsrDataMap[evtGrpId];
		$.each(targetUsrEvtList, function(idx, map){
			
			if(map.evtType == "03"){
				targetEvtList.push(map);
			}
		});
	}
	
	else if(evtGrpType == "04"){
		var targetReqEvtList = evtReqDataMap;
		$.each(targetReqEvtList, function(idx, map){
			
			if(map.evtType == "04"){
				targetEvtList.push(map);
			}
		});
	}
	
	$.each(targetEvtList, function(idx, map){
		var prjEvtId = map[prjEvtIdStr];
		var event = calendar.getEventById(prjEvtId);
		
		
		if($.osl.isNull(event)){
			map["display"] = evtGrpVal;
			return true;
		}
		
		if(!evtGrpVal){
			event.setProp("display","none");
		}
		
		else{
			event.setProp("display","auto");
		}
	});
}

$.osl.ready(function(){
	OSLPrj5000Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
