<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frDpl1004">
	<input type="hidden" id="paramPrjId" name="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" id="paramDplId" name="paramDplId" value="${param.paramDplId}">
	<input type="hidden" id="dplSignUseCd" name="dplSignUseCd"" value="${dplInfo.dplSignUseCd}">
	<input type="hidden" id="regDtm" name="regDtm" value="${dplInfo.regDtm}">
	<input type="hidden" name="paramTargetId" id="paramTargetId" value="${param.targetId}">
	<input type="hidden" name="paramTargetCd" id="paramTargetCd" value="${param.targetCd}">
	<input type="hidden" name="dplId" id="dplId" value="<c:out value="${dplInfo.dplId}"/>">
	<div class="row">
		<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 kt-margin-b-20-tablet kt-margin-b-20-mobile">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>배포 정보
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body">
					
					<div class="row kt-scroll" id="dplInfo">
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
							<div class="form-group">
								<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 상태</label>
								<input class="form-control" type="text" id="dplStsNm" name="dplStsNm" readonly="readonly" value="<c:out value="${dplInfo.dplStsNm}"/>" >
							</div>	
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
							<div class="form-group">
								<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 버전</label>
								<input class="form-control" type="text" id="dplVer" name="dplVer" readonly="readonly" value="<c:out value="${dplInfo.dplVer}"/>" >
							</div>	
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
							<div class="form-group">
								<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 명</label>
								<input class="form-control" type="text" id="dplNm" name="dplNm" readonly="readonly" value="<c:out value="${dplInfo.dplNm}"/>" >
							</div>	
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
							<div class="form-group">
								<label class="col-form-label"><i class="fa fa-calendar-alt kt-margin-r-5"></i>배포 일자</label>
								<input class="form-control" type="text" id="dplDt" name="dplDt" readonly="readonly" value="<c:out value="${dplInfo.dplDt}"/>" >
							</div>	
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
							<div class="form-group">
								<label class="col-form-label"><i class="fa fa-user-cog kt-margin-r-5"></i>배포자</label>
								<input class="form-control" type="text" id="dplUsrNm" name="dplUsrNm" readonly="readonly" value="<c:out value="${dplInfo.dplUsrNm}"/>" >
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">	
							<div class="form-group">
								<label class="col-form-label"><i class="fa fa-file-signature kt-margin-r-5"></i>결재 사용 유무</label>
								<input class="form-control" type="text" id="dplSignUseNm" name="dplSignUseNm" readonly="readonly" value="<c:out value="${dplInfo.dplSignUseNm}"/>" >
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
							<div class="form-group">
								<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 리비전</label>
								<input class="form-control" type="text" id="dplRevisionNum" name="dplRevisionNum" readonly="readonly" value="<c:out value='${empty dplInfo.dplRevisionNum ? "Last Revision" :  dplInfo.dplRevisionNum }'/>" >
							</div>	
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
							<div class="form-group">
								<label class="col-form-label"><i class="fab fa-cloudsmith kt-margin-r-5"></i>배포 방법</label>
								<input class="form-control" type="text" id="dplTypeNm" name="dplTypeNm" readonly="readonly" value="<c:out value="${dplInfo.dplTypeNm}"/>" >
							</div>	
						</div>
						<c:if test="${dplInfo.dplTypeCd == '01'}">
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
								<div class="form-group">
									<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>실패 후 처리</label>
									<input class="form-control" type="text" id="dplAutoAfterNm" name="dplAutoAfterNm" readonly="readonly" value="<c:out value="${dplInfo.dplAutoAfterNm}"/>" >
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
								<div class="form-group">
									<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>자동 실행 일시</label>
									<input class="form-control" type="text" id="dplAutoTm" name="dplAutoTm" readonly="readonly" value='<fmt:formatDate value="${dplInfo.dplAutoDtm}" pattern="yyyy-MM-dd HH:mm:ss"/>' >
								</div>	
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
								<div class="form-group">
									<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>원복 타입</label>
									<input class="form-control" type="text" id="dplRestoreNm" name="dplRestoreNm" readonly="readonly" value="<c:out value="${dplInfo.dplRestoreNm}"/>" >											
								</div>	
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 kt-padding-r-20">
							</div>
						</c:if>
						<c:choose>
						<c:when test="${dplInfo.dplTypeCd == '01'}">
							<c:if test="${dplInfo.dplSignUseCd == '01'}">
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group kt-margin-b-15">
									<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>결재 요청 의견</label>
									<textarea class="form-control osl-textarea__resize--none osl-min-h-px--150" id="dplSignTxt" name="dplSignTxt" readonly="readonly"><c:out value="${dplInfo.dplSignTxt}"/></textarea>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
									<textarea class="form-control osl-textarea__resize--none osl-min-h-px--150" id="dplDesc" name="dplDesc" readonly="readonly"><c:out value="${dplInfo.dplDesc}"/></textarea>
								</div>
							</div>
							</c:if>
							<c:if test="${dplInfo.dplSignUseCd == '02'}">
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
									<textarea class="form-control osl-textarea__resize--none osl-min-h-px--150" id="dplDesc" name="dplDesc" readonly="readonly"><c:out value="${dplInfo.dplDesc}"/></textarea>
								</div>		
							</div>
							</c:if>
						</c:when>
						<c:when test="${dplInfo.dplTypeCd == '02'}">
							<c:if test="${dplInfo.dplSignUseCd == '01'}">
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group kt-margin-b-15">
									<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>결재 요청 의견</label>
									<textarea class="form-control osl-textarea__resize--none osl-min-h-px--150" id="dplSignTxt" name="dplSignTxt" readonly="readonly"><c:out value="${dplInfo.dplSignTxt}"/></textarea>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
									<textarea class="form-control osl-textarea__resize--none osl-min-h-px--150" id="dplDesc" name="dplDesc" readonly="readonly"><c:out value="${dplInfo.dplDesc}"/></textarea>
								</div>		
							</div>
							</c:if>
							<c:if test="${dplInfo.dplSignUseCd == '02'}">
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
									<textarea class="form-control osl-textarea__resize--none osl-min-h-px--150" id="dplDesc" name="dplDesc" readonly="readonly"><c:out value="${dplInfo.dplDesc}"/></textarea>
								</div>		
							</div>
							</c:if>
						</c:when>
					</c:choose>
					</div>
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
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" id="selectSignLine">
							<i class="fas fa-arrow-up"></i><span data-lang-cd="dpl1001.button.upMoveBtn">결재선 지정</span>
						</button>
					</div>
					
				</div>
				<div class="kt-portlet__body kt-padding-r-15">
					<div class="kt-scroll kt-padding-r-10" data-height="525" id="dplSignCardTable"></div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="dpl1004SaveSignLine"><i class="fa fa-save"></i><span class="osl-resize__display--show">결재 요청</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLDpl1004Popup = function () {
	var formId = 'frDpl1004';
	
	
    var ord=1;
    
    var selectUsrArray=[];
    
    var usrStr = '';
    
	
	var usrIdDupleList = 0;
	
	
	var prjId = $('#paramPrjId').val();
	
	
	var dplId = $("#paramDplId").val();
	
	
	var targetId = $('#paramTargetId').val();
	
	
	var targetCd = $('#paramTargetCd').val();
	
	
	var targetNm = $('#paramTargetNm').val();
	
	
	var paramSubmitAction = $("#paramSubmitAction").val();
	
	
	var type = '';
	
	
	var signUsrList = [];
	
    
    var documentSetting = function () {
    	selectSignUsrInfList();
    	
    	
    	if(paramSubmitAction == "false"){
    		$("#dpl1004SaveSignLine > span").text("결재선 저장");
    	}
    	
	    $("#selectSignLine").click(function(){
	    	var data = {
					prjId :  prjId,
					targetId :  dplId,
					targetCd :  '02',
					
					paramSubmitAction: false,
					paramSignUsrList: JSON.stringify(signUsrList)
	    	};
	    	
	    	var options = {
	    			idKey:dplId,
					modalTitle: $.osl.lang("prj3000.modal.title.saveSignLine"),
					autoHeight: false,
					modalSize: "xl",
					callback:[{
						targetId: "cmm6601ModalCallbackBtn",
						actionFn: function(thisObj){
							var paramSignUsrList = OSLCmm6600Popup.getSignUsrInfs();
							if(!$.osl.isNull(paramSignUsrList)){
								signUsrList = JSON.parse(paramSignUsrList);
								
								
								var signOrdListStr = '';
								
								$("#dplSignCardTable").html("");
								$("#dplSignCardTable").empty();
								
								
								if(!$.osl.isNull(signUsrList) && signUsrList.length > 0){
									
									var signUsrCardList = '';
									$.each(signUsrList, function(idx, map){
										
										if(map.ord == 0){
											return true;
										}
										
										
										signUsrCardList += dplUserSetting(map);
									});
									$("#dplSignCardTable").html(signUsrCardList);
									
									
									updateLastUsrCard();
								}
								
							}else{
								signUsrList = [];
							}
						}
					}]
			};
	    	
	    	$.osl.layerPopupOpen('/cmm/cmm6000/cmm6600/selectCmm6600View.do',data,options);
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
					
			
			$("#dplSignCardTable").parent().prepend(myUsrStr);
	  	}
	    
	    
	    
	    $('#dpl1004SaveSignLine').click(function(){
    		$.osl.confirm($.osl.lang("cmm6600.message.confirm.saveString"),null,function(result) {
    	        if (result.value) {
   	        		
    	        	saveFormAction();
    	        }
    		});
	    	
	    });
	    
	   	
	   	KTUtil.scrollInit($("#dplSignCardTable")[0], {
	           disableForMobile: true, 
	           resetHeightOnDestroy: true, 
	           handleWindowResize: true, 
	           height: 525
	    });
	   	
	 	
	   	KTUtil.scrollInit($("#dplInfo")[0], {
	           disableForMobile: true, 
	           resetHeightOnDestroy: true, 
	           handleWindowResize: true, 
	           height: 602
	    });
	   	
	   	
	   	$('button[data-datatable-action="signRemove"]').click(function(){
	   		
	   		var datatable = $.osl.datatable.list["stm3000UsrTable"].targetDt;
			
	   		var target = $('.dpl-sign-card.selected');
	   		
			var targetId;	
	   		
	   		
	   		if(target.length>0){
				
				$.osl.confirm('선택한 '+target.length+'개의 결재선을 삭제하시겠습니까?',{html:true}, function(){
					
					
					$.each(target,function(idx, map){
						
						
	    				targetId = map.getAttribute("data-usr-id");
						
	    				
						selectUsrArray.splice(selectUsrArray.indexOf(targetId), 1);
					});
					
					
					$('.dpl-sign-card.selected').remove();
	   	    		
					datatable.reload();
					
					$("div.tooltip.show").remove();
	
					
					updateLastUsrCard();
	   			});
	   		}else{
	   			
	   			$.osl.toastr('삭제할 결재선을 선택해주세요.',{type: 'warning'});
	   		}
	   	});
	
	};
   
	
    
	var selectSignUsrInfList = function(){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
			{"url":"<c:url value='/cmm/cmm6000/cmm6600/selectCmm6600SignUsrListAjax.do'/>"}
			, {prjId : prjId, targetId : targetId, targetCd : targetCd});

		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				if(data.signUsrInfList.length > 0){
					
					var signUsrCardList = '';
					
					
					$.each(data.signUsrInfList,function(idx,map){
						
						
			    		signUsrList.push(map);
						
			    		
						if(map.ord == 0){
							return true;
						}
						
			    		
						signUsrCardList += dplUserSetting(map);
			    		
					});
					console.log(signUsrList);
					$("#dplSignCardTable").html(signUsrCardList);
					
					updateLastUsrCard();
				}
			}
		});
		
		
		ajaxObj.send();
	}
	
  	
	
   	var dplUserSetting = function(userInfo){
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
  		
  		
		var usrStr = 
			'<div class="kt-widget kt-margin-b-10 kt-widget--general-2 rounded dpl-sign-card osl-widget-draggable" data-usr-id="'+userInfo.usrId+'" data-usr-name="'+$.osl.escapeHtml(userInfo.usrNm)+'" data-ord="'+ord+'">'
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
								+ $.osl.escapeHtml(userInfo.usrNm)
							+'</div>'
							+'<small class="osl-word__break osl-word__break--w200">'+$.osl.escapeHtml(userInfo.email)+'</small>'
							+duty
						+'</div>'
					+'</div>'
				+'</div>'
			+'</div>';	
		
		selectUsrArray.push(userInfo.usrId);
		
		ord++;
		
		return usrStr;
   	};
    
  	
    var updateLastUsrCard = function(){
    	var usrCardList = $("#dplSignCardTable .dpl-sign-card");
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
  	
    
    var saveFormAction = function(){
    	
    	
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	fd.append("signUsrInfList", JSON.stringify(signUsrList));
    	
    	
		var ajaxObj = new $.osl.ajaxRequestAction(
			{"url":"<c:url value='/dpl/dpl1000/dpl1000/insertDpl1000SignLineAjax.do'/>", "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
			, fd);

		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				$.osl.toastr(data.message);
				
				$.osl.datatable.list["dpl1000Table"].targetDt.reload();
				
				$.osl.layerPopupClose();
				
			}
		});
		
		
		ajaxObj.send();
    	
    };
    return {
        
        init: function() {
        	documentSetting();
        }
    };
}();


$.osl.ready(function(){
	OSLDpl1004Popup.init();
});

	

</script>