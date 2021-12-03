<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
	<div class="kt-portlet col-xl-12" id="menuNAuthShortCut">
		<form class="kt-form kt-form--label-right" id="frUsr1000UserShortCut">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label">
					<i class="fa flaticon-layer kt-margin-r-5"></i><span data-lang-cd="usr1100.title.shortcut">메뉴 및 권한 관리 단축키</span>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-xl-4 col-lg-3 col-md-12 col-sm-12 col-form-label osl-align-left--imp"><h6 class="kt-font-boldest text-primary"><span data-lang-cd="usr1100.label.shortcutNm">단축키 명</span></h5></div>
					<div class="col-xl-2 col-lg-2 col-md-12 col-sm-12 col-form-label osl-align-left--imp"><h6 class="kt-font-boldest text-primary"><span data-lang-cd="usr1100.label.popupActionCd">팝업시 동작여부</span></h5></div>
					<div class="col-xl-6 col-lg-7 col-md-12 col-sm-12 col-form-label osl-align-left--imp"><h6 class="kt-font-boldest text-primary text-center"><span data-lang-cd="usr1100.label.shortcut">단축키</span></h5></div>
				</div>
				<div id="shortcutDiv"></div>
			</div>
		</form>
	</div>
</div>
<script>
"use strict";
var OSLUsr1003Popup = function () {
	
	var shortcutFormId = 'frUsr1000UserShortCut';
	
    
    var documentSetting = function () {
    	
    	
    	new KTPortlet('usr1100ShortcutInfo', $.osl.lang("portlet"));
    	
    	selectShortCutInfo();
    	
    };
    
  
    var selectShortCutInfo = function(){
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/usr/usr1000/usr1000/selectUsr1000ShortcutInfoAjax.do'/>", "async": false});
    	
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
    			$.osl.alert(data.message, {type:'error'});
    			
    			
    			$.osl.layerPopupClose();
    		}else{
    			
    			$.osl.setDataFormElem(data.shorcutInfoMap,"frUsr1000UserShortCut");
				
    			
    			var keyCodeList = document.getElementsByClassName("keyCode");
    			
    			
    			var str = "";
    			
				data.shortcutInfo.forEach(function(value, index){
					if(index == 5){
						
					}else{
		    			str +=
		    				'<div class="form-group form-group-last row kt-margin-b-20 kt-margin-b-25-mobile">'
								+'<label class="col-xl-4 col-lg-3 col-md-12 col-sm-12 col-form-label osl-align-left--imp"><span class="font-weight-bolder" data-lang-cd="usr1100.title.shortcut'+$.osl.escapeHtml(value.actionCd)+'">'+$.osl.escapeHtml(value.subCdNm)+'</span></label>'
								+'<span class="osl-cursor-pointer kt-switch kt-switch--outline kt-switch--icon kt-switch--info col-xl-2 col-lg-2 col-md-12 col-sm-12" data-toggle="kt-tooltip" data-placement="bottom" title="팝업 시 동작 여부">'
									+'<label class="osl-cursor-pointer">'
										+'<input class="popupActionCd osl-cursor-pointer osl-pointer-events__none" actionCd='+$.osl.escapeHtml(value.actionCd)+' type="checkbox"  checked="checked" disabled>'
										+'<span></span>'
									+'</label>'
								+'</span>'
								+'<div class="col-xl-6 col-lg-7 col-md-12 col-sm-12">'
									+'<div class="input-group">'
										+'<input type="text" actionCd='+$.osl.escapeHtml(value.actionCd)+' class="form-control keyCode" readonly="readonly" placeholder="단축키 입력" value="'+$.osl.escapeHtml(value.shortcut)+'">'
									+'</div>'
								+'</div>'
							+'</div>'
					}
				});
				
				
				$("#shortcutDiv").html(str);
				
				
				KTApp.initTooltips();
				
				
				$.osl.langConvert("#shortcutDiv");
				
				
				$(".keyCode").each(function(){
					if($(this).val() == " "){
						$(this).val("");
					}
				});
				
				
				data.shortcutInfo.forEach(function(value, index){
					if(value.popupActionCd == "01"){
						$("input[type='checkbox'][actionCd="+value.actionCd+"]").attr("checked", true);
					}else{
						$("input[type='checkbox'][actionCd="+value.actionCd+"]").attr("checked", false);
					}
				});
				
    		}
    		
    	});
    	
    	
		ajaxObj.setFnError(function(xhr, status, err){
			data = JSON.parse(data);
			jAlert(data.message, "알림창");
		});
		
		
		ajaxObj.send();
    }
    return {
        
        init: function() {
        	documentSetting();
        },
    };
}();


$.osl.ready(function(){
	OSLUsr1003Popup.init();
});

	
</script>
