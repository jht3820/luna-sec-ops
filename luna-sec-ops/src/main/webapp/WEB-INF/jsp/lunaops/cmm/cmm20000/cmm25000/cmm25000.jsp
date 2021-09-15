<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm25000">
	<input type="hidden" name="paramDeptNm" id="paramDeptNm" value="${param.deptName}">
	<input type="hidden" name="paramDocId" id="paramDocId" value="${param.docId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.prjId}">
	<div class="row">
		<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 kt-margin-b-20-tablet kt-margin-b-20-mobile">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>사용자 목록
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="osl-datatable-search" data-datatable-id="stm3000UsrTable"></div>
					<div class="kt_datatable" id="stm3000UsrTable"></div>
				</div>
			</div>
		</div>
		<div class="col-xl-1 col-lg-1 col-md-12 col-sm-12 col-12 osl-display__flex align-items-center justify-content-center">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 kt-margin-b-20-tablet kt-margin-b-20-mobile">
				<div class="kt-portlet__body kt-padding-15">
					<button type="button" class="btn btn-outline-brand osl-right-arrow" data-datatable-id="stm3000UsrTable" data-datatable-action="signMove" title="선택 담당자 결재선 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="signMove" tabindex="1"></button>
					<button type="button" class="btn btn-outline-brand kt-margin-t-20 osl-left-arrow" data-datatable-id="stm3000UsrTable" data-datatable-action="signRemove" title="선택 담당자 결재선 제외" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="signRemove" tabindex="1"></button>
				</div>
			</div>
		</div>
		<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="cmm25000DeptTreeInfo">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>결재선 정보
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body kt-padding-r-15">
					<div class="kt-scroll kt-padding-r-10" data-height="525" id="signCardTable"></div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="cmm25000SelDoc"><i class="fa fa-save"></i><span>결재 등록</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span>Close</span></button>
</div>
<script>
"use strict";
var OSLCmm25000Popup = function () {
		
	//카드에 들어갈 순서
    var ord=1;
    //우측 결재선에 들어간 card의 사용자 아이디 값을 담아둘 배열
    var selectUsrArray=[];
    //카드
    var usrStr = '';
	//이미 배정된 카드 체크
	var usrIdDupleList = 0;
	
	//프로젝트 아이디
	var prjId = $('#paramPrjId').val();
	
	//산출물 아이디
	var docId = $('#paramDocId').val();
	
	//등록 타입
	var type = '';
	
    // Private functions
    var documentSetting = function () {
	    
    	selectSignUsrInfList();
    	
	    //위젯 클릭 active효과 설정
	   	$("#cmm25000DeptTreeInfo").on("click",".osl-sign-card",function(){
	   		if($(this).hasClass('selected')){
	   			$(this).removeClass('selected');
	   		}else{
	   			$(this).addClass('selected');
	   		}
	   	});
		
	    //저장 버튼 클릭시
	    $('#cmm25000SelDoc').click(function(){
	    	
	    	
    		$.osl.confirm($.osl.lang("cmm25000.message.confirm.saveString"),null,function(result) {
    	        if (result.value) {
    	        	//연결정보 저장
    	        	saveFormAction();
    	        }
    		});
	    	
	    });
	    
	    
	    //결재선 저장
	    var saveFormAction = function(){
	    	
			var signUsrInfs = [];
	    	
	    	var selSignUsrInfs = $('.osl-sign-card');
	    	
	    	if(selSignUsrInfs.length == 0){
	    		//lang
	    		$.osl.alert("등록된 결재자가 없습니다.");
	    		return false;
	    		
	    	}
	    	
	    	//선택된 유저 저장
	    	$.each(selSignUsrInfs,function(idx, map){
	    		
	    		var signUsrInf = {};
	    		signUsrInf.usrId = $(this).attr("data-usr-id");
	    		signUsrInf.ord = $(this).find(".dplStartOrdCell").attr("ord");
	    		signUsrInfs.push(signUsrInf);
	    	})
	    	
	    	//AJAX 설정
    		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj3000/prj3000/savePrj3003SignInfoAjax.do'/>"}
				,{signUsrInfList: JSON.stringify(signUsrInfs), prjId : prjId, docId : docId, type : type});

    		//AJAX 전송 성공 함수
    		ajaxObj.setFnSuccess(function(data){
    			if(data.errorYn == "Y"){
    				$.osl.alert(data.message,{type: 'error'});
    			}else{
    				//저장 성공
    				$.osl.toastr(data.message);
    				
    				//모달 창 닫기
    				$.osl.layerPopupClose();
    				
    			}
    		});
    		
    		//AJAX 전송
    		ajaxObj.send();
	    }
	    
	   	//퍼펙트 스크롤 적용
	   	KTUtil.scrollInit($("#signCardTable")[0], {
	           disableForMobile: true, 
	           resetHeightOnDestroy: true, 
	           handleWindowResize: true, 
	           height: 525
	       });
	   	
	   	//사용자 목록 데이터 테이블 세팅
	   	$.osl.datatable.setting("stm3000UsrTable",{
			data: {
				source: {
					read: {
						url: "/stm/stm3000/stm3000/selectStm3000ListAjax.do"
					}
				},
				pageSize: 8
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [8, 10, 20, 30, 50, 100]
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, autoHide: false, sortable: false, sortable: false},
				{field: 'usrNm', title: '사용자 명', textAlign: 'left', width: 160, search: true, autoHide: false,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'email', title: '이메일', textAlign: 'left', width: 170, search: true},
				{field: 'usrPositionNm', title: '직급', textAlign: 'center', width: 110, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직책', textAlign: 'center', width: 120, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
			],
			actionBtn:{
				"title": "결재선 등록",
				"signMoveRowBtn": true,
				"dblClick": false,
				"click": false,
				"update": false,
				"delete": false,
			},
			actionTooltip:{
				"signMoveRowBtn": "결재선 등록"
			},
			theme:{
				actionBtnIcon:{
					"signMoveRowBtn": "fa fa-arrow-alt-circle-right",
				}
			},
			rows:{
				beforeTemplate: function (row, data, index){
					//이미 배정된 사용자인경우
					if(selectUsrArray.indexOf(data.usrId) > -1){
						row.addClass("osl-datatable__row-assign--none");
					}
				}
			},
			actionFn:{
				"signMove":function(rowData,datatableId,type){
					var rowDatas = rowData;
					
					//선택 레코드 없는 경우
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("common.user.auth.allUsrInsert",rowDatas.length),{html:true}, function(result){
						
						if (result.value) {
							//사용자 배정 처리
							fnAllUsrInsert(rowDatas);
						}
					});
					
				},
				"signMoveRowBtn":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					fnAllUsrInsert(rowDatas);
				}
				
			}
		});
	   	
	    	
	   	//결재선에서 제거
	   	$('button[data-datatable-action="signRemove"]').click(function(){
	   	  	//대상 데이터 테이블
	   		var datatable = $.osl.datatable.list["stm3000UsrTable"].targetDt;
			//데이터 테이블의 데이터 배열
			var list = datatable.dataSet;
			//우측 카드
	   		var target = $('.osl-sign-card.selected');
	   		//우측 카드가 가지고 있는 usrId
			var targetId;	
	   		
	   		//삭제될 데이터 여부에 따라서 선택해달라는 toast또는 선택된 것을 삭제할지 여부 판단
	   		if(target.length>0){
				//삭제 확인 창 실행
				$.osl.confirm('선택한 '+target.length+'개의 결재선을 삭제하시겠습니까?',{html:true}, function(){
					
					//데이터 테이블 조회
					$.each(list,function(idx, map){
						//우측 결재목록과 비교
						for(var num = 0; num < target.length; num++){
							//우측 카드에 있는 선택된 사용자 id 추출
		    				targetId = target[num].getAttribute('data-usr-id');
							//우측 카드의 id 값과 데이터 테이블 각 row id을 비교하여 동일 할 때
		    				if(datatable.dataSet[idx].usrId==targetId){
		    					//selectUsrArray배열에서 해당 id 제거
								selectUsrArray.splice(selectUsrArray.indexOf(targetId), 1);
								ord --;
							}
		    			}
					});						
					
					//선택된 카드 제거
					$('.osl-sign-card.selected').remove();
	   	    		//데이터테이블 재 조회
					datatable.reload();
					//툴팁 제거
					$("div.tooltip.show").remove();
	
					
					//최종 결재자 번호 수정
					updateLastUsrCard();
	   			});		
	   		}else{
	   			//선택된 카드가 없을 때 toast
	   			$.osl.toastr('삭제할 결재선을 선택해주세요.',{type: 'warning'});
	   		}
	   	});
	   	
	   	/*결재선 sortable 세팅*/
		new Sortable($('#signCardTable')[0], {
			group:'shared',
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        onEnd:function(evt){
	        	//변경된 index
				var newIndex = evt.newIndex-2;
				var oldIndex = evt.oldIndex-2;
	        	//실행 순서 변경 적용
				fnJobDivOrdModify(evt.item, newIndex, oldIndex);
	        }
	    });
	
	};
   
    //결재선 정보 가져오기
	var selectSignUsrInfList = function(){
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
			{"url":"<c:url value='/prj/prj3000/prj3000/selectPrj3003SignUsrListAjax.do'/>"}
			, {prjId : prjId, docId:docId});

		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				//가져온 정보로 유저카드 만들기
				$.each(data.signUsrInfList,function(idx,map){
					
					//이미 추가된 사용자 목록 추가
					if(selectUsrArray.indexOf(map.usrId) != -1){
						return true;
					}
					
		    		//사용자 카드 생성			
					userSetting(map);
			    		
				});
				
				//가져온 데이터 있으면 업데이트 아니면 인서트
				if(data.signUsrInfList.length == 0){
					type = 'insert';
				}else{
					type = 'update';
				}
				
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	}
  	
    //배정
    function fnAllUsrInsert(selDatas){
      	//대상 데이터 테이블
    	var datatable = $.osl.datatable.list["stm3000UsrTable"].targetDt;
      	
    	$.each(selDatas,function(idx,map){
    		//이미 추가된 사용자 목록 추가
			if(selectUsrArray.indexOf(map.usrId) != -1){
				usrIdDupleList++;
				return true;
			}
    		//사용자 카드 생성
			userSetting(map);
    		
    	});

    	//출력 메시지 세팅
		var toastrMsg = "";
		var toastrType = "success";
    	
		//배정 될 사용자
    	if(selDatas.length > usrIdDupleList){
			toastrMsg += selDatas.length-usrIdDupleList+"명의 사용자가 배정되었습니다.";
		}
    	
    	//배정되지 않은 사용자
    	if(usrIdDupleList > 0){
    		//이미 추가된 메시지 있는 경우 </br>
			if(toastrMsg.length > 0){
				toastrMsg += "</br>";
			}			
			toastrMsg += "이미 배정된 " + usrIdDupleList + " 명의 사용자 제외";
			toastrType = "warning";
		}
    	
    	//전부 배정이 되었을 경우
		if(usrIdDupleList == selDatas.length){
			toastrMsg = "이미 배정중인 사용자 입니다.( "+usrIdDupleList+"명 )";
			toastrType = "error";
			$.osl.toastr(toastrMsg,{type: toastrType});
			return false;
		}
		
    	//toast출력
    	$.osl.toastr(toastrMsg,{type: toastrType});
    	
    	//데이터 추가
		datatable.insertData();
		//데이터테이블 재 조회
		datatable.reload();
		//툴팁 제거
		$("div.tooltip.show").remove();
    }
    
  	//결재선 이동 시 사용자카드 세팅
   	function userSetting(userInfo){
		usrStr += 
			'<div class="kt-widget kt-margin-b-10 kt-widget--general-2 rounded osl-sign-card osl-widget-draggable" data-usr-id="'+userInfo.usrId+'" data-usr-name="'+$.osl.escapeHtml(userInfo.usrNm)+'">'
				+'<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">'
				+'<div class="kt-margin-r-20 font-weight-bolder">'
					+'<span class="cardNumber">No.</span><span class="dplStartOrdCell" ord='+ord+'>'+ord+'</span>'
				+'</div>'
				+'<div class="kt-widget__label kt-margin-r-10 osl-user__active--block">'
						+'<i class="fa fa-arrow-alt-circle-left"></i>'
					+'</div>'
					+'<div class="kt-media kt-media--circle kt-media--md">'
						+'<img src="'+$.osl.user.usrImgUrlVal(userInfo.usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
					+'</div>'
					+'<div class="kt-widget__wrapper">'
						+'<div class="kt-widget__label">'
							+'<div class="kt-widget__title">'
								+$.osl.escapeHtml(userInfo.usrNm)
								+'<small>'+$.osl.escapeHtml(userInfo.email)+'</small>'
							+'</div>'
							
							+'<span class="kt-widget__desc">'
								+'<span>'+$.osl.escapeHtml(userInfo.usrDutyNm)+'</span>, <span>'+$.osl.escapeHtml(userInfo.usrPositionNm)+'</span>'
							+'</span>'
						+'</div>'
					+'</div>'
				+'</div>'
			+'</div>';	

		//사용자 카드 넣기
		$("#signCardTable").append(usrStr);
		//우측 카드에 들어가는 사용자들 id값을 배열에 담는다
		selectUsrArray.push(userInfo.usrId);
		//사용자 카드 세팅 초기화
		usrStr='';	
		//카드 넘버
		ord++;
		
		//최종 결재자 번호 수정
		updateLastUsrCard();
   	}
  	
  	//마지막 사용자 카드는 최종이라고 노출되게
    var updateLastUsrCard = function(){
    	var usrCardList = $("#signCardTable .dplStartOrdCell").parent();
    	var usrCardCnt = usrCardList.length;
    	$.each(usrCardList,function(idx,map){
			if((idx+1) == usrCardCnt){
				$(this).children(".cardNumber").text("");
				$(this).children(".dplStartOrdCell").text("최종");
			}else{
				$(this).children(".cardNumber").text("No.");
				$(this).children(".dplStartOrdCell").text(idx+1);
			}
    		
    	});
    }
  	
	//실행 순서 변경 적용
	function fnJobDivOrdModify(item, newIndex, oldIndex){
		//debugger;
		//ord 변경하기
		$.each($(".dplStartOrdCell"),function(idx, map){
			//현재 ord가져오기
			var targetOrd = parseInt($(map).attr("ord"));
			//var newOrd = targetOrd; 
			
			//아래에서 위
			if(oldIndex > newIndex){
				//new ~ old
				if(idx < newIndex || idx > oldIndex){
					return true;
				}else{
					targetOrd = targetOrd+1;
				}
			}
			//위에서 아래
			else if(oldIndex < newIndex){
				//old ~ new
				if(idx > newIndex || idx < oldIndex){
					return true;
				}else{
					targetOrd = targetOrd-1;
				}
			}
			
			//ord 적용
			$(map).attr("ord",targetOrd);
			$(map).text(targetOrd);
			$(map).parent(".dpl_middle_row.dpl_job_row").attr("ord",targetOrd);
			
		});
		//변경된 object ord변경
		var $chgObj = $(item).find('.dplStartOrdCell');
		$chgObj.attr("ord",newIndex+1);
		$chgObj.parent(".dpl_middle_row.dpl_job_row").attr("ord",newIndex+1);
		$chgObj.text(newIndex+1);
		
		//최종 결재자 번호 수정
		updateLastUsrCard();
	}
	
    return {
        // public functions
        init: function() {
        	documentSetting();
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLCmm25000Popup.init();
});

	

</script>