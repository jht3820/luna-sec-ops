<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<!-- begin :: form -->
<form class="kt-form" id="frDpl1001">
	<input type="hidden" id="type" name="type" value="${param.type}">
	<input type="hidden" id="paramPrjId" name="paramPrjId" value="${param.prjId}">
	<input type="hidden" id="dplUsrId" name="dplUsrId" value="">
	<div class="row">
		<!-- begin::배포 계획 정보 입력 영역 -->
		<div class="col-xl-5 col-lg-6 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
				<div class="kt-portlet__body">
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포 상태</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<select class="form-control kt-select2" id="dplStsCd" name="dplStsCd" disabled="disabled">
							</select>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 버전</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<input class="form-control" type="text" id="dplVer" name="dplVer" placeholder="배포 버전" maxlength="50" required />
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포 명</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<input class="form-control" type="text" id="dplNm" name="dplNm" placeholder="배포 명" maxlength="100" required/>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포 일자</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<!-- <input class="form-control" type="date" id="dplDt" name="dplDt" placeholder="배포 일자" required> -->
							<input class="form-control" type="date" id="dplDt" name="dplDt" placeholder="배포 일자" required/>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포자</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="배포자" id="dplUsrNm" name="dplUsrNm">
								<button type="button" class="btn btn-brand input-group-append search-usr__nm__btn" id="dpl1001DplUsrSearch"><span data-lang-cd="dpl1001.button.searchBtn">검색</span></button>
							</div>
						</div>
					</div>
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>결재 사용 유무</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<select class="form-control kt-select2" id="dplSignUseCd" name="dplSignUseCd">
							</select>
						</div>
					</div>
					<!-- <div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>결재자</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="결재자 이름" name="" id="">
								<button type="button" class="btn btn-brand input-group-append search-usr__nm__btn" id="" name=""><span data-lang-cd="dpl1001.button.searchBtn">검색</span></button>
							</div>
						</div>
					</div> -->	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 리비전</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="리비전 검색 후 선택" name="" id="">
								<button type="button" class="btn btn-brand input-group-append" id="" name=""><span data-lang-cd="dpl1001.button.searchBtn">검색</span></button>
							</div>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>배포 방법</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<select class="form-control kt-select2" id="dplTypeCd" name="dplTypeCd">
							</select>
						</div>
					</div>		
					<div class="form-group row kt-margin-b-10" data-dpltype-expans="auto">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>실패 후 처리</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<select class="form-control kt-select2" id="dplAutoAfterCd" name="dplAutoAfterCd">
							</select>
						</div>
					</div>
					<div class="form-group row kt-margin-b-10" data-dpltype-expans="auto">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>자동 실행 시간</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
						<!-- TODO -->
							<input type="text" class="form-control" id="dplAutoTm" name="dplAutoTm">
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10" data-dpltype-expans="auto">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i>원복 타입</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<select class="form-control kt-select2" id="dplRestoreCd" name="dplRestoreCd">
							</select>
						</div>
					</div>
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>결재요청 의견</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<textarea class="form-control" id="dplSignTxt" name="dplSignTxt" maxlength="1000"></textarea>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i>배포 설명</label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<textarea class="form-control" id="dplDesc" name="dplDesc" maxlength="500"></textarea>
						</div>
					</div>	
				</div>
			</div>	
		</div>
		<!-- end::배포 계획 정보 입력 영역 -->
		<!-- begin::배정된 JOB 표출 영역-->
		<div class="col-xl-7 col-lg-6 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label"></div>
					<div class="kt-portlet__head-toolbar">
						<!-- begin :: 버튼 영역 -->
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" id="dpl1001JobOrdUp" title="JOB 순서 위로" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="up" tabindex="5">
							<i class="fas fa-arrow-up"></i><span>위로</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" id="dpl1001JobOrdDown" title="JOB 순서 아래로" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="down" tabindex="6">
							<i class="fas fa-arrow-down"></i><span>아래로</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air osl-jop-append" id="dpl1001DplJobInsert" title="JOB 배정" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="7">
							<i class="fa fa-plus"></i><span>배정</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" id="dpl1001DplJobDelete" title="배정 JOB 삭제" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="8">
							<i class="fa fa-trash-alt"></i><span>삭제</span>
						</button>
						<!-- end :: 버튼 영역 -->
					</div>
				</div>
				<div class="kt-portlet__body">
					<div id="dpl1001CardTable">
						<!-- job 카드 1 -->
						<div class="kt-portlet border">
							<div class="kt-portlet__head">
								<div class="kt-portlet__head-label">
									<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0"><input type="checkbox">&nbsp;<span></span></label>
									<span class="osl-badge-brand osl-jenkins-card__num">No.<span class="dplStartOrdCell" ord="1">1</span></span>
									<span class="osl-badge-brand osl-badge-brand-outline osl-cursor-pointer" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" title="job type">빌드</span>
									<h5 class="kt-portlet__head-title kt-margin-l-10">
										<p class="kt-margin-b-0 kt-font-dark kt-font-sm">MAIN_JENKINS</p>JBEMS-build
									</h5>
								</div>
							</div>
							<div class="kt-portlet__body kt-padding-t-10 kt-padding-b-10">
								<div class="row">
									<div class="col-6">
										<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>JENKINS URL</label>
										<p class="kt-margin-b-0">http://www.oslab.kr:7081/jenkins</p>
									</div>
									<div class="col-6">
										<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>원복 JOB ID</label>
										<p class="kt-margin-b-0">-</p>
									</div>
								</div>
							</div>
						</div>
						<!-- svn 카드 2 -->
						<div class="kt-portlet border">
							<div class="kt-portlet__head">
								<div class="kt-portlet__head-label">
									<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0"><input type="checkbox">&nbsp;<span></span></label>
									<span class="osl-badge-brand osl-jenkins-card__num">No.<span class="dplStartOrdCell" ord="2">2</span></span>
									<span class="osl-badge-brand osl-badge-brand-outline osl-cursor-pointer" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" title="job type">빌드</span>
									<h5 class="kt-portlet__head-title kt-margin-l-10">
										<p class="kt-margin-b-0 kt-font-dark kt-font-sm">SW_JENKINS</p>SECMS_build
									</h5>
								</div>
							</div>
							<div class="kt-portlet__body kt-padding-t-10 kt-padding-b-10">
								<div class="row">
									<div class="col-6">
										<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>JENKINS URL</label>
										<p class="kt-margin-b-0">http://oslab.kr:7081/jenkins</p>
									</div>
									<div class="col-6">
										<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>원복 JOB ID</label>
										<p class="kt-margin-b-0">MIS-build</p>
									</div>
								</div>
							</div>
						</div>
						<!-- svn 카드 3 -->
						<div class="kt-portlet border">
							<div class="kt-portlet__head">
								<div class="kt-portlet__head-label">
									<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0"><input type="checkbox">&nbsp;<span></span></label>
									<span class="osl-badge-brand osl-jenkins-card__num">No.<span class="dplStartOrdCell" ord="3">3</span></span>
									<span class="osl-badge-brand osl-badge-brand-outline osl-cursor-pointer" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" title="job type">빌드</span>
									<h5 class="kt-portlet__head-title kt-margin-l-15">
										<p class="kt-margin-b-0 kt-font-dark kt-font-sm">T_JOB</p>T_JOB
									</h5>
								</div>
							</div>
							<div class="kt-portlet__body kt-padding-t-10 kt-padding-b-10">
								<div class="row">
									<div class="col-6">
										<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>JENKINS URL</label>
										<p>http://www.oslab.kr:7081/jenkins</p>
									</div>
									<div class="col-6">
										<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>원복 JOB ID</label>
										<p class="kt-margin-b-0">MIS-build</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end :: 등록된 svn 표출-->
	</div>
</form>
<!-- end :: form -->
<!-- begin :: modal-footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="dpl1001SaveSubmit"><i class="fa fa-save"></i><span>완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">닫기</span></button>
</div>
<!-- end :: modal-footer -->
<!-- end DOM -->
<!-- begin page script -->
<script>
"use strict";
var OSLDpl1001Popup = function () {
	
	var formId = 'frDpl1001';
	
	//type
	var type = $("#type").val();
	
	//form validate 주입
	var formValidate = $.osl.validate(formId);
	
	var documentSetting = function(){
		
		// 버튼 문구 세팅
		$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
		//일자 최소값
		var minMaxYear = new Date().getFullYear();
		var minDate = new Date(new Date().setDate(new Date().getDate()+ 1));
		var maxDate =  new Date(minMaxYear, 12, 0);
		
		//datepicker 세팅
		$.osl.date.datepicker($("#dplDt"), {});
		
		$('#dplAutoTm').daterangepicker({
            timePicker: true,
            timePicker24Hour: true,
            timePickerIncrement: 1,
            timePickerSeconds: true,
            singleDatePicker:true,
            minYear: minMaxYear,
			locale: {
				format: 'HH:mm:ss',
					"applyLabel": "적용",
					"cancelLabel": "취소"
			}
        }).on('show.daterangepicker', function (ev, picker) {
            picker.container.find(".calendar-table").hide();
        });
		
		// textarea 자동 사이즈 조절 설정
    	autosize($("#dplSignTxt"));
    	autosize($("#dplDesc"));
    	
    	// dpl1001 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "DPL00001", useYn: "Y",targetObj: "#dplStsCd", comboType:"OS"}, 	// 배포 진행 상태
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#dplSignUseCd", comboType:"OS"}, 		// 결재 사용 유무
			{mstCd: "DPL00003", useYn: "Y",targetObj: "#dplTypeCd", comboType:"OS"}, 	// 베포 방법
			{mstCd: "DPL00004", useYn: "Y",targetObj: "#dplAutoAfterCd", comboType:"OS"}, 	// 실패 후 처리
			{mstCd: "DPL00005", useYn: "Y",targetObj: "#dplRestoreCd", comboType:"OS"} 		// 원복 타입
		];

  		//공통코드 채우기
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		
		// 등록일 경우 배포 상태 대기로 변경
  		if(type == "insert"){
  			$("#dplStsCd").val("01");
  		}
  		
		//배포자, 결재자 검색버튼 클릭 시 사용자 조회 팝업 실행
    	//$(".search-usr__nm__btn").click(function(){
    	$("#dpl1001DplUsrSearch").click(function(){
    		
    		var data = {
    				usrNm : $("#dplUsrNm").val()
    		};
    		var options = {
    				idKey: "dpl1001SearchUsr",
					modalTitle: "배포자 선택",
					closeConfirm: true,
					autoHeight:false,
					modalSize: "xl",
					callback:[{
						targetId: "selectUsr",
						actionFn: function(thisObj){
							var usrInfo = OSLCmm15000Popup.getUsrInfo();
							if(!$.osl.isNull(usrInfo)){
								OSLDpl1001Popup.setUsrInfo(usrInfo);
							}
						}
					}]
    		};
    		$.osl.layerPopupOpen('/cmm/cmm10000/cmm15000/selectCmm15000View.do',data,options);
    	});
    	
    	// 배포자 입력 영역 엔터키 눌렀을 경우
		$("#dplUsrNm").keydown(function(e){
			if(e.keyCode=='13'){
				//해당 값으로 검색화면 띄우기
				$("#dpl1001DplUsrSearch").click();
			}
		});
		
		//jop 배정 버튼 클릭시 job등록 팝업 실행
		$('#dpl1001DplJobInsert').click(function(){
			var data = {
    			prjId : $("#paramPrjId").val()
    		};
    		var options = {
    				idKey: "",
					modalTitle: "JOB 배정",
					closeConfirm: true,
					autoHeight:false,
					callback:[{
						targetId: "dpl1003SelectJob",
						actionFn: function(thisObj){
							var jobInfo = OSLDpl1003Popup.getJobInfo();
							
							if(!$.osl.isNull(jobInfo)){
								//OSLDpl1001Popup.setUsrInfo(usrInfo);
							}
						}
					}]
    		};
    		$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1003View.do',data,options);
		});
		
		// 배포 방법 변경시 
		$("#dplTypeCd").change(function(){
			
			// 배포방법 숨김/표시 대상 
			var dplTypeTarget = $(".form-group[data-dpltype-expans='auto']");
			var dplTypeCd = $(this).val();
			
			// 자동 선택 시 자동항목 표시
			if(dplTypeCd == "01"){
				dplTypeTarget.slideDown();
			}else{
				dplTypeTarget.slideUp();
			}
		});
		
		//job ord up
		$("#dpl1001JobOrdUp").click(function(){
			//실행순서 변경
			fnJobInfoOrdMove("up");
		});
		
		//job ord down
		$("#dpl1001JobOrdDown").click(function(){
			//실행순서 변경
			fnJobInfoOrdMove("down");
		});
		
		
		// 배정된 job drag&drop
		new Sortable($('#dpl1001CardTable')[0], {
			group:'shared',
	        animation: 100,
	        //선택된 대상 active css효과
	        chosenClass: "chosen",
	        //이동될 div(나갈)
	        onEnd:function(evt){
	        	//변경된 index
				var newIndex = evt.newIndex;
				var oldIndex = evt.oldIndex;
				
				//변경된 index가 제자리인경우 중지
				
				if(newIndex == oldIndex){
					return false;
				}
				
				//실행 순서 변경 적용
				fnJobDivOrdModify(evt.item, newIndex, oldIndex);
			}
	    });
		
		
		// 저장 버튼 클릭
		$("#dpl1001SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		//폼 유효 값 체크
    		if (!form.valid()) {
    			return;
    		}
    		
    		// 배포 타입에 따라 필수 값 유효성 체크
    		
		});
		
		// 툴팁 재호출
		KTApp.initTooltips();
	};
	
	
	/**
	 * function 명 	: fnJobInfoOrdMove
	 * function 설명	: 배포 계획에 배정된 JOB의 실행 순서를 변경한다.
	 * @param type : up, down 2가지 type 값
	 */
	var fnJobInfoOrdMove = function(type){
		
		//전체 JOB 갯수
		var jobList = $(".dpl_middle_row.dpl_job_row").length;
		
		//선택 JOB INFO 가져오기
		var $chkInfo = $("input[type=checkbox][name=addJobDelChk]:checked");
		
		// 체크된 job이 여러개일 경우
		if($chkInfo.length > 1){
			$.osl.alert('1개의 JOB만 선택해주세요.');
			return false;
		}
		
		// TODO 변경 필요
		//jenId, jobId
		var jenId = $chkInfo.attr("jenid");
		var jobId = $chkInfo.attr("jobid");
		
		//선택 JOB 부모 div
		var $chkJobInfo = $(".dpl_middle_row.dpl_job_row[jenid="+jenId+"][jobid="+jobId+"]");
		
		//선택 JOB ord
		var jobOrd = parseInt($chkJobInfo.attr("ord"));
		if(type == "up"){
			//실행순서가 1일경우 위로 불가능
			if(jobOrd == 1){
				return false;
			}
			
			//변경 ord
			var chgJobOrd = jobOrd-1;
			
			//선택 JOB 하위 JOB
			var $targetObj = $(".dpl_middle_row.dpl_job_row[ord="+chgJobOrd+"]");
			$targetObj.before($chkJobInfo);
		
			//변경된 object ord변경
			$chkJobInfo.attr("ord",chgJobOrd);
			$chkJobInfo.children(".dplStartOrdCell").attr("ord",chgJobOrd);
			$chkJobInfo.children(".dplStartOrdCell").text(chgJobOrd);
		
			//변경된 object ord변경
			$targetObj.attr("ord",jobOrd);
			$targetObj.children(".dplStartOrdCell").attr("ord",jobOrd);
			$targetObj.children(".dplStartOrdCell").text(jobOrd);
		}
		else if(type == "down"){
			//실행순서가 마지막일경우 위로 불가능
			if(jobOrd == jobList){
				return false;
			}
			
			//변경 ord
			var chgJobOrd = jobOrd+1;
			
			//선택 JOB 하위 JOB
			var $targetObj = $(".dpl_middle_row.dpl_job_row[ord="+chgJobOrd+"]");
			$targetObj.after($chkJobInfo);
		
			//변경된 object ord변경
			$chkJobInfo.attr("ord",chgJobOrd);
			$chkJobInfo.children(".dplStartOrdCell").attr("ord",chgJobOrd);
			$chkJobInfo.children(".dplStartOrdCell").text(chgJobOrd);
		
			//변경된 object ord변경
			$targetObj.attr("ord",jobOrd);
			$targetObj.children(".dplStartOrdCell").attr("ord",jobOrd);
			$targetObj.children(".dplStartOrdCell").text(jobOrd);
		}else{
			jAlert("알 수 없는 명령 입니다.");
			return false;
		}
	}
	
	
	/**
	 * function 명 	: fnJobDivOrdModify
	 * function 설명	: 배정된 JOB의 실행순서를 변경한다.
	 * @param item : 변경 대상 job element
	 * @param newIndex : 새로운 순번값
	 * @param oldIndex : 이전 순번값
	 */
	var fnJobDivOrdModify = function(item, newIndex, oldIndex){
			//ord 변경하기
			$.each($(".dplStartOrdCell"),function(idx, map){
				//현재 ord가져오기
				var targetOrd = parseInt($(map).attr("ord"));
				//var newOrd = targetOrd; 
				
				//아래에서 위
				if(oldIndex > newIndex){
					//new ~ old
					if(idx < newIndex || idx > oldIndex){
						return true;
					}else{
						targetOrd = targetOrd+1;
					}
				}
				//위에서 아래
				else if(oldIndex < newIndex){
					//old ~ new
					if(idx > newIndex || idx < oldIndex){
						return true;
					}else{
						targetOrd = targetOrd-1;
					}
				}
				
				//ord 적용
				$(map).attr("ord",targetOrd);
				$(map).text(targetOrd);
				$(map).parent(".dpl_middle_row.dpl_job_row").attr("ord",targetOrd);
			});
			
			//변경된 object ord변경
			var $chgObj = $(item).find('.dplStartOrdCell');
			$chgObj.attr("ord",newIndex+1);
			$chgObj.parent(".dpl_middle_row.dpl_job_row").attr("ord",newIndex+1);
			$chgObj.text(newIndex+1);
	}
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        },
        setUsrInfo: function(usrInfo){
        	var parseUsrInfo = JSON.parse(usrInfo);
        	
        	// 선택한 사용자 정보를 배포자로 세팅
        	$("#dplUsrId").val(parseUsrInfo.usrId);
        	$("#dplUsrNm").val(parseUsrInfo.usrNm);
        },
        
    };
}();

$.osl.ready(function(){
	OSLDpl1001Popup.init();
});
</script>
<!-- end script -->
