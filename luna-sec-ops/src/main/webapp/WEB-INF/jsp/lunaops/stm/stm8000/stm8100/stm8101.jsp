<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="stm8110Info" autocomplete="off" >
	<input type="hidden" name="prjGrpId" id="prjGrpId" value="<c:out value='${param.prjGrpId}'/>">
	<input type="hidden" name="prjId" id="prjId" value="<c:out value='${param.prjId}'/>">
	<input type="hidden" name="prjNm" id="prjNm" value="<c:out value='${param.prjNm}'/>">
	<input type="hidden" name="strgRepId" id="strgRepId" value="<c:out value='${param.strgRepId}'/>">
	<div class="kt-portlet kt-portlet--mobile osl-stm__portlet kt-margin-b-0">
		<div class="kt-portlet__body">
			<div class="row">
				<!-- 배정 목록 출력 -->
				<div class="col-lg-6 col-md-6 col-sm-12 col-12">
					<div class="form-group kt-margin-b-10">
						<div class="kt-margin-b-10">
							<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">리비전 열람 권한</span></label>
							<span class="float-right">
								<button type="button" class="btn btn-outline-success btn-sm" id="reset_revision" name="reset_revision" value=""><span data-lang-cd="">초기화</span></button>
							</span>
						</div>
						<div class="form-group kt-margin-b-10">
							<div class="kt-list ps--active-y form-control kt-padding-10 overflow-auto osl-height--240" id="strgRevisionAuth" name="strgRevisionAuth">
							</div>
						</div>
					</div>
					<div class="form-group kt-margin-b-0">
						<div class="kt-margin-b-10">
							<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="">소스 열람 권한</span></label>
							<span class="float-right">
								<!-- <button type="button" class="btn btn-brand btn-sm" id="equalBtn" name="equalBtn" value=""><span data-lang-cd="">리비전 열람 권한 동일</span></button> -->
								<button type="button" class="btn btn-outline-success btn-sm" id="reset_file" name="reset_file" value=""><span data-lang-cd="">초기화</span></button>
							</span>
						</div>
						<div class="form-group kt-margin-b-10">
							<div class="kt-list ps--active-y form-control kt-padding-10 osl-height--240 overflow-auto" id="strgFileCodeAuth" name="strgFileCodeAuth">
							</div>
						</div>
						<span class="kt-margin-t-5 float-right kt-align-right font-italic kt-font-inverse-metal osl-font-xs" data-lang-cd="">소스 열람 권한은 리비전 열람 권한이 있어야 합니다.</span>
					</div>
				</div>
				<!-- 배정 목록 출력 끝 -->
				<!-- 미배정 목록 출력 -->
				<div class="col-lg-6 col-md-6 col-sm-12 col-12">
					<!--검색 영역-->
					<div class="row kt-margin-0">
						<label><i class="fas fa-user-alt kt-margin-r-5"></i><span data-lang-cd="">미배정 권한그룹 및사용자</span></label>
						<input type="hidden" id="typeString" name="typeString" value="${param.typeString }"/>
						<input type="hidden" id="dataList" name="dataList" value='${param.dataList}'/>
					</div>
					<div class="row kt-margin-0 kt-margin-t-10">
						<div class="input-group">
							<div class="input-group-prepend">
								<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0" name="selectSearchBtn" id="selectSearchBtn"><span data-lang-cd="common.name.all">전체</span></button>
								<div class="dropdown-menu">
									<a class="selectSearchItem dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all"><span data-lang-cd="common.name.all">전체</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchAuthGrpNm" data-opt-type="select"><span data-lang-cd="">권한그룹 명</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrId" data-opt-type="text"><span data-lang-cd="">사용자 ID</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrNm" data-opt-type="text"><span data-lang-cd="">사용자 명</span></a>
								</div>
							</div>
							<select class="kt-select2 form-control kt-hide" id="searchSelect" name="searchSelect" aria-hidden="true">
							</select>
							<input type="text" class="form-control" disabled="disabled" name="subSearchData" id="subSearchData">
							<div class="input-group-prepend">
								<button type="button" class="btn btn-brand" name="searchBtn" id="searchBtn">
									<span data-lang-cd="">검색</span>
								</button>
							</div>
						</div>
					</div>
					<div class="kt-list ps--active-y form-control kt-margin-t-10 kt-padding-10 overflow-auto osl-height--480" id="strgNonAssList" name="strgNonAssList">
					</div>
				</div>
				<!-- 미배정 목록 출력끝 -->
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm8110SaveSubmit"><i class="fa fa-check-square"></i><span data-lang-cd="">저장</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLStm8100 = function () {
	var formId="stm8110Info";
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//문구 세팅 
	$("#stm8110SaveSubmit > span").text($.osl.lang("stm8110.complete"));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	//리비전, 소스열람 범위 목록 되돌리기를 위한 변수 선언
	var oriRevision;
	var oriFileCode;
	
	//비교를 위한 변수 선언
	var resultRevision=[];
	var resultFileCode=[];
	var resultAllList=[];
	
	//선택한 프로젝트 그룹, 프로젝트, 소스 저장소 id
	var selPrjGrpId = $("#prjGrpId").val();
	var selPrjId = $("#prjId").val();
	var selPrjNm = $("#prjNm").val();
	var selStrgRepId = $("#strgRepId").val();
	
	// 기본 설정
	var documentSetting = function(){

		//리비전 열람 권한 배정 목록 가져오기
		selectAssRevisionAuth();
		//소스 열람 권한 배정 목록 가져오기
		selectAssFileCodeAuth();
		//권한 목록 가져오기
		settingAuthList();
		//리스트 그린 후 click function 적용
		drawAfterFtSetting();
		// 위치에 맞는 버튼만 보이게 하기
		showHideBtn("strgRevisionAuth", "right", 'left');
		showHideBtn("strgFileCodeAuth", "right", 'left');
		showHideBtn("strgNonAssList", "left", 'right');
		
		//kt-select2 설정
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
			//이전에 목록 hide한것이 있다면 모두 제거
			$.each($("#strgNonAssList").children(), function(idx, value){
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
				
				$.each($("#strgNonAssList").children(), function(idx, value){
					//사용자 id, 명 검색은 keypress 이벤트가 적용되므로
					//해당 input으로 변경되었을 당시에 권한그룹 감추기
					//권한그룹 목록은 숨기기
					if($(this).data("authTypeCd")=='01'){
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
				$.each($("#strgNonAssList").children(), function(idx, value){
					$(this).removeClass("kt-hide");
				});
			}else{
				$.each($("#strgNonAssList").children(), function(idx, value){
					if($("#searchSelect").val() != $(this).data("optIndex")){
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
				//이전에 목록 hide한것이 있다면 모두 제거
				$.each($("#strgNonAssList").children(), function(idx, value){
					$(this).removeClass("kt-hide");
				});
			}else if(space == "searchAuthGrpNm"){
				//이전에 목록 hide한것이 있다면 모두 제거
				$.each($("#strgNonAssList").children(), function(idx, value){
					//권한 그룹 목록 나타내기
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
					}else{
						//사용자 목록은 감추기
						$(this).addClass("kt-hide");
					}
				});
			}else if(space === "searchUsrId"){ //text-사용자 id
				//검색어
				var txt = $("#subSearchData").val();
				$.each($("#strgNonAssList").children(), function(idx, value){
					if($(this).data("authTypeCd")=="02" && $(this).data("authTargetId").indexOf(txt) > -1){
						$(this).removeClass("kt-hide");
					}else{
						$(this).addClass("kt-hide");
					}
				});
			}else{ //text - 사용자명
				//검색어
				var txt = $("#subSearchData").val();
				$.each($("#strgNonAssList").children(), function(idx, value){
					if($(this).data("authTypeCd")=="02" &&  $(this).data("authTargetNm").indexOf(txt) > -1){
						$(this).removeClass("kt-hide");
					}else{
						$(this).addClass("kt-hide");
					}
				});
			}
		});
		
		//리비전 배정 목록
		new Sortable($('#strgRevisionAuth')[0], {
			group: {
				//그룹 이름
				name: 'strgRevisionAuth',
	            //들어 올 수 있는  group의 name
	            put:['strgNonAssList']
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
 				var result = checkMove(moveDiv, resultRevision);
 				if(result == 1){
 					//이미 있는 경우 복사 중지
 					evt.item.remove();
 				} 
 				// 위치에 맞는 버튼만 보이게 하기
 				showHideBtn("strgRevisionAuth", "right", 'left');
 				
 				//미배정 목록에서 모두 배정된 경우 안보이게 처리
 				var oriCard = $(evt.clone);
 				checkDoubleMove(oriCard);
 			} 
	    });
		//소스 배정 목록
		new Sortable($('#strgFileCodeAuth')[0], {
			group: {
				//그룹 이름
				name: 'strgFileCodeAuth',
	            //들어 올 수 있는  group의 name
	            put:['strgNonAssList']
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
 				//복사되는 원본
 				var oriCard = $(evt.clone);
 				//복사된 아이템
 				var moveDiv = $(evt.item);
 				/*추가 동작은 이쪽에서 구현하시면 됩니다*/
 				var result = checkMove(moveDiv, resultFileCode);
 				if(result == 1){
 					//이미 있는 경우 복사 중지
 					moveDiv.remove();
 				}else{
 					$("#strgFileCodeAuth").prepend(moveDiv);
 				}
 				//리비전 열람 권한 목록에도 있는지 확인하여 리스트 추가
				var resultLink = checkLinkAuth(moveDiv.data("authTargetId"), resultRevision, resultFileCode, "add");
 				if(resultLink == 1){
 					//동시 작업이 되었으므로
 					//리비전 목록에도 그리기
 					var copyDiv = $(oriCard.clone(true));
 					$("#strgRevisionAuth").prepend(copyDiv);
	 				// 위치에 맞는 버튼만 보이게 하기
	 				showHideBtn("strgRevisionAuth", "right", 'left');
 				}
 				showHideBtn("strgFileCodeAuth", "right", 'left');
 				
 				//미배정 목록에서 모두 배정된 경우 안보이게 처리
 				checkDoubleMove(oriCard);
 			} 
	    });
		//미배정 목록
		new Sortable($('#strgNonAssList')[0], {
			group: {
				//그룹 이름
				name: 'strgNonAssList',
	            //들어 올 수 있는  group의 name
	            put:['strgRevisionAuth', 'strgFileCodeAuth'],
	       		//이동시 복사의 형태
	            pull: 'clone',
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
 				if($(evt.from).attr("id") == "strgRevisionAuth"){
 					var _authTargetId = moveDiv.data("authTargetId");
 	 	        	//리비전에서 제거할 경우, 소스 열람권한에도 있을 시 같이 제거
 	 	        	var result = checkLinkAuth(_authTargetId, resultRevision, resultFileCode, "remove");
 	 	        	if(result == 1){
 	 	        		//둘다 존재하여 동시 제거했을 때
 	 	        		//기존의 소스 열람 권한 목록에서 동일한 항목 제거
 	 	        		$.each($("#strgFileCodeAuth").children(), function(idx, value){
 	 	        			if($(value).data("authTargetId") == _authTargetId){
 	 	        				//authTargetId가 같은 항목 제거
 	 	        				$(value).remove();
 	 	        				//each 종료
 	 	        				return false;
 	 	        			}
 	 	        		});
 	 	        	}else{
 	 	        		//둘다 존재하지 않은 경우 동작 없이 result = 0
 	 	        		//리비전에서 나가는 항목만 제거
	 	 	        	checkMove(moveDiv, resultRevision, true);
 	 	        	}
 				}else{
 					checkMove(moveDiv, resultFileCode, true);
 				}
 				//중복 여부만 체크하여
 				checkDoubleMove(moveDiv);
 				// 위치에 맞는 버튼만 보이게 하기
 				showHideBtn("strgNonAssList", "left", 'right');
 				//미배정 목록은 전부 가지고 있으므로
 				//복사 중지
				moveDiv.remove();
 				//미배정 목록 중복 확인
 				checkDoubleMove(moveDiv, true);
 			} 
	    });
		
		//리비전 목록과 동일하게
		$("#equalBtn").click(function(){
			$("#strgFileCodeAuth").empty();
 			// 리비전 목록 가져오기
 			var keepList = addJsonList("strgRevisionAuth",true);
 			resultFileCode = resultRevision;
			drawAuthList(keepList, "strgFileCodeAuth");
			
			var oriCard = $("#strgNonAssList").children();
			//리비전, 소스코드 권한으로 모두 배정되었으므로 동일 항목은 감추기
			$.each(oriCard, function(idx, value){
				checkDoubleMove($(value));
			});
			
			//소스 열람영역 - left버튼 감추기
			showHideBtn("strgFileCodeAuth", "right", 'left');
			//미배정 열람영역 - right버튼 감추기
			showHideBtn("strgNonAssList", "left", 'right');
		});

		//리비전_초기화 버튼 클릭 시
		$("#reset_revision").click(function(){
			$("#strgRevisionAuth").empty();
			drawAuthList(oriRevision, "strgRevisionAuth");
			resultRevision = [];
			$.each(oriRevision, function(idx, value){
				resultRevision.push(value.authTargetId);
			});
			
			var oriCard = $("#strgNonAssList").children();
			//리비전, 소스코드 권한으로 모두 배정되었는지 체크
			$.each(oriCard, function(idx, value){
				checkDoubleMove($(value));
			});
			
			//리비전 열람영역 - left버튼 감추기
			showHideBtn("strgRevisionAuth", "right", 'left');
			//미배정 열람영역 - right버튼 감추기
			showHideBtn("strgNonAssList", "left", 'right');
		});
		
		//소스_초기화 버튼 클릭 시
		$("#reset_file").click(function(){
			$("#strgFileCodeAuth").empty();
			drawAuthList(oriFileCode, "strgFileCodeAuth");
			resultFileCode = [];
			$.each(oriFileCode, function(idx, value){
				resultFileCode.push(value.authTargetId);
			});
			
			var oriCard = $("#strgNonAssList").children();
			//리비전, 소스코드 권한으로 모두 배정되었는지 체크
			$.each(oriCard, function(idx, value){
				checkDoubleMove($(value));
			});
			
			//소스 열람영역 - left버튼 감추기
			showHideBtn("strgFileCodeAuth", "right", 'left');
			//미배정 열람영역 - right버튼 감추기
			showHideBtn("strgNonAssList", "left", 'right');
		});
		
		// 완료 버튼 클릭 될 때 이벤트 발생 
		$("#stm8110SaveSubmit").click(function(){
			submitAuth();
		});
	};

	/**
	 * function 명 	: selectAssRevisionAuth
	 * function 설명	: 해당 프로젝트, 소스저장소에 리비전 열람 권한 배정된 권한 그룹 목록 표출
	 */
	var selectAssRevisionAuth = function(){
		 var data = {
				prjGrpId : selPrjGrpId,
				prjId : selPrjId,
				strgRepId : selStrgRepId
		};
	
		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm8000/stm8100/selectStm8110AssStrgListAjax.do'/>", "async": false}
 				, data);
		
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var stm8110AssList = data.stm8110AssList;
				//ori 정보 가지고 있기
				oriRevision = stm8110AssList;
				
				//resultRevision에 저장
				$.each(stm8110AssList, function(idx, value){
					resultRevision.push(value.authTargetId);
				});
				
				//목록에 세팅하기 - draw
				drawAuthList(stm8110AssList, "strgRevisionAuth");
			}
    	});
		//ajax 전송
    	ajaxObj.send();
	};
	
	/**
	 * function 명 	: selectAssFileCodeAuth
	 * function 설명	: 해당 프로젝트, 소스저장소에 소스 열람 권한 배정된 권한 그룹 목록 표출
	 */
	var selectAssFileCodeAuth = function(){
		 var data = {
					prjGrpId : selPrjGrpId,
					prjId : selPrjId,
					strgRepId : selStrgRepId
			};

		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm8000/stm8100/selectStm8120AssStrgListAjax.do'/>", "async": false}
				, data);
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var stm8120AssList = data.stm8120AssList;
				//ori 정보 가지고 있기
				oriFileCode = stm8120AssList;
				//resultFileCode에 저장
  				$.each(stm8120AssList, function(idx, value){
  					resultFileCode.push(value.authTargetId);
				});
				//목록에 세팅하기 - draw
				drawAuthList(stm8120AssList, "strgFileCodeAuth");
			}
    	});
		//ajax 전송
    	ajaxObj.send();
	};
	
	/**
	 * function 명 	: settingAuthList
	 * function 설명	: 배정/미배정된 권한 그룹 및 사용자 목록 호출
	 */
	var settingAuthList = function(){
		
		//세팅할 데이터 정리하기
		var allList = [];
		
		// 해당 프로젝트의 권한 목록 전체 가져오기
		// 검색할 메뉴 id
    	var data = {
				prjGrpId : selPrjGrpId,
				prjId : selPrjId,
		};
		
		//AJAX 설정
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm8000/stm8100/selectStm8100PrjAllAuthAndUserList.do'/>", "async": false}
				, data);
		
  		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var stm8100AllList = data.stm8100AllList;
				
				//상단의 select 박스 option 넣기
				$("#searchSelect").html("");
				//select에 목록 추가
				var innerHtml = "<option value='all'>"+$.osl.lang("common.name.all")+"</option>";
				$("#searchSelect").append(innerHtml);
				$.each(stm8100AllList, function(idx, val){
					if(val.authTypeCd == "01"){
						//select에 목록 추가
						var innerHtml = "<option value='"+idx+"' data-auth-target-id='"+val.authTargetId+"'>"+$.osl.escapeHtml(val.authTargetNm)+"</option>";
						$("#searchSelect").append(innerHtml);

						//resultAllList에 저장
						resultAllList.push(val.authTargetId);
					}
				});
  		
				//목록에 세팅하기 - draw
				drawAuthList(stm8100AllList, "strgNonAssList");
				
				//그린 후 더블 체크
				var oriCard = $("#strgNonAssList").children();
				$.each(oriCard, function(idx, value){
					checkDoubleMove($(value));
				});
			}
		});
		//ajax 전송
    	ajaxObj.send();
	};

	/**
	* function 명 	: addJsonList
	* function 설명	: 선택한 권한 배정 리스트를 전달한다.
	* param : elemId 가져올 리스트 div id(#제외)
	*/
    var addJsonList = function(elemId){
		var targetId = '#' + elemId;
		var dataList = [];

		var divList = $(targetId).children();
		
		$.each(divList, function(index, value){
			var dataOne = {};
			 
			dataOne.prjGrpId = selPrjGrpId;
			dataOne.prjId = selPrjId;
			dataOne.prjNm = selPrjNm;
			dataOne.strgRepId = selStrgRepId;
			dataOne.authTargetId = $(value).data("authTargetId");
			dataOne.authTypeCd = $(value).data("authTypeCd");
			dataOne.authTargetNm = $(value).data("authTargetNm");
			dataOne.authTargetImgId = $(value).data("authTargetImgId");
			dataOne.authTargetEmail = $(value).data("authTargetEmail");
			dataOne.authTargetDeptId = $(value).data("authTargetDeptId");
			dataOne.authTargetDeptNm = $(value).data("authTargetDeptNm");
			
			dataList.push(dataOne);
		});
		
		return dataList;
    };
	
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
								+"<a class='dropdown-item stmRevisionListMoveBtn'>"+"리비전 열람"+"</a>"
								+"<a class='dropdown-item stmFileCodeListMoveBtn'>"+"소스 열람"+"</a>"
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
									+"<span class='badge badge-success osl-margin-left--auto'>"+"권한그룹"+"</span>"
								+"</div>" //타이틀 종료		
								//내용 시작
								+"<div class='osl-card__prjnm'>"
									+$.osl.escapeHtml(selPrjNm)
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
					listHtml += "<span class='' data-open-id='"+value.authTargetId+"'>"
										+ $.osl.user.usrImgSet(value.authTargetImgId, paramData )
									+"</span>"
									+"<span class='badge badge-primary osl-margin-left--auto'>"+"사용자"+"</span>"
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

			//리비전 권한 배정 목록에 있던 경우
			//배열에서 해당 제거
			if(formId=="strgRevisionAuth"){
				var _authTargetId = moveCard.data("authTargetId");
				//리비전에서 제거할 경우, 소스 열람권한에도 있을 시 같이 제거
				var result = checkLinkAuth(_authTargetId, resultRevision, resultFileCode, "remove");
 	        	if(result == 1){
 	        		//둘다 존재하여 동시 제거했을 때
 	        		//기존의 소스 열람 권한 목록에서 동일한 항목 제거
 	        		$.each($("#strgFileCodeAuth").children(), function(idx, value){
 	        			if($(value).data("authTargetId") == _authTargetId){
 	        				//authTargetId가 같은 항목 제거
 	        				$(value).remove();
 	        				//each 종료
 	        				return false;
 	        			}
 	        		});
 	        	}else{
 	        		//둘다 존재하지 않은 경우 동작 없이 result = 0
 	        		//리비전에서 나가는 항목만 제거
	 	        	checkMove(moveCard, resultRevision, true);
 	        	}
			}else{
				//소스 열람 권한 배정 목록에 있던 경우
				//배열에서 해당 제거
				checkMove(moveCard ,resultFileCode, true);
			}//else end
			
			//미배정 목록 중복 확인
			checkDoubleMove(moveCard, true);

			//미배정 영역 - right 버튼 감추기
			showHideBtn("strgNonAssList", 'left', "right");
			
			//해당 객체만 삭제
			moveCard.remove();
 		}); //배정 목록에서 제거할 때 끝
 		
 		//미배정 목록에서 제거할 때 - 리비전 목록으로 전달할 경우
 		$('.stmRevisionListMoveBtn').click(function(){
 			//드롭다운 버튼 감추기
			$(this).parent().removeClass("show");
			//원 객체
			var oriCard = $(this).parents(".card");
			//이동할 객체
			var moveCard = oriCard.clone(true);
			var result = checkMove(moveCard, resultRevision);
			
			if(result == 0){
				//존재안하면 복사하기
				$("#strgRevisionAuth").prepend(moveCard);
			}

			//리비전, 소스코드 권한으로 모두 배정되었는지 체크
			checkDoubleMove(oriCard);
			//리비전 열람영역 - left버튼 감추기
			showHideBtn("strgRevisionAuth", "right", 'left');
 		});

 		//미배정 목록에서 제거 - 소스 열람 목록으로 전달할 경우
 		$('.stmFileCodeListMoveBtn').click(function(){
 			//드롭다운 버튼 감추기
			$(this).parent().removeClass("show");
			//원 객체
			var oriCard = $(this).parents(".card");
			//이동할 객체
			var moveCard = oriCard.clone(true);
			
			var result = checkMove(moveCard, resultFileCode);
			if(result == 0){
 				//존재안하면 복사하기
				$("#strgFileCodeAuth").prepend(moveCard);
				
				//리비전 열람 권한 목록에도 있는지 확인하여 리스트 추가
				var resultLink = checkLinkAuth(moveCard.data("authTargetId"), resultRevision, resultFileCode, "add");
 				if(resultLink == 1){
 					//리비전 권한 목록에도 추가 되었으므로
 					//이동할 객체 추가 복사
					moveCard = oriCard.clone(true);
 					//카드 그리기
 					$("#strgRevisionAuth").prepend(moveCard);
					//리비전 열람영역 - left버튼 감추기
					showHideBtn("strgRevisionAuth", "right", 'left');
 				}
 				
			}

			//리비전, 소스코드 권한으로 모두 배정되었는지 체크
			checkDoubleMove(oriCard);
			//소스 열람영역 - left버튼 감추기
			showHideBtn("strgFileCodeAuth", "right", 'left');
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
	* function 설명	: 리비전, 소스코드 권한으로 모두 배정되었는지 체크 or 미배정 목록 중복 검사
	* param : oriCard 검사하려는 elem
	* param : nonListCheck 미배정 목록 중복 검사할 경우(true)
	*/
	var checkDoubleMove = function(oriCard, nonListCheck){
		var _authTargetId = oriCard.data("authTargetId");
		if(nonListCheck){
			//미배정 목록으로 들어오는 경우
			var otherItems = $("#strgNonAssList").children();
			$.each(otherItems, function(idx, value){
				if($(value).data("authTargetId")==_authTargetId){
					$(value).removeClass("kt-hide");
				}
			});
		}else{
			//미배정에서 나가는 경우
			var revisionIdx = resultRevision.indexOf(_authTargetId);
			var fileCodeIdx = resultFileCode.indexOf(_authTargetId);
			
			//둘다 존재하는지 체크
			if(revisionIdx>=0 && fileCodeIdx >=0){
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
	* function 명 	: checkLinkAuth
	* function 설명	: 서로 연관된 권한 배정에 대하여 동시 추가/동시 제거
	* param : authTargetId 검사하려는 authTargetId
	* param : 1단계 권한 arrayUnderList
	* param : 2단계 권한 arrayTopList
	* param : 동작구분 action(add, remove)
	*/
	var checkLinkAuth = function(authTargetId, arrayUnderList, arrayTopList, action){
		//하위 권한 리스트에 존재하는지 확인
		var arrayUnderListIdx = arrayUnderList.indexOf(authTargetId);
		//상위 권한 리스트에 존재하는지 확인
		var arrayTopListIdx = arrayTopList.indexOf(authTargetId);
		//동작 구분
		if(action == "add"){
			//추가
			//2단계 권한만 존재하는 경우
			if(arrayUnderListIdx==-1 && arrayTopListIdx >= 0){
				$.osl.alert("소스 열람을 위해선 리비전 열람 권한도 필요합니다. 리비전 열람 권한에도 배정됩니다.");
				//하위 권한에도 추가하기
				arrayUnderList.push(authTargetId);
				return 1;
			}else{
				return 0;
			}
		}else{
			//제거
			//둘다 존재할 때
			if(arrayUnderListIdx >= 0 && arrayTopListIdx >= 0){
				$.osl.alert("소스 열람 권한은 리비전 열람권한이 있어야 가능합니다. 리비전 열람 권한이 제거됨에 따라 같이 제거됩니다.");
				//arrayList에서 동시 제거
				arrayUnderList.splice(arrayUnderListIdx, 1);
				arrayTopList.splice(arrayTopListIdx, 1);
				return 1;
			}else{
				return 0;
			}
		}
	}
	
	 /**
	* function 명 	: submitAuth
	* function 설명	: 권한 설정
	*/
	var submitAuth = function(){
		//리비전 권한
		var stmRevision = JSON.stringify(addJsonList("strgRevisionAuth", true));
		//소스 열람 권한
		var stmFileCode = JSON.stringify(addJsonList("strgFileCodeAuth", false));

		var data = {
				prjId : selPrjId,
				strgRepId : selStrgRepId,
				stmRevision : stmRevision,
				stmFileCode : stmFileCode,
		};

		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm8000/stm8100/insertStm8100AuthListAjax.do'/>", "async": false}
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

$.osl.ready(function(){
	OSLStm8100.init();
});
</script>
<!-- end script -->
