<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 요구사항 정보 조회 및 세팅을 위한 값 -->
<input type="hidden" name="reqId" id="reqId" value="<c:out value='${param.paramReqId}'/>">
<input type="hidden" name="reqUsrId" id="reqUsrId" value="<c:out value='${param.paramReqUsrId}'/>">
<input type="hidden" name="reqPrjId" id="reqPrjId" value="<c:out value='${param.paramPrjId}'/>">
<input type="hidden" name="atchFileId" id="atchFileId">
<!-- 요구사항 정보 조회 및 세팅을 위한 값 지정 끝-->

<!-- begin :: 작업흐름 변경이력 -->
<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 osl-portlet__body-style--none">
	<div class="kt-portlet__head osl-swiper-container">
		<div class="swiper-container w-100 overflow-hidden">
			<!-- begin :: tab button 영역 -->
			<ul class="nav nav-pills nav-pills-sm osl-flex-flow--row kt-margin-b-0 osl-position-nav swiper-wrapper osl-width__fit-content" role="tablist">
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
		</div>
		
		<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm osl-position-left-btn swiper-button-prev">
			<i class="fas fa-angle-left"></i>
		</button>
		<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm osl-position-right-btn swiper-button-next">
			<i class="fas fa-angle-right"></i>
		</button>
		<!-- end :: tab button 영역 -->
	</div>
		
	<!-- 
		**참고사항** 
		하나의 tab-content에 여러개의 portlet이 들어갈 경우에는
		osl-tab-content-8 osl-min-h-px--550,osl-tab-content-4에 있는 kt-padding-20, kt-bg-light 제거하시고 사용하시면 됩니다.
		또한 위의 경우 여러개 portlet이 들어갈 때 마지막 portlet은 반드시 kt-padding-b-0을 적어 주셔야합니다.
		osl-tab-content-8 osl-min-h-px--550,osl-tab-content-4는 기본적으로 kt-padding-20, kt-bg-light를 무조건 가지고 있습니다.
		여백과 배경색이 없는 예시) osl_tab_1_1 내부의 osl-tab-content-8 osl-min-h-px--550
	 -->
	<div class="kt-portlet__body kt-padding-t-0 kt-padding-l-30 kt-padding-r-30 kt-padding-b-30">
		<div class="tab-content">
			<!-- begin :: tab 1 - 요구사항 정보 -->
			<div class="tab-pane active" id="osl_tabs_1_1" data-tab-content="reqInfo" role="tabpanel">
				<form class="kt-form" id="reqInfo" autocomplete="off">
					<div class="row">
						<div class="osl-tab-content-8 osl-min-h-px--550">
							<div class="kt-portlet kt-portlet--collapsed" id="req4102RequestUsrInfo">
								<div class="kt-portlet__head">
									<div class="kt-portlet__head-label">
										<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req4102.label.reqUser.title">요청자 정보</span>
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
												<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4102.label.reqUser.usrNm">요청자 이름</span></label>
												<div class="input-group">
													<input type="text" class="form-control"  name="reqUsrNm" id="usrNm" readonly="readonly">
												</div>
											</div>
										</div>
										<div class="col-xl-5">
											<div class="form-group">
												<label><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req4102.label.reqUser.email">요청자 e-mail</span></label>
												<input type="text" class="form-control" name="reqUsrEmail" id="email" readonly="readonly">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-xl-7">
											<div class="form-group">
												<label><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req4102.label.reqUser.deptNm">요청자 소속</span></label>
												<input type="text" class="form-control" name="reqUsrDeptNm" id="deptName" readonly="readonly">
											</div>
										</div>
										<div class="col-xl-5">
											<div class="form-group">
												<label><i class="fa fa-phone-square-alt kt-margin-r-5"></i><span data-lang-cd="req4102.label.reqUser.tel">요청자 연락처</span></label>
												<input type="text" class="form-control" name="reqUsrNum" id="telno" readonly="readonly">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="kt-portlet kt-portlet--collapsed" id="req4102ReqGrpInfo">
								<div class="kt-portlet__head">
									<div class="kt-portlet__head-label">
										<i class="fa flaticon2-layers-1 kt-margin-r-5"></i><span data-lang-cd="req4102.label.group.groupReqInfo">그룹 요구사항 정보</span>
									</div>
									<div class="kt-portlet__head-toolbar">
										<div class="kt-portlet__head-group">
											<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
										</div>
									</div>
								</div>
								<div class="kt-portlet__body">
									<div class="form-group">
										<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4102.label.group.groupReq">그룹 요구사항</span></label>
										<div class="input-group">
											<input type="text" class="form-control" name="reqGrpNm" id="reqGrpNm" readonly="readonly" placeholder="그룹 요구사항이 연결되어 있지 않습니다.">
										</div>
									</div>
									<div class="form-group kt-margin-b-0" id="groupReqDescDiv">
										<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4102.label.group.groupReqDesc">그룹 요구사항 내용</span></label>
										<textarea class="kt-hide" name="reqGrpDesc" id="reqGrpDesc"></textarea>
									</div>
								</div>
							</div>
							<div class="kt-portlet">
								<div class="kt-portlet__body">
									<div class="row">
										<div class="col-xl-6">
											<div class="form-group">
												<label for="exampleSelect1"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req4102.label.prjNm">프로젝트</span></label>
												<select class="form-control kt-select2" name="prjId" id="reqPrjSelect">
												</select>
											</div>
										</div>
										<div class="col-xl-6">
											<div class="form-group">
												<label><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="req4102.label.reqDtm">요청 일자</span></label>
												<input type="date" class="form-control" name="reqDtm" id="reqDtm" readonly="readonly">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4102.label.reqNm">요청 제목</span></label>
										<input type="text" class="form-control" name="reqNm" id="reqNm"  readonly="readonly">
									</div>
									<div class="form-group">
										<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4102.label.reqDesc">요청 내용</span></label>
										<textarea  class="kt-hide" name="reqDesc" id="reqDesc" required></textarea>
									</div>
									<div class="form-group kt-margin-t-25 form-group-last" id="reqFileListDiv">
										<label>
											<i class="fa fa-file-upload kt-margin-r-5"></i>
											<span data-lang-cd="req4102.label.attachments">파일 첨부</span> 
										</label>
										<div class="kt-uppy osl-max-h-px-260 fileReadonly" id="req4102FileUpload">
											<div class="kt-uppy__dashboard"></div>
											<div class="kt-uppy__progress"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="kt-portlet kt-portlet--collapsed kt-margin-b-0" data-ktportlet="true" id="req4102NewRequestOpt">
								<div class="kt-portlet__head">
									<div class="kt-portlet__head-label">
										<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req4102.label.requestDefaultOptNm">접수 기본항목 입력</span>
									</div>
									<div class="kt-portlet__head-toolbar">
										<div class="kt-portlet__head-group">
											<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="la la-angle-down"></i></a>
										</div>
									</div>
								</div>
								<div class="kt-portlet__body">
									<!-- 추가 기본 항목 -->
								</div>
							</div>
						</div>
						<div class="osl-tab-content-4 kt-bg-light kt-padding-20 osl-content-left-margin"></div>
					</div>
				</form>
			</div>
			<!-- end :: tab 1 - 요구사항 정보 -->
			<!-- begin :: tab 2 ~ 9까지 고정 간이-->
			<div class="row osl-tab-content--full kt-hide">
				<div class="osl-tab-content-4 osl-min-h-px--550 kt-bg-light osl-content-right-margin kt-padding-20 kt-padding-r-70">
					<div class="float-left w-100">
						<form class="kt-form" id="reqSideHistory" autocomplete="off">
							<div class="row">
								<div class="col-xl-6">
									<div class="form-group">
										<label for="exampleSelect1"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req4102.label.prjNm">프로젝트</span></label>
										<select class="form-control kt-select2" name="prjId" id="reqPrjSelect2">
										</select>
									</div>
								</div>
								<div class="col-xl-6">
									<div class="form-group">
										<label><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="req4102.label.reqDtm">요청 일자</span></label>
										<input type="date" class="form-control" placeholder="요청일" name="reqDtm2" id="reqDtm2" readonly="readonly">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4102.label.reqNm">요청 제목</span></label>
								<input type="text" class="form-control" placeholder="요청 제목" name="reqNm2" id="reqNm2" autocomplete="off" required>
							</div>
							<!-- ** 
									예시 : folding 접힐 때 숨겨지는 div
							
									  기본 class :: osl-tab-folding-hide kt-hide
									 folding 펼쳐지면서 kt-hide removeClass addClass로 조절
							** -->
							<div class="form-group osl-tab-folding-hide kt-hide">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4102.label.reqDesc">요청 내용<span class="kt-font-danger">(folding 숨김 예시)</span></span></label>
								<textarea  class="kt-hide" name="reqDesc2" id="reqDesc2" autocomplete="off" required></textarea>
							</div>
							<div class="form-group kt-margin-t-25 form-group-last">
								<label>
									<i class="fa fa-file-upload kt-margin-r-5"></i>
									<span data-lang-cd="req4102.label.attachments">파일 첨부</span> 
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
			<!-- end :: tab 2 ~ 9까지 고정 간이-->
			<!-- begin :: tab 2 - 작업흐름 변경이력 -->
			<div class="tab-pane" id="osl_tabs_1_2" data-tab-content="flowChg" role="tabpanel">
				<form class="kt-form" id="flowChg" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			<!-- end :: tab 2 - 작업흐름 변경이력 -->
			<!-- begin :: tab 3 - 요구사항 수정이력 -->
			<div class="tab-pane" id="osl_tabs_1_3" data-tab-content="reqHistory" role="tabpanel">
				<form class="kt-form" id="reqHistory" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			<!-- end :: tab 3 - 요구사항 수정이력 -->
			<!-- begin :: tab 4 - 프로젝트 기본 항목 -->
			<div class="tab-pane" id="osl_tabs_1_4" data-tab-content="prjAddOpt" role="tabpanel">
				<form class="kt-form" id="prjAddOpt" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			<!-- end :: tab 4 - 프로젝트 기본 항목 -->
			<!-- begin :: tab 5 - 프로세스 기본 항목 -->
			<div class="tab-pane" id="osl_tabs_1_5" data-tab-content="proAddOpt" role="tabpanel">
				<form class="kt-form" id="proAddOpt" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			<!-- end :: tab 5 - 프로세스 기본 항목 -->
			<!-- begin :: tab 6 - 추가항목 정보 -->
			<div class="tab-pane" id="osl_tabs_1_6" data-tab-content="reqAddOpt" role="tabpanel">
				<form class="kt-form" id="reqAddOpt" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			<!-- end :: tab 6 - 추가항목 정보 -->
			<!-- begin :: tab 7 - 작업 내용 -->
			<div class="tab-pane" id="osl_tabs_1_7" data-tab-content="reqwork" role="tabpanel">
				<form class="kt-form" id="reqwork" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			<!-- end :: tab 7 - 작업 내용 -->
			<!-- begin :: tab 8 - 리비전 정보 -->
			<div class="tab-pane" id="osl_tabs_1_8" data-tab-content="svnRevision" role="tabpanel">
				<form class="kt-form" id="svnRevision" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			<!-- end :: tab 8 - 리비전 정보 -->
			<!-- begin :: tab 9 - 배포 정보 -->
			<div class="tab-pane" id="osl_tabs_1_9" data-tab-content="reqDep" role="tabpanel">
				<form class="kt-form" id="reqDep" autocomplete="off">
					<div class="row osl-tab-content--full">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			<!-- end :: tab 9 - 배포 정보 -->
			
		</div>	
	</div>
</div>
<!-- end :: 작업흐름 변경이력 -->

<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";

var OSLCmm6203Popup = function () {
	//탭버튼 동작
	var swiper;	
	//formid
	var formId = 'frCmm6203s';
	//edit 목록
	var formEditList = [];
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//전달받은 요구사항 정보 값을 가지고 있기 위한 변수 선언
	var reqId = $("#reqId").val();
	var reqUsrId = $("#reqUsrId").val();
	var reqPrjId = $("#reqPrjId").val();
	
	//요구사항에서 사용되는 fileUploadObj 선언
	var reqFileUploadObj;
	
    // Private functions
    var documentSetting = function () {
		
    	//프로젝트 목록 세팅
    	$("#reqPrjSelect").html($.osl.prjGrpAuthSelSetting(2,true));
    	
		//Portlet 세팅
    	new KTPortlet('req4102RequestUsrInfo', $.osl.lang("portlet"));
    	new KTPortlet('req4102ReqGrpInfo', $.osl.lang("portlet"));
    	new KTPortlet('req4102NewRequestOpt', $.osl.lang("portlet"));
    	
    	//요구사항 정보 fileObj 세팅 및 요구사항 정보 세팅
    	settingReq(reqFileUploadObj);
    	
    	//모달 body 스크롤 시 헤더에 배경색,그림자가 들어가고 최상단으로 돌아오면 배경색,그림자 숨김처리
		$('.modal-body').scroll(function() {
		    //스크롤 인지
		    var scroll = $('.modal-body').scrollTop();
		    //스크롤이 50이상일때
		    if (scroll >= 10) {
		        //헤더에 배경색 삽입
		        $('.osl-swiper-container').css({
		            backgroundColor: '#eeeef4',
		        	boxShadow: '0 1px 16px rgb(64 63 63 / 15%)'
		        });
		        //스크롤이 50이하 일때
		    } else {
		        //헤더 배경색 투명
		        $('.osl-swiper-container').css({
		            backgroundColor: 'transparent',
		        	boxShadow: 'none'
		        });
		    }
		});
    	
    	//2번탭 부터 div folding 효과
    	$('.osl-tab-content__folding-btn').click(function(){
    		//folding 버튼 부모 div 찾기
    		var target = $(this).parents('.osl-tab-content--full');
    		//folding-div여부로 접고 펴고 진행
    		if(target.hasClass('folding-div')){
    			//접히기
    			target.removeClass('folding-div');
    			//folding시 div 숨김
    			$('.osl-tab-folding-hide').addClass('kt-hide');
    		}else{
    			//펼치기
    			target.addClass('folding-div');
    			//folding시 div 표출
    			$('.osl-tab-folding-hide').removeClass('kt-hide');
    		}
    	});

    	//tab이동 
    	initSwiper(); 
    	
		//edit 세팅
    	formEditList.push($.osl.editorSetting("reqDesc", {formValidate: formValidate}));
		
		//edit 세팅
    	formEditList.push($.osl.editorSetting("reqDesc2", {formValidate: formValidate}));
		
    	
    	// 탭 클릭 이벤트
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			//tabTarget : 선택된 tab target
			var tabTarget = e.currentTarget;
			//tabDiv : 선택된 탭의 data-tab-id
			var tabDiv = $(tabTarget).attr('data-tab-id');
			
			//요구사항 간이정보 표출 여부
			//1번탭
			if(tabDiv=='reqInfo'){
				$('.osl-tab-content--full').addClass('kt-hide');
			//나머지 탭
			}else{
				$('.osl-tab-content--full').removeClass('kt-hide');
			}
		
			
			//**여기에 탭 이동시 동작 작성하시면 됩니다**
			
			/* begin :: 요구사항 정보 */
			if(tabDiv=='reqInfo'){

				
				
	    	/* end :: 요구사항 정보 */
	    	/* begin :: 작업흐름 변경이력 */
			}else if(tabDiv='flowChg'){
				
				
				
	    	/* end :: 작업흐름 변경이력 */
			/* begin :: 요구사항 수정이력 */
			}else if(tabDiv='reqHistory'){
		    	
				
	    	/* end :: 요구사항 수정이력 */
			/* begin :: 프로젝트 기본 항목 */
			}else if(tabDiv='prjAddOpt'){
		    	
				
	    	/* end :: 프로젝트 기본 항목 */
			/* begin :: 프로세스 기본항목 */
			}else if(tabDiv='proAddOpt'){
		    	
				
	    	/* end :: 프로세스 기본항목 */
			/* begin :: 추가항목 정보 */
			}else if(tabDiv='reqAddOpt'){
		    	
				
	    	/* end :: 추가항목 정보 */
			/* begin :: 작업내용 */
			}else if(tabDiv='reqwork'){
		    	
				
	    	/* end :: 작업내용 */
			/* begin :: 리비전 정보 */
			}else if(tabDiv='svnRevision'){
				//요구사항 간이 정보 표출
		    	
				
	    	/* end :: 리비전 정보 */
			/* begin :: 배포 정보 */
			}else if(tabDiv='reqDep'){
				//요구사항 간이 정보 표출
		    	
				
	    	/* end :: 배포 정보 */
			}
			
		});
    	
	};
	
	
	/**
	 * function명 : initSwiper
	 * function설명 : 모바일 탭버튼 세팅
	 */
	function initSwiper() {
	   	/*모바일 탭 버튼 동작*/
		swiper = new Swiper('.swiper-container', {
			//탭버튼이 한 화면에 보여지는 양 (숫자, auto-사용자가 지정한 스타일 그대로 지정)
			slidesPerView: 'auto',
			//커서 모양
			grabCursor: true,
			//마지막 탭버튼 뒤쪽 여백 추가
			slidesOffsetAfter: 40,
			//탭버튼사이 여백
			spaceBetween: 5,
			//이동 버튼
			navigation: {
				//다음
	     		nextEl: '.swiper-button-next',
	     		//이전
	      		prevEl: '.swiper-button-prev'
	   		}
	    });
	}

	/**
	 * function 명	: settingReq 
	 * function 설명 : 요구사항 파일 업로드 세팅 및 요구사항 조회 및 세팅
	 * param fileUploadObj : 파일 오브젝트
	 */
	var settingReq = function(fileUploadObj){
		//파일 업로드 세팅
    	fileUploadObj = $.osl.file.uploadSet("req4102FileUpload",{
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": $("#atchFileId").val(), "fileSn": 0},
    		height: 260,
    		isDraggingOver: false,
    		fileDownload: true,
    		fileReadonly: true
    	});
		
		//요구사항 조회 및 세팅
    	settingReqInfo(fileUploadObj);
	};
	
	/**
	 * function 명	: settingReqInfo 
	 * function 설명 : 요구사항 조회 및 세팅
	 * param fileUploadObj : 파일 오브젝트
	 */
	var settingReqInfo = function(fileUploadObj){
		var data = {
    			prjId :  reqPrjId,
    			reqId :  reqId,
    	};
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req4000/req4100/selectReq4100ReqInfoAjax.do'/>", "async": false}
				,data);
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				console.log(data.reqInfoMap);
				var info = data.reqInfoMap;
				//요구사항 정보 세팅
				$.osl.setDataFormElem(info,"reqInfo");
				
				//요청자 정보 세팅
				$("#reqUsrId").val(info.reqUsrId);
		    	$("#usrNm").val(info.reqUsrNm);
		    	$("#email").val(info.reqUsrEmail);
		    	$("#telno").val(info.reqUsrNum);
		    	$("#deptName").val(info.reqUsrDeptNm);
		    	$("#deptId").val(info.reqUsrDeptId);
		    	$("#usrImgId").attr("src",$.osl.user.usrImgUrlVal(info.reqUsrImgId));
		    	
		    	//edit 세팅
		    	formEditList.push($.osl.editorSetting("reqDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:260
		    	}));
		    	formEditList.push($.osl.editorSetting("reqDesc2", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:260
		    	}));
		    	//edit 세팅하고 나서 textarea 보이기
		    	$("#reqDesc").removeClass("kt-hide");
		    	$("#reqDesc2").removeClass("kt-hide");
		    	
		    	//그룹요구사항 내용 세팅
		    	$("#reqGrpNm").val(info.reqGrpNm);
		    	
		    	//그룹요구사항 내용이 있는지
				if($.osl.isNull(info.reqGrpId)){
					//연결된 요구사항이 없는 경우
					//그룹 요구사항 placeholder를 제목에 세팅
					$("#reqGrpNm").val($.osl.lang("req4102.placeholder.notGroupReqInfo"));
					//내용이 없으므로 라벨도 숨기기
					$("#groupReqDescDiv").addClass("kt-hide");
				}else{
					//연결된 요구사항이 있는 경우
			    	formEditList.push($.osl.editorSetting("reqGrpDesc", {
			    		toolbar: false,
		    			disableResizeEditor: false,
		    			disableDragAndDrop: true,
		    			disabledEditor: true,
		    			height:180
		    		}));
					//edit 세팅하고 나서 textarea 보이기
			    	$("#reqGrpDesc").removeClass("kt-hide");
				}
		    	
		    	if($.osl.isNull(data.fileList)){
		    		//파일 목록이 없는 경우 해당 div 숨기기
		    		$("#reqFileListDiv").addClass("kt-hide");
		    	}else{
		    		//파일 목록이 있는 경우
		    		$("#reqFileListDiv").removeClass("kt-hide");
			    	//파일Sn넣기
			    	//fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
			    	//파일 목록 세팅
			    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
		    	}
			}
		});
		//AJAX 전송
		ajaxObj.send();
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
	OSLCmm6203Popup.init();
});

	
</script>