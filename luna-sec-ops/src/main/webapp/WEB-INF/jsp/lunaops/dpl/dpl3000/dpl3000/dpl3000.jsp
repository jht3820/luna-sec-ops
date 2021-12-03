<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />

<div class="kt-portlet kt-portlet--mobile">

<div id="dpl3000CardTable" class="kt-hide">
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 col-12">
			
			<div class="kt-portlet kt-portlet--mobile border">
				
				<div class="kt-portlet__head kt-portlet__head--lg border-bottom-0 osl-ribbon osl-ribbon__clip osl-ribbon__right ">
					
					<div class="kt-portlet__head-label">
						<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid">
							<input type="checkbox" value="'+idx+'" name="prjGrpCheckbox"
							id="prjGrpCheckbox_'+map.prjId+'"
							data-datatable-id="dpl3000DplTable">&nbsp;<span></span>
						</label>
						<h4 class="kt-padding-l-10 font-weight-bold">배포 실행 이름</h4>
					</div>
					
					
					<div class="kt-portlet__head-toolbar">
						<div class="kt-user-card-v2 btn kt-margin-r-100">
							<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">
								<img src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000088" class="">
							</div>
							<div class="kt-user-card-v2__details">
								<span class="kt-user-card-v2__name">관리자</span>
							</div>
						</div>
						<div class="osl-ribbon__target" style="top: 15px; height: 45px;">
							<span class="osl-ribbon__inner kt-bg-brand"></span>
							<div class="kt-font-xl kt-margin-r-10  osl-cursor-pointer osl-ribbon__btn" data-view-type="01"><i class="fas fa-play-circle text-white"></i></div>
							<div class="kt-font-xl osl-cursor-pointer osl-ribbon__btn" data-view-type="02"><i class="fas fa-file-code text-white"></i></div>
							<div class="osl-ribbon__shadow">
								<i class="fas fa-caret-right"></i>
							</div>
						</div>
					</div>
					
				</div>

				<div class="kt-portlet__body kt-padding-t-0">
					<div class="row">
						
						<div
							class="kt-padding-l-50 kt-padding-b-15 col-lg-4 col-md-4 col-sm-12 osl-mobile-padding-l-10">
							<div class="kt-padding-b-5">
								<h5>배포 실행 설명</h5>
							</div>
						</div>
						
					</div>
					

					
					<div class="row kt-margin-t-20">
						
						<div class="col-lg-6 col-md-6 col-sm-6 col-6">
							<div class="osl-widget">
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon kt-margin-l-100-desktop">
										<img src="/media/osl/icon/reqAll.png">
									</div>
									<div class="osl-widget-info__item-info kt-padding-r-50-desktop">
										<a href="#" class="osl-widget-info__item-title">배정 JOB</a>
										<div class="osl-widget-info__item-desc">
											<span>100</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-6">
							<div class="osl-widget">
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon kt-margin-l-100-desktop">
										<img src="/media/osl/icon/reqAll.png">
									</div>
									<div class="osl-widget-info__item-info kt-margin-r-50-desktop">
										<a href="#" class="osl-widget-info__item-title">배정 JOB</a>
										<div class="osl-widget-info__item-desc">
											<span>100</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					
					
					
					<div class="kt-margin-t-20">
						<div class="osl-progress">
							<div class="kt-padding-b-5">
								<i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i>
								<span>배포 진행률</span>
							</div>
							<div class="progress osl-prj-group-md">
								<div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100">78%</div>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-12">
			
			<div class="kt-portlet kt-portlet--mobile border">
				
				<div class="kt-portlet__head kt-portlet__head--lg border-bottom-0  osl-ribbon osl-ribbon__clip osl-ribbon__right">
					
					<div class="kt-portlet__head-label">
						<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid">
							<input type="checkbox" value="'+idx+'" name="prjGrpCheckbox" id="prjGrpCheckbox_'+map.prjId+'" data-datatable-id="dpl3000DplTable">&nbsp;<span></span>
						</label>
						<h4 class="kt-padding-l-10 font-weight-bold">배포 실행 이름</h4>
					</div>
					
					
					
					<div class="kt-portlet__head-toolbar">
						<div class="kt-user-card-v2 btn kt-margin-r-100">
							<div class="kt-user-card-v2__pic kt-media kt-media--sm kt-media--circle">
								<img src="/cmm/fms/getImage.do?fileSn=0&amp;atchFileId=FILE_000000000000088" class="">
							</div>
							<div class="kt-user-card-v2__details">
								<span class="kt-user-card-v2__name">관리자</span>
							</div>
						</div>
						<div class="osl-ribbon__target" style="top: 15px; height: 45px;">
							<span class="osl-ribbon__inner kt-bg-brand"></span>
							<div class="kt-font-xl kt-margin-r-10 osl-cursor-pointer osl-ribbon__btn" data-view-type="01"><i class="fas fa-play-circle text-white"></i></div>
							<div class="kt-font-xl osl-cursor-pointer osl-ribbon__btn" data-view-type="02"><i class="fas fa-file-code text-white"></i></div>
							<div class="osl-ribbon__shadow">
								<i class="fas fa-caret-right"></i>
							</div>
						</div>
					</div>
					
				</div>

				<div class="kt-portlet__body kt-padding-t-0">
					<div class="row">
						
						<div
							class="kt-padding-l-50 kt-padding-b-15 col-lg-4 col-md-4 col-sm-12 osl-mobile-padding-l-10">
							<div class="kt-padding-b-5">
								<h5>배포 실행 설명</h5>
							</div>
						</div>
						
					</div>
					

					
					<div class="row kt-margin-t-20">
						
						<div class="col-lg-6 col-md-6 col-sm-6 col-6">
							<div class="osl-widget">
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon kt-margin-l-100-desktop">
										<img src="/media/osl/icon/reqAll.png">
									</div>
									<div class="osl-widget-info__item-info kt-padding-r-50-desktop">
										<a href="#" class="osl-widget-info__item-title">배정 JOB</a>
										<div class="osl-widget-info__item-desc">
											<span>100</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-6">
							<div class="osl-widget">
								<div class="osl-widget-info__item">
									<div class="osl-widget-info__item-icon kt-margin-l-100-desktop">
										<img src="/media/osl/icon/reqAll.png">
									</div>
									<div class="osl-widget-info__item-info kt-margin-r-50-desktop">
										<a href="#" class="osl-widget-info__item-title">배정 JOB</a>
										<div class="osl-widget-info__item-desc">
											<span>100</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					
					
					<div class="kt-margin-t-20">
						<div class="osl-progress">
							<div class="kt-padding-b-5">
								<i class="fa fa-chart-line kt-font-brand kt-margin-r-5"></i>
								<span>배포 진행률</span>
							</div>
							<div class="progress osl-prj-group-md">
								<div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100">78%</div>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>


	
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><c:out value="${sessionScope.selMenuNm}"/>
			</h4>
		</div>
		
		<div class="kt-portlet__head-toolbar">
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl3000DplTable" data-datatable-action="select" title="배포 계획 목록 조회" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="5"><i class="fa fa-list"></i><span>조회</span></button>
			<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl3000DplTable" data-datatable-action="execute" title="배포 실행" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="7"><i class="far fa-play-circle"></i><span>실행</span></button>
			<!-- <button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="dpl3000DplTable" data-datatable-action="stop" title="배포 중지" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="8"><i class="far fa-stop-circle"></i><span>중지</span></button>
			begin :: dropdown 버튼
			<div class="dropdown dropdown-inline">
				<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-spinner kt-margin-r-5"></i> 배포 실행 중(<span>2</span>)
				</button>
				<div class="dropdown-menu dropdown-menu-right kt-padding-0">
					<div class="dropdown-item kt-padding-5 border-bottom osl-action-plan-btn" id="">
						<div class="progress osl-prj-group-md w-100 position-relative">
							<div class="progress-bar progress-bar-striped kt-bg-brand osl-gradient-brand-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
							<div class="position-absolute kt-font-md w-100 text-center kt-font-bolder kt-padding-t-5"><span>배포계획 C</span> (<span>50</span>%)</div>
						</div>
					</div>
					<div class="dropdown-item kt-padding-5 osl-action-plan-btn" id="">
						<div class="progress osl-prj-group-md w-100 position-relative">
							<div class="progress-bar progress-bar-striped kt-bg-brand osl-gradient-brand-bar" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
							<div class="position-absolute kt-font-md w-100 text-center kt-font-bolder kt-padding-t-5"><span>배포계획 D</span> (<span>70</span>%)</div>
						</div>
					</div>
				</div>
			</div> -->
		</div>
		
	</div>
	<div class="kt-portlet__body">
		
		<div class="col-lg-3 col-md-6 col-sm-12 kt-padding-r-0">
			<div class="osl-datatable-search" data-datatable-id="dpl3000DplTable"></div>
		</div>
		<div class="kt_datatable osl-datatable-footer__divide" id="dpl3000DplTable"></div>
		
	</div>
</div>



<script>
"use strict";
var OSLDpl3000Popup = function () {
	
	var documentSetting = function(){
		
		
		var currentViewType = "02";
		var popupViewType;
		
		$.osl.datatable.setting("dpl3000DplTable",{
			data: {
				source: {
					read: {
						url: "/dpl/dpl1000/dpl1000/selectDpl1000DplListAjax.do"
					}
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
				{field: 'dplSignUseNm', title: '결재 사용 유무', textAlign: 'center', width: 120, search: true, searchType:"select", searchCd: "CMM00001", searchField:"dplSignUseCd", sortField: "dplSignUseCd"},
				{field: 'nowSignTypeNm', title: '결재 상태', textAlign: 'center', width: 90, search: true, searchType:"select", searchCd: "REQ00008", searchField:"nowSignTypeCd", sortField: "nowSignTypeCd"
					,template: function(row){
						var nowSignTypeNm = row.nowSignTypeNm
						if($.osl.isNull(nowSignTypeNm)){
							nowSignTypeNm = "-";
						}
						return nowSignTypeNm;
					}
				},
				{field: 'lastSignUsrNm', title: '결재자', textAlign: 'center', width: 100, search: true
					,template: function(row){
						var lastSignUsrNm = row.lastSignUsrNm
						
						if($.osl.isNull(lastSignUsrNm)){
							lastSignUsrNm = "-";
						}else{
							
							lastSignUsrNm = $.osl.user.usrImgSet(row.lastSignUsrId, row.lastSignUsrNm);
						}
						return lastSignUsrNm;
					},
					onclick: function(rowData){
						
						if(!$.osl.isNull(rowData.lastSignUsrId)){
							
							$.osl.user.usrInfoPopup(rowData.lastSignUsrId);
						}
					}
				},
				{field: 'dplStsNm', title: '배포 상태', textAlign: 'center', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "DPL00001", searchField:"dplStsCd", sortField: "dplStsCd"},
				{field: 'dplVer', title: '배포 버전', textAlign: 'center', width: 100, search: true},
				{field: 'dplNm', title: '배포 명', textAlign: 'left', width: 300, autoHide: false, search: true},
				{field: 'dplTypeNm', title: '배포 방법', textAlign: 'center', width: 70, autoHide: false, search: true, searchType:"select", searchCd: "DPL00003", searchField:"dplTypeCd", sortField: "dplTypeCd"},
				{field: 'dplRevisionNum', title: '배포 리비전 번호', textAlign: 'center', width: 100
					,template: function(row){
						var dplRevisionNum = row.dplRevisionNum;
						
						if($.osl.isNull(dplRevisionNum)){
							dplRevisionNum = "Last Revision";
						}
						return dplRevisionNum;
					}
				},
				{field: 'dplDt', title: '배포 일자', textAlign: 'center', width: 100, search: true, searchType:"daterange"},
				{field: 'dplUsrNm', title: '배포자', textAlign: 'center', width: 100, search: true
					,template: function (row) {
						return $.osl.user.usrImgSet(row.dplUsrImgId, row.dplUsrNm);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.dplUsrId);
					}
				},
			],
			actionBtn:{
				"title":"기능 버튼",
				"width" : 120,
				"insert":false,
				"update":false,
				"delete":false,
				"execute":true,
				"dblClick": true,
				"buildHistory": true
			},
			actionTooltip:{
				"execute":"배포 실행",
				"dblClick": "배포 계획 상세 보기",
				"buildHistory": "실행 이력 보기"
			},
			searchColumns:[
				{field: 'dplDesc', title:"배포 설명", searchOrd: 8}
			],
			actionFn:{
				
				"execute":function(rowDatas, datatableId, type, rowNum, elem){
					
					var rowDataList = [];
					
					
					if(type == "info"){
						rowDataList.push(rowDatas);
					}else if(type == "list"){
						rowDataList = rowDatas;
					}
					
					if($.osl.isNull(rowDataList) || rowDataList.length == 0){
						$.osl.alert("실행할 배포 계획을 선택하세요.", {type: "warning"});
						return false;
					}
					
					if(rowDataList.length > 1){
						$.osl.alert("1건의 배포 계획만 선택해주세요.", {type: "warning"});
						return false;
					}
					
					var selDplData = rowDataList[0];
					
					
					var dplTypeCd = selDplData.dplTypeCd;
					
					if(dplTypeCd == "01"){
						$.osl.alert("수동 배포인 배포계획만 선택해 주세요.", {type: "warning"});
						return false;
					}
					
					
					var dplSignUseCd = selDplData.dplSignUseCd;
					if(dplSignUseCd == "01"){
						
						var signCd = selDplData.nowSignTypeCd;
						
						if(signCd != "03"){
							$.osl.alert("결재 승인된 배포 계획만 배포 실행 가능합니다.", {type: "warning"});
							return false;
						}
					}
					
					var prjId = selDplData.prjId;
					var dplId = selDplData.dplId;
					var dplUsrId = selDplData.dplUsrId;
					var dplNm = selDplData.dplNm;
					
					
					var data = {
							paramPrjId: prjId,
							paramDplId: dplId,
							paramDplUsrId: dplUsrId
					};
						
					var options = {
						idKey: prjId+"_"+dplId,
						modalTitle: "["+ dplNm +"] "+'배포 계획 실행',
						modalSize: 'xl',
						autoHeight: false,
						closeConfirm: false
					};
						
					$.osl.layerPopupOpen('/dpl/dpl3000/dpl3000/selectDpl3001View.do',data,options);
				},
				"dblClick":function(rowData, datatableId, type, rowNum, elem){
					var data = {
							paramPrjId : rowData.prjId,
							paramDplId : rowData.dplId
						};
					var options = {
							idKey: datatableId +"_"+ rowData.dplId,
							modalTitle: "["+rowData.dplNm +"] "+ "상세 정보",
							autoHeight: false,
							modalSize: 'xl'
						};
					
					$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1002View.do',data,options);
				},
				
				"stop":function(rowDatas, datatableId, type, rowNum, elem){
					
					if(rowDatas.length == 0){
						$.osl.alert("중지할 배포 계획을 선택하세요.");
						return false;
					}
				},
				
				"buildHistory":function(rowData, datatableId, type, rowNum, elem){
					
					var paramPrjId = rowData.prjId;
					var paramDplId = rowData.dplId;
					var paramDplNm = rowData.dplNm;
					
					
					var data = {
							paramPrjId: paramPrjId,
							paramDplId: paramDplId
					};
						
					var options = {
						idKey: paramPrjId+"_"+paramDplId+"_bldHistory",
						modalTitle: "["+ paramDplNm +"] "+'배포 계획 실행 이력',
						modalSize: 'xl',
						autoHeight: false,
						closeConfirm: false
					};
						
					$.osl.layerPopupOpen('/dpl/dpl3000/dpl3000/selectDpl3002View.do',data,options);
				}
			},
			theme: {
				 actionBtnIcon:{
					 "execute" : "far fa-play-circle",
					 "buildHistory": "far fa-file-code"
				 }
			 },
			callback:{
				initComplete: function(evt,config){
					fnViewerChange();
				}
			}
		});
		
		
		$(".btn-view-type").click(function(){
			var viewType = $(this).data("view-type");
			
			
			$(".btn-view-type.active").removeClass("active");
			$(this).addClass("active");
			
			currentViewType = viewType;
			
			fnViewerChange();
		});

		
		var fnViewerChange = function(){
			
			
			if(currentViewType == "01"){
				$("#dpl3000DplTable .kt-datatable__table").css({visibility: "hidden", height: 0});
				$("#dpl3000CardTable").show();
			
			}else{	
				$("#dpl3000CardTable").hide();
				$("#dpl3000DplTable .kt-datatable__table").css({visibility: "visible",height: "auto"});
			}
		}	
		
		$(".osl-ribbon__btn").click(function(){
			popupViewType = $(this).data("view-type");
			btnPopupOpen();
		});
		
		$('.osl-action-plan-btn').click(function(){
			popupViewType = "01";
			btnPopupOpen();
		});
		
		
		var btnPopupOpen = function(){
			
			if(popupViewType == "01"){
				var data = {
				};
				var options = {
					modalTitle: '배포 계획실행',
					autoHeight: false,
					modalSize: 'xl'
				};
				$.osl.layerPopupOpen('/dpl/dpl3000/dpl3000/selectDpl3001View.do',data,options);
			}else{	
				var data = {
				};
				var options = {
					modalTitle: '배포 계획 실행 이력',
					autoHeight: false,
					modalSize: 'xl'
				};
				$.osl.layerPopupOpen('/dpl/dpl3000/dpl3000/selectDpl3002View.do',data,options);
			}
		}
	};

	
	
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLDpl3000Popup.init();
});
</script>

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />
