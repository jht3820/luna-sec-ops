<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm9101">
	<input type="hidden" name="callView" id="callView" value="${param.callView}">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramJenId" id="paramJenId" value="${param.paramJenId}">
	<input type="hidden" name="paramJobId" id="paramJobId" value="${param.paramJobId}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jenkins">JENKINS</span></label>
				<select class="form-control kt-select2" id="jenId" name="jenId" required>
				</select>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9101.label.job">JOB ID(NAME)</span></label>
				<select class="form-control kt-select2" id="jobId" name="jobId" required>
				</select>
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobRestoreId">원복 JOB ID</span></label>
				<select class="form-control kt-select2" id="jobRestoreId" name="jobRestoreId">
				</select>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="stm9101.label.tokenKey">TOKEN KEY</span></label>
				<input type="password" class="form-control" placeholder="JOB TOKEN KEY" name="jobTok" id="jobTok" maxlength="200" required/>
			</div>
			<div class="form-group">
				<label><i class="fa fa-list-ol kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobParameter">JOB 매개변수</span></label>
				<input type="text" class="form-control" placeholder="JOB 매개변수" name="jobParameter" id="jobParameter" maxlength="100" regexstr="^(?=.*?[a-zA-Z])(?=.*?[0-9])|[a-zA-Z]{2,100}$" regexalert="영문, 숫자 조합 또는 영문 2~100자리 까지 입력 가능"/>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobTypeCd">JOB TYPE</span></label>
						<select class="form-control kt-select2" id="jobTypeCd" name="jobTypeCd">
						</select>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-check-square kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobUseCd">사용 유무</span></label>
						<select class="form-control kt-select2" id="useCd" name="useCd">
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm9101.label.jobDesc">JOB 설명</span></label>
				<textarea class="form-control osl-min-h-px--130" name="jobDesc" id="jobDesc" maxlength="2000"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm9101SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show" data-lang-cd="stm9001.button.insert">작성 완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close"
	>Close</span></button>
</div>

<script>
"use strict";
var OSLStm9101Popup = function () {
	
	var formId = 'frStm9101';
	var type = $("#type").val();
	
	var callView = $("#callView").val();
	
	
	var paramJenId = $("#paramJenId").val();
	var paramJobId = $("#paramJobId").val();
	
	
	var nowJobTok = "";
	
	var beforeJobTypeCd ="";
	
	
	$("#stm9101SaveSubmit > span").text($.osl.lang("stm9101.button."+type));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	
	var formValidate = $.osl.validate(formId);
	
    
    var documentSetting = function () {
    	
    	
		var commonCodeArr = [
			{mstCd: "DPL00002", useYn: "Y",targetObj: "#jobTypeCd", comboType:"OS"}, 
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"} 
		];
    	
		
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);

		
    	autosize($("#jobDesc"));
    	
		
		var selectOptionHtml = "<option value=''>"+$.osl.lang("common.name.select")+"</option>";
    	$("#jenId").html(selectOptionHtml);
    	$("#jobId").html(selectOptionHtml);
    	$("#jobRestoreId").html(selectOptionHtml);
    	
		
		fnSelectJenkinsList(type, paramJenId);
		
    	
    	if(type == "update"){
    		
    		fnSelectJobInfo(paramJenId, paramJobId);
    	}
    	
    	
    	$("#jenId").change(function(){
    		fnSelectJobList();
    	});
    	
    	
    	$("#stm9101SaveSubmit").click(function(){
    		
    		var form = $('#'+formId);
    		
    		
    		if (!form.valid()) {
    			return;
    		}
			
        	
        	submitSaveAction();
    	});
    	
    };

    
    var fnSelectJenkinsList = function(type, paramJenId){
    	
    	
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm9000/stm9000/selectStm9000JenkinsNormalListAjax.do'/>", "loadingShow": false});
		
		ajaxObj.setFnSuccess(function(data){
			
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
				
				var jenList = data.jenList;
				var jenAppendStr = "";
				
				
				if($.osl.isNull(jenList) || jenList.length == 0){
					
					jenAppendStr += "<option value=''>"+$.osl.lang("stm9101.message.noExistJenkins")+"</option>";
				}else{
					
	    			jenAppendStr += "<option value=''>"+$.osl.lang("common.name.select")+"</option>";
					
					
					$.each(jenList, function(idx, jenMap){
						
						var selectStr = "";
						
						
						if(type == "update"){
							
							if(jenMap.jenId == paramJenId){
								jenAppendStr = "<option value='" + jenMap.jenId + "' selected data-jen-usr-id='"+jenMap.jenUsrId+"' data-jen-usr-tok='"+jenMap.jenUsrTok+"'data-jen-url='"+jenMap.jenUrl+"' >" + jenMap.jenNm + " (" + jenMap.jenUrl + ")" + "</option>";
							}
						}else{
							jenAppendStr += "<option value='" + jenMap.jenId + "' data-jen-usr-id='"+jenMap.jenUsrId+"' data-jen-usr-tok='"+jenMap.jenUsrTok+"'data-jen-url='"+jenMap.jenUrl+"' "+selectStr+">" + jenMap.jenNm + " (" + jenMap.jenUrl + ")" + "</option>";
						}
					});
				}
				
				
				$("#jenId").html(jenAppendStr);
				
				
				if(callView == "stm9002"){
					
					$("#jenId").val(paramJenId).trigger('change.select2');
					$("#jenId").change();
				}
			}	
		});
		
		
		ajaxObj.send();
    }
    
     
	var fnSelectJobInfo = function(paramJenId, paramJobId) {
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm9000/stm9100/selectStm9100JobDetailAjax.do'/>", "async": true}
				,{"jenId": paramJenId, "jobId":paramJobId});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
				var jobInfo = data.jobInfo;
				
				
		    	$.osl.setDataFormElem(jobInfo,"frStm9101", ["jobTok", "jobParameter", "jobDesc"]);
				
				
		    	$("#jobTypeCd").val(jobInfo.jobTypeCd).trigger('change.select2');
   				$("#useCd").val(jobInfo.useCd).trigger('change.select2');
		    	
				
		    	nowJobTok = jobInfo.jobTok;
				
				beforeJobTypeCd = jobInfo.jobTypeCd;
				
				
				autosize.update($("#jobDesc"));
				
				
				fnSelectJobList(jobInfo);
			}	
		});
		
		
		ajaxObj.send();
	};
    
    
  	
    var submitSaveAction = function(){
    	
    	var form = $('#'+formId);
		
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm($.osl.lang("stm9101.message.confirm."+type),null,function(result) {
	        if (result.value) {
	        	
	        	
	    		var targetJenkins = $("#jenId > option:selected");
	    		var jenUrl = targetJenkins.data("jen-url");
	    		var jenUsrId = targetJenkins.data("jen-usr-id");
	    		var jenUsrTok = targetJenkins.data("jen-usr-tok");
	        	
	        	var formDataArray = form.serializeArray();
	        	formDataArray.push({name:"jenUrl", value:jenUrl});
	        	formDataArray.push({name:"jenUsrId", value:jenUsrId});
	        	formDataArray.push({name:"jenUsrTok", value:jenUsrTok});
	        	formDataArray.push({name:"nowJobTok", value:nowJobTok});
	        	formDataArray.push({name:"beforeJobTypeCd", value:beforeJobTypeCd});
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm9000/stm9100/saveStm9101JobInfoAjax.do'/>"
	    			, "loadingShow": true}, formDataArray);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			
	    			
	    			var connectCheckCode = data.resultCode;
	    			
	    			
	    			if(!$.osl.isNull(connectCheckCode)){
	    				
	    				$.osl.alert(data.resultMessage,{type: 'error'});
	    			
	    			
	    			}else if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    				
    				
	    			}else{
	    				$.osl.toastr(data.message);
	    				
	    				$.osl.layerPopupClose();
	    				
	    				
	    				if(callView == "stm9002"){
	    					
	    					if(paramJenId == $("#jenId").val()){
	    						
		    					OSLStm9002Popup.selectJenkinsDetailInfo();
	    					}
	    					
	    				
	    				}else{
	    					if(type == "insert"){
			    				
			    				$("button[data-datatable-id=stm9100JobTable][data-datatable-action=select]").click();
		    				}else{
		    					
		    					$.osl.datatable.list["stm9100JobTable"].targetDt.reload();	
		    				}
	    				}
	    			}
	    		});
	    		
	    		
	    		ajaxObj.send();
	        }
	    });
		
    };
    
    
    var fnSelectJobList = function(paramJobInfo){
    	
    	var selectJenId = $("#jenId").val();
    	
    	if(!$.osl.isNull(paramJobInfo)){
    		selectJenId = paramJobInfo.jenId;
    	}
    	
    	var target = $('#'+formId);
    	
    	
    	if($.osl.isNull(selectJenId)){
    		
    		target.find("input").attr("readonly", true);
    		target.find("select").attr("disabled", true);
    		$("#stm9101SaveSubmit").attr("disabled", true);
    		
    		
    		target.find("select#jenId").attr("disabled", false);
    	}else{
    		
    		
    		target.find("input").attr("readonly", false);
    		target.find("select").attr("disabled", false);
    		$("#stm9101SaveSubmit").attr("disabled", false);
    		
    		
    		var targetJenkins = $("#jenId > option:selected");
    		var jenUrl = targetJenkins.data("jen-url");
    		var jenUsrId = targetJenkins.data("jen-usr-id");
    		var jenUsrTok = targetJenkins.data("jen-usr-tok");

    		
    		if(!$.osl.isNull(paramJobInfo)){
    			jenUrl = paramJobInfo.jenUrl;
   				jenUsrId = paramJobInfo.jenUsrId;
				jenUsrTok = paramJobInfo.jenUsrTok;
    		}
    		
    		
    		var param = {
    				"jenId" : selectJenId
    				,"jenUrl" : jenUrl 
    				,"jenUsrId" : jenUsrId
    				,"jenUsrTok" : jenUsrTok
			};
    		
    		
    		
    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm9000/stm9000/selectStm9000URLConnect.do'/>"
    			, "loadingShow": false}, param);

    		
    		ajaxObj.setFnSuccess(function(data){
    			
    			
    			var jenConnectCheckCode = data.resultCode;
    			
    			var appendStr = "<option value=''>"+$.osl.lang("common.name.select")+"</option>";;
    			
    			var jobAppendStr = appendStr;
    			var restoreAppendStr = appendStr;
    			
    			
    			if(jenConnectCheckCode == "JENKINS_FAIL"){
    				
    				$.osl.alert(data.resultMessage,{type: 'error'});
    			
				
    			}else if(jenConnectCheckCode == "JENKINS_OK"){
    				
    				
    				var jobList = data.jobList;
    				
    				var jobRestoreList = data.jobRestoreList;
    				
    				
    				var jobArray = [];
    				var jobRestoreArray = [];
    				
    				
    				if(!$.osl.isNull(jobRestoreList)){
    					
    					
    					$.each(jobRestoreList,function(idx, map){
    						
    						
    						jobArray.push(map.jobId); 
    						jobRestoreArray.push(map.jobRestoreId);
    					});
    					
    					
    					$.each(jobRestoreList, function(idx, map){
    						
    						
    						if(map.jobTypeCd == "03"){
    							var selectStr = "";
    							
    							if(!$.osl.isNull(paramJobInfo) && paramJobInfo.jobRestoreId != map.jobId){
    								
    								if(jobRestoreArray.indexOf(map.jobId) != -1){
    									return true;
    								}
    							}else{
    								selectStr = "selected";
    							}
    							
    							restoreAppendStr += '<option value="'+$.osl.escapeHtml(map.jobId)+'" '+selectStr+'>'+map.jobId+'</option>';
    						}
    					});
    					
    					
    					$("#jobRestoreId").html(restoreAppendStr);
    				}
    				
    				
    				if(!$.osl.isNull(jobList)){
    					
    					
    					$.each(jobList, function(idx, map){
    						
    						
    						if(type == "update"){
    							if(map.name == paramJobId){
	    							
	    							jobAppendStr = '<option value="'+$.osl.escapeHtml(map.name)+'">'+$.osl.escapeHtml(map.name)+'</option>';
	    							return false;
    							}
    						}else{
    							
    							if(jobArray.indexOf(map.name) != -1){
    								return true;
    							}
	    						jobAppendStr += '<option value="'+$.osl.escapeHtml(map.name)+'">'+$.osl.escapeHtml(map.name)+'</option>';
    						}
    					});
    				}
    			}
    			
    			
				$("#jobId").html(jobAppendStr);
    			
				
				if(callView == "stm9002"){
					
					$("#jobId").val(paramJobId).trigger('change.select2');
				}
    			
    		});
    		
    		
    		ajaxObj.send();
    	}
    	
    };
	
    return {
        
        init: function() {
        	documentSetting();
        }
    };
}();


$.osl.ready(function(){
	OSLStm9101Popup.init();
});

	
</script>