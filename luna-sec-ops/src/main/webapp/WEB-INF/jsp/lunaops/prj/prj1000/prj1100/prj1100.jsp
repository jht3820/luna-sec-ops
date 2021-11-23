<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-grid kt-grid--desktop kt-grid--ver-desktop  kt-inbox" id="kt_inbox">
	<div class="kt-grid__item kt-portlet kt-inbox__aside" id="kt_inbox_aside">
		<div class="btn-group kt-margin-b-5" role="group">
			<button type="button" class="btn btn-outline-brand btn-bold btn-elevate btn-elevate-air" data-datatable-id="prj1100PrjTable" data-datatable-action="select" title="데이터 조회" data-title-lang-cd="prj1000.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
				<i class="fa fa-list"></i><span class="osl-resize__display--show">조회</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-elevate btn-elevate-air" data-datatable-id="prj1100PrjTable" data-datatable-action="insert" title="프로세스 생성" data-title-lang-cd="prj1000.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="2">
				<i class="fa fa-plus"></i><span class="osl-resize__display--show">생성</span>
			</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" class="btn btn-outline-brand btn-bold btn-elevate btn-elevate-air" data-datatable-id="prj1100PrjTable" data-datatable-action="update" title="선택 프로세스 수정" data-title-lang-cd="prj1000.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
				<i class="fa fa-edit"></i><span class="osl-resize__display--show">수정</span>
			</button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-elevate btn-elevate-air" data-datatable-id="prj1100PrjTable" data-datatable-action="delete" title="선택  프로세스 삭제" data-title-lang-cd="prj1000.button.title.select" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="2">
				<i class="fa fa-trash-alt"></i><span class="osl-resize__display--show">삭제</span>
			</button>
		</div>
		<div class="osl-datatable-search osl-datatable-search__btn-title--none kt-margin-t-15" data-datatable-id="prj1100PrjTable"></div>
		<div class="kt-inbox__nav">
			<ul class="kt-nav" id="prj1100CardTable">
			</ul>
			<div class="kt_datatable osl-datatable-footer__divide" id="prj1100PrjTable"></div>
			<!-- 
			<ul class="kt-nav">
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link">
						<i class="kt-nav__link-icon fa fa-genderless kt-font-warning"></i>
						<span class="kt-nav__link-text">전체 프로세스</span>
					</a>
				</li>
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link">
						<i class="kt-nav__link-icon fa fa-genderless kt-font-success"></i>
						<span class="kt-nav__link-text">확정 프로세스</span>
					</a>
				</li>
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link">
						<i class="kt-nav__link-icon fa fa-genderless kt-font-info"></i>
						<span class="kt-nav__link-text">폐기 프로세스</span>
					</a>
				</li>
				<li class="kt-nav__item">
					<a href="#" class="kt-nav__link">
						<i class="kt-nav__link-icon fa flaticon2-plus"></i>
						<span class="kt-nav__link-text">프로세스 분류 생성</span>
					</a>
				</li>
			</ul>
			 -->
		</div>
	</div>
	<div class="kt-grid__item kt-grid__item--fluid kt-portlet kt-inbox__list kt-inbox__list--shown" id="processFlowLayerMain">
		<div class="kt-portlet__head">
			<div class="kt-inbox__toolbar kt-inbox__toolbar--extended">
				<div class="kt-inbox__actions kt-inbox__actions--expanded">
					<div class="kt-inbox__panel">
						<button type="button" class="kt-inbox__icon" data-flow-action="zommCtrl" data-toggle="kt-tooltip" title="확대 초기화" data-zoom="reset">
							<i class="flaticon2-refresh-button"></i>
						</button>
						<button type="button" class="kt-inbox__icon" data-flow-action="zommCtrl" data-toggle="kt-tooltip" title="확대" data-zoom="in">
							<i class="fa fa-search-plus"></i>
						</button>
						<button type="button" class="kt-inbox__icon" data-flow-action="zommCtrl" data-toggle="kt-tooltip" title="축소" data-zoom="out">
							<i class="fa fa-search-minus"></i>
						</button>
						<button type="button" class="kt-inbox__icon" data-flow-action="insert" data-toggle="kt-tooltip" title="단계 생성">
							<i class="flaticon2-add-square"></i>
						</button>
						<button type="button" class="kt-inbox__icon" data-flow-action="update" data-toggle="kt-tooltip" title="단계 수정">
							<i class="flaticon2-writing"></i>
						</button>
						<button type="button" class="kt-inbox__icon" data-flow-action="delete" data-toggle="kt-tooltip" title="단계 삭제">
							<i class="flaticon2-rubbish-bin"></i>
						</button>
						<!-- <button type="button" class="kt-inbox__icon" data-flow-action="detail" data-toggle="kt-tooltip" title="Detail">
							<i class="flaticon2-crisp-icons"></i>
						</button> -->
					</div>
				</div>
				<div class="kt-inbox__search d-flex">
					<button class="kt-inbox__icon osl-inbox__aside-menu-bar" id="osl-inbox__aside-menu-bar" data-toggle="kt-tooltip" title="Aside Menu">
						<i class="fa fa-bars"></i>
					</button>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="단계명을 입력해주세요." name="flowNmSearchInput" id="flowNmSearchInput">
						<div class="input-group-append">
							<span class="input-group-text">
								<i class="fa fa-search"></i>
							</span>
						</div>
					</div>
				</div>
				<div class="kt-inbox__controls">
					<button type="button" class="kt-inbox__icon" data-flow-action="reload" data-toggle="kt-tooltip" title="데이터 원복">
							<i class="fa fa-history"></i>
						</button>
					<button type="button" class="kt-inbox__icon pulse pulse-success kt-margin-0" data-flow-action="save" data-toggle="kt-tooltip" title="데이터 저장" id="processSaveBtn">
						<span class="pulse-ring kt-margin-0 kt-hide"></span>
						<i class="fa fa-save"></i>
					</button>
					<!--
					<div class="btn-group" data-toggle="kt-tooltip" title="Settings">
						<button type="button" class="kt-inbox__icon" data-toggle="dropdown">
							<i class="flaticon-more-1"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-right dropdown-menu-fit dropdown-menu-md">
							begin::Nav
							<ul class="kt-nav">
								<li class="kt-nav__head">
									Export Options
									<i class="flaticon2-information" data-toggle="kt-tooltip" data-placement="right" title="Click to learn more..."></i>
								</li>
								<li class="kt-nav__separator"></li>
								<li class="kt-nav__item">
									<a href="#" class="kt-nav__link">
										<i class="kt-nav__link-icon flaticon2-drop"></i>
										<span class="kt-nav__link-text">Users</span>
									</a>
								</li>
								<li class="kt-nav__item">
									<a href="#" class="kt-nav__link">
										<i class="kt-nav__link-icon flaticon2-calendar-8"></i>
										<span class="kt-nav__link-text">Reports</span>
										<span class="kt-nav__link-badge">
											<span class="kt-badge kt-badge--bold kt-badge--danger">9</span>
										</span>
									</a>
								</li>
								<li class="kt-nav__item">
									<a href="#" class="kt-nav__link">
										<i class="kt-nav__link-icon flaticon2-drop"></i>
										<span class="kt-nav__link-text">Statements</span>
									</a>
								</li>
								<li class="kt-nav__item">
									<a href="#" class="kt-nav__link">
										<i class="kt-nav__link-icon flaticon2-new-email"></i>
										<span class="kt-nav__link-text">Customer Support</span>
									</a>
								</li>
								<li class="kt-nav__separator"></li>
								<li class="kt-nav__foot">
									<a class="btn btn-label-brand btn-bold btn-sm" href="#">Proceed</a>
									<a class="btn btn-clean btn-bold btn-sm" href="#" data-toggle="kt-tooltip" data-placement="right" title="Click to learn more...">Learn more</a>
								</li>
							</ul>

							end::Nav
						</div>
					</div> -->
				</div>
			</div>
		</div>
		<div class="kt-portlet__body overflow-hidden osl-process__flow-main">
			<div class="osl-process__flow-container">
				<div class="osl-mask" id="flowMaskDiv">
					<span>프로세스를 선택해주세요.</span>
				</div>
				<div class="osl-process__flow-chart d-inline-block kt-hidden" id="flowChartDiv">
					
				</div>
			</div>
		</div>
	</div>
</div>
<script>
"use strict";
var OSLPrj1100Popup = function () {
	
	
	var flowAddList = [];
	
	var flowRemoveList = [];
	
	var flowChart = $("#flowChartDiv");
	var zoomObj;
	
	
	var selProcessId;
	
	
	var processChgCheck = {_flag: false};
	
	
	var currentZoom = 2;
	
	
	var processEditMode = false;
	
	
	var prj1100Datatable;
	
	
	var documentSetting = function(){
		
		
		Object.defineProperty(processChgCheck, 'flag', {
			get: function() {
				return this._flag;
			},
			set: function(newVal) {
				
				if(newVal){
					$("#processSaveBtn > .pulse-ring").removeClass("kt-hide");
					$("#processSaveBtn > i.fa").addClass("kt-font-brand");
					
					
					$(window).on("beforeunload", function(){
						return true;
					});
				}else{
					$("#processSaveBtn > .pulse-ring").addClass("kt-hide");
					$("#processSaveBtn > i.fa").removeClass("kt-font-brand");
					
					$(window).off("beforeunload");
				}
				this._flag = newVal;
			},
		});
		
		
		$("#flowNmSearchInput+.input-group-append").click(function(){
			fnFlowNmSearch();
		});
		$("#flowNmSearchInput").on('keypress', function(e) {
			if (e.which === 13){
				fnFlowNmSearch();
			}
		});
		
		
		flowChart.flowchart({
				multipleLinksOnInput: true,
				multipleLinksOnOutput: true,
				canUserEditLinks: true,
				distanceFromArrow:1,
				linkWidth:1,
				defaultLinkColor: "#5867dd",
				defaultOperatorClass: "osl-flowchart__operator",
				onLinkCreate: function(linkId, linkData){
					
					if(!processEditMode){
						return true;
					}
					var fromOperatorId = linkData.fromOperator;
					var toOperatorId = linkData.toOperator;
					var fromOperatorData = flowChart.flowchart("getOperatorData",fromOperatorId);
					
					
					if(!fnLinksLimitLoopChk(fromOperatorId, toOperatorId)){
						$.osl.alert($.osl.lang("prj1100.alert.linkLimitLoop"));
						return false;
					}
					
					
					var fromLinkList = flowChart.flowchart("getData").links;
					var fromLinkChkFlag = true;
					
					
					if(!$.osl.isNull(fromLinkList) && Object.keys(fromLinkList).length > 0){
						
						$.each(fromLinkList, function(fromLinkId, fromLinkData){
							
							if(fromLinkData.fromOperator == fromOperatorId && fromLinkData.toOperator == toOperatorId){
								
								flowChart.flowchart("deleteLink", fromLinkId);
								
								
								var flowIdx = fromOperatorData.properties["flowNextId"].indexOf(toOperatorId);
								fromOperatorData.properties["flowNextId"].splice(flowIdx, 1);
								flowChart.flowchart("setOperatorData",fromOperatorId,fromOperatorData);
								
								fromLinkChkFlag = false;
								return false;
							}
						});
					}
					
					
					if(fromLinkChkFlag === false){
						return false;
					}
					
					if(!fromOperatorData.properties.hasOwnProperty("flowNextId")){
						fromOperatorData.properties["flowNextId"] = [];
					}
					
					
					fromOperatorData.properties["flowNextId"].push(toOperatorId);
					flowChart.flowchart("setOperatorData",fromOperatorId,fromOperatorData);
					
					return true;
				},
				onLinkDelete: function(linkId, tmp){
					
					return true;
				},
	            onLinkSelect: function(linkId){
	            	
	            	return false;
	            },
				onAfterChange: function(changeType){
					
					if(processEditMode && changeType != "operator_create"){
						
						processChgCheck.flag = true;
					}
					
					var errorList = $(".flowchart-operator.error");
					if(errorList.length > 0){
						errorList.removeClass("error");
					}
				},
				onOperatorSelect: function(operatorId){
					
					var errorList = $(".flowchart-operator.error");
					if(errorList.length > 0){
						errorList.removeClass("error");
					}
					return true;
				}
		});
		
		
		$("#processFlowLayerMain").on("click",".osl-flowchart__operator .flowchart-operator-menu .dropdown-menu .dropdown-item, button[data-flow-action]",function(){
			var flowAction = $(this).data("flow-action");
			
			if($.osl.isNull(selProcessId)){
				$.osl.alert($.osl.lang("prj1100.alert.selNoneProcess"));
				return false;
			}
			
			
			if(flowAction == "save"){
				
				var rtnValue = fnFlowDoneCheck();
				if(rtnValue === false){
					$.osl.toastr($.osl.lang("prj1100.alert.saveCancel"),{type: "warning"});
				}else{
					
					var startFlow = flowChart.flowchart("getOperatorData", rtnValue.startFlowId);
					
					var confirmMsg = $.osl.lang("prj1100.alert.processSave",startFlow.properties.title);
					
					$.osl.confirm(confirmMsg,{html: true},function(result) {
		    	        if (result.value) {
		    	        	fnProcessDataSave(rtnValue.startFlowId, rtnValue.endFlowId);
		    	        }
		    		});	
				}
			}
			
			else if(flowAction == "update"){
				var selFlowId = flowChart.flowchart("getSelectedOperatorId");
				if($.osl.isNull(selFlowId)){
					$.osl.alert($.osl.lang("prj1100.alert.selNoneFlow"));
					return false;
				}
				
				var flowData = flowChart.flowchart("getOperatorData",selFlowId);
				
				if(flowData.properties.flowDoneCd == "01"){
					$.osl.alert($.osl.lang("prj1100.alert.flowDoneUpdateErr"),{type: 'error'});
					return false;
				}
				
				var data = {
						type:"update",
						paramPrjGrpId: $.osl.selPrjGrpId,
						paramPrjId: $.osl.selPrjId,
						paramProcessId: selProcessId,
						paramFlowId: selFlowId
				};
				var options = {
					autoHeight: false,
					modalSize: "xl",
					idKey: selProcessId,
					modalTitle: $.osl.lang("prj1102.update.title"),
					closeConfirm: false,
				};
				
				$.osl.layerPopupOpen('/prj/prj1000/prj1100/selectPrj1102View.do',data,options);
			}
			
			else if(flowAction == "delete"){
				var selFlowId = flowChart.flowchart("getSelectedOperatorId");
				if($.osl.isNull(selFlowId)){
					$.osl.alert($.osl.lang("prj1100.alert.selNoneFlow"));
					return false;
				}
				
				
				fnFlowDelete(selFlowId);
			}
			
			else if(flowAction == "detail"){
				var selFlowId = flowChart.flowchart("getSelectedOperatorId");
				if($.osl.isNull(selFlowId)){
					$.osl.alert($.osl.lang("prj1100.alert.selNoneFlow"));
					return false;
				}
				
				var data = {
						paramPrjGrpId: $.osl.selPrjGrpId,
						paramPrjId: $.osl.selPrjId,
						paramProcessId: selProcessId,
						paramFlowId: selFlowId,
						paramFlowchartTarget: "#flowChartDiv"
				};
				var options = {
					autoHeight: false,
					modalSize: "xl",
					idKey: selProcessId,
					modalTitle: $.osl.lang("prj1103.insert.title"),
					closeConfirm: false,
				};
				
				$.osl.layerPopupOpen('/prj/prj1000/prj1100/selectPrj1103View.do',data,options);
			}
			
			else if(flowAction == "zommCtrl"){
				var zoomAction = $(this).data("zoom");
				
				
				if($.osl.isNull(zoomAction)){
					return true;
				}else{
					fnFlowChartZoom(zoomAction);
				}
			}
			
			else if(flowAction == "insert"){
				var data = {
						type:"insert",
						paramPrjGrpId: $.osl.selPrjGrpId,
						paramPrjId: $.osl.selPrjId,
						paramProcessId: selProcessId
				};
				var options = {
					autoHeight: false,
					modalSize: "xl",
					idKey: selProcessId,
					modalTitle: $.osl.lang("prj1102.insert.title"),
					closeConfirm: false,
				};
				
				$.osl.layerPopupOpen('/prj/prj1000/prj1100/selectPrj1102View.do',data,options);
			}
			
			else if(flowAction == "reload"){
				
				flowChart.flowchart("setData",{});
				
				
				fnSelectFlowList();
				
				
				fnFlowChartZoom("reset");
				
				processEditMode = true;
				
				
				flowRemoveList = [];
				flowAddList = [];
				
				processChgCheck.flag = false;
			}
		});
		
		zoomObj = panzoom(flowChart[0],{
			maxZoom: 2,
			minZoom: 0.5,
		});
		
		
		zoomObj.on('zoom', function(e) {
			flowChart.flowchart('setPositionRatio', e.getTransform().scale);
		});
		
		
		new KTOffcanvas($("#kt_inbox_aside")[0], {
            overlay: true,  
            baseClass: 'kt-inbox__aside',
            toggleBy: 'osl-inbox__aside-menu-bar'
        });
		
		prj1100Datatable = $.osl.datatable.setting("prj1100PrjTable",{
			cardUiTarget: $("#prj1100CardTable"),
			data: {
				source: {
					read: {
						url: "/prj/prj1000/prj1100/selectPrj1100ProcessListAjax.do",
						params:{
							delCd: "02"
						}
					}
				},
				pageSize : 5,
			},
			toolbar:{
				layout: ['pagination'],
				items:{
					pagination:{
						pages: {
							desktop: {
								layout: 'compact'
							},
							tablet: {
								layout: 'compact'
							},
						},
					 },
					 info: false
				 }
			},
			columns: [
				{field: 'processId', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'processId', title: '프로세스 ID', textAlign: 'center', width: 150, search: true},
				{field: 'processNm', title: '프로세스명', textAlign: 'center', width: 100, search: true},
			],
			actionBtn:{
				"update": false,
				"delete": false
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					var data = {type:"insert"};
					var options = {
							autoHeight: false,
							modalSize: "xl",
							idKey: datatableId,
							modalTitle: $.osl.lang("prj1101.insert.title"),
							closeConfirm: false,
						};
					
					$.osl.layerPopupOpen('/prj/prj1000/prj1100/selectPrj1101View.do',data,options);
				},
				"update":function(rowData, datatableId, type, rowNum, elem){
					var data = {
							type:"update",
							paramPrjGrpId: rowData.prjGrpId,
							paramPrjId: rowData.prjId,
							paramProcessId: rowData.processId,
					};
					var options = {
							autoHeight: false,
							modalSize: "xl",
							idKey: datatableId,
							modalTitle: $.osl.lang("prj1101.update.title"),
							closeConfirm: false,
						};
					
					$.osl.layerPopupOpen('/prj/prj1000/prj1100/selectPrj1101View.do',data,options);
				},
				"delete":function(rowDatas, datatableId, type, rowNum, elem){
					
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/prj/prj1000/prj1100/deletePrj1100ProcessInfoAjax.do'/>"}
							,{deleteDataList: JSON.stringify(rowDatas)});
					
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
			   				$.osl.alert(data.message,{type: 'error'});
			   			}else{
			   				
			   				$.osl.toastr(data.message);
			   				
			   				
							fnSelectFlowList();
			   			
			   				
			   				if(!$.osl.isNull($.osl.datatable.list[datatableId])){
				   				$.osl.datatable.list[datatableId].targetDt.reload();
			   				}
			   			}
					});
					
					
					ajaxObj.send();
				},
				"click": function(rowData, datatableId, type, rowNum, elem){
					
					if($(".osl-datatable__card.active")[0] == elem){
						return false;
					}
					var innerFn = function(rowData, datatableId, type, rowNum, elem){
						
						selProcessId = rowData.processId;
						
						
						flowChart.flowchart("setData",{});
						
						
						fnSelectFlowList();
						
						
						$("#flowMaskDiv").hide();
						 
						
						flowChart.removeClass("kt-hidden");
						
						
						fnFlowChartZoom("reset");
						
						processEditMode = true;
						
						
						flowRemoveList = [];
						flowAddList = [];
						
						
						prj1100Datatable.targetDt.setActive(rowData.processId);
						
						
						var beforeSelProcess = $(elem).parent().find(".osl-datatable__card.active");
						var beforeProcessId = beforeSelProcess.data("process-id");
						prj1100Datatable.targetDt.setInactive(beforeProcessId);
						
						
						beforeSelProcess.removeClass("active");
						$(elem).addClass("active");
						
						processChgCheck.flag = false;
					}
					
					
					if($(".osl-datatable__card.active").length > 0 && processEditMode && processChgCheck.flag){
						
						var rtnValue = fnFlowDoneCheck();
						if(rtnValue === false){
							$.osl.confirm($.osl.lang("prj1100.alert.saveBefore"),{html: true},function(result) {
				    	        if (result.value) {
				    	        	innerFn(rowData, datatableId, type, rowNum, elem);
				    	        }
				    		});
						}else{
							
							var startFlow = flowChart.flowchart("getOperatorData", rtnValue.startFlowId);
							
							var confirmMsg = $.osl.lang("prj1100.alert.processSave",startFlow.properties.title);
							
							$.osl.confirm(confirmMsg,{html: true},function(result) {
				    	        if (result.value) {
				    	        	fnProcessDataSave(rtnValue.startFlowId, rtnValue.endFlowId);
				    	        }
				    		});
						}
						
					}else{
						innerFn(rowData, datatableId, type, rowNum, elem);
					}
				}
			},
			callback:{
				initComplete: function(evt,config){
					$("#prj1100PrjTable .kt-datatable__table").css({visibility: "hidden", height: 0});
					$("#prj1100CardTable").show();
				},
				ajaxDone: function(evt, list){
					var processStr = '';
					$.each(list, function(idx, map){
						var active = '';
						if(idx == 0){
							active = "kt-nav__item--active";
						}
						
						
						var useIcon = "fa-eye osl-favorites--active";
						if(map.processConfirmCd == "01"){
							useIcon = "fa-eye-slash";
						}
						
						
						processStr +=
							'<li class="kt-nav__item osl-datatable__card" data-datatable-rownum="'+idx+'" data-process-id="'+map.processId+'">'
								+'<a href="#" class="kt-nav__link" data-action="list" data-type="inbox" title="'+$.osl.escapeHtml(map.processNm)+'" data-toggle="kt-tooltip" data-skin="brand" data-placement="top">'
									+'<i class="kt-nav__link-icon fa '+useIcon+' osl-process-confirm__button"></i>'
									+'<span class="kt-nav__link-text osl-max-w-px-120">'+$.osl.escapeHtml(map.processNm)+'</span>'
									+'<div class="dropdown dropdown-inline osl-display__flex-r">'
										
										+'<button type="button" class="kt-inbox__icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'
											+'<i class="flaticon-more kt-font-lg"></i>'
										+'</button>'
										+'<div class="dropdown-menu dropdown-menu-right">'
											+'<div class="dropdown-item" data-datatable-id="prj1100PrjTable" data-datatable-expans="dropdown" data-datatable-action="update"><i class="fa fa-edit kt-font-brand"></i>수정</div>'
											+'<div class="dropdown-item" data-datatable-id="prj1100PrjTable" data-datatable-expans="dropdown" data-datatable-action="delete"><i class="fa fa-trash kt-font-brand"></i>삭제</div>'
											
										+'</div>'
									+'</div>'
									+'<div class="osl-process__dtm"><i class="fa fa-clock kt-margin-r-5"></i>'+map.regDtm+'</div>'
								+'</a>'
							+'</li>';
					});
					
					
					$("#prj1100CardTable").html(processStr);
					
					
					$(".osl-datatable__card i.osl-process-confirm__button").click(function(event){
						
						event.cancelable = true;
						event.stopPropagation();
						event.preventDefault();
						event.returnValue = false;
						
						
						var cardTarget = $(this).parents(".osl-datatable__card");
						var rownum = cardTarget.data("datatable-rownum");
						
						
						var processInfo = prj1100Datatable.targetDt.lastResponse.data[rownum];
						
						
						var processConfirmCd = processInfo.processConfirmCd;
						
						var confirmMsg = $.osl.lang("prj1100.alert.processConfirmCdChg",processInfo.processNm);
						
						
						if(processConfirmCd == "02"){
							confirmMsg += $.osl.lang("prj1100.alert.processNoneUse");
						}
						var chgProcessConfirmCd = (processConfirmCd == "01")?"02":"01";
						
						$.osl.confirm(confirmMsg,{html: true},function(result) {
			    	        if (result.value) {
			    	        	
			    	       		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/prj/prj1000/prj1100/savePrj1100ProcessInfoAjax.do'/>"}
			    	       		,{paramPrjGrpId: processInfo.prjId, paramProcessId: processInfo.processId, processConfirmCd: chgProcessConfirmCd, type: "update"});
			    	        	
			    	       		
			    	       		ajaxObj.setFnSuccess(function(data){
			    	       			if(data.errorYn == "Y"){
			    	       				$.osl.alert(data.message,{type: 'error'});
			    	       			}else{
			    	       				
			    	       				$.osl.toastr(data.message);
			    	       				
			    	       				
			    	       				prj1100Datatable.targetDt.reload();
			    	       			}
			    	       		});
			    	       		
			    	       		
			    	       		ajaxObj.send();
			    	        }
			    		});	 
					});
				}
			}
		});
	};
	
	
	var fnLinksLimitLoopChk = function(fromOperatorId, toOperatorId){
		
		if(fromOperatorId == toOperatorId){
			return false;
		}
		
		
		var fromOperator = flowChart.flowchart("getOperatorData", fromOperatorId);
		var toOperator = flowChart.flowchart("getOperatorData", toOperatorId);
		
		
		if(toOperator.properties.hasOwnProperty("flowNextId") && toOperator.properties.flowNextId.length > 0){
			var toOperatorFlowNextId = toOperator.properties.flowNextId;
			
			var rtnValue = true;
			
			$.each(toOperatorFlowNextId, function(idx, nextFlowId){
				
				if($.osl.isNull(toOperatorFlowNextId)){
					return true;
				}else{
					
					if(!fnLinksLimitLoopChk(fromOperatorId,nextFlowId)){
						rtnValue = false;
						return false;
					}
				}
			});
			
			return rtnValue;
		}else{
			return true;
		}
	};

	
	var fnFlowDoneCheck = function(){ 
		var flowList = flowChart.flowchart("getData").operators;
		
		
		if(Object.keys(flowList).length == 1){
			$.osl.alert($.osl.lang("prj1100.alert.flowSizeChk") ,{type: "error"});
			return false;
		}
		
		
		var flowKeys = Object.keys(flowList);
		
		var doneFlowIds = [];
		
		
		$.each(flowList, function(flowId, flowData){
			var flowNextId = flowData.properties.flowNextId;
			
			
			if(!$.osl.isNull(flowNextId) && flowNextId.length > 0){
				$.each(flowNextId, function(idx, value){
					var flowIdx = flowKeys.indexOf(value);
					
					
					if(flowIdx == -1){
						return true;
					}else{
						
						flowKeys.splice(flowIdx,1);
					}
					
				})
			}else{
				
				doneFlowIds.push(flowId); 
			}
		});
		
		var errorAlert = [];
		
		
		if(flowKeys.length > 1){
			$.each(flowKeys, function(idx, map){
				$(".flowchart-operator[data-operator-id="+map+"]").addClass("error");
			});
			
			errorAlert.push($.osl.lang("prj1100.alert.manyStartFlow",flowKeys.length));
		}
		
		
		if(doneFlowIds.length > 1){
			$.each(doneFlowIds, function(idx, map){
				$(".flowchart-operator[data-operator-id="+map+"]").addClass("error");
			});
			
			errorAlert.push($.osl.lang("prj1100.alert.manyEndFlow",doneFlowIds.length));
		}
		
		
		var doneOperator = flowChart.flowchart("getOperatorData", doneFlowIds[0]);
		if(doneOperator.properties.flowDoneCd != "01"){
			errorAlert.push($.osl.lang("prj1100.alert.flowDoneLinkChk"));
		}
			
		
		if(errorAlert.length > 0){
			$.osl.alert(errorAlert.join("</br>")+$.osl.lang("prj1100.alert.flowLinkCheck") ,{type: "error"});
			return false;
		}else{
			
			var startOperator = flowChart.flowchart("getOperatorData", flowKeys[0]);
			startOperator.properties.flowStartCd = "01";
			flowChart.flowchart("setOperatorData",flowKeys[0],startOperator);
			
			return {startFlowId: flowKeys[0], endFlowId: doneFlowIds[0]};
		}
	};
	
	
	var fnFlowChartZoom = function(type){
		
		if(type == "reset"){
			
			zoomObj.pause();
			
			
			zoomObj.moveTo(0,0);
			zoomObj.zoomAbs(0,0,1);
			
			
			zoomObj.resume();
			return true;
		}
		
		var possibleZooms = [2,1.5,1,0.75,0.5];
		
		
		if(type == "in"){
			currentZoom--;
			if(currentZoom < 0){
				currentZoom = 0;
			}
		}
		
		else if(type == "out"){
			currentZoom++;
			if(currentZoom > (possibleZooms.length-1)){
				currentZoom = (possibleZooms.length-1);
			}
		}
		
		zoomObj.zoomAbs(0,0,possibleZooms[currentZoom]);
	}
	
	
	var fnSelectFlowList = function(){
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100FlowListAjax.do'/>"}
				,{paramPrjId: $.osl.selPrjId, paramProcessId: selProcessId});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				flowChart.flowchart("setData",{});
   				
   				
   				var flowList = data.flowList;
   				var flowLinkList = data.flowLinkList;
   				
   				processEditMode = false;
   				
   				if(!$.osl.isNull(flowList) && flowList.length > 0){
   					var flowNextIdList = {};
   					
   					
   					if(!$.osl.isNull(flowLinkList) && flowLinkList.length > 0){
   						$.each(flowLinkList, function(idx, map){
   							
   							if(!flowNextIdList.hasOwnProperty(map.flowId)){
   								flowNextIdList[map.flowId] = [];
   							}
   							flowNextIdList[map.flowId].push(map.flowNextId);
   						});
   					}
   				
   					$.each(flowList, function(idx, map){
   						var flowNextId = [];
   						if(flowNextIdList.hasOwnProperty(map.flowId)){
   							flowNextId = flowNextIdList[map.flowId];
   						}
   						
   		   				var operatorData = {
   							top: map.flowTop,
   							left: map.flowLeft,
   							properties: {
   								id: map.flowId,
   								flowNextId: flowNextId,
   								title: $.osl.escapeHtml(map.flowNm),
   								flowDesc: $.osl.escapeHtml(map.flowDesc),
   								editable: true,
   								inputs: {input_1: {label: '이전'}},
   								outputs: {output_1: {label: '다음'}},
   								flowTitleBgColor: map.flowTitleBgColor,
   								flowTitleColor: map.flowTitleColor,
   								flowSignCd: map.flowSignCd,
   								flowSignStopCd: map.flowSignStopCd,
   								flowStartCd: map.flowStartCd,
   								flowDoneCd: map.flowDoneCd,
   								flowWorkCd: map.flowWorkCd,
   								flowRevisionCd: map.flowRevisionCd,
   								flowDplCd: map.flowDplCd,
   								flowAuthCd: map.flowAuthCd,
   								flowMiddleEndCd: map.flowMiddleEndCd,
   								basicItemList: map.basicItemList
   							}
   						};
   		   				
   		   			flowChart.flowchart('createOperator', map.flowId, operatorData);
   					});
   					
   					
   					if(!$.osl.isNull(flowLinkList) && flowLinkList.length > 0){
   						$.each(flowLinkList, function(idx, map){
   							
   							var linkData = {
   		   							fromConnector: "output_1",
   		   							fromOperator: map.flowId,
   		   							fromSubConnector: 0,
   		   							toConnector: "input_1",
   		   							toOperator: map.flowNextId,
   		   							toSubConnector: 0
   		   						};
   							
   							flowChart.flowchart('createLink', idx, linkData);
   						});
   					}
   				}
   				
   				
   				processEditMode = true;
   			
   				
   			}
		});
		
		
		ajaxObj.send();
	}
	
	
	var fnProcessDataSave = function(startFlowId, endFlowId){
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1100/savePrj1100ProcessDataInfo.do'/>"}
				,{
					paramPrjId: $.osl.selPrjId
					, paramProcessId: selProcessId
					, processData: JSON.stringify(flowChart.flowchart("getData").operators)
					, addData: JSON.stringify(flowAddList)
					, removeData: JSON.stringify(flowRemoveList)
					, startFlowId: startFlowId
					, endFlowId: endFlowId
				});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				$.osl.toastr(data.message);
   				
	        	processChgCheck.flag = false;
	        	
				flowRemoveList = [];
				flowAddList = [];
				
				
				fnSelectFlowList();
   			}
		});
		
		
		ajaxObj.send();
	}
	
	
	var fnFlowDelete = function(selFlowId){
		var flowData = flowChart.flowchart("getOperatorData",selFlowId);
		
		
		if(flowData.properties.flowDoneCd == "01"){
			$.osl.alert($.osl.lang("prj1100.alert.flowDoneDelErr"),{type: 'error'});
			return false;
		}
		
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/prj/prj1000/prj1100/selectPrj1100FlowReqListCnt.do'/>"}
				,{paramPrjId: $.osl.selPrjId, paramProcessId: selProcessId, paramFlowId: selFlowId});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				var flowReqListCnt = data.reqListCnt;
   				
   				
   				if($.osl.isNull(flowReqListCnt) || flowReqListCnt == 0){
   					
   					$.osl.confirm($.osl.lang("prj1100.alert.deleteFlow",flowData.properties.title),{html: true},function(result) {
		    	        if (result.value) {
		    	        	
		    	        	var flowList = flowChart.flowchart("getData").operators;
		    	        	$.each(flowList, function(flowId, flowData){
		    	        		if(flowData.properties.hasOwnProperty("flowNextId")){
		    	        			$.each(flowData.properties.flowNextId,function(idx, flowNextId){
		    	        				
		    	        				if(flowNextId == selFlowId){
		    	        					
		    	        					flowData.properties.flowNextId.splice(idx, 1);
		    	        					flowChart.flowchart("setOperatorData",flowId,flowData);
		    	        					return false;
		    	        				}
		    	        			});
		    	        		}
		    	        	});
		    	        	
		    	        	flowChart.flowchart("deleteOperator",selFlowId);
		    	        	
		    	        	
		    	        	if(flowAddList.indexOf(selFlowId) != -1){
		    	        		flowAddList.splice(flowAddList.indexOf(selFlowId),1);
		    	        	}else{
			    	        	flowRemoveList.push(selFlowId);
		    	        	}
		    	        }
		    		});	
   				}else{
   					$.osl.alert($.osl.lang("prj1100.alert.deleteReqCheck",flowReqListCnt),{type: 'error'});
   				}
   			}
		});
		
		
		ajaxObj.send();
	}
	
	
	var fnFlowNmSearch = function(){
		
		if($.osl.isNull(selProcessId)){
			$.osl.alert($.osl.lang("prj1100.alert.selNoneProcess"));
			return false;
		}

		
		$(".osl-flowchart__operator.error").removeClass("error");
		
		
		var left = 0;
		var top = 0;
		
		
		var searchText = $("#flowNmSearchInput").val().replace(/(\s*)/g, "");
		searchText = searchText.toUpperCase();
		var searchFlag = false;
		
		
		if($.osl.isNull(searchText)){
			$.osl.alert($.osl.lang("prj1100.alert.searchEmpty"));
			return false;
		}
		
		
		var flowList = flowChart.flowchart("getData").operators;
		$.each(flowList, function(flowId, map){
			var flowNm = map.properties.title.replace(/(\s*)/g, "");
			flowNm = flowNm.toUpperCase();
			
			var elem = $(".osl-flowchart__operator[data-operator-id="+flowId+"]");
			
			
			if(flowNm.search(searchText) > -1){
				if(left == 0 && top == 0){
					left = map.left;
					top = map.top;
					searchFlag = true;
				}
				elem.addClass("error");
			}
		});
		
		
		var widthDefault = $(".osl-process__flow-container").width()/2;
		var heightDefault = $(".osl-process__flow-container").height()/2;
		
		if(searchFlag){
			left = (widthDefault - left);
			top = (heightDefault - top);
		}
		
		zoomObj.pause();
		
		
		zoomObj.moveTo(left,top);
		zoomObj.zoomAbs(left,top,1);
		
		
		zoomObj.resume();
	};
	
	return {
        
        init: function() {
        	documentSetting();
        },
        setFlowAddList: function(flowId){
        	flowAddList.push(flowId);
        }
    };
}();

$.osl.ready(function(){
	OSLPrj1100Popup.init();
});
</script>
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
