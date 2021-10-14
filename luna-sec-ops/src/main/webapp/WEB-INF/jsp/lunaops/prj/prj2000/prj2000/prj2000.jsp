<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
		<div class="kt-portlet__head-toolbar">
			<div class="kt-portlet__head-wrapper">
				
			</div>
		</div>
	</div>
	<div class="kt-portlet__body">
	
		
		<div class="kt-portlet kt-portlet--mobile" id="prj2000PrjAuthInfo">
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<div class="osl-font-lg kt-font-boldest kt-font-brand kt-margin-l-0 kt-margin-r-10 kt-margin-t-10 kt-margin-b-10" id="authGrp-content__title">
						<i class="fa fa-user kt-margin-r-5"></i>권한 그룹
					</div>
					
					<div class="osl-collapsed__content" id="authGrp-content__authList" style="display:none;">
						<ul class="nav nav-pills kt-margin-l-0 kt-margin-r-10 kt-margin-t-10 kt-margin-b-10" role="tablist">
		                </ul>
					</div>
					
				</div>
				<div class="kt-portlet__head-toolbar">
					
					<div class="kt-portlet__head-wrapper kt-margin-r-10" id="authGrp-table-btn">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj2000AuthTable" data-datatable-action="select" title="권한그룹 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
							<i class="fa fa-list"></i><span>조회</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj2000AuthTable" data-datatable-action="insert" title="권한그룹 추가" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
							<i class="fa fa-plus"></i><span>추가</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj2000AuthTable" data-datatable-action="update" title="권한그룹 수정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="update" tabindex="3">
							<i class="fa fa-edit"></i><span>수정</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj2000AuthTable" data-datatable-action="delete" title="권한그룹 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="4">
							<i class="fa fa-trash-alt"></i><span>삭제</span>
						</button>
					</div>
					
					
					
					<div class="kt-portlet__head-group">
						<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md on" id="authFoldingBtn"><i class="fa fa-chevron-down"></i></a>
					</div>
					
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="osl-datatable-search" data-datatable-id="prj2000AuthTable"></div>
					</div>
				</div>
				<div class="kt_datatable" id="prj2000AuthTable"></div>
			</div>
		</div>
		
		
		
		<div class="kt-portlet kt-portlet--mobile">
			
			<div class="kt-portlet__head kt-portlet__head--lg">
				<div class="kt-portlet__head-label">
					<div class="osl-font-lg kt-font-boldest kt-font-brand kt-margin-l-0 kt-margin-r-10 kt-margin-t-10 kt-margin-b-10">
						<i class="fa fa-stream kt-margin-r-10"></i><span id="authGrpNameTitle"></span> 시스템 메뉴 권한
					</div>
				</div>
				<div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-wrapper kt-margin-r-5">
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" title="메뉴 권한 저장" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" tabindex="5" data-auth-button="update" id="authGrp-menu-save">
							<i class="fa fa-plus"></i><span>저장</span>
						</button>
					</div>
				</div>
			</div>
			
			<div class="kt-portlet__body">
				
				<div class="table-responsive">
					<form id="frPrj2000MenuAuth" name="frPrj2000MenuAuth">
						<input type="hidden" id="prjId" name="prjId" >
						<input type="hidden" id="authGrpId" name="authGrpId" >
						<input type="hidden" id="slectedMainMenuId" name="slectedMainMenuId" > 
						<input type="hidden" id="mainMenuId" name="mainMenuId" >
						
						<table class="table table-bordered kt-align-center">
							<thead>
								<tr>
									<th class="osl-min-width--6rem font-weight-bold">대 메뉴명</th>
									<th class="osl-min-width--11rem font-weight-bold">중 메뉴명 > 소 메뉴명</th>
									<th>메인</th>
									<th class="osl-min-width--5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-accessYn">
											<input type="checkbox" title="전체 체크" name="accessYn" id="menuAuthAll-accessYn"/>
											<span></span>
										</label>
										<span>접근</span>
									</th>
									<th class="osl-min-width--5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-selectYn">
											<input type="checkbox" title="전체 체크" name="selectYn" id="menuAuthAll-selectYn"/>
											<span></span>
										</label>
										<span>조회</span>
									</th>
									<th class="osl-min-width--5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-regYn">
											<input type="checkbox" title="전체 체크" name="regYn" id="menuAuthAll-regYn"/>
											<span></span>
										</label>
										<span>등록</span>
									</th>
									<th class="osl-min-width--5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-modifyYn">
											<input type="checkbox" title="전체 체크" name="modifyYn" id="menuAuthAll-modifyYn"/>
											<span></span>
										</label>
										<span>수정</span>
									</th>
									<th class="osl-min-width--5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-delYn">
											<input type="checkbox" title="전체 체크" name="delYn" id="menuAuthAll-delYn"/>
											<span></span>
										</label>
										<span>삭제</span>
									</th>
									<th class="osl-min-width--5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-excelYn">
											<input type="checkbox" title="전체 체크" name="excelYn" id="menuAuthAll-excelYn"/>
											<span></span>
										</label>
										<span>엑셀</span>
									</th>
									<th class="osl-min-width-5rem font-weight-bold">
										<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0" for="menuAuthAll-printYn">
											<input type="checkbox" title="전체 체크" name="printYn" id="menuAuthAll-printYn"/>
											<span></span>
										</label>
										<span>출력</span>
									</th>
									<th>전체 체크</th>
								</tr>
							</thead>
							
							<tbody id="menuAuth-list">
							</tbody>
							
						</table>
						
					</form>
				</div>
				
			</div>
		</div>
		
		
	</div>
</div>

<script>
"use strict";
var OSLPrj2000 = function () {

	
	var documentSetting = function () {
		
		
		new KTPortlet('prj2000PrjAuthInfo', $.osl.lang("portlet"));
		
		
		$.osl.datatable.setting("prj2000AuthTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj2000/prj2000/selectPrj2000PrjAuthGrpPageList.do"
					}
				},
				pageSize: 5, 
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [5, 10, 20, 30, 50, 100] 
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 30, sortable: false},
				{field: 'authGrpNm', title: '권한그룹 명', textAlign: 'left', width: 200, autoHide: false, search: true},
				{field: 'ord', title: '우선순위', textAlign: 'center', width: 100,
					template: function (row) {return !$.osl.isNull(row.ord) ? row.ord.toString() : "0"; }
				},
				{field: 'usrTypNm', title: '사용자 유형', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00004", searchField:"usrTyp", sortField: "usrTyp"},
				{field: 'acceptUseNm', title: '접수권한 유무', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "CMM00001", searchField:"acceptUseCd", sortField: "acceptUseCd"},
				{field: 'useNm', title: '사용 유무', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "CMM00001", searchField:"useCd", sortField: "useCd"},
				{field: 'assignCnt', title: '배정 사용자 수', textAlign: 'center', width: 120,
					template: function (row) {return !$.osl.isNull(row.assignCnt) ? row.assignCnt.toString() : "0";}
				},
				{field: 'authGrpDesc', title: '비고', textAlign: 'left', width: 480, search: true}
			],
			actionBtn:{
				"click": true,
				"dblClick": true
			},
			actionTooltip:{
				"update": "권한 그룹 수정",
				"delete": "권한 그룹 삭제",
				"click": "시스템 메뉴 권한 조회",
				"dblClick": "권한 그룹 상세보기"
			},
			actionFn:{
				"insert":function(datatableId){
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalTitle: "신규 권한 그룹 등록",
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/prj/prj2000/prj2000/selectPrj2001View.do',data,options);
				},
				"update":function(rowData){
					var data = {
							type:"update",
							paramAuthGrpId: rowData.authGrpId,
							paramPrjId: rowData.prjId,
						};
					var options = {
							idKey: rowData.authGrpId,
							modalTitle: "권한 그룹 수정",
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/prj/prj2000/prj2000/selectPrj2001View.do',data,options);
				},
				"delete":function(rowDataList){
					
					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/prj/prj2000/prj2000/deletePrj2000AuthGrpInfoAjax.do'/>"}
								,{deleteDataList: JSON.stringify(rowDataList)});
					
					ajaxObj.setFnSuccess(function(data){
				    	
						
						if(data.errorYn == "Y"){
							$.osl.alert(data.message, {type:"error"});
						}else{
							$.osl.toastr(data.message);
							
							$.osl.datatable.list["prj2000AuthTable"].targetDt.reload();
							
							
							authListSetting();
						}
					});
					
					
					ajaxObj.send();
				},
				"click":function(rowData){
					
					var foldingAuthGrpTarget = $("#authGrp-content__authList").children('ul');
					
					
					foldingAuthGrpTarget.find("a").removeClass("active");
					
					foldingAuthGrpTarget.find(".nav-item[data-authGrp-id='"+rowData.authGrpId+"'] a").addClass("active");
					
					
					selAuthGrpMenuListSetting(rowData.prjId, rowData.authGrpId, rowData.authGrpNm);
				},
				"dblClick":function(rowData){
					
					
					var data = {
							paramPrjId: rowData.prjId,
							paramAuthGrpId: rowData.authGrpId,
						};
					var options = {
							idKey: "detail_"+rowData.authGrpId,
							modalTitle: "권한 그룹 상세보기",
							closeConfirm: false
						};
					
					$.osl.layerPopupOpen('/prj/prj2000/prj2000/selectPrj2002View.do',data,options);
				}
			}
		});
		
		
		authListSetting();
		
		
		$("#authFoldingBtn").click(function(){
			$(this).toggleClass("on");
			
			if($(this).hasClass("on")){
				$("#authGrp-content__title").show(); 	
				$("#authGrp-content__authList").hide(); 
				$("#authGrp-table-btn").show(); 		
			}else{
				$("#authGrp-content__title").hide();
				$("#authGrp-content__authList").show();
				$("#authGrp-table-btn").hide();
			}
		});
		
		
		
		$("input[type='checkbox']").click(function() {
			var allChkId = $(this).attr("id");
			
			if(allChkId.indexOf("menuAuthAll") > -1){
				if ($(this).is(':checked')) {
					
					var allName = $(this).attr("name");
					$("input[name$=" + allName + "]").prop("checked", true);
					$("input[name$=" + allName + "]").val("Y");
					$("input[name^=status]").val("U");
				} else {
					
					var allName = $(this).attr("name");
					$("input[name$=" + allName + "]").prop("checked", false);
					$("input[name$=" + allName + "]").val("N");
					$("input[name^=status]").val("U");
					
					
					if(allName == "accessYn"){
						$('input[id^=rd]:checked').prop("checked",false);
					}
				}
				
				
				$("[id^=menuAuthAll-]").val("");
			}
		});
		
		
		$("#authGrp-menu-save").click(function(){
			$.osl.confirm("시스템 메뉴 권한을 저장하시겠습니까?",null,function(result) {
		        if (result.value) {
					saveAuthGrpMenuAuthList();
		        }
		    });
			
		});
		
	};
	
	
	var authListSetting = function() {
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj2000/prj2000/selectPrj2000PrjAuthGrpList.do'/>", "async": false});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				var target = $("#authGrp-content__authList").children('ul');
				
				target.html("");
				
				var activeAuthInfo = {};
				
				
				$.each(data.prjAuthGrpList, function(idx, map){
					
					var activeStr = "";
					
					if(idx == 0){
						activeStr = "active";
						activeAuthInfo = map;
					}
					
					target.append(
							'<li class="nav-item kt-margin-5" onclick="OSLPrj2000.selectAuthMenuList(\''+map.prjId+'\', \''+map.authGrpId+'\', \''+$.osl.escapeHtml(map.authGrpNm)+'\' )" data-prj-id="'+map.prjId+'" data-authGrp-id="'+map.authGrpId+'" >'
								+'<a href="#" class="btn btn-default btn-sm btn-elevate btn-elevate-air '+ activeStr +'" data-toggle="tab" role="tab" aria-selected="true">'
									+'<span class="nav-link-title"><i class="kt-menu__link-icon fa fa-user-tie"></i>'+ $.osl.escapeHtml(map.authGrpNm) +'</span>' 
								+'</a>'
							+'</li> '		
					);
				});
				
				
				if(!$.isEmptyObject(activeAuthInfo)){
					
					selAuthGrpMenuListSetting(activeAuthInfo.prjId, activeAuthInfo.authGrpId, $.osl.escapeHtml(activeAuthInfo.authGrpNm));
				}
			}	
		}); 
		
		
		ajaxObj.send();
	};
	
	
	var selAuthGrpMenuListSetting = function(prjId, authGrpId, authGrpNm){
		
		if(!$.osl.isNull(authGrpNm)){
			
			$("#authGrpNameTitle").text("["+authGrpNm+"]");
		}
		
		$("#prjId").val(prjId);
		$("#authGrpId").val(authGrpId);
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj2000/prj2000/selectPrj2000AuthGrpMenuListAjax.do'/>"},
				{"prjId":prjId, "authGrpId":authGrpId});
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				$.osl.toastr(data.message);
				
				
				var target = $("#menuAuth-list");
				
				target.html("");
				
				
		    	var prevUpupMenuId = '';
		    	
		    	var largeMenuRowSpan = {};

		    	
		    	$.each(data.menuAuthList,function(idx, data){
		    	
		    		var status = data.status; 
		    		var mainYn = data.mainYn; 
		    		var menuTypeCd = data.menuTypeCd; 
		    		
		    		
		    		var menuId = $.osl.escapeHtml(data.menuId);
		    		var menuNm = $.osl.escapeHtml(data.menuNm);
		    		var upperMenuId = $.osl.escapeHtml(data.upperMenuId);
		    		var upMenuNm = $.osl.escapeHtml(data.upMenuNm);
		    		var upupMenuId = $.osl.escapeHtml(data.upupMenuId);
		    		var upupMenuNm = $.osl.escapeHtml(data.upupMenuNm);
		    		
		    		
		    		var strArrYn = ["accessYn", "selectYn", "regYn", "modifyYn", "delYn", "excelYn", "printYn"];
		    		
		    		
		    		target.append("<tr id='tr" + menuId + "'>");
					
		    		
		    		var trObj = $("#tr" + menuId);
		    		
		    		
		    		if($.osl.isNull(prevUpupMenuId) || prevUpupMenuId != upupMenuId){
		    				trObj.append("<td class='osl-valign-middle--imp osl-align-center--imp' id='largeMenuRow_"+upupMenuId+"' rowspan='1'>" + upupMenuNm + "</td>");	
		    		}else{
		    			
		    			if($.osl.isNull(largeMenuRowSpan[upupMenuId])){
		    				largeMenuRowSpan[upupMenuId] = 1;
		    			}
		    			
		    			
		   				try{
		   					
		    				var upUpObjRowspan = parseInt(largeMenuRowSpan[upupMenuId]);
		    				largeMenuRowSpan[upupMenuId] = (upUpObjRowspan+1);
		   				}catch(err){
		   					console.log(err);
		   				}
		    		}
		    		prevUpupMenuId = upupMenuId;
		    		
	   				
		    		trObj.append("<td class='osl-align-left--imp'>" + upMenuNm + " &#62; " + menuNm + "</td>");
					
					trObj.append("<input type='hidden' name='" + "status" + menuId + "' id='" + "status" + menuId + "' value='" + status + "' />");
					
					
					if(menuTypeCd == '02'){
						
						if(mainYn=='Y'){
							
							$("#slectedMainMenuId").val(menuId); 
							$("#mainMenuId").val(menuId); 
							
							trObj.append(
								"<td>"
									+"<label class='kt-radio kt-radio--tick kt-radio--brand'>"
										+"<input id='rd_"+menuId+ "' type='radio' name='rdMainMenu' value='"+menuId+"' checked='checked' onclick='OSLPrj2000.mainMenuRadioCheck(this,\""+menuId+"\");'  >"
										+"<span></span>"
									+"</label>"
								+"</td>"
							);
						}else{
							trObj.append(
								"<td>"
									+"<label class='kt-radio kt-radio--tick kt-radio--brand' for='rd_"+menuId+ "'>"
										+"<input id='rd_"+data.menuId+ "' type='radio' name='rdMainMenu' value='"+menuId+"' onclick='OSLPrj2000.mainMenuRadioCheck(this,\""+menuId+"\");' >"
										+"<span></span>"
									+"</label>"
								+"</td>"
							);
						}
					
					}else{
						trObj.append("<td></td>");
					}
					
								
		    		
		    		$.each(strArrYn, function(idx, val){
		    			
		    			var strMenuId = menuId + val; 
		    			var hidMenuId = "hidden" + menuId + val ;
		    			var hidStatus = "status" + menuId;	
		    			 
		    			trObj.append(
		    				"<td>"
		    					+"<label class='kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0' for='" + strMenuId + "'>"
		    						+"<input type='hidden' name='" + hidMenuId + "' id='" + hidMenuId + "' value='" + eval("data." + val) + "' />"
		    						+"<input type='checkbox' title='체크박스' onclick='OSLPrj2000.changeChkValue(this,"+idx+");' data-action='"+ val +"' name='" + strMenuId + "' id='" + strMenuId + "' value='" + eval("data." + val) + "' />"
		    						+"<span></span>"
		    					+"</label>"
		    				+"</td>"
		    			);
		    			
		    		});
		    		
		    		
		    		trObj.append(
	    				"<td>"
	    					+"<label class='kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0' for='"+menuId+"_authHorizon'>"
	    						+"<input type='checkbox' title='체크박스' name='"+menuId+"_authHorizon' id='"+menuId+"_authHorizon' onclick='OSLPrj2000.authHorizonCheck(this);' value />"
	    						+"<span></span>"
	    					+"</label>"
	    				+"</td>"
		    		);
		    		
		    		
		    		
		    		$.each(strArrYn, function(idx, val){
		    			var authCheckBox = $("#" + menuId + val);
		        		if($(authCheckBox).val() == 'Y'){
		        			$(authCheckBox).prop("checked", true);
		        		}else{
		        			$(authCheckBox).prop("checked", false);
		        		}	
		    		});

		    		
		    		
		    		$("input[id^=menuAuthAll-]").prop("checked",false); 
		    		
		    	});
		    	
		    	
		    	$.each(largeMenuRowSpan, function(idx, map){
		    		$("#largeMenuRow_"+idx).attr("rowspan",map);
		    	});
				
			}	
		});
		
		
		ajaxObj.send();
	};


	
	var mainRadioCheck = function(obj, menuId){
		
		
		var slectedMainMenuId = $("#mainMenuId").val();
		var mainMenuTarget = $("#rd_"+slectedMainMenuId);
		
		if( $(obj).prop("checked")){
			
			
			if(! $('#'+menuId+'accessYn').prop("checked") ){
				$.osl.confirm("접근 권한이 없는 화면은 메인화면으로 지정할수 없습니다. 계속 진행하시겠습니까?",null,function(result) {
	    	        if (result.value) {
	    	        	
	    	        	$('#'+menuId+'accessYn').prop("checked",true);
						$('#'+menuId+'accessYn').val("Y");
						$("#hidden" + menuId+'accessYn').val("Y");
						$("#status" + menuId).val("U");

						
						$("#mainMenuId").val(menuId);
	    	        }else{
	    	        	
	    	        	$(obj).prop("checked",false);
	    	        	mainMenuTarget.prop("checked",true);
	    	        }
	    		});
			}else{
				
				$("#mainMenuId").val(menuId);
			}
		}
	}

	
	var changeValueToCheck = function(chkObj, index){
		 
		
		var strMenuId = $(chkObj).attr("id").substring(0,12);
		
		
		if(	$(chkObj).prop('checked')){
			$(chkObj).val("Y");
			$("#hidden" + $(chkObj).attr("id")).val("Y");
			$("#status" + strMenuId).val("U");
		}
		
		else{
			
			
			var action = $(chkObj).data("action"); 
			if($("#menuAuthAll-"+action).is(":checked")){
				$("#menuAuthAll-"+action).prop('checked',false);
			}
			
			
			var horizonChkbox = $("#"+strMenuId+"_authHorizon");
			if(horizonChkbox.is(":checked")){
				horizonChkbox.prop('checked',false);
			}
			
			
			if($('#rd_'+strMenuId).prop("checked") && index== 0 ){
				
				$.osl.confirm("메인화면으로 지정되있는 화면의 접근권한을 해제시 메인화면으로 지정상태가 해제됩니다. 계속 진행하시겠습니까?",null,function(result) {
	    	        if(result.value) {
	    	        	
	    	        	$('#rd_'+strMenuId).prop("checked",false);
						
	    	        	$(chkObj).val("N");
						$("#hidden" + $(chkObj).attr("id")).val("N");
						$("#status" + strMenuId).val("U");
	    	        }else{
						$(chkObj).prop('checked',true);
	    	        }
	    		});
				
			
			}else{
				$(chkObj).val("N");
				$("#hidden" + $(chkObj).attr("id")).val("N");
				$("#status" + strMenuId).val("U");	
			}
		}
	}


	 
	var menuAuthHorizonCheck = function(chkObj){
		 
		
		var horizonChkId = $(chkObj).attr("id"); 
		
		var horizonMenuId = horizonChkId.split("_")[0];
		
		
		if($(chkObj).is(':checked')){
			$("input[name^=" + horizonMenuId + "]").prop("checked", true);
			$("input[name^=" + horizonMenuId + "]").val("Y");
			$("input[name^=hidden" + horizonMenuId + "]").val("Y");
			$("input[name^=status" + horizonMenuId + "]").val("U");
		
		}else{
			$("input[name^=" + horizonMenuId + "]").prop("checked", false);
			$("input[name^=" + horizonMenuId + "]").val("N");
			$("input[name^=hidden" + horizonMenuId + "]").val("N");
			$("input[name^=status" + horizonMenuId + "]").val("U");
			
			
			var accessChkId = $("input[name^=" + horizonMenuId + "]").attr("id");
			
			
			if(accessChkId.indexOf("accessYn") != -1){
				$('input[id^=rd_'+horizonMenuId+']:checked').prop("checked",false);
			}
		}
	}


	
	var saveAuthGrpMenuAuthList = function(){ 
		  
		
		var slectedMainMenuId = $("#slectedMainMenuId").val();
		
		var rdList = $('[name="rdMainMenu"]');
		
		
		for(var i = 0 ; i < rdList.length; i++ ){
			
			if($(rdList[i]).prop("checked")){
				
				var checkedMainMenuId = $(rdList[i]).val();
				$("#mainMenuId").val(checkedMainMenuId);
				
				
				if(slectedMainMenuId != checkedMainMenuId){
					
					$("#status"+checkedMainMenuId).val("U");
					$("#status"+slectedMainMenuId).val("U");
				}
			}
		}
		
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj2000/prj2000/savePrj2000AuthGrpMenuAuthListAjax.do'/>","loadingShow":true}
				,$("#frPrj2000MenuAuth").serialize());
		
		
		ajaxObj.setFnSuccess(function(data){
			
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
			}else{
				
				$.osl.toastr(data.message);
			}
			
		});

		
		ajaxObj.send();
	}

	return {
		  
		  init: function() {
		  	documentSetting();
		  },
		  
		  selectFoldingAuthList:function(){
			  authListSetting();
		  },
		  
		  selectAuthMenuList: function(prjId, authGrpId, authGrpNm){
			  selAuthGrpMenuListSetting(prjId, authGrpId, authGrpNm);  
		  },
		  
		  mainMenuRadioCheck : function(radioObj, menuId){
			  mainRadioCheck(radioObj ,menuId);
		  },
		  
		  changeChkValue : function(checkBoxObj, index){
			  changeValueToCheck(checkBoxObj, index);
		  },
		  
		  authHorizonCheck : function(checkBoxObj){
			  menuAuthHorizonCheck(checkBoxObj);
		  }
	};
}();


$.osl.ready(function(){
	OSLPrj2000.init();
});

</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
