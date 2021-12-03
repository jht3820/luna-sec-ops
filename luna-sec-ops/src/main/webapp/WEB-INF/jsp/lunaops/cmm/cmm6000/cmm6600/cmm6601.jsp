<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6601">
	<input type="hidden" name="paramTargetId" id="paramTargetId" value="${param.targetId}">
	<input type="hidden" name="paramTargetCd" id="paramTargetCd" value="${param.targetCd}">
	<input type="hidden" name="paramOrd" id="paramOrd" value="${param.ord}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.prjId}">
	<input type="hidden" name="paramSignType" id="paramSignType" value="${param.signType}">
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0" id="cmm6601DeptTreeInfo">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>결재선 정보<br>
						</h5>
					</div>
				</div>
				<div class="kt-margin-t-5 osl-align-center--imp" id="infomation">
							결재가 진행 중입니다.</div>
				<div class="kt-portlet__body kt-padding-r-15">
					<div class="kt-scroll kt-padding-r-10" data-height="275" id="signCardTable"></div>
				</div>
			</div>
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0 kt-margin-t-20">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5" id="signRes"></i>결재 의견<br>
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body kt-padding-r-15">
					<div class="kt-scroll kt-padding-r-10" data-height="175" id="signResBox">
						<div class="form-group">
							<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="prj3000.label.docDesc">결재 의견</span></label>
							<div class="form-control osl-min-height--9rem" id="signResDiv"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand kt-hide" id="cmm6601ReSignLineBtn"><i class="fa fa-file-signature"></i><span class="osl-resize__display--show" data-lang-cd="cmm6601.label.reSign">재결재 요청</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLCmm6601Popup = function () {
	
    
    var usrStr = '';
	
	var usrIdDupleList = 0;
	
	
	var prjId = $('#paramPrjId').val();
	
	
	var targetId = $('#paramTargetId').val();
	
	
	var targetCd = $("#paramTargetCd").val();
	
	
	var ord = $("#paramOrd").val();
	
	
	var signType = $("#paramSignType").val();
	
	
	var reqSignUsrId = '';
	
    
    var documentSetting = function () {
	    
    	
    	selectSignUsrInfList();
    	
	    $('#infomation').text($.osl.lang("cmm6601.infomation.cannotUpdate"));
    	
	   	
	   	KTUtil.scrollInit($("#signCardTable")[0], {
	           disableForMobile: true, 
	           resetHeightOnDestroy: true, 
	           handleWindowResize: true, 
	           height: 275
	    });
	   	
	  	
	   	KTUtil.scrollInit($("#signResBox")[0], {
	           disableForMobile: true, 
	           resetHeightOnDestroy: true, 
	           handleWindowResize: true, 
	           height: 170
	    });
	  	
	  	
	  	$(".osl-sign-card").click(function(){
	  		
	  		
	  		var signTypeNm = $(this).data("sign-type");
	  		var thisOrd = $(this).data("ord");
	  		
	  		
	  		if($.osl.isNull(signTypeNm)){
	  			$("#signResDiv").text("");
	  			return false;
	  		}
	  		
	  		
	  		if(signTypeNm == '결재 대기'){
	  			$("#signResDiv").text("");
	  			return false;
	  		}
	  		
	  		
	  		if(signTypeNm == '기안'){
	  			$("#signResDiv").text("");
	  			return false;
	  		}
	  		
	  		
			var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"<c:url value='/cmm/cmm6000/cmm6600/selectCmm6601SignInfoAjax.do'/>"}
				, {prjId : prjId, targetId : targetId, targetCd : targetCd, ord : thisOrd});

			
			ajaxObj.setFnSuccess(function(data){
				if(data.errorYn == "Y"){
					$.osl.alert(data.message,{type: 'error'});
				}else{
					
					$("#signResDiv").text(data.signUsrInf.signRes);
					
				}
			});
			
			
			ajaxObj.send();
	  		
	  	});
	  	
	  	var loginUsrId = $.osl.user.userInfo.usrId;
	  	
	  	
	  	if(reqSignUsrId == loginUsrId && signType == '결재 대기'){
	  		$("#cmm6601ReSignLineBtn").removeClass("kt-hide");
	  	}
	};
   
	
	
	var selectSignUsrInfList = function(){
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/cmm/cmm6000/cmm6600/selectCmm6600SignUsrListAjax.do'/>", "async": false}
			, {"prjId" : prjId, "targetId" : targetId, "targetCd": targetCd});

		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				
				$.each(data.signUsrInfList,function(idx,map){
					
		    		
					userSetting(map);
			    		
				});
			}
		});
		
		
		ajaxObj.send();
	}
	
    
  	
   	var userSetting = function(userInfo){
  		var signTypeNm = '';
  		
  		
  		if(userInfo.ord == 0){
			signTypeNm = '기안';
			reqSignUsrId = userInfo.usrId;
		}
  		
		else if(userInfo.ord < ord){
			signTypeNm = '결재 승인';
		}
		
		else if(userInfo.ord == ord){
			signTypeNm = signType;
		}
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
  		
   		var badgeColor;
   		var badgeText;
   		
   		
   		if(userInfo.signAuthCd == '01'){
   			badgeColor = 'badge-success';
   			badgeText = '결재';
   		}
   		
   		else if(userInfo.signAuthCd == '02'){
   			badgeColor = 'badge-info';
   			badgeText = '대결';
   		}
   		
   		else if(userInfo.signAuthCd == '03'){
   			badgeColor = 'badge-warning';
   			badgeText = '전결';
   		}
   		
   		else{
   			badgeColor = 'badge-dark';
   			badgeText = '기안';
   		}
   		
		usrStr += 
			'<div class="kt-widget kt-margin-b-10 kt-widget--general-2 rounded osl-sign-card osl-widget-draggable" data-usr-id="'+userInfo.usrId+'" data-usr-name="'+$.osl.escapeHtml(userInfo.usrNm)+'" data-sign-type="'+signTypeNm+'" data-ord="'+userInfo.ord+'"> '
				+'<div class="kt-widget__top kt-padding-t-10 kt-padding-b-10 kt-padding-l-20 kt-padding-r-20">'
				+'<div class="kt-margin-r-10 font-weight-bolder osl-min-width-48">'
					+'<span class="cardNumber">No.</span><span class="signStartOrdCell" data-ord="0"></span>'
				+'</div>'
				+'<div class="kt-widget__label kt-margin-r-10 osl-user__active--block">'
						+'<i class="fa fa-arrow-alt-circle-left"></i>'
					+'</div>'
					+'<div class="kt-media kt-media--circle kt-media--md">'
						+'<img src="'+$.osl.user.usrImgUrlVal(userInfo.usrImgId)+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
					+'</div>'
					+'<div class="badge '+badgeColor+' kt-margin-r-15 float-left">'+badgeText+'</div>'
					+'<div class="kt-widget__wrapper">'
						+'<div class="kt-widget__label  osl-min-h-px--57 justify-content-center">'
							+'<div class="kt-widget__title osl-word__break osl-word__break--w120">'
								+$.osl.escapeHtml(userInfo.usrNm)
							+'</div>'
							+'<small class="osl-word__break osl-word__break--w120">'+$.osl.escapeHtml(userInfo.email)+'</small>'
							+duty
						+'</div>'
					+'</div>'
						+"<div class='sign-type'>"+signTypeNm+"</div>"
				+'</div>'
			+'</div>';	

		
		$("#signCardTable").append(usrStr);
		
		usrStr='';	
		
		
		updateLastUsrCard();
   	}
  	
  
    var updateLastUsrCard = function(){
    	var usrCardList = $("#signCardTable .signStartOrdCell").parent();
    	var usrCardCnt = usrCardList.length;
    	$.each(usrCardList,function(idx,map){
			
    		
    		if((idx+1) == usrCardCnt){
				$(this).children(".cardNumber").text("");
				var ordCell = $(this).children(".signStartOrdCell"); 
				ordCell.text("최종");
				ordCell.data('ord', idx);
			}
    		
			else if(idx == 0){
				$(this).children(".cardNumber").text("");
				var ordCell = $(this).children(".signStartOrdCell"); 
				ordCell.text("기안자");
				ordCell.data('ord', idx);
			
			}
			else{
				$(this).children(".cardNumber").text("검토자 ");
				var ordCell = $(this).children(".signStartOrdCell"); 
				ordCell.text(idx);
				ordCell.data('ord', idx);
			}
    		
    	});
    }
  	
    return {
        
        init: function() {
        	documentSetting();
        },
        getNowSignOrd : function(){
        	return ord;
        }
    };
}();


$.osl.ready(function(){
	OSLCmm6601Popup.init();
});

	

</script>