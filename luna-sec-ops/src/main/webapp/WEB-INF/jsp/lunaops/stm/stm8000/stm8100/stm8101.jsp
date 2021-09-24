<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http:
<form class="kt-form" id="stm8110Info" autocomplete="off" >
	<input type="hidden" name="prjGrpId" id="prjGrpId" value="<c:out value='${param.prjGrpId}'/>">
	<input type="hidden" name="prjId" id="prjId" value="<c:out value='${param.prjId}'/>">
	<input type="hidden" name="prjNm" id="prjNm" value="<c:out value='${param.prjNm}'/>">
	<input type="hidden" name="strgRepId" id="strgRepId" value="<c:out value='${param.strgRepId}'/>">
	<div class="kt-portlet kt-portlet--mobile osl-stm__portlet kt-margin-b-0">
		<div class="kt-portlet__body">
			<div class="row">
				
				<div class="col-lg-6 col-md-6 col-sm-12 col-12">
					<div class="form-group kt-margin-b-10">
						<div class="kt-margin-b-10">
							<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm8101.label.revision">리비전 열람 권한</span></label>
							<span class="float-right">
								<button type="button" class="btn btn-outline-success btn-sm" id="reset_revision" name="reset_revision"><span data-lang-cd="stm8101.button.resetBtn">초기화</span></button>
							</span>
						</div>
						<div class="form-group kt-margin-b-10">
							<div class="kt-list ps--active-y form-control kt-padding-10 overflow-auto osl-height--240" id="strgRevisionAuth" name="strgRevisionAuth">
							</div>
						</div>
					</div>
					<div class="form-group kt-margin-b-0">
						<div class="kt-margin-b-10">
							<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="stm8101.label.fileCode">소스 열람 권한</span></label>
							<span class="float-right">
								
								<button type="button" class="btn btn-outline-success btn-sm" id="reset_file" name="reset_file"><span data-lang-cd="stm8101.button.resetBtn">초기화</span></button>
							</span>
						</div>
						<div class="form-group kt-margin-b-10">
							<div class="kt-list ps--active-y form-control kt-padding-10 osl-height--240 overflow-auto" id="strgFileCodeAuth" name="strgFileCodeAuth">
							</div>
						</div>
						<span class="kt-margin-t-5 float-right kt-align-right font-italic kt-font-inverse-metal osl-font-xs" data-lang-cd="stm8101.label.message">소스 열람 권한은 리비전 열람 권한이 있어야 합니다.</span>
					</div>
				</div>
				
				
				<div class="col-lg-6 col-md-6 col-sm-12 col-12">
					
					<div class="row kt-margin-0">
						<label><i class="fas fa-user-alt kt-margin-r-5"></i><span data-lang-cd="stm8101.label.nonAssList">미배정 권한 그룹 및사용자</span></label>
						<input type="hidden" id="typeString" name="typeString" value="${param.typeString }"/>
						<input type="hidden" id="dataList" name="dataList" value='${param.dataList}'/>
					</div>
					<div class="row kt-margin-0 kt-margin-t-10">
						<div class="input-group">
							<div class="input-group-prepend">
								<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0" name="selectSearchBtn" id="selectSearchBtn"><span data-lang-cd="common.name.all">전체</span></button>
								<div class="dropdown-menu">
									<a class="selectSearchItem dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all"><span data-lang-cd="common.name.all">전체</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchAuthGrpNm" data-opt-type="select"><span data-lang-cd="stm8101.select.authGrpNm">권한그룹 명</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrId" data-opt-type="text"><span data-lang-cd="stm8101.select.usrId">사용자 ID</span></a>
									<a class="selectSearchItem dropdown-item" href="javascript:void(0);" data-field-id="searchUsrNm" data-opt-type="text"><span data-lang-cd="stm8101.select.usrNm">사용자 명</span></a>
								</div>
							</div>
							<select class="kt-select2 form-control kt-hide" id="searchSelect" name="searchSelect" aria-hidden="true">
							</select>
							<input type="text" class="form-control" disabled="disabled" name="subSearchData" id="subSearchData">
							<div class="input-group-prepend">
								<button type="button" class="btn btn-brand" name="searchBtn" id="searchBtn">
									<span data-lang-cd="stm8101.button.searchBtn">검색</span>
								</button>
							</div>
						</div>
					</div>
					<div class="kt-list ps--active-y form-control kt-margin-t-10 kt-padding-10 overflow-auto osl-height--480" id="strgNonAssList" name="strgNonAssList">
					</div>
				</div>
				
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="stm8110SaveSubmit"><i class="fa fa-check-square"></i><span data-lang-cd="stm8101.complete">저장</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>

<script>
"use strict";
var OSLStm8100 = function () {
	var formId="stm8110Info";
	
	var formValidate = $.osl.validate(formId);
	
	
	$("#stm8110SaveSubmit > span").text($.osl.lang("stm8101.complete"));
	$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
	
	var oriRevision;
	var oriFileCode;
	
	
	var resultRevision=[];
	var resultFileCode=[];
	var resultAllList=[];
	
	
	var selPrjGrpId = $("#prjGrpId").val();
	var selPrjId = $("#prjId").val();
	var selPrjNm = $("#prjNm").val();
	var selStrgRepId = $("#strgRepId").val();
	
	
	var documentSetting = function(){

		
		selectAssRevisionAuth();
		
		selectAssFileCodeAuth();
		
		settingAuthList();
		
		drawAfterFtSetting();
		
		showHideBtn("strgRevisionAuth", "right", 'left');
		showHideBtn("strgFileCodeAuth", "right", 'left');
		showHideBtn("strgNonAssList", "left", 'right');
		
		
		$('#searchSelect').select2({
			ftScrollUse: false,
		});

		
		$("#searchSelect~span").addClass("osl-datatable-search--hide");
		
		
		$(".selectSearchItem").click(function(){
			$(".selectSearchItem").removeClass("active");
			$(this).addClass("active");
			$("#selectSearchBtn").text($(this).text());
			
			
			
			$.each($("#strgNonAssList").children(), function(idx, value){
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
				
				$.each($("#strgNonAssList").children(), function(idx, value){
					
					
					
					if($(this).data("authTypeCd")=='01'){
						$(this).addClass("kt-hide");
					}else{ 
						$(this).removeClass("kt-hide");
					}
				});
			 }
		});
		
		
		$("#searchSelect").change(function(){
			if("all" == $("#searchSelect").val()){
				$.each($("#strgNonAssList").children(), function(idx, value){
					$(this).removeClass("kt-hide");
				});
			}else{
				$.each($("#strgNonAssList").children(), function(idx, value){
					if($("#searchSelect").val() != $(this).data("optIndex")){
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
				
				$.each($("#strgNonAssList").children(), function(idx, value){
					$(this).removeClass("kt-hide");
				});
			}else if(space == "searchAuthGrpNm"){
				
				$.each($("#strgNonAssList").children(), function(idx, value){
					
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
			}else if(space === "searchUsrId"){ 
				
				var txt = $("#subSearchData").val();
				$.each($("#strgNonAssList").children(), function(idx, value){
					if($(this).data("authTypeCd")=="02" && $(this).data("authTargetId").indexOf(txt) > -1){
						$(this).removeClass("kt-hide");
					}else{
						$(this).addClass("kt-hide");
					}
				});
			}else{ 
				
				var txt = $("#subSearchData").val();
				$.each($("#strgNonAssList").children(), function(idx, value){
					if($(this).data("authTypeCd")=="02" &&  $(this).data("authTargetNm").indexOf(txt) > -1){
						$(this).removeClass("kt-hide");
					}else{
						$(this).addClass("kt-hide");
					}
				});
			}
		});
		
		
		new Sortable($('#strgRevisionAuth')[0], {
			group: {
				
				name: 'strgRevisionAuth',
	            
	            put:['strgNonAssList']
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
 				
 				var result = checkMove(moveDiv, resultRevision);
 				if(result == 1){
 					
 					evt.item.remove();
 				} 
 				
 				showHideBtn("strgRevisionAuth", "right", 'left');
 				
 				
 				var oriCard = $(evt.clone);
 				checkDoubleMove(oriCard);
 			} 
	    });
		
		new Sortable($('#strgFileCodeAuth')[0], {
			group: {
				
				name: 'strgFileCodeAuth',
	            
	            put:['strgNonAssList']
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
 				
 				var oriCard = $(evt.clone);
 				
 				var moveDiv = $(evt.item);
 				
 				var result = checkMove(moveDiv, resultFileCode);
 				if(result == 1){
 					
 					moveDiv.remove();
 				}else{
 					$("#strgFileCodeAuth").prepend(moveDiv);
 				}
 				
				var resultLink = checkLinkAuth(moveDiv.data("authTargetId"), resultRevision, resultFileCode, "add");
 				if(resultLink == 1){
 					
 					
 					var copyDiv = $(oriCard.clone(true));
 					$("#strgRevisionAuth").prepend(copyDiv);
	 				
	 				showHideBtn("strgRevisionAuth", "right", 'left');
 				}
 				showHideBtn("strgFileCodeAuth", "right", 'left');
 				
 				
 				checkDoubleMove(oriCard);
 			} 
	    });
		
		new Sortable($('#strgNonAssList')[0], {
			group: {
				
				name: 'strgNonAssList',
	            
	            put:['strgRevisionAuth', 'strgFileCodeAuth'],
	       		
	            pull: 'clone',
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
 				
 				
 				if($(evt.from).attr("id") == "strgRevisionAuth"){
 					var _authTargetId = moveDiv.data("authTargetId");
 	 	        	
 	 	        	var result = checkLinkAuth(_authTargetId, resultRevision, resultFileCode, "remove");
 	 	        	if(result == 1){
 	 	        		
 	 	        		
 	 	        		$.each($("#strgFileCodeAuth").children(), function(idx, value){
 	 	        			if($(value).data("authTargetId") == _authTargetId){
 	 	        				
 	 	        				$(value).remove();
 	 	        				
 	 	        				return false;
 	 	        			}
 	 	        		});
 	 	        	}else{
 	 	        		
 	 	        		
	 	 	        	checkMove(moveDiv, resultRevision, true);
 	 	        	}
 				}else{
 					checkMove(moveDiv, resultFileCode, true);
 				}
 				
 				checkDoubleMove(moveDiv);
 				
 				showHideBtn("strgNonAssList", "left", 'right');
 				
 				
				moveDiv.remove();
 				
 				checkDoubleMove(moveDiv, true);
 			} 
	    });
		
		
		$("#equalBtn").click(function(){
			$("#strgFileCodeAuth").empty();
 			
 			var keepList = addJsonList("strgRevisionAuth",true);
 			resultFileCode = resultRevision;
			drawAuthList(keepList, "strgFileCodeAuth");
			
			var oriCard = $("#strgNonAssList").children();
			
			$.each(oriCard, function(idx, value){
				checkDoubleMove($(value));
			});
			
			
			showHideBtn("strgFileCodeAuth", "right", 'left');
			
			showHideBtn("strgNonAssList", "left", 'right');
		});

		
		$("#reset_revision").click(function(){
			$("#strgRevisionAuth").empty();
			drawAuthList(oriRevision, "strgRevisionAuth");
			resultRevision = [];
			$.each(oriRevision, function(idx, value){
				resultRevision.push(value.authTargetId);
			});
			
			var oriCard = $("#strgNonAssList").children();
			
			$.each(oriCard, function(idx, value){
				checkDoubleMove($(value));
			});
			
			
			showHideBtn("strgRevisionAuth", "right", 'left');
			
			showHideBtn("strgNonAssList", "left", 'right');
		});
		
		
		$("#reset_file").click(function(){
			$("#strgFileCodeAuth").empty();
			drawAuthList(oriFileCode, "strgFileCodeAuth");
			resultFileCode = [];
			$.each(oriFileCode, function(idx, value){
				resultFileCode.push(value.authTargetId);
			});
			
			var oriCard = $("#strgNonAssList").children();
			
			$.each(oriCard, function(idx, value){
				checkDoubleMove($(value));
			});
			
			
			showHideBtn("strgFileCodeAuth", "right", 'left');
			
			showHideBtn("strgNonAssList", "left", 'right');
		});
		
		
		$("#stm8110SaveSubmit").click(function(){
			submitAuth();
		});
	};

	
	var selectAssRevisionAuth = function(){
		 var data = {
				prjGrpId : selPrjGrpId,
				prjId : selPrjId,
				strgRepId : selStrgRepId
		};
	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm8000/stm8100/selectStm8110AssStrgListAjax.do'/>", "async": false}
 				, data);
		
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var stm8110AssList = data.stm8110AssList;
				
				oriRevision = stm8110AssList;
				
				
				$.each(stm8110AssList, function(idx, value){
					resultRevision.push(value.authTargetId);
				});
				
				
				drawAuthList(stm8110AssList, "strgRevisionAuth");
			}
    	});
		
    	ajaxObj.send();
	};
	
	
	var selectAssFileCodeAuth = function(){
		 var data = {
					prjGrpId : selPrjGrpId,
					prjId : selPrjId,
					strgRepId : selStrgRepId
			};

		
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/stm/stm8000/stm8100/selectStm8120AssStrgListAjax.do'/>", "async": false}
				, data);
		
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var stm8120AssList = data.stm8120AssList;
				
				oriFileCode = stm8120AssList;
				
  				$.each(stm8120AssList, function(idx, value){
  					resultFileCode.push(value.authTargetId);
				});
				
				drawAuthList(stm8120AssList, "strgFileCodeAuth");
			}
    	});
		
    	ajaxObj.send();
	};
	
	
	var settingAuthList = function(){
		
		
		var allList = [];
		
		
		
    	var data = {
				prjGrpId : selPrjGrpId,
				prjId : selPrjId,
		};
		
		
  		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm8000/stm8100/selectStm8100PrjAllAuthAndUserList.do'/>", "async": false}
				, data);
		
  		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				var stm8100AllList = data.stm8100AllList;
				
				
				$("#searchSelect").html("");
				
				var innerHtml = "<option value='all'>"+$.osl.lang("common.name.all")+"</option>";
				$("#searchSelect").append(innerHtml);
				$.each(stm8100AllList, function(idx, val){
					if(val.authTypeCd == "01"){
						
						var innerHtml = "<option value='"+idx+"' data-auth-target-id='"+val.authTargetId+"'>"+$.osl.escapeHtml(val.authTargetNm)+"</option>";
						$("#searchSelect").append(innerHtml);

						
						resultAllList.push(val.authTargetId);
					}
				});
  		
				
				drawAuthList(stm8100AllList, "strgNonAssList");
				
				
				var oriCard = $("#strgNonAssList").children();
				$.each(oriCard, function(idx, value){
					checkDoubleMove($(value));
				});
			}
		});
		
    	ajaxObj.send();
	};

	
    var addJsonList = function(elemId){
		var targetId = '#' + elemId;
		var dataList = [];

		var divList = $(targetId).children();
		
		$.each(divList, function(index, value){
			var dataOne = {};
			 
			dataOne.prjGrpId = selPrjGrpId;
			dataOne.prjId = selPrjId;
			dataOne.prjNm = selPrjNm;
			dataOne.strgRepId = selStrgRepId;
			dataOne.authTargetId = $(value).data("authTargetId");
			dataOne.authTypeCd = $(value).data("authTypeCd");
			dataOne.authTargetNm = $(value).data("authTargetNm");
			dataOne.authTargetImgId = $(value).data("authTargetImgId");
			dataOne.authTargetEmail = $(value).data("authTargetEmail");
			dataOne.authTargetDeptId = $(value).data("authTargetDeptId");
			dataOne.authTargetDeptNm = $(value).data("authTargetDeptNm");
			
			dataList.push(dataOne);
		});
		
		return dataList;
    };
	
	
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
								+"<a class='dropdown-item stmRevisionListMoveBtn'>"+$.osl.lang("stm8101.draw.revisionBtn")+"</a>"
								+"<a class='dropdown-item stmFileCodeListMoveBtn'>"+$.osl.lang("stm8101.draw.fileCodeBtn")+"</a>"
							+"</div>"
						+"</div>"
						
						+"<div class='osl-content-group'>"
							
							+"<div class='card-title left-user-group kt-margin-b-0'>";
						
	 			
				if(value.authTypeCd=='01'){
					listHtml += "<span class='groupuser-icon'>"
										+"<i class='fas fa-user-tag'></i>"
									+"</span>"
									+$.osl.escapeHtml(value.authTargetNm)
									+"<span class='badge badge-success osl-margin-left--auto'>"+$.osl.lang("stm8101.draw.badge.authGrp")+"</span>"
								+"</div>" 
								
								+"<div class='osl-card__prjnm'>"
									+$.osl.escapeHtml(selPrjNm)
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
					listHtml += "<span class='' data-open-id='"+value.authTargetId+"'>"
										+ $.osl.user.usrImgSet(value.authTargetImgId, paramData )
									+"</span>"
									+"<span class='badge badge-primary osl-margin-left--auto'>"+$.osl.lang("stm8101.draw.badge.user")+"</span>"
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

			
			
			if(formId=="strgRevisionAuth"){
				var _authTargetId = moveCard.data("authTargetId");
				
				var result = checkLinkAuth(_authTargetId, resultRevision, resultFileCode, "remove");
 	        	if(result == 1){
 	        		
 	        		
 	        		$.each($("#strgFileCodeAuth").children(), function(idx, value){
 	        			if($(value).data("authTargetId") == _authTargetId){
 	        				
 	        				$(value).remove();
 	        				
 	        				return false;
 	        			}
 	        		});
 	        	}else{
 	        		
 	        		
	 	        	checkMove(moveCard, resultRevision, true);
 	        	}
			}else{
				
				
				checkMove(moveCard ,resultFileCode, true);
			}
			
			
			checkDoubleMove(moveCard, true);

			
			showHideBtn("strgNonAssList", 'left', "right");
			
			
			moveCard.remove();
 		}); 
 		
 		
 		$('.stmRevisionListMoveBtn').click(function(){
 			
			$(this).parent().removeClass("show");
			
			var oriCard = $(this).parents(".card");
			
			var moveCard = oriCard.clone(true);
			var result = checkMove(moveCard, resultRevision);
			
			if(result == 0){
				
				$("#strgRevisionAuth").prepend(moveCard);
			}

			
			checkDoubleMove(oriCard);
			
			showHideBtn("strgRevisionAuth", "right", 'left');
 		});

 		
 		$('.stmFileCodeListMoveBtn').click(function(){
 			
			$(this).parent().removeClass("show");
			
			var oriCard = $(this).parents(".card");
			
			var moveCard = oriCard.clone(true);
			
			var result = checkMove(moveCard, resultFileCode);
			if(result == 0){
 				
				$("#strgFileCodeAuth").prepend(moveCard);
				
				
				var resultLink = checkLinkAuth(moveCard.data("authTargetId"), resultRevision, resultFileCode, "add");
 				if(resultLink == 1){
 					
 					
					moveCard = oriCard.clone(true);
 					
 					$("#strgRevisionAuth").prepend(moveCard);
					
					showHideBtn("strgRevisionAuth", "right", 'left');
 				}
 				
			}

			
			checkDoubleMove(oriCard);
			
			showHideBtn("strgFileCodeAuth", "right", 'left');
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
			
			var otherItems = $("#strgNonAssList").children();
			$.each(otherItems, function(idx, value){
				if($(value).data("authTargetId")==_authTargetId){
					$(value).removeClass("kt-hide");
				}
			});
		}else{
			
			var revisionIdx = resultRevision.indexOf(_authTargetId);
			var fileCodeIdx = resultFileCode.indexOf(_authTargetId);
			
			
			if(revisionIdx>=0 && fileCodeIdx >=0){
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
	
	
	var checkLinkAuth = function(authTargetId, arrayUnderList, arrayTopList, action){
		
		var arrayUnderListIdx = arrayUnderList.indexOf(authTargetId);
		
		var arrayTopListIdx = arrayTopList.indexOf(authTargetId);
		
		if(action == "add"){
			
			
			if(arrayUnderListIdx==-1 && arrayTopListIdx >= 0){
				$.osl.alert($.osl.lang("stm8101.message.add"));
				
				arrayUnderList.push(authTargetId);
				return 1;
			}else{
				return 0;
			}
		}else{
			
			
			if(arrayUnderListIdx >= 0 && arrayTopListIdx >= 0){
				$.osl.alert($.osl.lang("stm8101.message.remove"));
				
				arrayUnderList.splice(arrayUnderListIdx, 1);
				arrayTopList.splice(arrayTopListIdx, 1);
				return 1;
			}else{
				return 0;
			}
		}
	}
	
	 
	var submitAuth = function(){
		
		var stmRevision = JSON.stringify(addJsonList("strgRevisionAuth", true));
		
		var stmFileCode = JSON.stringify(addJsonList("strgFileCodeAuth", false));

		var data = {
				prjId : selPrjId,
				strgRepId : selStrgRepId,
				stmRevision : stmRevision,
				stmFileCode : stmFileCode,
		};

		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/stm/stm8000/stm8100/insertStm8100AuthListAjax.do'/>", "async": false}
				, data);
		
  		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				$.osl.toastr(data.message,{type: 'success'});
				
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
	OSLStm8100.init();
});
</script>

