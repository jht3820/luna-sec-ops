<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
<input type="hidden" name="systemRoot" id="systemRoot" value="<c:out value='${param.systemRoot}'/>">
<input type="hidden" name="strgRepId" id="strgRepId" value="<c:out value='${param.strgRepId}'/>">
<input type="hidden" name="path" id="path" value="<c:out value='${param.path}'/>">
<input type="hidden" name="revision" id="revision" value="<c:out value='${param.revision}'/>">
<div class="kt-padding-15 osl-max-h-px--590 osl-contents-frame">
	<div class="osl-code__line-frame" id="codeLineFrame"></div>
	<pre id="preContent">
		<code class="osl-code-bg" id="cmm6801FileInfo">
		</code>
	</pre>
</div>

<script>
"use strict";
var OSLCmm6801Popup = function() {
	var type = $("#type").val();
	var strgRepId = $("#strgRepId").val();
	var revision = $("#revision").val();
	var path = $("#path").val();

	
	var okRevision = false;
	var okFileCode = false;
	
	var systemRoot = $("#systemRoot").val();
	
	
	 var documentSetting = function() {
		
		if(!$.osl.isNull(systemRoot) && systemRoot){
			
			okRevision = true;
			okFileCode = true;
		}else{
			authCheck(strgRepId);
			
			
			if(!okFileCode){
				$.osl.alert($.osl.lang("cmm6800.message.auth"));
				
				$.osl.layerPopupClose();
			}
		}
	
		
		getFileInfo();
	}
	
	
	var getFileInfo = function(){
		var data = {
				type : type,
				filePath: path,
				revision : revision,
				strgRepId : strgRepId
			};

		
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000RevisionFileInfoAjax.do'/>", "async":false}
   				, data);
		
   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				
				$("#cmm6801FileInfo").html(data.message);
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
	   			
				
				if($.osl.isNull(data.contentInfo)){
					$("#cmm6801FileInfo").html("<span class='kt-font-inverse-brand  kt-padding-l-10 osl-font-lg osl-font'>"+"로그가 없습니다."+"</span>");
					return false;
				}else{
					
		   			$("#cmm6801FileInfo").html($.osl.escapeHtml(data.contentInfo));
		   			$("#cmm6801FileInfo").each(function(i, block) {hljs.highlightBlock(block);});
		   			
		   			
					var codeLineCnt = 0;
					
					if(!$.osl.isNull(data.contentInfo)){
						
						var codeLine = data.contentInfo.split("\n");
						codeLineCnt = codeLine.length;
						
						
						var codeWindowHeight = $("#preContent").height() - 50;
						
						
						codeWindowHeight = codeWindowHeight;
						
						
						var codeScrollLine = parseFloat((codeWindowHeight/codeLineCnt));
						
						
						$.each(codeLine, function(idx, map){
							
							if(map.indexOf('osl-code__text-add') != -1){
								
								
								var targetLineScrollTop = ((idx+1)*codeScrollLine);
								targetLineScrollTop += 44;
								
								$("#cmm6801FileInfo").append('<div class="osl-code__diff-line-scroll-defore" style="top:'+targetLineScrollTop+'px;"></div>');
							}
						});
						
						
						for(var i=0;i<codeLineCnt;i++){
							$("#codeLineFrame").append('<div class="osl-code__line-div">'+(i+1)+'</div>');
						}
						
						$("#cmm6801FileInfo").prepend($("#codeLineFrame"));
					}
				}
	   			
   			}
   		});
  	 	
   		ajaxObj.send();
	};
	
	
	var authCheck = function(strgRepId){
		var data = {
				strgRepId : strgRepId,
		};
		
		
    	var ajaxObj = new $.osl.ajaxRequestAction(
	   			{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000AuthCheckAjax.do'/>", "async": false}
				, data);
		
    	
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var result = data.result;
				
				
				if(result.resultRevision == "Y"){
					okRevision = true;
				}else{
					okRevision = false;
				}
				
				if(result.resultFileCode == "Y"){
					okFileCode = true;
				}else{
					okFileCode = false;
				}
			}
    	});
    	
		ajaxObj.send();
	};

	return {
		init: function(){
			documentSetting();
		}
	};
 }();
 
 $.osl.ready(function(){
	 OSLCmm6801Popup.init();
 });
</script>
