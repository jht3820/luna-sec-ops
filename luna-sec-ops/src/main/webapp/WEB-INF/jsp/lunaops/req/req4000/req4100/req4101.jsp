<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frReq4101" autocomplete="off">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="changePrj" id="changePrj" value="<c:out value='${param.changePrj}'/>">
	<input type="hidden" name="reqId" id="reqId" value="<c:out value='${param.paramReqId}'/>">
	<input type="hidden" name="reqUsrId" id="reqUsrId" value="<c:out value='${param.paramReqUsrId}'/>">
	<input type="hidden" name="reqGrpId" id="reqGrpId" value="<c:out value='${param.paramReqGrpId}'/>">
	<input type="hidden" name="reqPrjId" id="reqPrjId" value="<c:out value='${param.paramPrjId}'/>">
	<input type="hidden" name="atchFileId" id="atchFileId">
	<input type="hidden" name="oriAtchFileId" id="oriAtchFileId">
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" id="mainCol" name="mainCol">
			<div class="kt-portlet kt-portlet--collapsed" id="req4101RequestUsrInfo">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.title">요청자 정보</span>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-xl-2 kt-align-center">
							<a href="#" class="kt-media kt-media--xl kt-media--circle">
								<img type="img" id="usrImgId">
							</a>
						</div>
						<div class="col-xl-5">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.usrNm">요청자 이름</span></label>
								<div class="input-group">
									<input type="text" class="form-control" placeholder="요청자 이름" name="reqUsrNm" id="usrNm" autocomplete="off">
									<button type="button" class="btn btn-brand input-group-append" id="searchUsrNmBtn" name="searchUsrNmBtn"><span data-lang-cd="req4101.button.searchBtn">검색</span></button>
								</div>
							</div>
						</div>
						<div class="col-xl-5">
							<div class="form-group">
								<label><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.email">요청자 e-mail</span></label>
								<input type="text" class="form-control" placeholder="요청자 e-mail" name="reqUsrEmail" id="email" autocomplete="off">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-7">
							<div class="form-group">
								<label><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.deptNm">요청자 소속</span></label>
								<input type="text" class="form-control" name="reqUsrDeptNm"placeholder="요청자 소속"  id="deptName" autocomplete="off">
								<input type="hidden" name="reqUsrDeptId" id="deptId" autocomplete="off">
							</div>
						</div>
						<div class="col-xl-5">
							<div class="form-group">
								<label><i class="fa fa-phone-square-alt kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqUser.tel">요청자 연락처</span></label>
								<input type="text" class="form-control" placeholder="요청자 연락처" name="reqUsrNum" id="telno" autocomplete="off">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="kt-portlet kt-portlet--collapsed" id="req4101ReqGrpInfo">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<i class="fa flaticon2-layers-1 kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqInfo">그룹 요구사항 정보</span>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReq">그룹 요구사항</span></label>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="그룹 요구사항을 선택하세요" name="reqGrpNm" id="reqGrpNm">
							<button type="button" class="btn btn-brand input-group-append" id="searchReqGrpBtn" name="searchReqGrpBtn"><span data-lang-cd="req4101.button.searchBtn">검색</span></button>
						</div>
					</div>
					<div class="form-group kt-margin-b-0">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.group.groupReqDesc">그룹 요구사항 내용</span></label>
						<textarea class="kt-hide" name="reqGrpDesc" id="reqGrpDesc"></textarea>
					</div>
				</div>
			</div>
			<div class="kt-portlet">
				<div class="kt-portlet__body">
					<div class="row">
						<div class="col-xl-6">
							<div class="form-group">
								<label for="exampleSelect1"><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req4101.label.prjNm">프로젝트</span></label>
								<select class="form-control kt-select2" name="prjId" id="reqPrjSelect">
								</select>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="form-group">
								<label><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDtm">요청 일자</span></label>
								<input type="date" class="form-control" placeholder="요청일" name="reqDtm" id="reqDtm" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqNm">요청 제목</span></label>
						<input type="text" class="form-control" placeholder="요청 제목" name="reqNm" id="reqNm" autocomplete="off" required>
					</div>
					<div class="form-group">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req4101.label.reqDesc">요청 내용</span></label>
						<textarea  class="kt-hide" name="reqDesc" id="reqDesc" autocomplete="off" required></textarea>
					</div>
					<!-- 
					<div class="form-group kt-margin-b-10">
						<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
							<input type="checkbox" name="reqPwCheckbox" id="reqPwCheckbox">
							<span></span>
						</label>
						<span data-lang-cd="req4101.label.reqPw">요구사항 잠금</span>
					</div>
					<div class="kt-hide osl-bad_box" name="pwOption" id="pwOption">
				 		<div class="input-group kt-margin-b-10">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="req4101.label.password">PW</span></label>
				 			<input type="password" class="form-control" name="reqPw" id="reqPw" autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexerrorstr="알파벳과 숫자 조합 4-12자 이내"  placeholder="알파벳과 숫자 조합 4-12자 이내"/> 
				 		</div>
				 		<div class="input-group">
					 		<label class='input-group-addon mt-auto mb-auto osl-min-width-80 required'><span data-lang-cd="req4101.label.passwordCheck">PW 확인</span></label>
				 			<input type="password" class="form-control" name="reqPwCheck" id="reqPwCheck"autocomplete="new-password" regexstr="^[a-z0-9]{4,12}$" maxlength="12" regexerrorstr="알파벳과 숫자 조합 4-12자 이내"  placeholder="알파벳과 숫자 조합 4-12자 이내" equalTo="#reqPw"/>
			 			</div>
				 	</div>
				 	 -->
					<div class="form-group kt-margin-t-25 form-group-last">
						<label>
							<i class="fa fa-file-upload kt-margin-r-5"></i>
							<span data-lang-cd="req4101.label.attachments">파일 첨부</span> 
							<button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="fileRemoveResetBtn">
								<span data-lang-cd="req4101.button.deleteResetBtn">삭제 초기화</span>
							</button>
						</label>
						<div class="kt-uppy osl-max-h-px-260" id="req4101FileUpload">
							<div class="kt-uppy__dashboard"></div>
							<div class="kt-uppy__progress"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="kt-portlet kt-portlet--collapsed kt-hide" data-ktportlet="true" id="req4101NewRequestOpt">
				<div class="kt-portlet__head">
					<div class="kt-portlet__head-label">
						<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req4101.label.requestDefaultOptNm">접수 기본항목 입력</span>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body">
				
				</div>
			</div>
		</div> 
		<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12 kt-hide" id="subCol" name="subCol">
			<div class="kt-portlet kt-portlet--mobile">
				<div class="col-12">
					<div class="kt-portlet__head kt-portlet__head--lg kt-padding-10">
						<div class="kt-portlet__head-label">
							<h5 class="kt-font-boldest">
								<i class="fa flaticon2-open-box kt-margin-r-5"></i>
								<span data-lang-cd="req4101.prepData.title">선행처리 지식확인</span>
							</h5>
						</div>
						<div class="kt-portlet__head-toolbar">
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-width-0 invisible" data-datatable-id="prepListTable" data-datatable-action="select" title="선행지식 조회" data-title-lang-cd="req4101.prepData.tooltip.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
								<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
							</button>
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air btn-view-type active" title="카드형" data-title-lang-cd="req4101.prepData.tooltip.card" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="2" data-view-type="01">
									<i class="fa fa-table osl-padding-r0"></i>
								</button>
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air btn-view-type" title="그리드형" data-title-lang-cd="req4101.prepData.tooltip.grid" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex=3" data-view-type="02">
									<i class="fa fa-list osl-padding-r0"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="kt-portlet__body kt-padding-10" id="prepListDiv" name="prepListDiv">
					</div>
					<div class="kt-portlet__body kt-padding-10 kt_datatable osl-datatable-footer__divide" id="prepListTable" name="prepListTable">
					</div>
				</div>
			</div>
		</div> 
	</div> 
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="req4101SaveSubmit"><i class="fa fa-check-square"></i><span class="osl-resize__display--show" data-lang-cd="req4101.complete">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLReq4101Popup = function () {
	var formId = 'frReq4101';
	var dataTableId = 'prepListTable';
	
	var formEditList = [];
	
	
	var formValidate = $.osl.validate(formId);

	
	var atchFileId;

	
	var fileUploadObj;
	
	
	var uploadRemoveFiles = [];
	
	
	var currentViewType = "01";

	
	var type;
	
	
	
	
    
    var documentSetting = function () {
    	
    	
    	$("#reqPrjSelect").html($.osl.prjGrpAuthSelSetting(2,true));
    	
    	type = $("#type").val();
    	
    	
    	$("#req4101SaveSubmit > span").text($.osl.lang("req4101.button."+type+"Btn"));
    	
    	
    	new KTPortlet('req4101RequestUsrInfo', $.osl.lang("portlet"));
    	new KTPortlet('req4101ReqGrpInfo', $.osl.lang("portlet"));
    	new KTPortlet('req4101NewRequestOpt', $.osl.lang("portlet"));
    	
    	
		$("#usrNm").attr("placeholder",$.osl.lang("req4101.placeholder.usrNm"));
		$("#email").attr("placeholder",$.osl.lang("req4101.placeholder.email"));
		$("#deptName").attr("placeholder",$.osl.lang("req4101.placeholder.deptNm"));
		$("#telno").attr("placeholder",$.osl.lang("req4101.placeholder.tel"));
		
    	$("#ReqGrpNm").attr("placeholder",$.osl.lang("req4101.placeholder.selectGroup"));
		$("#reqDtm").attr("placeholder",$.osl.lang("req4101.placeholder.reqDtm"));
		$("#reqNm").attr("placeholder",$.osl.lang("req4101.placeholder.reqNm"));
		
		
		
		
		
		
		
    	
    	
    	fileUploadObj = $.osl.file.uploadSet("req4101FileUpload",{
    		url: '/req/req4000/req4100/insertReq4101ReqAtchFileInfo.do',
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": atchFileId, "fileSn": 0},
    		maxNumberOfFiles:20,
    		height: 260,
    		
    		
    		onBeforeUpload: function(files){
    			var rtnValue = files;
    			var uploadFiles = {};
    			
    			if(type=="insert"){
    				
    				$.osl.file.makeAtchfileId(function(data){
    					if(data.errorYn == "Y"){
    						$.osl.toastr(data.message);
    						rtnValue = [];
    					}else{
    						atchFileId = data.atchFileIdString;
    						$("#atchFileId").val(data.atchFileIdString);
    					 	fileUploadObj.setMeta({atchFileId: data.atchFileIdString});
    					 
    						
    	    				$.each(files, function(idx, map){
    	    					map.meta.atchFileId = data.atchFileIdString;
    	    					
    	    					var jsonTmp = {};
    							jsonTmp[map.id] = map;
    							uploadFiles = $.extend(uploadFiles, jsonTmp);
    	    				});
    						
	   						
	   						submitInsertAction();
	   					}
    				});
    			}else{ 
    				
    		    	atchFileId = $("#atchFileId").val();
    				
    				if($.osl.isNull(atchFileId)){
    					
    					$.osl.file.makeAtchfileId(function(data){
    						
    						if(data.errorYn == "Y"){
    							$.osl.toastr(data.message);
    							rtnValue = [];
    						}else{
    							
    							atchFileId = data.atchFileIdString;
    							$("#atchFileId").val(atchFileId);
    						 	fileUploadObj.setMeta({atchFileId: atchFileId});
    						 
    							
    		    				$.each(files, function(idx, map){
    		    					if(map.source != "database"){
    	        						map.meta.atchFileId = atchFileId;
    	        						map.meta.source = map.source;
    	        						
    	        						var jsonTmp = {};
    	        						jsonTmp[map.id] = map;
    	        						uploadFiles = $.extend(uploadFiles, jsonTmp);
    	        					}
    		    				});
    						}
    					});
    				}else{
    					atchFileId = $("#atchFileId").val();
    					
        				
        				$.each(files, function(idx, map){
        					if(map.source != "database"){
        						map.meta.atchFileId = atchFileId;
        						map.meta.source = map.source;
        						
        						var jsonTmp = {};
        						jsonTmp[map.id] = map;
        						uploadFiles = $.extend(uploadFiles, jsonTmp);
        					}
        				});
    				}

    				
    				rtnValue = uploadFiles;
    				if(type=="update"){
	    				
						submitUpdateAction();
    				}else if(type=="copy"){
   						
   						submitCopyAction();
    				}
    			}
			},
			
			onBeforeFileAdded: function(currentFile, files){
				if(type=="copy"){
					
					
					if(currentFile.source != "remove"){
						
						var newNm = new Date().format("ssms")+"_"+currentFile.name;
						currentFile.name = newNm;
						currentFile.meta.name = newNm;
						currentFile.meta.atchFileId = $("#atchFileId").val();
						
						if(currentFile.source == "Dashboard"){
			    			
			    			var fileSn = fileUploadObj.getState().meta.fileSn;
			    			fileUploadObj.setMeta({fileSn: (fileSn + 1)});
						}
					}
				}else{
					
					
					if(currentFile.source != "database" && currentFile.source != "remove"){
						var newNm = new Date().format("ssms")+"_"+currentFile.name;
						currentFile.name = newNm;
						currentFile.meta.name = newNm;
						currentFile.meta.atchFileId = $("#atchFileId").val();
						
		    			
		    			var fileSn = fileUploadObj.getState().meta.fileSn;
		    			currentFile.meta.fileSn = fileSn;
		    			fileUploadObj.setMeta({fileSn: (fileSn+1)});
					}
				}
			}
		});
    	
    	
		
    	if(type!="insert"){
    		
    	   	fileUploadObj.on('file-removed', function(file) {
    	   		file["fileSn"] = file.meta.fileSn;
    	   		file.source = "remove";
    	   		uploadRemoveFiles.push(file);
    	   		
    	   		
    	   		$("#fileRemoveResetBtn").removeClass("d-none");
    		});
    	   	
    	   	
    	   	$("#fileRemoveResetBtn").click(function(){
    	   		$("#fileRemoveResetBtn").addClass("d-none");
    	   		
    	   		$.each(uploadRemoveFiles, function(idx, map){
    	   			fileUploadObj.addFile({
    	   			    name: map.name,
    	   			    type: map.type,
    	   			    source: 'database',
    	   			    meta: {
    	   			    	atchFileId: map.meta.atchFileId,
    	   			    	fileSn: map.meta.fileSn
    	   			    },
    	   				data: map.data,
      				});
    	   		});

	    		setTimeout(function(){
	    			
	    			$.each(fileUploadObj.getFiles(), function(idx, map){
	    				
	    				if(map.source == "database"){
	    					var target = $("#uppy_"+$.escapeSelector(map.id)+" > .uppy-DashboardItem-preview");
	    					target.addClass("osl-cursor-pointer");
	    					target.off("click");
	    					target.click(function(){
	    						$.osl.file.fileDownload(map.meta.atchFileId, map.meta.fileSn);
	    					});
	    				}
	    			});
	    		},2000);
	    		
    	   		uploadRemoveFiles = [];
    		});
    	}
    	
    	
    	
    	var txt = $("#reqNm").val();
    	$.osl.datatable.setting(dataTableId,{
    		data : {
    			source:{
    				read:{
    					url:"/req/req4000/req4100/selectReq4100PrepListAjax.do",
    					params:{
    						searchDataTxt : txt
    					}
    				}
    			}
    		},
    		columns:[
    			{field:'rn', title:'No.', textAlign:'center', width: 50},
    			{field:'reqProTypeNm', title:'처리유형', textAlign:'center', width: 80},
    			{field:'reqOrd', title:'순번', textAlign:'left', width: 80, autoHide:false},
    			{field:'prjNm', title:'프로젝트명', textAlign:'left', width: 180},
    			{field:'reqNm', title:'요구사항명', textAlign:'left', width: 240, autoHide:false, search: true},
    			{field:'reqDtm', title:'요청일', textAlign:'center', width: 180},
    		],
    		actionBtn:{
    			title : $.osl.lang("req4101.prepData.button.detailBtn"),
    			width : 80,
    			"update" : false,
    			"delete" : false,
    			"dblClick" : true,
    		},
    		actionTooltip:{
    			"dblClick": $.osl.lang("req4101.prepData.button.detailBtn"),
    		},
    		actionFn:{
    			"dblClick":function(rowData){
					var data = {
							paramPrjId: rowData.prjId,
							paramReqId: rowData.reqId,
					};
					var options = {
							idKey: rowData.reqId,
							modalTitle: $.osl.lang("req4100.title.detailTitle"),
							closeConfirm: false
					};
					$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4102View.do', data, options);
    			}
    		},
   			toolbar:{
				items:{
					pagination:{
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet:{
								layout: 'default',
								pagesNumber: 4
							},
							mobile:{
								layout: 'default',
								pagesNumber: 3
							}
						}
					}
				}
    		},
    		callback:{
    			initComplete : function(evt, config){
					 viewTypeChange();
				 },
    			ajaxDone: function(evt, list, datatableInfo){
		    		if(txt.trim().length<2){
		    			
					   	
	   					$.each($(".modal.show"), function(idx, modalPop){
	   						
	   						if(modalPop.getAttribute("data-idkey") == "req4100ReqTable"){
	   							
	   							$(modalPop.children).addClass("modal-lg");
	   							$(modalPop.children).removeClass("modal-xl");
	   							
	   							$("#mainCol").removeClass("col-xl-8");     
	   							$("#mainCol").addClass("col-xl-12");
	   							
	   							
	   							$("#subCol").addClass("kt-hide");
	   						}
						});
		    		}else{
		    			
					   	
	   					$.each($(".modal.show"), function(idx, modalPop){
	   						
	   						if(modalPop.getAttribute("data-idkey") == "req4100ReqTable"){
	   							
	   							$(modalPop.children).addClass("modal-xl");
	   							$(modalPop.children).removeClass("modal-lg");
	   							
	   							$("#mainCol").addClass("col-xl-8");     
	   							$("#mainCol").removeClass("col-xl-12");
	   							
	   							
	   							$("#subCol").removeClass("kt-hide");
	   						}
						});
		    		}    	
		    		
    				
    				var resultStr = "<div class='osl-display__flex kt-margin-5'>";
    				if(list.length != 0){
    					resultStr +=	"<div><span data-lang-cd='req4101.prepData.result'>"+$.osl.lang("req4101.prepData.result")+"</span></div>"
										+ 	"<div class='osl-display__flex-r'><span data-lang-cd='req4101.preDatap.total'>"+$.osl.lang("req4101.prepData.total")+"</span>&nbsp;"+list[0].total+"&nbsp;<span data-lang-cd='req4101.prepData.count'>"+$.osl.lang("req4101.prepData.count")+"</span></div>"
									+	"</div>";
    				}else{
    					resultStr +=	"<div><span data-lang-cd='req4101.prepData.notResult'>"+$.osl.lang("req4101.prepData.notResult")+"</span></div>"
											+ 	"<div class='osl-display__flex-r'><span data-lang-cd='req4101.prepData.total'>"+$.osl.lang("req4101.prepData.total")+"</span>&nbsp;0&nbsp;<span data-lang-cd='req4101.prepData.count'>"+$.osl.lang("req4101.prepData.count")+"</span></div>"
										+	"</div>";
    				}
									
									
    				$.each(list, function(idx, row){
    					resultStr += "<div class='card osl-outline--brand kt-margin-t-5 kt-margin-b-5' data-req-id='"+row.reqId+"' data-prj-id='"+row.prjId+"' >"
										+	"<div class='card-header osl-req-prepList__font-bold osl-display__flex kt-padding-10'>"
											+	"<div class='kt-margin-r-5'>"
												+	"["+row.reqProTypeNm+"]"
											+	"</div>"
											+	"<div class='kt-margin-r-5'>"
												+	"["+row.reqOrd+"]"
											+	"</div>"
											+	"<div class='osl-display__flex-r'>"
												+	row.reqDtm
											+	"</div>"
										+	"</div>"
										+	"<div class='card-body kt-padding-10'>"
											+	"<div class='kt-font-sm kt-align-right'>"
												+	$.osl.escapeHtml(row.prjNm)
											+	"</div>"
											+	"<div class='kt-portlet kt-portlet--mobile kt-margin-0 kt-portlet--collapsed osl-remove__box-shadow' id='"+row.reqOrd.replace('-','')+"'>"
												+	"<div class='kt-portlet__head border-0 kt-padding-l-10 kt-padding-r-10'>"
													+	"<div class='kt-portlet__head-label'>"
														+	"<div class='kt-portlet__head-group'>"
															+	"<div class='osl-word__break osl-display--block osl-req-prepList__max-width'>"
																+	"<span class='osl-req__prepList-font__bold'>" +$.osl.lang("req4101.prepData.reqNm") +"&nbsp;:&nbsp;&nbsp; </span>"
																+ 	$.osl.escapeHtml(row.reqNm)
															+	"</div>"
														+	"</div>"
													+	"</div>"
													+	"<div class='kt-portlet__head-toolbar'>"
														+	"<a href='#' data-ktportlet-tool='toggle' class='btn btn-sm btn-icon btn-clean btn-icon-md'>"
															+	"<i class='la la-angle-down'></i>"
														+	"</a>"
													+	"</div>"
												+	"</div>"
												+	"<div class='kt-portlet__body kt-padding-10 border-top'>"
														+ $.osl.escapeHtml(row.reqDesc)
												+	"</div>"
												+	"<div class='kt-align-right'>"
													+	"<button type='button' class='btn btn-outline-brand btn-sm btn-font-sm kt-padding-5 detailBtn' title='"+$.osl.lang("req4101.prepData.tooltip.detailTooltip")+"' data-tatile-lang-cd='req4101.prepData.tooltip.detailTooltip' data-toggle='kt-tooltip' data-skin='brand' data-placement='top'>"
														+	"<i class='fa flaticon2-document'></i>"
														+	"<span data-lang-cd='req4101.prepData.button.detailBtn'>"+$.osl.lang("req4101.prepData.button.detailBtn")+"</span>"
													+	"</button>"
												+	"</div>"
											+	"</div>"
										+	"</div>"
									+	"</div>";   								
    				});
    				$("#prepListDiv").html(resultStr);
					$.each(list, function(idx, row){
						
						new KTPortlet(row.reqOrd.replace('-',''), $.osl.lang("portlet"));
					});
					
					
					$(".detailBtn").click(function(){
						var item = $(this).parents().parents().parents().parents();
						var data = {
								paramPrjId: item.data("prjId"),
								paramReqId: item.data("reqId"),
						};
						var options = {
								idKey: item.data("reqId"),
								modalTitle: $.osl.lang("req4100.title.detailTitle"),
								closeConfirm: false
						}
						$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4102View.do', data, options);
					});
    			}
    		}
    	});
    	
    	
		$(".btn-view-type").click(function(){
			var viewType = $(this).data("view-type");
			
			
			$(".btn-view-type.active").removeClass("active");
			$(this).addClass("active");
			
			currentViewType = viewType;
			
			
			viewTypeChange();
		});
    	
    	
    	if(type == "insert"){
    		
        	$.osl.setDataFormElem($.osl.user.userInfo,"frReq4101", ["usrNm","email","telno","deptName","deptId","usrImgId"]);
			
			$("#reqUsrId").val($.osl.user.userInfo.usrId);
			
	    	
	    	$("#reqDtm").val(new Date().format("yyyy-MM-dd"));
	    	
	    	
	    	formEditList.push($.osl.editorSetting("reqDesc", {formValidate: formValidate, disableResizeEditor: false, 'minHeight': 190}));
	    	formEditList.push($.osl.editorSetting("reqGrpDesc", {
	    		toolbar: false,
    			disableResizeEditor: false,
    			disableDragAndDrop: true,
    			disabledEditor: true,
    			height:180,
    		}));
	    	
	    	
	    	$("#reqDesc").removeClass("kt-hide");
	    	$("#reqGrpDesc").removeClass("kt-hide");
	    	
	    	
			$.osl.date.datepicker($("#reqDtm"), {});
    	}else{
    		
    		
    		selectReqInfo();
    	}
    	
    	 
    	
    	$("#reqGrpNm").focus(function(){
    		
    		
    		$("#reqGrpNm").val("");
    		$("#reqGrpDesc").val("");
    		
    	});
   		
    	
		$("#usrNm").keydown(function(e){
			if(e.keyCode=='13'){
				
				$("#searchUsrNmBtn").click();
			}
			
			$("#reqUsrId").val("");
		});
		
    	
    	$("#reqGrpNm").keydown(function(e){
			if(e.keyCode=='13'){
				
				$("#searchReqGrpBtn").click();
			}
			
			
		});

    	
    	
    	$("#searchUsrNmBtn").click(function(){
    		var data = {
    				usrNm : $("#usrNm").val()
    		};
    		var options = {
    				idKey: "searchUsr",
					modalTitle: $.osl.lang("req4101.modalTitle.userSearch"),
					closeConfirm: true,
					autoHeight:false,
					modalSize: "xl",
					callback:[{
						targetId: "selectUsr",
						actionFn: function(thisObj){
							var temp = OSLCmm6401Popup.getUsrInfo();
							if(!$.osl.isNull(temp)){
								OSLReq4101Popup.setUsrInfo(temp);
							}
						}
					}]
    		};
    		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6400/selectCmm6401View.do',data,options);
    	});
    	
    	
    	$("#searchReqGrpBtn").click(function(){
    		var data = {
    				reqGrpNm : $("#reqGrpNm").val()
    		};
    		var options = {
    				idKey: "searchReqGrp",
					modalTitle: $.osl.lang("req4101.modalTitle.reqGrpSearch"),
					closeConfirm: true,
					autoHeight:false,
					modalSize: "xl",
					callback:[{
						targetId: "selectReqGrp",
						actionFn: function(thisObj){
							var temp = OSLReq4104Popup.getReqGrpInfo();
							if(!$.osl.isNull(temp)){
								OSLReq4101Popup.setReqGrpInfo(temp);
							}
						}
					}]
    		};
    		$.osl.layerPopupOpen('/req/req4000/req4100/selectReq4104View.do',data,options);
    	});
    	
    	
    	$("#reqNm").on("propertychange paste input", function(e){
    		txt = $(this).val();
    		
			$.osl.datatable.list[dataTableId].targetDt.setDataSourceParam("searchDataTxt",txt);
    		
 			$("button[data-datatable-id=prepListTable][data-datatable-action=select]").click();
    	});
    	
    	
    	$("#req4101SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		
    		$.osl.confirm($.osl.lang("req4101.saveString."+type+"Str"),{"html" : true},function(result) {
    	        if (result.value) {
    	        	fileUploadObj.upload();
    	        }
    		});
    	});
    };
    
    
	 var selectReqInfo = function() {
    	var data = {
    			prjId :  $("#reqPrjId").val(),
    			reqId :  $("#reqId").val(),
    	};
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req4000/req4100/selectReq4100ReqInfoAjax.do'/>", "async":"true"}
				,data);
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				
				$.osl.layerPopupClose();
			}else{
				
		    	$.osl.setDataFormElem(data.reqInfoMap,"frReq4101");
				
				
				if(type=="update"){
					
			    	$("#reqUsrId").val(data.reqInfoMap.reqUsrId);
			    	$("#usrNm").val(data.reqInfoMap.reqUsrNm);
			    	$("#email").val(data.reqInfoMap.reqUsrEmail);
			    	$("#telno").val(data.reqInfoMap.reqUsrNum);
			    	$("#deptName").val(data.reqInfoMap.reqUsrDeptNm);
			    	$("#deptId").val(data.reqInfoMap.reqUsrDeptId);
			    	$("#usrImgId").attr("src",$.osl.user.usrImgUrlVal(data.reqInfoMap.reqUsrImgId));
				}else{
					
					
		        	$.osl.setDataFormElem($.osl.user.userInfo,"frReq4101", ["usrNm","email","telno","deptName","deptId","usrImgId"]);
			    	
			    	$("#reqDtm").val(new Date().format("yyyy-MM-dd"));
				}
		    	
		    	$("#reqPrjSelect").val($.osl.escapeHtml(data.reqInfoMap.prjId)).trigger('change.select2');
		    	
		    	if("Y"==$("#changePrj").val()){
			    	
		    		$("#reqPrjSelect").prop("disabled", false);
			    	
			    	$("#atchFileId").val("");
			    	
			    	$("#oriAtchFileId").val(data.reqInfoMap.atchFileId);
				}else{
			    	$("#reqPrjSelect").prop("disabled", true);
			    	$("#oriAtchFileId").val(data.reqInfoMap.atchFileId);
				}
		    	
		    	
		    	formEditList.push($.osl.editorSetting("reqDesc", {formValidate: formValidate, disableResizeEditor: false, 'minHeight': 190}));
		    	
		    	formEditList.push($.osl.editorSetting("reqGrpDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:180,
	    		}));
		    	
		    	$("#reqDesc").removeClass("kt-hide");
		    	$("#reqGrpDesc").removeClass("kt-hide");
		    	
		    	
				$.osl.date.datepicker($("#reqDtm"), {});
		    	
		    	
		    	fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
		    	
		    	
		    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
			}
		});
		
		
		ajaxObj.setFnError(function(xhr, status, err){
			data = JSON.parse(data);
			jAlert(data.message, "알림창");
		});
		
		
		ajaxObj.send();
	};
    
    
    var submitInsertAction = function(){
    	var form = $('#'+formId);    		
    	
		
		if (!form.valid()) {
			return;
		}

       	
   		var fd = $.osl.formDataToJsonArray(formId);

       	
       	fd.append("fileHistory",JSON.stringify(fileUploadObj.getFiles()));
       	
      	
		$.each(fileUploadObj.getFiles(), function(idx, map){
			map.meta.atchFileId = $("#atchFileId").val();
			fd.append("file",map);
		});
      
      	
		var prjGrpId = $("#reqPrjSelect option[value="+$("#reqPrjSelect").val()+"]").data("prj-grp-id");
		fd.append("prjGrpId",prjGrpId);

		
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/req/req4000/req4100/insertReq4101ReqInfoAjax.do'/>"
   			, "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
			,fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				$("button[data-datatable-id=req4100ReqTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		
   		ajaxObj.send();
		
    };
    
    
    var submitUpdateAction = function(){
		var form = $('#'+formId);    		
    	
		
		if (!form.valid()) {
			return;
		}

       	
   		var fd = $.osl.formDataToJsonArray(formId);
       	
       	
       	var uploadFileList = [];
       	$.each(fileUploadObj.getFiles(), function(idx, map){
       		if(!map.hasOwnProperty("source") || map.source == "database"){
       			return true;
       		}
       		uploadFileList.push(map);
       	});

       	uploadFileList = uploadFileList.concat(uploadRemoveFiles);

       	
       	fd.append("fileHistory",JSON.stringify(uploadFileList));

       	
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/req/req4000/req4100/updateReq4101ReqInfoAjax.do'/>", "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
   				,fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				$("button[data-datatable-id=req4100ReqTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		
   		ajaxObj.send();
    };
    
  
    var submitCopyAction = function(){
    	var form = $('#'+formId);    		
    	
		
		if (!form.valid()) {
			return;
		}

       	
   		var fd = $.osl.formDataToJsonArray(formId);

       	
       	fd.append("fileHistory",JSON.stringify(fileUploadObj.getFiles()));
       	
      	
		$.each(fileUploadObj.getFiles(), function(idx, map){
			map.meta.atchFileId = $("#atchFileId").val();
			fd.append("file",map);
		});
      
      	
		var prjGrpId = $("#reqPrjSelect option[value="+$("#reqPrjSelect").val()+"]").data("prj-grp-id");
		fd.append("prjGrpId",prjGrpId);

		
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/req/req4000/req4100/insertReq4100ReqCopyAjax.do'/>"
   			, "loadingShow": false, "async": false,"contentType":false,"processData":false ,"cache":false}
			,fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				$("button[data-datatable-id=req4100ReqTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		
   		ajaxObj.send();
		
    };
    
    
	 var viewTypeChange = function(){
		
		if(currentViewType == "01"){	
			$("#prepListTable .kt-datatable__table").css({visibility: "hidden", height: 0});
			$("#prepListDiv").show();
		}else{	
			$("#prepListTable .kt-datatable__table").css({visibility: "hidden", height: "auto"});
			$("#prepListDiv").hide();
		}
	}

    return {
        
        init: function() {
        	documentSetting();
        },
        setUsrInfo: function(temp){
        	var parseTemp = JSON.parse(temp);
        	
        	
        	$("#reqUsrId").val(parseTemp.usrId);
        	$("#deptId").val(parseTemp.deptId);
        	$("#usrNm").val(parseTemp.usrNm);
        	$("#email").val(parseTemp.email);
        	$("#deptName").val(parseTemp.deptName);
        	$("#telno").val(parseTemp.telno);
        },
        setReqGrpInfo: function(temp){
        	var parseTemp = JSON.parse(temp);
        	
        	
        	$('#reqGrpId').val(parseTemp.reqGrpId);
        	$("#reqGrpNm").val(parseTemp.reqGrpNm);
			$("#reqGrpDesc").val(parseTemp.reqGrpDesc);
			formEditList.push($.osl.editorSetting("reqGrpDesc", {
	    		toolbar: false,
    			disableResizeEditor: false,
    			disableDragAndDrop: true,
    			disabledEditor: true,
    			height:180,
    		}));
			$("#reqGrpKey").val(parseTemp.reqGrpKey);
			
        }
    };
}();


$.osl.ready(function(){
	OSLReq4101Popup.init();
});

	
</script>