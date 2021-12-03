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
	
	// 이미지 avate 생성
	new KTAvatar("usrImg_avatar");
	
	//form validate 주입
	var profileFormValidate = $.osl.validate(profileFormId);
	var passwordFormValidate = $.osl.validate(passwordFormId);
	
	var isEmailChk = false; // 이메일 중복체크 여부
	var beforeEmail; // 중복체크 당시 이메일 값
	
	
	// 메시지 데이터
	var pageTypeData = {
			// 사용자 프로필 메시지
			"usrProfile":{
				"saveString": "사용자 프로필을 수정하시겠습니까?",
				"emptyEmailString" : "이메일을 입력해주세요.",
				"currentEmailString" : "현재 사용자의 이메일입니다.",
				"emailDuplChkString" : "이메일 중복체크를 해주세요.",
				"emptyDeptInfo" : "부서검색 버튼을 클릭하여 부서를 선택해주세요.",
				"saveBtnString": "프로필 수정 완료"
			},
			// 비밀번호 변경 메시지
			"usrPassword":{
				"saveString": "비밀번호를 변경하시겠습니까?",
				"withinYearPwString": "1년이내 사용한 비밀번호는 사용할 수 없습니다.",
				"saveBtnString": "비밀번호 변경 완료"
			},
	};
	
    // Private functions
    var documentSetting = function () {
    	
    	//포틀릿 셋팅
    	new KTPortlet('usr1100ShortcutInfo', $.osl.lang("portlet"));
    	
    	// adm2001 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "ADM00007", useYn: "Y",targetObj: "#usrPositionCd", comboType:"S"}, // 직급 공통코드
			{mstCd: "ADM00008", useYn: "Y",targetObj: "#usrDutyCd", comboType:"S"}, 	// 직책 공통코드
		];
    	
    	// 버튼 문구 세팅
		$("#usr1000ProfileSubmit").text(pageTypeData["usrProfile"]["saveBtnString"]);
		$("#usr1000PasswordSubmit").text(pageTypeData["usrPassword"]["saveBtnString"]);

  		//공통코드 채우기
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
  		
		// 개인정보 수정 팝업 오픈시 KTAvatar 대상 div의 기본 이미지를 data로 세팅한다.
		var defaultImg = $.osl.user.usrImgUrlVal(null);
		$("#usrImage").attr("data-default-img", defaultImg);	
		
		// textarea 자동 사이즈 조절 설정
    	autosize($("#etc"));
		
    	//datepicker 세팅
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
    	
		//timepicker 셋팅
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
		
		//timepicker 셋팅
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
		
		//timepicker 셋팅
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
		
		//timepicker 셋팅
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
        
		// 사용자 정보 조회
		selectUsrInfo();
  		
    	// aside 메뉴 변경
    	$("#myPageAsideMenu li.kt-nav__item").click(function(){
    		
    		var menuNm = $(this).data("aside-menu");
    		
    		// 사용자 프로필 메뉴 클릭 시 사용자 정보 조회
			if(!$(this).hasClass("active") && menuNm == "usrProfile"){
				selectUsrInfo();
			}
    		
    		// 단축키 설정 메뉴 클릭시 단축키 정보 조회
			if(!$(this).hasClass("active") && menuNm == "usrShortCut"){
				selectShortCutInfo();
				//new KTPortlet('usr1100ShortcutInfo', $.osl.lang("portlet"));
			}
			
    		// 비밀번호 변경 화면 form 초기화
    		if(menuNm == "passwordChange"){
    			$("#frUsr1000UserPassword")[0].reset();
    			$("#frUsr1000UserPassword").find("input[type='password']").removeClass("is-invalid");
    			$("#frUsr1000UserPassword").find("div.error").remove();
    		}
    		
    		// 클릭한 메뉴 표시
    		$("#myPageAsideMenu li.kt-nav__item").removeClass("active");
    		$(this).addClass("active");
    		
    		// 클릭한 메뉴에 맞는 우측 영역을 보여준다.
			$("#personalInfo_right_wrapper").children(".kt-portlet").addClass("d-none");
			$("#personalInfo_right_wrapper").children("#subSignUsrTab").addClass("d-none");
			$("#personalInfo_right_wrapper").children("[data-aside-menu="+menuNm+"]").removeClass("d-none");
			
    	});
    	
    	// 이미지 삭제 버튼 클릭
    	$(".kt-avatar .kt-avatar__cancel").click(function(){
    		// 기존 이미지 되돌리기 버튼 show
    		$("#btn_imageReset").removeClass("d-none");
    	});
    	
    	// 사용자 이미지 변경시
		$('#usrImgFile').change(function() {
			var files = $("#usrImgFile")[0].files;
			if(!$.osl.isNull(files)){
				// 기존 이미지 되돌리기 버튼 show
	    		$("#btn_imageReset").removeClass("d-none");
			}		
		});
    	
    	// 이미지 되돌리기 버튼 클릭
    	$("#btn_imageReset").click(function(){
    		
    		var beforeImg = $("#usrImage").data("before-image");
    		
    		// 기존 이미지 URL이 있을경우
    		if(!$.osl.isNull(beforeImg)){
	    		$("#usrImage").css("background-image", "url("+beforeImg+")"); // 기존 이미지로 변경
	    		$("#usrImage").attr("data-img-delete-yn", "N"); // 이미지 삭제여부 값 N으로 변경
	    		$("#btn_imageReset").addClass("d-none"); // 되돌리기 버튼 hide
	    		$("#usrImg_avatar").addClass("kt-avatar--changed"); // 이미지 삭제버튼 show
	    		
	    		// 파일 초기화
				var agent = navigator.userAgent.toLowerCase();
				if (agent.indexOf("chrome") != -1 || agent.indexOf("safari") != -1 || agent.indexOf("firefox") != -1) {
					$("#usrImgFile").val("");
				}else{
					$("#usrImgFile").replaceWith($("#excelFile").clone(true));
				} 
    		}
    	});
    		
    	// 이메일 중복체크 클릭
    	$("#btn_emailChk").click(function(){
    		
    		var inEmail = $("#email").val();
    		var orgEmail = $("#orgEmail").val(); // 사용자 수정 팝업에서 수정 전 이메일
    		
    		// 유효성 걸렸을경우 중복체크 하지 않음
    		if($("#email").hasClass("is-invalid")){
    			return;
    		}
    		
    		if($.osl.isNull(inEmail)){
    			$.osl.alert(pageTypeData["usrProfile"]["emptyEmailString"]);
    			return;
    		}
    		
    		// 기존 이메일을 그대로 사용할 경우
    		if(orgEmail == inEmail){
    			$.osl.alert(pageTypeData["usrProfile"]["currentEmailString"]);
    			return;
    		}
    		
    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/usr/usr1000/usr1000/selectUsr1000emailChRepAjax.do'/>", 
    			"loadingShow": false}, {"email":inEmail});
    		//AJAX 전송 성공 함수
    		ajaxObj.setFnSuccess(function(data){
    			
    			// 데이터 조회 에러
    			if(data.errorYn == "Y"){
    				$.osl.alert(data.message,{type: 'error'});
    				//모달 창 닫기
					$.osl.layerPopupClose();
    			// 중복된 이메일 있을 경우
    			}else if(data.emailChkYn == "Y"){
    				$.osl.alert(data.message,{type: 'warning'});
    				isEmailChk = false;
    			// 중복된 이메일 없을 경우
    			}else{
    				$.osl.alert(data.message);
    				beforeEmail = inEmail;  // 중복체크 이후 이메일이 변경 되었는지 체크하기 위한 값
    				isEmailChk = true;
    			}
    		});
    		
    		//AJAX 전송
    		ajaxObj.send();
    	});
    	
    	// 조직명 input 엔터키 이벤트
    	$("#deptName").keypress(function(e){
    		if (e.which === 13){
    			$("#btn_searchDept").click();
			}
    	});
    	
    	// 부서검색 버튼 클릭
    	$("#btn_searchDept").click(function(){
    		
    		var searchDeptNm = $.trim($("#deptName").val());
    		if($.osl.isNull(searchDeptNm)){
    			// 조직선택 팝업 오픈
    			callCommonDeptPopup();  			
    		}else{
    			if(searchDeptNm.lastIndexOf(">") > 0){
    				// 상위조직 명을 제외한 조직명을 검색어로 넘긴다.
    				searchDeptNm = searchDeptNm.substring(searchDeptNm.lastIndexOf(">")+1);
    			}
	    		// 조직검색
	    		selectDeptInfo(searchDeptNm);
    		}
    	});
    	
    	// 부서검색 버튼 클릭
    	$("#btn_endSubSign").click(function(){
    		
    		//부재 기간 비우기
    		$("#subSignRange").val("");
    		$("#absStDtm").val("");
    		$("#absEdDtm").val("");
    		
    	});
    	
    	// 사용자 프로필 수정완료 버튼 클릭
    	$("#usr1000ProfileSubmit").click(function(){
			
    		var profileForm = $('#'+profileFormId);
			var inUsrPw = $("#usrPw").val(); 			// 입력한 비밀번호
			var inEmail = $("#email").val(); 			// 입력한 이메일
   			var orgEmail = $("#orgEmail").val(); 		// 수정 전 이메일
			var deptId = $("#deptId").val(); 			// 조직 ID
			var deptNm = $("#deptName").val(); 			// 조직명
			var orgDeptNm = $("#orgDeptNm").val(); 		// 조직선택 팝업에서 선택된 조직명, 조직명 변경유무 체크에 사용
			
    		//폼 유효 값 체크
    		if (!profileForm.valid()) {
    			return;
    		}
    		
			// 수정전 이메일과 현재 입력이메일이 다를경우 이메일 중복체크 확인
			if(orgEmail != inEmail){
				if(!isEmailChk){
					$.osl.alert(pageTypeData["usrProfile"]["emailDuplChkString"], {type:"warning"});
	        		return;
    			}
			}
    			
   			// 조직 유효성 체크, 조직검색 후 조직명이 변경되었을 경우체크
    		if(validatCheckDeptNm(orgDeptNm, deptNm)){
    			return;
    		}
    			
   			// 사용자 수정
           	submitUsrProfileAction();
    	});
    	
    	// 사용자 비밀번호 수정완료 버튼 클릭
    	$("#usr1000PasswordSubmit").click(function(){
    		
    		var usrId = $("#usrId").val();
    		var newUsrPw = $("#newUsrPw").val();
    		
			// 비밀번호 유효성 체크
        	if($.osl.user.passwordValidate(usrId, newUsrPw)){
        		return;
        	}
    		
			// 사용자 비밀번호 변경
			submitUsrPasswordAction();
			
    	});
    	//단축키 수정
    	$("#usr1100ShortcutSubmit").click(function(){
    		
    		//단축키 수정
    		saveUsrShortcut();
    		
    	});
    	
		var datatableId = "cmm6000PrjTable";
		
		//데이터 테이블 셋팅
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
    									
    									//AJAX 설정
    									var ajaxObj = new $.osl.ajaxRequestAction(
    											{"url":"<c:url value='/usr/usr1000/usr1000/saveUsr1000AllSubSignUsrAjax.do'/>"}
    											,{"subSignUsrId": subSignUsrId});
    									
    									//AJAX 전송 성공 함수
    									ajaxObj.setFnSuccess(function(data){
    										
    										if(data.errorYn == "Y"){
    											$.osl.alert(data.message,{type: 'error'});
    											//모달 창 닫기
    											$.osl.layerPopupClose();
    										}else{
    											
    											//저장 성공
    						    				$.osl.toastr(data.message);
    											
    										}
    									});
    									
    									//AJAX 전송
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
						
						//선택 레코드 수
						var rowLeng = rowDatas.length;
						
						//선택 레코드 없는 경우
						if(rowLeng == 0){
							$.osl.alert($.osl.lang("datatable.action.update.nonSelect"));
							return true;
						}
						//선택 레코드 2개이상인경우 alert 띄우기
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
    									
    									//AJAX 설정
    									var ajaxObj = new $.osl.ajaxRequestAction(
    											{"url":"<c:url value='/usr/usr1000/usr1000/saveUsr1000SelSubSignUsrAjax.do'/>"}
    											,{"subSignUsrId": subSignUsrId, "paramPrjId": rowData.prjId});
    									
    									//AJAX 전송 성공 함수
    									ajaxObj.setFnSuccess(function(data){
    										
    										if(data.errorYn == "Y"){
    											$.osl.alert(data.message,{type: 'error'});
    											//모달 창 닫기
    											$.osl.layerPopupClose();
    										}else{
    											
    											//저장 성공
    						    				$.osl.toastr(data.message);
    											
    						    				$.osl.datatable.list[datatableId].targetDt.row("[data-row="+rowNum+"]").nodes().click();    										}
    									});
    									
    									//AJAX 전송
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
		
		//대결자 지정 페이지 이동 시 데이터 테이블 리로드
		$("#subSign").click(function(){
			$.osl.datatable.list[datatableId].targetDt.reload();
		});
	
		//담당자 명 검색버튼 클릭 시
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
								
								//담당자 정보 교체
								fnUsrChargerChg(selUsrInfo);
							}
						}
					}]
    		};
    		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6400/selectCmm6401View.do',data,options);
    	});
    };
    
   /**
    * function 명 	: selectDeptInfo
    * function 설명	: 조직명을 검색하여 조직을 찾는다. 
    * 				    검색된 조직이 1개일 경우 조직 정보를 화면에 세팅하고, 2개 이상일경우 조직선택 팝업을 오픈한다.
    * @param searchDeptNm : 검색할 조직명
    */
   var selectDeptInfo = function(searchDeptNm){
    	
	   var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/adm/amd7000/adm7000/selectAdm7000BeforeCmmDeptList.do'/>", 
			"loadingShow": false}, {"searchDeptNm":$.trim(searchDeptNm)});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				var deptList = data.deptList;
				if(deptList.length == 1){
					// 검색된 조직이 1건일 경우 세팅
					setDeptInfo(deptList[0].deptId, deptList[0].deptName);
				}else{
					// 팝업호출
					callCommonDeptPopup(searchDeptNm);
				}
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
   };
    
   /**
 	* function 명 	: callCommonDeptPopup
	* function 설명	: 조직선택 공통 팝업을 호촐한다.
	* @param searchDeptNm : 팝업에서 검색할 조직명
	*/
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
    
   /**
 	* function 명 	: setDeptInfo
	* function 설명	: 조직선택 팝업에서 선택한 조직정보를 사용자 등록&수정 화면에 세팅한다.
	* @param deptId : 선택한 조직 ID
	* @param deptNm : 선택한 조직 명 ID
	*/
    var setDeptInfo = function(deptId, deptNm){
		
    	// 선택한 조직 정보값이 있을 경우에만 세팅
    	if(!$.osl.isNull(deptId) && !$.osl.isNull(deptNm)){
    		$("#frUsr1000UserInfo #deptId").val(deptId);
    		$("#frUsr1000UserInfo #deptName").val(deptNm);
    		$("#frUsr1000UserInfo #orgDeptNm").val(deptNm); // 등록&수정 시 조직명이 변경되었는지 체크하기 위한 값
    	}
    };
    
    
   /**
 	* function 명 	: validatCheckDeptNm
	* function 설명	: 사용자 등록&수정 전 조직명의 유효성을 체크한다. 
	*				   사용자가 조직 선택 팝업에서 선택한 조직명을 임의로 수정했을 경우 경고문구를 표시한다.
	*
	* @param orgDeptNm : 조직선택 팝업에서 선택한 조직명, 해당 조직명은 상위조직을 포함한다. (ex, 전체 > 오픈소프트랩 > 부설연구소)
	* @param deptNm : 현재 사용자 등록&수정 팝업에 입력된 조직명
	*/
    var validatCheckDeptNm = function(orgDeptNm, deptNm){
    	
    	// 조직 유효성 체크, 조직검색 후 조직명이 변경되었을 경우체크
		if($.trim(orgDeptNm) != $.trim(deptNm)){
			// 경고 문구 출력, 경고문구에 원본 조직명을 표시해준다.
			$("#deptName").next("div.input-group-append").after(
					'<div class="invalid-feedback invalid-dept" style="display:block">정확한 부서명을 입력하거나, 부서검색을 하여 다시 부서를 선택해주세요.</div>'
					+ '<div class="invalid-feedback invalid-dept" style="display:block">(원본 : '+$.osl.escapeHtml(orgDeptNm)+')</div>'
			);
			
			$("#deptName").addClass("is-invalid");
			return true;
		}
    	
    	return false;
    };
 	
   /**
 	* function 명 	: selectUsrInfo
	* function 설명	: 사용자 정보를 조회하여 팝업에 세팅한다.
	*/
	var selectUsrInfo = function() {
    	
    	var paramUsrId = $("#usrId").val();
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/usr/usr1000/usr1000/selectUsr1000UsrInfoAjax.do'/>"}
				,{"usrId": paramUsrId});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				// 사용자 정보 세팅
		    	$.osl.setDataFormElem(data.usrInfoMap,"frUsr1000UserInfo", ["usrId", "usrNm", "email", "telno", "deptId", "deptName", "etc", "usrImgId", "absStDtm", "absEdDtm"]);
				var usrNm = data.usrInfoMap.usrNm;
				var usrPositionNm = data.usrInfoMap.usrPositionNm;
				var deptNm = data.usrInfoMap.deptName;
				var usrImgId = data.usrInfoMap.usrImgId;
				var currentDeptNm = data.usrInfoMap.currentDeptNm;
				var absStDtm = data.usrInfoMap.absStDtm;
				var absEdDtm = data.usrInfoMap.absEdDtm;
				//업무 시간 및 휴식 시간 데이터 입력
				var wkStTm = data.usrInfoMap.wkStTm;
				var wkEdTm = data.usrInfoMap.wkEdTm;
				var bkStTm = data.usrInfoMap.bkStTm;
				var bkEdTm = data.usrInfoMap.bkEdTm;
				
				//설정 시간이 없는 경우
				if($.osl.isNull(wkStTm) || $.osl.isNull(wkEdTm) || $.osl.isNull(bkStTm) || $.osl.isNull(bkEdTm)){
					//기본값
					$("#wkStTm").val("09:00");
					$("#wkEdTm").val("16:00");
					$("#bkStTm").val("12:00");
					$("#bkEdTm").val("13:00");
				
				//설정시간이 있는 경우
				}else{
					//저장된 값 입력
					$("#wkStTm").val(wkStTm.insertTimeColon());
					$("#wkEdTm").val(wkEdTm.insertTimeColon());
					$("#bkStTm").val(bkStTm.insertTimeColon());
					$("#bkEdTm").val(bkEdTm.insertTimeColon());
				}
				
				
				//시작일과 종료일 둘다 존재하면
				if(!$.osl.isNull(absStDtm) && !$.osl.isNull(absEdDtm)){
					//시작일 - 종료일 입력
	   				$("#subSignRange").data("daterangepicker").setStartDate(absStDtm);
	   				$("#subSignRange").data("daterangepicker").setEndDate(absEdDtm);
				}
				
   				//시작일 종료일 없으면 비우기
   				if($.osl.isNull(absStDtm) || $.osl.isNull(absEdDtm)){
   					$("#subSignRange").val("");
   				}
   				
				// 이전 이메일 정보 세팅, 사용자 수정 시 이메일 중복체크를 판단하기 위해 사용
		    	$("#orgEmail").val(data.usrInfoMap.email);
				// 사용자 수정 시 조직명이 변경되었는지 체크하기 위한 값 세팅
				$("#orgDeptNm").val(data.usrInfoMap.deptName);
				
				// 사용자 이미지 세팅
				var usrImgUrl = $.osl.user.usrImgUrlVal(usrImgId);
				$("#usrImage").attr("data-before-image", usrImgUrl); // 되돌리기 버튼 클릭 시 이전이미지로 되돌아가기 위한 url 세팅
				$("#usrImage").css("background-image", "url("+usrImgUrl+"&"+new Date().getTime()+")");
						
				// 사용자 이미지 파일 ID 및 이미지 파일정보가 DB에 존재할 경우
				if(!$.osl.isNull(usrImgId) && data.usrImgFileExist == "Y"){
					// 이미지 삭제할 수 있도록 삭제버튼 나타내기
					$("#usrImg_avatar").addClass("kt-avatar--changed");
				}else{
					$("#usrImg_avatar").removeClass("kt-avatar--changed");	
				}
				
				// combobox selected setting
				$("#usrDutyCd").attr("data-osl-value", data.usrInfoMap.usrDutyCd);
				$("#usrPositionCd").attr("data-osl-value", data.usrInfoMap.usrPositionCd);

				// 이미지 되돌리기 버튼 hide
				$("#btn_imageReset").addClass("d-none");
				
				// 개인정보 수정 좌측 상단 사용자 프로필 정보 세팅
				$("#profileUsrNm").text(usrNm);
				$("#profileUsrNm").attr("title", usrNm);
				$("#profileUsrPositionNm").text(usrPositionNm);
				$("#profileUsrPositionNm").attr("title", usrPositionNm);
				$("#profileUsrDeptNm").text(currentDeptNm);
				$("#profileUsrDeptNm").attr("title", deptNm);
				$("#profileUsrImg").attr("src", usrImgUrl+"&"+new Date().getTime());
				
				// 사용자 비밀번호 변경일시 세팅
				$("#pwModifyDtm").text(data.usrInfoMap.pwModifyDtm);
				
				// textarea 입력된 내용에 따라 size 조정
				autosize.update($("#etc"));
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
	
	
   /**
 	* function 명 	: submitUsrProfileAction
	* function 설명	: 사용자 프로필을 수정한다.
	*/
    var submitUsrProfileAction = function(){
    	
		var profileForm = $('#'+profileFormId);
  		
		//폼 유효 값 체크
		if (!profileForm.valid()) {
			return;
		}
		
		$.osl.confirm(pageTypeData["usrProfile"]["saveString"],null,function(result) {
	        if (result.value) {
	        	
	        	//부재 기간 값이 제대로 들어가지 않았을 경우 다시 넣어주기
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
	        		// formData에 추가
	        		fd.append(map.name, map.value);
	        	});
	        	
	        	var imgFile = $("#usrImgFile")[0].files;
	        	// 파일을 추가했을 경우
	        	if(!$.osl.isNull(imgFile)){
		        	fd.append('file', imgFile[0]);
	        	}
	        	
	        	// 이미지 삭제여부 값
	        	// 이미지를 삭제하고 default image로 변경하여 저장시 DB의 기존 파일정보를 삭제한다.
	        	var imgDelYn = $("#usrImage").data("img-delete-yn");
	        	if($.osl.isNull(imgDelYn)){
	        		imgDelYn = "N";
	        	}
	        	
	        	fd.append('defaultImgYn', imgDelYn);
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/usr/usr1000/usr1000/updateUsr1000UsrProfileAjax.do'/>", 
	    			"loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false},fd);

	    		//AJAX 전송 성공 함수
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				$.osl.alert(data.message,{type: 'error'});
	    				//모달 창 닫기
						$.osl.layerPopupClose();
	    			}else{
	    				//수정 성공
	    				$.osl.toastr(data.message);
    					// 사용자 정보 재조회
	    				selectUsrInfo();
	    			}
	    		});
	    		
	    		//AJAX 전송
	    		ajaxObj.send();
	        }
	    });
    };
    
  	//시간사이에 :입력을 위해
	String.prototype.insertTimeColon = function() {
        return this.slice(0, 2) + ":" + this.slice(2);
    }
    
   /**
 	* function 명 	: submitUsrPasswordAction
	* function 설명	: 사용자 비밀번호를 변경한다.
	*/
    var submitUsrPasswordAction = function(){
    	
		var passwordForm = $('#'+passwordFormId);
  		
		//폼 유효 값 체크
		if (!passwordForm.valid()) {
			return;
		}
		
		$.osl.confirm(pageTypeData["usrPassword"]["saveString"],null,function(result) {
			
	        if (result.value) {
	        	
	        	var formArray = passwordForm.serializeArray();
	        	formArray.push({"name":"usrId", "value":$("#usrId").val()});
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/usr/usr1000/usr1000/updateUsr1000PasswordChangeAjax.do'/>", 
	    			"loadingShow": false, "async": false}, formArray);
	    		
	    		//AJAX 전송 성공 함수
	    		ajaxObj.setFnSuccess(function(data){
	    			// 에러시 alert
					if(data.errorYn == "Y"){
						$.osl.alert(data.message, {type:"warning"});
						//모달 창 닫기
						$.osl.layerPopupClose();
					// 비밀번호 불일치 or 새 비밀번호가 1년이내에 사용되었을 경우	
					}else if(data.checkYn == "Y"){
						$.osl.alert(data.message, {type:"warning"});
					}else{
						$.osl.toastr(data.message);
						
						// 비밀번호 변경 form 초기화
						$("#frUsr1000UserPassword")[0].reset();
					}
	    		});
	    		
	    		//AJAX 전송
	    		ajaxObj.send();
	        }
	    });
    	
    };
	
    //저장된 단축키 정보 조회
    var selectShortCutInfo = function(){
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/usr/usr1000/usr1000/selectUsr1000ShortcutInfoAjax.do'/>", "async": false});
    	//AJAX 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
    			$.osl.alert(data.message, {type:'error'});
    			
    			//모달 창 닫기
    			$.osl.layerPopupClose();
    		}else{
    			//단축키 정보 세팅
    			$.osl.setDataFormElem(data.shorcutInfoMap,"frUsr1000UserShortCut");
				
    			//값 저장 element
    			var keyCodeList = document.getElementsByClassName("keyCode");
    			
    			//단축키 입력 테이블
    			var str = "";
    			
				data.shortcutInfo.forEach(function(value, index){
					//검색 제외
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
				
				//내용 추가
				$("#shortcutDiv").html(str);
				
				//툴팁
				KTApp.initTooltips();
				
				//언어팩
				$.osl.langConvert("#shortcutDiv");
				
				//사용안하는 항목 공백처리
				$(".keyCode").each(function(){
					if($(this).val() == " "){
						$(this).val("");
					}
				});
				
				//팝업창시 실행 여부 조회
				data.shortcutInfo.forEach(function(value, index){
					if(value.popupActionCd == "01"){
						$("input[type='checkbox'][actionCd="+value.actionCd+"]").attr("checked", true);
					}else{
						$("input[type='checkbox'][actionCd="+value.actionCd+"]").attr("checked", false);
					}
				});
				
				//단축키 입력 초기화
		        $(".emptyBtn").on("click", function(){
		        	var actionCd = $(this).attr("id");
		        	$("input[type='text'][actionCd="+actionCd+"]").val("");
		        	
		        });
				
				//페이지 나가짐 방지
		        $(window).on('beforeunload', function(e) {
				       return true;
				});
		        
		      	//단축키 입력
		        $(".keyCode").keydown(function(event){
		        	
		        	//크롬 단축키 막아줌. 현재 이벤트의 기본 동작을 중단함.
		        	event.preventDefault();
		        	
		        	//조합키 단일 중복값 입력시 입력안됨.
		        	if(event.keyCode == 17){
		        		//CTRL
		        		return;
		        	}
		        	if(event.keyCode == 16){
		        		//SHIFT
		        		return;
		        	}
		        	if(event.keyCode == 18){
		        		//ALT
		        		return;
		        	}
		        	
		        	//단일 키값 입력불가.
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
		        	
		        	//입력되어있는 단축키 가져오기
		        	var shortcutList = new Array();
		    		$.each($(".keyCode"),function(){
		    			shortcutList.push($(this).val());
		    		});
		    		
		    		//해당칸의 값을 제외하고 입력되어있는 경우 지우기
		    		if($(this).val() != shortCut.join(" + ")){
			    		if(shortcutList.includes(shortCut.join(" + "))){
			    			$.osl.alert("이미 사용 중인 키 조합입니다.");
			    			$(this).val("");
			    			return;
			    		}
		    		}
		    		
		    		//입력
		    		$(this).val(shortCut.join(" + "));
		    		
		        })

    		}
    		
    	});
    	
    	//AJAX 전송 오류 함수
		ajaxObj.setFnError(function(xhr, status, err){
			data = JSON.parse(data);
			jAlert(data.message, "알림창");
		});
		
		//AJAX 전송
		ajaxObj.send();
    }
    
    //단축키 수정 실행
    var saveUsrShortcut = function(){
    	
		var form = $('#'+shortcutFormId);
  		
		//폼 유효 값 체크
		if (!form.valid()) {
			return;
		}
		
		//단축키 정보가져오기 element
		var _shortcutList = [];
		
		$.each($(".keyCode"),function(index, element){
			
			var shortcutObject = new Object();
			
			var actionCd = $(this).attr("actionCd");
			
			shortcutObject.actionCd = actionCd;
			
			//입력 공백 제거
			var keycode = $(this).val().replace(" ", "").split("+");
			
			//ctrl여부
			if(keycode.includes("Ctrl")){
				shortcutObject.ctrlCd = "01";
			}else{
				shortcutObject.ctrlCd = "02";
			}
			//shift 여부
			if(keycode.includes("Shift")){
				shortcutObject.shiftCd = "01";
			}else{
				shortcutObject.shiftCd = "02";
			}
			//alt 여부
			if(keycode.includes("Alt")){
				shortcutObject.altCd = "01";	
			}else{
				shortcutObject.altCd = "02";
			}
			//팝업창 존재시 실행여부
			if($("input[type='checkbox'][actionCd="+actionCd+"]").is(":checked") == true){
        		shortcutObject.popupActionCd = "01"	
        	}else{
        		shortcutObject.popupActionCd = "02"
        	}
			
			//키코드 저장
			shortcutObject.keyCd = keycode[keycode.length-1].replace(" ", "");
			
			_shortcutList.push(shortcutObject);
			
		});
		
		var data ={
				shortcutList : JSON.stringify(_shortcutList),
		}
		
		$.osl.confirm("정말 수정하시겠습니까?",null,function(result) {
			
	        if (result.value) {
	        	
	    		//AJAX 설정
	    		var ajaxObj = new $.osl.ajaxRequestAction(
	    				{"url":"<c:url value='/usr/usr1000/usr1000/saveUsr1000ShortcutAjax.do'/>"},
	    				data);
	    		
	    		//AJAX 전송 성공 함수
	    		ajaxObj.setFnSuccess(function(data){
	    			if(data.errorYn == "Y"){
	    				
	    				$.osl.alert(data.message,{type: 'error'});
	    				//모달 창 닫기
						$.osl.layerPopupClose();
	    				
	    			}else{
	    				
	    				//수정 성공
	    				$.osl.toastr(data.message);
    					
	    			}
	    		});
	    		
	    		//AJAX 전송
	    		ajaxObj.send();
	    		
	    		//단축키 리로드
	    		$(document).off("keydown");
	    		$.osl.init();
	    		
	        }
	    });
    }
    	
	// 담당자 교체 동작
	var fnUsrChargerChg = function(chargerInfo){
		var usrId = chargerInfo.usrId;
		var usrNm = chargerInfo.usrNm;
		var email = chargerInfo.email;
		var usrImgId = chargerInfo.usrImgId;
		
		//담당자 내용 변경
		$("#"+profileFormId+" #reqChargerId").val(usrId);
		$("#"+profileFormId+" #reqChargerNm").val(usrNm);

		//다음 작업흐름 담당자 정보 변경
		$("#"+profileFormId+" #nextFlowChargerNm").text(usrNm);
		$("#"+profileFormId+" #nextFlowEmail").text(email);
		$("#"+profileFormId+" #nextFlowChargerImg").attr("src",$.osl.user.usrImgUrlVal(usrImgId));
	};
	
	//대결자 정보 조회
	var selectUsr1000SubSignUsrInfo = function(rowData){
		
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/usr/usr1000/usr1000/selectUsr1000SubSignUsrInfoAjax.do'/>"},
				{paramPrjId:rowData.prjId });
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
				
			}else{
				
				$("#"+subSignUsrFormId)[0].reset();
				
				// 산출물 정보 세팅
		    	$.osl.setDataFormElem(data.subSignUsrInfo, subSignUsrFormId, ["subSignUsrNm" , "subSignUsrPrjNm", "subSignUsrEmail", "subSignUsrTelno" , "subSignUsrDeptNm", "subSignUsrPositionCd", "subSignUsrDutyCd"]);
			
				// 직급 직책 없을 경우
				if($.osl.isNull(data.subSignUsrInfo.subSignUsrDutyCd)){
					$("#subSignUsrDutyCd").val("-");
				}
				
				if($.osl.isNull(data.subSignUsrInfo.subSignUsrPositionCd)){
					$("#subSignUsrPositionCd").val("-");
				}
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	}
	
    return {
        // public functions
        init: function() {
        	documentSetting();
        },
        // 조직선택 팝업의 callback 함수
    	setDept:function(thisObj){
    		// thisObj에서 조직명과 조직아이디를 가져와서 세팅한다.
    		var deptId = $(thisObj).data("dept-id");
    		var deptNm = $(thisObj).data("dept-nm");
    		
    		setDeptInfo(deptId, deptNm);
    	}
        
    };
}();

//Initialization
$.osl.ready(function(){
	OSLUsr1000Popup.init();
});

	
</script>
