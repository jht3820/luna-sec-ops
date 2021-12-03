<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="stm2101Info" autocomplete="off" >
	<div class="kt-portlet kt-portlet--mobile osl-stm__portlet kt-margin-b-0">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<div class="kt-portlet__head-label">
				<h3 class="kt-portlet__head-title kt-font-boldest kt-font-brand">
					<c:if test="${param.stmTypeCd eq '01' }">
						<i class="la la-newspaper-o kt-margin-r-5"></i><span data-lang-cd="stm2100.type.normal">[일반]</span>
					</c:if>
					<c:if test="${param.stmTypeCd eq '02' }">
						<i class="la la-server kt-margin-r-5"></i><span data-lang-cd="stm2100.type.storage">[자료실]</span>
					</c:if>
					<c:if test="${param.stmTypeCd eq '03' }">
						<i class="la la-image kt-margin-r-5"></i><span data-lang-cd="stm2100.type.gallery">[갤러리]</span>
					</c:if>
					<c:if test="${param.stmTypeCd eq '04' }">
						<i class="la la-youtube-play kt-margin-r-5"></i><span data-lang-cd="stm2100.type.move">[영상]</span>
					</c:if>
					<c:out value="${param.stmNm }"/>
				</h3>
			</div>
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-wrapper">
				</div>
			</div>
		</div>
		<div class="kt-portlet__body kt-padding-t-15 kt-padding-b-15">
			<div class="row">
				<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12">
					<input type="hidden" id="menuId" name="menuId" value="${param.menuId }"/>
					<input type="hidden" id="paramStmDsTypeCd" name="paramStmDsTypeCd" value="${param.stmDsTypeCd }"/>
					<div class="form-group kt-margin-b-15">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.name">게시판 명</span></label>
						<input type="text" class="form-control" name="stmNm" id="stmNm" disabled="disabled">
					</div>
					<div class="form-group kt-margin-b-15">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.type">유형</span></label>
						<select class="form-control kt-select2" name="stmTypeCd" id="stmTypeCd"></select>
					</div>
					<div class="form-group kt-margin-b-15">
						<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.dsType">게시물 공개 범위</span></label>
						<select class="form-control kt-select2" name="stmDsTypeCd" id="stmDsTypeCd"></select>
					</div>
					<div class="form-group kt-margin-b-15">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.option">옵션</span></label>
						<div class="row kt-margin-10">
							<div class="col-5">
								<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
									<input type="checkbox" name="stmNtcYnCd" id="stmNtcYnCd">
									<span></span>
								</label>
								<span data-lang-cd="stm2101.label.noticeCheck">공지사항 사용</span>
							</div>
							<div class="col-5">
								<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
										<input type="checkbox" name="stmCmtYnCd" id="stmCmtYnCd"><span></span>
									</label>
									<span data-lang-cd="stm2101.label.commentCheck">댓글 사용</span>
								</div>
							</div>
						<div class="row kt-margin-10">
							<div class="col-5">
								<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
									<input type="checkbox" name="stmPwYnCd" id="stmPwYnCd"><span></span>
								</label>
								<span data-lang-cd="stm2101.label.secretCheck">비밀글 사용</span>
							</div>
							<div class="col-5">
								<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
									<input type="checkbox" name="stmTagYnCd" id="stmTagYnCd"><span></span>
								</label>
								<span data-lang-cd="stm2101.label.tagCheck">태그 사용</span>
							</div>
						</div>
						<div class="row kt-margin-10">
							<div class="col-5">
								<label class="kt-checkbox kt-checkbox--bold kt-checkbox--success align-text-top">
									<input type="checkbox"  name="stmFileYnCd" id="stmFileYnCd"><span></span>
								</label>
								<span data-lang-cd="stm2101.label.attachFileCheck">첨부파일 사용</span>
							</div>
						</div>
					</div>
					<div class="kt-margin-t-15" id="stmFileOption" name="stmFileOption">
						<div class="form-group">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.fileCount">첨부파일 갯수</span></label>
							<input type="text" class="form-control" name="stmFileCnt" id="stmFileCnt" regexstr="^0$|^[1-9]{1}$|^10$" maxlength="2" placeholder="최대 10개 파일" regexalert="최대 숫자 10" required />
							<span class="kt-padding-5 float-right font-italic kt-font-inverse-metal kt-align-right osl-font-xs" data-lang-cd="stm2101.label.maxFileCnt">최대 개수 : 10</span>
						</div>
						<div class="form-group">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.limitFileStrg">첨부파일 용량 제한(MB)</span></label>
							<input type="text" class="form-control" name="stmFileStrg" id="stmFileStrg" regexstr="^0$|^[1-9]{1}[0-9]*$" maxlength="10" placeholder="최대 용량(합)"  regexalert="숫자만 가능" required />
							<span class="kt-padding-5  float-right font-italic kt-font-inverse-metal kt-align-right osl-font-xs" name="stmFileStrgStr" id="stmFileStrgStr" data-lang-cd="stm2101.label.maxFileStrg.basic">최대 용량 : [자료실] 4GB(4096MB) [영상] 2GB(2048MB) [일반/갤러리] 500MB</span>
						</div>
					</div>
				</div>
				
				<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="form-group kt-margin-b-10">
						<div class="kt-margin-b-10">
							<label class="required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.admin">담당자</span></label>
							<span class="float-right">
								<button type="button" class="btn btn-outline-success btn-sm" id="reset_admin" name="reset_admin" title="초기화" data-title-lang-cd="stm2101.button.reset" data-toggle="kt-tooltip" data-skin="brand" data-placement="top"><i class="fas fa-undo-alt"></i><span data-lang-cd="stm2101.button.reset">초기화</span></button>
							</span>
						</div>
						<div class="form-group kt-margin-b-10">
							<div class="kt-list ps--active-y form-control kt-padding-10 overflow-auto osl-height--240" id="stmAdmList" name="stmAdmList" required>
							</div>
						</div>
					</div>
					<div class="form-group kt-margin-b-0">
						<div class="kt-margin-b-10">
							<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm2101.label.writer">글 작성 범위</span></label>
							<span class="float-right">
								<button type="button" class="btn btn-brand btn-sm" id="equalBtn" name="equalBtn" title="담당자 동일" data-title-lang-cd="stm2101.button.equals" data-toggle="kt-tooltip" data-skin="brand" data-placement="top"><i class="fas fa-users"></i><span data-lang-cd="stm2101.button.equals">담당자 동일</span></button>
								<button type="button" class="btn btn-outline-success btn-sm" id="reset_wt" name="reset_wt" title="초기화" data-title-lang-cd="stm2101.button.reset" data-toggle="kt-tooltip" data-skin="brand" data-placement="top"><i class="fas fa-undo-alt"></i><span data-lang-cd="stm2101.button.reset">초기화</span></button>
							</span>
						</div>
						<div class="form-group kt-margin-b-10">
							<div class="kt-list ps--active-y form-control kt-padding-10 osl-height--240 overflow-auto" id="stmWtList" name="stmWtList" required>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12">
					
					<div class="row kt-margin-0">
						<label><i class="fas fa-user-alt kt-margin-r-5"></i><span data-lang-cd="stm2101.label.nothing">미배정 권한그룹 및사용자</span></label>
						<input type="hidden" id="typeString" name="typeString" value="${param.typeString }"/>
						<input type="hidden" id="dataList" name="dataList" value='${param.dataList}'/>
					</div>
					<div class="row kt-margin-0 kt-margin-t-10">
						<div class="input-group">
							<div class="input-group-prepend">
								<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0" name="selectSearchBtn" id="selectSearchBtn"><span data-lang-cd="common.name.all">전체</span></button>
								<div class="dropdown-menu">
									<a class="selectSearchItem dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all"><span data-lang-cd="common.name.all">전체</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchAuthGrpNm" data-opt-type="select"><span data-lang-cd="stm2101.button.authNm">권한그룹 명</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrId" data-opt-type="text"><span data-lang-cd="stm2101.button.userId">사용자 ID</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrNm" data-opt-type="text"><span data-lang-cd="stm2101.button.userName">사용자 명</span></a>
								</div>
							</div>
							<select class="kt-select2 form-control kt-hide" id="searchSelect" name="searchSelect" aria-hidden="true">
							</select>
							<input type="text" class="form-control" disabled="disabled" name="subSearchData" id="subSearchData">
							<div class="input-group-prepend">
								<button class="btn btn-brand" type="button" name="searchBtn" id="searchBtn">
									<i class="fas fa-search"></i>
									<span data-lang-cd="stm2101.button.search">검색</span>
								</button>
							</div>
						</div>
					</div>
					
					<div class="kt-list ps--active-y form-control kt-margin-t-10 kt-padding-10 overflow-auto osl-height--480" id="stmGroupUsrList" name="stmGroupUsrList" required>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm2101SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show" data-lang-cd="stm2101.button.updateSubmit">수정 완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>

<script>
 "use strict";
 
 var OSLStm2101Popup = function(){
	var formId="stm2101Info";
	
	
	var formValidate = $.osl.validate(formId);
	
	
	$("#stm2101SaveSubmit > span").text($.osl.lang("stm2101.button.updateSubmit"));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	
	var oriAdmin;
	var oriWriter;
	
	
	var resultAdmin=[];
	var resultWriter=[];
	var resultAllList=[];
	
	
	var documentSetting = function(){
  		
    	
    	selectBadInfo(); 
    	selectBadChargerList(); 
    	selectBadWriterList(); 
    	setGrpAndUsrList(); 
    	
		drawAfterFtSetting();
		
		showHideBtn("stmAdmList", "right", 'left');
		showHideBtn("stmWtList", "right", 'left');
		showHideBtn("stmGroupUsrList", "left", 'right');
		
    	
    	$('#stmTypeCd').select2({
			ftScrollUse: false,
		});
    	$('#stmDsTypeCd').select2({
			ftScrollUse: false,
		});
    	$('#searchSelect').select2({
			ftScrollUse: false,
		});
    	
    	
		$("#searchSelect~span").addClass("osl-datatable-search--hide");
		
		
		$(".selectSearchItem").click(function(){
			$(".selectSearchItem").removeClass("active");
			$(this).addClass("active");
			$("#selectSearchBtn").text($(this).text());
			
			
			
			$.each($("#stmGroupUsrList").children(), function(idx, value){
				$(this).removeClass("kt-hide");
			});

			
			if($(this).data("optType")=="all"){
				
				$("#searchSelect").addClass("kt-hide");
				$("#searchSelect~span").addClass("osl-datatable-search--hide");
				
				$("#subSearchData").removeClass("kt-hide");
				
				$("#subSearchData").val("");
				$("#subSearchData").attr("disabled", true);
				
				$("#searchBtn").click();
			 }else if($(this).data("optType")=="select"){
				
				$("#searchSelect").removeClass("kt-hide");
				$("#searchSelect~span").removeClass("osl-datatable-search--hide");
				
				$("#subSearchData").addClass("kt-hide");
				
				$("#subSearchData").val("");
				$("#subSearchData").attr("disabled", true);
				
				$("#searchBtn").click();
			 }else{
				
				$("#searchSelect").addClass("kt-hide");
				$("#searchSelect~span").addClass("osl-datatable-search--hide");
				
				$("#subSearchData").removeClass("kt-hide");
				
				$("#subSearchData").val("");
				$("#subSearchData").attr("disabled", false);
				
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					
					
					
					if($(value).data("authTypeCd")=='01'){
						$(this).addClass("kt-hide");
					}else{ 
						$(this).removeClass("kt-hide");
					}
				});
			 }
		});
		
		
		$("#searchSelect").change(function(){
			if("all" == $("#searchSelect").val()){
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					$(this).removeClass("kt-hide");
				});
			}else{
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					if($("#searchSelect").val() != $(value).data("optIndex")){
						$(this).addClass("kt-hide")
					}else{
						$(this).removeClass("kt-hide");
					}
				});
			}
		});
		
		
		$("#subSearchData").on("propertychange paste input", function(){
			$("#searchBtn").click();
		});
		
		
		$("#"+formId).keydown(function(e){
			if(e.keyCode=='13'){
				e.preventDefault();
				$("#searchBtn").click();
				return;
			}
		});
		
		
		$("#searchBtn").click(function(){
			var space = $(".selectSearchItem.dropdown-item.active").data("fieldId");
			if(space == "-1"){
				
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					$(this).removeClass("kt-hide");
				});
			}else if(space == "searchAuthGrpNm"){ 
				
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					
					if($(this).data("authTypeCd")=='01'){
						$(this).removeClass("kt-hide");
						if($("#searchSelect").val() != "all"){
							
							if($("#searchSelect").val() != value.data("optIndex")){
								$(this).addClass("kt-hide")
							}else{
								$(this).removeClass("kt-hide");
							}
						}
					}else{ 
						$(this).addClass("kt-hide");
					}
				});
			}else if(space == "searchUsrId") { 
				
				var txt = $("#subSearchData").val();
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					if($(this).data("authTypeCd")=="02" && $(this).data("authTargetId").indexOf(txt) > -1){
						$(this).removeClass("kt-hide");
					}else{
						$(this).addClass("kt-hide");
					}
				});
			}else{ 
				
				var txt = $("#subSearchData").val();
				$.each($("#stmGroupUsrList").children(), function(idx, value){
					if($(this).data("authTypeCd")=="02" && $(this).data("authTargetNm").indexOf(txt) > -1){
						$(this).removeClass("kt-hide");
					}else{
						$(this).addClass("kt-hide");
					}
				});
			}
		});
		
		
		$("#stmTypeCd").change(function(){
			
			var typeCd = document.getElementById("stmTypeCd").value;
			
			
			if(typeCd == '02')
			{
				$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.storage"));
			}
			
			else if(typeCd == '04')
			{
				$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.movie"));
			}
			else
			{
				$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.normal"));
			}
		});
		
		 
		$("#stmFileYnCd").click(function(){
			
			if($("#stmFileYnCd").is(":checked")==true)
			{
				$("#stmFileOption").removeClass("kt-hide");
			}
			else
			{
				$("#stmFileOption").addClass("kt-hide");
			}
		});

		
		new Sortable($('#stmAdmList')[0], {
			group: {
				
				name: 'stmAdmList',
	            
	            put:['stmGroupUsrList']
	        },
	        animation: 100,
	        
	        chosenClass: "chosen",
	        
 	        onMove:function(evt,originalEvent){
 				var UserAgent = navigator.userAgent;
				
 				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
 					return false;
 				}else{
  					return true;
 				}
 			},
 	      	
 			onAdd:function(evt){
 				var moveDiv = $(evt.item);
 				
 				var result = checkMove(moveDiv, resultAdmin);
 				if(result == 1){
 					
 					evt.item.remove();
 				} 
 				
 				showHideBtn("stmAdmList", "right", 'left');
 				
 				
 				var oriCard = $(evt.clone);
 				checkDoubleMove(oriCard);
 			} 
	    });
		
		
		new Sortable($('#stmWtList')[0], {
			group: {
				
				name: 'stmWtList',
	            
	            put:['stmGroupUsrList']
	        },
	        animation: 100,
	        
	        chosenClass: "chosen",
	        
 	        onMove:function(evt,originalEvent){
 				var UserAgent = navigator.userAgent;
 				
 				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
 					return false;
 				}else{
 					return true;
 				}
 			}, 
 	      	
 			 onAdd:function(evt){
 				var moveDiv = $(evt.item);
 				
 				var result = checkMove(moveDiv, resultWriter);
 				if(result == 1){
 					
 					evt.item.remove();
 				}
 				
 				showHideBtn("stmWtList", "right", 'left');
 				
 				
 				var oriCard = $(evt.clone);
 				checkDoubleMove(oriCard);
 			} 
	    });
		
		
		new Sortable($('#stmGroupUsrList')[0], {
	        group: {
				
	        	name: 'stmGroupUsrList',
	            
	            pull: 'clone',
	            
	            put:['stmWtList','stmAdmList']
	        },
	        animation: 100,
	        
	        chosenClass: "chosen",
	        
 	        onMove:function(evt,originalEvent){
 				var UserAgent = navigator.userAgent;
 				
 				if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null){
 					return false;
				}else{
					return true;
				}
 			},
 	      	
 			onAdd:function(evt){
 				var moveDiv = $(evt.item);
 				
 				
 				if($(evt.from).attr("id") == "stmGroupUsrList"){
 	 	        	checkMove(moveDiv, resultAdmin, true);
 				}else{
 					checkMove(moveDiv, resultWriter, true);
 				}
 				
 				checkDoubleMove(moveDiv);
 				
 				showHideBtn("stmGroupUsrList", "left", 'right');
 				
 				
				moveDiv.remove();
 				
 				checkDoubleMove(moveDiv, true);
 			} 
	    });
		
		
		$("#equalBtn").click(function(){
			$("#stmWtList").empty();
 			
 			var keepList = addJsonList("stmAdmList",true);
 			resultWriter = resultAdmin;
			drawAuthList(keepList, "stmWtList");
			
			var oriCard = $("#stmGroupUsrList").children();
			
			$.each(oriCard, function(idx, value){
				checkDoubleMove($(value));
			});
			
			
			showHideBtn("stmWtList", "right", 'left');
			
			showHideBtn("stmGroupUsrList", "left", 'right');
		});
		
		
		$("#reset_admin").click(function(){
			$("#resultAdmin").empty();
			drawAuthList(oriAdmin, "stmAdmList");
			resultAdmin = [];
			$.each(oriAdmin, function(idx, value){
				resultAdmin.push(value.authTargetId);
			});
			
			var oriCard = $("#stmGroupUsrList").children();
			
			$.each(oriCard, function(idx, value){
				checkDoubleMove($(value));
			});
			
			
			showHideBtn("stmAdmList", "right", 'left');
			
			showHideBtn("strgNonAssList", "left", 'right');
		});
		
		
		$("#reset_wt").click(function(){
			$("#stmWtList").empty();
			drawAuthList(oriWriter, "stmWtList");
			resultWriter = [];
			$.each(oriWriter, function(idx, value){
				resultWriter.push(value.authTargetId);
			});
			
			var oriCard = $("#stmGroupUsrList").children();
			
			$.each(oriCard, function(idx, value){
				checkDoubleMove($(value));
			});
			
			
			showHideBtn("stmWtList", "right", 'left');
			
			showHideBtn("stmGroupUsrList", "left", 'right');
		});
		
		
		$("#stm2101SaveSubmit").click(function(){
			
			if($("#stmFileYnCd").is(":checked")==true){
				 
				
				var formValidate = $.osl.validate(formId);
				
				
	    		if (!$("#"+formId).valid()) {
	    			return;
	    		}
			}
			submitBadOption();
		});
		
		
		KTApp.initTooltips();
	};
	
	
    var selectBadInfo = function(){
	
		var data = {"menuId" : $("#menuId").val()};
		
		
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadInfoAjax.do'/>", "async": false}
				, data);
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var info = data.badInfo;
				
				
				$("#stmTypeCd").attr("data-osl-value", info.stmTypeCd);
				$("#stmDsTypeCd").attr("data-osl-value", info.stmDsTypeCd);
				
		    	
				var commonCodeArr = [
					{mstCd: "STM00001", useYn: "Y", targetObj: "#stmTypeCd", comboType:"OS"}, 
					{mstCd: "STM00002", useYn: "Y", targetObj: "#stmDsTypeCd", comboType:"OS"}, 	
				];
		  		
				$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
				
				
				
				$("#stmNm").attr("value", info.stmNm);

				
				if(info.stmNtcYnCd == "01")
				{
					$("#stmNtcYnCd").attr("checked", true);
				}else{
					$("#stmNtcYnCd").attr("checked", false);
				}
				
				if(info.stmCmtYnCd == "01")
				{
					$("#stmCmtYnCd").attr("checked", true);
				}else{
					$("#stmCmtYnCd").attr("checked", false);
				}
				
				if(info.stmPwYnCd == "01")
				{
					$("#stmPwYnCd").attr("checked", true);
				}else{
					$("#stmPwYnCd").attr("checked", false);
				}
				
				if(info.stmTagYnCd == "01")
				{
					$("#stmTagYnCd").attr("checked", true);
				}else{
					$("#stmTagYnCd").attr("checked", false);
				}
				
				
				var typeCd = document.getElementById("stmTypeCd").value;
				
				if(typeCd == '02')
				{
					$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.storage"));
				}
				
				else if(typeCd == '04')
				{
					$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.movie"));
				}
				else
				{
					$("#stmFileStrgStr").text($.osl.lang("stm2101.label.maxFileStrg.normal"));
				}
				
				if(info.stmFileCnt > 0)
				{
					$("#stmFileYnCd").attr("checked", true);
					
					$("#stmFileOption").removeClass("kt-hide");
					
					$("#stmFileCnt").attr("value", info.stmFileCnt);
					
					$("#stmFileStrg").attr("value", info.stmFileStrg);
				}else{
					
					$("#stmFileOption").addClass("kt-hide");
				}
				
			}
		});
		
		
		ajaxObj.send();
    }
	
	
    var selectBadChargerList = function(){
		var data = {"menuId" : $("#menuId").val()};
		
		
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadChargerListAjax.do'/>", "async": false}
				, data);
		
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var stmAdmList = data.badChargerList;
				
				oriAdmin = stmAdmList;

				
				if($.osl.isNull(oriAdmin)){
					
					var dataOne={};
					dataOne.authTypeCd = '02';
					dataOne.authTargetId = $.osl.user.userInfo.usrId;
					dataOne.authTargetNm = $.osl.user.userInfo.usrNm;
					dataOne.prjGrpId = $.osl.selPrjGrpId;
					dataOne.prjId = $.osl.selPrjId;
					dataOne.authTargetImgId = $.osl.user.userInfo.usrImgId;
					dataOne.authTargetDeptId = $.osl.user.userInfo.deptId;
					dataOne.authTargetDeptNm = $.osl.user.userInfo.deptNm;
					
					oriAdmin.push(dataOne);
				}
				
				
				$.each(oriAdmin, function(idx, value){
					resultAdmin.push(value.stmAdminId);
				});

				
				drawAuthList(oriAdmin, "stmAdmList");
			}
		});
		
		
		ajaxObj.send();
    }
	
	
    var selectBadWriterList = function(){
		var data = {"menuId" : $("#menuId").val()};
		
		
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadWriterListAjax.do'/>", "async": false}
				, data);
		
  		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var stmWtList = data.badWriterList;
				
				
				oriWriter = stmWtList;
				
  				$.each(stmWtList, function(idx, value){
  					resultWriter.push(value.stmWtId);
				});
				
				
				drawAuthList(oriWriter, "stmWtList");
			}
		});
		
		
		ajaxObj.send();
    }
	
    
    var setGrpAndUsrList = function(){
		var allList = [];
		
		
		
    	var data = {
				"menuId" : $("#menuId").val(),
				"stmDsTypeCd" : $("#paramStmDsTypeCd").val(),
				};
		
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm2000/stm2100/selectStm2101BadGrpAndUsrListAjax.do'/>", "async": false}
				, data);
		
  		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{

				var stmAuthList = data.stmAuthList;
				
				var listHtml = "";
				
				
				$("#searchSelect").html("");
				
				var innerHtml = "<option value='all'>"+$.osl.lang("common.name.all")+"</option>";
				$("#searchSelect").append(innerHtml);
				$.each(stmAuthList, function(idx, val){
					if(val.authTypeCd == "01"){
						
						var innerHtml = "<option value='"+idx+"' data-auth-target-id='"+val.authTargetId+"'>"+$.osl.escapeHtml(val.authTargetNm)+"("+$.osl.escapeHtml(val.prjNm)+")</option>";
						$("#searchSelect").append(innerHtml);

						
						resultAllList.push(val.authTargetId);
					}
				});
				
				
				drawAuthList(stmAuthList, "stmGroupUsrList");

				
				var oriCard = $("#stmGroupUsrList").children();
				$.each(oriCard, function(idx, value){
					checkDoubleMove($(value));
				});
			}
		});
		
		ajaxObj.send();
	}
	
	
    var addJsonList = function(elemId, defaultCheck){
		var targetId = '#' + elemId;
		var dataList = [];

		var divList = $(targetId).children();
		
		$.each(divList, function(index, value){
			var dataOne = {};
			dataOne.prjGrpId = $(value).data("prjGrpId");
			dataOne.prjId = $(value).data("prjId");
			dataOne.prjNm = $(value).data("prjNm");
			dataOne.authTargetId = $(value).data("authTargetId");
			dataOne.authTypeCd = $(value).data("authTypeCd");
			dataOne.authTargetNm = $(value).data("authTargetNm");
			dataOne.authTargetImgId = $(value).data("authTargetImgId");
			dataOne.authTargetEmail = $(value).data("authTargetEmail");
			dataOne.authTargetDeptId = $(value).data("authTargetDeptId");
			dataOne.authTargetDeptNm = $(value).data("authTargetDeptNm");
			
			dataList.push(dataOne);
		});
		
		
		
		if(defaultCheck==true && $.osl.isNull(dataList)){
			
			var dataOne={};

			dataOne.prjGrpId = $.osl.selPrjGrpId;
			dataOne.prjId = $.osl.selPrjId;
			dataOne.authTargetId = $.osl.user.userInfo.usrId;
			dataOne.authTypeCd = '02';
			dataOne.authTargetNm = $.osl.user.userInfo.usrNm;
			dataOne.authTargetImgId = $.osl.user.userInfo.usrImgId;
			dataOne.authTargetEmail = $.osl.user.userInfo.email;
			dataOne.authTargetDeptId = $.osl.user.userInfo.deptId;
			dataOne.authTargetDeptNm = $.osl.user.userInfo.deptName;
			
			dataList.push(dataOne);
		}
		
		return dataList;
    }

	
	var drawAuthList = function(setData, elemId){
    	
 		$("#"+elemId).empty();

  		var listHtml = "";
 		
  		$.each(setData, function(index, value){
			
 			listHtml = "<div class='card kt-margin-b-10 flex-flow--row flex-flow--row--reverse' data-opt-index='"+index+"'"
 							+"data-prj-id='"+value.prjId+"' data-auth-type-cd='"+value.authTypeCd+"' data-auth-target-id='"+value.authTargetId+"'"
 							+"data-auth-target-nm='"+value.authTargetNm+"' data-auth-target-id='"+value.authTargetId+"'"
 							+"data-auth-target-img-id='"+value.authTargetImgId+"' data-target-email='"+value.authTargetEmail+"'"
 							+"data-auth-target-dept-id='"+value.targetDeptId+"' data-auth-target-dept-nm='"+value.authTargetDeptNm+"'>"
							+"<div class='dropdown osl-left-arrow-group'>"
								+"<div class='btn dropdown-toggle' id='dropdownMenuButton"+index+"' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"
							+"</div>"		
							+"<div class='dropdown-menu osl-dropdown-menu--position' aria-labelledby='dropdownMenuButton"+index+"'>"
								+"<a class='dropdown-item stmAdmListMoveBtn'>"+$.osl.lang("stm2101.title.admin")+"</a>"
								+"<a class='dropdown-item stmWtListMoveBtn'>"+$.osl.lang("stm2101.title.writer")+"</a>"
							+"</div>"
						+"</div>"
						
						+"<div class='osl-content-group'>"
							
							+"<div class='card-title left-user-group kt-margin-b-0'>";
						
	 			
				if(value.authTypeCd=='01'){
					listHtml += "<span class='groupuser-icon'>"
										+"<i class='fas fa-user-tag'></i>"
									+"</span>"
									+$.osl.escapeHtml(value.authTargetNm)
									+"<span class='badge badge-success osl-margin-left--auto'>"+$.osl.lang("stm2101.label.authGrp")+"</span>"
								+"</div>" 
								
								+"<div class='osl-card__prjnm'>"
									+$.osl.escapeHtml(value.prjNm)
								+"</div>"
						+ "</div>"
						
						+"<div class='osl-right-arrow-group'></div>"
					+"</div>"; 
				}else{ 
					var paramData = {
						html: "<span class='osl-user-card-flex'><span>"+value.authTargetNm +"</span><span>("+value.authTargetId+")</span></span>",
	    				imgSize: "sm",
						class:{
							cardBtn: "osl-bad__fit-content",
						}
					};
					listHtml += "<span class='' data-open-Id='"+value.authTargetId+"'>"
									+ $.osl.user.usrImgSet(value.authTargetImgId, paramData )
								+"</span>"
								+"<span class='badge badge-primary osl-margin-left--auto'>"+$.osl.lang("stm2101.label.user")+"</span>"
							+"</div>"; 
														
								
		 					if($.osl.isNull(value.authTargetDeptNm)){
		 						listHtml += "<div class='osl-card__prjnm'>"
		 										+$.osl.escapeHtml(value.authTargetEmail)
	 										+"</div>";
		 					}else{
		 						listHtml += "<div class='osl-card__prjnm'>"
		 										+$.osl.escapeHtml(value.authTargetDeptNm)
		 									+"</div>";
 							}
 					
			listHtml +="</div>"	
					
					+"<div class='osl-right-arrow-group'></div>"
				+"</div>"; 
			}
			$("#"+elemId).append(listHtml);
 		});
     };
 		
     
 	var drawAfterFtSetting = function(){
 		
 		
		$(".kt-user-card-v2.btn.osl-bad__fit-content").click(function(){
			var usrId = $(this).parent().data("openId");
			$.osl.user.usrInfoPopup(usrId);
		});
		
 		
		$('.osl-right-arrow-group').click(function(){
			
			var moveCard =  $(this).parents('.card');
			
			var formId = moveCard.parent().attr("id");

			
			var _authTargetId = moveCard.data("authTargetId");
			var idx;
			
			
			
			if(formId=="stmAdmList"){
				checkMove(moveCard, resultAdmin, true);
			}else{
				
				
				checkMove(moveCard ,resultWriter, true);
			}
			
			
			checkDoubleMove(moveCard, true);

			
			showHideBtn("stmGroupUsrList", 'left', "right");
			
			
			moveCard.remove();
		});
		
		
		$('.stmAdmListMoveBtn').click(function(){
			
			$(this).parent().removeClass("show");
			
			var oriCard = $(this).parents(".card");
			
			var moveCard = oriCard.clone(true);
			var result = checkMove(moveCard, resultAdmin);
			
			if(result == 0){
				
				$("#stmAdmList").prepend(moveCard);
			}
			
			
			checkDoubleMove(oriCard);
			
			showHideBtn("stmAdmList", "right", 'left');
		});
		
		
		$('.stmWtListMoveBtn').click(function(){
			
			$(this).parent().removeClass("show");
			
			var oriCard = $(this).parents(".card");
			
			var moveCard = oriCard.clone(true);

			var result = checkMove(moveCard, resultWriter);
			if(result == 0){
				
				$("#stmWtList").prepend(moveCard);
			}
			
			
			checkDoubleMove(oriCard);
			
			showHideBtn("stmWtList", "right", 'left');
		});
     }
	

	
	var showHideBtn = function(elemId, showing, hiding){
		var list = $("#"+elemId).children();
		$.each(list, function(idx, value){
			$(value).find(".osl-"+showing+"-arrow-group").removeClass("kt-hide");
			$(value).find(".osl-"+hiding+"-arrow-group").addClass("kt-hide");
		});
	};
	

	
	var checkDoubleMove = function(oriCard, nonListCheck){
		var _authTargetId = oriCard.data("authTargetId");
		if(nonListCheck){
			
			var otherItems = $("#stmGroupUsrList").children();
			$.each(otherItems, function(idx, value){
				if($(value).data("authTargetId")==_authTargetId){
					$(value).removeClass("kt-hide");
				}
			});
		}else{
			
			var adminIdx = resultAdmin.indexOf(_authTargetId);
			var writerIdx = resultWriter.indexOf(_authTargetId);
			
			
			if(adminIdx>=0 && writerIdx >=0){
				oriCard.addClass("kt-hide");
			}else{
				oriCard.removeClass("kt-hide");
			}
		}
	};
	
	
	var checkMove = function(oriCard, arrayList, delCheck){
		var _authTargetId = oriCard.data("authTargetId");
		var arrayListIdx = arrayList.indexOf(_authTargetId);
		
		if(delCheck){
			if(arrayListIdx>=0){
				
				arrayList.splice(arrayListIdx, 1);
			}
		}else{
			
			if(arrayListIdx>=0){
				return 1;
			}else{
				
				arrayList.push(_authTargetId);
				return 0;
			}
		}
	};
	
    
    var submitBadOption = function(){
		
		
		var menuId = $("#menuId").val();
		
		var stmTypeCd = $("#stmTypeCd").val();
		
		var stmAdmList = JSON.stringify(addJsonList("stmAdmList", true));
		
		var stmWtList = JSON.stringify(addJsonList("stmWtList", false));
		
		var stmDsTypeCd = $("#stmDsTypeCd").val();
		
		
		var stmNtcYnCd = "02";
		var stmCmtYnCd = "02";
		var stmPwYnCd = "02";
		var stmTagYnCd = "02";
		var stmFileYnCd = "02";
		
		if($("#stmNtcYnCd").is(":checked")==true)
		{
			stmNtcYnCd = "01";
		}
		if($("#stmCmtYnCd").is(":checked")==true)
		{
			stmCmtYnCd = "01";
		}
		if($("#stmPwYnCd").is(":checked")==true)
		{
			stmPwYnCd = "01";
		}
		if($("#stmTagYnCd").is(":checked")==true)
		{
			stmTagYnCd = "01";
		}
		if($("#stmFileYnCd").is(":checked")==true)
		{
			stmFileYnCd = "01";
		}

		var stmFileCnt = $("#stmFileCnt").val();
		var stmFileStrg = $("#stmFileStrg").val();
		
		
		if(stmTypeCd == "03" || stmTypeCd == "04"){
			stmFileYnCd = "01";
			if($("#stmFileYnCd").is(":checked")==false)
			{
				$("#stmFileYnCd").attr("checked", true);
				$("#stmFileOption").removeClass("kt-hide");
				$.osl.alert($.osl.lang("stm2101.formCheck.fileOptionMessage"));
				return false;
			}
		}
		
		
		if(stmFileYnCd == "01"){
			
			if(stmFileCnt <= 0)
			{
				
				
				stmFileCnt = 1;
				$("#stmFileCnt").val(1);
				$.osl.alert($.osl.lang("stm2101.formCheck.fileCntMessage"));
				return false;
			}
			else if(stmFileCnt > 10)
			{
				
				$("#stmFileCnt").val(10);
				$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxCntMessage"), {type:'error'});
				return false;
			}
			
			
			var defaultStrg = 0;
			
			if(stmFileStrg <= 0)
			{
				
				
				if(stmTypeCd == "02")
				{
					defaultStrg = 4096;
				}
				
				else if(stmTypeCd == "04")
				{
					defaultStrg = 2048;
				}
				
				else
				{
					defaultStrg = 500;
				}
				$("#stmFileStrg").val(defaultStrg);
				$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgMessage"));
				return false;
			}
			
			else
			{
				
				
				
				if(stmTypeCd == '02')
				{
					defaultStrg = 4096;
					if(stmFileStrg > defaultStrg)
					{
						$("#stmFileStrg").val(defaultStrg);
						stmFileStrg = defaultStrg;
						$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgOutMessage", "4GB"));
						return false;
					}
				}
				
				else if(stmTypeCd == '04')
				{
					defaultStrg = 2048;
					if(stmFileStrg > defaultStrg)
					{
						$("#stmFileStrg").val(defaultStrg);
						stmFileStrg = defaultStrg;
						$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgOutMessage", "2GB"));
						return false;
					}
				}
				
				else
				{
					defaultStrg = 500;
					if(stmFileStrg > defaultStrg)
					{
						$("#stmFileStrg").val(defaultStrg);
						stmFileStrg = defaultStrg;
						$.osl.alert($.osl.lang("stm2101.formCheck.fileMaxStrgOutMessage", "500MB"));
						return false;
					}
				}
			}
		}
		else
		{
			$("#stmFileCnt").val(0);
			$("#stmFileStrg").val(0);
			stmFileCnt = 0;
			stmFileStrg = 0;
		}

		$.osl.confirm($.osl.lang("stm2101.update"),{"html" : true},function(result){
			if(result.value){
				
				var data = {
						"menuId" : menuId ,
						"stmTypeCd" : stmTypeCd ,
						"stmAdmList" : stmAdmList ,
						"stmWtList" : stmWtList ,
						"stmDsTypeCd" : stmDsTypeCd ,
						"stmNtcYnCd" : stmNtcYnCd ,
						"stmCmtYnCd" : stmCmtYnCd ,
						"stmPwYnCd" : stmPwYnCd ,
						"stmTagYnCd" : stmTagYnCd ,
						"stmFileCnt" : stmFileCnt ,
						"stmFileStrg" : stmFileStrg * (1024*1024),
					};

				var ajaxObj = new $.osl.ajaxRequestAction(
						{"url":"<c:url value='/stm/stm2000/stm2100/updateStm2100BadTypeAjax.do'/>"}
						, data);
				
		  		
				ajaxObj.setFnSuccess(function(data){
					if(data.errorYn == "Y"){
						$.osl.alert(data.message,{type: 'error'});
						
						$.osl.layerPopupClose();
					}else{
						$.osl.toastr(data.message,{type: 'success'});
						
						$.osl.layerPopupClose();
						
						
		   				$("button[data-datatable-id=stm2100StmTable][data-datatable-action=select]").click();
					}
				});
				
				
				ajaxObj.send();
			};
		});
	};
	
	return {
        
        init: function() {
        	documentSetting();
        },
    };
}();

$.osl.ready(function(){
	 OSLStm2101Popup.init();
});

 </script>
