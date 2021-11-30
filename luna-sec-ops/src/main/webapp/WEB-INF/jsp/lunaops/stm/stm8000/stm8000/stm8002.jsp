<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="strgRepId" id="strgRepId" value="<c:out value='${param.strgRepId}'/>">
<input type="hidden" name="systemRoot" id="systemRoot" value="<c:out value='${param.systemRoot}'/>">
<div class="row">
	<div class="col-lg-4 col-md-12 col-sm-12 col-12">
		<div class="kt-portlet kt-portlet--mobile kt-margin-b-10">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label kt-portlet__head--lg">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm8002.title.revision">리비전 목록</span>
					</h5>
				</div>
			</div>
			
			<div class="kt-padding-10 border-bottom">
				<div class="col-lg-9 col-md-12 col-sm-12 col-12">
					<div class="osl-datatable-search kt-margin-b-0" data-datatable-id="stm8002RepTable"></div>
				</div>
			</div>
			<div class="kt-padding-10 border-bottom osl-display__flex">
				<h6 class="kt-font-boldest kt-font-brand kt-padding-l-10 kt-margin-0 kt-margin-r-20">
					<span data-lang-cd="stm8002.label.revisionNum">리비전 번호</span>
				</h6>
				<input type="text" class="osl-outline--secondary rounded kt-padding-10 kt-margin-r-10 osl-w-px-80 osl-h-px-35" placeholder="시작" authocomplate="off" regexstr="^[0-9]{0,4}$" maxlength="4" id="searchStNum" name="searchStNum">
				<span class="osl-h-px-38 font-weight-bolder osl-line-height--38">-</span>
				<input type="text" class="osl-outline--secondary rounded kt-padding-10 kt-margin-l-10 osl-w-px-80 osl-h-px-35" placeholder="종료"  authocomplate="off" regexstr="^[0-9]{0,4}$" maxlength="4" id="searchEdNum" name="searchEdNum">
				<div class="osl-display__flex-r">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air kt-margin-l-10" data-datatable-id="stm8002RepTable" data-datatable-action="select" title="리비전 조회" data-title-lang-cd="stm8002.actionBtn.selectTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
						<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
					</button>
				</div>
			</div>
			<div class="kt-portlet__body kt-padding-15 osl-min-h-px--520">
				
				<div class="kt_datatable osl-datatable-footer__divide kt-margin-b-0" id="stm8002RepTable"></div>
			</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet">
		<div class="kt-portlet kt-margin-b-10">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span id="revisionNum"></span><span data-lang-cd="stm8002.title.file">폴더 목록</span>
					</h5>
				</div>
			</div>
			<div class="kt-padding-10 border-bottom">
				<div class="col-lg-8 col-md-12 col-sm-12 col-12">
					<div class="osl-tree-search" data-tree-id="stm8002RevisionFileTreeDiv"></div>
				</div>
			</div>
			<div class="kt-padding-10 border-bottom kt-align-right">
				<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 펼치기" data-title-lang-cd="tree.label.contextmenu.allNodeOpen" data-tree-id="stm8002RevisionFileTreeDiv" data-tree-action="allNodeOpen">
					<i class="fa fa-plus"></i>
				</a>
				<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md osl-tree-action" data-toggle="kt-tooltip" title="전체 접기" data-title-lang-cd="tree.label.contextmenu.allNodeClose" data-tree-id="stm8002RevisionFileTreeDiv" data-tree-action="allNodeClose">
					<i class="fa fa-minus"></i>
				</a>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air osl-tree-action" data-tree-id="stm8002RevisionFileTreeDiv" data-tree-action="select" title="리비전 파일 목록 조회" data-original-title="stm8002.actionBtn.selectFileTooltip"  data-title-lang-cd="stm8002.actionBtn.selectFileTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
			</div>
			<div class="kt-portlet__body position-relative kt-padding-0 osl-min-h-px--520">
				
				<div class="osl-div-cover osl-width--100-p osl-height--100-p">
					<span data-lang-cd="stm8002.message.selectRevision">리비전을 선택하세요.</span>
				</div>
				<div class="osl-tree kt-scroll kt-margin-20" data-height="480" id="stm8002RevisionFileTreeDiv"></div>
			</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet">
		<div class="kt-portlet kt-margin-b-10">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label">
					<h5 class="kt-font-boldest kt-font-brand">
						<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="stm8002.title.file">파일 목록</span>
					</h5>
				</div>
			</div>
			<div class="kt-padding-10 border-bottom">
				<div class="col-lg-9 col-md-12 col-sm-12 col-12">
					<div class="osl-datatable-search kt-margin-b-0" data-datatable-id="stm8002RevisionFileTable"></div>
				</div>
			</div>
			<div class="kt-padding-10 border-bottom kt-align-right">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" data-datatable-id="stm8002RevisionFileTable" data-datatable-action="select" title="파일 조회" data-title-lang-cd="stm8002.actionBtn.selectFileTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
					<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" data-datatable-id="stm8002RevisionFileTable" data-datatable-action="detail" title="소스보기" data-title-lang-cd="stm8002.actionBtn.detailTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="detail" tabindex="2">
					<i class="fas fa-external-link-alt"></i><span data-lang-cd="stm8002.actionBtn.detailBtn">상세</span>
				</button>
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" data-datatable-id="stm8002RevisionFileTable" data-datatable-action="diff" title="DIFF" data-title-lang-cd="stm8002.actionBtn.diffTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="diff" tabindex="3">
					<i class="fas fa-code"></i><span data-lang-cd="stm8002.actionBtn.diffBtn">DIFF</span>
				</button>
			</div>
			<div class="kt-portlet__body osl-min-h-px--520">
				
				<div class="kt_datatable osl-datatable-footer__divide" id="stm8002RevisionFileTable"></div>
				<button type="button" class="btn btn-sm kt-margin-0 kt-padding-0 osl-width-0 invisible" id="selectRevisions"/>
			</div>
		</div>
	</div>
</div>

<script>
"use strict";
var OSLCmm6800Popup = function() {
	var strgRepId = $("#strgRepId").val();
	//저장소 유형
	var strgTypeCd;
	//저장소 url
	var linkUrl;
	//저장소 접근 id
	var linkId;
	//저장소 접근 pw 또는 token key
	var linkPw;
	//저장소 명
	var linkRepo;
	//선택한 리비전
	var revision;
	//리비전 시작 종료 번호
	var searchStNum;
	var searchEdNum;
	// 파일 tree 세팅
	var treeObj;
	//데이터 테이블 아이디
	var datatableId = "stm8002RepTable";
	var treetableId = "stm8002RevisionFileTreeDiv";
	var treeDatatableId = "stm8002RevisionFileTable";
	
	//권한 체크 결과값을 담을 변수 선언
	var okRevision = false;
	var okFileCode = false;
	//시스템권한으로 들어온 것인지 확인
	var systemRoot = $("#systemRoot").val();
	
	//선택한 리비전을 담을 변수 선언
	var revisions = [];
	//기본 설정
	var documentSetting = function() {
		
		//placeholder 세팅
		$("#searchStNum").attr("placeholder",$.osl.lang("stm8002.placeholder.revision.start"));
		$("#searchEdNum").attr("placeholder",$.osl.lang("stm8002.placeholder.revision.end"));
		
		//접근 권한 확인 및 시스템 루트로 들어왔는지 확인
		if(!$.osl.isNull(systemRoot) && systemRoot){
			//시스템 루트로 들어온 경우 choose 사용 안함
			$('.btn[data-auth-button=choose]').hide();
			
			//시스템 권한으로 들어온 경우
			okRevision = true;
			okFileCode = true;
		}else{
			authCheck(strgRepId);
			//리비전 열람 권한이 없을 경우
			if(!okRevision){
				$.osl.alert($.osl.lang("stm8002.message.auth"));
				//모달 창 닫기
				$.osl.layerPopupClose();
			}
		}
		//접속 가능한 strgRepId인지 확인
		//접속 가능한 경우 계속 실행, 불가능할 경우 팝업창 닫힘
		strgConnectionCheck(strgRepId);
		
		//strgRepId가 가진 저장소 유형, 저장소 url, 저장소 id/pw 또는 id/token 가져오기
		getStrgRepInfo();

		//파일 목록 출력 datatable 세팅
		$.osl.datatable.setting(treeDatatableId,{
				data: {
					source: {
						read: {
							url: "/stm/stm8000/stm8000/selectStm8000FileListAjax.do",
							params : {
								selectFileDirType : "file",
								revision : revision,
								strgRepId : strgRepId
							}
						}
					},
					pageSize: 7
				},
				toolbar:{
					items:{
						pagination:{
							pageSizeSelect : [7, 10, 20, 30, 50, 100],
							pages:{
								desktop: {
									layout: 'default',
									pagesNumber: 3
								},
								tablet:{
									layout: 'default',
									pagesNumber: 1
								},
								mobile:{
									layout: 'default',
									pagesNumber: 1
								}
							}
						}
					}
				},
				columns: [
					{field: 'checkbox', title: '#', textAlign: 'center', width: 15, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
					{field: 'type', title: '유형', textAlign: 'center', width: 80, autoHide: false, sortable: false},
					{field: 'name', title: '파일명', textAlign: 'left', width: 150, autoHide: false, search: true},
				],
				actionBtn:{
					"title": $.osl.lang("stm8002.revisionFile.actionTitle"),
					"insert" : false,
					"update" : false,
					"delete" : false,
					"dblClick" : true,
					"detail": true,
					"click": true,
					"diff" : true,
				},
				actionTooltip:{
					"dblClick" : $.osl.lang("stm8002.revisionFile.actionTooltip.dblClickTooltip"),
					"diff" : $.osl.lang("stm8002.revisionFile.actionTooltip.diffTooltip")
				},
				actionFn:{
					"click":function(rowData, datatableId, type, rowNum, elem){
						var datatable = $.osl.datatable.list[datatableId].targetDt;
						
						//현재 선택한 elem의 체크박스만 선택
						var targetCheckRow = datatable.row("[data-row="+rowNum+"]").nodes();
						var target = targetCheckRow.find("label.kt-checkbox").children("input[type=checkbox]");
						if(target.length > 0){
							if(target.is(":checked") == true){
								//checkBox 선택은 현재 클릭한 것만 적용하기 위해 전부 해제
								datatable.setActiveAll(false);
								
								target.prop("checked", true);
								datatable.setActive(target);
							}else{
								//선택된것처럼 row 컬러가 그대로 남아있으므로
								targetCheckRow.removeClass("osl-datatable__row--selected");
								targetCheckRow.addClass("kt-datatable__row--even");
							}
						}
					},
					"detail": function(rowDatas, datatableId, type, rowNum){
						var rowData;
						if(type == "list"){
							if(rowNum != 1){
								$.osl.alert($.osl.lang("stm8002.revisionFile.message.selectOne"));
								return false;
							}else{
								rowData = rowDatas[0];
							}
						}else{
							rowData = rowDatas;
						}
						
						var data = {
								type : strgTypeCd,
								path: rowData.path,
								revision : revision,
								strgRepId : strgRepId
							};
						var options = {
							idKey:"fileCode_"+revision,
							modalTitle: "[Revision "+revision+"] "+ rowData.name,
							autoHeight: false,
							ftScrollUse: false
						};
						
						if(okFileCode){
							$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8002View.do',data,options);
						}else{
							$.osl.alert($.osl.lang("stm8002.message.auth"));
							return false;
						}
					},
					"dblClick": function(rowData){
						var data = {
							type : strgTypeCd,
							path: rowData.path,
							revision : revision,
							strgRepId : strgRepId
						};
						var options = {
							idKey:"fileCode_"+revision,
							modalTitle: "[Revision "+revision+"] "+ rowData.name,
							autoHeight: false,
							ftScrollUse: false
						};
						
						if(okFileCode){
							$.osl.layerPopupOpen('/cmm/cmm6000/cmm6800/selectCmm6801View.do',data,options);
						}else{
							$.osl.alert($.osl.lang("stm8002.message.auth"));
							return false;
						}
					},
					"diff":function(rowDatas, datatableId, type, rowNum){
						var rowData;
						
						//리스트인 경우
						if(type == "list"){
							if(rowNum != 1){
								$.osl.alert($.osl.lang("stm8002.revisionFile.message.selectOne", rowNum), {"type":"warning"});
								return false;
							}else{
								rowData = rowDatas[0];
							}
						}else{
							//인포인 경우
							rowData = rowDatas;
						}
						
						var data = {
							type : strgTypeCd,
							path: rowData.path,
							revision : revision,
							strgRepId : strgRepId,
							searchStNum : $("#searchStNum").val(),
							searchEdNum : $("#searchEdNum").val(),
							name : rowData.name,
						};
						var options = {
							idKey:"stm8002_diff",
							modalTitle: "[Revision. "+revision+"] "+rowData.name,
							//modalSize: "fs"
							autoHeight: false,
						};

						if(okFileCode){
							$.osl.layerPopupOpen('/stm/stm8000/stm8000/selectStm8003View.do',data,options);
						}else{
							$.osl.alert($.osl.lang("stm8002.message.auth"));
							return false;
						}
					}
				},
				theme:{
					 actionBtn:{
						 "click": " kt-hide",
						 "detail" : " kt-hide",
						 "dblClick": "",
						 "diff" : "",
					 },
					 actionBtnIcon:{
						"click": "fa flaticon2-check-mark",
	    				"detail": "fas fa-external-link-alt",
	    				"dblClick": "fas fa-external-link-alt",
	    				"diff": "fas fa-code",
	    			}
				}
			}
		);
		
		var params;
		if(strgTypeCd == "01"){
			params = {
					type : strgTypeCd,
					linkUrl : linkUrl,
					linkId : linkId,
					linkPw : linkPw,
			};
		}else{
			params = {
					type : strgTypeCd,
					linkUrl : linkUrl,
					linkId : linkId,
					linkPw : linkPw,
					linkRepo : linkRepo,
			};
		}

		//일반 리비전 목록 출력 datatable 세팅
		$.osl.datatable.setting(datatableId,{
				data: {
					source: {
						read: {
							url: "/stm/stm8000/stm8000/selectStm8000RevisionListAjax.do",
							params : params
						}
					},
					pageSize: 7,
				},
				toolbar:{
					items:{
						pagination:{
							pageSizeSelect : [7, 10, 20, 30, 50, 100],
							pages:{
								desktop: {
									layout: 'default',
									pagesNumber: 3
								},
								tablet:{
									layout: 'default',
									pagesNumber: 1
								},
								mobile:{
									layout: 'default',
									pagesNumber: 1
								}
							}
						}
					}
				},
				columns: [
					{field: 'checkbox', title: '#', textAlign: 'center', width: 15, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
					{field: 'revision', title: '리비전', textAlign: 'center', width: 80, autoHide: false, sortable: false},
					{field: 'comment', title: '내용', textAlign: 'left', width: 200, sortable: false, search:true,
						template : function(row){
							if($.osl.isNull((row.comment).trim())){
								return "-";
							}else{
								return row.comment;
							}
						},
					},
					{field: 'author', title: '등록자', textAlign: 'center', width: 80, sortable: false, search:true},
					{field: 'logDate', title: '등록일', textAlign: 'center', width: 80, sortable: false, search:true, searchType:"daterange",
						template : function(row){
							var paramDatetime = new Date(row.logDate);
			                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
			                return agoTimeStr.agoString;
						},
					},
				],
				rows:{
					minHeight: 50
				},
				actionBtn:{
					"title": $.osl.lang("stm8002.title.actionTitle.repository"),
					"width": 30,
					"insert" : false,
					"update" : false,
					"delete" : false,
					"click" : true,
					"choose" : true,
				},
				actionTooltip:{
					"click" : $.osl.lang("stm8002.repository.actionTooltip.chooseTooltip"),
					"choose" : $.osl.lang("stm8002.repository.actionTooltip.chooseTooltip"),
				},
				actionFn:{
					"select": function(datatableId, elem, datatable){
						//검색 대상 가져오기
						var searchTypeTarget = $(".osl-datatable-search__dropdown[data-datatable-id="+datatableId+"] > .dropdown-item.active");
						
						//검색 값
						var searchData = $("#searchData_"+datatableId);

						//대상 정보 가져오기
						var searchFieldId = searchTypeTarget.data("field-id");
						var searchType = searchTypeTarget.data("opt-type");
						var searchCd = $(this).data("opt-mst-cd");
						
						//입력된 검색값 초기화
						datatable.setDataSourceQuery({});
						
						//시작, 종료 리비전 넣기
						searchStNum = $("#searchStNum").val();
						searchEdNum = $("#searchEdNum").val();
						
						datatable.setDataSourceParam("searchStNum", searchStNum);
						datatable.setDataSourceParam("searchEdNum", searchEdNum);						

						//전체가 아닌경우 해당 타입으로 검색
						if(searchType != "all"){
							var searchDataValue = searchData.val();
							
							//공통코드인경우 select값 가져오기
							if(searchType == "select"){
								searchDataValue = $("#searchSelect_"+datatableId).val();
							}
							datatable.search(searchDataValue,searchFieldId);
							
						}else{
							datatable.search();

							//검색한 경우 기존 선택 항목 초기화
							revision = "";
							$("#revisionNum").text("");
							
							//트리구조 재호출
							treeLoad();
							//파일구조 재호출
							fileLoad();
						}
						
						//데이터 테이블 재호출
 						datatable.reload();
					},
					"click": function(rowData, datatableId, type, rowNum, elem){
						revision = rowData.revision;
						$("#revisionNum").text("["+revision+"] ");
						//트리 재조회
	    				treeLoad();
						//파일 목록 재조회
						fileLoad();
						
						//시스템 관리 루트로 들어온 경우 choose 기능을 사용하지 않으므로
						//checkBox 선택은 현재 클릭한 것만 적용
						if(!$.osl.isNull(systemRoot) && systemRoot){
							$.osl.datatable.list[datatableId].targetDt.setActiveAll(false);
							$.osl.datatable.list[datatableId].targetDt.setActive(elem);
						}
					},
					"choose": function(rowDatas, datatableId, type, rowNum){
						if(type == "list"){
							revisions = rowDatas;
						}else{
							revisions.push(rowDatas);
						}
						
						$("#selectRevisions").click();
					}
				},
				theme:{
					 actionBtn:{
						 "click": " kt-hide",
						 "choose": " rootChoose"
					 },
					 actionBtnIcon:{
	    				"click": "fa flaticon2-check-mark",
	    				"choose": "fa flaticon2-check-mark",
	    			}
				},
				callback:{
					initComplete: function(evt, config){
						//트리구조 세팅
						dirTreeSetting();
					},
					ajaxDone: function(evt, list){
						$("#searchStNum").val($.osl.datatable.list[datatableId].targetDt.lastResponse.meta.searchStNum);
						$("#searchEdNum").val($.osl.datatable.list[datatableId].targetDt.lastResponse.meta.searchEdNum);
						//시작, 종료 리비전 넣기
						searchStNum = $("#searchStNum").val();
						searchEdNum = $("#searchEdNum").val();
					}
				}
			}
		);
		
		//데이터 테이블 렌더링 업데이트 및 테이블 크기 조정 시 이벤트 발생
		$("#"+datatableId).on("kt-datatable--on-layout-updated", function(){
			if(!$.osl.isNull(systemRoot) && systemRoot){
				//시스템 루트로 들어온 경우 choose 사용 안함
				//action btn 숨기기
				$(".rootChoose").addClass("kt-hide");
				//모든 action btn이 사라졌으므로 action btn 영역 감추기
				$.osl.datatable.list[datatableId].targetDt.getColumnByField("actions").visible=false;
				//checkbox 컬럼 숨기기
				$.osl.datatable.list[datatableId].targetDt.getColumnByField("checkbox").visible=false;
				$.osl.datatable.list[datatableId].targetDt.columnHide();
			}
       	});
		
		//퍼펙트 스크롤 적용
		KTUtil.scrollInit($("#"+treetableId)[0], {
	        disableForMobile: true, 
	        resetHeightOnDestroy: true, 
	        handleWindowResize: true, 
	        height: 480
	    });
		
		$("#selectRevisions").click(function(){
			$.osl.layerPopupClose();
			//호출 시 modal 전달 options에 callback 함수 작성
			/* 
			예시
			var data = {
					strgRepId : 선택한 소스저장소 id,
					systemRoot : 시스템 권한으로 들어올 경우 true 입력, 아닌경우 false 또는 입력 없음
			};
			var options = {
					callback: [{
						targetId : "selectRevisions",
						actionFn: function(thisObj){
							//선택한 리비전 목록을 담는다
							var temp = OSLCmm6800Popup.getRevisionList();
							if(!$.osl.isNull(temp)){
								호출한 창에서의 실행할 동작
							}
						}
					}]
			};
			$.osl.layerPopupOpen('/stm/stm8000/stm8002/selectCmm6800View.do',data,options);
			 */
		});
	}
	
	 /**
	* function 명 	: dirTreeSetting
	* function 설명	: 폴더 트리세팅
	*/
	var dirTreeSetting = function(){
		treeObj = $.osl.tree.setting(treetableId,{
			data:{
				url:"<c:url value='/stm/stm8000/stm8000/selectStm8000DirListAjax.do'/>",
				key: "currentKey",
				/* 부모 key 값 */
				pKey: "parentKey",
				/* 출력 text key */
				labelKey: "name",
				param:{
					selectFileDirType : "dir",
					revision : revision,
					strgRepId : strgRepId
				}
			},
			search:{
				//대소문자 구분
				case_insensitive : true,
				//검색 결과 노드만 표시
				show_only_matches: true,
				//show_only_matches: true 일때 하위 노드도 같이 표시 할건지
				show_only_matches_children: true,
			},
			callback:{
				init: function(treeObj, data){
					treeContent();
				},
				onclick: function(treeObj, selNode){
					//클릭한 경로에 해당하는 파일만 가져오기
					fileLoad(selNode.original.key);
				}
			}
		});
	};
	
	/**
	* function 명 	: treeContent
	* function 설명	: 리비전 선택에 따라 cover 적용
	*/
	var treeContent = function(){
		//리비전이 없을 경우 리비전을 선택하라는 문구 출력
		if($.osl.isNull(revision)){
			$('.osl-div-cover').css('display','');
			$('.osl-div-cover').text($.osl.lang("stm8002.dirTree.message.selectRevision"));
			$("#"+treetableId).children("ul").addClass("kt-hide");
		}else{
			$('.osl-div-cover').css('display','none');
			$("#"+treetableId).children("ul").removeClass("kt-hide");
		}
	};
	
	/**
	* function 명 	: getStrgRepInfo
	* function 설명	: 저장소 정보가져오기
	*/
	var getStrgRepInfo = function(){
		var data = {
				strgRepId : strgRepId
		};
		
		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000ServerInfoAjax.do'/>", "async":false}
   				, data);
		
   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				strgTypeCd = data.repInfo.strgTypeCd;
   		  		linkUrl = data.repInfo.strgRepUrl;
   		  		linkId = data.repInfo.strgUsrId;
   		  		//저장소 유형에 따라 password, token 선택하여 가져오기
   		  		if(strgTypeCd == "01"){
   		  			//svn인 경우
   		  			linkPw = data.repInfo.strgUsrPw;
   		  		}else{
   		  			//git인 경우
	   		  		linkPw = data.repInfo.strgKey;
	   		  		linkRepo = data.repInfo.strgRepNm;
   		  		}
   			}
   		});
  	 	//AJAX 전송
   		ajaxObj.send();
	};
	 
	/**
	* function 명 	: treeload
	* function 설명	: 선택한 리비전에 따라 트리 구조 호출
	*/
	var treeLoad = function(){
		//revision 여부에 따라 cover 적용
		treeContent();
		
		//리비전 주입
		treeObj.jstree().settings.data.param = {
			selectFileDirType : "dir",
			revision : revision,
			strgRepId : strgRepId,
			searchStNum : searchStNum,
			searchEdNum : searchEdNum,
		};
		
		//트리 재조회
		treeObj.jstree().refresh();
		$("button[data-tree-id="+treetableId+"][data-tree-action=select]").click();
		
	};
	
	/**
	* function 명 	: fileload
	* function 설명	: 선택한 리비전에 따라 파일 호출
	* param : pathKey 파일 트리에서 선택한 파일 경로
	*/
	var fileLoad = function(pathKey){
		var datatable = $.osl.datatable.list[treeDatatableId].targetDt;
		//param 주입
		datatable.setDataSourceParam("selectFileDirType", "file");
		datatable.setDataSourceParam("revision", revision);
		datatable.setDataSourceParam("strgRepId", strgRepId);
		datatable.setDataSourceParam("filePath", pathKey);
		
		//파일 목록 재조회
		$("button[data-datatable-id="+treeDatatableId+"][data-datatable-action=select]").click(); 
	};
	
	/**
	* function 명 	: authCheck
	* function 설명	: 리비전 확인 권한 체크
	* param : strgRepId 확인하려는 저장소 id
	*/
	var authCheck = function(strgRepId){
		var data = {
				strgRepId : strgRepId,
		};
		
		//ajax 설정
    	var ajaxObj = new $.osl.ajaxRequestAction(
	   			{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000AuthCheckAjax.do'/>", "async": false}
				, data);
		
    	//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var result = data.result;
				
				//리비전 권한
				if(result.resultRevision == "Y"){
					okRevision = true;
				}else{
					okRevision = false;
				}
				//소스 열람 권한
				if(result.resultFileCode == "Y"){
					okFileCode = true;
				}else{
					okFileCode = false;
				}
			}
    	});
    	//AJAX 전송
		ajaxObj.send();
	};
	
	/**
	* function 명 	: strgConnectionCheck
	* function 설명	: 저장소 연결 확인하기
	* param strgRepId : 확인할 strgRepId
	*/
	var strgConnectionCheck = function(strgRepId){
		
		var data = {
				strgRepId : strgRepId
		};
		
		//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction(
   				{"url":"<c:url value='/stm/stm8000/stm8000/selectStm8000RepoConnectCheckAjax.do'/>", "async": false}
   				, data);
		
   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.connectResult != "SVN_OK" || data.errorYn == "Y"){
				$.osl.alert("연결할 수 없는 저장소입니다.");
				//모달 창 닫기
				if(!$.osl.isNull(systemRoot) && systemRoot){
  					$.osl.layerPopupClose();
				}
			}
   		});
  	 	//AJAX 전송
   		ajaxObj.send();
	};
	
	return {
		init: function(){
			documentSetting();
		},
		getRevisionList : function(){
			return JSON.stringify(revisions);
		}
	};
 }();
 
 
 $.osl.ready(function(){
	 OSLCmm6800Popup.init();
 });
</script>
