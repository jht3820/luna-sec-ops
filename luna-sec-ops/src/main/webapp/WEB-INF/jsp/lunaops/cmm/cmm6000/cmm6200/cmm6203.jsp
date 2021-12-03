<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" name="reqId" id="reqId" value="<c:out value='${param.paramReqId}'/>">
<input type="hidden" name="reqUsrId" id="reqUsrId" value="<c:out value='${param.paramReqUsrId}'/>">
<input type="hidden" name="reqPrjId" id="reqPrjId" value="<c:out value='${param.paramPrjId}'/>">
<input type="hidden" name="atchFileId" id="atchFileId">



<div class="row">
	<div class="osl-tab-icon-group">
		
		<ul class="nav nav-pills nav-pills-sm osl-flex-flow--column" role="tablist">
			<li class="nav-item kt-margin-r-0">
				<a class="nav-link osl-tab-fixed active" data-toggle="tab" href="#osl_tabs_1_1" data-tab-id="reqInfo" role="tab">
					<i class="fas fa-info-circle"></i><span>요구사항 정보</span>
				</a>
			</li>
			<li class="nav-item kt-margin-r-0">
				<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#osl_tabs_1_2" data-tab-id="flowChg" role="tab">
					<i class="far fa-clone"></i><span>작업흐름 변경이력</span>
				</a>
			</li>
			<li class="nav-item kt-margin-r-0">
				<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#osl_tabs_1_3" data-tab-id="reqHistory" role="tab">
					<i class="fas fa-edit"></i><span>요구사항 수정이력</span>
				</a>
			</li>
			<li class="nav-item kt-margin-r-0">
				<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#osl_tabs_1_4" data-tab-id="prjAddOpt" role="tab">
					<i class="fas fa-folder"></i><span>프로젝트 기본 항목</span>
				</a>
			</li>
			<li class="nav-item kt-margin-r-0">
				<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#osl_tabs_1_5" data-tab-id="proAddOpt" role="tab">
					<i class="fas fa-project-diagram"></i><span>프로세스 기본 항목</span>
				</a>
			</li>
			<li class="nav-item kt-margin-r-0">
				<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#osl_tabs_1_6" data-tab-id="reqAddOpt" role="tab">
					<i class="far fa-plus-square"></i><span>추가항목 정보</span>
				</a>
			</li>
			<li class="nav-item kt-margin-r-0">
				<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#osl_tabs_1_7" data-tab-id="reqwork" role="tab">
					<i class="fas fa-columns"></i><span>작업 내용</span>
				</a>
			</li>
			<li class="nav-item kt-margin-r-0">
				<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#osl_tabs_1_8" data-tab-id="svnRevision" role="tab">
					<i class="fab fa-usb"></i><span>리비전 정보</span>
				</a>
			</li>
			<li class="nav-item kt-margin-r-0">
				<a class="nav-link osl-tab-fixed" data-toggle="tab" href="#osl_tabs_1_8" data-tab-id="reqDep" role="tab">
					<i class="fas fa-share-alt-square"></i><span>배포 정보</span>
				</a>
			</li>
		</ul>
		
	</div>

	<div class="osl-tab-content-group kt-bg-light kt-padding-10">
		<div class="tab-content osl-tab-content kt-scroll" id="osl-tab-content__scroll">
			
			<div class="tab-pane active" id="osl_tabs_1_1" data-tab-content="reqInfo" role="tabpanel">
				<form class="kt-form" id="reqInfo" autocomplete="off">
					<div class="row kt-margin-0">
						<div class="osl-tab-content-8 osl-min-h-px--550">
							<div class="kt-portlet kt-portlet--collapsed" id="req4102RequestUsrInfo">
								<div class="kt-portlet__head">
									<div class="kt-portlet__head-label">
										<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req4102.label.reqUser.title">요청자 정보</span>
									</div>
									<div class="kt-portlet__head-toolbar">
										<div class="kt-portlet__head-group">
											<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
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
											<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
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
											<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
										</div>
									</div>
								</div>
								<div class="kt-portlet__body">
									
								</div>
							</div>
						</div>
						<div class="osl-tab-content-4 kt-bg-light kt-padding-20 osl-content-left-margin" id="osl-req__process-history"></div>
					</div>
				</form>
			</div>
			
			
			<div class="row osl-tab-content--full kt-margin-0 kt-hide">
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
							<div class="form-group kt-margin-t-25 form-group-last"  id="reqFileListDiv2">
								<label>
									<i class="fa fa-file-upload kt-margin-r-5"></i>
									<span data-lang-cd="req4102.label.attachments">파일 첨부</span> 
								</label>
								<div class="kt-uppy osl-max-h-px-260 fileReadonly" id="req4102FileUpload2">
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
					<div class="row osl-tab-content--full kt-margin-0">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_3" data-tab-content="reqHistory" role="tabpanel">
				<form class="kt-form" id="reqHistory" autocomplete="off">
					<div class="row osl-tab-content--full kt-margin-0">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_4" data-tab-content="prjAddOpt" role="tabpanel">
				<form class="kt-form" id="prjAddOpt" autocomplete="off">
					<div class="row osl-tab-content--full kt-margin-0">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_5" data-tab-content="proAddOpt" role="tabpanel">
				<form class="kt-form" id="proAddOpt" autocomplete="off">
					<div class="row osl-tab-content--full kt-margin-0">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_6" data-tab-content="reqAddOpt" role="tabpanel">
				<form class="kt-form" id="reqAddOpt" autocomplete="off">
					<div class="row osl-tab-content--full kt-margin-0">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_7" data-tab-content="reqwork" role="tabpanel">
				<form class="kt-form" id="reqwork" autocomplete="off">
					<div class="row osl-tab-content--full kt-margin-0">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_8" data-tab-content="svnRevision" role="tabpanel">
				<form class="kt-form" id="svnRevision" autocomplete="off">
					<div class="row osl-tab-content--full kt-margin-0">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
			<div class="tab-pane" id="osl_tabs_1_9" data-tab-content="reqDep" role="tabpanel">
				<form class="kt-form" id="reqDep" autocomplete="off">
					<div class="row osl-tab-content--full kt-margin-0">
						<div class="osl-tab-content-8 osl-min-h-px--550 kt-bg-light kt-padding-20"></div>
					</div>
				</form>
			</div>
			
			
		</div>	
	</div>
</div>


<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";

var OSLCmm6203Popup = function () {
	
	var swiper;	
	
	var formId = 'frCmm6203s';
	
	var formEditList = [];
	
	var formValidate = $.osl.validate(formId);
	
	
	var reqId = $("#reqId").val();
	var reqUsrId = $("#reqUsrId").val();
	var reqPrjId = $("#reqPrjId").val();
	
	
	var reqFileViewObj;
	var reqFileViewObjTab;
	var heightSizeTarget;
    
    var documentSetting = function () {
    	fnKtScrollInit('#osl-tab-content__scroll','550')
		
    	new KTPortlet('req4102RequestUsrInfo', $.osl.lang("portlet"));
    	new KTPortlet('req4102ReqGrpInfo', $.osl.lang("portlet"));
    	new KTPortlet('req4102NewRequestOpt', $.osl.lang("portlet"));
    	
    	
    	settingReqOneTap();
    	settingReqTwoTap();
    	
    	
    	$('.osl-tab-content__folding-btn').click(function(){
    		
    		var target = $(this).parents('.osl-tab-content--full');
    		
    		if(target.hasClass('folding-div')){
    			$('#osl-tab-content__scroll').scrollTop(0);
    			
    			target.removeClass('folding-div');
    			
    			$('.osl-tab-folding-hide').addClass('kt-hide');
    			
    			heightSizeTarget = $(this).parents('.osl-tab-content-4').outerHeight();
    			
    			$('.osl-tab-content-8').each(function(idx, map){
					$(map).css('height',heightSizeTarget);
    			});
    		}else{
    			
    			target.addClass('folding-div');
    			
    			$('.osl-tab-folding-hide').removeClass('kt-hide');
    			
    			heightSizeTarget = $(this).parents('.osl-tab-content-4').outerHeight();
    			
    			$('.osl-tab-content-8').each(function(idx, map){
					$(map).css('height',heightSizeTarget);
    			});
    		}
    	});

    	
    	initSwiper(); 
    	
		
    	
		
		
    	
		
    	
    	
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
			$('#osl-tab-content__scroll').scrollTop(0);
			
			var tabTarget = e.currentTarget;
			
			var tabDiv = $(tabTarget).attr('data-tab-id');
			
			
			
			if(tabDiv=='reqInfo'){
				$('.osl-tab-content--full').addClass('kt-hide');
			
			}else{
				$('.osl-tab-content--full').removeClass('kt-hide');
			}
		
			
			
			
			
			if(tabDiv=='reqInfo'){
		    	
		    	settingReqOneTap();
				
	    	
	    	
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

	
	var settingReqOneTap = function(){
		
    	reqFileViewObj = $.osl.file.uploadSet("req4102FileUpload",{
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": $("#atchFileId").val(), "fileSn": 0},
    		height: 260,
    		isDraggingOver: false,
    		fileDownload: true,
    		fileReadonly: true
    	});
		
		
    	defaultSettingReqinfo();
	};
	
	
	var settingReqTwoTap = function(){
		
    	reqFileViewObjTab = $.osl.file.uploadSet("req4102FileUpload2",{
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": $("#atchFileId").val(), "fileSn": 0},
    		height: 260,
    		isDraggingOver: false,
    		fileDownload: true,
    		fileReadonly: true
    	});
		
		
    	settingReqInfo();
	};
	
	
	var defaultSettingReqinfo = function(){
		var data = {
    			prjId :  reqPrjId,
    			reqId :  reqId,
    	};
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req4000/req4100/selectReq4100ReqInfoAjax.do'/>", "async": false}
				,data);
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				
				$.osl.layerPopupClose();
			}else{
				
				
 				var reqChgList = data.reqChgList;
 				var reqChgStr = '';
 				if(!$.osl.isNull(reqChgList) && reqChgList.length > 0){
 					$.each(reqChgList, function(idx, map){
 						var processNextLabel = '<div class="osl-flowchart__label osl-margin--0-auto"><i class="fa fa-arrow-down"></i></div>';
 						
 						
 						if((idx+1) == reqChgList.length){
 							processNextLabel = '';
 						}
 						
 						
 						var processNm, bgColor, color, flowNm, chgDtm, chgUsrId, chgUsrImgId, chgUsrNm, chgUsrEmail;
 						
 						
 						if(map.reqChgTypeCd == "03") {
 							processNm = $.osl.escapeHtml(map.chgProcessNm);
 							bgColor = map.chgFlowTitleBgColor;
 							color = map.chgFlowTitleColor;
 							flowNm = map.chgFlowNm;
 						}
 						
 						
 						var paramDatetime = new Date(map.chgDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd HH:mm:ss"});
		                chgDtm = agoTimeStr.agoString;
		                
		                
		                chgUsrId = map.chgUsrId;
		                chgUsrImgId = map.chgUsrImgId;
		                chgUsrNm = map.chgUsrNm;
		                chgUsrEmail = map.chgUsrEmail;
		                
 						reqChgStr += 
 							'<div class="osl-flowchart__operator--reqdetail">'
	 							+'<div class="flowchart-operator-process-title">'
	 								+'<div class="flowchart-operator-title__lebel badge badge-info d-inline-block text-truncate">'+processNm+'</div>'
	 							+'</div>'
	 							+'<div class="flowchart-operator-title" style="background-color:'+bgColor+';color:'+color+';">'
	 								+'<div class="flowchart-operator-title__lebel d-inline-block text-truncate">'+flowNm+'</div>'
	 							+'</div>'
	 							+'<div class="flowchart-operator-inputs-outputs">'
	 								+'<div class="kt-user-card-v2 btn w-100" data-usr-id="'+ chgUsrId +'">' 
		 								+'<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">'
		 									+'<img src="'+$.osl.user.usrImgUrlVal(chgUsrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
		 								+'</div>'
		 								+'<div class="kt-user-card-v2__details kt-align-left">'
		 									+'<span class="kt-user-card-v2__name text-truncate osl-max-w-px-200">'+chgUsrNm+'</span>'
		 									+'<span class="kt-user-card-v2__email kt-margin-l-10 osl-line-height-rem-1_5">'+chgUsrEmail+'</span>'
		 								+'</div>'
		 							+'</div>'
		 							+'<div class="flowchart-operator-chg__dtm"><i class="fa fa-clock kt-margin-r-5"></i>'+chgDtm+'</div>'
	 							+'</div>'
	 						+'</div>'
	 						+'<div class="w-100 kt-margin-t-15 kt-margin-b-15 d-flex">'
 								+processNextLabel
 							+'</div>';
 					});
 				}
 				
 				$("#osl-req__process-history").html(reqChgStr);
 				
		    	
				var info = data.reqInfoMap;
				$.osl.setDataFormElem(info,"reqInfo");
 				
 				
		    	
		    	$("#reqPrjSelect").html($.osl.prjGrpAuthSelSetting(2,true));
		    	
		    	$("#reqPrjSelect").val($.osl.escapeHtml(info.prjId)).trigger('change.select2');
		    	$("#reqPrjSelect").prop("disabled", true);
		    	
				
				
				$("#reqUsrId").val(info.reqUsrId);
		    	$("#usrNm").val(info.reqUsrNm);
		    	$("#email").val(info.reqUsrEmail);
		    	$("#telno").val(info.reqUsrNum);
		    	$("#deptName").val(info.reqUsrDeptNm);
		    	$("#deptId").val(info.reqUsrDeptId);
		    	$("#usrImgId").attr("src",$.osl.user.usrImgUrlVal(info.reqUsrImgId));
		    	
		    	
		    	formEditList.push($.osl.editorSetting("reqDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:260
		    	}));
		    	
		    	$("#reqDesc").removeClass("kt-hide");
		    	
		    	
		    	$("#reqGrpNm").val(info.reqGrpNm);
		    	
		    	
				if($.osl.isNull(info.reqGrpId)){
					
					
					$("#reqGrpNm").val($.osl.lang("req4102.placeholder.notGroupReqInfo"));
					
					$("#groupReqDescDiv").addClass("kt-hide");
				}else{
					
			    	formEditList.push($.osl.editorSetting("reqGrpDesc", {
			    		toolbar: false,
		    			disableResizeEditor: false,
		    			disableDragAndDrop: true,
		    			disabledEditor: true,
		    			height:180
		    		}));
					
			    	$("#reqGrpDesc").removeClass("kt-hide");
				}
		    	
				if($.osl.isNull(data.fileList)){
		    		
		    		
		    	}else{
		    		
		    		
			    	
			    	$.osl.file.fileListSetting(data.fileList, reqFileViewObj);
		    	}
 				
			}
		});
		
		ajaxObj.send();
	 };
	 
	
	var settingReqInfo = function(){
		var data = {
    			prjId :  reqPrjId,
    			reqId :  reqId,
    	};
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req4000/req4100/selectReq4100ReqInfoAjax.do'/>", "async": false}
				,data);
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				
				$.osl.layerPopupClose();
			}else{
				
				var info = data.reqInfoMap;
				$.osl.setDataFormElem(info,"reqInfo");
 				
 				
		    	
		    	$("#reqPrjSelect2").html($.osl.prjGrpAuthSelSetting(2,true));
		    	
		    	$("#reqPrjSelect2").val($.osl.escapeHtml(info.prjId)).trigger('change.select2');
		    	$("#reqPrjSelect2").prop("disabled", true);
				
		    	
		    	$("#reqDtm2").val(info.reqDtm);
		    	$("#reqNm2").val(info.reqNm);
		    	$("#reqDesc2").val(info.reqDesc);
		    	
		    	
		    	formEditList.push($.osl.editorSetting("reqDesc2", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:260
		    	}));
		    	
		    	
		    	$("#reqDesc2").removeClass("kt-hide");
		    	
		    	if($.osl.isNull(data.fileList)){
		    		
		    		
		    	}else{
		    		
		    		
			    	
			    	$.osl.file.fileListSetting(data.fileList, reqFileViewObjTab);
		    	}
		    	
				
			}
		});
		
		ajaxObj.send();
	};
	
	
	var fnKtScrollInit = function(targetName, targetHeight) {
		KTUtil.scrollInit($(targetName)[0], {
	   		
	        disableForMobile: true, 
	        
	        resetHeightOnDestroy: true, 
	        
	        handleWindowResize: true, 
	        
	        height: targetHeight
	    });
	};
	
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