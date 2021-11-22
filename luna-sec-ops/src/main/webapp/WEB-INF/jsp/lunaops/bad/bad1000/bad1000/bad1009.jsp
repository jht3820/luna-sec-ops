<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form class="kt-form" id="bad1009Info">
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<input type="hidden" id="stmDsTypeCd" name="stmDsTypeCd" value='${param.stmDsTypeCd}'/>
			<input type="hidden" id="stmRootYn" name="stmRootYn" value='${param.stmRootYn}'/>
			<input type="hidden" name="paramRow" id="paramRow" value='${param.paramRow }' />
			<div class="kt-portlet__head-label col-6 row" name="writerDiv" id="writerDiv"></div>
		</div>
		<div class="kt-portlet__body kt-padding-b-10">
			<div class="row">
				
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12" name="leftDiv" id="leftDiv">
					<div name="badTitleDiv" id="badTitleDiv" class="kt-margin-b-20">
						<label class="required"><i class="fa flaticon2-open-text-book kt-margin-r-5"></i><span data-lang-cd="bad1009.label.title">제목</span></label>
						<input type="text" class="form-control" name="badTitle" id="badTitle" autocomplete="off" required />
					</div>
					
					
					<div class="form-group row kt-margin-b-15 kt-hide" name="badFileOption" id="badFileOption">
						<div class="col-4 kt-font-bolder">
							<label class="required"><i class="fa fa-file-upload kt-margin-r-5"></i>파일 첨부</label>
							<button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="fileRemoveResetBtn"><span data-lang-cd="bad1009.button.deleteResetBtn">삭제 초기화</span></button>
						</div>
						<div class="col-12 kt-padding-r-10 kt-uppy" style="max-height: 180px;" name="bad1009FileUpload" id="bad1009FileUpload"  required>
							<div class='kt-uppy__dashboard'></div>
							<div class='kt-uppy__progress'></div>
						</div>
					</div>
					
					<div name="badContentDiv" id="badContentDiv" class="kt-margin-b-15">
						<label class="kt-margin-0"><i class="fa flaticon2-edit kt-margin-r-5"></i><span data-lang-cd="bad1009.label.content">내용</span></label>
						<textarea class="kt-hide" name="badContent" id="badContent" autocomplete="off"></textarea>
					</div>
				</div>
				
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12 osl-1400-desktop-padding-0" name="rightDiv" id="rightDiv">
					
					<div class="kt-padding-l-20 form-group row kt-margin-b-10 kt-hide"  name="stmNtcYnCd" id="stmNtcYnCd">
						<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badNtcYnCd" id="badNtcYnCd">
							<span></span>
						</label>
						<span data-lang-cd="bad1009.label.noticeCheck">공지사항 사용</span>
				 	</div>
			 		
				 	<div class="kt-margin-l-35 form-group kt-hide osl-bad_box" name="ntcOption" id="ntcOption">
				 		<div class="input-group kt-input-icon pull-right">
					 		<label class="input-group-addon kt-margin-5 kt-padding-5"><span data-lang-cd="bad1009.label.noticeDate">공지 기간</span></label>
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
							<span data-lang-cd="bad1009.label.noticeDateIgnore">공지기간 무시</span>
				 		</div>
				 	</div>
				 	
				 	<div class="kt-padding-l-20 form-group row kt-margin-b-10 kt-hide"  name="stmPwYnCd" id="stmPwYnCd">
				 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badPwYnCd" id="badPwYnCd">
							<span></span>
						</label>
						<span data-lang-cd="bad1009.label.secretCheck">비밀글 사용</span>
				 	</div>
				 	
				 	<div class="kt-margin-l-35 kt-margin-b-10  kt-hide osl-bad_box" name="pwOption" id="pwOption">
				 		<div class="input-group kt-margin-b-10">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="bad1009.label.password">PW</span></label>
				 			<input type="password" class="form-control" name="badPw" id="badPw" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexalert="알파벳과 숫자 조합 4-12자 이내" required/> 
				 		</div>
				 		<div class="input-group">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="bad1009.label.passwordCheck">PW 확인</span></label>
				 			<input type="password" class="form-control" name="badPwCheck" id="badPwCheck" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexalert="알파벳과 숫자 조합 4-12자 이내" equalTo="#badPw" required/>
			 			</div>
				 	</div>
				 	
				 	<div class="kt-padding-l-20 form-group row kt-hide"  name="stmCmtYnCd" id="stmCmtYnCd">
				 		<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" name="badCmtYnCd" id="badCmtYnCd">
							<span></span>
						</label>
						<span data-lang-cd="bad1009.label.commentCheck">댓글 허용</span>
				 	</div>
					
					<div class="form-group row kt-margin-b-10 kt-hide" name="badTagOption" id="badTagOption">
						<div class="col-4 kt-font-bolder kt-padding-l-20">
							<i class="fa fa-hashtag kt-margin-r-5"></i><span data-lang-cd="bad1009.label.tag">태그</span>
						</div>
						<div class="input-group kt-margin-t-10 kt-margin-l-20 kt-margin-r-10">
							<div class="input-group-prepend">
								<span class="input-group-text">#</span>
							</div>
							<input type="text" class="form-control col-5" autocomplete="off" name="tagWriter" id="tagWriter" maxlength="30" />
							<div class="input-group-prepend">
								<span class="input-group-button btn btn-brand" id="tagBtn" name="tagBtn"><span data-lang-cd="bad1009.button.submit">등록</span></span>
							</div>
						</div>
						
						<div class="kt-margin-t-20 kt-padding-l-15" name="tagListDiv" id="tagListDiv">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-brand" id="bad1009UpdateSubmit"><i class="fa fa-check-square"></i><span class="osl-resize__display--show" data-lang-cd="bad1009.button.updateSubmit">수정 완료</span></button>
			<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
		</div>
	</div>
</form>

<script>
"use strict";
var OSLBad1009Popup = function () {
	var formId = 'bad1009Info';
	
	
	var formEditList = [];
	
	
	var formValidate = $.osl.validate(formId);

	
	var tag = [];
	
	
	var paramRowData;
	
	
	var fileUploadObj;
	
	
	var data ={};
	
	
	var uploadRemoveFiles = [];

	
	var currentBadFileCnt;
	var currentBadFileStrg;
	
	
	var maxCnt;
	var maxStrg;
	
	
	var pw;
	
    var documentSetting = function () {
    	
    	paramRowData = JSON.parse($("#paramRow").val());

    	
    	$("#paramRow").val('');
    	
    	
    	$("#bad1009UpdateSubmit > span").text($.osl.lang("bad1009.button.updateSubmit"));
    	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
    	
    	
		$("#badTitle").attr("placeholder",$.osl.lang("bad1009.placeholder.badTitle"));
		$("#badContent").attr("placeholder",$.osl.lang("bad1009.placeholder.badContent"));
		$("#badPw").attr("placeholder",$.osl.lang("bad1009.placeholder.password"));
		$("#badPwCheck").attr("placeholder",$.osl.lang("bad1009.placeholder.password"));
		
		
		$("#badPw").attr("regexerrorstr", $.osl.lang("bad1009.regex.password"));
		$("#badPwCheck").attr("regexerrorstr", $.osl.lang("bad1009.regex.password"));
		
		
		if($("#paramStmOptionCnt").val() == '0'){
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
		}
		
		
    	var fileType;
    	if($("#stmTypeCd").val()=="03"){
    		fileType = ['image
    var setBadInfo = function(){
    	
		var data={
				"menuId" : paramRowData.menuId,
    			"badId" : paramRowData.badId,
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
				var info = data.badInfo;
				var setBad = data.bad1001Info;
				var tagList = data.bad1001Tag;
				var fileList = data.bad1001FileList;
				var fileCnt = data.bad1001FileListCnt;
				var setUsr = data.setUsr;
				
				
				
				
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
		    	
		    	var noteEditor = $("#badContent").siblings(".note-editor");
		    	var pictureBtn = noteEditor.find(".note-btn-group.btn-group.note-insert").addClass("kt-hide");
				$("#badContent").removeClass("kt-hide");
				
				if(paramRowData.stmOptionCnt>0){
					
					if(paramRowData.stmNtcYnCd == "01"){
						$("#stmNtcYnCd").removeClass("kt-hide");
						$.osl.date.daterangepicker("#badNtcRange");
						
						
						if(setBad.badNtcCheck == "01"){
							
							$("#badNtcYnCd").attr("checked", true);
							
							$("#ntcOption").removeClass("kt-hide");
							
							if(paramRowData.badNtcType=='03'){
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

					
					if(paramRowData.stmPwYnCd == "01"){
						$("#stmPwYnCd").removeClass("kt-hide");
						$("#pwOption").removeClass("kt-hide");
						
						
						if(setBad.badPw != null && setBad.badPw != "" ){
							$("#badPwYnCd").attr("checked", true);
							
							$("#pwOption").removeClass("kt-hide");
							pw="Y";
							
							$("#badPw").val("");
							$("#badPw").attr("placeholder",$.osl.lang("bad1009.placeholder.nullPassword"));
							$("#badPwCheck").attr("placeholder",$.osl.lang("bad1009.placeholder.nullPassword"));
						}else{
							$("#badPwYnCd").attr("checked", false);
							
							$("#pwOption").addClass("kt-hide");
						}
					}
					
					
					if(paramRowData.stmCmtYnCd == "01"){
						$("#stmCmtYnCd").removeClass("kt-hide");
						
						if(setBad.badCmtYn == "01"){
							$("#badCmtYnCd").attr("checked", true);
						}else{
							$("#badCmtYnCd").attr("checked", false);
						}
					}

					
					if(!$.osl.isNull(paramRowData.stmFileCnt) && paramRowData.stmFileCnt != 0){
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
					
					
					if(paramRowData.stmTagYnCd == "01"){
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
 	
	
    
    var selectCmtList = function(){
    	
		var data={
    			"menuId" : $("#menuId").val(),
    			"badId" : $("#badId").val(),
    	}
    	
    	
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/bad/bad1000/bad1100/selectBad1100CmtListAjax.do'/>"}
				, data);
    	
    	
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var cmtList = data.cmtList;
				
				
				if(cmtList != null && cmtList != ""){
					$("#badCmtDiv").removeClass("kt-hide");
					$("#badCmtList").removeClass("kt-hide");
					$("#badCmtList").empty();
					$.each(cmtList, function(idx, value){
						var innerHtml = "<div class='input-group'>";
						innerHtml += "<div class='kt-padding-5' usrid='"+value.badCmtUsrId+"'>"+$.osl.user.usrImgSet(value.badCmtUsrImgId, '')+"</div>";
						innerHtml += "<div class='col-8 kt-padding-0 kt-padding-t-5' >"+$.osl.escapeHtml(value.badCmtContent)+"</div>";
						innerHtml += "<div class='col-2 kt-padding-0 kt-padding-t-5 kt-align-right' >"+value.badCmtDtm+"</div>";
						innerHtml += "</div>";
						$("#badCmtList").append(innerHtml);
					});
				}else{
					
					var innerHtml = "<div class='kt-align-center'>댓글이 없습니다.</div>";
					$("#badCmtList").append(innerHtml);
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
		
		
       	var uploadFileList = [];
       	$.each(fileUploadObj.getFiles(), function(idx, map){
       		if(map.source == "database"){
       			return true;
       		}
       		uploadFileList.push(map);
       	});
       	uploadFileList = uploadFileList.concat(uploadRemoveFiles);

       	
       	data.fileHistory = JSON.stringify(uploadFileList);
       	
		
		data.atchFileId = paramRowData.atchFileId;
		data.fileSn = 0;
		
		
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
						paramRow : JSON.stringify(paramRowData),
						badHitYn : "ok", 
					};
				var options = {
						idKey: "bad1001_"+ paramRowData.badId,
						modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+paramRowData.badNum,
						closeConfirm: false,
						autoHeight: false,
						modalSize: "xl",
					};
   				
   				$.osl.layerPopupClose();
				
   				$.osl.layerPopupOpen('/bad/bad1000/bad1000/selectBad1007View.do',data,options);
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
	OSLBad1009Popup.init();
});
</script>