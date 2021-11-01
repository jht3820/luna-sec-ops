<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm3002">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="row kt-margin-b-10">
				
				<div class="col-xl-6 kt-align-center">
					<div class="kt-avatar kt-avatar--circle">
						<div class="kt-avatar__holder osl-avatar__holder-lg" id="usrImage" title="사용자 이미지"></div>
					</div>
				</div>
				
				<div class="col-xl-6">
					<div class="form-group kt-margin-b-20">
						<label><i class="fa fa-edit kt-margin-r-5"></i>아이디</label>
						<input type="text" class="form-control" label="아이디" placeholder="아이디" id="usrId" name="usrId" readonly="readonly" value="${param.paramUsrId}">
					</div>
					<div class="form-group kt-margin-b-15">
						<label><i class="fa fa-edit kt-margin-r-5"></i>이름</label>
						<input type="text" class="form-control" placeholder="이름" name="usrNm" id="usrNm" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-phone-alt kt-margin-r-5"></i>연락처</label>
						<input type="text" class="form-control" placeholder="연락처" name="telno" id="telno" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-envelope kt-margin-r-5"></i>이메일</label>
						<input type="email" class="form-control" label="이메일" placeholder="이메일" id="email" name="email" readonly="readonly">
					</div>	
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-id-badge kt-margin-r-5"></i>직급</label>
						<input type="text" class="form-control" placeholder="직급" id="usrPositionNm" name="usrPositionNm" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-id-badge kt-margin-r-5"></i>직책</label>
						<input type="text" class="form-control" placeholder="직책" id="usrDutyNm" name="usrDutyNm" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label><i class="fa fa-id-card kt-margin-r-5"></i>부서</label>
				<input type="text" class="form-control" label="부서" placeholder="부서" id="deptName" name="deptName" readonly="readonly">
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-portrait kt-margin-r-5"></i>사용유무</label>
						<input type="text" class="form-control" placeholder="사용유무" id="useNm" name="useNm" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-lock kt-margin-r-5"></i>차단유무</label>
						<input type="text" class="form-control" placeholder="차단유무" id="blockNm" name="blockNm" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="form-group d-none" id="bloclLogInfo">
				<label><i class="fa fa-pencil-alt kt-margin-r-5"></i>차단로그</label>
				<div class="form-control h-100 osl-min-height--12rem" id="blkLog"></div>
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i>비고</label>
				<div class="form-control h-100 osl-min-height--12rem" id="etc"></div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close"
	>Close</span></button>
</div>

<script>

"use strict";
var OSLStm3002Popup = function () {
	var formId = 'frStm3002';
	
    
    var documentSetting = function () {
    	
		selectUsrInfo();
    };

    
	var selectUsrInfo = function() {
    	
    	var paramUsrId = $("#usrId").val();
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm3000/stm3000/selectStm3000UsrInfoAjax.do'/>", "async": false}
				,{"usrId": paramUsrId});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
		    	$.osl.setDataFormElem(data.usrInfoMap,"frStm3002", ["usrNm", "email", "telno", "deptName", "usrPositionNm", "usrDutyNm", "useNm", "blockNm"]);
				
				var etc = data.usrInfoMap.etc;
				var block = data.usrInfoMap.block;
				var blkLog = data.usrInfoMap.blkLog;
				
				
				$("#usrImage").css("background-image", "url("+$.osl.user.usrImgUrlVal(data.usrInfoMap.usrImgId)+")");
				
				
				if(block == "02" && !$.osl.isNull(blkLog)){
					$("#bloclLogInfo").removeClass("d-none");
					block =  $.osl.escapeHtml(block);
					$("#blkLog").html(blkLog.replace(/\n/g, '<br/>'));
				}
					
				if(!$.osl.isNull(etc)){
					
					etc =  $.osl.escapeHtml(etc);
					$("#etc").html(etc.replace(/\n/g, '<br/>'));
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
	OSLStm3002Popup.init();
});
	
</script>