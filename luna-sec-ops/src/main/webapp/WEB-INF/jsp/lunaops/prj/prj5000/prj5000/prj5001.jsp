<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form class="kt-form" id="frPrj5001">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="prjEvtId" id="prjEvtId" value="${param.paramPrjEvtId}">
	<c:if test="${param.type eq 'view'}">
	<input type="hidden" name="evtType" id="evtType" value="${param.evtType}">
	</c:if>
	
	<input type="hidden" name="evtStartDate" id="evtStartDate" value="${param.selCalendarStartDate}"/>
	<input type="hidden" name="evtEndDate" id="evtEndDate" value="${param.selCalendarEndDate}"/>
	<input type="hidden" name="evtStartTime" id="evtStartTime" value="${param.selCalendarStartTime}"/>
	<input type="hidden" name="evtEndTime" id="evtEndTime" value="${param.selCalendarEndTime}"/>
	<input type="hidden" name="evtAllDayCd" id="evtAllDayCd" value="${param.evtAllDayCd}"/>
	<div class="kt-portlet ">
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj5001.label.evtNm">일정명</span></label>
						<input type="text" class="form-control" placeholder="일정명" name="evtNm" id="evtNm" opttype="-1" maxlength="50" required>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="form-group">
						<label class="required" for="prjGrpRange"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="prj5001.label.evtRange">일정 일자</span></label>
						<input type="text" class="form-control" placeholder="일정 일자" name="evtRange" id="evtRange" readonly="readonly" required>
					</div>
				</div>
				<c:if test="${param.type ne 'view'}">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="form-group">
							<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj5001.label.evtType">프로젝트 일정 분류</span></label>
							<select class="form-control kt-select2" id="evtType" name="evtType" opttype="-1" required>
							</select>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="form-group">
							<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="prj5001.label.evtUseCd">개인 일정 공개여부</span></label>
							<select class="form-control kt-select2" id="evtUseCd" name="evtUseCd" opttype="-1" required disabled>
							</select>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="form-group">
							<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj5001.label.guideColor">가이드 색상</span></label>
							
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="pop_evt_onwRow_title eventColorSwapList">
								</div>
							</div>
						</div>
					</div>
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj5001.label.evtBgColor">일정 배경 색상</span></label>
						<input type="color" class="form-control" name="evtBgColor" id="evtBgColor" value="#234abf" opttype="-1" >
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj5001.label.evtColor">일정 색상</span></label>
						<input type="color" class="form-control" name="evtColor" id="evtColor" value="#234abf" opttype="-1" >
					</div>
				</div>
				</c:if>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj5001.label.evtDesc">일정 설명</span></label>
						<textarea class="form-control osl-min-h-px--220 osl-textarea__resize--none" name="evtDesc" id="evtDesc" opttype="-1" maxlength="2000"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<c:choose>
		<c:when test="${param.type eq 'insert'}">
			<button type="button" class="btn btn-brand" id="prj5001SaveSubmit"><i class="fa fa-check-square"></i><span class="osl-resize__display--show">완료</span></button>
		</c:when>
		<c:when test="${param.type eq 'update'}">
			<button type="button" class="btn btn-brand" id="prj5001SaveSubmit"><i class="fa fa-check-square"></i><span class="osl-resize__display--show">완료</span></button>
			<button type="button" class="btn btn-brand" id="prj5001DeleteSubmit"><i class="fa fa-trash-alt"></i><span class="osl-resize__display--show" data-lang-cd="prj5001.delete.deleteBtnString">완료</span></button>
		</c:when>
		<c:when test="${param.evtType eq '04'}">
			<button type="button" class="btn btn-brand" id="prj5001DetailBtn"><i class="fa fa-external-link-alt"></i><span class="osl-resize__display--show">요구사항 상세정보</span></button>
		</c:when>
	</c:choose>
	
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLPrj5001Popup = function () {
	var formId = 'frPrj5001';
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var type = $("#type").val();
	
	
	var paramPrjId = $("#paramPrjId").val();
	var paramPrjEvtId = $("#prjEvtId").val();
	var evtType = $("#evtType").val();
	
    
    var documentSetting = function () {
    	
    	var defaultEvtBgColor = "#5867dd";
 		var defaultEvtColor = "#FFFFFF";
 		

 	 	var paramSelStartDate = "${param.selCalendarStartDate}";
 	 	var paramSelEndDate = "${param.selCalendarEndDate}";
 	 	var paramSelStartTime = "${param.selCalendarStartTime}";
 	 	var paramSelEndTime = "${param.selCalendarEndTime}";
 	 	
    	
    	$("#prj5001SaveSubmit > span").text($.osl.lang("prj5001."+type+".saveBtnString"));
    	$("#prj5001DeleteSubmit > span").text($.osl.lang("prj5001.delete.deleteBtnString"));
    	
    	var defaultBgColorList = ["#5867dd","#1cac81","#1dc9b7","#ffb822","#fd397a","#645ca1","#5578eb","#e2e5ec"];
 		var defaultColorList = ["#FFFFFF","#FFFFFF","#FFFFFF","#111111","#FFFFFF","#FFFFFF","#FFFFFF","#111111"];
 		
 		
 		if(type != "view"){
 			
 	 		$.each(defaultBgColorList, function(idx, map){
 	 			$(".eventColorSwapList").append('<div class="osl-calendar__guide-color" data-color="'+defaultColorList[idx]+'" style="border-radius: 50%;background-color:'+map+';"></div>');
 	 		});
 	 		
 	 		
 	 		$(".osl-calendar__guide-color").click(function(){
 	 			var bgColor = rgbToHex($(this).css("background-color"));
 	 			var fontColor = $(this).data("color");
 	 			$("#evtBgColor").val(bgColor);
 	 			$("#evtColor").val(fontColor);
 	 		});
 		}
 		
 		$(".osl-calendar__guide-color-div").click(function(){
 			$(".osl-calendar__guide-color-list").toggle();
 		})
		$("#evtRange").val(paramSelStartDate+" "+paramSelStartTime+" ~ "+paramSelEndDate+" "+paramSelEndTime);
		
		if(type != "view"){
	 		$.osl.date.daterangepicker($("#evtRange"), {
	 			startDate: paramSelStartDate+" "+paramSelStartTime,
	 			endDate: paramSelEndDate+" "+paramSelEndTime,
	 			showDropdowns: false,
	 			singleDatePicker:false,
	 			autoUpdateInput:false,
	 			locale: {
	 				"format": "YYYY-MM-DD HH:mm"
	 			},
	 			timePicker: true,
	 			timePicker24Hour:true,
	 			timePickerIncrement: 15,
	 		}, function(defaultConfig, start, end, label) {
				var startTime = new Date(start._d).format("HH:mm");
				var endDtTime = new Date(end._d).format("HH:mm");
				
	 			$("#evtRange").val(new Date(start._d).format('yyyy-MM-dd HH:mm')+" ~ "+new Date(end._d).format('yyyy-MM-dd HH:mm'));
	 			$("#evtStartDate").val(new Date(start._d).format("yyyy-MM-dd"));
	 			$("#evtEndDate").val(new Date(end._d).format("yyyy-MM-dd"));
	 			$("#evtStartTime").val(new Date(start._d).format("HH:mm"));
	 			$("#evtEndTime").val(new Date(end._d).format("HH:mm"));
			});
 		}
    	
		var disabled = false;
		
		if(type == "view"){
			disabled = true;
			$("#evtNm").prop("readonly",true);
			$("#evtDesc").prop("readonly",true);
		}else{
			$("#evtType").change(function(){
				if( $(this).val() == "03" ){
					$("#evtUseCd").prop("disabled", false);
				}else{
					$("#evtUseCd").prop("disabled", true);
				}
			});
		}
 		
		
		$("#frPrj5001 #evtBgColor").val(defaultEvtBgColor);
		$("#frPrj5001 #evtColor").val(defaultEvtColor);
		
		
		
    	$("#prj5001SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj5001."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	
    	        	saveFormAction();
    	        }
    		});
    	});
		
		
		if(type != "insert"){
			fnPrjSetInfoSelect();
			if(type != "update"){
				$("#prj5001DeleteSubmit").click(function(){
					var form = $('#'+formId);    		
		        	
		    		$.osl.confirm($.osl.lang("prj5001.delete.deleteString"),null,function(result) {
		    	        if (result.value) {
		    	        	
		    	        	fnDeleteEvent(paramPrjEvtId);
		    	        }
		    		});
		    	});
			}
		}else if(type != "view"){
			var commonCodeArr = [
	 			{mstCd: "PRJ00020", useYn: "Y",targetObj: "#evtType", comboType:"OS"}, 
	 			{mstCd: "CMM00001", useYn: "Y",targetObj: "#evtUseCd", comboType:"OS"}, 
			];
			
			$.osl.getMulticommonCodeDataForm(commonCodeArr , false);
		}
    };
    
    
    function rgbToHex ( rgbType ){ 
	    
	    var rgb = rgbType.replace( /[^%,.\d]/g, "" ); 
	    
	    rgb = rgb.split( "," ); 
	    
	    for ( var x = 0; x < 3; x++ ) { 
	    	if ( rgb[ x ].indexOf( "%" ) > -1 ) rgb[ x ] = Math.round( parseFloat( rgb[ x ] ) * 2.55 ); 
	    } 
	    
	    var toHex = function( string ){ 
	     string = parseInt( string, 10 ).toString( 16 ); 
	     string = ( string.length === 1 ) ? "0" + string : string; 
	
	     return string; 
	    }; 
	    var r = toHex( rgb[ 0 ] ); 
	    var g = toHex( rgb[ 1 ] ); 
	    var b = toHex( rgb[ 2 ] ); 
	    var hexType = "#" + r + g + b; 
	    return hexType; 
	} 
    
  	
	function fnDeleteEvent(prjEvtId){
		
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj5000/prj5000/deletePrj5000EvtInfoAjax.do'/>"}, {"prjEvtId": prjEvtId});
   		
   		
   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				calendar.getEventById(prjEvtId).remove();
   				
   			}
   		});
   		
   		
   		ajaxObj.send();
	}
  
    
    var saveFormAction = function() {
    	
   		
		var evtStartDate = $("#evtStartDate").val();
		var evtEndDate = $("#evtEndDate").val();
		var evtStartTime = $("#evtStartTime").val();
		var evtEndTime = $("#evtEndTime").val();
		
		
		if(evtStartTime == evtEndTime && evtStartTime == "00:00"){
			$("#evtAllDayCd").val("01");
		}else{
			$("#evtAllDayCd").val("02");
		}

    	
   		var fd = $.osl.formDataToJsonArray(formId);
    	
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj5000/prj5000/savePrj5001PrjEvtInfo.do'/>", "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				$(".fc-eventLoad-button").click();
   			}
   		});
   		
   		
   		ajaxObj.send();
    };
    
	
	
	var fnPrjSetInfoSelect = function(){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj5000/prj5000/selectPrj5001PrjEvtInfoAjax.do'/>"}
				,{"prjEvtId": paramPrjEvtId, "evtType":evtType});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var prjEvtInfo = data.prjEvtInfo;
   		    	
   				
   				$.osl.setDataFormElem(prjEvtInfo, formId);
   		    	
   		    	if(prjEvtInfo.evtType=="03"){
   		    		$("#evtUseCd").prop("disabled", false);
   		    	}
   		    	
		    	$("#evtType").attr("data-osl-value", prjEvtInfo.evtType);
		    	$("#evtUseCd").attr("data-osl-value", prjEvtInfo.evtUseCd);
		    	
				var commonCodeArr = [
		 			{mstCd: "PRJ00020", useYn: "Y",targetObj: "#evtType", comboType:"OS"}, 
		 			{mstCd: "CMM00001", useYn: "Y",targetObj: "#evtUseCd", comboType:"OS"}, 
				];
		   	
				
				$.osl.getMulticommonCodeDataForm(commonCodeArr , false);
				
   				
   				$("#evtRange").val(prjEvtInfo.evtStartFullDate+" ~ "+prjEvtInfo.evtEndFullDate);
   				if(type == "update"){
	   				$("#evtRange").data("daterangepicker").setStartDate(prjEvtInfo.evtStartFullDate);
	   				$("#evtRange").data("daterangepicker").setEndDate(prjEvtInfo.evtEndFullDate);
   				}else if(type == "view"){
					$("#prj5001DetailBtn").click(function(){
						var data = {
								paramPrjId: paramPrjId,
								paramReqId: paramPrjEvtId,
								
							};
						var options = {
								idKey: "reqDetail"+paramPrjEvtId,
								modalTitle: $.osl.lang("req4100.title.detailTitle"),
								autoHeight: false,
							};
						$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4102View.do',data,options);
					})
   				}
   			}
		});
		
		
		ajaxObj.send();
	};
	return {
        
        init: function() {
        	documentSetting();
        }
    };
}();


$.osl.ready(function(){
	OSLPrj5001Popup.init();
});

	
</script>