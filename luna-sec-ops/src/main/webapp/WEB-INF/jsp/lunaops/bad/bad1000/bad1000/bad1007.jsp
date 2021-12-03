<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<input type="hidden" name="stmTypeCd" id="stmTypeCd" value="${param.stmTypeCd}" /> 
<input type="hidden" name="stmDsTypeCd" id="stmDsTypeCd" value='${param.stmDsTypeCd}'/>
<input type="hidden" name="stmNm" id="stmNm" value='${param.stmNm}'/>
<input type="hidden" name="paramRow" id="paramRow" value='${param.paramRow }' />
<input type="hidden" id="stmRootYn" name="stmRootYn" value='${param.stmRootYn}'/>
<input type="hidden" id="badHitYn" name="badHitYn" value='${param.badHitYn}'/>

<div class="kt-section__content kt-section__content--border">
	<div class="card">
		<div class="card-header kt-font-bolder">
			
			<div class="kt-padding-t-10 kt-padding-b-15 osl-font-size--1_5 osl-border-b--dedede" name="badTitleDiv" id="badTitleDiv"></div>
			
			<div class="osl-portlet__head-label kt-margin-t-10">
				
				<div class="float-left osl-bad__writer-div" name="writerDiv" id="writerDiv"  data-badUsrId=''></div>
				<div class="float-right osl-display__flex osl-bad__sub-div">
					
					<div name="writeDateDiv" id="writeDateDiv"></div>
					
					<div class="osl-display__flex-r kt-margin-l-10">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" name="updateBtn" id="updateBtn" title="게시글 수정" data-title-lang-cd="bad1007.actionTooltip.updateTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
							<i class="fa fa-edit"></i><span data-lang-cd="datatable.button.update">수정</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" name="deleteBtn" id="deleteBtn" title="게시글 삭제" data-title-lang-cd="bad1007.actionTooltip.deleteTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
							<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air kt-hide" name="restoreBtn" id="restoreBtn" title="게시글 복원" data-title-lang-cd="bad1007.actionTooltip.restoreTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom">
							<i class="la la-rotate-left"></i><span data-lang-cd="bad1007.button.restore">복구</span>
						</button>
					</div>
				</div>
			</div>	
		</div>
		<div class="osl-bad__card-body">
			
			
			<div class="form-group kt-margin-20 position-relative" name="badFileOption" id="badFileOption">
				<div class="kt-hide kt-uppy fileReadonly" name="fileObjectListDiv" id="fileObjectListDiv"></div>
				<div class="kt-margin-t-10 kt-slider carousel slide osl-slideshow-img" name="fileListDiv" id="fileListDiv" data-ride="carousel" data-interval="false" data-touch="true">
				</div>
				<div class="kt-margin-t-10 carousel-indicators" name="fileListBtnDiv" id="fileListBtnDiv"></div>
			</div>
			
			
			<div class="form-group kt-margin-20 kt-hide" name="badTagOption" id="badTagOption">
				<div class="kt-font-bolder kt-padding-l-5">
					<i class="fa fa-hashtag kt-margin-r-5"></i><span data-lang-cd="bad1007.label.tag">태그</span>
				</div>
				<div class="kt-margin-t-10" name="tagListDiv" id="tagListDiv">
				</div>
			</div>

			
			<div class="bard-text kt-padding-30 kt-padding-t-20 kt-padding-b-20 osl-outline--secondary-t-1" name="badContentDiv" id="badContentDiv">
				<textarea  class="kt-hide" name="badContent" id="badContent"></textarea>
			</div>
			
		</div>
	</div>
	
	<div class="card kt-margin-t-10"  name="badCmtDiv" id="badCmtDiv">
		<div class="card-header kt-font-bolder osl-line-height--32">
			<i class="fa flaticon-chat-1 kt-margin-r-5"></i><span data-lang-cd="bad1007.label.comment">댓글</span>
			<div class="kt-portlet__head-toolbar float-right">
				
				<div class="kt-widget__wrapper" name="badCmtBtnDiv" id="badCmtBtnDiv">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1007CmtTable" data-datatable-action="select" title="댓글 조회" data-title-lang-cd="bad1007.actionTooltip.selectCommentTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
						<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="bad1007CmtTable" data-datatable-action="delete" title="댓글 삭제" data-title-lang-cd="bad1007.actionTooltip.deleteCommentTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="2">
						<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
					</button>
				</div>
			</div>
		</div>
		<div class="osl-bad__card-body">
			
			<div class="row kt-padding-20 kt-padding-l-30">
				<div class="osl-datatable-search col-lg-5 col-md-6 col-sm-6 col-12" data-datatable-id="bad1007CmtTable"></div>
			</div>
			
			<div class="input-group kt-margin-t-10 kt-margin-b-10 kt-padding-l-30 kt-padding-r-10 osl-bad__width__95 kt-hide" name="badCmtInput" id="badCmtInput">
				<div class="input-group-prepend kt-padding-r-15" name="loginUsr" id="loginUsr">
				</div>
				<input type="text" class="form-control" name="cmtWriter" id="cmtWriter" autocomplete="off" maxlength="370" />
				<div class="form-group-append">
					<button class="btn btn-brand" type="button" name="cmtSaveBtn" id="cmtSaveBtn"><i class="fas fa-comment-medical"></i><span data-lang-cd="bad1007.button.submit">등록</span></button>
				</div>
			</div>
			
			
			<div class="kt-margin-t-10" name="badCmtList" id="badCmtList">
				<div class="kt_datatable" id="bad1007CmtTable"></div>
			</div>
		</div>
	</div>
</div>

<script>
"use strict";

var OSLBad1007Popup = function () {
	
	var okManager;
	var okWriter;
	
	
	var fileUploadObj;
	
	
	var tag = [];

	
	var formEditList = [];
	
	
	var paramRowData;
	
	
   	var dataTableId = "bad1007CmtTable";
   	
	
	var type;
	
	
	var mouseX = 0;
    var documentSetting = function () {
    	
    	paramRowData = JSON.parse($("#paramRow").val());
	
    	
    	$("#paramRow").val('');
    	
    	
    	type = $("#stmTypeCd").val();
    	
		checkUser();
    	
		
	   	fileUploadObj = $.osl.file.uploadSet("fileObjectListDiv",{
	   		meta: {"atchFileId": paramRowData.atchFileId, "fileSn": 0},
	   		maxFileSize: Number(paramRowData.fileStrg)/(1024*1024),
	   		maxNumberOfFiles: Number(paramRowData.fileCnt),
	   		height: 370,
	   		isDraggingOver: false,
    		fileDownload: true,
    		fileReadonly: true
	   	});

	   	fileUploadObj.reset();
	   	
	   	
	   	
	   	if(!$.osl.isNull($("#badHitYn").val())){
	   		selectBadInfo(false);
	   	}else{
	   		selectBadInfo(true);
	   	}

	   	
    	$.osl.datatable.setting(dataTableId, {
			 data: {
				 source: {
					 read: {
						url: "/bad/bad1000/bad1100/selectBad1100CmtListAjax.do",
						params : {
							menuId: paramRowData.menuId,
							badId : paramRowData.badId
						}
					 }
				 },
			 },
			 columns: [
				 {field: 'checkbox', title: '#', textAlign: 'center', width: 30, selector: {class: "kt-checkbox--solid"}, sortable: false, autoHide: false},
				 {field: 'badCmtUsrId', title: '작성자', textAlign: 'left', width: 180,
						template: function (row) {
							var usrData = {
									html: row.badCmtUsrNm + " (" + row.badCmtUsrId + ")",
									imgSize: "sm",
									class:{
										cardBtn: "osl-width__fit-content"
									}
							};
							return $.osl.user.usrImgSet(row.badCmtUsrImgId, usrData);
						},
						onclick: function(rowData){
							$.osl.user.usrInfoPopup(rowData.badCmtUsrId);
						}
						, search:true},
				 {field: 'badCmtContent', title:'내용', textAlign: 'left', width:740, autoHide: false, search:true,
					template:function(row){
						var returnStr = "<span class='cmtTxt text-break'>"+$.osl.escapeHtml(row.badCmtContent)+"</span>";
						return returnStr;
					}			
				 },
				 {field: 'badCmtDtm', title: '작성일', textAlign: 'center', width: 100, search:true, searchType:"daterange",
					 template: function(row){
						var paramDatetime = new Date(row.badCmtDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yy.MM.dd"});
		                return agoTimeStr.agoString;
					},	
				 }
			 ],
			 layout:{ "header" : false },
			 actionBtn:{
				 "title": $.osl.lang("bad1007.actionBtn.title"),
				 "update": false,
				 "delete": true,
				 "click": true,
			 },
			 actionTooltip:{
				"delete": $.osl.lang("bad1007.actionTooltip.deleteCommentTooltip"),
			},
			actionFn:{
				"delete":function(rowDatas){
					 
					 if(paramRowData.delCd =='02'){
						
						var selfCheck = "Y";
						$.each(rowDatas, function(idx, value){
							if(value.badCmtUsrId != $.osl.user.userInfo.usrId){
								selfCheck = "N";
							}
						});
						
						if(okManager == true || (okWriter == true && selfCheck == "Y")){
							var data = {
		 							menuId : paramRowData.menuId,
		 							badId : paramRowData.badId,
		 							deleteDataList : JSON.stringify(rowDatas),
							};
							
							var ajaxObj = new $.osl.ajaxRequestAction(
			    			{"url":"<c:url value='/bad/bad1000/bad1000/deleteBad1100CmtInfoAjax.do'/>"}
			    			, data);
							
					    	ajaxObj.setFnSuccess(function(data){
					    		if(data.errorYn == "Y"){
									$.osl.alert(data.message,{type: 'error'});
									
									$.osl.layerPopupClose();
								}else{
									selectCmtList();
								}
							});
					    	
							ajaxObj.send();	
					 	}else{
					 		$.osl.alert($.osl.lang("bad1007.notCmtWriter.deleteMessage"), {"type":"warning"});
					 	}
					 }
				 }
			 },
			 theme:{
				 actionBtn:{
					 
					 click: " kt-hide"
				 }
			 }
    	});
	   	
    	$("#"+dataTableId).on("kt-datatable--on-layout-updated", function(){
    		 
    		 $(".cmtTxt").parent("span").addClass("osl-bad__width__100");
    	});
	   	
    	
		$("#cmtWriter").keydown(function(e){
			if(e.keyCode=='13'){
				e.preventDefault();
				$("#cmtSaveBtn").click();
				return;
			}
		});
    	
    	
    	$("#cmtSaveBtn").click(function(){
    		var cmtWriter = $("#cmtWriter").val().trim();
    		
    		if( $.osl.isNull(cmtWriter)){
    			return;
    		}else{
	    		insertCmtInfo();
    		}
    	});
    	
    	
    	$("#updateBtn").click(function(){
    		var data = {
    				paramRow : JSON.stringify(paramRowData),
    				stmRootYn : $("#stmRootYn").val(),
				};
			var options = {
					idKey: "bad1009_" + paramRowData.badId, 
					modalTitle: "[ "+$.osl.escapeHtml($("#stmNm").val())+" ]  NO."+paramRowData.badNum,
					closeConfirm: true,
					autoHeight: false,
					modalSize: "xl",
				};
			
			
			if(okManager == true || $("#writerDiv").data("badUsrId") == $.osl.user.userInfo.usrId){
				
   				$.osl.layerPopupClose();
				$.osl.layerPopupOpen('/bad/bad1000/bad1000/updateBad1009View.do',data,options);
			}else{
				$.osl.alert($.osl.lang("bad1007.notAuthority.updateMessage"), {"type":"warning"});
			}
    	});
    	
    	
		$("#deleteBtn").click(function(){
			var data = {
					stmTypeCd : $("#stmTypeCd").val(),
					menuRootYn : 'N',
					deleteDataList : JSON.stringify(paramRowData),
			};
			var options = {
					idKey: "del_"+paramRowData.badId,
					modalTitle: $.osl.lang("bad1007.title.boardCheck.oneStep", paramRowData.badNum) + " " +$.osl.lang("bad1007.title.deleteReason"),
					closeConfirm: false,
					autoHeight: false,
					modalSize: "xl"
				};
			
			
			if(okManager == true || $("#writerDiv").data("badUsrId") == $.osl.user.userInfo.usrId){
				
				$.osl.layerPopupOpen('/bad/bad1000/bad1000/deleteBad1000View.do', data, options);
			}else{
				$.osl.alert($.osl.lang("bad1007.notAuthority.deleteMessage"), {"type":"warning"});
			}
    	});
    	
		
    	$("#restoreBtn").click(function(){
    		
			if(okManager == true){
	    		var data = {
	    				prjGrpId: paramRowData.prjGrpId,
	    				prjId : paramRowData.prjId,
						menuId : paramRowData.menuId,
						badId : paramRowData.badId,
						atchFileId : paramRowData.atchFileId,
					};
				
	    		
	    		var ajaxObj = new $.osl.ajaxRequestAction(
		    			{"url":"<c:url value='/bad/bad1000/bad1000/updateBad1001BadRestoreAjax.do'/>"}
						, data);
	    		
		    	ajaxObj.setFnSuccess(function(data){
		    		if(data.errorYn == "Y"){
						$.osl.alert(data.message,{type: 'error'});
						
						$.osl.layerPopupClose();
					}else{
						
						fileUploadObj.reset();
						
						
						selectBadInfo(false);
						
						selectCmtList();
						
						$.osl.toastr(data.message);
					}	
				});
		    	
				ajaxObj.send();
			}else{
				$.osl.alert($.osl.lang("bad1007.notAuthority.restoreMessage"), {"type":"warning"});
			}
    	});
		
    };
    
    
    
    var selectBadInfo = function(badHitYn){
    	
		var data={
				menuId : paramRowData.menuId,
				badId : paramRowData.badId,
				badNum : paramRowData.badNum,
    	};
    	
    	
    	if(paramRowData.delCd=='02' && badHitYn == true){
    		data.badHit = true;
    	}else{
    		data.badHit = false;
    	}
    	
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/bad/bad1000/bad1000/selectBad1001InfoAjax.do'/>"}
				, data);
    	
    	
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var setBad = data.bad1001Info;
				var tagList = data.bad1001Tag;
				var fileList = data.bad1001FileList;
				var fileCnt = data.bad1001FileListCnt;
				
				
				
				
				$("#badTitleDiv").empty();
				var titleStr = "";
				var title = $.osl.escapeHtml(setBad.badTitle);
				
				
				if(setBad.badNtcCheck=='01' && paramRowData.stmNtcYnCd=='01'){
					
					titleStr += "<span class='kt-badge kt-badge--danger kt-badge--inline kt-badge--pill kt-margin-5'>"+$.osl.lang("bad1000.label.noticeBadge")+"</span>";
					titleStr += title;
				}else{
					titleStr += title;
				}
				
				if(setBad.badPw != null && setBad.badPw != "" && paramRowData.stmPwYnCd=='01'){
					titleStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
				}
				
				if(setBad.delCd=='01' && $("#stmRootYn").val()=='Y'){
					titleStr = "<span class='kt-badge kt-badge--dark kt-badge--inline kt-badge--pill kt-margin-5'>"+$.osl.lang("bad1000.label.deleteBadge")+"</span>" + titleStr;
					
					$("#updateBtn").addClass("kt-hide");
					$("#deleteBtn").addClass("kt-hide");
					
					$("#badDelCd").val("01");
					
					$("#restoreBtn").removeClass("kt-hide");
				}else{
					
					$("#updateBtn").removeClass("kt-hide");
					$("#deleteBtn").removeClass("kt-hide");
					
					$("#badDelCd").val("02");
					
					$("#restoreBtn").addClass("kt-hide");
				}
				$("#badTitleDiv").append(titleStr);
				
				
				var usrData = {
						html: setBad.badUsrNm + " (" +setBad.badUsrId + ")",
						imgSize: "sm",
						class:{
							cardBtn: "osl-width__fit-content"
						}
				};
				$("#writerDiv").html($.osl.user.usrImgSet(setBad.badUsrImgId, usrData));
				$("#writerDiv").data("badUsrId", setBad.badUsrId);
				
				
				$("#writerDiv>.kt-user-card-v2.btn.osl-width__fit-content").children("div").click(function(){
					$.osl.user.usrInfoPopup(setBad.badUsrId);
				});
				
				
				$("#writeDateDiv").text($.osl.lang("bad1001.label.writeDate")+ " : " + setBad.badWtdtm);
				
				
				if($.osl.isNull($.osl.escapeHtml(setBad.badContent))){
					$("#badContentDiv").addClass("kt-hide");
				}else{
					
					$("#badContent").val(setBad.badContent);
					
			    	formEditList.push($.osl.editorSetting("badContent", {
			    		toolbar: false,
		    			disableResizeEditor: false,
		    			disableDragAndDrop: true,
		    			disabledEditor: true,
		    			height:260
			    	}));
			    	
			    	$("#badContent").removeClass("kt-hide");
				}
				
				
				if(paramRowData.stmFileCnt != '0' && !$.osl.isNull(fileList)){
					$("#badFileOption").removeClass("kt-hide");
					
					
					
			    	fileUploadObj.setMeta({fileSn: parseInt(fileCnt)+1});
			    	
			    	$.osl.file.fileListSetting(fileList, fileUploadObj);
			    	fileUploadObj.reset();
			    	
			    	$("#fileListDiv").empty();
		    		$("#fileListBtnDiv").empty();
		    		
			    	
			    	if(type=="03"){
			    		var resultStr = "<div class='carousel-inner osl-slideshow-container'>";
			    		var resultStrNext ='';
			    		$.each(fileList, function(idx, map){
			    			if(idx == 0){
				    			resultStr += "<div class='carousel-item active osl-slideshow-img kt-align-center' data-slide-to='"+idx+"'>";
				    			resultStrNext += "<span class='osl-dot active' data-target='#fileListDiv' data-slide-to='"+idx+"'></span>";
			    			}else{
				    			resultStr += "<div class='carousel-item osl-slideshow-img kt-align-center' data-slide-to='"+idx+"'>";
				    			resultStrNext += "<span class='osl-dot' data-target='#fileListDiv' data-slide-to='"+idx+"'></span>";
			    			}
			    					resultStr += "<img class='kt-hide' src='/cmm/fms/getImage.do?fileSn="+map.fileSn+"&atchFileId="+map.atchFileId+"' data-atch-file-id='"+map.atchFileId+"' data-file-sn='"+map.fileSn+"'/>"
											+"</div>";
			    		});
			    		resultStr += "</div>";
			    		
			    		$("#fileListDiv").append(resultStr);
			    		$("#fileListBtnDiv").append(resultStrNext);
						
				    	
				    	$('.osl-slideshow-container img').on('load',function(){
				    		$.each($(".osl-slideshow-img"), function(idx, map){
					    		var w = $(map).find("img")[0].naturalWidth;
					    		var h = $(map).find("img")[0].naturalHeight;
					    		if(w<h){
					    			$($(map).find("img")).attr("class","h-100 osl-slideshow-img__limite");
					    		}else{
					    			$($(map).find("img")).attr("class","w-100 osl-slideshow-img__limite");
					    		}
					    		
					    		$(map).removeClass("kt-hide");
				    		});
				    	});
				    	
				    	$(".osl-dot").on("click", function(){
				    		var pageNum = $(this).data("slideTo");
				    		var dots = $(".osl-dot");
				    		$(".osl-dot").removeClass("active");
				    		$(dots[pageNum]).addClass("active"); 
				    	});
				    	
				    	
				    	$(".osl-slideshow-img>img").on({
				    		'dragstart':function(e){
				    			mouseX = e.pageX;
				    		},
				    		'dragend':function(e){
				    			var diffX = e.pageX - mouseX;
				    			var imageDiv = $(this).parents('.carousel-item');
				    			var pageNum = parseInt(imageDiv.data("slideTo"));
				    			var dots = $(".osl-dot");
 					    		if(diffX<0){
					    			
					    			
 					    			$('.carousel').carousel('next');
 					    			
 					    			if((pageNum+1)==dots.length){
 					    				$(".osl-dot").removeClass("active");
 							    		$(dots[0]).addClass("active");
 					    			}else{
 					    				$(".osl-dot").removeClass("active");
 							    		$(dots[pageNum+1]).addClass("active");
 					    			}
				    				
				    				mouseX = 0; 
					    		}else{
					    			
					    			
				    				$('.carousel').carousel('prev');
				    				
 					    			if((pageNum-1)<0){
 					    				$(".osl-dot").removeClass("active");
 							    		$(dots[dots.length-1]).addClass("active");
 					    			}else{
 					    				$(".osl-dot").removeClass("active");
 							    		$(dots[pageNum-1]).addClass("active");
 					    			}
 					    			
				    				mouseX = 0;
					    		}
				    		},
				    		'touchstart':function(e){
				    			mouseX = e.screenX;
				    		},
				    		'touchend':function(e){
				    			console.log(e);
				    			var diffX = e.screenX - mouseX;
				    			var imageDiv = $(this).parents('.carousel-item');
				    			var pageNum = parseInt(imageDiv.data("slideTo"));
				    			var dots = $(".osl-dot");
				    			if(diffX<0){
					    			
					    			
 					    			$('.carousel').carousel('next');
 					    			
 					    			if((pageNum+1)==dots.length){
 					    				$(".osl-dot").removeClass("active");
 							    		$(dots[0]).addClass("active");
 					    			}else{
 					    				$(".osl-dot").removeClass("active");
 							    		$(dots[pageNum+1]).addClass("active");
 					    			}
				    				
				    				mouseX = 0; 
					    		}else{
					    			
					    			
				    				$('.carousel').carousel('prev');
				    				
 					    			if((pageNum-1)<0){
 					    				$(".osl-dot").removeClass("active");
 							    		$(dots[dots.length-1]).addClass("active");
 					    			}else{
 					    				$(".osl-dot").removeClass("active");
 							    		$(dots[pageNum-1]).addClass("active");
 					    			}
 					    			
				    				mouseX = 0;
					    		}
				    		}
				    	});		
				    	 
			    	}else{ 
			    		
			    	}	
			    	
			    	
			    	 
			    	
			    	
			    	$(".osl-slideshow-img>img").click(function(e){
			    		$.osl.confirm($.osl.lang("bad1007.confirm.fileDownload"), {"html": true}, function(result){
			    			if(result.value){
			    				
								var atchFileId = $(e.currentTarget).data("atchFileId");
								var fileSn = $(e.currentTarget).data("fileSn");
								
								$.osl.file.fileDownload(atchFileId, fileSn);
			    			}
			    		});
			    	});
				}else{
					$("#badFileOption").addClass("kt-hide");
				}
				
				
				if(paramRowData.stmTagYnCd == '01' && !$.osl.isNull(tagList) && tagList[0] != null)
				{
					$("#badTagOption").removeClass("kt-hide");
					$.each(tagList, function(idx, value){
						
						var innerHtml = "";
	                	innerHtml += "<tag title='"+$.osl.escapeHtml(value)+"' contenteditable='false' spellcheck='false' class='tagify tagify__tag--brand tagify--noAnim kt-padding-5 osl-display--inline-flex osl-margin-3' role='tag' value='"+$.osl.escapeHtml(value)+"'>";
	                	innerHtml += "<div><div class='tagify__tag-text kt-margin-l-5 kt-margin-r-5'>#"+$.osl.escapeHtml(value)+"</div></div></tag>";
	                	
	                	$("#tagListDiv").append(innerHtml);
	                	tag.push(value);
					});
					
					
					$("tag").click(function(){
						
						$.osl.layerPopupClose();
						
						$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id=bad1006BadTable]").children("a.dropdown-item.active").attr("class", "dropdown-item");
						$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id=bad1006BadTable]").children("a.dropdown-item[data-field-id=tagNm]").attr("class", "dropdown-item active");
						
						$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id=bad1006BadTable]").parent().children(".btn.btn-secondary.dropdown-toggle").text($.osl.lang("bad1006.field.tagNm"));
						
						
						$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id=bad1006BadTable]").attr("style", "display:none;");
						$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id=bad1006BadTable]").attr("aria-hidden", "true");
						
						$("#searchData_bad1006BadTable").removeAttr("disabled");
						
						$("#searchData_bad1006BadTable").val($(this).attr("value"));
						
		    			$(".osl-datatable-search__button[data-datatable-id=bad1006BadTable]").click();	
					});
				}else{
					$("#badTagOption").addClass("kt-hide");
				}
				
				
				
				if(paramRowData.stmCmtYnCd == "01"){
					
					if(setBad.badCmtYn == "01"){
						$("#badCmtDiv").removeClass("kt-hide");
						$("#badCmtInput").removeClass("kt-hide");
						
						$("#loginUsr").empty();
						var usrData = {
								html: $.osl.user.userInfo.usrNm + " (" + $.osl.user.userInfo.usrId + ")",
								imgSize: "sm",
								class:{
									cardBtn: "osl-width__fit-content"
								}
						};
						$("#loginUsr").append($.osl.user.usrImgSet($.osl.user.userInfo.usrImgId, usrData));
						$("#loginUsr").click(function(){
							$.osl.user.usrInfoPopup($.osl.user.userInfo.usrId);
						});
					}else{
						
						$("#badCmtInput").addClass("kt-hide");
					}

					
			    	$("#cmtWriter").on("keypress", function(e){
			    		if(e.key == "Enter"){
			    			$("#cmtSaveBtn").click();		
			    		}
			    	});
				}else{
					
					$("#badCmtDiv").addClass("kt-hide");
				}

				
				
				OSLBad1006Popup.reload();
			}
    	});
    	
    	
		ajaxObj.send();
	};

	
	
    var selectCmtList = function(){
		$("button[data-datatable-id=bad1007CmtTable][data-datatable-action=select]").click();
	};
	
	
    
    var insertCmtInfo = function(){
    	
		var data={
    			menuId : paramRowData.menuId,
    			badId : paramRowData.badId,
    			badCmtContent: $.osl.escapeHtml($("#cmtWriter").val()),
   			};
    	
    	
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/bad/bad1000/bad1100/insertBad1100CmtInfoAjax.do'/>"}
				, data);
    	
    	
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				$("#cmtWriter").val('');
				
				
   				OSLBad1006Popup.reload();
				selectCmtList();
			}
		});
		
		
		ajaxObj.send();
	};
	
	 
	 var checkUser = function(){
		 var data = {
				 authGrpId : $.osl.selAuthGrpId,
				 prjGrpId :$.osl.selPrjGrpId,
	   			 prjId : $.osl.selPrjId,
				 menuId : $("#menuId").val(),
				 dsTypeCd : $("#stmDsTypeCd").val(),
		 };
		
    	var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2100UserCheckAjax.do'/>", "async": false}
				, data);
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var result = data.result;
				if(result.resultManager == "Y"){
					okManager = true;	
				}else{
					
					if($("#stmRootYn").val()=='Y'){
						okManager = true;
					}else{
						
						okManager = false;
					}
				}
				
				
				if(result.resultWriter == "Y" || result.resultWriter == "B"){
					okWriter = true;	
				}else{
					okWriter = false;
				}
			}
		});
		
    	
		ajaxObj.send();
	};
	
	
    return {
        init: function() {
        	documentSetting();
        },
        reDraw: function(badId) {
        	
        	selectBadInfo(true);
        }
    };
}();

$.osl.ready(function(){
	OSLBad1007Popup.init();
});
</script>