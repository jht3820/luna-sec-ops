<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="stm2101Info" autocomplete="off" >
	<div class="kt-portlet kt-portlet--mobile osl-stm__portlet kt-margin-b-0">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<div class="kt-portlet__head-label">
				<h3 class="kt-portlet__head-title kt-font-boldest kt-font-brand">
					<c:if test="${param.stmTypeCd eq '01' }">
						<i class="la la-newspaper-o kt-margin-r-5"></i><span data-lang-cd="stm2100.type.normal">[일반]</span>
					</c:if>
					<c:if test="${param.stmTypeCd eq '02' }">
						<i class="la la-server kt-margin-r-5"></i><span data-lang-cd="stm2100.type.storage">[자료실]</span>
					</c:if>
					<c:if test="${param.stmTypeCd eq '03' }">
						<i class="la la-image kt-margin-r-5"></i><span data-lang-cd="stm2100.type.gallery">[갤러리]</span>
					</c:if>
					<c:if test="${param.stmTypeCd eq '04' }">
						<i class="la la-youtube-play kt-margin-r-5"></i><span data-lang-cd="stm2100.type.move">[영상]</span>
					</c:if>
					<c:out value="${param.stmNm }"/>
				</h3>
			</div>
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-wrapper">
				</div>
			</div>
		</div>
		<div class="kt-portlet__body kt-padding-t-15 kt-padding-b-15">
			<div class="row">
				<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12">
					<input type="hidden" id="menuId" name="menuId" value="${param.menuId }"/>
					<input type="hidden" id="paramStmDsTypeCd" name="paramStmDsTypeCd" value="${param.stmDsTypeCd }"/>
					<div class="form-group kt-margin-b-15">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.name">게시판 명</span></label>
						<input type="text" class="form-control" name="stmNm" id="stmNm" disabled="disabled">
					</div>
					<div class="form-group kt-margin-b-15">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.type">유형</span></label>
						<select class="form-control kt-select2" name="stmTypeCd" id="stmTypeCd"></select>
					</div>
					<div class="form-group kt-margin-b-15">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.dsType">게시물 공개 범위</span></label>
						<select class="form-control kt-select2" name="stmDsTypeCd" id="stmDsTypeCd"></select>
					</div>
					<div class="form-group kt-margin-b-15">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.option">옵션</span></label>
						<div class="row kt-margin-10">
							<div class="col-5">
								<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
									<input type="checkbox" name="stmNtcYnCd" id="stmNtcYnCd">
									<span></span>
								</label>
								<span data-lang-cd="stm2101.label.noticeCheck">공지사항 사용</span>
							</div>
							<div class="col-5">
								<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
										<input type="checkbox" name="stmCmtYnCd" id="stmCmtYnCd"><span></span>
									</label>
									<span data-lang-cd="stm2101.label.commentCheck">댓글 사용</span>
								</div>
							</div>
						<div class="row kt-margin-10">
							<div class="col-5">
								<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
									<input type="checkbox" name="stmPwYnCd" id="stmPwYnCd"><span></span>
								</label>
								<span data-lang-cd="stm2101.label.secretCheck">비밀글 사용</span>
							</div>
							<div class="col-5">
								<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
									<input type="checkbox" name="stmTagYnCd" id="stmTagYnCd"><span></span>
								</label>
								<span data-lang-cd="stm2101.label.tagCheck">태그 사용</span>
							</div>
						</div>
						<div class="row kt-margin-10">
							<div class="col-5">
								<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
									<input type="checkbox"  name="stmFileYnCd" id="stmFileYnCd"><span></span>
								</label>
								<span data-lang-cd="stm2101.label.attachFileCheck">첨부파일 사용</span>
							</div>
						</div>
					</div>
					<div class="kt-margin-t-15" id="stmFileOption" name="stmFileOption">
						<div class="form-group">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.fileCount">첨부파일 갯수</span></label>
							<input type="text" class="form-control" name="stmFileCnt" id="stmFileCnt" regexstr="^0$|^[1-9]{1}$|^10$" maxlength="2" placeholder="최대 10개 파일" regexalert="최대 숫자 10" required />
							<span class="kt-padding-5 float-right font-italic kt-font-inverse-metal kt-align-right osl-font-xs" data-lang-cd="stm2101.label.maxFileCnt">최대 개수 : 10</span>
						</div>
						<div class="form-group">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.limitFileStrg">첨부파일 용량 제한(MB)</span></label>
							<input type="text" class="form-control" name="stmFileStrg" id="stmFileStrg" regexstr="^0$|^[1-9]{1}[0-9]*$" maxlength="10" placeholder="최대 용량(합)"  regexalert="숫자만 가능" required />
							<span class="kt-padding-5  float-right font-italic kt-font-inverse-metal kt-align-right osl-font-xs" name="stmFileStrgStr" id="stmFileStrgStr" data-lang-cd="stm2101.label.maxFileStrg.basic">최대 용량 : [자료실] 4GB(4096MB) [영상] 2GB(2048MB) [일반/갤러리] 500MB</span>
						</div>
					</div>
				</div>
				<!--담당자, 글작성 범위-->
				<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group kt-margin-b-10">
						<div class="kt-margin-b-10">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.admin">담당자</span></label>
							<span class="float-right">
								<button type="button" class="btn btn-outline-success btn-sm" id="reset_admin" name="reset_admin" value=""><span data-lang-cd="stm2101.button.reset">초기화</span></button>
							</span>
						</div>
						<div class="form-group kt-margin-b-10">
							<div class="kt-list ps--active-y form-control kt-padding-10 overflow-auto osl-height--240" id="stmAdmList" name="stmAdmList" required>
							</div>
						</div>
					</div>
					<div class="form-group kt-margin-b-0">
						<div class="kt-margin-b-10">
							<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.writer">글 작성 범위</span></label>
							<span class="float-right">
								<button type="button" class="btn btn-brand btn-sm" id="equalBtn" name="equalBtn" value=""><span data-lang-cd="stm2101.button.equals">담당자 동일</span></button>
								<button type="button" class="btn btn-outline-success btn-sm" id="reset_wt" name="reset_wt" value=""><span data-lang-cd="stm2101.button.reset">초기화</span></button>
							</span>
						</div>
						<div class="form-group kt-margin-b-10">
							<div class="kt-list ps--active-y form-control kt-padding-10 osl-height--240 overflow-auto" id="stmWtList" name="stmWtList" required>
							</div>
						</div>
					</div>
				</div>
				<!--미배정 담당자, 미배정 글작성 범위 표출 영역-->
				<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12">
					<!--검색 영역-->
					<div class="row kt-margin-0">
						<label><i class="fas fa-user-alt kt-margin-r-5"></i><span data-lang-cd="stm2101.label.nothing">미배정 권한그룹 및사용자</span></label>
						<input type="hidden" id="typeString" name="typeString" value="${param.typeString }"/>
						<input type="hidden" id="dataList" name="dataList" value='${param.dataList}'/>
					</div>
					<div class="row kt-margin-0 kt-margin-t-10">
						<div class="input-group">
							<div class="input-group-prepend">
								<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0" name="selectSearchBtn" id="selectSearchBtn"><span data-lang-cd="common.name.all">전체</span></button>
								<div class="dropdown-menu">
									<a class="selectSearchItem dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all"><span data-lang-cd="common.name.all">전체</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchAuthGrpNm" data-opt-type="select"><span data-lang-cd="stm2101.button.authNm">권한그룹 명</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrId" data-opt-type="text"><span data-lang-cd="stm2101.button.userId">사용자 ID</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrNm" data-opt-type="text"><span data-lang-cd="stm2101.button.userName">사용자 명</span></a>
								</div>
							</div>
							<select class="kt-select2 form-control kt-hide" id="searchSelect" name="searchSelect" aria-hidden="true">
							</select>
							<input type="text" class="form-control" disabled="disabled" name="subSearchData" id="subSearchData">
							<div class="input-group-prepend">
								<button class="btn btn-brand" type="button" name="searchBtn" id="searchBtn">
									<span data-lang-cd="stm2101.button.search">검색</span>
								</button>
							</div>
						</div>
					</div>
					<!--사용자 표출영역-->
					<div class="kt-list ps--active-y form-control kt-margin-t-10 kt-padding-10 overflow-auto osl-height--480" id="stmGroupUsrList" name="stmGroupUsrList" required>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm2101SaveSubmit"><i class="fa fa-check-square"></i><span data-lang-cd="stm2101.button.updateSubmit">수정 완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>
<!-- begin page script -->
<script>
 "use strict";
 
 var OSLStm2101Popup = function(){
	var formId="stm2101Info";
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//문구 세팅 
	$("#stm2101SaveSubmit > span").text($.osl.lang("stm2101.button.updateSubmit"));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	//담당자/글작성 범위 목록 되돌리기를 위한 변수 선언
	var oriAdmin;
	var oriWriter;
	
	//비교를 위한 변수 선언
	var resultAdmin=[];
	var resultWriter=[];
	var resultAllList=[];
	
	// 기본 설정
	var documentSetting = function(){
  		
    	//해당 게시판 정보 가져오기
    	selectBadInfo(); // 게시판 속성
    	selectBadChargerList(); // 게시판 담당자
    	selectBadWriterList(); // 게시판 글 작성 범위
    	setGrpAndUsrList(); //전체 사용자 및 권한그룹 목록 가져오기
    	//리스트 그린 후 click function 적용
		drawAfterFtSetting();
		// 위치에 맞는 버튼만 보이게 하기
		showHideBtn("stmAdmList", "right", 'left');
		showHideBtn("stmWtList", "right", 'left');
		showHideBtn("stmGroupUsrList", "left", 'right');
		
    	//kt-select2 설정
    	$('#stmTypeCd').select2({
			ftScrollUse: false,
		});
    	$('#stmDsTypeCd').select2({
			ftScrollUse: false,
		});
    	$('#searchSelect').select2({
			ftScrollUse: false,
		});
    	
    	//초기 검색 select 안보이게
		$("#searchSelect~span").addClass("osl-datatable-search--hide");
		
		//검색 drop-item 변경 시 이벤트 적용
		$(".selectSearchItem").click(function(){
			$(".selectSearchItem").removeClass("active");
			$(this).addClass("active");
			$("#selectSearchBtn").text($(this).text());
			
			//이전에 검색한 조건으로 인해 리스트 안보이는거 되돌리기
			//이전에 그룹/사용자 목록 hide한것이 있다면 모두 제거
			$.each($("#stmGroupUsrList").children(), function(idx, value){
				$(this).removeClass("kt-hide");
			});

			//검색 선택에 따른 select, input 설정 + 스크롤 위치넣기
			if($(this).data("optType")=="all"){
				//kt-hide 처리하기 - select
				$("#searchSelect").addClass("kt-hide");
				$("#searchSelect~span").addClass("osl-datatable-search--hide");
				//kt-hide 지우기 - input
				$("#subSearchData").removeClass("kt-hide");
				
				$("#subSearchData").val("");
				$("#subSearchData").attr("disabled", true);
				
				$("#searchBtn").click();
			 }else if($(this).data("optType")=="select"){
				//kt-hide 지우기 - select
				$("#searchSelect").removeClass("kt-hide");
				$("#searchSelect~span").removeClass("osl-datatable-search--hide");
				//kt-hide 처리하기 - input
				$("#subSearchData").addClass("kt-hide");
				
				$("#subSearchData").val("");
				$("#subSearchData").attr("disabled", true);
				
				$("#searchBtn").click();
			 }else{
				//kt-hide 처리하기 - select
				$("#searchSelect").addClass("kt-hide");
				$("#searchSelect~span").addClass("osl-datatable-search--hide");
				//kt-hide 지우기 - input
				$("#subSearchData").removeClass("kt-hide");
				
				$("#subSearchData").val("");
				$("#subSearchData").attr("disabled", false);
				
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					//사용자 id, 명 검색은 keypress 이벤트가 적용되므로
					//해당 input으로 변경되었을 당시에 권한그룹 감추기
					//권한그룹 목록은 숨기기
					if($(value).data("authTypeCd")=='01'){
						$(this).addClass("kt-hide");
					}else{ //사용자 목록은 보이기
						$(this).removeClass("kt-hide");
					}
				});
			 }
		});
		
		// 권한그룹 선택될 때 이벤트 발생
		$("#searchSelect").change(function(){
			if("all" == $("#searchSelect").val()){
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					$(this).removeClass("kt-hide");
				});
			}else{
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					if($("#searchSelect").val() != $(value).data("optIndex")){
						$(this).addClass("kt-hide")
					}else{
						$(this).removeClass("kt-hide");
					}
				});
			}
		});
		
		// 검색어가 입력될 때 이벤트 발생
		$("#subSearchData").on("propertychange paste input", function(){
			$("#searchBtn").click();
		});
		
		//엔터키 막기 - 안막으면 강제종료
		$("#"+formId).keydown(function(e){
			if(e.keyCode=='13'){
				e.preventDefault();
				$("#searchBtn").click();
				return;
			}
		});
		
		//검색 버튼 클릭 시
		$("#searchBtn").click(function(){
			var space = $(".selectSearchItem.dropdown-item.active").data("fieldId");
			if(space == "-1"){
				//이전에 그룹/사용자 목록 hide한것이 있다면 모두 제거
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					$(this).removeClass("kt-hide");
				});
			}else if(space == "searchAuthGrpNm"){ //select
				//이전에 그룹/사용자 목록 hide한것이 있다면 모두 제거
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					//권한그룹 목록은 나타내기
					if($(this).data("authTypeCd")=='01'){
						$(this).removeClass("kt-hide");
						if($("#searchSelect").val() != "all"){
							//검색한 조건에 맞지 않는 목록은 숨기기
							if($("#searchSelect").val() != value.data("optIndex")){
								$(this).addClass("kt-hide")
							}else{
								$(this).removeClass("kt-hide");
							}
						}
					}else{ //사용자 목록은 감추기
						$(this).addClass("kt-hide");
					}
				});
			}else if(space == "searchUsrId") { //text - 사용자 id
				//검색어
				var txt = $("#subSearchData").val();
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					if($(this).data("authTypeCd")=="02" && $(this).data("authTargetId").indexOf(txt) > -1){
						$(this).removeClass("kt-hide");
					}else{
						$(this).addClass("kt-hide");
					}
				});
			}else{ //text - 사용자명
				//검색어
				var txt = $("#subSearchData").val();
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					if($(this).data("authTypeCd")=="02" && $(this).data("authTargetNm").indexOf(txt) > -1){
						$(this).removeClass("kt-hide");
					}else{
						$(this).addClass("kt-hide");
					}
				});
			}
		});
		
		// 게시판 유형 변경 시 이벤트 발생
		$("#stmTypeCd").change(function(){
			// 첨부파일 용량 제한 placeholder 변경
			var typeCd = document.getElementById("stmTypeCd").value;
			
			// 자료실인 경우 최대 파일 용량(총 합) 4GB
			if(typeCd == '02')
			{
				$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.storage"));
			}
			// 영상인 경우 최대 파일 용량(총 합) 2GB
			else if(typeCd == '04')
			{
				$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.movie"));
			}
			else
			{
				$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.normal"));
			}
		});
		
		 // 파일 첨부 옵션 체크박스가 클릭 될 때 이벤트 발생 
		$("#stmFileYnCd").click(function(){
			// 체크박스 on인경우 첨부파일 옵션 보이기
			if($("#stmFileYnCd").is(":checked")==true)
			{
				$("#stmFileOption").removeClass("kt-hide");
			}// 체크박스 off인경우 첨부파일 옵션 숨기기
			else
			{
				$("#stmFileOption").addClass("kt-hide");
			}
		});


		/*담당자 drag&drop sortable*/
		new Sortable($('#stmAdmList')[0], {
			group: {
				//그룹 이름
				name: 'stmAdmList',
	            //들어 올 수 있는  group의 name
	            put:['stmGroupUsrList']
	        },
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        //이동될 div(나갈)
 	        onMove:function(evt,originalEvent){
 				var UserAgent = navigator.userAgent;
				//모바일 일때 이동 중지
 				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
 					return false;
 				}else{
  					return true;
 				}
 			},
 	      	//해당 div로 이동될 대상의 동작(들어온)
 			onAdd:function(evt){
 				var moveDiv = $(evt.item);
 				/*추가 동작은 이쪽에서 구현하시면 됩니다*/
 				var result = checkMove(moveDiv, resultAdmin);
 				if(result == 1){
 					//이미 있는 경우 복사 중지
 					evt.item.remove();
 				} 
 				// 위치에 맞는 버튼만 보이게 하기
 				showHideBtn("stmAdmList", "right", 'left');
 				
 				//미배정 목록에서 모두 배정된 경우 안보이게 처리
 				var oriCard = $(evt.clone);
 				checkDoubleMove(oriCard);
 			} 
	    });
		
		/*글 작성 범위 drag&drop sortable*/
		new Sortable($('#stmWtList')[0], {
			group: {
				//그룹 이름
				name: 'stmWtList',
	            //들어 올 수 있는  group의 name
	            put:['stmGroupUsrList']
	        },
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        //이동될 div(나갈)
 	        onMove:function(evt,originalEvent){
 				var UserAgent = navigator.userAgent;
 				//모바일 일때 이동 중지
 				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
 					return false;
 				}else{
 					return true;
 				}
 			}, 
 	      	//해당 div로 이동될 대상의 동작(들어온)
 			 onAdd:function(evt){
 				var moveDiv = $(evt.item);
 				/*추가 동작은 이쪽에서 구현하시면 됩니다*/
 				var result = checkMove(moveDiv, resultWriter);
 				if(result == 1){
 					//이미 있는 경우 복사 중지
 					evt.item.remove();
 				}
 				// 위치에 맞는 버튼만 보이게 하기
 				showHideBtn("stmWtList", "right", 'left');
 				
 				//미배정 목록에서 모두 배정된 경우 안보이게 처리
 				var oriCard = $(evt.clone);
 				checkDoubleMove(oriCard);
 			} 
	    });
		
		/*미배정 drag&drop sortable*/
		new Sortable($('#stmGroupUsrList')[0], {
	        group: {
				//그룹 이름
	        	name: 'stmGroupUsrList',
	            //이동시 복사의 형태
	            pull: 'clone',
	            //들어 올 수 있는  group의 name
	            put:['stmWtList','stmAdmList']
	        },
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        //이동될 div(나갈)
 	        onMove:function(evt,originalEvent){
 				var UserAgent = navigator.userAgent;
 				//모바일 일때 이동 중지
 				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
 					return false;
				}else{
					return true;
				}
 			},
 	      	//해당 div로 이동될 대상의 동작(들어온)
 			onAdd:function(evt){
 				var moveDiv = $(evt.item);
 				/*추가 동작은 이쪽에서 구현하시면 됩니다*/
 				//기존 resultArray에서 해당 항목 제거
 				if($(evt.from).attr("id") == "stmGroupUsrList"){
 	 	        	checkMove(moveDiv, resultAdmin, true);
 				}else{
 					checkMove(moveDiv, resultWriter, true);
 				}
 				//중복 여부만 체크하여
 				checkDoubleMove(moveDiv);
 				// 위치에 맞는 버튼만 보이게 하기
 				showHideBtn("stmGroupUsrList", "left", 'right');
 				//미배정 목록은 전부 가지고 있으므로
 				//복사 중지
				moveDiv.remove();
 				//미배정 목록 중복 확인
 				checkDoubleMove(moveDiv, true);
 			} 
	    });
		
		// 담당자 목록과 동일하게 적용하기 위한 검색 버튼 클릭 시 이벤트 발생
		$("#equalBtn").click(function(){
			$("#stmWtList").empty();
 			// 담당자 목록 가져오기
 			var keepList = addJsonList("stmAdmList",true);
 			resultWriter = resultAdmin;
			drawAuthList(keepList, "stmWtList");
			
			var oriCard = $("#stmGroupUsrList").children();
			//담당자, 글작성범위 권한으로 모두 배정되었으므로 동일 항목은 감추기
			$.each(oriCard, function(idx, value){
				checkDoubleMove($(value));
			});
			
			//소스 열람영역 - left버튼 감추기
			showHideBtn("stmWtList", "right", 'left');
			//미배정 열람영역 - right버튼 감추기
			showHideBtn("stmGroupUsrList", "left", 'right');
		});
		
		//담당자_초기화 버튼 클릭 시
		$("#reset_admin").click(function(){
			$("#resultAdmin").empty();
			drawAuthList(oriAdmin, "stmAdmList");
			resultAdmin = [];
			$.each(oriAdmin, function(idx, value){
				resultAdmin.push(value.authTargetId);
			});
			
			var oriCard = $("#stmGroupUsrList").children();
			//담당자, 글작성범위 권한으로 모두 배정되었는지 체크
			$.each(oriCard, function(idx, value){
				checkDoubleMove($(value));
			});
			
			//담당자 열람영역 - left버튼 감추기
			showHideBtn("stmAdmList", "right", 'left');
			//미배정 열람영역 - right버튼 감추기
			showHideBtn("strgNonAssList", "left", 'right');
		});
		
		//글작성범위_초기화 버튼 클릭 시
		$("#reset_wt").click(function(){
			$("#stmWtList").empty();
			drawAuthList(oriWriter, "stmWtList");
			resultWriter = [];
			$.each(oriWriter, function(idx, value){
				resultWriter.push(value.authTargetId);
			});
			
			var oriCard = $("#stmGroupUsrList").children();
			//리비전, 소스코드 권한으로 모두 배정되었는지 체크
			$.each(oriCard, function(idx, value){
				checkDoubleMove($(value));
			});
			
			//소스 열람영역 - left버튼 감추기
			showHideBtn("stmWtList", "right", 'left');
			//미배정 열람영역 - right버튼 감추기
			showHideBtn("stmGroupUsrList", "left", 'right');
		});
		
		// 수정완료 버튼 클릭 될 때 이벤트 발생 
		$("#stm2101SaveSubmit").click(function(){
			// 첨부파일 기능 사용할 경우에만 폼 유효값 체크
			if($("#stmFileYnCd").is(":checked")==true){
				 
				// form validate 주입
				var formValidate = $.osl.validate(formId);
				
				//폼 유효 값 체크
	    		if (!$("#"+formId).valid()) {
	    			return;
	    		}
			}
			submitBadOption();
		});
	};
	
	/**
	* function 명 	: selectBadInfo
	* function 설명	: 게시판 정보를 조회하여 팝업에 세팅한다.
	*/
    var selectBadInfo = function(){
	
		var data = {"menuId" : $("#menuId").val()};
		
		//AJAX 설정
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadInfoAjax.do'/>", "async": false}
				, data);
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var info = data.badInfo;
				
				// 공통코드 해당 데이터 선택으로 세팅
				$("#stmTypeCd").attr("data-osl-value", info.stmTypeCd);
				$("#stmDsTypeCd").attr("data-osl-value", info.stmDsTypeCd);
				
		    	// adm2001 팝업 공통코드 select 세팅
				var commonCodeArr = [
					{mstCd: "STM00001", useYn: "Y", targetObj: "#stmTypeCd", comboType:"OS"}, // 게시판 유형 공통코드 가져오기
					{mstCd: "STM00002", useYn: "Y", targetObj: "#stmDsTypeCd", comboType:"OS"}, 	// 게시물 공개 범위 공통코드 가져오기
				];
		  		//공통코드 채우기
				$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
				
				// 게시판 명, 옵션 세팅
				// 게시판 명
				$("#stmNm").attr("value", info.stmNm);

				// 옵션 - 공지사항 사용
				if(info.stmNtcYnCd == "01")
				{
					$("#stmNtcYnCd").attr("checked", true);
				}else{
					$("#stmNtcYnCd").attr("checked", false);
				}
				// 옵션 - 댓글 사용
				if(info.stmCmtYnCd == "01")
				{
					$("#stmCmtYnCd").attr("checked", true);
				}else{
					$("#stmCmtYnCd").attr("checked", false);
				}
				// 옵션 - 비밀글 사용
				if(info.stmPwYnCd == "01")
				{
					$("#stmPwYnCd").attr("checked", true);
				}else{
					$("#stmPwYnCd").attr("checked", false);
				}
				// 옵션 - 태그 사용
				if(info.stmTagYnCd == "01")
				{
					$("#stmTagYnCd").attr("checked", true);
				}else{
					$("#stmTagYnCd").attr("checked", false);
				}
				// 게시판 유형에 따라 파일첨부 최대용량 라벨 변경
				// 첨부파일 용량 제한 placeholder 변경
				var typeCd = document.getElementById("stmTypeCd").value;
				// 자료실인 경우 최대 파일 용량(총 합) 4GB
				if(typeCd == '02')
				{
					$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.storage"));
				}
				// 영상인 경우 최대 파일 용량(총 합) 2GB
				else if(typeCd == '04')
				{
					$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.movie"));
				}
				else
				{
					$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.normal"));
				}
				// 옵션 - 파일 첨부 사용
				if(info.stmFileCnt > 0)
				{
					$("#stmFileYnCd").attr("checked", true);
					//파일 첨부 사용 시 첨부파일 개수 및 용량 제한 입력 div 보이기
					$("#stmFileOption").removeClass("kt-hide");
					// 옵션 - 첨부파일 개수
					$("#stmFileCnt").attr("value", info.stmFileCnt);
					// 옵션 - 첨부파일 용량 제한
					$("#stmFileStrg").attr("value", info.stmFileStrg);
				}else{
					//파일 첨부 사용 시 첨부파일 개수 및 용량 제한 입력 div 보이기
					$("#stmFileOption").addClass("kt-hide");
				}
				
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
    }
	
	/**
	* function 명 	: selectBadChargerList
	* function 설명	: 게시판 담당자 정보를 조회하여 팝업에 세팅한다.
	*/
    var selectBadChargerList = function(){
		var data = {"menuId" : $("#menuId").val()};
		
		//AJAX 설정
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadChargerListAjax.do'/>", "async": false}
				, data);
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var stmAdmList = data.badChargerList;
				//ori 정보 가지고 있기
				oriAdmin = stmAdmList;

				//처음 담당자 등록하는 경우 담당자가 비어 있을 때
				if($.osl.isNull(oriAdmin)){
					//현재 사용자를 담당자로 지정
					var dataOne={};
					dataOne.authTypeCd = '02';
					dataOne.authTargetId = $.osl.user.userInfo.usrId;
					dataOne.authTargetNm = $.osl.user.userInfo.usrNm;
					dataOne.prjGrpId = $.osl.selPrjGrpId;
					dataOne.prjId = $.osl.selPrjId;
					dataOne.authTargetImgId = $.osl.user.userInfo.usrImgId;
					dataOne.authTargetDeptId = $.osl.user.userInfo.deptId;
					dataOne.authTargetDeptNm = $.osl.user.userInfo.deptNm;
					
					oriAdmin.push(dataOne);
				}
				
				//resultAdmin에 저장
				$.each(oriAdmin, function(idx, value){
					resultAdmin.push(value.stmAdminId);
				});

				//목록에 세팅하기 - draw
				drawAuthList(oriAdmin, "stmAdmList");
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
    }
	
	/**
	* function 명 	: selectBadWriterList
	* function 설명	: 게시판 글 작성자 범위 정보를 조회하여 팝업에 세팅한다.
	*/
    var selectBadWriterList = function(){
		var data = {"menuId" : $("#menuId").val()};
		
		//AJAX 설정
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadWriterListAjax.do'/>", "async": false}
				, data);
		
  		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var stmWtList = data.badWriterList;
				
				//ori 정보 가지고 있기
				oriWriter = stmWtList;
				//resultFileCode에 저장
  				$.each(stmWtList, function(idx, value){
  					resultWriter.push(value.stmWtId);
				});
				
				//목록에 세팅하기 - draw
				drawAuthList(oriWriter, "stmWtList");
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
    }
	
    /**
	* function 명 	: setGrpAndUsrList
	* function 설명	: 배정/미배정된 권한 그룹 및 사용자 목록 호출
	*/
    var setGrpAndUsrList = function(){
		var allList = [];
		
		// 모든 목록 가져오기
		// 검색할 메뉴 id
    	var data = {
				"menuId" : $("#menuId").val(),
				"stmDsTypeCd" : $("#paramStmDsTypeCd").val(),
				};
		//AJAX 설정
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadGrpAndUsrListAjax.do'/>", "async": false}
				, data);
		
  		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{

				var stmAuthList = data.stmAuthList;
				
				var listHtml = "";
				
				//상단의 select 박스 option 넣기
				$("#searchSelect").html("");
				//select에 목록 추가
				var innerHtml = "<option value='all'>"+$.osl.lang("common.name.all")+"</option>";
				$("#searchSelect").append(innerHtml);
				$.each(stmAuthList, function(idx, val){
					if(val.authTypeCd == "01"){
						//select에 목록 추가
						var innerHtml = "<option value='"+idx+"' data-auth-target-id='"+val.authTargetId+"'>"+$.osl.escapeHtml(val.authTargetNm)+"("+$.osl.escapeHtml(val.prjNm)+")</option>";
						$("#searchSelect").append(innerHtml);

						//resultAllList에 저장
						resultAllList.push(val.authTargetId);
					}
				});
				
				//목록에 세팅하기 - draw
				drawAuthList(stmAuthList, "stmGroupUsrList");

				//그린 후 더블 체크
				var oriCard = $("#stmGroupUsrList").children();
				$.each(oriCard, function(idx, value){
					checkDoubleMove($(value));
				});
			}
		});
		//AJAX 전송
		ajaxObj.send();
	}
	
	/**
	* function 명 	: addJsonList
	* function 설명	: 선택한 담당자/글작성범위 리스트를 전달한다.
	* param : elemId 가져올 리스트 div id(#제외)
	* param : defaultCheck 넘길 리스트가 null일 때 현재 사용자 정보 넣을지 확인(필요 true, 필요 없음false)
	*/
    var addJsonList = function(elemId, defaultCheck){
		var targetId = '#' + elemId;
		var dataList = [];

		var divList = $(targetId).children();
		
		$.each(divList, function(index, value){
			var dataOne = {};
			dataOne.prjGrpId = $(value).data("prjGrpId");
			dataOne.prjId = $(value).data("prjId");
			dataOne.prjNm = $(value).data("prjNm");
			dataOne.authTargetId = $(value).data("authTargetId");
			dataOne.authTypeCd = $(value).data("authTypeCd");
			dataOne.authTargetNm = $(value).data("authTargetNm");
			dataOne.authTargetImgId = $(value).data("authTargetImgId");
			dataOne.authTargetEmail = $(value).data("authTargetEmail");
			dataOne.authTargetDeptId = $(value).data("authTargetDeptId");
			dataOne.authTargetDeptNm = $(value).data("authTargetDeptNm");
			
			dataList.push(dataOne);
		});
		
		//DB에 담당자가 지정되어있지 않은 경우
		//처음 담당자 등록하는 경우
		if(defaultCheck==true && $.osl.isNull(dataList)){
			//현재 사용자를 담당자로 지정
			var dataOne={};

			dataOne.prjGrpId = $.osl.selPrjGrpId;
			dataOne.prjId = $.osl.selPrjId;
			dataOne.authTargetId = $.osl.user.userInfo.usrId;
			dataOne.authTypeCd = '02';
			dataOne.authTargetNm = $.osl.user.userInfo.usrNm;
			dataOne.authTargetImgId = $.osl.user.userInfo.usrImgId;
			dataOne.authTargetEmail = $.osl.user.userInfo.email;
			dataOne.authTargetDeptId = $.osl.user.userInfo.deptId;
			dataOne.authTargetDeptNm = $.osl.user.userInfo.deptName;
			
			dataList.push(dataOne);
		}
		
		return dataList;
    }

	/**
	 * function 명 	: drawAuthList
	 * function 설명	: 배정/미배정된 권한 그룹 목록 표출
     * function param : 출력 데이터 정보, 그릴 element Id(#제외)
     * function 설명 : 지정 element에 데이터 목록 div 출력
	 */
	var drawAuthList = function(setData, elemId){
    	//초기화
 		$("#"+elemId).empty();

  		var listHtml = "";
 		
  		$.each(setData, function(index, value){
			//전체 틀 시작
 			listHtml = "<div class='card kt-margin-b-10 flex-flow--row flex-flow--row--reverse' data-opt-index='"+index+"'"
 							+"data-prj-id='"+value.prjId+"' data-auth-type-cd='"+value.authTypeCd+"' data-auth-target-id='"+value.authTargetId+"'"
 							+"data-auth-target-nm='"+value.authTargetNm+"' data-auth-target-id='"+value.authTargetId+"'"
 							+"data-auth-target-img-id='"+value.authTargetImgId+"' data-target-email='"+value.authTargetEmail+"'"
 							+"data-auth-target-dept-id='"+value.targetDeptId+"' data-auth-target-dept-nm='"+value.authTargetDeptNm+"'>"
							+"<div class='dropdown osl-left-arrow-group'>"
								+"<div class='btn dropdown-toggle' id='dropdownMenuButton"+index+"' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"
							+"</div>"		
							+"<div class='dropdown-menu osl-dropdown-menu--position' aria-labelledby='dropdownMenuButton"+index+"'>"
								+"<a class='dropdown-item stmAdmListMoveBtn'>"+$.osl.lang("stm2101.title.admin")+"</a>"
								+"<a class='dropdown-item stmWtListMoveBtn'>"+$.osl.lang("stm2101.title.writer")+"</a>"
							+"</div>"
						+"</div>"
						// 컨텐츠 전체영역 시작
						+"<div class='osl-content-group'>"
							//타이틀 시작			
							+"<div class='card-title left-user-group kt-margin-b-0'>";
						
	 			//권한그룹인 경우
				if(value.authTypeCd=='01'){
					listHtml += "<span class='groupuser-icon'>"
										+"<i class='fas fa-user-tag'></i>"
									+"</span>"
									+$.osl.escapeHtml(value.authTargetNm)
									+"<span class='badge badge-success osl-margin-left--auto'>"+$.osl.lang("stm2101.label.authGrp")+"</span>"
								+"</div>" //타이틀 종료		
								//내용 시작
								+"<div class='osl-card__prjnm'>"
									+$.osl.escapeHtml(value.prjNm)
								+"</div>"//내용 종료
						+ "</div>"// 컨텐츠 전체영역 종료
						//우측 이동 버튼 시작, 종료
						+"<div class='osl-right-arrow-group'></div>"
					+"</div>"; //전체 틀 종료
				}else{ //사용자인 경우
					var paramData = {
						html: "<span class='osl-user-card-flex'><span>"+value.authTargetNm +"</span><span>("+value.authTargetId+")</span></span>",
	    				imgSize: "sm",
						class:{
							cardBtn: "osl-bad__fit-content",
						}
					};
					listHtml += "<span class='' data-open-Id='"+value.authTargetId+"'>"
									+ $.osl.user.usrImgSet(value.authTargetImgId, paramData )
								+"</span>"
								+"<span class='badge badge-primary osl-margin-left--auto'>"+$.osl.lang("stm2101.label.user")+"</span>"
							+"</div>"; //타이틀 종료	
														
								//내용 시작 (소속)
		 					if($.osl.isNull(value.authTargetDeptNm)){
		 						listHtml += "<div class='osl-card__prjnm'>"
		 										+$.osl.escapeHtml(value.authTargetEmail)
	 										+"</div>";
		 					}else{
		 						listHtml += "<div class='osl-card__prjnm'>"
		 										+$.osl.escapeHtml(value.authTargetDeptNm)
		 									+"</div>";
 							}//소속 종료
 					
			listHtml +="</div>"	// 컨텐츠 전체영역 종료
					//우측 이동 버튼 시작, 종료
					+"<div class='osl-right-arrow-group'></div>"
				+"</div>"; //전체 틀 종료
			}
			$("#"+elemId).append(listHtml);
 		});
     };//drawAuthList 끝
 		
     /**
 	* function 명 	: drawAfterFtSetting
 	* function 설명	: 드로잉 후 function 적용
 	*/
 	var drawAfterFtSetting = function(){
 		//그리고 난 후에 function 적용
 		//사용자 아이콘 클릭 시 사용자 정보 팝업
		$(".kt-user-card-v2.btn.osl-bad__fit-content").click(function(){
			var usrId = $(this).parent().data("openId");
			$.osl.user.usrInfoPopup(usrId);
		});
		
 		//배정 목록에서 제거할 때
		$('.osl-right-arrow-group').click(function(){
			//이동할 객체
			var moveCard =  $(this).parents('.card');
			//객체가 있던 곳
			var formId = moveCard.parent().attr("id");

			//옮길 권한 그룹id
			var _authTargetId = moveCard.data("authTargetId");
			var idx;
			
			//담당자 목록에 있던 경우
			//배열에서 해당 제거
			if(formId=="stmAdmList"){
				checkMove(moveCard, resultAdmin, true);
			}else{
				//소스 열람 권한 배정 목록에 있던 경우
				//배열에서 해당 제거
				checkMove(moveCard ,resultWriter, true);
			}//else end
			
			//미배정 목록 중복 확인
			checkDoubleMove(moveCard, true);

			//미배정 영역 - right 버튼 감추기
			showHideBtn("stmGroupUsrList", 'left', "right");
			
			//해당 객체만 삭제
			moveCard.remove();
		});
		
		//미배정 목록에서 제거할 때 - 담당자 목록으로 전달하는 경우
		$('.stmAdmListMoveBtn').click(function(){
			//드롭다운 버튼 감추기
			$(this).parent().removeClass("show");
			//원 객체
			var oriCard = $(this).parents(".card");
			//이동할 객체
			var moveCard = oriCard.clone(true);
			var result = checkMove(moveCard, resultAdmin);
			
			if(result == 0){
				//존재안하면 복사하기
				$("#stmAdmList").prepend(moveCard);
			}
			
			//담당자, 글작성범위로 모두 배정되었는지 체크
			checkDoubleMove(oriCard);
			//담당자 - left버튼 감추기
			showHideBtn("stmAdmList", "right", 'left');
		});
		
		//미배정 목록에서 제거 - 글작성 범위로 전달
		$('.stmWtListMoveBtn').click(function(){
			//드롭다운 버튼 감추기
			$(this).parent().removeClass("show");
			//원 객체
			var oriCard = $(this).parents(".card");
			//이동할 객체
			var moveCard = oriCard.clone(true);

			var result = checkMove(moveCard, resultWriter);
			if(result == 0){
				//존재안하면 복사하기
				$("#stmWtList").prepend(moveCard);
			}
			
			//담당자, 글작성범위로 모두 배정되었는지 체크
			checkDoubleMove(oriCard);
			//글작성범위 - left버튼 감추기
			showHideBtn("stmWtList", "right", 'left');
		});
     }
	

	/**
	* function 명 	: showHideBtn
	* function 설명	: 위치에 따른 배정/제외 버튼 show/hide
	* param : elemId 지정 elemId
	* param : showing 어느 버튼 보이게 할지
	* param : hiding 어느 버튼 숨기게 할지
	*/
	var showHideBtn = function(elemId, showing, hiding){
		var list = $("#"+elemId).children();
		$.each(list, function(idx, value){
			$(value).find(".osl-"+showing+"-arrow-group").removeClass("kt-hide");
			$(value).find(".osl-"+hiding+"-arrow-group").addClass("kt-hide");
		});
	};
	

	/**
	* function 명 	: checkDoubleMove
	* function 설명	: 담당자, 글작성 범위 권한으로 모두 배정되었는지 체크 or 미배정 목록 중복 검사
	* param : oriCard 검사하려는 elem
	* param : nonListCheck 미배정 목록 중복 검사할 경우(true)
	*/
	var checkDoubleMove = function(oriCard, nonListCheck){
		var _authTargetId = oriCard.data("authTargetId");
		if(nonListCheck){
			//미배정 목록으로 들어오는 경우
			var otherItems = $("#stmGroupUsrList").children();
			$.each(otherItems, function(idx, value){
				if($(value).data("authTargetId")==_authTargetId){
					$(value).removeClass("kt-hide");
				}
			});
		}else{
			//미배정에서 나가는 경우
			var adminIdx = resultAdmin.indexOf(_authTargetId);
			var writerIdx = resultWriter.indexOf(_authTargetId);
			
			//둘다 존재하는지 체크
			if(adminIdx>=0 && writerIdx >=0){
				oriCard.addClass("kt-hide");
			}else{
				oriCard.removeClass("kt-hide");
			}
		}
	};
	
	/**
	* function 명 	: checkMove
	* function 설명	: 이미 배정되었는지 체크
	* param : oriCard 검사하려는 elem
	* param : arrayList 검사하려는 목록
	* param : delCheck 제거 여부(값 없을 경우 default 복사)
	* return : 배정여부(1, 0)
	*/
	var checkMove = function(oriCard, arrayList, delCheck){
		var _authTargetId = oriCard.data("authTargetId");
		var arrayListIdx = arrayList.indexOf(_authTargetId);
		
		if(delCheck){
			if(arrayListIdx>=0){
				//arrayList에서 제거
				arrayList.splice(arrayListIdx, 1);
			}
		}else{
			//존재하는지 체크
			if(arrayListIdx>=0){
				return 1;
			}else{
				//존재안하면 복사하기
				arrayList.push(_authTargetId);
				return 0;
			}
		}
	};
	
    /**
	* function 명 	: submitBadOption
	* function 설명	: 게시판 속성 정보 수정 완료
	*/
    var submitBadOption = function(){
		//넘길 데이터 정리
		//게시판 id
		var menuId = $("#menuId").val();
		//게시판 유형
		var stmTypeCd = $("#stmTypeCd").val();
		//게시판 담당자
		var stmAdmList = JSON.stringify(addJsonList("stmAdmList", true));
		//게시판 글 작성 범위
		var stmWtList = JSON.stringify(addJsonList("stmWtList", false));
		//게시물 공개 범위
		var stmDsTypeCd = $("#stmDsTypeCd").val();
		
		//옵션
		var stmNtcYnCd = "02";
		var stmCmtYnCd = "02";
		var stmPwYnCd = "02";
		var stmTagYnCd = "02";
		var stmFileYnCd = "02";
		
		if($("#stmNtcYnCd").is(":checked")==true)
		{
			stmNtcYnCd = "01";
		}
		if($("#stmCmtYnCd").is(":checked")==true)
		{
			stmCmtYnCd = "01";
		}
		if($("#stmPwYnCd").is(":checked")==true)
		{
			stmPwYnCd = "01";
		}
		if($("#stmTagYnCd").is(":checked")==true)
		{
			stmTagYnCd = "01";
		}
		if($("#stmFileYnCd").is(":checked")==true)
		{
			stmFileYnCd = "01";
		}

		var stmFileCnt = $("#stmFileCnt").val();
		var stmFileStrg = $("#stmFileStrg").val();
		
		//첨부파일을 사용하면
		if(stmFileYnCd == "01"){
			//입력한 파일 갯수가 0이하일 때
			if(stmFileCnt <= 0)
			{
				//첨부파일 갯수를 0 이하로 설정한 경우
				//첨부파일 갯수를 1로 자동 변경
				stmFileCnt = 1;
				$("#stmFileCnt").val(1);
				$.osl.alert($.osl.lang("stm2101.formCheck.fileCntMessage"));
				return false;
			}
			else if(stmFileCnt > 10)
			{
				//첨부파일 갯수가 10개를 넘어가는지 확인
				$("#stmFileCnt").val(10);
				$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxCntMessage"), {type:'error'});
				return false;
			}
			
			//게시판 유형 최대 용량 파일을 넘기면 최대 값으로 수정
			var defaultStrg = 0;
			//최대용량을 0 이하로 한 경우 defalult로 지정
			if(stmFileStrg <= 0)
			{
				//첨부파일 용량은 default로 지정
				//자료실인 경우 최대 파일 용량(총합) 4GB
				if(stmTypeCd == "02")
				{
					defaultStrg = 4096;
				}
				// 영상인 경우 최대 파일 용량(총 합) 2GB
				else if(stmTypeCd == "04")
				{
					defaultStrg = 2048;
				}
				// 그 외 500MB
				else
				{
					defaultStrg = 500;
				}
				$("#stmFileStrg").val(defaultStrg);
				$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgMessage"));
				return false;
			}
			//첨부파일 용량이 존재 할 경우
			else
			{
				//게시판 유형에 따라 파일 용량 최대 검사
				//최대 용량을 넘길 때만 최대 용량 값으로 변경
				//자료실인 경우 최대 파일 용량(총합) 4GB
				if(stmTypeCd == '02')
				{
					defaultStrg = 4096;
					if(stmFileStrg > defaultStrg)
					{
						$("#stmFileStrg").val(defaultStrg);
						stmFileStrg = defaultStrg;
						$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgOutMessage", "4GB"));
						return false;
					}
				}
				// 영상인 경우 최대 파일 용량(총 합) 2GB
				else if(stmTypeCd == '04')
				{
					defaultStrg = 2048;
					if(stmFileStrg > defaultStrg)
					{
						$("#stmFileStrg").val(defaultStrg);
						stmFileStrg = defaultStrg;
						$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgOutMessage", "2GB"));
						return false;
					}
				}
				// 그 외 500MB
				else
				{
					defaultStrg = 500;
					if(stmFileStrg > defaultStrg)
					{
						$("#stmFileStrg").val(defaultStrg);
						stmFileStrg = defaultStrg;
						$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgOutMessage", "500MB"));
						return false;
					}
				}
			}
		}
		else
		{
			$("#stmFileCnt").val(0);
			$("#stmFileStrg").val(0);
			stmFileCnt = 0;
			stmFileStrg = 0;
		}

		$.osl.confirm($.osl.lang("stm2101.update"),null,function(result){
			if(result.value){
				//AJAX 설정
				var data = {
						"menuId" : menuId ,
						"stmTypeCd" : stmTypeCd ,
						"stmAdmList" : stmAdmList ,
						"stmWtList" : stmWtList ,
						"stmDsTypeCd" : stmDsTypeCd ,
						"stmNtcYnCd" : stmNtcYnCd ,
						"stmCmtYnCd" : stmCmtYnCd ,
						"stmPwYnCd" : stmPwYnCd ,
						"stmTagYnCd" : stmTagYnCd ,
						"stmFileCnt" : stmFileCnt ,
						"stmFileStrg" : stmFileStrg * (1024*1024),
					};

				var ajaxObj = new $.osl.ajaxRequestAction(
						{"url":"<c:url value='/stm/stm2000/stm2100/updateStm2100BadTypeAjax.do'/>"}
						, data);
				
		  		//AJAX 전송 성공 함수
				ajaxObj.setFnSuccess(function(data){
					if(data.errorYn == "Y"){
						$.osl.alert(data.message,{type: 'error'});
						//모달 창 닫기
						$.osl.layerPopupClose();
					}else{
						$.osl.toastr(data.message,{type: 'success'});
						//모달 창 닫기
						$.osl.layerPopupClose();
						
						//datatable 조회
		   				$("button[data-datatable-id=stm2100StmTable][data-datatable-action=select]").click();
					}
				});
				
				//AJAX 전송
				ajaxObj.send();
			};
		});
	};
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        },
    };
}();

$.osl.ready(function(){
	 OSLStm2101Popup.init();
});

 </script>
<!-- end script -->