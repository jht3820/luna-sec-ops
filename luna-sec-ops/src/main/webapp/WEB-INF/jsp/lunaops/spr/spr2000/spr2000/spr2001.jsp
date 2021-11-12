<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frSpr2001" autocomplete="off">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="mmtId" id="mmtId" value="<c:out value='${param.mmtId}'/>">
	<input type="hidden" name="sprId" id="sprId" value="<c:out value='${param.sprId}'/>">
	<input type="hidden" name="paramSprNm" id="paramSprNm" value="<c:out value='${param.sprNm}'/>">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
		<div class="form-group">
			<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2001.label.sprNm">스프린트명</span></label>
			<input type="text" class="form-control" name="sprNm" id="sprNm" autocomplete="off" readonly="readonly" required>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group">
					<label><i class="fa fa-user-friends kt-margin-r-5"></i>
						<span data-lang-cd="spr2001.label.mmtMem">참여 인원</span>
						<span class='kt-badge kt-badge--metal kt-badge--inline kt-padding-10 kt-hide' id='memCnt' name='memCnt'>0</span>
					</label>
					<select class="form-control kt-select2 select2-hidden-accessible" id="mmtMemSelect" name="mmtMemSelect" multiple="" data-select2-id="mmtMemSelect" tabindex="-1" aria-hidden="true"></select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2001.label.mmtNm">회의록 제목</span></label>
					<input type="text" class="form-control" id="mmtNm" name="mmtNm" autocomplete="off" placeholder="제목" maxlength="80" required>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="form-group form-group-last">
					<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="spr2001.label.mmtDesc">회의록 내용</span></label>
					<textarea class="kt-hide" name="mmtDesc" id="mmtDesc" autocomplete="off" required></textarea>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="spr2001SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show" data-lang-cd="spr2001.submit">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>

<script>
"use strict";
var OSLSpr2001Popup = function () {
	var formId = 'frSpr2001';
	
	
	var formEditList = [];
	
	
	var formValidate = $.osl.validate(formId);

	
	var type;

	
	var usrList = [];
	
	
    var documentSetting = function () {
    	
    	type = $("#type").val();
    	
    	
		$('#mmtMemSelect').select2({
			placeholder : $.osl.lang("spr2001.placeholder.select2") + "("+$.osl.lang("spr2001.message.select2")+")",
			
			templateResult: optionFormatState,
			
			templateSelection : tagFormatState,
			
	        matcher: matchCustom,
			
			dropdownParent: $("#frSpr2001"),
			
			ftScrollUse: false,
		});

		
		$('#mmtMemSelect').on('select2:close', function (evt) {
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
		
    	
    	$("#spr2001SaveSubmit > span").text($.osl.lang("spr2001.button."+type+"Btn"));
    	
    	
    	$("#mmtNm").attr("placeholder", $.osl.lang("spr2001.placeholder.mmtNm"));

    	
    	if(type == "insert"){
    		
    		$("#sprNm").val($("#paramSprNm").val());

    		$("#memCnt").text(0);
    		
    		
        	selectUsrList();
        	
    		
    		formEditList.push($.osl.editorSetting("mmtDesc", {formValidate: formValidate, 'minHeight': 190, disableResizeEditor: false}));
	    	
	    	$("#mmtDesc").removeClass("kt-hide");
    	
    	}else{
    		
    		
    		selectSprMmtInfo();
    	}
    	
    	
    	$("#spr2001SaveSubmit").click(function(){
			var form = $('#'+ formId);    		
			
			
    		if (!form.valid()) {
    			return false;
    		}
    		
    		$.osl.confirm($.osl.lang("spr2001.saveString."+type+"Str"),null,function(result) {
    	        if (result.value) {
    	        	if(type=="insert"){
    	        		submitInsertAction();
    	        	}else{
    	        		submitUpdateAction();
    	        	}
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
				{"url":"<c:url value='/spr/spr2000/spr2000/selectSpr2001MmtUsrListAjax.do'/>", "async":"true"});
		
		
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
						
						$("#memCnt").text(selectedUsrList.length);
	        			$("#memCnt").removeClass("kt-hide");
	        	
						
						var check = false;
						$.each(selectedUsrList, function(index, item){
							if(item.usrId === value.usrId){
								check = true;
							}
						});
						if(check){
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
					
					$("#mmtMemSelect").append(str);
				});
			}
		});
		
		ajaxObj.send();
	};
	
    
	 var selectSprMmtInfo = function() {
    	var data = {
    			mmtId :  $("#mmtId").val(),
    			sprId :  $("#sprId").val(),
    	};

		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/spr/spr2000/spr2000/selectSpr2000MmtInfoAjax.do'/>", "async":"true"}
				,data);
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				
				$.osl.layerPopupClose();
			}else{
				
		    	$.osl.setDataFormElem(data.mmtInfo,"frSpr2001");
		
				
				var mmtMemList = data.mmtMemList;
				selectUsrList(mmtMemList);
								
	    		
	    		formEditList.push($.osl.editorSetting("mmtDesc", {formValidate: formValidate, 'minHeight': 190, disableResizeEditor: false}));
	    		
		    	$("#mmtDesc").removeClass("kt-hide");
			}
		});
		
		
		ajaxObj.send();
	};
    
	
    var submitInsertAction = function(){
    	var form = $('#'+formId);    		
    	
		
		if (!form.valid()) {
			return;
		}

       	
   		var fd = $.osl.formDataToJsonArray(formId);
       	
       	
		addUsrList(true);
       	fd.append("idList", JSON.stringify(usrList));
       	
       	
       	fd.append("mmtUsrId", $.osl.user.userInfo.usrId);

		
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/spr/spr2000/spr2000/insertSpr2001MmtInfoAjax.do'/>"
   			, "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
			,fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				OSLSpr2000Popup.reload();
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

       	
		addUsrList(true);
       	fd.append("idList", JSON.stringify(usrList));

       	
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/spr/spr2000/spr2000/updateSpr2001MmtInfoAjax.do'/>"
   					, "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
   				,fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				OSLSpr2000Popup.reload();
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

	return {
        
        init: function() {
        	documentSetting();
        },
    };
}();


$.osl.ready(function(){
	OSLSpr2001Popup.init();
});

	
</script>