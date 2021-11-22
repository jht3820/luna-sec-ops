<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input type="hidden" name="menuId" id="menuId" value="${param.menuId }" /> 
<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
	<div class="kt-padding-20" id="listDiv" name="listDiv">
	</div>
</div>

<script>
"use strict";
var OSLStm2103Popup = function () {

	
	var menuId = $("#menuId").val();
    var documentSetting = function () {
    	selectBadChargerList(menuId);
    };

	
    var selectBadChargerList = function(menuId){
		var data = {"menuId" : menuId};
		
		
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadChargerListAjax.do'/>", "async": false}
				, data);
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var info = data.badChargerList;
				
				var str = "";
				
				$.each(info, function(index, value){
					
					if(value.authTypeCd=="01"){
						str += "<div class='row kt-padding-t-5 kt-padding-b-5'>"
									+"<div class='kt-user-card-v2__pic kt-media kt-media--xl kt-media--circle kt-padding-5'>"
										+"<img src=\'/media/users/default.jpg\'/>"
									+"</div>"
									+"<div class='kt-user-card-v2__details kt-padding-5 float-left'>"
										+"<div class='kt-font-boldest kt-margin-b-10'>"
											+ value.prjNm
										+"</div>"
										+"<div>"
											+ value.authTargetNm
										+"</div>"
									+"</div>"
								+"</div>";
					}else{ 
						str += "<div class='row kt-padding-t-5 kt-padding-b-5 usr-Info' data-user='"+value.authTargetId+"'>"
									+"<div class='kt-user-card-v2__pic kt-media kt-media--xl kt-media--circle kt-padding-5'>"
										+"<img src='"+$.osl.user.usrImgUrlVal(value.authTargetImgId)+"' onerror='this.src=\"/media/users/default.jpg\"'/>"
									+"</div>"
									+"<div class='kt-user-card-v2__details osl-user-card-v2__details-mobile kt-padding-5 float-left'>"
										+"<div class='kt-font-boldest kt-margin-b-10'>"
											+ value.authTargetNm + "("+value.authTargetId+")"
										+"</div>"
										+"<div class='kt-margin-b-10'>"
											+ value.authTargetEmail
										+"</div>"
										+"<div class='kt-font-sm'>"
											+ value.authTargetDeptNm
										+"</div>"
									+"</div>"
								+"</div>";
					}
				});
				
				$("#listDiv").html(str);
				
				$(".usr-Info").click(function(){
					$.osl.user.usrInfoPopup($(this).data("user"));
				});
			}
		});
		
		
		ajaxObj.send();
    }
	
    return {
        init: function() {
        	documentSetting();
        }
    };
}();

$.osl.ready(function(){
	OSLStm2103Popup.init();
});
</script>