<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6000" autocomplete="off">
	<div class="row">
		<div class="col-xl-5 col-lg-12 col-md-12 col-sm-12">
			<div class="kt-portlet kt-portlet--mobile">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span>접수대기 요구사항 목록</span>
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6000ReqTable" data-datatable-action="select" title="요구사항 조회" data-title-lang-cd="req4100.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6000ReqTable" data-datatable-action="insert" title="요구사항 추가" data-title-lang-cd="req4100.actionBtn.insertTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
								<i class="fa fa-plus"></i><span data-lang-cd="datatable.button.insert">추가</span>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6000ReqTable" data-datatable-action="delete" title="요구사항 삭제" data-title-lang-cd="req4100.actionBtn.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="5">
								<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-sm-12">
							<div class="osl-datatable-search" data-datatable-id="cmm6000ReqTable"></div>
						</div>
					</div>
					<div class="kt_datatable osl-datatable-footer__divide" id="cmm6000ReqTable"></div>
				</div>
			</div>
		</div>
		<div class="col-xl-7 col-lg-12 col-md-12 col-sm-12">
			<div class="kt-portlet kt-portlet--mobile">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i><span>선택 요구사항 정보</span>
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-xl-2 kt-align-center">
							<a href="#" class="kt-media kt-media--xl kt-media--circle">
								<img type="img" id="usrImgId">
							</a>
						</div>
						<div class="col-xl-5 col-lg-6">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.usrNm">요청자 이름</span></label>
								<input type="text" class="form-control" placeholder="요청자 이름" name="reqUsrNm" id="usrNm" readonly="readonly">
							</div>
						</div>
						<div class="col-xl-5 col-lg-6">
							<div class="form-group">
								<label><i class="flaticon2-envelope kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.email">요청자 e-mail</span></label>
								<input type="text" class="form-control" placeholder="요청자 e-mail" name="reqUsrEmail" id="email" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-7 col-lg-6">
							<div class="form-group">
								<label><i class="flaticon2-avatar kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.deptNm">요청자 소속</span></label>
								<input type="text" class="form-control" name="reqUsrDeptNm"placeholder="요청자 소속"  id="deptName" readonly="readonly">
								<input type="hidden" name="reqUsrDeptId" id="deptId">
							</div>
						</div>
						<div class="col-xl-5 col-lg-6">
							<div class="form-group">
								<label><i class="flaticon2-phone kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.tel">요청자 연락처</span></label>
								<input type="text" class="form-control" placeholder="요청자 연락처" name="reqUsrNum" id="telno" readonly="readonly">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" id="mainCol" name="mainCol">
			<div class="kt-portlet kt-portlet--collapsed" id="req4101ReqGrpInfo">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<i class="fa flaticon2-layers-1 kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqInfo">그룹 요구사항 정보</span>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReq">그룹 요구사항</span></label>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="그룹 요구사항을 선택하세요" name="reqGrpNm" id="reqGrpNm">
							<button type="button" class="btn btn-brand input-group-append" id="searchReqGrpBtn" name="searchReqGrpBtn"><span data-lang-cd="req4101.button.searchBtn">검색</span></button>
						</div>
					</div>
					<div class="form-group kt-margin-b-0">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqDesc">그룹 요구사항 내용</span></label>
						<textarea class="kt-hide" name="reqGrpDesc" id="reqGrpDesc"></textarea>
					</div>
				</div>
			</div>
			<div class="kt-portlet">
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group">
								<label for="exampleSelect1"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">프로젝트</span></label>
								<select class="form-control kt-select2" name="prjId" id="reqPrjSelect">
								</select>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDtm">요청 일자</span></label>
								<input type="date" class="form-control" placeholder="요청일" name="reqDtm" id="reqDtm" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqNm">요청 제목</span></label>
						<input type="text" class="form-control" placeholder="요청 제목" name="reqNm" id="reqNm" autocomplete="off" required>
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDesc">요청 내용</span></label>
						<textarea  class="kt-hide" name="reqDesc" id="reqDesc" autocomplete="off" required></textarea>
					</div>
					<div class="form-group kt-margin-b-10">
						<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
							<input type="checkbox" name="reqPwCheckbox" id="reqPwCheckbox">
							<span></span>
						</label>
						<span data-lang-cd="req4101.label.reqPw">요구사항 잠금</span>
					</div>
					<div class="kt-hide osl-bad_box" name="pwOption" id="pwOption">
				 		<div class="input-group kt-margin-b-10">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="req4101.label.password">PW</span></label>
				 			<input type="password" class="form-control" name="reqPw" id="reqPw" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexerrorstr="알파벳과 숫자 조합 4-12자 이내"  placeholder="알파벳과 숫자 조합 4-12자 이내"/> 
				 		</div>
				 		<div class="input-group">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="req4101.label.passwordCheck">PW 확인</span></label>
				 			<input type="password" class="form-control" name="reqPwCheck" id="reqPwCheck"autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexerrorstr="알파벳과 숫자 조합 4-12자 이내"  placeholder="알파벳과 숫자 조합 4-12자 이내" equalTo="#reqPw"/>
			 			</div>
				 	</div>
					<div class="form-group kt-margin-t-25 form-group-last">
						<label>
							<i class="fa fa-file-upload kt-margin-r-5"></i>
							<span data-lang-cd="req4101.label.attachments">파일 첨부</span> 
							<button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="fileRemoveResetBtn">
								<span data-lang-cd="req4101.button.deleteResetBtn">삭제 초기화</span>
							</button>
						</label>
						<div class="kt-uppy osl-max-h-px-260" id="req4101FileUpload">
							<div class="kt-uppy__dashboard"></div>
							<div class="kt-uppy__progress"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="kt-portlet kt-portlet--collapsed" data-ktportlet="true" id="req4101NewRequestOpt">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req4101.label.requestDefaultOptNm">접수 기본항목 입력</span>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
				
				</div>
			</div>
		</div> <!-- col end -->
	</div> <!-- row end -->
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="req4101SaveSubmit1"><i class="fa fa-check-square"></i><span data-lang-cd="req4101.complete">접수 승인</span></button>
	<button type="button" class="btn btn-danger" id="req4101SaveSubmit2"><i class="fa fa-check-square"></i><span data-lang-cd="req4101.complete">접수 반려</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLCmm6000Popup = function () {
	var formId = 'frCmm6000';
	
	//edit 목록
	var formEditList = [];
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);

	//atchfileId
	var atchFileId;

	//파일 업로드 세팅
	var fileUploadObj;
	
    // Private functions
    var documentSetting = function () {
    	$("#usrImgId").attr("src",$.osl.user.usrImgUrlVal(""));
    };

    return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLCmm6000Popup.init();
});

	
</script>