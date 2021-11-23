<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frReq1001">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="paramReqId" id="paramReqId" value="${param.paramReqId}">
	<input type="hidden" name="reqUsrId" id="reqUsrId" value="${param.paramReqUsrId}">
	<input type="hidden" name="atchFileId" id="atchFileId">
	<div class="kt-portlet kt-portlet--collapsed" id="req1001RequestUsrInfo">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req1001.reqUser.title">요청자 정보</span>
			</div>
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-group">
					<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
				</div>
			</div>
		</div>
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-xl-2 kt-align-center">
					<a href="#" class="kt-media kt-media--xl kt-media--circle">
						<img type="img" id="usrImgId">
					</a>
				</div>
				<div class="col-xl-5">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req1001.reqUser.usrNm">요청자 이름</span></label>
						<input type="text" class="form-control" placeholder="요청자 이름" name="reqUsrNm" id="usrNm" readonly="readonly" required>
					</div>
				</div>
				<div class="col-xl-5">
					<div class="form-group">
						<label class="required"><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req1001.reqUser.email">요청자 e-mail</span></label>
						<input type="email" class="form-control" placeholder="요청자 이메일" name="reqUsrEmail" id="email" readonly="readonly" required>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-7">
					<div class="form-group">
						<label><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req1001.reqUser.deptNm">요청자 소속</span></label>
						<input type="text" class="form-control" name="reqUsrDeptNm" id="deptName" readonly="readonly">
						<input type="hidden" name="reqUsrDeptId" id="deptId">
					</div>
				</div>
				<div class="col-xl-5">
					<div class="form-group">
						<label class="required"><i class="fa fa-phone-square-alt kt-margin-r-5"></i><span data-lang-cd="req1001.reqUser.telNo">요청자 연락처</span></label>
						<input type="text" class="form-control" placeholder="요청자 연락처" name="reqUsrNum" id="telno" readonly="readonly" required>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label for="exampleSelect1"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req1001.prjNm">프로젝트</span></label>
						<select class="form-control kt-select2" name="reqPrjSelect" id="reqPrjSelect">
						</select>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="req1001.reqDtm">요청 일자</span></label>
						<input type="date" class="form-control" placeholder="요청 일자" name="reqDtm" id="reqDtm" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req1001.reqNm">요청 제목</span></label>
				<input type="text" class="form-control" placeholder="요청 제목" name="reqNm" id="reqNm" required>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req1001.reqDesc">요청 내용</span></label>
				<textarea  name="reqDesc" id="reqDesc" required></textarea>
			</div>
			<!-- 
			<div class="form-group kt-margin-b-10">
				<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
					<input type="checkbox" name="reqPwCheckbox" id="reqPwCheckbox">
					<span></span>
				</label>
				<span data-lang-cd="req1001.reqPw.title">요구사항 잠금</span>
			</div>
			<div class="kt-hide osl-bad_box" name="pwOption" id="pwOption">
		 		<div class="input-group kt-margin-b-10">
			 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="req1001.reqPw.password">PW</span></label>
		 			<input type="password" class="form-control" name="reqPw" id="reqPw" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexerrorstr="알파벳과 숫자 조합 4-12자 이내"  placeholder="알파벳과 숫자 조합 4-12자 이내"/> 
		 		</div>
		 		<div class="input-group">
			 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="req1001.reqPw.passwordCheck">PW 확인</span></label>
		 			<input type="password" class="form-control" name="reqPwCheck" id="reqPwCheck" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexerrorstr="알파벳과 숫자 조합 4-12자 이내"  placeholder="알파벳과 숫자 조합 4-12자 이내" equalTo="#reqPw"/>
	 			</div>
		 	</div>
		 	 -->
			<div class="form-group kt-margin-t-25  form-group-last">
				<label><i class="fa fa-file-upload kt-margin-r-5"></i><span data-lang-cd="req1001.attachments">파일 첨부</span> <button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="fileRemoveResetBtn">삭제 초기화</button></label>
				<div class="kt-uppy" id="req1001FileUpload">
					<div class="kt-uppy__dashboard"></div>
					<div class="kt-uppy__progress"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet kt-portlet--collapsed kt-hide" data-ktportlet="true" id="req1001NewRequestOpt">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req1001.requestDefaultOptNm">접수 기본항목 입력</span>
			</div>
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-group">
					<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
				</div>
			</div>
		</div>
		<div class="kt-portlet__body">
		
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="req1001SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show" data-lang-cd="req1001.complete">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
	


var fileUploadObj;
var OSLReq1001Popup = function () {
	var formId = 'frReq1001';
	
	
	var formEditList = [];
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var uploadRemoveFiles = [];
	
	
	
	
    
    var documentSetting = function () {
    	
    	$("#reqPrjSelect").html($.osl.prjGrpAuthSelSetting(2,true));

    	
    	var type = $("#type").val();
    	
    	
    	$("#req1001SaveSubmit > span").text($.osl.lang("req1001."+type+".saveBtnString"));
    	
    	
    	var atchFileId = $("#atchFileId").val();
    	
    	
    	new KTPortlet('req1001RequestUsrInfo', $.osl.lang("portlet"));
    	new KTPortlet('req1001NewRequestOpt', $.osl.lang("portlet"));
    	
    	
    	
		
    	
    	
    	fileUploadObj = $.osl.file.uploadSet("req1001FileUpload",{
    		url: '/req/req1000/req1000/insertReq1001ReqAtchFileInfo.do',
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": atchFileId, "fileSn": 0},
    		maxNumberOfFiles:20,
    		
    		onBeforeUpload: function(files){
    			var rtnValue = files;
    			var uploadFiles = {};
    			
    			if(type == "insert"){
    				
    				$.osl.file.makeAtchfileId(function(data){
    					if(data.errorYn == "Y"){
	   						$.osl.toastr(data.message);
	   						rtnValue = [];
	   					}else{
	   						$("#atchFileId").val(data.atchFileIdString);
	   					 	fileUploadObj.setMeta({atchFileId: data.atchFileIdString});
	   					 
	   						
	   	    				$.each(files, function(idx, map){
	   	    					map.meta.atchFileId = data.atchFileIdString;
	   	    					
	   	    					var jsonTmp = {};
	    						jsonTmp[map.id] = map;
	    						uploadFiles = $.extend(uploadFiles, jsonTmp);
	   	    				});
	   						
	   	    				rtnValue = uploadFiles;
	   	    				
	   						
	   						submitInsertAction();
	   					}
    				});
    			}else{
    				
    				$.each(files, function(idx, map){
    					if(map.source != "database"){
    						map.meta.atchFileId = $("#atchFileId").val();
    						map.meta.source = map.source;
    						
    						var jsonTmp = {};
    						jsonTmp[map.id] = map;
    						uploadFiles = $.extend(uploadFiles, jsonTmp);
    					}
    				});

					
					submitUpdateAction();
					
    				rtnValue = uploadFiles;
    			}
   				return rtnValue;
    		},
    		
    		onBeforeFileAdded: function(currentFile, files){
    			if(currentFile.source != "database" && currentFile.source != "remove"){
    				var newNm = new Date().format("ssms")+"_"+currentFile.name;
    				currentFile.name = newNm;
    				currentFile.meta.name = newNm;
    				
    				
	    			
	    			
	    			
	    			
	    			
    			}
    		}
    	});
    	
    	
    	if(type == "update"){
    		
    		selectReqInfo();
    		
			
			 	
	    	
	    	fileUploadObj.on('file-removed', function(file) {
	    		file["fileSn"] = file.meta.fileSn;
	    		file.source = "remove";
	    		uploadRemoveFiles.push(file);
	    		
	    		
	    		
	    		$("#fileRemoveResetBtn").removeClass("d-none");
			});
	    	
	    	
	    	$("#fileRemoveResetBtn").click(function(){
	    		$("#fileRemoveResetBtn").addClass("d-none");
	    		
	    		$.each(uploadRemoveFiles, function(idx, map){
	    			fileUploadObj.addFile({
	    			    name: map.name,
	    			    type: map.type,
	    			    source: 'database',
	    			    meta: {
	    			    	atchFileId: map.meta.atchFileId,
	    			    	fileSn: map.meta.fileSn
	    			    },
	    				data: map.data,
    				});
	    		});

	    		setTimeout(function(){
	    			
	    			$.each(fileUploadObj.getFiles(), function(idx, map){
	    				
	    				if(map.source == "database"){
	    					var target = $("#uppy_"+$.escapeSelector(map.id)+" > .uppy-DashboardItem-preview");
	    					target.addClass("osl-cursor-pointer");
	    					target.off("click");
	    					target.click(function(){
	    						$.osl.file.fileDownload(map.meta.atchFileId, map.meta.fileSn);
	    					});
	    				}
	    			});
	    		},2000);
	    		
	    		uploadRemoveFiles = [];
	    	});
    	}else{
    		
        	$.osl.setDataFormElem($.osl.user.userInfo,"frReq1001", ["usrNm","email","telno","deptName","deptId","usrImgId"]);
        	
			$("#reqUsrId").val($.osl.user.userInfo.usrId);
        	
	    	
	    	$("#reqDtm").val(new Date().format("yyyy-MM-dd"));
    	}

    	
    	formEditList.push($.osl.editorSetting("reqDesc", {formValidate: formValidate}));
    	
    	
		$.osl.date.datepicker($("#reqDtm"), {});
    	
    	
    	$("#req1001SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		
    		$.osl.confirm($.osl.lang("req1001."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	fileUploadObj.upload();
    	        }
    		});
    	});
    };
    
    
    
	 var selectReqInfo = function() {
    	var paramPrjId = $("#paramPrjId").val();
    	var paramReqId = $("#paramReqId").val();
    	var paramReqUsrId = $("#reqUsrId").val();
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req1000/req1000/selectReq1000ReqInfoAjax.do'/>", "async": false}
				,{"paramPrjId": paramPrjId, "paramReqId" : paramReqId, "reqUsrId": paramReqUsrId });
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				
				$.osl.layerPopupClose();
			}else{
				
		    	$.osl.setDataFormElem(data.reqInfoMap,"frReq1001");
				
				
		    	$("#usrNm").val(data.reqInfoMap.reqUsrNm);
		    	$("#email").val(data.reqInfoMap.reqUsrEmail);
		    	$("#telno").val(data.reqInfoMap.reqUsrNum);
		    	$("#deptName").val(data.reqInfoMap.reqUsrDeptNm);
		    	$("#deptId").val(data.reqInfoMap.reqUsrDeptId);
		    	$("#usrImgId").attr("src",$.osl.user.usrImgUrlVal(data.reqInfoMap.reqUsrImgId));
		    	
		    	$("#reqPrjSelect").val(data.reqInfoMap.prjId).trigger('change.select2');
		    	$("#reqPrjSelect").prop("disabled", true);
		    	
		    	
		    	fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
		    	
		    	
		    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
		    	
			}
		});
		
		
		ajaxObj.setFnError(function(xhr, status, err){
			data = JSON.parse(data);
			jAlert(data.message, "알림창");
		});
		
		
		ajaxObj.send();
	};
    
    
    var submitInsertAction = function(paramActhFileId){
    	var form = $('#'+formId);    		
    	
		
		if (!form.valid()) {
			return;
		}
		
       	
   		var fd = $.osl.formDataToJsonArray(formId);

       	
       	fd.append("fileHistory",JSON.stringify(fileUploadObj.getFiles()));
       	
      	
		$.each(fileUploadObj.getFiles(), function(idx, map){
			map.meta.atchFileId = paramActhFileId;
			
			fd.append("file",map);
		});
      
      	
		var prjGrpId = $("#reqPrjSelect option[value="+$("#reqPrjSelect").val()+"]").data("prj-grp-id");
		fd.append("prjGrpId",prjGrpId);
		
   		
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/req/req1000/req1000/insertReq1001ReqInfoAjax.do'/>", "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				$("button[data-datatable-id=req1000ReqTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		
   		ajaxObj.send();
		
    };
    
    
    var submitUpdateAction = function(){
		var form = $('#'+formId);    		
    	
		
		if (!form.valid()) {
			return;
		}

       	
   		var fd = $.osl.formDataToJsonArray(formId);
       	
       	
       	var uploadFileList = [];
       	$.each(fileUploadObj.getFiles(), function(idx, map){
       		if(!map.hasOwnProperty("source") || map.source == "database"){
       			return true;
       		}
       		uploadFileList.push(map);
       	});
       	uploadFileList = uploadFileList.concat(uploadRemoveFiles);

       	
       	fd.append("fileHistory",JSON.stringify(uploadFileList));
       	
   		
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/req/req1000/req1000/updateReq1001ReqInfoAjax.do'/>", "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				$("button[data-datatable-id=req1000ReqTable][data-datatable-action=select]").click();
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
	OSLReq1001Popup.init();
});

	
</script>