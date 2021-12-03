<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	
	<div class="col-xl-3">
		<div class="kt-portlet">
			<div class="kt-portlet__body kt-pb-20">
				<div class="kt-widget kt-widget--general-1">
					<div class="kt-media kt-media--brand kt-media--md kt-media--circle">
						<img src="/media/users/default.jpg" id="profileUsrImg">
					</div>
					<div class="kt-widget__wrapper">
						<div class="kt-widget__label">
							<span class="kt-widget__titlekt-margin-b-5 osl-charge-requirements__body" id="profileUsrNm">사용자명</span>
							<span class="kt-widget__desc">
								직급 : <span class="kt-margin-l-5 osl-charge-requirements__body" id="profileUsrPositionNm"></span>
							</span>
							<span class="kt-widget__desc">
								부서 : <span class="kt-margin-l-5 osl-charge-requirements__body" id="profileUsrDeptNm"></span>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="kt-portlet__separator"></div>
			<div class="kt-portlet__body">
				<ul class="kt-nav kt-nav--bolder kt-nav--fit-ver kt-nav--v4" role="tablist" id="myPageAsideMenu">
					<li class="kt-nav__item active" data-aside-menu="usrProfile">
						<a class="kt-nav__link active" href="#" role="tab">
							<span class="kt-nav__link-icon"><i class="fas fa-user"></i></span>
							<span class="kt-nav__link-text">사용자 프로필</span>
						</a>
					</li>
					<c:if test="${requestScope.ldapUse == 'N'}">
						<li class="kt-nav__item" data-aside-menu="passwordChange">
							<a class="kt-nav__link" href="#" role="tab">
								<span class="kt-nav__link-icon"><i class="fas fa-lock"></i></span>
								<span class="kt-nav__link-text">비밀번호 변경</span>
							</a>
						</li>
					</c:if>
					<li class="kt-nav__item" data-aside-menu="usrShortCut" id="shortcutAside">
						<a class="kt-nav__link active" href="#" role="tab">
							<span class="kt-nav__link-icon"><i class="fas fa-cog"></i></span>
							<span class="kt-nav__link-text">단축키 설정</span>
						</a>
					</li>
					<li class="kt-nav__item" data-aside-menu="subSign" id="subSign">
						<a class="kt-nav__link active" href="#" role="tab">
							<span class="kt-nav__link-icon"><i class="fa fa-file-signature"></i></span>
							<span class="kt-nav__link-text">대결자 지정</span>
						</a>
					</li>
					<!-- 기타정보는 사용시 추가
					<li class="kt-nav__item" data-aside-menu="etcInfo">
						<a class="kt-nav__link" href="#" role="tab">
							<span class="kt-nav__link-icon"><i class="flaticon-feed"></i></span>
							<span class="kt-nav__link-text">기타정보</span>
						</a>
					</li>
					 -->
				</ul>
			</div>
		</div>
	</div>
	
	
	
	<div class="col-xl-9" id="personalInfo_right_wrapper">
		
		<div class="kt-portlet" data-aside-menu="usrProfile">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest">사용자 프로필</h4>
				</div>
			</div>
			<form class="kt-form kt-form--label-right" id="frUsr1000UserInfo">
				<input type="hidden" name="deptId" id="deptId">
				<input type="hidden" name="orgDeptNm" id="orgDeptNm">
				<input type="hidden" name="orgEmail" id="orgEmail" >
				<input type="hidden" name="usrImgId" id="usrImgId">
				<input type="hidden" name="absStDtm" id="absStDtm">
				<input type="hidden" name="absEdDtm" id="absEdDtm">
				<div class="kt-portlet__body">
					<div class="kt-section kt-section--first">
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
									<label><i class="fa fa-edit kt-margin-r-5"></i>아이디</label>
									<input type="text" class="form-control" label="아이디" placeholder="아이디" id="usrId" name="usrId" readonly="readonly" value="<c:out value='${requestScope.usrId}' />">
								</div>
								<div class="form-group kt-margin-b-15">
									<label class="required"><i class="fa fa-edit kt-margin-r-5"></i>이름</label>
									<input type="text" class="form-control" placeholder="이름" name="usrNm" id="usrNm" minlength="2" maxlength="100" regexstr="^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣_-]*$" regexalert="한글,영문,숫자,특수문자( _ -)만 입력가능" required>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-6">
								<div class="form-group">
									<label class="required"><i class="fa fa-phone-alt kt-margin-r-5"></i>연락처<small>(-를 제외한 11자를 입력해주세요)</small></label>
									<input type="text" class="form-control" placeholder="연락처" name="telno" id="telno" minlength="3" maxlength="11" regexstr="^([0-9]).*$" regexalert="숫자만 입력가능" required>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="form-group">
									<label class="required"><i class="fa fa-envelope kt-margin-r-5"></i>이메일</label>
									<div class="input-group">
										<input type="email" class="form-control" label="이메일" placeholder="이메일" id="email" name="email" maxlength="35" required>
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
						<div class="row">
							<div class="col-xl-3">
								<div class="form-group">
									<label for="exampleSelect1"><i class="fa fa-id-badge kt-margin-r-5"></i>근무 시작시간</label>
									<input type="text" class="form-control" id="wkStTm" name="wkStTm">
								</div>
							</div>
							<div class="col-xl-3">
								<div class="form-group">
									<label for="exampleSelect1"><i class="fa fa-id-badge kt-margin-r-5"></i>근무 종료시간</label>
									<input type="text" class="form-control" id="wkEdTm" name="wkEdTm">
								</div>
							</div>
							<div class="col-xl-3">
								<div class="form-group">
									<label for="exampleSelect1"><i class="fa fa-id-badge kt-margin-r-5"></i>휴식 시작시간</label>
									<input type="text" class="form-control"id="bkStTm" name="bkStTm">
								</div>
							</div>
							<div class="col-xl-3">
								<div class="form-group">
									<label for="exampleSelect1"><i class="fa fa-id-badge kt-margin-r-5"></i>휴식 종료시간</label>
									<input type="text" class="form-control" id="bkEdTm" name="bkEdTm">
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
						<div class="row">
							<div class="col-xl-12">
								<div class="form-group">
									<label for="reqStDtm"><i class="far fa-clock kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">부재 기간</span></label>
									<div class="input-group">
										<input type="text" class="form-control osl-preview-readonly  osl-input-readonly-none" name="subSignRange" id="subSignRange" readonly="readonly">
										<div class="input-group-append">
											<button class="btn btn-outline-brand" type="button" id="btn_endSubSign">부재종료</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label><i class="fa fa-edit kt-margin-r-5"></i>비고</label>
							<textarea class="form-control osl-min-h-px--130" name="etc" id="etc" maxlength="2000"></textarea>
						</div>
					</div>
				</div>
				<div class="kt-portlet__foot kt-align-center">
					<button type="button" class="btn btn-brand" id="usr1000ProfileSubmit" data-toggle="kt-tooltip" title="사용자 프로필 수정">수정 완료</button>
				</div>
			</form>
		</div>
		
		
		
		<div class="kt-portlet d-none" data-aside-menu="passwordChange">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest">비밀번호 변경</h4>
				</div>
			</div>
			<form class="kt-form kt-form--label-right" id="frUsr1000UserPassword">
				<div class="kt-portlet__body">
					<div class="kt-section kt-section--first">
						<div class="kt-section__body">
							<div class="alert alert-solid-danger alert-bold fade show kt-margin-t-20 kt-margin-b-40" role="alert">
								<div class="alert-icon"><i class="fa fa-exclamation-triangle"></i></div>
								<div class="alert-text">주기적으로 비밀번호를 변경해야 합니다. 비밀번호 사용기간 만료 시 계정이 차단되며 시스템에 로그인할 수 없습니다.</div>
								<div class="alert-close">
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true"><i class="la la-close"></i></span>
									</button>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-xl-3 col-lg-3 col-form-label"><i class="fa fa-clock kt-margin-r-5"></i>최근 변경일시</label>
								<div class="col-lg-9 col-xl-6">
									<span class="form-control" id="pwModifyDtm"></span>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-xl-3 col-lg-3 col-form-label required"><i class="fa fa-lock kt-margin-r-5"></i>현재 비밀번호</label>
								<div class="col-lg-9 col-xl-6">
									<input type="password" class="form-control" name="usrPw" id="usrPw" placeholder="현재 비밀번호" label="현재 비밀번호" required>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-xl-3 col-lg-3 col-form-label required"><i class="fa fa-lock kt-margin-r-5"></i>새 비밀번호</label>
								<div class="col-lg-9 col-xl-6">
									<input type="password" class="form-control" name="newUsrPw" id="newUsrPw" placeholder="새 비밀번호" label="새 비밀번호" minlength="5" maxlength="50" regexstr="^(?=.{5,})(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\/?@\#!$%&]).*$" regexalert="영문 ,숫자,특수문자(!@#$%&*?) 필수 포함" required>
								</div>
							</div>
							<div class="form-group form-group-last row">
								<label class="col-xl-3 col-lg-3 col-form-label required"><i class="fa fa-lock kt-margin-r-5"></i>새 비밀번호 확인</label>
								<div class="col-lg-9 col-xl-6">
									<input type="password" class="form-control" name="reUsrPw" id="reUsrPw" placeholder="새 비밀번호 확인" label="새 비밀번호 확인" minlength="5" maxlength="50" regexstr="^(?=.{5,})(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[\/?@\#!$%&]).*$" regexalert="영문 ,숫자,특수문자(!@#$%&*?) 필수 포함" equalTo="#newUsrPw" required>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="kt-portlet__foot kt-align-center">
					<button type="button" class="btn btn-brand" id="usr1000PasswordSubmit" data-toggle="kt-tooltip" title="사용자 비밀번호 변경">수정 완료</button>
				</div>
			</form>
		</div>
		
		
		
		<div class="kt-portlet d-none" data-aside-menu="usrShortCut">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label">
					<h4 class="kt-font-boldest">단축키 변경</h4>
				</div>
			</div>
			<form class="kt-form kt-form--label-right" id="frUsr1000UserShortCut">
				<div class="kt-portlet__body">
					<div class="alert alert-solid-info alert-bold fade show kt-margin-t-20 kt-margin-b-40" role="alert">
						<div class="alert-icon"><i class="fa fa-exclamation-circle"></i></div>
						<div class="alert-text"> 단축키는 단일키 혹은 Ctrl,Alt,Shift 버튼과 키의 조합으로 구성할 수 있습니다. ex) F2, Ctrl+F2, Ctrl + Shift + F2 <br/> 
												  또한 단축키는 최우선적으로 적용되므로 주로 사용하는 기본 단축키를 설정할 경우 기본 단축키는 사용할 수 없습니다. <br/>
												 단축키 입력 시 단축키 입력란을 클릭 후 사용할 단축키를 눌러주세요.
						</div>
						<div class="alert-close">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true"><i class="la la-close"></i></span>
							</button>
						</div>
					</div>
					<div class="kt-section kt-section--first">
						<div class="kt-section__body">
							<div class="kt-portlet" id="usr1100ShortcutInfo">
								<div class="kt-portlet__head">
									<div class="kt-portlet__head-label">
										<i class="fa flaticon-layer kt-margin-r-5"></i><span data-lang-cd="usr1100.title.shortcut">메뉴 및 권한 관리 단축키</span>
									</div>
									<div class="kt-portlet__head-toolbar">
										<div class="kt-portlet__head-group">
											<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-up"></i></a>
										</div>
									</div>
								</div>
								<div class="kt-portlet__body" >
									<div class="row">
										<div class="col-xl-4 col-lg-3 col-md-12 col-sm-12 col-form-label osl-align-left--imp"><h6 class="kt-font-boldest text-primary"><span data-lang-cd="usr1100.label.shortcutNm">단축키 명</span></h5></div>
										<div class="col-xl-2 col-lg-2 col-md-12 col-sm-12 col-form-label osl-align-left--imp"><h6 class="kt-font-boldest text-primary"><span data-lang-cd="usr1100.label.popupActionCd">팝업시 동작여부</span></h5></div>
										<div class="col-xl-6 col-lg-7 col-md-12 col-sm-12 col-form-label osl-align-left--imp"><h6 class="kt-font-boldest text-primary text-center"><span data-lang-cd="usr1100.label.shortcut">단축키</span></h5></div>
									</div>
									<div id="shortcutDiv"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="kt-portlet__foot kt-align-center">
					<button type="button" class="btn btn-primary" id="usr1100ShortcutSubmit" data-toggle="kt-tooltip" title="사용자 단축키 변경"><span data-lang-cd="usr1100.btn.update">수정완료</span></button>
				</div>
			</form>
		</div>
		
		
		
		<div class="row d-none" id="subSignUsrTab" data-aside-menu="subSign">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
				<div class="kt-portlet">
					<div class="kt-portlet__head">
						<div class="kt-portlet__head-label">
							<h4 class="kt-font-boldest">대결자 지정</h4>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12">
				<div class="kt-portlet">
					<div class="kt-portlet__head">
						<div class="kt-portlet__head-label">
							<i class="fa flaticon-layer kt-margin-r-5"></i><span data-lang-cd="usr1100.title.shortcut">권한 프로젝트</span>
						</div>
						
						<div class="kt-portlet__head-toolbar">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6000PrjTable" data-datatable-action="insertAllPrjSubSignUsr" title="전체 프로젝트 대결자 지정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insertAllPrjSubSignUsr" tabindex="1">
								<i class="fa fa-list"></i><span>전체 대결자 지정</span>
							</button>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="cmm6000PrjTable" data-datatable-action="insertSelPrjSubSignUsr" title="선택 프로젝트 대결자 지정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insertSelPrjSubSignUsr" tabindex="2">
								<i class="fa fa-file-signature"></i><span>선택 대결자 지정</span>
							</button>
						</div>
						
					</div>
					<div class="kt-portlet__body">
						<div class="osl-datatable-search" data-datatable-id="cmm6000PrjTable"></div>
						<div class="kt-datatable" id="cmm6000PrjTable"></div>
					</div>
				</div>
			</div>
			<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12">
				<div class="kt-portlet">
					<div class="kt-portlet__head">
						<div class="kt-portlet__head-label">
							<i class="fa flaticon-layer kt-margin-r-5"></i><span data-lang-cd="usr1100.title.shortcut">대결자 정보</span>
						</div>
					</div>
					<div class="kt-portlet__body">
						<form class="kt-form kt-form--label-right" id="frUsr1000SubSignUsrInfo">
							<div class="row">
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
									<div class="form-group">
										<label><i class="fa fa-edit kt-margin-r-5"></i>대결자명</span></label> 
										<input type="text" class="form-control" placeholder="대결자명" name="subSignUsrNm" id="subSignUsrNm" readonly="readonly">
									</div>
								</div>
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
									<div class="form-group">
										<label><i class="fa fa-envelope kt-margin-r-5"></i>대결 권한 프로젝트명</label>
										<input type="email" class="form-control" label="프로젝트명" placeholder="프로젝트명" id="subSignUsrPrjNm" name="subSignUsrPrjNm" readonly="readonly">
									</div>	
								</div>
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
									<div class="form-group">
										<label><i class="fa fa-envelope kt-margin-r-5"></i>이메일</label>
										<input type="email" class="form-control" label="이메일" placeholder="이메일" id="subSignUsrEmail" name="subSignUsrEmail" readonly="readonly">
									</div>	
								</div>
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
									<div class="form-group">
										<label><i class="fa fa-phone-alt kt-margin-r-5"></i>연락처</label>
										<input type="text" class="form-control" label="연락처" placeholder="연락처" id="subSignUsrTelno" name="subSignUsrTelno" readonly="readonly">
									</div>	
								</div>
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
									<div class="form-group">
										<label><i class="fa fa-id-card kt-margin-r-5"></i>부서명</label>
										<input type="text" class="form-control" label="부서명" placeholder="부서명" id="subSignUsrDeptNm" name="subSignUsrDeptNm" readonly="readonly">
									</div>	
								</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
									<div class="form-group">
										<label><i class="fa fa-id-badge kt-margin-r-5"></i>직급</label>
										<input type="text" class="form-control" label="직급" placeholder="직급" id="subSignUsrPositionCd" name="subSignUsrPositionCd" readonly="readonly">
									</div>	
								</div>
								<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
									<div class="form-group">
										<label><i class="fa fa-id-badge kt-margin-r-5"></i>직책</label>
										<input type="text" class="form-control" label="직책" placeholder="직책" id="subSignUsrDutyCd" name="subSignUsrDutyCd" readonly="readonly">
									</div>	
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
	
</div>

<script>
"use strict";
var OSLUsr1000Popup = function () {
	
	var profileFormId = 'frUsr1000UserInfo';
	var passwordFormId = 'frUsr1000UserPassword';
	var shortcutFormId = 'frUsr1000UserShortCut';
	var subSignUsrFormId = 'frUsr1000SubSignUsrInfo';
	
	
	new KTAvatar("usrImg_avatar");
	
	
	var profileFormValidate = $.osl.validate(profileFormId);
	var passwordFormValidate = $.osl.validate(passwordFormId);
	
	var isEmailChk = false; 
	var beforeEmail; 
	
	
	
	var pageTypeData = {
			
			"usrProfile":{
				"saveString": "사용자 프로필을 수정하시겠습니까?",
				"emptyEmailString" : "이메일을 입력해주세요.",
				"currentEmailString" : "현재 사용자의 이메일입니다.",
				"emailDuplChkString" : "이메일 중복체크를 해주세요.",
				"emptyDeptInfo" : "부서검색 버튼을 클릭하여 부서를 선택해주세요.",
				"saveBtnString": "프로필 수정 완료"
			},
			
			"usrPassword":{
				"saveString": "비밀번호를 변경하시겠습니까?",
				"withinYearPwString": "1년이내 사용한 비밀번호는 사용할 수 없습니다.",
				"saveBtnString": "비밀번호 변경 완료"
			},
	};
	
    
    var documentSetting = function () {
    	
    	
    	new KTPortlet('usr1100ShortcutInfo', $.osl.lang("portlet"));
    	
    	
		var commonCodeArr = [
			{mstCd: "ADM00007", useYn: "Y",targetObj: "#usrPositionCd", comboType:"S"}, 
			{mstCd: "ADM00008", useYn: "Y",targetObj: "#usrDutyCd", comboType:"S"}, 	
		];
    	
    	
		$("#usr1000ProfileSubmit").text(pageTypeData["usrProfile"]["saveBtnString"]);
		$("#usr1000PasswordSubmit").text(pageTypeData["usrPassword"]["saveBtnString"]);

  		
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
  		
		
		var defaultImg = $.osl.user.usrImgUrlVal(null);
		$("#usrImage").attr("data-default-img", defaultImg);	
		
		
    	autosize($("#etc"));
		
    	
		$.osl.date.daterangepicker($("#"+profileFormId+" #subSignRange"), {
				timePicker: true, 
				timePicker24Hour: true,
				locale: {
					format: 'YYYY-MM-DD HH:mm'
		        }
			},function(defaultConfig, start, end, label){
				var stDtStr = new Date(start._d).format("yyyy-MM-dd HH:mm");
				var edDtStr = new Date(end._d).format("yyyy-MM-dd HH:mm");
				
				$("#absStDtm").val(stDtStr);
				$("#absEdDtm").val(edDtStr);
		});
    	
		
        $.osl.date.daterangepicker($("#wkStTm"), {
        	singleDatePicker: true,
            timePicker: true,
            timePicker24Hour: true,
            timePickerIncrement: 1,
           autoUpdateInput:false,
             locale: { 
                format: 'HH:mm' 
             }, 
        },function(defaultConfig, start, end, label){
           $("#wkStTm").val(new Date(start._d).format('HH:mm'))
        }).on('show.daterangepicker', function (ev, picker) {
            picker.container.find(".calendar-table").hide();
        });
		
		
        $.osl.date.daterangepicker($("#wkEdTm"), {
        	singleDatePicker: true,
            timePicker: true,
            timePicker24Hour: true,
            timePickerIncrement: 1,
           autoUpdateInput:false,
             locale: { 
                format: 'HH:mm' 
             }, 
        },function(defaultConfig, start, end, label){
           $("#wkEdTm").val(new Date(start._d).format('HH:mm'))
        }).on('show.daterangepicker', function (ev, picker) {
            picker.container.find(".calendar-table").hide();
        });
		
		
        $.osl.date.daterangepicker($("#bkStTm"), {
        	singleDatePicker: true,
            timePicker: true,
            timePicker24Hour: true,
            timePickerIncrement: 1,
           autoUpdateInput:false,
             locale: { 
                format: 'HH:mm' 
             }, 
        },function(defaultConfig, start, end, label){
           $("#bkStTm").val(new Date(start._d).format('HH:mm'))
        }).on('show.daterangepicker', function (ev, picker) {
            picker.container.find(".calendar-table").hide();
        });
		
		
        $.osl.date.daterangepicker($("#bkEdTm"), {
        	singleDatePicker: true,
            timePicker: true,
            timePicker24Hour: true,
            timePickerIncrement: 1,
           autoUpdateInput:false,
             locale: { 
                format: 'HH:mm' 
             }, 
        },function(defaultConfig, start, end, label){
           $("#bkEdTm").val(new Date(start._d).format('HH:mm'))
        }).on('show.daterangepicker', function (ev, picker) {
            picker.container.find(".calendar-table").hide();
        });
        
		
		selectUsrInfo();
  		
    	
    	$("#myPageAsideMenu li.kt-nav__item").click(function(){
    		
    		var menuNm = $(this).data("aside-menu");
    		
    		
			if(!$(this).hasClass("active") && menuNm == "usrProfile"){
				selectUsrInfo();
			}
    		
    		
			if(!$(this).hasClass("active") && menuNm == "usrShortCut"){
				selectShortCutInfo();
				
			}
			
    		
    		if(menuNm == "passwordChange"){
    			$("#frUsr1000UserPassword")[0].reset();
    			$("#frUsr1000UserPassword").find("input[type='password']").removeClass("is-invalid");
    			$("#frUsr1000UserPassword").find("div.error").remove();
    		}
    		
    		
    		$("#myPageAsideMenu li.kt-nav__item").removeClass("active");
    		$(this).addClass("active");
    		
    		
			$("#personalInfo_right_wrapper").children(".kt-portlet").addClass("d-none");
			$("#personalInfo_right_wrapper").children("#subSignUsrTab").addClass("d-none");
			$("#personalInfo_right_wrapper").children("[data-aside-menu="+menuNm+"]").removeClass("d-none");
			
    	});
    	
    	
    	$(".kt-avatar .kt-avatar__cancel").click(function(){
    		
    		$("#btn_imageReset").removeClass("d-none");
    	});
    	
    	
		$('#usrImgFile').change(function() {
			var files = $("#usrImgFile")[0].files;
			if(!$.osl.isNull(files)){
				
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
    		
    	
    	$("#btn_emailChk").click(function(){
    		
    		var inEmail = $("#email").val();
    		var orgEmail = $("#orgEmail").val(); 
    		
    		
    		if($("#email").hasClass("is-invalid")){
    			return;
    		}
    		
    		if($.osl.isNull(inEmail)){
    			$.osl.alert(pageTypeData["usrProfile"]["emptyEmailString"]);
    			return;
    		}
    		
    		
    		if(orgEmail == inEmail){
    			$.osl.alert(pageTypeData["usrProfile"]["currentEmailString"]);
    			return;
    		}
    		
    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/usr/usr1000/usr1000/selectUsr1000emailChRepAjax.do'/>", 
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
    	
    	
    	$("#btn_endSubSign").click(function(){
    		
    		
    		$("#subSignRange").val("");
    		$("#absStDtm").val("");
    		$("#absEdDtm").val("");
    		
    	});
    	
    	
    	$("#usr1000ProfileSubmit").click(function(){
			
    		var profileForm = $('#'+profileFormId);
			var inUsrPw = $("#usrPw").val(); 			
			var inEmail = $("#email").val(); 			
   			var orgEmail = $("#orgEmail").val(); 		
			var deptId = $("#deptId").val(); 			
			var deptNm = $("#deptName").val(); 			
			var orgDeptNm = $("#orgDeptNm").val(); 		
			
    		
    		if (!profileForm.valid()) {
    			return;
    		}
    		
			
			if(orgEmail != inEmail){
				if(!isEmailChk){
					$.osl.alert(pageTypeData["usrProfile"]["emailDuplChkString"], {type:"warning"});
	        		return;
    			}
			}
    			
   			
    		if(validatCheckDeptNm(orgDeptNm, deptNm)){
    			return;
    		}
    			
   			
           	submitUsrProfileAction();
    	});
    	
    	
    	$("#usr1000PasswordSubmit").click(function(){
    		
    		var usrId = $("#usrId").val();
    		var newUsrPw = $("#newUsrPw").val();
    		
			
        	if($.osl.user.passwordValidate(usrId, newUsrPw)){
        		return;
        	}
    		
			
			submitUsrPasswordAction();
			
    	});
    	
    	$("#usr1100ShortcutSubmit").click(function(){
    		
    		
    		saveUsrShortcut();
    		
    	});
    	
		var datatableId = "cmm6000PrjTable";
		
		
    	$.osl.datatable.setting(datatableId,{
    		data : {
    			source:{
    				read:{
    					url:"/cmm/cmm6000/cmm6000/selectCmm6000PrjListAjax.do",
    				}
    			}
    		},
    		columns:[
    			{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
    			{field: 'rn', title:"No.", textAlign: 'center', width: 10, autoHide: false, sortable: false},
				{field: 'upPrjNm', title: '프로젝트 그룹 명', textAlign: 'left', width: 150, search: true, sortable: false},
				{field: 'prjId', title: '프로젝트 Id', textAlign: 'center', width: 150, search: true},
				{field: 'prjNm', title: '프로젝트 명', textAlign: 'left', width: 150, autoHide: false, search: true, sortable:false},
    		],
    		actionBtn:{
    			title : $.osl.lang("cmm6000.actionBtn.title"),
    			width : 80,
    			"update" : false,
    			"delete" : false,
    			"click" : true,
    			"insertAllPrjSubSignUsr" : false,
    			"insertSelPrjSubSignUsr" : true,
    		},
    		actionTooltip:{
    			"insertSelPrjSubSignUsr": "대결자 지정",
    			"click" : "대결자 정보 조회"
    		},
    		actionFn:{
    			"click" : function(rowData,datatableId, elem, datatable){
    				selectUsr1000SubSignUsrInfo(rowData);
    			},
    			"insertAllPrjSubSignUsr":function(rowData){
    				var data = {
    	    				
    	    		};
    	    		var options = {
    	    				idKey: "searchUsr",
    						modalTitle: $.osl.lang("req4101.modalTitle.userSearch"),
    						closeConfirm: true,
    						autoHeight:false,
    						modalSize: "xl",
    						callback:[{
    							targetId: "selectUsr",
    							actionFn: function(thisObj){
    								var selUsrInfo = OSLCmm6401Popup.getUsrInfo();
    								if(!$.osl.isNull(selUsrInfo)){
    									var selUsrInfo = JSON.parse(selUsrInfo);
    									var subSignUsrId = selUsrInfo.usrId;
    									
    									
    									var ajaxObj = new $.osl.ajaxRequestAction(
    											{"url":"<c:url value='/usr/usr1000/usr1000/saveUsr1000AllSubSignUsrAjax.do'/>"}
    											,{"subSignUsrId": subSignUsrId});
    									
    									
    									ajaxObj.setFnSuccess(function(data){
    										
    										if(data.errorYn == "Y"){
    											$.osl.alert(data.message,{type: 'error'});
    											
    											$.osl.layerPopupClose();
    										}else{
    											
    											
    						    				$.osl.toastr(data.message);
    											
    										}
    									});
    									
    									
    									ajaxObj.send();
    								}
    							}
    						}]
    	    		};
    	    		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6400/selectCmm6401View.do',data,options);
    			},
    			"insertSelPrjSubSignUsr":function(rowDatas, datatableId, type, rowNum, elem){
    				
					var rowData;
					
					if(type == "list"){
						
						
						var rowLeng = rowDatas.length;
						
						
						if(rowLeng == 0){
							$.osl.alert($.osl.lang("datatable.action.update.nonSelect"));
							return true;
						}
						
						else if(rowLeng > 1){
							$.osl.alert($.osl.lang("datatable.action.update.manySelect",rowLeng));
							return true;
						}else{
							rowData = rowDatas[0];
						}
					}else{
						rowData = rowDatas;
					}
    				
					var data = {
    	    				paramPrjId : rowData.prjId
    	    		};
    	    		var options = {
    	    				idKey: "searchUsr",
    						modalTitle: $.osl.lang("req4101.modalTitle.userSearch"),
    						closeConfirm: true,
    						autoHeight:false,
    						modalSize: "xl",
    						callback:[{
    							targetId: "selectUsr",
    							actionFn: function(thisObj){
    								var selUsrInfo = OSLCmm6401Popup.getUsrInfo();
    								if(!$.osl.isNull(selUsrInfo)){
    									var selUsrInfo = JSON.parse(selUsrInfo);
    									var subSignUsrId = selUsrInfo.usrId;
    									
    									
    									var ajaxObj = new $.osl.ajaxRequestAction(
    											{"url":"<c:url value='/usr/usr1000/usr1000/saveUsr1000SelSubSignUsrAjax.do'/>"}
    											,{"subSignUsrId": subSignUsrId, "paramPrjId": rowData.prjId});
    									
    									
    									ajaxObj.setFnSuccess(function(data){
    										
    										if(data.errorYn == "Y"){
    											$.osl.alert(data.message,{type: 'error'});
    											
    											$.osl.layerPopupClose();
    										}else{
    											
    											
    						    				$.osl.toastr(data.message);
    											
    						    				$.osl.datatable.list[datatableId].targetDt.row("[data-row="+rowNum+"]").nodes().click();    										}
    									});
    									
    									
    									ajaxObj.send();
    								}
    							}
    						}]
    	    		};
    	    		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6400/selectCmm6401View.do',data,options);
    			}
    		},
    		theme:{
    			actionBtnIcon:{
    				"insertSelPrjSubSignUsr": "fa fa-file-signature",
    			}
    		}
    	});
		
		
		$("#subSign").click(function(){
			$.osl.datatable.list[datatableId].targetDt.reload();
		});
	
		
    	$("#"+profileFormId+" #searchReqChargerBtn").click(function(){
    		var data = {
    				
    		};
    		var options = {
    				idKey: "searchUsr",
					modalTitle: $.osl.lang("req4101.modalTitle.userSearch"),
					closeConfirm: true,
					autoHeight:false,
					modalSize: "xl",
					callback:[{
						targetId: "selectUsr",
						actionFn: function(thisObj){
							var selUsrInfo = OSLCmm6401Popup.getUsrInfo();
							if(!$.osl.isNull(selUsrInfo)){
								var selUsrInfo = JSON.parse(selUsrInfo);
								
								
								fnUsrChargerChg(selUsrInfo);
							}
						}
					}]
    		};
    		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6400/selectCmm6401View.do',data,options);
    	});
    };
    
   
   var selectDeptInfo = function(searchDeptNm){
    	
	   var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/adm/amd7000/adm7000/selectAdm7000BeforeCmmDeptList.do'/>", 
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
                    	OSLUsr1000Popup.setDept(thisObj);
                    }
                 }]
			};
		
		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6500/selectCmm6500View.do',data,options);
	};
    
   
    var setDeptInfo = function(deptId, deptNm){
		
    	
    	if(!$.osl.isNull(deptId) && !$.osl.isNull(deptNm)){
    		$("#frUsr1000UserInfo #deptId").val(deptId);
    		$("#frUsr1000UserInfo #deptName").val(deptNm);
    		$("#frUsr1000UserInfo #orgDeptNm").val(deptNm); 
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
 	
   
	var selectUsrInfo = function() {
    	
    	var paramUsrId = $("#usrId").val();
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/usr/usr1000/usr1000/selectUsr1000UsrInfoAjax.do'/>"}
				,{"usrId": paramUsrId});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
		    	$.osl.setDataFormElem(data.usrInfoMap,"frUsr1000UserInfo", ["usrId", "usrNm", "email", "telno", "deptId", "deptName", "etc", "usrImgId", "absStDtm", "absEdDtm"]);
				var usrNm = data.usrInfoMap.usrNm;
				var usrPositionNm = data.usrInfoMap.usrPositionNm;
				var deptNm = data.usrInfoMap.deptName;
				var usrImgId = data.usrInfoMap.usrImgId;
				var currentDeptNm = data.usrInfoMap.currentDeptNm;
				var absStDtm = data.usrInfoMap.absStDtm;
				var absEdDtm = data.usrInfoMap.absEdDtm;
				
				var wkStTm = data.usrInfoMap.wkStTm;
				var wkEdTm = data.usrInfoMap.wkEdTm;
				var bkStTm = data.usrInfoMap.bkStTm;
				var bkEdTm = data.usrInfoMap.bkEdTm;
				
				
				if($.osl.isNull(wkStTm) || $.osl.isNull(wkEdTm) || $.osl.isNull(bkStTm) || $.osl.isNull(bkEdTm)){
					
					$("#wkStTm").val("09:00");
					$("#wkEdTm").val("18:00");
					$("#bkStTm").val("12:00");
					$("#bkEdTm").val("13:00");
				
				
				}else{
					
					$("#wkStTm").val(wkStTm.insertTimeColon());
					$("#wkEdTm").val(wkEdTm.insertTimeColon());
					$("#bkStTm").val(bkStTm.insertTimeColon());
					$("#bkEdTm").val(bkEdTm.insertTimeColon());
				}
				
				
				
				if(!$.osl.isNull(absStDtm) && !$.osl.isNull(absEdDtm)){
					
	   				$("#subSignRange").data("daterangepicker").setStartDate(absStDtm);
	   				$("#subSignRange").data("daterangepicker").setEndDate(absEdDtm);
				}
				
   				
   				if($.osl.isNull(absStDtm) || $.osl.isNull(absEdDtm)){
   					$("#subSignRange").val("");
   				}
   				
				
		    	$("#orgEmail").val(data.usrInfoMap.email);
				
				$("#orgDeptNm").val(data.usrInfoMap.deptName);
				
				
				var usrImgUrl = $.osl.user.usrImgUrlVal(usrImgId);
				$("#usrImage").attr("data-before-image", usrImgUrl); 
				$("#usrImage").css("background-image", "url("+usrImgUrl+"&"+new Date().getTime()+")");
						
				
				if(!$.osl.isNull(usrImgId) && data.usrImgFileExist == "Y"){
					
					$("#usrImg_avatar").addClass("kt-avatar--changed");
				}else{
					$("#usrImg_avatar").removeClass("kt-avatar--changed");	
				}
				
				
				$("#usrDutyCd").attr("data-osl-value", data.usrInfoMap.usrDutyCd);
				$("#usrPositionCd").attr("data-osl-value", data.usrInfoMap.usrPositionCd);

				
				$("#btn_imageReset").addClass("d-none");
				
				
				$("#profileUsrNm").text(usrNm);
				$("#profileUsrNm").attr("title", usrNm);
				$("#profileUsrPositionNm").text(usrPositionNm);
				$("#profileUsrPositionNm").attr("title", usrPositionNm);
				$("#profileUsrDeptNm").text(currentDeptNm);
				$("#profileUsrDeptNm").attr("title", deptNm);
				$("#profileUsrImg").attr("src", usrImgUrl+"&"+new Date().getTime());
				
				
				$("#pwModifyDtm").text(data.usrInfoMap.pwModifyDtm);
				
				
				autosize.update($("#etc"));
			}
		});
		
		
		ajaxObj.send();
	};
	
	
   
    var submitUsrProfileAction = function(){
    	
		var profileForm = $('#'+profileFormId);
  		
		
		if (!profileForm.valid()) {
			return;
		}
		
		$.osl.confirm(pageTypeData["usrProfile"]["saveString"],null,function(result) {
	        if (result.value) {
	        	
	        	
	        	var subSignRange = $("#subSignRange").val();
	        	if(!$.osl.isNull(subSignRange) && ($.osl.isNull($("#absStDtm").val()) || $.osl.isNull($("#absEdDtm").val()))){
	        		
					var absStDtm = subSignRange.split(" - ")[0];	        			
					var absEdDtm = subSignRange.split(" - ")[1];
					
					$("#absStDtm").val(absStDtm);
					$("#absEdDtm").val(absEdDtm);
	        	}
	        	
	        	var formArray = profileForm.serializeArray();
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
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/usr/usr1000/usr1000/updateUsr1000UsrProfileAjax.do'/>", 
	    			"loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    			}else{
	    				
	    				$.osl.toastr(data.message);
    					
	    				selectUsrInfo();
	    			}
	    		});
	    		
	    		
	    		ajaxObj.send();
	        }
	    });
    };
    
  	
	String.prototype.insertTimeColon = function() {
        return this.slice(0, 2) + ":" + this.slice(2);
    }
    
   
    var submitUsrPasswordAction = function(){
    	
		var passwordForm = $('#'+passwordFormId);
  		
		
		if (!passwordForm.valid()) {
			return;
		}
		
		$.osl.confirm(pageTypeData["usrPassword"]["saveString"],null,function(result) {
			
	        if (result.value) {
	        	
	        	var formArray = passwordForm.serializeArray();
	        	formArray.push({"name":"usrId", "value":$("#usrId").val()});
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/usr/usr1000/usr1000/updateUsr1000PasswordChangeAjax.do'/>", 
	    			"loadingShow": false, "async": false}, formArray);
	    		
	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			
					if(data.errorYn == "Y"){
						$.osl.alert(data.message, {type:"warning"});
						
						$.osl.layerPopupClose();
					
					}else if(data.checkYn == "Y"){
						$.osl.alert(data.message, {type:"warning"});
					}else{
						$.osl.toastr(data.message);
						
						
						$("#frUsr1000UserPassword")[0].reset();
					}
	    		});
	    		
	    		
	    		ajaxObj.send();
	        }
	    });
    	
    };
	
    
    var selectShortCutInfo = function(){
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/usr/usr1000/usr1000/selectUsr1000ShortcutInfoAjax.do'/>", "async": false});
    	
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
    			$.osl.alert(data.message, {type:'error'});
    			
    			
    			$.osl.layerPopupClose();
    		}else{
    			
    			$.osl.setDataFormElem(data.shorcutInfoMap,"frUsr1000UserShortCut");
				
    			
    			var keyCodeList = document.getElementsByClassName("keyCode");
    			
    			
    			var str = "";
    			
				data.shortcutInfo.forEach(function(value, index){
					
					if(index == 5){
						
					}else{
		    			str +=
		    				'<div class="form-group form-group-last row kt-margin-b-20 kt-margin-b-25-mobile">'
								+'<label class="col-xl-4 col-lg-3 col-md-12 col-sm-12 col-form-label osl-align-left--imp"><span class="font-weight-bolder" data-lang-cd="usr1100.title.shortcut'+$.osl.escapeHtml(value.actionCd)+'">'+$.osl.escapeHtml(value.subCdNm)+'</span></label>'
								+'<span class="kt-switch kt-switch--outline kt-switch--icon kt-switch--info col-xl-2 col-lg-2 col-md-12 col-sm-12" data-toggle="kt-tooltip" data-placement="bottom" title="팝업 시 동작 여부">'
									+'<label>'
										+'<input class="popupActionCd" actionCd='+$.osl.escapeHtml(value.actionCd)+' type="checkbox"  checked="checked">'
										+'<span></span>'
									+'</label>'
								+'</span>'
								+'<div class="col-xl-6 col-lg-7 col-md-12 col-sm-12">'
									+'<div class="input-group">'
										+'<input type="text" actionCd='+$.osl.escapeHtml(value.actionCd)+' class="form-control keyCode" readonly="readonly" placeholder="단축키 입력" value="'+$.osl.escapeHtml(value.shortcut)+'"">'
										+'<div class="input-group-append">'
											+'<button class="btn btn-outline-primary emptyBtn" id="'+$.osl.escapeHtml(value.actionCd)+'" type="button"><i class="fa fa-ban text-primary"></i><span data-lang-cd="usr1100.btn.dontuse">사용안함</span></button>'
										+'</div>'
									+'</div>'
								+'</div>'
							+'</div>'
					}
				});
				
				
				$("#shortcutDiv").html(str);
				
				
				KTApp.initTooltips();
				
				
				$.osl.langConvert("#shortcutDiv");
				
				
				$(".keyCode").each(function(){
					if($(this).val() == " "){
						$(this).val("");
					}
				});
				
				
				data.shortcutInfo.forEach(function(value, index){
					if(value.popupActionCd == "01"){
						$("input[type='checkbox'][actionCd="+value.actionCd+"]").attr("checked", true);
					}else{
						$("input[type='checkbox'][actionCd="+value.actionCd+"]").attr("checked", false);
					}
				});
				
				
		        $(".emptyBtn").on("click", function(){
		        	var actionCd = $(this).attr("id");
		        	$("input[type='text'][actionCd="+actionCd+"]").val("");
		        	
		        });
				
				
		        $(window).on('beforeunload', function(e) {
				       return true;
				});
		        
		      	
		        $(".keyCode").keydown(function(event){
		        	
		        	
		        	event.preventDefault();
		        	
		        	
		        	if(event.keyCode == 17){
		        		
		        		return;
		        	}
		        	if(event.keyCode == 16){
		        		
		        		return;
		        	}
		        	if(event.keyCode == 18){
		        		
		        		return;
		        	}
		        	
		        	
		        	if(event.keyCode < 110 && !event.ctrlKey && !event.shiftKey && !event.altKey ){
		        		$.osl.alert("Fn키와 특수문자를 제외하고 단일 입력이 불가능합니다.")
		        		return;
		        	}
		        	
		        	if(event.key == null){
		        		return;
		        	}
		        	
		        	var shortCut = new Array();
		        	
		        	if(event.ctrlKey){
		        		shortCut.push("Ctrl");
		        	}
		        	if(event.shiftKey){
		        		shortCut.push("Shift");
		        	}
		        	if(event.altKey){
		        		shortCut.push("Alt");
		        	}
		        	
		        	shortCut.push(event.key.toUpperCase());
		        	
		        	
		        	var shortcutList = new Array();
		    		$.each($(".keyCode"),function(){
		    			shortcutList.push($(this).val());
		    		});
		    		
		    		
		    		if($(this).val() != shortCut.join(" + ")){
			    		if(shortcutList.includes(shortCut.join(" + "))){
			    			$.osl.alert("이미 사용 중인 키 조합입니다.");
			    			$(this).val("");
			    			return;
			    		}
		    		}
		    		
		    		
		    		$(this).val(shortCut.join(" + "));
		    		
		        })

    		}
    		
    	});
    	
    	
		ajaxObj.setFnError(function(xhr, status, err){
			data = JSON.parse(data);
			jAlert(data.message, "알림창");
		});
		
		
		ajaxObj.send();
    }
    
    
    var saveUsrShortcut = function(){
    	
		var form = $('#'+shortcutFormId);
  		
		
		if (!form.valid()) {
			return;
		}
		
		
		var _shortcutList = [];
		
		$.each($(".keyCode"),function(index, element){
			
			var shortcutObject = new Object();
			
			var actionCd = $(this).attr("actionCd");
			
			shortcutObject.actionCd = actionCd;
			
			
			var keycode = $(this).val().replace(" ", "").split("+");
			
			
			if(keycode.includes("Ctrl")){
				shortcutObject.ctrlCd = "01";
			}else{
				shortcutObject.ctrlCd = "02";
			}
			
			if(keycode.includes("Shift")){
				shortcutObject.shiftCd = "01";
			}else{
				shortcutObject.shiftCd = "02";
			}
			
			if(keycode.includes("Alt")){
				shortcutObject.altCd = "01";	
			}else{
				shortcutObject.altCd = "02";
			}
			
			if($("input[type='checkbox'][actionCd="+actionCd+"]").is(":checked") == true){
        		shortcutObject.popupActionCd = "01"	
        	}else{
        		shortcutObject.popupActionCd = "02"
        	}
			
			
			shortcutObject.keyCd = keycode[keycode.length-1].replace(" ", "");
			
			_shortcutList.push(shortcutObject);
			
		});
		
		var data ={
				shortcutList : JSON.stringify(_shortcutList),
		}
		
		$.osl.confirm("정말 수정하시겠습니까?",null,function(result) {
			
	        if (result.value) {
	        	
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction(
	    				{"url":"<c:url value='/usr/usr1000/usr1000/saveUsr1000ShortcutAjax.do'/>"},
	    				data);
	    		
	    		
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				
	    				$.osl.alert(data.message,{type: 'error'});
	    				
						$.osl.layerPopupClose();
	    				
	    			}else{
	    				
	    				
	    				$.osl.toastr(data.message);
    					
	    			}
	    		});
	    		
	    		
	    		ajaxObj.send();
	    		
	    		
	    		$(document).off("keydown");
	    		$.osl.init();
	    		
	        }
	    });
    }
    	
	
	var fnUsrChargerChg = function(chargerInfo){
		var usrId = chargerInfo.usrId;
		var usrNm = chargerInfo.usrNm;
		var email = chargerInfo.email;
		var usrImgId = chargerInfo.usrImgId;
		
		
		$("#"+profileFormId+" #reqChargerId").val(usrId);
		$("#"+profileFormId+" #reqChargerNm").val(usrNm);

		
		$("#"+profileFormId+" #nextFlowChargerNm").text(usrNm);
		$("#"+profileFormId+" #nextFlowEmail").text(email);
		$("#"+profileFormId+" #nextFlowChargerImg").attr("src",$.osl.user.usrImgUrlVal(usrImgId));
	};
	
	
	var selectUsr1000SubSignUsrInfo = function(rowData){
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/usr/usr1000/usr1000/selectUsr1000SubSignUsrInfoAjax.do'/>"},
				{paramPrjId:rowData.prjId });
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
				
			}else{
				
				$("#"+subSignUsrFormId)[0].reset();
				
				
		    	$.osl.setDataFormElem(data.subSignUsrInfo, subSignUsrFormId, ["subSignUsrNm" , "subSignUsrPrjNm", "subSignUsrEmail", "subSignUsrTelno" , "subSignUsrDeptNm", "subSignUsrPositionCd", "subSignUsrDutyCd"]);
			
				
				if($.osl.isNull(data.subSignUsrInfo.subSignUsrDutyCd)){
					$("#subSignUsrDutyCd").val("-");
				}
				
				if($.osl.isNull(data.subSignUsrInfo.subSignUsrPositionCd)){
					$("#subSignUsrPositionCd").val("-");
				}
			}
		});
		
		
		ajaxObj.send();
	}
	
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
	OSLUsr1000Popup.init();
});

	
</script>
