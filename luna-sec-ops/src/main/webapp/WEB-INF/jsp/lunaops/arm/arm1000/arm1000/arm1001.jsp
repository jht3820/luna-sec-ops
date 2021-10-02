<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frArm1001" autocomplete="off">
	<input type="hidden" name="atchFileId" id="atchFileId" value="<c:out value='${param.atchFileId}'/>">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="reSendUsrId" id="reSendUsrId" value="<c:out value='${param.reSendUsrId}'/>">
	<input type="hidden" name="notModal" id="notModal" value="${param.notModal}">
	<div class="kt-portlet kt-margin-b-0">
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label><i class="fa fa-user-friends kt-margin-r-5"></i>
							<span data-lang-cd="arm1001.label.to">받는 사람</span>
							<span class='kt-badge kt-badge--metal kt-badge--inline kt-padding-10 kt-hide' id='memCnt' name='memCnt'>0</span>
						</label>
						<select class="form-control kt-select2 select2-hidden-accessible" id="forUsrSelect" name="forUsrSelect" multiple="" data-select2-id="forUsrSelect" tabindex="-1" aria-hidden="true"></select>
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="arm1001.label.title">제목</span></label>
						<input type="text" class="form-control" id="armTitle" name="armTitle" placeholder="제목" maxlength="80" autocomplete="off" required>
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="arm1001.label.content">내용</span></label>
						<textarea class="kt-hide" name="armContent" id="armContent" autocomplete="off" placeholder="내용" required></textarea>
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group form-group-last">
						<label>
							<i class="fa fa-file-upload kt-margin-r-5"></i>
							<span data-lang-cd="arm1001.label.attachments">파일 첨부</span> 
						</label>
						<div class="kt-uppy osl-max-h-px-260" id="arm1001FileUpload">
							<div class="kt-uppy__dashboard"></div>
							<div class="kt-uppy__progress"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="arm1001InsertSubmit"><i class="fa fa-check-square"></i><span data-lang-cd="arm1001.button.submit">보내기</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>

<script>
"use strict";
var OSLArm1001Popup = function () {
	var formId = 'frArm1001';

	
	var atchFileId;
	
	
	var type;

	
	var reSendUsrId;
	
	
	var fileUploadObj;
	
	
	var formEditList = [];
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var usrList = [];
	
	
	var notModal = $("#notModal").val();
	var documentSetting = function(){
		
		type = $("#type").val();
		atchFileId = $("#atchFileId").val();
		reSendUsrId = $("#reSendUsrId").val();
		
		
    	$("#arm1001InsertSubmit > span").text($.osl.lang("arm1001.button.submit"));
    	
    	
    	$("#armTitle").attr("placeholder", $.osl.lang("arm1001.placeholder.armTitle"));
    	$("#armContent").attr("placeholder", $.osl.lang("arm1001.placeholder.armContent"));
    	
		
    	fileUploadObj = $.osl.file.uploadSet("arm1001FileUpload",{
    		url: '/arm/arm1000/arm1000/insertArm1000AlarmAtchFileInfo.do',
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": atchFileId, "fileSn": 0},
    		maxNumberOfFiles:20,
    		height: 260,
    		
    		
    		onBeforeUpload: function(files){
    			var rtnValue = files;
    			var uploadFiles = {};
    			
    			
				$.osl.file.makeAtchfileId(function(data){
					if(data.errorYn == "Y"){
						$.osl.toastr(data.message);
						rtnValue = [];
					}else{
						atchFileId = data.atchFileIdString;
						$("#atchFileId").val(data.atchFileIdString);
					 	fileUploadObj.setMeta({atchFileId: data.atchFileIdString});
					 
						
	    				$.each(files, function(idx, map){
	    					map.meta.atchFileId = data.atchFileIdString;
	    					
	    					var jsonTmp = {};
							jsonTmp[map.id] = map;
							uploadFiles = $.extend(uploadFiles, jsonTmp);
	    				});
						
   						
   						submitInsertAction();
   					}
				});
			},
			
			onBeforeFileAdded: function(currentFile, files){
				
				
				if(currentFile.source != "database" && currentFile.source != "remove"){
					var newNm = new Date().format("ssms")+"_"+currentFile.name;
					currentFile.name = newNm;
					currentFile.meta.name = newNm;
					currentFile.meta.atchFileId = $("#atchFileId").val();
					
	    			
	    			var fileSn = fileUploadObj.getState().meta.fileSn;
	    			currentFile.meta.fileSn = fileSn;
	    			fileUploadObj.setMeta({fileSn: (fileSn+1)});
				}
			}
		});
		
		
		$('#forUsrSelect').select2({
			placeholder : $.osl.lang("arm1001.placeholder.select2"),
			
			templateResult: optionFormatState,
			
			templateSelection : tagFormatState,
			
	        matcher: matchCustom,
			
			dropdownParent: $("#"+formId),
			
			ftScrollUse: false,
		});
		
		
		$('#forUsrSelect').on('select2:close', function (evt) {
	        var count = $(this).select2('data').length;
	        if(count==0){
				$("#memCnt").text("0");
	        	$("#memCnt").addClass("kt-hide");
	        }
	        else{
	        	$("#memCnt").text(count);
	        	$("#memCnt").removeClass("kt-hide");
	        }
		});

		$("#memCnt").text(0);
		
		
		if(type=="insert"){
	    	selectUsrList();
		}else{
			
			selectUsrList(reSendUsrId);
		}
		
    	
		formEditList.push($.osl.editorSetting("armContent", {formValidate: formValidate,height:190, 'minHeight': 190, disableResizeEditor: false}));
    	
    	$("#armContent").removeClass("kt-hide");
    	
    	
    	$("#arm1001InsertSubmit").click(function(){
			var form = $('#'+ formId);    		
			
			
    		if (!form.valid()) {
    			return false;
    		}
			
			
			addUsrList(false);
			
			if(usrList.length==0){
				$.osl.alert($.osl.lang("arm1001.message.inputToUser"));
				return false;
			}

			$.osl.confirm($.osl.lang("arm1001.message.send"),null,function(result) {
    	        if (result.value) {
    	        	fileUploadObj.upload();
    	        }
    		});
    	});
	};

    
    var optionFormatState = function(state){
    	if (!state.id) {
    	    return state.text;
   	 	}
    	var usrId = state.id;
    	var usrNm = state.element.attributes.getNamedItem("data-usr-nm").value;
    	var usrImgId = state.element.attributes.getNamedItem("data-usr-img-id").value;
    	var usrEmail = state.element.attributes.getNamedItem("data-usr-email").value;

    	var state = $(
    			'<div class="kt-user-card-v2 btn" data-usr-id="'+ usrId +'">' 
				+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
					+'<img src="'+$.osl.user.usrImgUrlVal(usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
				+'</div>'
				+'<div class="kt-user-card-v2__details float-left">'
					+'<span class="kt-user-card-v2__name float-left">'+usrNm+'</span>'
					+'<span class="kt-user-card-v2__email float-left kt-margin-l-10 osl-line-height-rem-1_5">'+usrEmail+'</span>'
				+'</div>'
			+'</div>'
   	    );
    	
    	return state;
    };
    
    
    var tagFormatState = function(state){
    	if (!state.id) {
    	    return state.id;
   	 	}
    	var usrId = state.id;
    	var usrNm = state.element.attributes.getNamedItem("data-usr-nm").value;
    	var usrImgId = state.element.attributes.getNamedItem("data-usr-img-id").value;
    	var usrEmail = state.element.attributes.getNamedItem("data-usr-email").value;

    	var state = $(
    			'<div class="kt-user-card-v2 d-inline-block" data-usr-id="'+ usrId +'">'
					+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle float-left">'
						+'<img src="'+$.osl.user.usrImgUrlVal(usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
					+'</div>'
					+'<div class="kt-user-card-v2__details float-left">'
						+'<span class="kt-user-card-v2__name">'+usrNm+'</span>'
						+'<span class="kt-user-card-v2__email">'+usrEmail+'</span>'
					+'</div>'
				+'</div>'
   	    );
    	
   	    return state;
    };
    
    
    var matchCustom = function(params, data){
    	
         if ($.trim(params.term) === '') {
           return data;
         }
        
         
         if (typeof data.text === 'undefined') {
           return null;
         }
         
         
         var usrEmail = $(data.element).data("usr-email");

         
         if (data.id.indexOf(params.term) > -1) {
           return data;
         }
         
         else if (data.text.indexOf(params.term) > -1) {
           return data;
         }
         
         else if (usrEmail.indexOf(params.term) > -1) {
           return data;
         }

         
         return null;
    }
    
    
	var selectUsrList = function(selectedUsrList){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/arm/arm1000/arm1000/selectArm1000AlarmUsrListAjax.do'/>", "async":"true"});
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				
				$.osl.layerPopupClose();
			}else{
				
				$.each(data.usrAllList, function(idx, value){
					var usrData = {
							html: value.usrNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
					};
					var str = '';
					if(!$.osl.isNull(selectedUsrList)){
						
						$("#memCnt").text(1);
	        			$("#memCnt").removeClass("kt-hide");
	        	
						
						if(value.usrId === selectedUsrList){
							str = '<option selected="selected" value="' + value.usrId + '" data-usr-nm="'+value.usrNm+'" data-usr-img-id="'+value.usrImgId+'" data-usr-email="'+value.email+'">' 
									+ value.usrNm
								+ '</option>';
						}else{
							str = '<option value="' + value.usrId + '" data-usr-nm="'+value.usrNm+'" data-usr-img-id="'+value.usrImgId+'" data-usr-email="'+value.email+'">' 
									+ value.usrNm
								+ '</option>';
						}
					}else{
						str = '<option value="' + value.usrId + '" data-usr-nm="'+value.usrNm+'" data-usr-img-id="'+value.usrImgId+'" data-usr-email="'+value.email+'">' 
									+ value.usrNm
								+ '</option>';
					}
					
					$("#forUsrSelect").append(str);
				});
			}
		});
		
		ajaxObj.send();
	};
	
	
    var addUsrList = function(defaultCheck){

		var optionList = $(".select2-selection__rendered").children("li.select2-selection__choice");
		
		$.each(optionList, function(index, value){
			usrList.push($(value).children("div").data("usr-id"));
		});
		
		if(defaultCheck){
			if(usrList.length == 0){
				usrList.push($.osl.user.userInfo.usrId);
			}
		}
	};
	
	
	var submitInsertAction = function(){
		
   		var fd = $.osl.formDataToJsonArray(formId);

   		fd.append("idList", JSON.stringify(usrList));
   		
       	
       	fd.append("fileHistory",JSON.stringify(fileUploadObj.getFiles()));
       	
      	
		$.each(fileUploadObj.getFiles(), function(idx, map){
			map.meta.atchFileId = $("#atchFileId").val();
			fd.append("file",map);
		});
      	
		
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/arm/arm1000/arm1000/insertArm1000AlarmInfoAjax.do'/>"
   			, "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
			,fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);
   				
   				
				if(!$.osl.isNull(notModal) && notModal){
					
					$.osl.layerPopupClose();
				}else{
					OSLArm1000Popup.reload();
					
	   				$.osl.layerPopupClose();
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
	OSLArm1001Popup.init();
});
</script>

