<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="armId" id="armId" value="<c:out value='${param.armId}'/>">
<input type="hidden" name="notModal" id="notModal" value="<c:out value='${param.notModal}'/>">
<form class="kt-form" id="frArm1002" autocomplete="off">
	<div class="kt-portlet kt-margin-b-0">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<div id="sendUsrId" name="sendUsrId"></div>
			</div>
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-group">
					<div id="sendDtm" name="sendDtm"></div>
				</div>
			</div>
		</div>
		<div class="kt-portlet__body">
			<div class="form-group kt-margin-b-10">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text" data-lang-cd="arm1002.label.title">제목</span> 
					</div>
					<input type="text" class="form-control" id="armTitle" name="armTitle" autocomplete="off" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<textarea class="kt-hide" name="armContent" id="armContent"></textarea>
			</div>
			<div class="form-group-last " id="fileDiv" name="fileDiv">
				<label>
					<i class="fa fa-file-upload kt-margin-r-5"></i>
					<span data-lang-cd="arm1002.label.attachments">첨부 파일</span> 
				</label>
				<div class="kt-uppy osl-max-h-px-260 fileReadonly" name="fileListDiv" id="fileListDiv">
					<div class="kt-uppy__dashboard"></div>
					<div class="kt-uppy__progress"></div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="arm1002InsertSubmit"><i class="fa fa-check-square"></i><span class="osl-resize__display--show" data-lang-cd="arm1002.button.reSend">답장</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>

<script>
"use strict";
var OSLArm1002Popup = function () {
	var formId = 'frArm1002';

	
	var atchFileId;

	
	var reSendUsrId;
	
	
	var armId;
	
	
	var fileUploadObj;
	
	
	var formEditList = [];
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var notModal = $("#notModal").val();
	
	
	var usrList = [];
	
	var documentSetting = function(){
		
		
    	$("#arm1002InsertSubmit > span").text($.osl.lang("arm1002.button.reSend"));
		
		armId = $("#armId").val();
		
		
		selectAlarmInfo();
    	
    	
    	$("#arm1002InsertSubmit").click(function(){
    		var data = {
					type : "reInsert",
					reSendUsrId : reSendUsrId,
				};
			var options = {
					idKey: "reInsert_"+armId,
					modalTitle: $.osl.lang("arm1002.title"),
					closeConfirm: false,
					autoHeight:false,
				};
			
			$.osl.layerPopupOpen('/arm/arm1000/arm1000/insertArm1001View.do',data,options);
    	});
	};
	
	
	var selectAlarmInfo = function(){
		var data = {
				armId : armId
		};
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/arm/arm1000/arm1000/selectArm1000AlarmInfoAjax.do'/>", "async":"true"}
				,data);
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				
				$.osl.layerPopupClose();
			}else{
				var value = data.arm1000Info;
				
				
				atchFileId = value.atchFileId;
				
				reSendUsrId = value.sendUsrId;
				
				
				
				var str = '';
				str += '<div class="kt-user-card-v2 d-inline-block sendUsrInfo" data-usr-id="'+ value.sendUsrId +'">'
							+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle float-left">'
							+'<img src="'+$.osl.user.usrImgUrlVal(value.sendUsrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
						+'</div>'
						+'<div class="kt-user-card-v2__details float-left">'
							+'<span class="kt-user-card-v2__name">'+value.sendUsrNm+'</span>'
							+'<span class="kt-user-card-v2__email">'+value.sendUsrEmail+'</span>'
						+'</div>'
					+'</div>';
				$("#sendUsrId").html(str);
				
				
				$(".sendUsrInfo").click(function(){
					$.osl.user.usrInfoPopup(reSendUsrId);
				});
								
				
				$("#sendDtm").text(value.sendDtm);
				
				
				$("#armTitle").val($.osl.escapeHtml(value.armTitle));
				
				
				$("#armContent").val(value.armContent);
				
		    	
				formEditList.push($.osl.editorSetting("armContent", {
					formValidate: formValidate,
					toolbar: false,
					disableResizeEditor: false,
					disableDragAndDrop: true,
					disabledEditor: true,
					'minHeight': 190,
					}
				));
		    	
		    	$("#armContent").removeClass("kt-hide");
		    	
				
		    	fileUploadObj = $.osl.file.uploadSet("fileListDiv",{
		    		maxFileSize: "${requestScope.fileSumMaxSize}",
		    		meta: {"atchFileId": atchFileId, "fileSn": 0},
		    		height: 260,
		    		isDraggingOver: false,
		    		fileDownload: true,
		    		fileReadonly: true
		    	});
		    	fileUploadObj.reset();
		    	
		    	
		    	fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
		    	
		    	
		    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
		    	
		    	
		    	if(data.fileList.length==0){
		    		$("#fileDiv").addClass("kt-hide");
		    	}
		    	
		    	
		    	
		    	if(value.checkCd==='02'){
			    	checkingAlarm();
			    	
			    	
			    	mssArmLoad();
		    	}
			}
		});
		
		
		ajaxObj.send();
	};
	
	
	var checkingAlarm = function(){

		var dataList = [];
		
		var dataObject = {};
		dataObject.armId = armId;
		
		dataList.push(dataObject);
		
		var data = {
				dataList : JSON.stringify(dataList)
		};
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/arm/arm1000/arm1000/updateArm1000AlarmInfoAjax.do'/>", "async":"true"}
				,data);
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				
				$.osl.layerPopupClose();
			}else{
				
		    	mssArmLoad();
				
				
				if(!$.osl.isNull(notModal) && notModal){
					
					$.osl.layerPopupClose();
				}else{
					
					OSLArm1000Popup.reload();
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
	OSLArm1002Popup.init();
});
</script>

