<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
<input type="hidden" name="strgRepId" id="strgRepId" value="<c:out value='${param.strgRepId}'/>">
<input type="hidden" name="filePath" id="filePath" value="<c:out value='${param.filePath}'/>">
<input type="hidden" name="fileName" id="fileName" value="<c:out value='${param.fileName}'/>">
<input type="hidden" name="diffRevision01" id="diffRevision01" value="<c:out value='${param.diffRevision01}'/>">
<input type="hidden" name="diffRevision02" id="diffRevision02" value="<c:out value='${param.diffRevision02}'/>">
<div class="row">
	<div class="col-lg-6 col-md-6 col-sm-12 col-12 kt-padding-b-10">
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label kt-portlet__head--lg">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>
						<span id="beforeRevision"></span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-group">
					</div>
				</div>
			</div>
			<div class="kt-portlet__body kt-padding-15 osl-min-h-px--575 osl-contents-frame">
				<div class="osl-code__line-frame" id="codeLineFrameBefore"></div>
				<pre id="preBefore">
					<code class="osl-code-bg" id="stm8005BeforeFileInfo">
					</code>
				</pre>
			</div>
		</div>
	</div>
	<div class="col-lg-6 col-md-6 col-sm-12 col-12 kt-padding-b-10">
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label kt-portlet__head--lg">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i>
						<span id="afterRevision"></span>
					</h5>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-group">
					</div>
				</div>
			</div>
			<div class="kt-portlet__body kt-padding-15 osl-min-h-px--575 osl-contents-frame">
				<div class="osl-code__line-frame" id="codeLineFrameAfter"></div>
				<pre id="preAfter">
					<code class="osl-code-bg" id="stm8005AfterFileInfo">
					</code>
				</pre>
			</div>
		</div>
	</div>
</div>

<script>
"use strict";
var OSLStm8005Popup = function() {
	var type = $("#type").val();
	var strgRepId = $("#strgRepId").val();
	var filePath = $("#filePath").val();
	var fileName = $("#fileName").val();
	var diffRevision01 = $("#diffRevision01").val();
	var diffRevision02 = $("#diffRevision02").val();
	
	
	 var documentSetting = function() {
		 getFileDiffInfo();
	}
	
	
	var getFileDiffInfo = function(){
		
		var data = {
				type : type,
				strgRepId : strgRepId,
				filePath : filePath,
				diffRevision01 :diffRevision01,
				diffRevision02 :diffRevision02,
			};

		
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000FileDiffInfoAjax.do'/>", "async":false}
   				, data);
		
   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				
				$("#stm8005BeforeFileInfo").html(data.message);
				$("#stm8005AfterFileInfo").html(data.message);
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				$("#beforeRevision").text("[Revision "+data.beforeRevision+"] "+ fileName);
   				$("#afterRevision").text("[Revision "+data.afterRevision+"] " + fileName);
   				
   				var beforeContent = data.beforeContent;
   				var afterContent = data.afterContent;
   				
	   			
				
				if($.osl.isNull(beforeContent)){
					$("#stm8005BeforeFileInfo").html("<span class='kt-font-inverse-brand  kt-padding-l-10 osl-font-lg osl-font'>"+"로그가 없습니다."+"</span>");
					return false;
				}
	   			
				
				if($.osl.isNull(afterContent)){
					$("#stm8005AfterFileInfo").html("<span class='kt-font-inverse-brand  kt-padding-l-10 osl-font-lg osl-font'>"+"로그가 없습니다."+"</span>");
					return false;
				}
				
				$("#stm8005BeforeFileInfo").html($.osl.escapeHtml(beforeContent));
				$("#stm8005BeforeFileInfo").each(function(i, block) {hljs.highlightBlock(block);});
				$("#stm8005AfterFileInfo").html($.osl.escapeHtml(afterContent));
				$("#stm8005AfterFileInfo").each(function(i, block) {hljs.highlightBlock(block);});
	   			 
				
				var oldVal = "";
				var newVal = "";
				
				var dmp = new diff_match_patch();
				var diffs = dmp.diff_main($('#stm8005BeforeFileInfo').html(), $('#stm8005AfterFileInfo').html());
				dmp.diff_cleanupEfficiency(diffs);
				
				
				for (var i = 0, j = diffs.length; i < j; i++) {
			        var arr = diffs[i];
			        if (arr[0] == 0) {	
			            oldVal += arr[1];
			            newVal += arr[1];
			        } else if (arr[0] == -1) { 
			            oldVal += "<span class='osl-code__text-remove'>" + arr[1] + "</span>";
			        } else { 
			            newVal += "<span class='osl-code__text-add'>" + arr[1] + "</span>";
			        }
			    }
				
				$("#stm8005BeforeFileInfo").html(oldVal);
				$("#stm8005AfterFileInfo").html(newVal);
				
				
				var beforeCodeLineCnt = 0;
				var afterCodeLineCnt = 0;
				
				
				if(!$.osl.isNull(oldVal)){
					
					var beforeCodeLine = oldVal.split("\n");
					beforeCodeLineCnt = beforeCodeLine.length;
					
					
					var codeWindowHeight = $("#stm8005BeforeFileInfo").height() - 50;
					
					
					codeWindowHeight = codeWindowHeight;
					
					
					var codeScrollLine = parseFloat((codeWindowHeight/beforeCodeLineCnt));
					
					
					$.each(beforeCodeLine, function(idx, map){
						
						if(map.indexOf('osl-code__text-add') != -1){
							
							
							var targetLineScrollTop = ((idx+1)*codeScrollLine);
							targetLineScrollTop += 44;
							
							$("#contentsFrameBefore").append('<div class="osl-code__diff-line-scroll-defore" style="top:'+targetLineScrollTop+'px;"></div>');
						}
					});
				}
				
				if(!$.osl.isNull(newVal)){
					
					var afterCodeLine = newVal.split("\n");
					afterCodeLineCnt = afterCodeLine.length;
					
					
					var codeWindowHeight = $("#stm8005AfterFileInfo").height() - 50;
					
					
					var codeScrollLine = parseFloat((codeWindowHeight/afterCodeLineCnt));
					
					
					$.each(afterCodeLine, function(idx, map){
						
						if(map.indexOf('osl-code__text-remove') != -1){
							
							var targetLineScrollTop = ((idx+1)*codeScrollLine);
							targetLineScrollTop += 44;
							
							$("#contentsFrameAfter").append('<div class="osl-code__diff-line-scroll-after" style="top:'+targetLineScrollTop+'px;"></div>');
						}
					});
				}
				
				
				for(var i=0;i<beforeCodeLineCnt;i++){
					$("#codeLineFrameBefore").append('<div class="osl-code__line-div">'+(i+1)+'</div>');
				}
				for(var i=0;i<afterCodeLineCnt;i++){
					$("#codeLineFrameAfter").append('<div class="osl-code__line-div">'+(i+1)+'</div>');
				}
				
				$("#stm8005BeforeFileInfo").prepend($("#codeLineFrameBefore"));
				$("#stm8005AfterFileInfo").prepend($("#codeLineFrameAfter"));
				
				
				$("#stm8005BeforeFileInfo").scroll(function(){
					
					$('#stm8005AfterFileInfo').scrollTop($("#stm8005BeforeFileInfo").scrollTop());
					$('#stm8005AfterFileInfo').scrollLeft($("#stm8005BeforeFileInfo").scrollLeft());
					
					
					$('#codeLineFrameBefore').scrollTop($("#stm8005BeforeFileInfo").scrollTop());
				});
				$("#stm8005AfterFileInfo").scroll(function(){
					
					
					$('#codeLineFrameAfter').scrollTop($("#stm8005AfterFileInfo").scrollTop());
				});
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
	 OSLStm8005Popup.init();
 });
</script>
