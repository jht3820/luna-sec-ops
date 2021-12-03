<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frPrj1001">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="paramPrjGrpId" id="paramPrjGrpId" value="${param.paramPrjGrpId}">
	<input type="hidden" name="paramPrjId" id="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" name="startDt" id="startDt">
	<input type="hidden" name="endDt" id="endDt">
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>프로젝트 그룹 정보
						</h5>
					</div>
				</div>
				<div class="kt-portlet__body kt-padding-15">
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="prjGrpNm"><i class="fa fa-edit kt-margin-r-5"></i><span>프로젝트 그룹명</span></label>
								<input type="text" class="form-control" placeholder="프로젝트 그룹명" name="prjGrpNm" id="prjGrpNm" opttype="-1" readonly="readonly" value='<c:out value="${param.prjGrpNm}"/>' >
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="prjGrpRange"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>프로젝트 그룹 기간</span></label>
								<input type="text" class="form-control" placeholder="프로젝트 그룹 기간" name="prjGrpRange" id="prjGrpRange" readonly="readonly" value='<c:out value="${param.prjGrpStartDt}"/> ~ <c:out value="${param.prjGrpEndDt}"/>'>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="prjNm" class="required"><i class="fa fa-edit kt-margin-r-5"></i><span>프로젝트 명</span></label>
								<input type="text" class="form-control" placeholder="프로젝트 명" name="prjNm" id="prjNm" opttype="-1" maxlength="100" required>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="prjRange" class="required"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>프로젝트 기간</span></label>
								<input type="text" class="form-control osl-input-readonly-none" placeholder="프로젝트 기간" name="prjRange" id="prjRange" readonly="readonly" required>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="prjTypeCd"><i class="fa fa-check-square kt-margin-r-5"></i>프로젝트 유형</label>
								<select class="form-control kt-select2" id="prjTypeCd" name="prjTypeCd" readonly="readonly" opttype="-1">
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="prjDevTypeCd"><i class="fa fa-check-square kt-margin-r-5"></i>프로젝트 개발 방법론</label>
								<select class="form-control kt-select2" id="prjDevTypeCd" name="prjDevTypeCd" readonly="readonly" opttype="-1">
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="prjRequestAcceptCd"><i class="fa fa-check-square kt-margin-r-5"></i>접수기능 사용 유무</label>
								<select class="form-control kt-select2" id="prjRequestAcceptCd" name="prjRequestAcceptCd" readonly="readonly" opttype="-1">
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="prjAcrm" class="required"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>프로젝트 약어</span></label>
								<input type="text" class="form-control" placeholder="프로젝트 약어" name="prjAcrm" id="prjAcrm" opttype="-1" maxlength="10" regexstr="^(?=.*?[A-Z])(?=.*?[0-9])|[A-Z]{3,10}$" regexerrorstr="영문 대문자 또는 영문 대문자, 숫자 조합으로 3~10자만 허용" required>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="prjBgColor"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>프로젝트 배경색</span></label>
								<input type="color" class="form-control" placeholder="프로젝트 배경색" name="prjBgColor" id="prjBgColor" opttype="-1" value="#eef1fd" readonly="readonly">
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="form-group">
								<label for="prjColor"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>프로젝트 글씨색</span></label>
								<input type="color" class="form-control" placeholder="프로젝트 글씨색" name="prjColor" id="prjColor" opttype="-1" value="#5578eb" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label><i class="fa fa-check-square kt-margin-r-5"></i>사용유무</label>
								<select class="form-control kt-select2" id="useCd" name="useCd" readonly="readonly" opttype="-1">
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12">
							<div class="form-group">
								<label for="ord"><i class="fa fa-project-diagram kt-margin-r-5"></i><span>정렬 순서</span></label>
								<input type="number" class="form-control" placeholder="정렬 순서" name="ord" id="ord" value="1" opttype="-1" min="0" max="999" maxlength="3" >
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="form-group">
								<label><i class="fa fa-edit kt-margin-r-5"></i><span>프로젝트 그룹 설명</span></label>
								<textarea class="form-control osl-min-h-px--130 osl-textarea__resize--none" name="prjDesc" id="prjDesc" maxlength="2000" opttype="-1" ></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>프로젝트 기본항목
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-group">
							<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" tabindex="1"><i class="fa fa-plus"></i></a>
							<div class="dropdown-menu dropdown-menu-right">
								<div class="dropdown-item" id="insertBasicItemBtn"><i class="fa fa-plus kt-font-brand"></i>신규 항목 추가</div>
								<c:if test="${param.type eq 'update' }">
									<div class="dropdown-item" id="selectBasicItemBtn"><i class="fa fa-list-alt kt-font-brand"></i>기본항목 불러오기</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body kt-padding-15">
					<div class="row" id="basicItemList">
					
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<div class="row">
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label">
						<h5 class="kt-font-boldest kt-font-brand">
							<i class="fa fa-th-large kt-margin-r-5"></i>프로젝트 담당 목록
						</h5>
					</div>
					<div class="kt-portlet__head-toolbar">
						<div class="kt-portlet__head-wrapper">
							<c:if test="${param.type != 'insert' }">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1001PrjAuthUsrTable" data-datatable-action="reset" title="담당자 배정 목록 초기화" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-list"></i><span>초기화</span>
								</button>
							</c:if>
							<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1001PrjAuthUsrTable" data-datatable-action="selInUsrDelete" title="선택 담당자 배정 제외" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1" id="prj1001PrjAuthUsrInsert">
								<span>배정 제외</span><i class="fa fa-arrow-alt-circle-right osl-padding-r0 osl-padding-l05"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="kt-portlet__body kt-padding-10 osl-min-h-px--400">
					<div class="osl-datatable-search" data-datatable-id="prj1001PrjAuthUsrTable"></div>
					<div class="kt_datatable" id="prj1001PrjAuthUsrTable"></div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12">
			<div class="kt-portlet">
					<div class="kt-portlet__head kt-portlet__head--lg">
						<div class="kt-portlet__head-label">
							<h5 class="kt-font-boldest kt-font-brand">
								<i class="fa fa-th-large kt-margin-r-5"></i>담당 대상 목록
							</h5>
						</div>
						<div class="kt-portlet__head-toolbar">
							<div class="kt-portlet__head-wrapper">
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1001PrjAuthNoneUsrTable" data-datatable-action="selAllUsrDelete" title="선택 담당자 배정 등록" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="1" id="prj1001AuthGrpNoneUsrInsert">
									<i class="fa fa-arrow-alt-circle-left"></i><span>배정 등록</span>
								</button>
								<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="prj1001PrjAuthNoneUsrTable" data-datatable-action="select" title="담당 대상 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
									<i class="fa fa-list"></i><span>조회</span>
								</button>
							</div>
						</div>
					</div>
					<div class="kt-portlet__body kt-padding-10">
						<div class="osl-datatable-search" data-datatable-id="prj1001PrjAuthNoneUsrTable"></div>
						<div class="kt_datatable" id="prj1001PrjAuthNoneUsrTable"></div>
					</div>
				</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="prj1001SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>
<script>
"use strict";
var OSLPrj1001Popup = function () {
	var formId = 'frPrj1001';
	
	
	var formValidate = $.osl.validate(formId);
	
	
	var type = $("#type").val();
	
	
	var prjAuthUsrIdList = [];
	
	
	var prjAuthOriginalData = [];

	
	var basicItemList = new Array();
	
	var basicItemInsertList = new Array();
	
	var basicItemDelList = new Array();
	
	
	var paramPrjGrpId = $("#paramPrjGrpId").val();
	var paramPrjId = $("#paramPrjId").val();
	
    
    var documentSetting = function () {
    	
    	$("#prj1001SaveSubmit > span").text($.osl.lang("prj1001."+type+".saveBtnString"));
    	
    	var today = new Date().format("yyyy-MM-dd");
    	
    	$("#startDt").val(today);
		$("#endDt").val(today);
		
    	
		$.osl.date.daterangepicker($("#prjRange"), {}, function(defaultConfig, start, end, label) {
			var startDt = new Date(start._d).format("yyyy-MM-dd");
			var endDt = new Date(end._d).format("yyyy-MM-dd");
			
			$("#startDt").val(startDt);
			$("#endDt").val(endDt);
		});

    	
		var commonCodeArr = [
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#useCd", comboType:"OS"}, 
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#prjRequestAcceptCd", comboType:"OS"}, 
			{mstCd: "PRJ00013", useYn: "Y",targetObj: "#prjTypeCd", comboType:"OS"}, 
			{mstCd: "PRJ00014", useYn: "Y",targetObj: "#prjDevTypeCd", comboType:"OS"} 
		];
		
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		
		
		$("#prjAcrm").keyup(function(e){
			 var inputVal = $("#prjAcrm").val();
			 
		 	$("#prjAcrm").val(inputVal.toUpperCase());
		});
		
		
    	$("#prj1001SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		$.osl.confirm($.osl.lang("prj1001."+type+".saveString"),null,function(result) {
    	        if (result.value) {
    	        	
    	        	saveFormAction();
    	        }
    		});
    	});

		
		$('#prjTypeCd').on('select2:select', function (e) {
			var data = e.params.data;
			
			if(data.id == "02"){
				$('#prjDevTypeCd').parent("div.form-group").attr("hidden","hidden");
			}else{
				$('#prjDevTypeCd').parent("div.form-group").removeAttr("hidden");
			}
		});
		
		
    	datatableSetting();
		
		
		if(type == "update"){
			fnPrjInfoSelect();

			$("#selectBasicItemBtn").click(function(){
				var data = {
						callPage:"OSLPrj1001Popup",
						paramPrjId: paramPrjId 
					};
				var options = {
						idKey: "prj1304",
						modalTitle: "프로젝트 기본항목 리스트",
						modalSize: "xl",
						closeConfirm: false,
						autoHeight: false,
						callback: [{
							targetId: "prj1304ModalCallBackBtn",
							actionFn: function(thisObj){
								var itemList = OSLPrj1304Popup.getItemList();
								OSLPrj1001Popup.addItemList(itemList);
							}
						}]
					};
				
				$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1304View.do',data,options);
			});
			
		}

		$("#insertBasicItemBtn").click(function(){
			var data = {
					type:"insert",
					callPage:"OSLPrj1001Popup"
				};
			var options = {
					idKey: "prj1305",
					modalTitle: "프로젝트 기본항목 추가",
					modalSize: "lg",
					closeConfirm: false,
					autoHeight: false,
					callback: [{
						targetId: "prj1305ModalCallBackBtn",
						actionFn: function(thisObj){
							var itemList = OSLPrj1305Popup.getItemList();
							OSLPrj1001Popup.addItemList(itemList);
						}
					}]
				};
			
			$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1305View.do',data,options);
		});
		
    };
    
    
    var saveFormAction = function() {
    	
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	
    	var authUsrList = $.osl.datatable.list["prj1001PrjAuthUsrTable"].targetDt.originalDataSet;
    	if(!$.osl.isNull(authUsrList) && authUsrList.length > 0){
    		var usrIdList = [];
    		$.each(authUsrList, function(idx, map){
    			usrIdList.push({licGrpId: map.licGrpId, authTypeCd: map.authTypeCd, usrId: map.usrId});
    		});
    		fd.append("usrIdList",JSON.stringify(usrIdList));
    	}

		if(basicItemList.length>0){
			$.each(basicItemList, function(idx, map){
				map.itemOrd = idx+1;
				if($.osl.isNull(map.itemRequestCd)){
					map.itemRequestCd="02";
				}
				if($.osl.isNull(map.itemAcceptCd)){
					map.itemAcceptCd="02";
				}
				basicItemList[idx] = map;
				
			});
			var itemOrd = basicItemList[basicItemList.length-1].itemOrd;
	   		
			$.each(basicItemInsertList, function(idx, map){
				map.itemOrd = itemOrd+idx+1;
				if($.osl.isNull(map.itemRequestCd)){
					map.itemRequestCd="02";
				}
				if($.osl.isNull(map.itemAcceptCd)){
					map.itemAcceptCd="02";
				}
				basicItemInsertList[idx] = map;
				
			});
		}else{
	   		
			$.each(basicItemInsertList, function(idx, map){
				map.itemOrd = idx+1;
				if($.osl.isNull(map.itemRequestCd)){
					map.itemRequestCd="02";
				}
				if($.osl.isNull(map.itemAcceptCd)){
					map.itemAcceptCd="02";
				}
				basicItemInsertList[idx] = map;
			});
		}
		
    	fd.append("basicItemList", JSON.stringify(basicItemList));
    	fd.append("basicItemInsertList", JSON.stringify(basicItemInsertList));
    	fd.append("basicItemDelList", JSON.stringify(basicItemDelList));
    	
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1000/savePrj1001PrjGrpInfo.do'/>", "async": true,"contentType":false,"processData":false ,"cache":false, "loadingShow": false},fd);
    	 $.osl.showLoadingBar(true,{target: "#frPrj1001", message: "프로젝트를 생성중입니다.</br>잠시만 기다려주세요."});
   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);
   				
   				
   				$.osl.layerPopupClose();
   				
   				
   				$("button[data-datatable-id=prj1000PrjTable][data-datatable-action=select]").click();
   			}
   		});
   		
   		ajaxObj.setFnComplete(function(data){
   			$.osl.showLoadingBar(false,{target: "#frPrj1001"});
   		});
   		
   		
   		ajaxObj.send();
    };
    
    
    var datatableSetting = function(){
    	
		$.osl.datatable.setting("prj1001PrjAuthUsrTable",{
			data: {
				type:'local',
				serverSorting: false,
				serverPaging: false,
				source: [],
				pageSize: 4
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100]
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'usrNm', title: '사용자명', textAlign: 'left', width: 150, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직책', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd"},
				{field: 'usrDutyNm', title: '직급', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 150, search: true},
			],
			searchColumns:[
				{field: 'usrId', title: '사용자 ID', searchOrd: 1}
			],
			actionBtn:{
				"title": "제외",
				"update": false,
				"delete": false,
				"dblClick": true,
			},
			actionTooltip:{
				"dblClick": "담당자 배정 제외"
			},
			theme:{
				actionBtnIcon:{
					"dblClick": "fa fa-arrow-alt-circle-right",
				}
			},
			actionFn:{
				"select": function(datatableId, elem){
					
					var searchTypeTarget = $(".osl-datatable-search__dropdown[data-datatable-id="+datatableId+"] > .dropdown-item.active");
					
					
					var searchData = $("#searchData_"+datatableId);

					
					var searchFieldId = searchTypeTarget.data("field-id");
					var searchType = searchTypeTarget.data("opt-type");
					var searchCd = $(this).data("opt-mst-cd");
					
					
					$.osl.datatable.list[datatableId].targetDt.setDataSourceQuery({});
					
					
					if(searchType != "all"){
						var searchDataValue = searchData.val();
						
						
						if(searchType == "select"){
							searchDataValue = $("#searchSelect_"+datatableId).val();
						}
						
						$.osl.datatable.list[datatableId].targetDt.search(searchDataValue,searchFieldId);
					}else{
						$.osl.datatable.list[datatableId].targetDt.search();
					}
				},
				"reset": function(rowData, datatableId, type, rownum, elem){
					var datatable = $.osl.datatable.list[datatableId].targetDt;
					
					
					datatable.dataSet = [];
					datatable.originalDataSet = [];
					prjAuthUsrIdList = [];
					
					
					if(prjAuthOriginalData.length > 0){
						$.each(prjAuthOriginalData, function(idx, map){
			   				
			   				datatable.dataSet.push(map);
							datatable.originalDataSet.push(map);
							
							
							prjAuthUsrIdList.push(map.usrId);
		   				});
					}
					
					
					datatable.insertData();
					
					datatable.reload();
				},
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					fnAllUsrDelete(rowDatas);
				},
				
				"selInUsrDelete": function(rowData, datatableId, type, rownum, elem){
					var rowDatas = rowData;
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("common.user.auth.allUsrInDelete",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							
							fnAllUsrDelete(rowDatas);
						}
					});
				}
			}
		});
		
		
		$.osl.datatable.setting("prj1001PrjAuthNoneUsrTable",{
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1000/selectPrj1000PrjAuthNoneUsrListAjax.do"
					}
				},
				pageSize: 4,
			},
			toolbar:{
				items:{
					pagination:{
						pageSizeSelect : [4, 10, 20, 30, 50, 100],
						pages:{
							desktop: {
								layout: 'default',
								pagesNumber: 5
							},
							tablet: {
								layout: 'compact'
							}
						}
					}
				}
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'authTypeNm', title: '분류', textAlign: 'center', width: 80, search: true, searchType:"select", searchCd: "PRJ00018", searchField:"authTypeCd", sortField: "authTypeCd"},
				{field: 'usrNm', title: '사용자명', textAlign: 'left', width: 130, search: true,
					template: function (row) {
						return $.osl.user.usrImgSet(row.usrImgId, row.usrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.usrId);
					}
				},
				{field: 'usrPositionNm', title: '직책', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00007", searchField:"usrPositionCd", sortField: "usrPositionCd"},
				{field: 'usrDutyNm', title: '직급', textAlign: 'center', width: 100, search: true, searchType:"select", searchCd: "ADM00008", searchField:"usrDutyCd", sortField: "usrDutyCd"},
				{field: 'deptName', title: '부서', textAlign: 'left', width: 150, search: true, sortable: false},
			],
			searchColumns:[
				{field: 'usrId', title: '사용자 ID', searchOrd: 1}
			],
			actionBtn:{
				"title": "배정",
				"update": false,
				"delete": false,
				"dblClick": true,
				"lastPush": false,
			},
			actionTooltip:{
				"dblClick": "담당자 등록"
			},
			theme:{
				actionBtnIcon:{
					dblClick: "fa fa-arrow-alt-circle-left",
				}
			},
			rows:{
				beforeTemplate: function (row, data, index){
					
					if(prjAuthUsrIdList.indexOf(data.usrId) > -1){
						row.addClass("osl-datatable__row-assign--none");
					}
				}
			},
			actionFn:{
				"dblClick":function(rowData){
					var rowDatas = [];
					rowDatas.push(rowData);
					
					
					fnAllUsrInsert(rowDatas);
				},
				
				"selAllUsrDelete": function(rowData, datatableId, type){
					var rowDatas = rowData;
					
					
					if(rowDatas.length == 0){
						$.osl.alert($.osl.lang("datatable.translate.records.nonSelect"));
						return true;
					}
					
					$.osl.confirm($.osl.lang("common.user.auth.allUsrInsert",rowDatas.length),{html:true}, function(result){
						if (result.value) {
							
							fnAllUsrInsert(rowDatas);
						}
					});
				}
			}
		});
	};
	
	var fnAllUsrInsert = function(selDatas){
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			
			var datatable = $.osl.datatable.list["prj1001PrjAuthUsrTable"].targetDt;
			
			
			if($.osl.isNull(datatable.dataSet)){
				datatable.dataSet = [];
				datatable.originalDataSet = [];
			}
			
			
			var usrIdDupleList = 0;
			
			
			$.each(selDatas, function(idx, map){
				
				if(prjAuthUsrIdList.indexOf(map.usrId) != -1){
					usrIdDupleList++;
					return true;
				}
				
				datatable.dataSet.push(map);
				datatable.originalDataSet.push(map);
				
				
				prjAuthUsrIdList.push(map.usrId);
			});
			
			
			var toastrMsg = "";
			var toastrType = "success";
			if(selDatas.length > usrIdDupleList){
				toastrMsg += $.osl.lang("prj1001.insert.saveMsg",(selDatas.length-usrIdDupleList));
			}
			if(usrIdDupleList > 0){
				
				if(toastrMsg.length > 0){
					toastrMsg += "</br>";
				}
				toastrMsg += $.osl.lang("prj1001.insert.saveDupleMsg",usrIdDupleList);
				toastrType = "warning";
			}
			
			if(usrIdDupleList == selDatas.length){
				toastrMsg = $.osl.lang("prj1001.insert.saveAllDupleMsg",usrIdDupleList);
				toastrType = "error";
				$.osl.toastr(toastrMsg,{type: toastrType});
				return false;
			}
			
			$.osl.toastr(toastrMsg,{type: toastrType});
			
			
			datatable.insertData();
			
			datatable.reload();
			
			$.osl.datatable.list["prj1001PrjAuthNoneUsrTable"].targetDt.reload();
			$("div.tooltip.show").remove();
		 }
	};
	
	
	var fnAllUsrDelete = function(selDatas){
		if(!$.osl.isNull(selDatas) && selDatas.length > 0){
			
			var datatable = $.osl.datatable.list["prj1001PrjAuthUsrTable"].targetDt;
			
			
			var dataSet = datatable.dataSet;
			var originalDataSet = datatable.originalDataSet;
			
			if(!$.osl.isNull(dataSet)){
				
				$.each(selDatas, function(idx, map){
					$.each(originalDataSet, function(dataIdx, dataMap){
						if($.osl.isNull(dataMap)){
							return true;
						}
						
						else if(map.usrId == dataMap.usrId){
							originalDataSet.splice(dataIdx, 1);
							
							
							prjAuthUsrIdList.splice(prjAuthUsrIdList.indexOf(map.usrId), 1);
							return false;
						}
					});
				});
				
				
				datatable.reload();
				
				$.osl.datatable.list["prj1001PrjAuthNoneUsrTable"].targetDt.reload();
				$("div.tooltip.show").remove();
			}
		}
	};
	
	
	var fnPrjInfoSelect = function(){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1000/selectPrj1000PrjInfoAjax.do'/>"}
				,{prjGrpId: paramPrjGrpId, prjId: paramPrjId});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				var prjInfo = data.prjInfo;
   				
   				$.osl.setDataFormElem(prjInfo, formId, ["prjNm","useCd","ord","prjDesc","startDt","endDt", "prjAcrm", "prjBgColor", "prjColor"]);
   				$("#prjTypeCd").val(prjInfo.prjTypeCd).trigger('change.select2');
   				$("#prjDevTypeCd").val(prjInfo.prjDevTypeCd).trigger('change.select2');
   				$("#prjRequestAcceptCd").val(prjInfo.prjRequestAcceptCd).trigger('change.select2');
   				
   				
   				if(prjInfo.prjTypeCd == "02"){
   					$('#prjDevTypeCd').parent("div.form-group").attr("hidden","hidden");
   				}else{
   					$('#prjDevTypeCd').parent("div.form-group").removeAttr("hidden");
   				}
   				
   				
   				$("#prjRange").data("daterangepicker").setStartDate(prjInfo.startDt);
   				$("#prjRange").data("daterangepicker").setEndDate(prjInfo.endDt);
   				
   				if(data.prjAuthList.length > 0){
   					
					prjAuthOriginalData = data.prjAuthList;
   						 
	   				
	   				var datatable = $.osl.datatable.list["prj1001PrjAuthUsrTable"].targetDt;
	   			
	   				
	   				datatable.eq(0).removeClass("kt-datatable--error");
	   				
	   				$.each(data.prjAuthList, function(idx, map){
		   				
		   				datatable.dataSet.push(map);
						datatable.originalDataSet.push(map);
						
						
						prjAuthUsrIdList.push(map.usrId);
	   				});
					
					
					datatable.insertData();
					
					datatable.reload();
					$.osl.datatable.list["prj1001PrjAuthNoneUsrTable"].targetDt.reload();
					
   				}
   				
   				
				basicItemList = data.basicItemList;
		    	$.osl.customOpt.setting(basicItemList,  "basicItemList",
		    			
		    			{
    						viewType: "preview",
							delAt: true,
							updAt: true,
							badgeAt: true,
							actionFn:{
								delete: function($this){
									var targetId = $this.data("itemId");
									$this.parents(".basicItemDiv:first").remove();
									basicItemDelList.push({"itemId":targetId});
			
									var delIdx = ""
									$.each(basicItemList,function(idx, map){
										if(map.itemId == targetId){
												delIdx = idx;						
										}
									});
									if(delIdx!==""){
										basicItemList.splice(delIdx,1);
									}
								},
								update: OSLPrj1001Popup.basicItemUpdate,
								updateBtn: OSLPrj1001Popup.basicItemUpdateBtn
							}
						}
	    		);
		    	
   			}
		});
		
		
		ajaxObj.send();
	};
	return {
        
        init: function() {
        	documentSetting();
        },
    	addItemList: function(itemList){
	    	basicItemInsertList = basicItemInsertList.concat(itemList);
	    	
	    	
	    	$.osl.customOpt.setting(itemList,  "basicItemList",
	    			
	    			{
						viewType: "preview",
						htmlAppendType: true,
						delAt: true,
						updAt: true,
						badgeAt: true,
						actionFn:{
							delete:function($this){
								var targetId = $this.data("itemId");
								$this.parents(".basicItemDiv:first").remove();
								basicItemDelList.push({"itemId":targetId});
		
								var delIdx = ""
								$.each(basicItemInsertList,function(idx, map){
									if(map.itemId == targetId){
										delIdx = idx;						
									}
								});
								if(delIdx!==""){
									basicItemInsertList.splice(delIdx,1);
								}
							},
							update: OSLPrj1001Popup.basicItemUpdate,
							updateBtn: OSLPrj1001Popup.basicItemUpdateBtn
						}
					}
    		); 
    	},
    	basicItemUpdate: function($this, updType){
			var stat = false;
    		if(updType=="01"){
    			
    			var targetItemId = $this.data("itemId");
    			var targetNm = $this.data("targetNm");
    			var targetValue = "01";
    			if($this.hasClass("osl-badge-lightgray")){
    				targetValue = "01";
    				$this.removeClass("osl-badge-lightgray");
    				$this.addClass("badge-info");
    			}else{
    				targetValue = "02";
    				$this.removeClass("badge-info");
    				$this.addClass("osl-badge-lightgray");
    			}
    			
    			$.each(basicItemList,function(idx, map){
    				if(map.itemId == targetItemId){
    					map[targetNm] = targetValue;
    					basicItemList[idx] = map;
    					stat=true;
    				}
    			});
    			if(stat){
    				return;
    			}
    			$.each(basicItemInsertList,function(idx, map){
    				if(map.itemId == targetItemId){
    					map[targetNm] = targetValue;
    					basicItemInsertList[idx] = map;
    				}
    			});
    		}else if(updType=="02"){
    			
    			var target = $this[0]; 
    			$.each(basicItemList,function(idx, map){
    				if(map.itemId == target.itemId){
    					basicItemList[idx] = target;
    					stat=true;
    				}
    			});
    			if(!stat){
    				$.each(basicItemInsertList,function(idx, map){
        				if(map.itemId == target.itemId){
        					basicItemInsertList[idx] = target;
        				}
        			});
    			}
    			
    			$("#basicItemList").html("");
    			$.osl.customOpt.setting(basicItemList,  "basicItemList",
		    			
		    			{
    						viewType: "preview",
							delAt: true,
							updAt: true,
							badgeAt: true,
							actionFn:{
								delete: function($this){
									var targetId = $this.data("itemId");
									$this.parents(".basicItemDiv:first").remove();
									basicItemDelList.push({"itemId":targetId});
			
									var delIdx = ""
									$.each(basicItemList,function(idx, map){
										if(map.itemId == targetId){
												delIdx = idx;						
										}
									});
									if(delIdx!==""){
										basicItemList.splice(delIdx,1);
									}
								},
								update: OSLPrj1001Popup.basicItemUpdate,
								updateBtn: OSLPrj1001Popup.basicItemUpdateBtn
							}
						}
	    		);
    			$.osl.customOpt.setting(basicItemInsertList,  "basicItemList",
		    			
		    			{
    						viewType: "preview",
							delAt: true,
							updAt: true,
							badgeAt: true,
							htmlAppendType: true,
							actionFn:{
								delete: function($this){
									var targetId = $this.data("itemId");
									$this.parents(".basicItemDiv:first").remove();
									basicItemDelList.push({"itemId":targetId});
			
									var delIdx = ""
									$.each(basicItemInsertList,function(idx, map){
										if(map.itemId == targetId){
												delIdx = idx;						
										}
									});
									if(delIdx!==""){
										basicItemInsertList.splice(delIdx,1);
									}
								},
								update: OSLPrj1001Popup.basicItemUpdate,
								updateBtn: OSLPrj1001Popup.basicItemUpdateBtn
							}
						}
	    		);
    		}
		},
		basicItemUpdateBtn: function($this){
			var targetItemId = $this.data("itemId");
			var itemObj = "";
			var stat = false;

			$.each(basicItemList,function(idx, map){
				if(map.itemId == targetItemId){
					itemObj = map;
					stat=true;
				}
			});
			if(!stat){
				$.each(basicItemInsertList,function(idx, map){
					if(map.itemId == targetItemId){
						itemObj = map;
					}
				});
			}
			
			var data = {
					type:"updateJson",
					callPage:"OSLPrj1001Popup",
					itemObj: JSON.stringify(itemObj)
				};
			var options = {
					idKey: "prj1305",
					modalTitle: "프로젝트 기본항목 수정",
					modalSize: "lg",
					closeConfirm: false,
					autoHeight: false,
					callback: [{
						targetId: "prj1305ModalCallBackBtn",
						actionFn: function(thisObj){
							var itemList = OSLPrj1305Popup.getItemList();
							OSLPrj1001Popup.basicItemUpdate(itemList, "02");
						}
					}]
				};
			
			$.osl.layerPopupOpen('/prj/prj1000/prj1300/selectPrj1305View.do',data,options);
		}
    };
}();


$.osl.ready(function(){
	OSLPrj1001Popup.init();
});

	
</script>