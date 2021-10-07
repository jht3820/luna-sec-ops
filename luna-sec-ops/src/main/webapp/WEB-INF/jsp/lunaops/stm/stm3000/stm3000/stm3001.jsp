<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frStm3001">
	<input type="hidden" name="type" id="type" value="${requestScope.type}">
	<input type="hidden" name="ldapUse" id="ldapUse" value="${requestScope.ldapUse}">
	<input type="hidden" name="deptId" id="deptId">
	<input type="hidden" name="orgDeptNm" id="orgDeptNm">
	<input type="hidden" name="orgEmail" id="orgEmail" > 
	<input type="hidden" name="orgBlock" id="orgBlock" > 
	<input type="hidden" name="pwFailCnt" id="pwFailCnt" >
	<input type="hidden" name="loginExprYn" id="loginExprYn" > 
	<input type="hidden" name="usrImgId" id="usrImgId">
	<input type="hidden" name="loginType" id="loginType" value="${requestScope.loginType}">
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="form-group kt-margin-b-20 d-none" id="blockGuideMsg">
				<div class="alert alert-solid-danger alert-bold fade show kt-margin-t-5" role="alert">
					<div class="alert-icon"><i class="fa fa-exclamation-triangle"></i></div>
					<div class="alert-text">3개월 이상 미접속한 사용자입니다. 차단유무를 [정상]으로 수정 시 로그인 가능합니다.</div>
				</div>
			</div>
			<div class="row kt-margin-b-10">
				
				<div class="col-xl-6 kt-align-center">
					<div class="form-group kt-margin-b-5">
						<div class="kt-avatar kt-avatar--circle" id="usrImg_avatar">
							<div class="kt-avatar__holder osl-avatar__holder-lg" id="usrImage" title="사용자 이미지"></div>
							<label class="kt-avatar__upload" data-toggle="kt-tooltip" title="이미지 찾기">
								<i class="fa fa-pen"></i>
								<input type='file' name="usrImgFile" id="usrImgFile"/>
							</label>
							<span class="kt-avatar__cancel" data-toggle="kt-tooltip" title="이미지 삭제">
								<i class="fa fa-times"></i>
							</span>
						</div>
					</div>
					<div class="form-group kt-margin-b-0">
						<button type="button" class="btn btn-sm btn-danger kt-margin-l-10 d-none" id="btn_imageReset" title="기존 이미지로 되돌리기">되돌리기</button>
					</div>
				</div>
				
				<div class="col-xl-6">
					<div class="form-group kt-margin-b-20">
						<c:choose>
							<c:when test="${requestScope.type == 'insert'}">
								<c:choose>
									<c:when test="${requestScope.loginType == 'usrId'}">
										<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>아이디</label>
										<div class="input-group">
											<input type="text" class="form-control" label="아이디" placeholder="아이디" autocomplete="off" id="usrId" name="usrId" minlength="5" maxlength="20" regexstr="^[a-z0-9_-]{5,20}$" regexalert="영문 소문자, 숫자, _-" required>
											<div class="input-group-append">
												<button class="btn btn-outline-brand" type="button" id="btn_idChk">중복확인</button>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<input type="hidden" name="usrId" id="usrId">
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<label><i class="fa fa-edit kt-margin-r-5"></i>아이디</label>
								<input type="text" class="form-control" label="아이디" placeholder="아이디" id="usrId" name="usrId" readonly="readonly" value="${param.paramUsrId}">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-group kt-margin-b-15">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>이름</label>
						<input type="text" class="form-control" placeholder="이름" name="usrNm" id="usrNm" minlength="2" maxlength="100" regexstr="^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣_-]*$" regexalert="한글,영문,숫자,특수문자( _ -)만 입력가능" required>
					</div>
				</div>
			</div>
			<c:if test="${requestScope.ldapUse == 'N'}">
				
				<c:choose>
					<c:when test="${requestScope.type == 'insert'}">
						<div class="row">
							<div class="col-xl-6">
								<div class="form-group">
									<label class="required"><i class="fa fa-key kt-margin-r-5"></i>비밀번호</label>
									<input type="password" class="form-control" name="usrPw" id="usrPw" autocomplete="new-password" placeholder="비밀번호" minlength="5" maxlength="50" regexstr="^(?=.{5,})(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\/?@\#!$%&]).*$" regexalert="영문 ,숫자,특수문자(!@#$%&*?) 필수 포함" required>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="form-group">
									<label class="required"><i class="fa fa-key kt-margin-r-5"></i>비밀번호 확인</label>
									<input type="password" class="form-control" name="reUsrPw" id="reUsrPw" autocomplete="new-password" placeholder="비밀번호 확인" minlength="5" maxlength="50" regexstr="^(?=.{5,})(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\/?@\#!$%&]).*$" regexalert="영문 ,숫자,특수문자(!@#$%&*?) 필수 포함" equalTo="#usrPw" required>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="row">
							<div class="col-xl-6">
								<div class="form-group">
									<label class="required"><i class="fa fa-key kt-margin-r-5"></i>비밀번호</label>
									<div class="input-group">
										<input type="password" class="form-control" label="비밀번호" id="usrPw" name="usrPw" placeholder="공백인 경우 기존 비밀번호가 사용됩니다." minlength="5" maxlength="50" regexstr="^(?=.{5,})(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\/?@\#!$%&]).*$" regexalert="영문 ,숫자,특수문자(!@#$%&*?) 필수 포함">
										<div class="input-group-append">
											<button class="btn btn-outline-brand" type="button" id="btn_initPw">초기화</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="form-group">
									<label><i class="fa fa-key kt-margin-r-5"></i>비밀번호 확인</label>
									<input type="password" class="form-control" name="reUsrPw" id="reUsrPw" placeholder="공백인 경우 기존 비밀번호가 사용됩니다." minlength="5" maxlength="50" regexstr="^(?=.{5,})(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\/?@\#!$%&]).*$" regexalert="영문 ,숫자,특수문자(!@#$%&*?) 필수 포함" equalTo="#usrPw">
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:if>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-phone-alt kt-margin-r-5"></i>연락처</label>
						<input type="text" class="form-control" placeholder="연락처" autocomplete="off" name="telno" id="telno" minlength="3" maxlength="11" regexstr="^[0-9]*$" regexalert="숫자만 입력가능" required>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label class="required"><i class="fa fa-envelope kt-margin-r-5"></i>이메일</label>
						<div class="input-group">
							<input type="email" class="form-control" label="이메일" autocomplete="off" placeholder="이메일" id="email" name="email" maxlength="35" required>
							<div class="input-group-append">
								<button class="btn btn-outline-brand" type="button" id="btn_emailChk">중복확인</button>
							</div>
						</div>
					</div>	
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label for="exampleSelect1"><i class="fa fa-id-badge kt-margin-r-5"></i>직급</label>
						<select class="form-control kt-select2" id="usrPositionCd" name="usrPositionCd">
						</select>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label for="exampleSelect1"><i class="fa fa-id-badge kt-margin-r-5"></i>직책</label>
						<select class="form-control kt-select2" id="usrDutyCd" name="usrDutyCd">
						</select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="required"><i class="fa fa-id-card kt-margin-r-5"></i>부서</label>
				<div class="input-group">
					<input type="text" class="form-control" label="부서" placeholder="부서 검색 시 검색결과가 1건일 경우 자동세팅 됩니다." id="deptName" name="deptName" required>
					<div class="input-group-append">
						<button class="btn btn-outline-brand" type="button" id="btn_searchDept">부서검색</button>
					</div>
				</div>
			</div>
			<c:if test="${requestScope.type == 'update'}">
				
				<div class="row">
					<div class="col-xl-6">
						<div class="form-group">
							<label class="required" for="exampleSelect1"><i class="fa fa-portrait kt-margin-r-5"></i>사용유무</label>
							<select class="form-control kt-select2" data-osl-value="" id="useCd" name="useCd">
							</select>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="form-group">
							<label class="required" for="exampleSelect1"><i class="fa fa-lock kt-margin-r-5"></i>차단유무</label>
							<select class="form-control kt-select2" data-osl-value="" id="block" name="block">
							</select>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${requestScope.type == 'update'}">
				<div class="form-group d-none" id="bloclLogInfo">
					<label><i class="fa fa-pencil-alt kt-margin-r-5"></i>차단로그</label>
					<textarea class="form-control osl-min-h-px--130" name="blkLog" id="blkLog" maxlength="2000"></textarea>
				</div>
			</c:if>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i>비고</label>
				<textarea class="form-control osl-min-h-px--130" name="etc" id="etc" maxlength="2000"></textarea>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm3001SaveSubmit">완료</button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">Close</button>
</div>
<script>


"use strict";
var OSLStm3001Popup = function () {
	var formId = 'frStm3001';
	var type = $("#type").val();
	
	
	new KTAvatar("usrImg_avatar");
	
	
	var formValidate = $.osl.validate(formId);
	
	var isIdChk = false; 
	var isEmailChk = false; 
	var beforeId; 
	var beforeEmail; 
	
	
	var pageTypeData = {
			"insert":{
				"saveString": "신규 사용자를 등록하시겠습니까?",
				"saveBtnString": "작성 완료"
			},
			"update":{
				"saveString": "사용자 정보를 수정하시겠습니까?",
				"saveBtnString": "수정 완료"
			},
			
			"common":{
				"emptyIdString" : "아이디를 입력해주세요.",
				"emptyEmailString" : "이메일을 입력해주세요.",
				"currentEmailString" : "현재 사용자의 이메일입니다.",
				"initPwString":"비밀번호 초기화 진행 시 현재 입력중인 정보가 저장되지 않습니다. 계속 진행하시겠습니까?",
				"initAfterString": "초기화 후 비밀번호는 사용자 아이디이며, 로그인하여 비밀번호를 재설정해야 합니다.",
				"notLoginString": "님은 3개월 이상 미접속으로 차단되었습니다.",
				"blockChangeString" : "차단유무를 [정상]으로 변경시 로그인 할 수 있습니다.",
				"idDuplChkString" : "아이디 중복체크를 해주세요.",
				"newIdDuplChkString": "새로 입력한 아이디를 중복체크 해주세요.",
				"emailDuplChkString" : "이메일 중복체크를 해주세요.",
				"newEmailDuplChkString": "새로 입력한 이메일을 중복체크 해주세요.",
				"withinYearPwString": "1년이내 사용한 비밀번호는 사용할 수 없습니다.",
				"emptyDeptInfo" : "부서검색 버튼을 클릭하여 부서를 선택해주세요."
			}
	};
	
    
    var documentSetting = function () {
    	
    	
    	$("#stm3001SaveSubmit").text(pageTypeData[type]["saveBtnString"]);
    	
    	
		var commonCodeArr = [
			{mstCd: "ADM00007", useYn: "Y",targetObj: "#usrPositionCd", comboType:"S"}, 
			{mstCd: "ADM00008", useYn: "Y",targetObj: "#usrDutyCd", comboType:"S"}, 	
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"}, 	
			{mstCd: "ADM00005", useYn: "Y",targetObj: "#block", comboType:"OS"} 	
		];

  		
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
  		
		
		var defaultImg = $.osl.user.usrImgUrlVal(null);
		$("#usrImage").attr("data-default-img", defaultImg);
  		
		
    	autosize($("#etc"));
    	autosize($("#blkLog"));
    	
		
    	if(type == "update"){
    		
    		selectUsrInfo();
    	
    	}else{
    		
    		$("#usrImage").css("background-image", "url("+defaultImg+")");	
    	}
    	
    	
    	$(".kt-avatar .kt-avatar__cancel").click(function(){
    		if(type == "update"){
	    		
	    		$("#btn_imageReset").removeClass("d-none");
    		}
    	});
    	
    	
		$('#usrImgFile').change(function() {
			
			var files = $("#usrImgFile")[0].files;
			if(type == "update" && !$.osl.isNull(files)){
				
	    		$("#btn_imageReset").removeClass("d-none");
			}		
		});
    	
    	
    	$("#btn_imageReset").click(function(){
    		
    		var beforeImg = $("#usrImage").data("before-image");
    		
    		
    		if(!$.osl.isNull(beforeImg)){
	    		$("#usrImage").css("background-image", "url("+beforeImg+")"); 
	    		$("#usrImage").attr("data-img-delete-yn", "N"); 
	    		$("#btn_imageReset").addClass("d-none"); 
	    		$("#usrImg_avatar").addClass("kt-avatar--changed"); 
	    		
	    		
				var agent = navigator.userAgent.toLowerCase();
				if (agent.indexOf("chrome") != -1 || agent.indexOf("safari") != -1 || agent.indexOf("firefox") != -1) {
					$("#usrImgFile").val("");
				}else{
					$("#usrImgFile").replaceWith($("#excelFile").clone(true));
				} 
    		}
    	});
    	
    	
    	$("#btn_idChk").click(function(){
    		
    		
    		if($("#usrId").hasClass("is-invalid")){
    			return;
    		}
    		
    		var inUsrId = $("#usrId").val();
    		if($.osl.isNull(inUsrId)){
    			$.osl.alert(pageTypeData["common"]["emptyIdString"]);
    			return;
    		}
    		
    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm3000/stm3000/selectCmm2000IdCheck.do'/>", 
    			"loadingShow": false}, {"usrId":inUsrId});
    		
    		ajaxObj.setFnSuccess(function(data){
    			
    			
    			if(data.errorYn == "Y"){
    				$.osl.alert(data.message,{type: 'error'});
    				
					$.osl.layerPopupClose();
    			
    			}else if(data.idChkYn == "Y"){
    				$.osl.alert(data.message,{type: 'warning'});
    				isIdChk = false;
    			
    			}else{
    				$.osl.alert(data.message);
    				beforeId = inUsrId;  
    				isIdChk = true;
    			}
    		});
    		
    		
    		ajaxObj.send();
    	});
    		
    	
    	$("#btn_emailChk").click(function(){
    		
    		var inEmail = $("#email").val();
    		var orgEmail = $("#orgEmail").val(); 
    		
    		
    		if($("#email").hasClass("is-invalid")){
    			return;
    		}
    		
    		if($.osl.isNull(inEmail)){
    			$.osl.alert(pageTypeData["common"]["emptyEmailString"]);
    			return;
    		}
    		
    		
    		if(type == "update" && orgEmail == inEmail){
    			$.osl.alert(pageTypeData["common"]["currentEmailString"]);
    			return;
    		}
    		
    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm3000/stm3000/selectStm3000EmailCheck.do'/>", 
    			"loadingShow": false}, {"email":inEmail});
    		
    		ajaxObj.setFnSuccess(function(data){
    			
    			
    			if(data.errorYn == "Y"){
    				$.osl.alert(data.message,{type: 'error'});
    				
					$.osl.layerPopupClose();
    			
    			}else if(data.emailChkYn == "Y"){
    				$.osl.alert(data.message,{type: 'warning'});
    				isEmailChk = false;
    			
    			}else{
    				$.osl.alert(data.message);
    				beforeEmail = inEmail;  
    				isEmailChk = true;
    			}
    		});
    		
    		
    		ajaxObj.send();
    	});
    	
    	
    	
    	$("#btn_initPw").click(function(){
    		$.osl.confirm(pageTypeData["common"]["initPwString"], null, function(result) {
    			if (result.value) {
    				
    				var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm3000/stm3000/updateStm3000AccountInit.do'/>", "loadingShow": false}
    						,{"usrId":$("#usrId").val()});
    				
    				ajaxObj.setFnSuccess(function(data){
    					
    					if(data.errorYn == "Y"){
    						$.osl.alert(data.message,{type: 'error'});
    						$.osl.layerPopupClose();
    					}else{
    						
    						$.osl.alert(data.message, {text:pageTypeData["common"]["initAfterString"]}, function(result){
    							$.osl.layerPopupClose();
					       	});
    					}
    				});
					
    				
    				ajaxObj.send();
    	        }
    		});
    	});
    	
    	
    	
    	$("#deptName").keypress(function(e){
    		if (e.which === 13){
    			$("#btn_searchDept").click();
			}
    	});
    	
    	
    	$("#btn_searchDept").click(function(){
    		
    		var searchDeptNm = $.trim($("#deptName").val());
    		if($.osl.isNull(searchDeptNm)){
    			
    			callCommonDeptPopup();  			
    		}else{
    			if(searchDeptNm.lastIndexOf(">") > 0){
    				
    				searchDeptNm = searchDeptNm.substring(searchDeptNm.lastIndexOf(">")+1);
    			}
	    		
	    		selectDeptInfo(searchDeptNm);
    		}
    	});
    	
    	
    	$("#block").change(function(){ 
    		var blockCd = $(this).val();
			
			if(blockCd == "02"){
				$("#bloclLogInfo").removeClass("d-none");
			}else{
				$("#blkLog").val(""); 
				$("#bloclLogInfo").addClass("d-none");
			}
		});
    	
    	
    	$("#stm3001SaveSubmit").click(function(){
			
    		var form = $('#'+formId);
			var ldapUse = $("#ldapUse").val(); 			
			var inUsrId = $("#usrId").val(); 			
			var inUsrPw = $("#usrPw").val(); 			
			var inEmail = $("#email").val(); 			
			var selBlock = $("#block").val(); 			
			var orgBlock = $("#orgBlock").val(); 		
			var pwFailCnt = $("#pwFailCnt").val(); 		
			var loginExprYn = $("#loginExprYn").val(); 	
			var deptId = $("#deptId").val(); 			
			var deptNm = $("#deptName").val(); 			
			var orgDeptNm = $("#orgDeptNm").val(); 		
			var loginType = $("#loginType").val(); 		
			
			
			if(loginType == "email"){
				
    			var loginType = $("#loginType").val();
    			
    			var idHeader = new Date().format("yyyyMMddHHmmms");
    			var idBody = "";
    			for(var i=0;i<5;i++){
    				idBody += parseInt(Math.random()*10).toString();
    			}
    			var newId = idHeader+idBody;
    			$("#usrId").val(newId);
			}
			
    		
    		if (!form.valid()) {
    			return;
    		}
    		
    		
    		if(type == "insert"){
    			if(loginType != "email"){
		    		
		        	if(!isIdChk){
		        		$.osl.alert(pageTypeData["common"]["idDuplChkString"], {type:"warning"});
		        		return;
		        	
		        	}else if(beforeId != inUsrId){
		        		$.osl.alert(pageTypeData["common"]["newIdDuplChkString"], {type:"warning"});
		        		return;
		        	}
    			}
	    		
	    		
	        	if(!isEmailChk){
	        		$.osl.alert(pageTypeData["common"]["emailDuplChkString"], {type:"warning"});
	        		return;
	        	
	        	}else if(beforeEmail != inEmail){
	        		$.osl.alert(pageTypeData["common"]["newEmailDuplChkString"], {type:"warning"});
	        		return;
	        	}
	    		
	    		
	    		if(ldapUse == "N"){
	    			
	            	if($.osl.user.passwordValidate(inUsrId, inUsrPw)){
	            		return;
	            	}
	    		}
	    		
	    		
	    		if($.osl.isNull(deptId)){
	    			$.osl.alert(pageTypeData["common"]["emptyDeptInfo"], {type:"warning"});
	    			return;
	    		}
	    		
	    		
	    		if(validatCheckDeptNm(orgDeptNm, deptNm)){
	    			return;
	    		}
	    		
	    		
				$.osl.file.makeAtchfileId(function(data){
					if(data.errorYn == "Y"){
   						$.osl.toastr(data.message);
   					}else{
   						$("#usrImgId").val(data.atchFileIdString);
   						
   						submitInsertAction();
   					}
				});
	    		
	    	
    		}else if(type == "update"){
    			
    			var orgEmail = $("#orgEmail").val(); 
   				
   				if(orgEmail != inEmail){
   					if(!isEmailChk){
    					$.osl.alert(pageTypeData["common"]["emailDuplChkString"], {type:"warning"});
    	        		return;
   	    			}
   				}
    			
    			
    			if(ldapUse == "N"){
    				if(!$.osl.isNull(inUsrPw)){
    					
    	            	if($.osl.user.passwordValidate(inUsrId, inUsrPw)){
    	            		return;
    	            	}
    					
    					
    					if(beforePasswordCheck(inUsrId, inUsrPw) == "Y"){
    						$("#usrPw").focus();
    						$.osl.alert(pageTypeData["common"]["withinYearPwString"],{type:"warning"});
    						return;
    					}
    				}
				}
    			
    			
	    		if(validatCheckDeptNm(orgDeptNm, deptNm)){
	    			return;
	    		}
    			
    			
    			if(orgBlock == "02" && selBlock == "01"){
    				$("#pwFailCnt").val(0);
    			}
				
    			
    			if(loginExprYn == "Y" && selBlock == "01"){
    				$("#loginExprYn").val("N");
    			}
    			
    			
    			var blkLog = $("#blkLog").val();
    			if(selBlock == "02" && !$.osl.isNull(blkLog)){
    				blkLog = blkLog.trim();
    				
    				if($.osl.isNull(blkLog)){
    					$("#blkLog").val("");
    				}
    			}
    			
    			
            	submitUpdateAction();
    		}
    	});
    };
    
   
   var selectDeptInfo = function(searchDeptNm){
    	
	   var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm6000/stm6000/selectStm6000BeforeCmmDeptList.do'/>", 
			"loadingShow": false}, {"searchDeptNm":$.trim(searchDeptNm)});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				var deptList = data.deptList;
				if(deptList.length == 1){
					
					setDeptInfo(deptList[0].deptId, deptList[0].deptName);
				}else{
					
					callCommonDeptPopup(searchDeptNm);
				}
			}
		});
		
		
		ajaxObj.send();
    	
   };
    
   
	var callCommonDeptPopup = function(searchDeptNm){
		
		var data = {deptName:searchDeptNm};
		var options = {
				idKey: "cmm6500",
				modalSize: 'xl',
				modalTitle: "조직 검색",
				closeConfirm: false,
				callback:[{
                    targetId: "cmm6500SelDept",
                    actionFn: function(thisObj){
                    	OSLStm3001Popup.setDept(thisObj);
                    }
                 }]
			};
		
		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6500/selectCmm6500View.do',data,options);
	};
    
   
    var setDeptInfo = function(deptId, deptNm){
    	
    	
    	if(!$.osl.isNull(deptId) && !$.osl.isNull(deptNm)){
    		$("#frStm3001 #deptId").val(deptId);
    		$("#frStm3001 #deptName").val(deptNm);
    		$("#frStm3001 #orgDeptNm").val(deptNm); 
    	}
    };
    
    
   
    var validatCheckDeptNm = function(orgDeptNm, deptNm){
    	
    	
		if($.trim(orgDeptNm) != $.trim(deptNm)){
			
			$("#deptName").next("div.input-group-append").after(
					'<div class="invalid-feedback invalid-dept" style="display:block">정확한 부서명을 입력하거나, 부서검색을 하여 다시 부서를 선택해주세요.</div>'
					+ '<div class="invalid-feedback invalid-dept" style="display:block">(원본 : '+$.osl.escapeHtml(orgDeptNm)+')</div>'
			);
			
			$("#deptName").addClass("is-invalid");
			return true;
		}
    	
    	return false;
    };
    
	
   
    var beforePasswordCheck = function(usrId, usrPw){
    	
    	var chkResult = "N";
    	
    	
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm3000/stm3000/selectStm3000BeforeUsedPwChkAjax.do'/>", "async": false}
				,{"usrId": usrId, "usrPw":usrPw});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				chkResult = data.isUsedPw;
			}
		});
		
		
		ajaxObj.setFnError(function(xhr, status, err){
			$.osl.alert(data.message, {type: 'error'});
		});
		
		
		ajaxObj.send();
    	
		return chkResult;
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
				
		    	$.osl.setDataFormElem(data.usrInfoMap,"frStm3001", ["usrId", "usrNm", "email", "telno", "deptId", "deptName", "etc", "loginExprYn", "pwFailCnt", "usrImgId", "blkLog"]);
				
				var block = data.usrInfoMap.block;
				var usrImgId = data.usrInfoMap.usrImgId;
				
				var loginExprYn = data.usrInfoMap.loginExprYn;
				
				
		    	$("#orgEmail").val(data.usrInfoMap.email);
				
				$("#orgBlock").val(block);
				
				$("#orgDeptNm").val(data.usrInfoMap.deptName);
				
				
				var usrImgUrl = $.osl.user.usrImgUrlVal(usrImgId);
				$("#usrImage").attr("data-before-image", usrImgUrl); 
				$("#usrImage").css("background-image", "url("+usrImgUrl+")");
						
				
				if(!$.osl.isNull(usrImgId) && data.usrImgFileExist == "Y"){
					
					$("#usrImg_avatar").addClass("kt-avatar--changed");
				}
				
				
				if(loginExprYn == "Y"){
					
					$("#blockGuideMsg").removeClass("d-none");
					block = "02";
				}
				
				
		    	$("#useCd").attr("data-osl-value", data.usrInfoMap.useCd);
				$("#block").attr("data-osl-value", block);
				$("#usrDutyCd").attr("data-osl-value", data.usrInfoMap.usrDutyCd);
				$("#usrPositionCd").attr("data-osl-value", data.usrInfoMap.usrPositionCd);
				
				
				if(block == "02"){
					$("#bloclLogInfo").removeClass("d-none");
				}
				
				
				autosize.update($("#etc"));
				autosize.update($("#blkLog"));
				
				
				if(data.usrInfoMap.usrId+"_GRP" == data.usrInfoMap.licGrpId){
					$("#useCd").attr("disabled","disabled");
					$("#useCd").after('<div class="invalid-feedback" style="display:block">최초 라이선스 등록자는 사용 유무를 변경할 수 없습니다.</div>');
				}
			}
		});
		
		
		ajaxObj.send();
	};
    
    
   
    var submitInsertAction = function(){
    	
    	var form = $('#'+formId);
  		
		
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm(pageTypeData[type]["saveString"],null,function(result) {
	        if (result.value) {
	        	
				var formArray = form.serializeArray();
	        	var fd = new FormData();
	        	
	        	$.each(formArray, function(idx, map){
	        		
	        		fd.append(map.name, map.value);
	        	});
	        	
	        	
	        	fd.append('file', $("#usrImgFile")[0].files[0]);
				
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm3000/stm3000/insertStm3000UsrInfoAjax.do'/>", 
	    			"loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    			}else{
	    				
	    				$.osl.toastr(data.message);

	    				
	    				$.osl.layerPopupClose();
	    				
	    				
	    				$("button[data-datatable-id=stm3000UsrTable][data-datatable-action=select]").click();
	    			}
	    		});
	    		
	    		
	    		ajaxObj.send();
	        }
	    });
		
    };
    
    
   
    var submitUpdateAction = function(){
    	
    	var form = $('#'+formId);
  		
		
		if (!form.valid()) {
			return;
		}
		
		$.osl.confirm(pageTypeData[type]["saveString"],null,function(result) {
	        if (result.value) {
	        	
	        	var formArray = form.serializeArray();
	        	var fd = new FormData();
	        	
	        	$.each(formArray, function(idx, map){
	        		
	        		fd.append(map.name, map.value);
	        	});
	        	
	        	var imgFile = $("#usrImgFile")[0].files;
	        	
	        	if(!$.osl.isNull(imgFile)){
		        	fd.append('file', imgFile[0]);
	        	}
	        	
	        	
	        	
	        	var imgDelYn = $("#usrImage").data("img-delete-yn");
	        	if($.osl.isNull(imgDelYn)){
	        		imgDelYn = "N";
	        	}
	        	
	        	fd.append('defaultImgYn', imgDelYn);
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/stm/stm3000/stm3000/updateStm3000UsrInfoAjax.do'/>", 
	    			"loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    			}else{
	    				
	    				$.osl.toastr(data.message);

	    				
	    				$.osl.layerPopupClose();

    					
    					$.osl.datatable.list["stm3000UsrTable"].targetDt.reload();	
	    			}
	    		});
	    		
	    		
	    		ajaxObj.send();
	        }
	    });
		
    };
	
    return {
        
        init: function() {
        	documentSetting();
        },
        
    	setDept:function(thisObj){
    		
    		var deptId = $(thisObj).data("dept-id");
    		var deptNm = $(thisObj).data("dept-nm");
    		
    		setDeptInfo(deptId, deptNm);
    	}
        
    };
}();


$.osl.ready(function(){
	OSLStm3001Popup.init();
});

	
</script>