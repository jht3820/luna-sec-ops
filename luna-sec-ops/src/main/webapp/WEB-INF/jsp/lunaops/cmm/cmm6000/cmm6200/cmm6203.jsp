<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 osl-portlet__body-style--none">
	<div class="kt-portlet__head position-relative kt-padding-l-45 kt-padding-r-45 osl-overflow--hidden swiper-container">
		
		<ul class="nav nav-pills nav-pills-sm osl-flex-flow--row kt-margin-b-0 position-absolute osl-position-nav swiper-wrapper osl-width__fit-content" role="tablist">
			<li class="nav-item swiper-slide">
				<a class="nav-link osl-tab-fixed active text-center" data-toggle="tab" href="#osl_tabs_1_1" data-tab-id="reqInfo" role="tab">요구사항 정보</a>
			</li>
			<li class="nav-item swiper-slide">
				<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#osl_tabs_1_2" data-tab-id="flowChg" role="tab">작업흐름 변경이력</a>
			</li>
			<li class="nav-item swiper-slide">
				<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#osl_tabs_1_3" data-tab-id="reqHistory" role="tab">요구사항 수정이력</a>
			</li>
			<li class="nav-item swiper-slide">
				<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#osl_tabs_1_4" data-tab-id="prjAddOpt" role="tab">프로젝트 기본 항목</a>
			</li>
			<li class="nav-item swiper-slide">
				<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#osl_tabs_1_5" data-tab-id="proAddOpt" role="tab">프로세스 기본 항목</a>
			</li>
			<li class="nav-item swiper-slide">
				<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#osl_tabs_1_6" data-tab-id="reqAddOpt" role="tab">추가항목 정보</a>
			</li>
			<li class="nav-item swiper-slide">
				<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#osl_tabs_1_7" data-tab-id="reqwork" role="tab">작업 내용</a>
			</li>
			<li class="nav-item swiper-slide">
				<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#osl_tabs_1_8" data-tab-id="svnRevision" role="tab">리비전 정보</a>
			</li>
			<li class="nav-item swiper-slide">
				<a class="nav-link osl-tab-fixed text-center" data-toggle="tab" href="#osl_tabs_1_8" data-tab-id="reqDep" role="tab">배포 정보</a>
			</li>
		</ul>
		
		<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm osl-position-left-btn swiper-button-prev">
			<i class="fas fa-angle-left"></i>
		</button>
		<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm osl-position-right-btn swiper-button-next">
			<i class="fas fa-angle-right"></i>
		</button>
		
	</div>
		
	<!-- 
		**참고사항** 
		하나의 tab-content에 여러개의 portlet이 들어갈 경우에는
		osl-tab-content-8 osl-min-h-px--550,osl-tab-content-4에 있는 kt-padding-20, kt-bg-light 제거하시고 사용하시면 됩니다
		osl-tab-content-8 osl-min-h-px--550,osl-tab-content-4는 기본적으로 kt-padding-20, kt-bg-light를 무조건 가지고 있습니다.
		여백과 배경색이 없는 예시) osl_tab_1_1 내부의 osl-tab-content-8 osl-min-h-px--550
	 -->
	<div class="kt-portlet__body kt-padding-10">
		<div class="tab-content">
			
			<div class="tab-pane active" id="osl_tabs_1_1" data-tab-content="reqInfo" role="tabpanel">
				<form class="kt-form" id="reqInfo" autocomplete="off">
					<div class="row">
						<div class="osl-tab-content-8 osl-min-h-px--550">
							<div class="kt-portlet kt-portlet--collapsed" id="req4101RequestUsrInfo">
								<div class="kt-portlet__head">
									<div class="kt-portlet__head-label">
										<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.title">요청자 정보</span>
									</div>
									<div class="kt-portlet__head-toolbar">
										<div class="kt-portlet__head-group">
											<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
										</div>
									</div>
								</div>
								<div class="kt-portlet__body">
									<div class="row">
										<div class="col-xl-2 kt-align-center">
											<a href="#" class="kt-media kt-media--xl kt-media--circle">
												<img type="img" id="usrImgId">
											</a>
										</div>
										<div class="col-xl-5">
											<div class="form-group">
												<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.usrNm">요청자 이름</span></label>
												<div class="input-group">
													<input type="text" class="form-control" placeholder="요청자 이름" name="reqUsrNm" id="usrNm" autocomplete="off">
													<button type="button" class="btn btn-brand input-group-append" id="searchUsrNmBtn" name="searchUsrNmBtn"><span data-lang-cd="req4101.button.searchBtn">검색</span></button>
												</div>
											</div>
										</div>
										<div class="col-xl-5">
											<div class="form-group">
												<label><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.email">요청자 e-mail</span></label>
												<input type="text" class="form-control" placeholder="요청자 e-mail" name="reqUsrEmail" id="email" autocomplete="off">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-7">
											<div class="form-group">
												<label><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.deptNm">요청자 소속</span></label>
												<input type="text" class="form-control" name="reqUsrDeptNm"placeholder="요청자 소속"  id="deptName" autocomplete="off">
												<input type="hidden" name="reqUsrDeptId" id="deptId" autocomplete="off">
											</div>
										</div>
										<div class="col-xl-5">
											<div class="form-group">
												<label><i class="fa fa-phone-square-alt kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.tel">요청자 연락처</span></label>
												<input type="text" class="form-control" placeholder="요청자 연락처" name="reqUsrNum" id="telno" autocomplete="off">
											</div>
										</div>
									</div>
								</div>
							</div>
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
											<button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="">
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
						</div>
						<div class="osl-tab-content-4 kt-bg-light kt-padding-20 osl-content-left-margin"></div>
					</div>
				</form>
			</div>
			
			
			<div class="row osl-tab-content--full kt-hide">
				<div class="osl-tab-content-4 osl-min-h-px--550 kt-bg-light osl-content-right-margin kt-padding-20 kt-padding-r-70">
					<div class="float-left w-100">
						<form class="kt-form" id="reqSideHistory" autocomplete="off">
							<div class="row">
								<div class="col-xl-6">
									<div class="form-group">
										<label for="exampleSelect1"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">프로젝트</span></label>
										<select class="form-control kt-select2" name="" id="">
										</select>
									</div>
								</div>
								<div class="col-xl-6">
									<div class="form-group">
										<label><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDtm">요청 일자</span></label>
										<input type="date" class="form-control" placeholder="요청일" name="" id="" readonly="readonly">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqNm">요청 제목</span></label>
								<input type="text" class="form-control" placeholder="요청 제목" name="" id="" autocomplete="off" required>
							</div>
							<div class="form-group">
								<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDesc">요청 내용</span></label>
								<textarea  class="kt-hide" name="" id="" autocomplete="off" required></textarea>
							</div>
							<div class="kt-hide osl-bad_box" name="pwOption" id="pwOption">
						 		<div class="input-group kt-margin-b-10">
							 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="req4101.label.password">PW</span></label>
						 			<input type="password" class="form-control" name="" id="" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexerrorstr="알파벳과 숫자 조합 4-12자 이내"  placeholder="알파벳과 숫자 조합 4-12자 이내"/> 
						 		</div>
						 		<div class="input-group">
							 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="req4101.label.passwordCheck">PW 확인</span></label>
						 			<input type="password" class="form-control" name="" id=""autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexerrorstr="알파벳과 숫자 조합 4-12자 이내"  placeholder="알파벳과 숫자 조합 4-12자 이내" equalTo="#reqPw"/>
					 			</div>
						 	</div>
							<div class="form-group kt-margin-t-25 form-group-last">
								<label>
									<i class="fa fa-file-upload kt-margin-r-5"></i>
									<span data-lang-cd="req4101.label.attachments">파일 첨부</span> 
									<button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="">
										<span data-lang-cd="req4101.button.deleteResetBtn">삭제 초기화</span>
									</button>
								</label>
								<div class="kt-uppy osl-max-h-px-260" id="">
									<div class="kt-uppy__dashboard"></div>
									<div class="kt-uppy__progress"></div>
								</div>
							</div>
						</form>
					</div>
					<div class="float-right osl-tab-content__folding-btn">
						<div class="btn btn-sm btn-icon btn-clean btn-icon-md"></div>
					</div>
				</div>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_2" data-tab-content="flowChg" role="tabpanel">
				<form class="kt-form" id="flowChg" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_3" data-tab-content="reqHistory" role="tabpanel">
				<form class="kt-form" id="reqHistory" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_4" data-tab-content="prjAddOpt" role="tabpanel">
				<form class="kt-form" id="prjAddOpt" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_5" data-tab-content="proAddOpt" role="tabpanel">
				<form class="kt-form" id="proAddOpt" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_6" data-tab-content="reqAddOpt" role="tabpanel">
				<form class="kt-form" id="reqAddOpt" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_7" data-tab-content="reqwork" role="tabpanel">
				<form class="kt-form" id="reqwork" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_8" data-tab-content="svnRevision" role="tabpanel">
				<form class="kt-form" id="svnRevision" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_9" data-tab-content="reqDep" role="tabpanel">
				<form class="kt-form" id="reqDep" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
		</div>	
	</div>
</div>


<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";

var OSLCmm6203Popup = function () {
	
	var swiper;	
    
    var documentSetting = function () {
		
		
    	new KTPortlet('req4101RequestUsrInfo', $.osl.lang("portlet"));
    	new KTPortlet('req4101ReqGrpInfo', $.osl.lang("portlet"));
    	new KTPortlet('req4101NewRequestOpt', $.osl.lang("portlet"));
    	
    	
    	$('.osl-tab-content__folding-btn').click(function(){
    		
    		var target = $(this).parents('.osl-tab-content--full');
    		if(target.hasClass('folding-div')){
    			target.removeClass('folding-div');
    		}else{
    			target.addClass('folding-div');
    		}
    		
    	});

    	
    	initSwiper(); 
    	

    	var formId = 'frCmm6203s';
	
		
		var formEditList = [];
		
		
		var formValidate = $.osl.validate(formId);
    	
		
    	formEditList.push($.osl.editorSetting("reqDesc", {formValidate: formValidate}));
		
    	
    	
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			
			var tabTarget = e.currentTarget;
			
			var tabDiv = $(tabTarget).attr('data-tab-id');
			
			
			
			if(tabDiv=='reqInfo'){
				$('.osl-tab-content--full').addClass('kt-hide');
			
			}else{
				$('.osl-tab-content--full').removeClass('kt-hide');
			}
		
			
			
			
			if(tabDiv=='reqInfo'){
				
				
	    	
	    	
			}else if(tabDiv='flowChg'){
				
				
				
	    	
			
			}else if(tabDiv='reqHistory'){
		    	
				
	    	
			
			}else if(tabDiv='prjAddOpt'){
		    	
				
	    	
			
			}else if(tabDiv='proAddOpt'){
		    	
				
	    	
			
			}else if(tabDiv='reqAddOpt'){
		    	
				
	    	
			
			}else if(tabDiv='reqwork'){
		    	
				
	    	
			
			}else if(tabDiv='svnRevision'){
				
		    	
				
	    	
			
			}else if(tabDiv='reqDep'){
				
		    	
				
	    	
			}
			
		});
    	
	};
	
	
	
	function initSwiper() {
	   	
		swiper = new Swiper('.swiper-container', {
			
			slidesPerView: 'auto',
			
			grabCursor: true,
			
			slidesOffsetAfter: 40,
			
			spaceBetween: 5,
			
			navigation: {
				
	     		nextEl: '.swiper-button-next',
	     		
	      		prevEl: '.swiper-button-prev'
	   		}
	    });
	}
	
    return {
        
        init: function() {
        	documentSetting();
        }
    };
}();


$.osl.ready(function(){
	OSLCmm6203Popup.init();
});

	
</script>