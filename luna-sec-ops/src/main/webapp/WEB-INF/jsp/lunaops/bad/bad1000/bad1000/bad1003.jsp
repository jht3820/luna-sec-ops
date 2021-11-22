<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http:

<form class="kt-form" id="bad1003Info">
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<input type="hidden" id="stmDsTypeCd" name="stmDsTypeCd" value='${param.stmDsTypeCd}'/>
			<input type="hidden" id="stmRootYn" name="stmRootYn" value='${param.stmRootYn}'/>
			<input type="hidden" name="paramRow" id="paramRow" value='${param.paramRow }' />
			<div class="kt-portlet__head-label" name="writerDiv" id="writerDiv"></div>
		</div>
		
		<div class="kt-portlet__body">
			<div class="row">
				
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12" name="leftDiv" id="leftDiv">
					<div name="badTitleDiv" id="badTitleDiv" class="kt-margin-b-10">
						<label class="required"><i class="fa flaticon2-open-text-book kt-margin-r-5"></i><span data-lang-cd="bad1003.label.title">제목</span></label>
						<input type="text" class="form-control" name="badTitle" id="badTitle" autocomplete="off" required />
					</div>
					<div name="badContentDiv" id="badContentDiv" class="kt-margin-b-10">
						<label class="required"><i class="fa flaticon2-edit kt-margin-r-5"></i><span data-lang-cd="bad1003.label.content">내용</span></label>
						<textarea class="kt-hide" name="badContent" id="badContent" autocomplete="off" required></textarea>
					</div>
				</div>
				
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12 osl-1400-desktop-padding-0" name="rightDiv" id="rightDiv">
					
					<div class="kt-padding-l-20 form-group row kt-margin-b-10 kt-hide"  name="stmNtcYnCd" id="stmNtcYnCd">
						<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badNtcYnCd" id="badNtcYnCd">
							<span></span>
						</label>
							<span data-lang-cd="bad1003.label.noticeCheck">공지사항 사용</span>
				 	</div>
			 		
				 	<div class="kt-margin-l-35 form-group kt-hide osl-bad_box" name="ntcOption" id="ntcOption">
				 		<div class="input-group kt-input-icon pull-right">
					 		<label class="input-group-addon kt-margin-5 kt-padding-5"><span data-lang-cd="bad1003.label.noticeDate">공지 기간</span></label>
					 		<input type="text" class="form-control small" name="badNtcRange" id="badNtcRange" autocomplete="off"/>
				 			<span class="kt-input-icon__icon kt-input-icon__icon--right kt-bg-brand osl-h-px-38"><span><i class="la la-calendar-check-o kt-font-light"></i></span></span>
				 		</div>
				 		<div class="row kt-padding-t-10 kt-padding-l-15">
					 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success kt-margin-t-10 kt-margin-b-0"><input type="checkbox" name="badNtcTopYnCd" id="badNtcTopYnCd">
								<span></span>
							</label>
							<span data-lang-cd="bad1003.label.noticeDateIgnore">공지 기간 무시</span>
				 		</div>
				 	</div>
				 	
				 	<div class="kt-padding-l-20 form-group row kt-margin-b-10 kt-hide"  name="stmPwYnCd" id="stmPwYnCd">
				 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badPwYnCd" id="badPwYnCd">
							<span></span>
						</label>
							<span data-lang-cd="bad1003.label.secretCheck">비밀글 사용</span>
				 	</div>
				 	
				 	<div class="kt-margin-l-35 kt-margin-b-10  kt-hide osl-bad_box" name="pwOption" id="pwOption">
				 		<div class="input-group kt-margin-b-10">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-70 required'><span data-lang-cd="bad1003.label.password">PW</span></label>
				 			<input type="password" class="form-control" name="badPw" id="badPw" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexalert="알파벳과 숫자 조합 4-12자 이내"/> 
				 		</div>
				 		<div class="input-group">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-70 required'><span data-lang-cd="bad1003.label.passwordCheck">PW 확인</span></label>
				 			<input type="password" class="form-control" name="badPwCheck" id="badPwCheck" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexalert="알파벳과 숫자 조합 4-12자 이내" equalTo="#badPw"/>
			 			</div>
				 	</div>
				 	
				 	<div class="kt-padding-l-20 form-group row kt-hide"  name="stmCmtYnCd" id="stmCmtYnCd">
				 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badCmtYnCd" id="badCmtYnCd">
							<span></span>
						</label>
							<span data-lang-cd="bad1003.label.commentCheck">댓글 허용</span>
				 	</div>
				 	
					<div class="form-group row kt-hide" name="badFileOption" id="badFileOption">
						<div class="col-4 kt-font-bolder kt-padding-l-20">
							<i class="fa fa-file-upload kt-margin-r-5"></i><span data-lang-cd="bad1003.label.attachFile">파일 첨부</span>
							<button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="fileRemoveResetBtn"><span data-lang-cd="bad1003.button.deleteResetBtn">삭제 초기화</span></button>
						</div>
						<div class="col-12 kt-margin-t-10 kt-padding-l-20 kt-padding-r-10 kt-uppy osl-max-h-px-260" name="bad1003FileUpload" id="bad1003FileUpload">
							<div class='kt-uppy__dashboard'></div>
							<div class='kt-uppy__progress'></div>
						</div>
					</div>
					
					<div class="form-group row kt-margin-b-10 kt-hide" name="badTagOption" id="badTagOption">
						<div class="col-4 kt-font-bolder kt-padding-l-20">
							<i class="fa fa-hashtag kt-margin-r-5"></i><span data-lang-cd="bad1003.label.tag">태그</span>
						</div>
						<div class="input-group kt-margin-t-10 kt-margin-l-20 kt-margin-r-10">
							<div class="input-group-prepend">
								<span class="input-group-text">#</span>
							</div>
							<input type="text" class="form-control col-5" name="tagWriter" id="tagWriter" autocomplete="off" maxlength="30" />
							<div class="input-group-prepend">
								<span class="input-group-button btn btn-brand" id="tagBtn" name="tagBtn"><span data-lang-cd="bad1003.button.submit">등록</span></span>
							</div>
						</div>
						
						<div class="kt-margin-t-20 kt-padding-l-15" name="tagListDiv" id="tagListDiv">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-brand" id="bad1003UpdateSubmit"><i class="fa fa-check-square"></i><span class="osl-resize__display--show" data-lang-cd="bad1003.button.updateSubmit">수정 완료</span></button>
			<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
		</div>
	</div>
</form>

<script>
"use strict";


var fileUploadObj;
var OSLBad1003Popup = function () {
	var formId = 'bad1003Info';
	
	
	var formEditList = [];
	
	var formValidate = $.osl.validate(formId);
	
	var tag = [];
	
	var data ={};
	
	var uploadRemoveFiles = [];
	
	var rowData;
	
	
	var currentBadFileCnt;
	var currentBadFileStrg;
	
	
	var maxCnt;
	var maxStrg;
	
	
	var pw;
    var documentSetting = function () {
    	
    	
    	$("#bad1003UpdateSubmit > span").text($.osl.lang("bad1003.button.updateSubmit"));
    	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
    	
    	
		$("#badTitle").attr("placeholder",$.osl.lang("bad1002.placeholder.badTitle"));
		$("#badContent").attr("placeholder",$.osl.lang("bad1002.placeholder.badContent"));
		$("#badPw").attr("placeholder",$.osl.lang("bad1002.placeholder.password"));
		$("#badPwCheck").attr("placeholder",$.osl.lang("bad1002.placeholder.password"));
		
		
		$("#badPw").attr("regexerrorstr", $.osl.lang("bad1002.regex.password"));
		$("#badPwCheck").attr("regexerrorstr", $.osl.lang("bad1002.regex.password"));
    	
		
    	
    	rowData = JSON.parse($("#paramRow").val());
    	
    	$("#paramRow").val('');
    	
    	
    	if(rowData.stmOptionCnt == "" || rowData.stmOptionCnt==0){
    		$("#leftDiv").removeClass("col-xl-6");
    		$("#leftDiv").addClass("col-xl-12");
    		$("#rightDiv").addClass("kt-hide");
    	}else{
        	
        	
        	$("#badNtcYnCd").click(function(){
        		if($("#badNtcYnCd").is(":checked")==true){
        			
        			$("#ntcOption").removeClass("kt-hide");
        		}else{
        			
        			$("#ntcOption").addClass("kt-hide");
        		}
        	});
        	
        	
        	$("#badPwYnCd").click(function(){
        		if($("#badPwYnCd").is(":checked")==true){
        			
        			$("#pwOption").removeClass("kt-hide");
        		}else{
        			
        			$("#pwOption").addClass("kt-hide");
        		}
        	});
        	
        	
    		maxStrg = rowData.stmFileStrg;
    		if($.osl.isNull(maxStrg)){
    			maxStrg = 0;			
    		}
    		maxCnt = parseInt(rowData.stmFileCnt);
    		if($.osl.isNull(maxStrg)){
    			maxCnt = 0;
    		}
    		
    		if(rowData.badFileCnt>maxCnt){
    			currentBadFileCnt = rowData.badFileCnt;
    		}else{
    			
    			currentBadFileCnt = maxCnt;
    		}
    		
    		if(rowData.badFileSize>maxStrg){
    			currentBadFileStrg = rowData.badFileSize;
    		}else{
    			
    			currentBadFileStrg = maxStrg;
    		}
    		
    		
    		
    		fileUploadObj = $.osl.file.uploadSet("bad1003FileUpload",{
    			url: '/bad/bad1000/bad1000/insertBad1002BadAtchFileInfo.do',
    			meta: {"atchFileId": rowData.atchFileId, "fileSn": 0},
    			maxFileSize: currentBadFileStrg,
    			maxNumberOfFiles: currentBadFileCnt,
    			height: 260,
    			
    			
    			onBeforeUpload: function(files){
    				var rtnValue = files;
    				var uploadFiles = {};
    				
    				
    				if($.osl.isNull(rowData.atchFileId)){
    					
    					$.osl.file.makeAtchfileId(function(data){
    						
    						if(data.errorYn == "Y"){
    							$.osl.toastr(data.message);
    							rtnValue = [];
    						}else{
    							
    							rowData.atchFileId = data.atchFileIdString;
    						 	fileUploadObj.setMeta({atchFileId: data.atchFileIdString});
    						 
    							
    		    				$.each(files, function(idx, map){
    		    					map.meta.atchFileId = data.atchFileIdString;
    		    					
    		    					var jsonTmp = {};
    								jsonTmp[map.id] = map;
    								uploadFiles = $.extend(uploadFiles, jsonTmp);
    		    				});
    							
    		    				rtnValue = uploadFiles;
    						}
    					});
    				}else{
    					
        				
        				$.each(files, function(idx, map){
        					if(map.source != "database"){
        						map.meta.atchFileId = rowData.atchFileId;
        						map.meta.source = map.source;
        						
        						var jsonTmp = {};
        						jsonTmp[map.id] = map;
        						uploadFiles = $.extend(uploadFiles, jsonTmp);
        					}
        				});
    				}

    				
    				submitUpdateAction();
    				
    				rtnValue = uploadFiles;
    				return rtnValue;
    			},
    			
    			onBeforeFileAdded: function(currentFile, files){
    				if(currentFile.source != "database" && currentFile.source != "remove"){
    					var newNm = new Date().format("ssms")+"_"+currentFile.name;
    					currentFile.name = newNm;
    					currentFile.meta.name = newNm;
    					currentFile.meta.atchFileId = rowData.atchFileId;
    					
    	    			
    	    			var fileSn = fileUploadObj.getState().meta.fileSn;
    	    			
    	    			currentFile.meta.fileSn = fileSn;
    	    			fileUploadObj.setMeta({fileSn: (fileSn+1)});
    				}
    			}
    		});
    		
       		
    		fileUploadObj.setMeta({atchFileId: rowData.atchFileId});
    		 	
    	   	
    	   	fileUploadObj.on('file-removed', function(file) {
    	   		file["fileSn"] = file.meta.fileSn;
    	   		file.source = "remove";
    	   		uploadRemoveFiles.push(file);
    	   		
    	   		
    	   		
    	   		var optFileCnt = fileUploadObj.opts.restrictions.maxNumberOfFiles;
    	   		var optFileStrg = fileUploadObj.opts.restrictions.maxFileSize;

    	   		
    	   		if(optFileCnt > maxCnt){
    	   			
    	   			var changeFileCnt = optFileCnt - 1;
	    	   		fileUploadObj.opts.restrictions.maxNumberOfFiles = changeFileCnt;
    	   		}else{
    	   			
    	   			fileUploadObj.opts.restrictions.maxNumberOfFiles = maxCnt;
    	   		}
    	   		
    	   		
    	   		if(optFileStrg > maxStrg){
    	   			var changeFileStrg;
    	   			var intervalStrg = optFileStrg - file.data.size;
    	   			
    	   			if(intervalStrg > maxStrg){
    	   				
    	   				changeFileStrg = intervalStrg;
    	   			}else{
    	   				
    	   				changeFileStrg = maxStrg*(1024*1024);
    	   			}
    	   			
	    	   		fileUploadObj.opts.restrictions.maxFileSize = changeFileStrg;
    	   		}else{
    	   			
    	   			fileUploadObj.opts.restrictions.maxFileSize = maxStrg*(1024*1024);
    	   		}
    	   		
    	   		$("#fileRemoveResetBtn").removeClass("d-none");
    		});
    	   	
    	   	
    	   	$("#fileRemoveResetBtn").click(function(){
    	   		$("#fileRemoveResetBtn").addClass("d-none");
    	   		
    	   		
    	   		fileUploadObj.opts.restrictions.maxFileSize = currentBadFileStrg*(1024*1024);
    	   		fileUploadObj.opts.restrictions.maxNumberOfFiles = currentBadFileCnt;
    	   		
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
    	   		
    	   		uploadRemoveFiles = [];
    		});
    	}

	  	
    	setBadInfo();
    	
	   	
    	$("#bad1003UpdateSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		
     		var localData = {};
     		
     		
     		localData.badTitle = $("#badTitle").val();
     		localData.badContent = $("#badContent").val();

     		
     		if(rowData.stmNtcYnCd=='01'){
	    		if($("#badNtcYnCd").is(":checked")==true){
	    			
	    			var stdtm = ($("#badNtcRange").val()).split(" - ")[0];
	    			var eddtm = ($("#badNtcRange").val()).split(" - ")[1];
		    		
	    			localData.badNtcStdtm = stdtm;
	    			localData.badNtcEddtm = eddtm;
	    				
	    			
		    		if($("#badNtcTopYnCd").is(":checked")==true){
		    			localData.badNtcType = '03';
		    		}else{
		    			localData.badNtcType = '02';
		    		}
				}else{
					
					localData.badNtcStdtm = "";
	    			localData.badNtcEddtm = "";
	    			localData.badNtcType = '01';
				}
    			
    			localData.notChangeNtc = "N";
     		}
     		
     		
     		
     		if($("#stmNtcYnCd").hasClass("kt-hide") && rowData.badNtcType!='01'){
				
				localData.notChangeNtc = "Y";
     		}

     		
    		if($("#badPwYnCd").is(":checked")==true){
    			if(pw!="Y"){
    				
    				
    				if($("#badPw").val()==""){
    					$.osl.alert($.osl.lang("bad1002.formCheck.passwordMessage"));
    					$("#badPw").focus();
   						return false;
    				}
    			}
    		}else{
    			
    			localData.badPw = "";
    		}
    		
			localData.notChangePw = "N";
    		
			
     		
     		if($("#stmPwYnCd").hasClass("kt-hide") && rowData.badPw!='01'){
				
				localData.notChangePw = "Y";
     		}
    		
    		
    		localData.tagList = JSON.stringify(tag);
    		
			
    		if($("#badCmtYnCd").is(":checked")==true){
    			localData.badCmtYn = "01";
    		}else{
    			localData.badCmtYn = "02";
    		}
    		
			
    		$.osl.confirm($.osl.lang("bad1003.update"),{"html" : true},function(result) {
    	        if (result.value) {
    	        	data = localData;
    	        	data.prjGrpId = rowData.prjGrpId;
    	        	data.prjId = rowData.prjId;
    	        	data.menuId = rowData.menuId;
    	        	data.badId = rowData.badId;
    	        	
    	        	if(rowData.stmOptionCnt != "" || rowData.stmOptionCnt!=0){
    	        		fileUploadObj.upload();
    	        	}else{
    	        		
    	        		submitUpdateAction();
    	        	}
    	        }
    		});
    	});
		
		
	   $("#tagWriter").on("propertychange change keyup paste input", function (e) {
	        var self = $(this);
	        
	        if ( e.keyCode == 13 || e.keyCode == 32) {
	            var tagValue = self.val();
	            
	            if (tagValue != "") {
	                
	                var result = Object.values(tag).filter(function (word) {
	                    return word == tagValue;
	                })
	            
	                
	                if (result.length == 0) { 
	                	var innerHtml = "";
	                	innerHtml += "<tag title='"+$.osl.escapeHtml(tagValue)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-margin-5 kt-padding-5 osl-display--inline-flex' role='tag' value='"+$.osl.escapeHtml(tagValue)+"'>";
	                	innerHtml += "<x class='tagify__tag__removeBtn kt-margin-l-10' role='button' aria-label='remove tag'></x>";
	                	innerHtml += "<div><div class='tagify__tag-text kt-margin-l-5'>"+$.osl.escapeHtml(tagValue)+"</div></div></tag>";
	                	
	                    $("#tagListDiv").append(innerHtml);
	                    tag.push(tagValue);
	                    $("#tagWriter").val("");
	                } else {
	                	$.osl.toastr($.osl.lang("bad1002.formCheck.tagMatching"), {"type" : "warning"});
	                    $("#tagWriter").val("");
	                }
	            }
	         
	            e.preventDefault(); 
	        }
	    });
	   
		
		$("#tagBtn").click(function(e){
			var tagValue = $("#tagWriter").val();
	            
	            if (tagValue != "") {
	                
	                var result = Object.values(tag).filter(function (word) {
	                    return word == tagValue;
	                })
	            
	                
	                if (result.length == 0) { 
	                	var innerHtml = "";
	                	innerHtml += "<tag title='"+$.osl.escapeHtml(tagValue)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-margin-5 kt-padding-5 osl-display--inline-flex' role='tag' value='"+$.osl.escapeHtml(tagValue)+"'>";
	                	innerHtml += "<x class='tagify__tag__removeBtn kt-margin-l-10' role='button' aria-label='remove tag'></x>";
	                	innerHtml += "<div><div class='tagify__tag-text kt-margin-l-5'>"+$.osl.escapeHtml(tagValue)+"</div></div></tag>";
	                	
	                    $("#tagListDiv").append(innerHtml);
	                    tag.push(tagValue);
	                    $("#tagWriter").val("");
	                } else {
	                	$.osl.toastr($.osl.lang("bad1002.formCheck.tagMatching"), {"type" : "warning"});
	                    $("#tagWriter").val("");
	                }
	            }
	        	 
	            e.preventDefault(); 
		});
	 
		
	    $(document).off("click", ".tagify__tag__removeBtn").on("click", ".tagify__tag__removeBtn", function (e) {
	    	
	    	var tagText = $(this).parent().attr("value");
	    	
	    	var idx = tag.indexOf(tagText);
	    	
	    	tag.splice(idx, 1);
	    	
	    	$(this).parent().remove();
	    });
    }
    
	
    
    var setBadInfo = function(){
    	
		var data={
    			"menuId" : rowData.menuId,
    			"badId" : rowData.badId,
    			"badHit" : false,
    	}
    	
    	
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/bad/bad1000/bad1000/selectBad1001InfoAjax.do'/>"}
				, data);
    	
    	
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
				var setBad = data.bad1001Info;
				var tagList = data.bad1001Tag;
				var fileList = data.bad1001FileList;
				var fileCnt = data.bad1001FileListCnt;
				
				
				
				
				var usrData = {
					html: setBad.badUsrNm + " (" + setBad.badUsrId + ")",
					imgSize: "sm",
					class:{
						cardBtn: "osl-width__fit-content"
					}
				};
				$("#writerDiv").html($.osl.user.usrImgSet(setBad.badUsrImgId, usrData));
				
				$("#writerDiv>.kt-user-card-v2.btn.osl-width__fit-content").children("div").click(function(){
					$.osl.user.usrInfoPopup(setBad.badUsrId);
				});
				
				
				
				$("#badTitle").val(setBad.badTitle);
				
				
				$("#badContent").val(setBad.badContent);
				
				
		    	formEditList.push($.osl.editorSetting("badContent", {formValidate: formValidate, 'minHeight': 380}));
				$("#badContent").removeClass("kt-hide");
				
				if(rowData.stmOptionCnt>0){
					
					if(rowData.stmNtcYnCd == "01"){
						$("#stmNtcYnCd").removeClass("kt-hide");
						$.osl.date.daterangepicker("#badNtcRange");
						
						
						if(setBad.badNtcCheck == "01"){
							
							$("#badNtcYnCd").attr("checked", true);
							
							$("#ntcOption").removeClass("kt-hide");
							
							if(rowData.badNtcType=='03'){
								$("#badNtcTopYnCd").attr("checked", true);
							}
							
							$("#badNtcRange").val(setBad.badNtcStdtm + " - " + setBad.badNtcEddtm);
						}else{
							
							$("#badNtcYnCd").attr("checked", false);
							
							$("#ntcOption").addClass("kt-hide");
						}
					}else{
						$("#stmNtcYnCd").addClass("kt-hide");
					}

					
					if(rowData.stmPwYnCd == "01"){
						$("#stmPwYnCd").removeClass("kt-hide");
						$("#pwOption").removeClass("kt-hide");
						
						
						if(setBad.badPw != null && setBad.badPw != "" ){
							$("#badPwYnCd").attr("checked", true);
							
							$("#pwOption").removeClass("kt-hide");
							pw="Y";
							
							$("#badPw").val("");
							$("#badPw").attr("placeholder",$.osl.lang("bad1002.placeholder.nullPassword"));
							$("#badPwCheck").attr("placeholder",$.osl.lang("bad1002.placeholder.nullPassword"));
						}else{
							$("#badPwYnCd").attr("checked", false);
							
							$("#pwOption").addClass("kt-hide");
						}
					}
					
					
					if(rowData.stmCmtYnCd == "01"){
						$("#stmCmtYnCd").removeClass("kt-hide");
						
						if(setBad.badCmtYn == "01"){
							$("#badCmtYnCd").attr("checked", true);
						}else{
							$("#badCmtYnCd").attr("checked", false);
						}
					}

					
					if(rowData.stmFileCnt != null && rowData.stmFiileCnt != "" && rowData.stmFileCnt != 0){
						$("#badFileOption").removeClass("kt-hide");
						
						if(fileList != null){
							$("#badFileOption").removeClass("kt-hide");
							
							
					    	fileUploadObj.setMeta({fileSn: parseInt(fileCnt)+1});
					    	fileUploadObj.setMeta({atchFileId: fileList.atchFileId});
					    	
					    	
					    	$.osl.file.fileListSetting(fileList, fileUploadObj);
						}
					}else{
						$("#badFileOption").addClass("kt-hide");
					}
					
					
					if(rowData.stmTagYnCd == "01"){
						$("#badTagOption").removeClass("kt-hide");
						
						
						if(tagList != null && tagList[0] != null)
						{
							$.each(tagList, function(idx, value){
								
								var innerHtml = "";
			                	innerHtml += "<tag title='"+$.osl.escapeHtml(value)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-margin-5 kt-padding-5 osl-display--inline-flex' role='tag' value='"+$.osl.escapeHtml(value)+"'>";
			                	innerHtml += "<x class='tagify__tag__removeBtn kt-margin-l-10' role='button' aria-label='remove tag'></x>";
			                	innerHtml += "<div><div class='tagify__tag-text kt-margin-l-5'>"+$.osl.escapeHtml(value)+"</div></div></tag>";
			                	
			                	$("#tagListDiv").append(innerHtml);
			                	tag.push(value);
							});
						}
					}else{
						$("#badTagOption").addClass("kt-hide");
					}
				}
			}
    	});
    	
    	
		ajaxObj.send();
	};
 	
    
    var submitUpdateAction = function(){
		var form = $('#'+formId);   
		
		
		if (!form.valid()) {
			return;
		}
		
		if(rowData.stmOptionCnt != null && rowData.stmOptionCnt != "" && rowData.stmOptionCnt >0){
			
	       	var uploadFileList = [];
	       	$.each(fileUploadObj.getFiles(), function(idx, map){
	       		if(map.source == "database"){
	       			return true;
	       		}
	       		uploadFileList.push(map);
	       	});
	       	uploadFileList = uploadFileList.concat(uploadRemoveFiles);

	       	
	       	data.fileHistory = JSON.stringify(uploadFileList);
	       	
			
			data.atchFileId = rowData.atchFileId;
			data.fileSn = 0;
		}

		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/bad/bad1000/bad1000/updateBad1003BadInfoAjax.do'/>"}
				, data);
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn=="Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
   				$.osl.toastr(data.message);

				
				var data = {
						stmTypeCd : $("#stmTypeCd").val(),
						stmNm : $.osl.escapeHtml($("#stmNm").val()),
						backPageYn: "N",
						stmRootYn: $("#stmRootYn").val(),
						paramRow : JSON.stringify(rowData),
						badHitYn : "ok", 
					};
				var options = {
						idKey: "bad1001_"+ rowData.badId,
						modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+rowData.badNum,
						closeConfirm: false,
						autoHeight: false,
						modalSize: "xl",
					};
   				
   				$.osl.layerPopupClose();
				
   				$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1001View.do',data,options);
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
	OSLBad1003Popup.init();
});
</script>