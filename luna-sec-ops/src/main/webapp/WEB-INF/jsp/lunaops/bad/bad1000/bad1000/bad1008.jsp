<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form class="kt-form" id="bad1008Info">
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<input type="hidden" id="stmDsTypeCd" name="stmDsTypeCd" value='${param.stmDsTypeCd}'/>
			<input type="hidden" name="menuId" id="menuId" value="${param.menuId }" /> 
			<input type="hidden" name="paramStmNtcYnCd" id="paramStmNtcYnCd" value="${param.stmNtcYnCd }" /> 
			<input type="hidden" name="paramStmPwYnCd" id="paramStmPwYnCd" value="${param.stmPwYnCd }" /> 
			<input type="hidden" name="paramStmTagYnCd" id="paramStmTagYnCd" value="${param.stmTagYnCd }" /> 
			<input type="hidden" name="paramStmCmtYnCd" id="paramStmCmtYnCd" value="${param.stmCmtYnCd }" /> 
			<input type="hidden" name="paramStmFileCnt" id="paramStmFileCnt" value="${param.stmFileCnt }" /> 
			<input type="hidden" name="paramStmFileStrg" id="paramStmFileStrg" value="${param.stmFileStrg }" /> 
			<input type="hidden" name="paramStmOptionCnt" id="paramStmOptionCnt" value="${param.stmOptionCnt }" /> 
			<input type="hidden" name="atchFileId" id="atchFileId" value="" /> 
			<div class="kt-portlet__head-label col-6 row" name="writerDiv" id="writerDiv"></div>
		</div>
		<div class="kt-portlet__body kt-padding-b-10">
			<div class="row">
				
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12" name="leftDiv" id="leftDiv">
					<div name="badTitleDiv" id="badTitleDiv" class="kt-margin-b-20">
						<label class="required"><i class="fa flaticon2-open-text-book kt-margin-r-5"></i><span data-lang-cd="bad1008.label.title">제목</span></label>
						<input type="text" class="form-control" name="badTitle" id="badTitle" autocomplete="off" required />
					</div>
					
					
					<div class="form-group row kt-margin-b-15 kt-hide" name="badFileOption" id="badFileOption">
						<div class="col-4 kt-font-bolder">
							<label class="required"><i class="fa fa-file-upload kt-margin-r-5"></i><span data-lang-cd="bad1008.label.attachments">파일 첨부</span></label>
						</div>
						<div class="col-12 kt-padding-r-10 kt-uppy" style="max-height: 180px;" name="bad1008FileUpload" id="bad1008FileUpload"  required>
							<div class='kt-uppy__dashboard'></div>
							<div class='kt-uppy__progress'></div>
						</div>
					</div>
					
					<div name="badContentDiv" id="badContentDiv" class="kt-margin-b-15">
						<label class="kt-margin-0"><i class="fa flaticon2-edit kt-margin-r-5"></i><span data-lang-cd="bad1008.label.content">내용</span></label>
						<textarea class="kt-hide" name="badContent" id="badContent" autocomplete="off"></textarea>
					</div>
				</div>
				
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12 osl-1400-desktop-padding-0" name="rightDiv" id="rightDiv">
					
					<div class="kt-padding-l-20 form-group row kt-margin-b-10 kt-hide"  name="stmNtcYnCd" id="stmNtcYnCd">
						<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badNtcYnCd" id="badNtcYnCd">
							<span></span>
						</label>
						<span data-lang-cd="bad1008.label.noticeCheck">공지사항 사용</span>
				 	</div>
			 		
				 	<div class="kt-margin-l-35 form-group kt-hide osl-bad_box" name="ntcOption" id="ntcOption">
				 		<div class="input-group kt-input-icon pull-right">
					 		<label class="input-group-addon kt-margin-5 kt-padding-5"><span data-lang-cd="bad1008.label.noticeDate">공지 기간</span></label>
					 		<div class="input-group">
					 			<input type="text" class="form-control small" autocomplete="off" name="badNtcRange" id="badNtcRange">
					 			<div class="input-group-append">
				 					<span class="input-group-text kt-bg-brand">
				 						<i class="la la-calendar-check-o kt-font-light"></i>
				 					</span>
				 				</div>
				 			</div>
				 		</div>
				 		<div class="row kt-padding-t-10 kt-padding-l-15">
					 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badNtcTopYnCd" id="badNtcTopYnCd">
								<span></span>
							</label>
							<span data-lang-cd="bad1008.label.noticeDateIgnore">공지기간 무시</span>
				 		</div>
				 	</div>
				 	
				 	<div class="kt-padding-l-20 form-group row kt-margin-b-10 kt-hide"  name="stmPwYnCd" id="stmPwYnCd">
				 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badPwYnCd" id="badPwYnCd">
							<span></span>
						</label>
						<span data-lang-cd="bad1008.label.secretCheck">비밀글 사용</span>
				 	</div>
				 	
				 	<div class="kt-margin-l-35 kt-margin-b-10  kt-hide osl-bad_box" name="pwOption" id="pwOption">
				 		<div class="input-group kt-margin-b-10">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="bad1008.label.password">PW</span></label>
				 			<input type="password" class="form-control" name="badPw" id="badPw" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexalert="알파벳과 숫자 조합 4-12자 이내" required/> 
				 		</div>
				 		<div class="input-group">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="bad1008.label.passwordCheck">PW 확인</span></label>
				 			<input type="password" class="form-control" name="badPwCheck" id="badPwCheck" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexalert="알파벳과 숫자 조합 4-12자 이내" equalTo="#badPw" required/>
			 			</div>
				 	</div>
				 	
				 	<div class="kt-padding-l-20 form-group row kt-hide"  name="stmCmtYnCd" id="stmCmtYnCd">
				 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badCmtYnCd" id="badCmtYnCd">
							<span></span>
						</label>
						<span data-lang-cd="bad1008.label.commentCheck">댓글 허용</span>
				 	</div>
					
					<div class="form-group row kt-margin-b-10 kt-hide" name="badTagOption" id="badTagOption">
						<div class="col-4 kt-font-bolder kt-padding-l-20">
							<i class="fa fa-hashtag kt-margin-r-5"></i><span data-lang-cd="bad1008.label.tag">태그</span>
						</div>
						<div class="input-group kt-margin-t-10 kt-margin-l-20 kt-margin-r-10">
							<div class="input-group-prepend">
								<span class="input-group-text">#</span>
							</div>
							<input type="text" class="form-control col-5" autocomplete="off" name="tagWriter" id="tagWriter" maxlength="30" />
							<div class="input-group-prepend">
								<span class="input-group-button btn btn-brand" id="tagBtn" name="tagBtn"><span data-lang-cd="bad1008.button.submit">등록</span></span>
							</div>
						</div>
						
						<div class="kt-margin-t-20 kt-padding-l-15" name="tagListDiv" id="tagListDiv">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-brand" id="bad1008InsertSubmit"><i class="fa fa-check-square"></i><span class="osl-resize__display--show" data-lang-cd="bad1008.button.insertSubmit">등록</span></button>
			<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
		</div>
	</div>
</form>

<script>
"use strict";
var OSLBad1008Popup = function () {
	var formId = 'bad1008Info';

	
	var formValidate = $.osl.validate(formId);
	
	
	var formEditList = [];
	
	
	var tag = [];
	
	
	var data ={};
	
	
	var fileUploadObj;
    var documentSetting = function () {
    	
    	
    	$("#bad1008InsertSubmit > span").text($.osl.lang("bad1008.button.insertSubmit"));
    	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
    	
    	
		$("#badTitle").attr("placeholder",$.osl.lang("bad1008.placeholder.badTitle"));
		$("#badContent").attr("placeholder",$.osl.lang("bad1008.placeholder.badContent"));
		$("#badPw").attr("placeholder",$.osl.lang("bad1008.placeholder.password"));
		$("#badPwCheck").attr("placeholder",$.osl.lang("bad1008.placeholder.password"));
		
		
		$("#badPw").attr("regexerrorstr", $.osl.lang("bad1008.regex.password"));
		$("#badPwCheck").attr("regexerrorstr", $.osl.lang("bad1008.regex.password"));
    	
		
		if($("#paramStmOptionCnt").val() == '0'){
			$("#leftDiv").removeClass("col-xl-6");
    		$("#leftDiv").addClass("col-xl-12");
    		$("#rightDiv").addClass("kt-hide");
		}

		
    	var fileType;
    	if($("#stmTypeCd").val()=="03"){
    		fileType = ['image
    var setOption = function(){
		
		
		
		$("#writerDiv").empty();
		var usrData = {
				html: $.osl.user.userInfo.usrNm + " (" + $.osl.user.userInfo.usrId + ")",
				imgSize: "sm",
				class:{
					cardBtn: "osl-width__fit-content"
				}
		};
		$("#writerDiv").append($.osl.user.usrImgSet($.osl.user.userInfo.usrImgId, usrData));
		
		$("#writerDiv>.kt-user-card-v2.btn.osl-width__fit-content").children("div").click(function(){
			$.osl.user.usrInfoPopup(setBad.badUsrId);
		});
		
		
		
    	formEditList.push($.osl.editorSetting("badContent", {formValidate: formValidate, 'minHeight': 180}));
    	
    	var noteEditor = $("#badContent").siblings(".note-editor");
    	var pictureBtn = noteEditor.find(".note-btn-group.btn-group.note-insert").addClass("kt-hide");
		$("#badContent").removeClass("kt-hide");
		
		
		if(!$.osl.isNull($("#paramStmFileCnt").val()) && $("#paramStmFileCnt").val()!= 0){
			$("#badFileOption").removeClass("kt-hide");
		}else{
			$("#badFileOption").addClass("kt-hide");
		}
		
    	if($("#paramStmOptionCnt").val()>0){
			
			if($("#paramStmNtcYnCd").val() == "01"){
				$("#stmNtcYnCd").removeClass("kt-hide");
				$.osl.date.daterangepicker($("#badNtcRange"));
			}else{
				$("#stmNtcYnCd").addClass("kt-hide");
			}
	
	    	
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
			
			
			if($("#paramStmPwYnCd").val()  == "01"){
				$("#stmPwYnCd").removeClass("kt-hide");
			}else{
				$("#stmPwYnCd").addClass("kt-hide");
			}
	
			
	    	$("#badPwYnCd").click(function(){
	    		if($("#badPwYnCd").is(":checked")==true){
	    			
	    			$("#pwOption").removeClass("kt-hide");
	    		}else{
	    			
	    			$("#pwOption").addClass("kt-hide");
	    		}
	    	});
			
			
			if($("#paramStmTagYnCd").val() == "01"){
				$("#badTagOption").removeClass("kt-hide");
				
          		
           	   $("#tagWriter").on("propertychange change keyup paste input", function (e) {
           	        var self = $(this);
      	            
       	            var tagValue = self.val().replace(/#/g,"");
           	        self.val(tagValue);
           	        
           	        
           	        if ( e.keyCode == 13 || e.keyCode == 32) {
           	            
           	            if (tagValue != "") {
           	                
           	                var result = Object.values(tag).filter(function (word) {
           	                    return word == tagValue;
           	                })
           	            
           	                
           	                if (result.length == 0) { 
           	                	var innerHtml = "";
           	                	innerHtml += "<tag title='"+$.osl.escapeHtml(tagValue)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-margin-5 kt-padding-5 osl-display--inline-flex' role='tag' value='"+$.osl.escapeHtml(tagValue)+"'>";
           	                	innerHtml += "<x class='tagify__tag__removeBtn kt-margin-l-10' role='button' aria-label='remove tag'></x>";
           	                	innerHtml += "<div><div class='tagify__tag-text kt-margin-l-5'>#"+$.osl.escapeHtml(tagValue)+"</div></div></tag>";
           	                	
           	                    $("#tagListDiv").append(innerHtml);
           	                    tag.push(tagValue);
           	                 	$("#tagWriter").val("");
           	                } else {
           	                	$.osl.toastr($.osl.lang("bad1008.formCheck.tagMatching"), {"type" : "warning"});
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
           	   
			}else{
				$("#badTagOption").addClass("kt-hide");
			}
			
			
			if($("#paramStmCmtYnCd").val() == "01"){
				$("#stmCmtYnCd").removeClass("kt-hide");
				$("#badCmtDiv").removeClass("kt-hide");
			}else{
				$("#stmCmtYnCd").addClass("kt-hide");
				$("#badCmtDiv").addClass("kt-hide");
			}
    	}
	};

    
    var submitInsertAction = function(){
		
		data.atchFileId = $("#atchFileId").val();
		data.fileSn = 0;
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/bad/bad1000/bad1000/insertBad1002BadInfoAjax.do'/>"}
				, data);
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn=="Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				OSLBad1006Popup.reload();
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
	OSLBad1008Popup.init();
});
</script>