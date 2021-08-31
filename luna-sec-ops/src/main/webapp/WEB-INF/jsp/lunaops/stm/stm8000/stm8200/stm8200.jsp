<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="stm8200Info" autocomplete="off" >
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
								<button type="button" class="btn btn-brand btn-sm" id="equalBtn" name="equalBtn" value=""><span data-lang-cd="">리비전 열람 권한 동일</span></button>
								<button type="button" class="btn btn-outline-success btn-sm" id="reset_file" name="reset_file" value=""><span data-lang-cd="">초기화</span></button>
							</span>
						</div>
						<div class="form-group kt-margin-b-10">
							<div class="kt-list ps--active-y form-control kt-padding-10 osl-height--240 overflow-auto" id="strgFileCodeAuth" name="strgFileCodeAuth">
							</div>
						</div>
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
								<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0" name="selectSearchBtn" id="selectSearchBtn"><span data-lang-cd="">전체</span></button>
								<div class="dropdown-menu">
									<a class="selectSearchItem dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all"><span data-lang-cd="">전체</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchAuthGrpNm" data-opt-type="select"><span data-lang-cd="">권한그룹 명</span></a>
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
	<button type="button" class="btn btn-brand" id="stm8200SaveSubmit"><i class="fa fa-check-square"></i><span data-lang-cd="stm8000.complete">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLStm8200 = function () {
	var formId="stm8200Info";
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	//문구 세팅 
	$("#stm8200SaveSubmit > span").text($.osl.lang("stm8000.complete"));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	//리비전, 소스열람 범위 목록 되돌리기를 위한 변수 선언
	var oriRevision;
	var oriFileCode;
	
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
		//권한 목록 데이터 세팅
		settingAuthList(oriRevision, oriFileCode);
		
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
		});
		
		//엔터키 막기 - 안막으면 강제종료
		$("#"+formId).keydown(function(e){
			if(e.keyCode=='13'){
				e.preventDefault();
				$("#searchBtn").click();
				return;
			}
		});
		
		$("#searchBtn").click(function(){
			var space = $(".selectSearchItem.dropdown-item.active").data("fieldId");
			if(space == "-1"){
				//이전에 목록 hide한것이 있다면 모두 제거
				$.each($("#strgNonAssList").children(), function(idx, value){
					$(this).removeClass("kt-hide");
				});
			}else{
				//이전에 목록 hide한것이 있다면 모두 제거
				$.each($("#strgNonAssList").children(), function(idx, value){
					$(this).removeClass("kt-hide");
					if($("#searchSelect").val() != "all"){
						//검색한 조건에 맞지 않는 목록은 숨기기
						if($("#searchSelect").val() != value.getAttribute("opt-index")){
							$(this).addClass("kt-hide")
						}else{
							$(this).removeClass("kt-hide");
						}
					}
				});
			}
		});
		
		/*리비전 drag&drop sortable*/
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
 				evt.related.setAttribute("data-revision-pass", "N");
 				
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
				$(moveDiv).children('.osl-right-arrow-group').removeClass('osl-arrow-group--hide');
				$(moveDiv).children('.osl-left-arrow-group').addClass('osl-arrow-group--hide');
				//들어온 아이템이 이미 리비전에 배정되어 있던 경우
				if(evt.item.getAttribute("data-revision-pass")=="Y"){
					//복사 중지
					evt.item.remove();
				}else{
					//복사
					//리비전 배정
					evt.item.setAttribute("data-revision-pass", "Y");
					evt.clone.setAttribute("data-revision-pass", "Y");
					//원본 아이템의 정보 확인
					if(evt.clone.getAttribute("data-revision-pass")=="Y" && evt.clone.getAttribute("data-file-code-pass")=="Y"){
						evt.clone.remove();
						var _authGrpId = evt.item.getAttribute("data-auth-grp-id");
						
						//소스 배정에 있는 동일 객체 정보 변경
						var otherItems = $("#strgFileCodeAuth").children();
						$.each(otherItems, function(idx, value){
							if(value.getAttribute("data-auth-grp-id")==_authGrpId){
								value.setAttribute("data-revision-pass", "Y");
								value.setAttribute("data-file-code-pass", "Y");
							}
						});
					}
				}//else end
 			} 
	    });
		
		/*소스 drag&drop sortable*/
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
 				evt.related.setAttribute("data-file-code-pass", "N");
 				
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
				$(moveDiv).children('.osl-right-arrow-group').removeClass('osl-arrow-group--hide');
				$(moveDiv).children('.osl-left-arrow-group').addClass('osl-arrow-group--hide');
				//들어온 아이템이 이미 소스 열람에 배정되어 있던 경우
				if(evt.item.getAttribute("data-file-code-pass")=="Y"){
					//복사 중지
					evt.item.remove();
				}else{
					//복사
					//소스 배정
					evt.item.setAttribute("data-file-code-pass", "Y");
					evt.clone.setAttribute("data-file-code-pass", "Y");
					//원본 아이템의 정보 확인
					if(evt.clone.getAttribute("data-revision-pass")=="Y" && evt.clone.getAttribute("data-file-code-pass")=="Y"){
						var _authGrpId = evt.item.getAttribute("data-auth-grp-id");
						console.log(evt.clone);
						evt.clone.remove();
						
						//리비전 배정에 있는 동일 객체 정보 변경
						var otherItems = $("#strgRevisionAuth").children();
						$.each(otherItems, function(idx, value){
							if(value.getAttribute("data-auth-grp-id")==_authGrpId){
								value.setAttribute("data-revision-pass", "Y");
								value.setAttribute("data-file-code-pass", "Y");
							}
						});
					}
				}//else end
 			} 
	    });
		
		/*미배정 drag&drop sortable*/
		new Sortable($('#strgNonAssList')[0], {
	        group: {
				//그룹 이름
	        	name: 'strgNonAssList',
	            //이동시 복사의 형태
	            pull: 'clone',
	            //들어 올 수 있는  group의 name
	            put:['strgRevisionAuth','strgFileCodeAuth']
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
				$(moveDiv).children('.osl-right-arrow-group').addClass('osl-arrow-group--hide');
				$(moveDiv).children('.osl-left-arrow-group').removeClass('osl-arrow-group--hide');
				/*추가 동작은 이쪽에서 구현하시면 됩니다*/
				
				//어디서 들어왔는지 확인
				//다른 확정 리스트에서 정보 수정
				if($(evt.from).attr("id")=="strgRevisionAuth"){
					//리비전 목록에서 들어온 경우
					//소스 리스트에 남아있는 동일 객체 정보 수정
					evt.item.setAttribute("data-revision-pass", "N");
					$.each($("#strgFileCodeAuth").children(), function(index, items){
						if(items.getAttribute("data-auth-grp-id")==_authGrpId){
							items.setAttribute("data-revision-pass", "N");
						}
					});
				}else{
					//소스 리스트에서 들어온 경우
					evt.item.setAttribute("data-file-code-pass", "N");
					//리비전 리스트에 남아있는 동일 객체 정보 수정
					$.each($("#strgRevisionAuth").children(), function(index, items){
						if(items.getAttribute("data-auth-grp-id")==_authGrpId){
							items.setAttribute("data-file-code-pass", "N");
						}
					});
				}
				
				//미배정 목록에 동일 객체가 있는지 확인
				var _authGrpId = evt.item.getAttribute("data-auth-grp-id");
				
				var otherItems = $("#strgNonAssList").children();
				var resultCnt = 0;
				$.each(otherItems, function(idx, value){
					//기존에 객체 있는지 확인
					if(value.getAttribute("data-auth-grp-id")==_authGrpId){
						//sortable은 기존 데이터 안보이기만 할 뿐 가지고 있는듯
						//없다가 처음 생길 땐 이미 존재하는 것으로 표현됨
						//따라서 returnCnt가 2 이상일 땐 그리지 않음
						resultCnt ++;
						if(resultCnt>1){
							//있으면 복사안함
							evt.item.remove();
						}
					}
				});
 			}
	    });
		//드래그 앤 드롭 끝
		
		//리비전 목록과 동일하게
		$("#equalBtn").click(function(){
 			// 리비전 목록 가져오기
 			var keepList = addJsonList("strgRevisionAuth",true);
 			$("#strgRevisionAuth").empty();
			$("#strgFileCodeAuth").empty();
			setListBtn(keepList, keepList);
		});

		//리비전_초기화 버튼 클릭 시
		$("#reset_revision").click(function(){
			//현재 소스 범위 목록 리스트
			var keepList = addJsonList("strgFileCodeAuth",false);
			$("#strgRevisionAuth").empty();
			$("#strgFileCodeAuth").empty();
			setGrpAndUsrList(oriRevision, keepList);
		});
		
		//소스_초기화 버튼 클릭 시
		$("#reset_file").click(function(){
			//현재 리비전 범위 목록 리스트
			var keepList = addJsonList("strgRevisionAuth",true);
			$("#strgRevisionAuth").empty();
			$("#strgFileCodeAuth").empty();
			setGrpAndUsrList(keepList, oriFileCode);
		});
	};
	
	/**
	 * function 명 	: settingAuthList
	 * function 설명	: 배정/미배정된 권한 그룹 목록 호출
	 * param : revisionData 리비전 열람 권한 그룹 데이터
	 * param : fileCodeData 소스 열람 권한 그룹 데이터
	 */
	var settingAuthList = function(revisionData, fileCodeData){
		
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
				{"url":"<c:url value='/prj/prj2000/prj2000/selectPrj2000PrjAuthGrpList.do'/>", "async": false}
				, data);
		
  		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var authGrpList = data.prjAuthGrpList;
				
				//상단의 select 박스 option 넣기
				$("#searchSelect").html("");
				//select에 목록 추가
				var innerHtml = "<option value='all'>전체</option>";
				$("#searchSelect").append(innerHtml);
				$.each(authGrpList, function(idx, val){
					//select에 목록 추가
					var innerHtml = "<option value='"+idx+"' data-prj-id='"+val.prjId+"' data-auth-grp-id='"+val.authGrpId+"'>"+$.osl.escapeHtml(val.authGrpNm)+")</option>";
					$("#searchSelect").append(innerHtml);
				});
  		
				//리비전 권한, 소스 열람 권한 일치 여부에 따라
				//일치 여부 값 부여
				$.each(authGrpList, function(index, value){
					var revisionPass = false;
					var fileCodePass = false;
					
					//리비전 열람 권한 목록에 있는지 확인
					$.each(revisionData, function(idx, items){
						if(!$.osl.isNull(value.authGrpId)){
							if(value.authGrpId==items.authGrpId){
								revisionPass = true;
							}
						}
					});
					//소스 열람 권한 목록에 있는지 확인
					$.each(fileCodeData, function(idx, items){
						if(!$.osl.isNull(value.authGrpId)){
							if(value.authGrpId==items.authGrpId){
								fileCodePass = true;
							}
						}
					});
					
					var pushData = {};
					pushData.authGrpId = value.authGrpId;
					pushData.authGrpNm = $.osl.escapeHtml(value.authGrpNm);
					
					//리비전 권한이 있으면
					if(revisionPass){
						pushData.revisionPass = 'Y';
					}else{
						//없으면
						pushData.revisionPass = 'N';
					}
					//소스 열람 권한이 있으면
					if(fileCodePass){
						pushData.fileCodePass = 'Y';
					}else{
						//없으면
						pushData.fileCodePass = 'N';
					}
					
					allList.push(pushData);
				});
				
				//목록에 세팅하기 - draw
				drawAuthList(allList, "strgRevisionAuth", "strgFileCodeAuth", "strgNonAssList");

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
			 
			dataOne.authGrpId = value.getAttribute("data-auth-grp-id");
			 
			dataList.push(dataOne);
		});
		
		return dataList;
    };
	
	/**
	 * function 명 	: drawAuthList
	 * function 설명	: 배정/미배정된 권한 그룹 목록 표출
     * function param : 출력 데이터 정보, 그릴 element Id(#제외), 담당자/글작성범위 목록에 그릴 것인지 확인(true, false)
     * function 설명 : 지정 element에 데이터 목록 div 출력
	 */
	var drawAuthList = function(setData, revisionElemId, fileCodeElemId, nonAssListElemId){
		//초기화
		$("#"+revisionElemId).empty();
		$("#"+fileCodeElemId).empty();
		$("#"+nonAssListElemId).empty();

		var listHtml_left = ""; //왼쪽 아이콘 보이도록
 		var listHtml_right = ""; //오른쪽 아이콘 보이도록
 		var listHtml_com = ""; //공통
 		var listHtml = ""; //최종
		 
		$.each(setData, function(index, value){
			//전체 틀 시작
 			//왼쪽 아이콘 보이기, 오른쪽 아이콘 보이기
 			listHtml_left = "<div class='card kt-margin-b-10 flex-flow--row flex-flow--row--reverse' opt-index='"+index+"' data-auth-grp-id='"+value.authGrpId+"' data-auth-grp-nm='"+value.authGrpNm+"' data-revision-pass='"+value.revisionPass+"' data-file-code-pass='"+value.fileCodePass+"'>"
 								+"<div class='dropdown osl-left-arrow-group'>";
			listHtml_right =  "<div class='card kt-margin-b-10 flex-flow--row flex-flow--row--reverse' opt-index='"+index+"' data-auth-grp-id='"+value.authGrpId+"' data-auth-grp-nm='"+value.authGrpNm+"' data-revision-pass='"+value.revisionPass+"' data-file-code-pass='"+value.fileCodePass+"'>"
								+"<div class='dropdown osl-left-arrow-group osl-arrow-group--hide'>";

			//공통
			listHtml_com = "<div class='btn dropdown-toggle' id='dropdownMenuButton"+index+"' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"
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
			//리비전 열람 권한, 소스 열람 권한 범위에 모두 들어간 항목인 경우
			if(value.revisionPass=="Y" && value.fileCodePass=="Y"){
				//배정 목록에만 작성
				listHtml = listHtml_right + listHtml_com;
				
				//리비전 리스트 그리기
				listHtml += "<span class='groupuser-icon'>"
 									+"<i class='fas fa-user-tag'></i>"
 								+"</span>"
 								+$.osl.escapeHtml(value.authGrpNm)
 								+"<span class='badge badge-success osl-margin-left--auto'>"+"권한그룹"+"</span>"
 							+"</div>"
 							//타이틀 종료							
 							//내용 시작
 							+"<div class='osl-card__prjnm'>"
 								+$.osl.escapeHtml(selPrjNm);
 							+"</div>"
 							//내용 종료
						// 컨텐츠 전체영역 종료
						+ "</div>"
						//우측 이동 버튼 시작, 종료
						+"<div class='osl-right-arrow-group'></div>"
					+"</div>";
					//전체 틀 종료
					
				$("#"+revisionElemId).append(listHtml);
 				$("#"+fileCodeElemId).append(listHtml);
			}else{
				//한군데만 들어가거나 안들어간 항목인 경우
				//미배정 항목에 출력
				
				//리비전 열람 권한 배정된 항목인 경우(소스 열람 권한 미배정)
				//리비전 열람 배정 리스트 그리기
				if(value.revisionPass=="Y" && value.fileCodePass=="N"){
					listHtml = listHtml_right + listHtml_com;
					listHtml += "<span class='groupuser-icon'>"
									+"<i class='fas fa-user-tag'></i>"
								+"</span>"
								+$.osl.escapeHtml(value.authGrpNm)
								+"<span class='badge badge-success osl-margin-left--auto'>"+"권한그룹"+"</span>"
							+"</div>"
							//타이틀 종료							
							//내용 시작
							+"<div class='osl-card__prjnm'>"
								+$.osl.escapeHtml(selPrjNm)
							+"</div>"
							//내용 종료
						// 컨텐츠 전체영역 종료
						+ "</div>"
					//우측 이동 버튼 시작, 종료
					+ "<div class='osl-right-arrow-group'></div>"
				+"</div>";
				//전체 틀 종료
 	 				$("#"+revisionElemId).append(listHtml);
				}else if(value.revisionPass=="N" && value.fileCodePass=="Y"){
					listHtml = listHtml_right + listHtml_com;
					listHtml += "<span class='groupuser-icon'>"
									+"<i class='fas fa-user-tag'></i>"
								+"</span>"
								+$.osl.escapeHtml(value.authGrpNm)
								+"<span class='badge badge-success osl-margin-left--auto'>"+"권한그룹"+"</span>"
							+"</div>"
							//타이틀 종료							
							//내용 시작
							+"<div class='osl-card__prjnm'>"
								+$.osl.escapeHtml(selPrjNm)
							+"</div>"
							//내용 종료
						// 컨텐츠 전체영역 종료
						+ "</div>"
					//우측 이동 버튼 시작, 종료
					+ "<div class='osl-right-arrow-group'></div>"
				+"</div>";
				//전체 틀 종료	
 	 				$("#"+fileCodeElemId).append(listHtml);
				}else{
					listHtml = listHtml_left + listHtml_com;
					listHtml += "<span class='groupuser-icon'>"
									+"<i class='fas fa-user-tag'></i>"
								+"</span>"
								+$.osl.escapeHtml(value.authGrpNm)
								+"<span class='badge badge-success osl-margin-left--auto'>"+"권한그룹"+"</span>"
							+"</div>"
							//타이틀 종료							
							//내용 시작
							+"<div class='osl-card__prjnm'>"
								+$.osl.escapeHtml(selPrjNm)
							+"</div>"
							//내용 종료
						// 컨텐츠 전체영역 종료
						+ "</div>"
					//아무데도 안들어간 권한그룹 리스트
					//우측 이동 버튼 시작, 종료
					+ "<div class='osl-right-arrow-group osl-arrow-group--hide'></div>"
				+"</div>";
				//전체 틀 종료
					$("#"+nonAssListElemId).append(listHtml);
				}
			}
		});
 		
 		//function 적용
 		//배정 목록에서 제거할 때
 		$('.osl-right-arrow-group').click(function(){
			//이동할 객체
			var moveCard =  $(this).parent();
			//객체가 있던 곳
			var formId = moveCard.parent().attr("id");
			
			//옮길 권한 그룹id
			var _authGrpId = moveCard[0].getAttribute("data-auth-grp-id");
			
			//리비전 권한 배정 목록에 있던 경우
			if(formId==revisionElemId){
				//속성 변경
				moveCard[0].setAttribute("data-revision-pass", "N");
				//소스 권한 배정 목록에도 있으면 같이 정보 변경
				if(moveCard[0].getAttribute("data-file-code-pass")=="Y"){
					//동일 객체 정보 변경
					var otherItems = $("#"+fileCodeElemId).children();
					$.each(otherItems, function(idx, value){
						if(value.getAttribute("data-auth-grp-id")==_authGrpId){
							value.setAttribute("data-revision-pass", "N");
						}
					});
				}
			}else{
				//소스 열람 권한 배정 목록에 있던 경우
				//속성 변경
				moveCard[0].setAttribute("data-file-code-pass", "N");
				//리비전 권한 배정 목록에도 있으면 같이 정보 변경
				if(moveCard[0].getAttribute("data-revision-pass")=="Y"){
					//동일 객체 정보 변경
					var otherItems = $("#"+revisionElemId).children();
					$.each(otherItems, function(idx, value){
						if(value.getAttribute("data-auth-grp-id")==_authGrpId){
							value.setAttribute("data-file-code-pass", "N");
						}
					});
				}
			}//else end
			
			//미배정 목록에 있는지 확인
			var otherItems = $("#"+nonAssListElemId).children();
			var result = true;
			$.each(otherItems, function(idx, value){
				if(value.getAttribute("data-auth-grp-id")==_authGrpId){
					//미배정 목록에 같은 객체 있는 경우
					//리비전 정보만 변경
					if(formId==revisionElemId){
						value.setAttribute("data-revision-pass", "N");
					}else{
						//소스 열람 범위 정보만 변경
						value.setAttribute("data-file-code-pass", "N");
					}
					//미배정 목록에 있으면 복사 안함
					result = false;
				}
			});
			//미배정 목록에 있으면 복사 안함, 미배정 목록에 없을 때만 복사
			if(result){
				//미배정 목록에 없을 경우
				//객체이동
				$("#"+nonAssListElemId).prepend(moveCard);
				//아이콘 오른방향 감추기, 왼방향 나타내기
				$(this).addClass('osl-arrow-group--hide');
				$(this).siblings('.osl-left-arrow-group').removeClass('osl-arrow-group--hide');
				//피카추
				$(".osl-left-arrow-group").click(function(){
					console.log("vlzk");
				});
			}else{
				//미배정 목록에 있으면
				//해당 객체만 삭제
				$(this).parent().remove();
			}
			
 		}); //배정 목록에서 제거할 때 끝
 		
 		//미배정 목록에서 제거할 때 - 리비전 목록으로 전달할 경우
 		$('.stmRevisionListMoveBtn').click(function(){
 			//드롭다운 버튼 감추기
			$(this).parent().removeClass("show");
			//원 객체
			var oriCard = $(this).parent().parent().parent();
			//이동할 객체
			var moveCard = oriCard.clone(true);
			//속성 변경
			moveCard[0].setAttribute("data-revision-pass", "Y");
			oriCard[0].setAttribute("data-revision-pass", "Y");
			
			//이미 리비전 권한 배정되어 있는지 확인
			var toList = $("#"+revisionElemId).children();
			var toListResult = true;
			$.each(toList, function(idx, value){
				if(value.getAttribute("data-auth-grp-id")==moveCard[0].getAttribute("data-auth-grp-id") ){
					toListResult = false;							
				}
			});
			
			//리비전에 미배정되어있을 때만 실행
			if(toListResult){
				//객체 복사
				$("#"+revisionElemId).prepend(moveCard);
				//아이콘 오른방향 나타내기, 왼방향 감추기
				moveCard.children('.osl-right-arrow-group').removeClass('osl-arrow-group--hide');
				moveCard.children(".osl-left-arrow-group").addClass('osl-arrow-group--hide');
				
				//원본 아이템의 정보 확인
				//모두 배정되었을 때
				if(oriCard[0].getAttribute("data-revision-pass")=="Y" &&  oriCard[0].getAttribute("data-file-code-pass")=="Y"){
					var _authGrpId = moveCard[0].getAttribute("data-auth-grp-id");
					
					//소스 열람 배정 동일 객체 정보 변경
					var otherItems = $("#"+fileCodeElemId).children();
					$.each(otherItems, function(idx, value){
						if(value.getAttribute("data-auth-grp-id")==_authGrpId){
							value.setAttribute("data-revision-pass", "Y");
							value.setAttribute("data-file-code-pass", "Y");
						}
					});
					
					//미배정에 있던 객체 제거
					oriCard.remove();
				}
			}
 		});
 		//미배정 목록에서 제거 - 리비전 목록으로 전달할 경우 끝

 		//미배정 목록에서 제거 - 소스 열람 목록으로 전달할 경우
 		$('.stmFileCodeListMoveBtn').click(function(){
 			//드롭다운 버튼 감추기
			$(this).parent().removeClass("show");
			//원 객체
			var oriCard = $(this).parent().parent().parent();
			//이동할 객체
			var moveCard = oriCard.clone(true);
			//속성 변경
			moveCard[0].setAttribute("data-file-code-pass", "Y");
			oriCard[0].setAttribute("data-file-code-pass", "Y");
			
			//이미 소스 열람 권한 배정되어 있는지 확인
			var toList = $("#"+fileCodeElemId).children();
			var toListResult = true;
			$.each(toList, function(idx, value){
				if(value.getAttribute("data-auth-grp-id")==moveCard[0].getAttribute("data-auth-grp-id") ){
					toListResult = false;							
				}
			});
			
			//소스 열람에 미배정되어있을 때만 실행
			if(toListResult){
				//객체 복사
				$("#"+fileCodeElemId).prepend(moveCard);
				//아이콘 오른방향 나타내기, 왼방향 감추기
				moveCard.children('.osl-right-arrow-group').removeClass('osl-arrow-group--hide');
				moveCard.children(".osl-left-arrow-group").addClass('osl-arrow-group--hide');
				
				//원본 아이템의 정보 확인
				//모두 배정되었을 때
				if(oriCard[0].getAttribute("data-revision-pass")=="Y" &&  oriCard[0].getAttribute("data-file-code-pass")=="Y"){
					var _authGrpId = moveCard[0].getAttribute("data-auth-grp-id");
					
					//리비전 열람 배정 동일 객체 정보 변경
					var otherItems = $("#"+revisionElemId).children();
					$.each(otherItems, function(idx, value){
						if(value.getAttribute("data-auth-grp-id")==_authGrpId){
							value.setAttribute("data-revision-pass", "Y");
							value.setAttribute("data-file-code-pass", "Y");
						}
					});
					
					//미배정에 있던 객체 제거
					oriCard.remove();
				}
			}
 		});
 		//미배정 목록에서 제거 - 소스 열람 목록으로 전달할 경우 끝
	};//drawAuthList 끝
	
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
    			{"url":"<c:url value='/stm/stm8000/stm8200/selectStm8200AssStrgListAjax.do'/>", "async": false}
 				, data);
		
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var info = data.stm8200AssList;
				//ori 정보 가지고 있기
				oriRevision = info;
			}
    	});
		//ajax 전송
    	ajaxObj.send();
	};
	
	/**
	 * function 명 	: nonAssRevisionAuth
	 * function 설명	: 해당 프로젝트, 소스저장소에 리비전 열람 권한 미배정된 권한 그룹 목록 표출
	 */
	var nonAssRevisionAuth = function(){
		 var data = {
					prjGrpId : selPrjGrpId,
					prjId : selPrjId,
					strgRepId : selStrgRepId
			};

		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm8000/stm8200/selectStm8200NonAssStrgListAjax.do'/>", "async": false}
				, data);
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var list = data.stm8200NonAssList;
				strgNonAssRevision = list;
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
    			{"url":"<c:url value='/stm/stm8000/stm8300/selectStm8300AssStrgListAjax.do'/>", "async": false}
				, data);
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var info = data.stm8300AssList;
				//ori 정보 가지고 있기
				oriFileCode = info;
			}
    	});
		//ajax 전송
    	ajaxObj.send();
	};
	
	/**
	 * function 명 	: nonAssFileCodeAuth
	 * function 설명	: 해당 프로젝트, 소스저장소에 소스 열람 권한 미배정된 권한 그룹 목록 표출
	 */
	var nonAssFileCodeAuth = function(){
		 var data = {
					prjGrpId : selPrjGrpId,
					prjId : selPrjId,
					strgRepId : selStrgRepId
			};

		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm8000/stm8300/selectStm8300NonAssStrgListAjax.do'/>", "async": false}
				, data);
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var list = data.stm8300NonAssList;
				strgNonAssFileCode = list;
			}
    	});
		//ajax 전송
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
	OSLStm8200.init();
});
</script>
<!-- end script -->
