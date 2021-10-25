<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form class="kt-form" id="">
	프로세스표출영역
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal">
		<i class="fa fa-window-close"></i>
		<span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span>
	</button>
</div>


<script>
"use strict";
var OSLSpr1006Popup = function () {
	var documentSetting = function(){
		
		
	};
	
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLSpr1006Popup.init();
});
</script>

