<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6600">
	<input type="hidden" name="paramTargetId" id="paramTargetId" value="${param.targetId}">
	<input type="hidden" name="paramTargetCd" id="paramTargetCd" value="${param.targetCd}">
	<input type="hidden" name="paramTargetNm" id="paramTargetNm" value="${param.targetNm}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.prjId}">
	<input type="hidden" name="paramSubmitAction" id="paramSubmitAction" value="${param.paramSubmitAction}">
	<input type="hidden" name="paramSignUsrList" id="paramSignUsrList" value='<c:out value="${param.paramSignUsrList}"/>'>
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
					<button type="button" class="btn btn-outline-brand kt-margin-t-20 osl-left-arrow" data-datatable-id="stm3000UsrTable" data-datatable-action="signRemove" title="선택 담당자 결재선 제외" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="signRemove" tabindex="2"></button>
				</div>
			</div>
		</div>
		<div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="cmm6600SignUsrInfo">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>결재선 정보
						</h5>
					</div>
					
					<div class="kt-portlet__head-toolbar">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-datatable-id="stm3000UsrTable" data-datatable-action="upMoveBtn" title="위로" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="upMoveBtn" tabindex="3">
							<i class="fas fa-arrow-up"></i><span data-lang-cd="dpl1001.button.upMoveBtn">위로</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" data-datatable-id="stm3000UsrTable" data-datatable-action="downMoveBtn" title="아래로" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="downMoveBtn" tabindex="4">
							<i class="fas fa-arrow-down"></i><span data-lang-cd="dpl1001.button.downMoveBtn">아래로</span>
						</button>
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
	<input type="hidden" name="cmm6601ModalCallbackBtn" id="cmm6601ModalCallbackBtn"/>
	<button type="button" class="btn btn-brand" id="cmm6600SaveSignLine"><i class="fa fa-save"></i><span class="osl-resize__display--show">결재 요청</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLCmm6600Popup = function () {
	var formId = 'frCmm6600';
	
	
    var ord=1;
    
    var selectUsrArray=[];
    
    var usrStr = '';
	
	var usrIdDupleList = 0;
	
	
	var prjId = $('#paramPrjId').val();
	
	
	var targetId = $('#paramTargetId').val();
	
	
	var targetCd = $('#paramTargetCd').val();
	
	
	var targetNm = $('#paramTargetNm').val();
	
	
	var paramSubmitAction = $("#paramSubmitAction").val();
	
	
	var type = '';
	
	
	var signUsrInfs = [];
	
	
	var usrDataList = {};
	
    
    var documentSetting = function () {
    	selectSignUsrInfList();
    	
    	
    	if(paramSubmitAction == "false"){
    		$("#cmm6600SaveSignLine > span").text("결재선 저장");
    	}
    	
	    
	   	$("#cmm6600SignUsrInfo").on("click",".osl-sign-card",function(){
	   		if($(this).hasClass('selected')){
	   			$(this).removeClass('selected');
	   		}else{
	   			$(this).addClass('selected');
	   		}
	   	});
	    
	  
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
						pageSizeSelect : [8, 10, 20, 30, 50, 100],
						pages: {
							desktop: {
								layout: 'default',
								pagesNumber: 5,
							},
							tablet: {
								layout: 'compact',
								pagesNumber: 3,
							},
						},
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
			searchColumns:[
				{field: 'deptName', title: '조직명', searchOrd: 0,}
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
				clickCheckbox: true,
				beforeTemplate: function (row, data, index){
					
					if(selectUsrArray.indexOf(data.usrId) > -1){
						row.addClass("osl-datatable__row-assign--none");
					}
				}
			},
			actionFn:{
				"signMove":function(rowData,datatableId,type){
					var rowDatas = rowData;
					
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("common.user.auth.allUsrInsert",rowDatas.length),{html:true}, function(result){
						
						if (result.value) {
							
							fnAllUsrInsert(rowDatas);
						}
					});
					
				},
				"signMoveRowBtn":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					fnAllUsrInsert(rowDatas);
				},
				"downMoveBtn":function(rowData){
					moveUsrCard("down");
					
				},
				"upMoveBtn":function(rowData){
					moveUsrCard("up");
				}
			},
			callback:{
				ajaxDone: function(evt, list){
					
					if(list.length > 0){
						$.each(list, function(idx, map){
							
							if(!usrDataList.hasOwnProperty(map.usrId)){
								usrDataList[map.usrId] = map;
							}
						});
					}
				}
			}
		});
	  
	    
	  	if(!(targetCd == '03')){
	  		
			
		   	var myInfo = $.osl.user.userInfo;
	  		var duty = '';
	  		
			if((!$.osl.isNull(myInfo.usrDutyCd)) && (!$.osl.isNull(myInfo.usrPositionCd))){
	  			duty 	+= 	'<span class="kt-widget__desc">'
	  					+		'<span>'+$.osl.escapeHtml(myInfo.usrDutyNm)+'</span>, <span>'+$.osl.escapeHtml(myInfo.usrPositionNm)+'</span>'
	  					+	'</span>'
	  		}else{
	  			
	  			if((!$.osl.isNull(myInfo.usrDutyCd))){
	  				duty 	+= '<span class="kt-widget__desc">'
	  						+		'<span>'+$.osl.escapeHtml(myInfo.usrDutyNm)+'</span>'
	  						+	'</span>'
	  			}
	  			
	  			if((!$.osl.isNull(myInfo.usrPositionCd))){
	  				duty 	+= 	'<span class="kt-widget__desc">'
	  						+		'<span>'+$.osl.escapeHtml(myInfo.usrPositionNm)+'</span>'
	  						+	'</span>'
	  			}
	  		}
	  		
			var myUsrStr = 
					'<div class="kt-widget osl-bg-eee kt-margin-r-10 kt-margin-b-10 kt-widget--general-2 rounded" data-usr-id="'+myInfo.usrId+'" data-usr-name="'+$.osl.escapeHtml(myInfo.usrNm)+'">'
						+'<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">'
							+'<div class="kt-margin-r-10 font-weight-bolder osl-min-width-48">기안</div>'
							+'<div class="kt-widget__label kt-margin-r-10 osl-user__active--block">'
								+'<i class="fa fa-arrow-alt-circle-left"></i>'
							+'</div>'
							+'<div class="kt-media kt-media--circle kt-media--md">'
								+'<img src="'+$.osl.user.usrImgUrlVal(myInfo.usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
							+'</div>'
							+'<div class="kt-widget__wrapper">'
								+'<div class="kt-widget__label">'
									+'<div class="kt-widget__title osl-word__break osl-word__break--w200">'
										+$.osl.escapeHtml(myInfo.usrNm)
									+'</div>'
									+'<small class="osl-word__break osl-word__break--w200">'+$.osl.escapeHtml(myInfo.email)+'</small>'
									+ duty
								+'</div>'
							+'</div>'
						+'</div>'
					+'</div>';
					
			
			$("#signCardTable").parent().prepend(myUsrStr);
			
			
			var paramSignUsrList = $("#"+formId+" #paramSignUsrList").val();
			var signUsrListJson;
			
			if(!$.osl.isNull(paramSignUsrList)){
				signUsrListJson = JSON.parse(paramSignUsrList);
			}
			
			if(!$.osl.isNull(signUsrListJson) && signUsrListJson.length > 0){
				var signUsrList = [];
				
				
				$.each(signUsrListJson, function(idx, map){
					if(map.type == "02" || $.osl.isNull(map.type)){
						signUsrList.push(map);
					}
				});
				
				
				fnAllUsrInsert(signUsrList);	
			}
	  	}
	    
	    
	    
	    $('#cmm6600SaveSignLine').click(function(){
    		$.osl.confirm($.osl.lang("cmm6600.message.confirm.saveString"),null,function(result) {
    	        if (result.value) {
   	        		
    	        	saveFormAction();
    	        }
    		});
	    	
	    });
	    
	   	
	   	KTUtil.scrollInit($("#signCardTable")[0], {
	           disableForMobile: true, 
	           resetHeightOnDestroy: true, 
	           handleWindowResize: true, 
	           height: 525
	       });
	   	
	   	
	   	$('button[data-datatable-action="signRemove"]').click(function(){
	   		
	   		var datatable = $.osl.datatable.list["stm3000UsrTable"].targetDt;
			
	   		var target = $('.osl-sign-card.selected');
	   		
			var targetId;	
	   		
	   		
	   		if(target.length>0){
				
				$.osl.confirm('선택한 '+target.length+'개의 결재선을 삭제하시겠습니까?',{html:true}, function(){
					
					
					$.each(target,function(idx, map){
						
						
	    				targetId = map.getAttribute("data-usr-id");
						
	    				
						selectUsrArray.splice(selectUsrArray.indexOf(targetId), 1);
					});
					
					
					$('.osl-sign-card.selected').remove();
	   	    		
					datatable.reload();
					
					$("div.tooltip.show").remove();
	
					
					updateLastUsrCard();
	   			});		
	   		}else{
	   			
	   			$.osl.toastr('삭제할 결재선을 선택해주세요.',{type: 'warning'});
	   		}
	   	});
	   	
	   	
		new Sortable($('#signCardTable')[0], {
			group:'shared',
	        animation: 100,
	        
	        chosenClass: "chosen",
	        onEnd:function(evt){
				
				updateLastUsrCard();
	        }
	    });
	
	};
   
	
   	var moveUsrCard= function(type){
		 var selUsrCard = $(".osl-sign-card.selected");
		
		if(selUsrCard.length == 0){
			
			$.osl.alert("선택된 결재자가 없습니다.");
			return false;
		}
		
		
		var moveCd = false;
		
		
		if(type == "up"){
			
			$.each(selUsrCard,function(idx,map){
			
				var ord = parseInt($(this).attr("data-ord"));
				
				
				if(moveCd){
					return false;
				}
				
				
				if(ord == 1){
					moveCd = true;
					return true;
				}
				
				
				var beforeOrd = ord - 1;
				var targetObj = $("div.osl-sign-card[data-ord="+beforeOrd+"]");
				
				targetObj.before($(this));
				
				targetObj.attr("data-ord",ord);
				$(this).attr("data-ord",beforeOrd);
				
			});
			
			updateLastUsrCard();
		}else if(type = "down"){
			selUsrCard = selUsrCard.get().reverse();
			
			$.each(selUsrCard,function(idx,map){
				
				var ord = parseInt($(this).attr("data-ord"));
				
				
				if(moveCd){
					return false;
				}
				
				
				if(ord == $("#signCardTable .osl-sign-card").length){
					moveCd = true;
					return true;
				}
				
				
				var afterOrd = ord + 1;
				var targetObj = $("div.osl-sign-card[data-ord="+afterOrd+"]");
				
				targetObj.after($(this));
				
				targetObj.attr("data-ord",ord);
				$(this).attr("data-ord",afterOrd);
				
			});
			
			updateLastUsrCard();
		}
		
	 };
	 
    
	var selectSignUsrInfList = function(){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
			{"url":"<c:url value='/cmm/cmm6000/cmm6600/selectCmm6600SignUsrListAjax.do'/>"}
			, {prjId : prjId, targetId : targetId, targetCd : targetCd});

		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				
				if(data.signUsrInfList.length == 0){
					type = 'insert';
				}else{
					type = 'update';
					
					
					$.each(data.signUsrInfList,function(idx,map){
						
						
						if(selectUsrArray.indexOf(map.usrId) != -1){
							return true;
						}
						
			    		
						userSetting(map);
				    		
					});
				}
				
			}
		});
		
		
		ajaxObj.send();
    	
    	
    	
		
	}
  	
    
    function fnAllUsrInsert(selDatas){
      	
    	var datatable = $.osl.datatable.list["stm3000UsrTable"].targetDt;
      	
      	usrIdDupleList = 0;
      	
    	$.each(selDatas,function(idx,map){
    		
			if(selectUsrArray.indexOf(map.usrId) != -1){
				usrIdDupleList++;
				return true;
			}

    		
			userSetting(map);
    		
    	});

    	
		var toastrMsg = "";
		var toastrType = "success";
    	
		
    	if(selDatas.length > usrIdDupleList){
			toastrMsg += selDatas.length-usrIdDupleList+"명의 사용자가 배정되었습니다.";
		}
    	
    	
    	if(usrIdDupleList > 0){
    		
			if(toastrMsg.length > 0){
				toastrMsg += "</br>";
			}			
			toastrMsg += "이미 배정된 " + usrIdDupleList + " 명의 사용자 제외";
			toastrType = "warning";
		}
    	
    	
		if(usrIdDupleList == selDatas.length){
			toastrMsg = "이미 배정중인 사용자 입니다.( "+usrIdDupleList+"명 )";
			toastrType = "error";
			$.osl.toastr(toastrMsg,{type: toastrType});
			return false;
		}
		
    	
    	$.osl.toastr(toastrMsg,{type: toastrType});
    	
    	
		datatable.insertData();
		
		datatable.reload();
		
		$("div.tooltip.show").remove();
    };
    
  	
   	function userSetting(userInfo){
  		var duty = '';
   		if((!$.osl.isNull(userInfo.usrDutyCd)) && (!$.osl.isNull(userInfo.usrPositionCd))){
  			duty 	+= 	'<span class="kt-widget__desc">'
  					+		'<span>'+$.osl.escapeHtml(userInfo.usrDutyNm)+'</span>, <span>'+$.osl.escapeHtml(userInfo.usrPositionNm)+'</span>'
  					+	'</span>'
  		}else{
  			
  			if((!$.osl.isNull(userInfo.usrDutyCd))){
  				duty 	+= '<span class="kt-widget__desc">'
  						+		'<span>'+$.osl.escapeHtml(userInfo.usrDutyNm)+'</span>'
  						+	'</span>'
  			}
  			
  			if((!$.osl.isNull(userInfo.usrPositionCd))){
  				duty 	+= 	'<span class="kt-widget__desc">'
  						+		'<span>'+$.osl.escapeHtml(userInfo.usrPositionNm)+'</span>'
  						+	'</span>'
  			}
  		}
  		
  		
		usrStr += 
			'<div class="kt-widget kt-margin-b-10 kt-widget--general-2 rounded osl-sign-card osl-widget-draggable" data-usr-id="'+userInfo.usrId+'" data-usr-name="'+$.osl.escapeHtml(userInfo.usrNm)+'" data-ord="'+ord+'">'
				+'<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">'
				+'<div class="kt-margin-r-10 font-weight-bolder osl-min-width-48">'
					+'<span class="cardNumber">No.</span><span class="signStartOrdCell"></span>'
				+'</div>'
				+'<div class="kt-widget__label kt-margin-r-10 osl-user__active--block">'
						+'<i class="fa fa-arrow-alt-circle-left"></i>'
					+'</div>'
					+'<div class="kt-media kt-media--circle kt-media--md">'
						+'<img src="'+$.osl.user.usrImgUrlVal(userInfo.usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
					+'</div>'
					+'<div class="kt-widget__wrapper">'
						+'<div class="kt-widget__label osl-min-h-px--57 justify-content-center">'
							+'<div class="kt-widget__title osl-word__break osl-word__break--w200">'
								+$.osl.escapeHtml(userInfo.usrNm)
							+'</div>'
							+'<small class="osl-word__break osl-word__break--w200">'+$.osl.escapeHtml(userInfo.email)+'</small>'
							+duty
						+'</div>'
					+'</div>'
				+'</div>'
			+'</div>';	

		
		$("#signCardTable").append(usrStr);
		
		selectUsrArray.push(userInfo.usrId);
		
		usrStr='';	
		
		ord++;
		
		
		updateLastUsrCard();
   	};
  	
  	
    var updateLastUsrCard = function(){
    	var usrCardList = $("#signCardTable .osl-sign-card");
    	var usrCardCnt = usrCardList.length;
    	$.each(usrCardList,function(idx,map){
			if((idx+1) == usrCardCnt){
				$(this).attr("data-ord",idx+1);
				$(this).data("ord",idx+1);
				$(this).find(".cardNumber").text("최종");
				var ordCell = $(this).find(".signStartOrdCell"); 
				ordCell.text("");
			}else{
				$(this).attr("data-ord",idx+1);
				$(this).data("ord",idx+1);
				$(this).find(".cardNumber").text("검토자 ");
				var ordCell = $(this).find(".signStartOrdCell"); 
				ordCell.text(idx+1);
			}
    		
    	});
    };
  	
	
	var fnJobDivOrdModify = function(item, newIndex, oldIndex){
		
		updateLastUsrCard();
	};
	
	
    var saveFormAction = function(){
    	signUsrInfs = [];
    	
    	var selSignUsrInfs = $('.osl-sign-card');
    	
    	if(selSignUsrInfs.length == 0){
    		
    		$.osl.alert($.osl.lang("cmm6600.message.alert.notRgsSignUsr"));
    		return false;
    		
    	}
		
    	
    	if(!(targetCd == '03')){
    		
    		var myInfo = $.extend({}, $.osl.user.userInfo);
    		myInfo["ord"] = 0;
    		myInfo["type"] = "01";
    		
	    	signUsrInfs.push(myInfo);
    	}
    	
    	$.each(selSignUsrInfs,function(idx, map){
    		var usrId = $(this).data("usr-id");
    		var ord = $(this).data("ord");
    		
    		
    		var signUsrInf = $.extend({}, usrDataList[usrId]);
    		
    		
    		if($.osl.user.userInfo.usrId == usrId){
    			signUsrInf = $.extend({}, $.osl.user.userInfo);
    		}
    		
    		signUsrInf["ord"] = ord;
    		signUsrInf["type"] = "02";
    		signUsrInfs.push(signUsrInf);
    	})
    	
    	
    	if($.osl.isNull(paramSubmitAction) || paramSubmitAction == "true"){
        	
    		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/cmm/cmm6000/cmm6600/saveCmm6600SignLineAjax.do'/>"}
				,{signUsrInfList: JSON.stringify(signUsrInfs) , prjId : prjId, targetId : targetId, targetCd:targetCd,type:type,targetNm:targetNm});

    		
    		ajaxObj.setFnSuccess(function(data){
    			if(data.errorYn == "Y"){
    				$.osl.alert(data.message,{type: 'error'});
    			}else{
    				
    				$.osl.toastr(data.message);
    				
    				
    				$.osl.layerPopupClose();
    				
    				
    				if(targetCd == '02'){

			        	
			        	$("button[data-datatable-id=dpl1000Table][data-datatable-action=select]").click();
    				}
    				
    			}
    		});
    		
    		
    		ajaxObj.send();
    	}else{
    		
    		$("#cmm6601ModalCallbackBtn").click();
    		
    		
			$.osl.layerPopupClose();
    	}
    };
    return {
        
        init: function() {
        	documentSetting();
        },
        getSignUsrInfs: function(){
        	return JSON.stringify(signUsrInfs);
        }
    };
}();


$.osl.ready(function(){
	OSLCmm6600Popup.init();
});

	

</script>