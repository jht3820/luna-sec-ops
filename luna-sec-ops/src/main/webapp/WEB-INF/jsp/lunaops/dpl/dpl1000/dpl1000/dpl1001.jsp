<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- begin page DOM -->
<!-- begin :: form -->
<form class="kt-form" id="frDpl1001">
	<input type="hidden" id="type" name="type" value="${param.type}">
	<input type="hidden" id="paramPrjId" name="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" id="paramDplId" name="paramDplId" value="${param.paramDplId}">
	<input type="hidden" id="paramDplDelCd" name="paramDplDelCd" value="${param.paramDplDelCd}">
	<input type="hidden" id="dplUsrId" name="dplUsrId" value="">
	<div class="row">
		<!-- begin::배포 계획 정보 입력 영역 -->
		<div class="col-xl-5 col-lg-6 col-md-12 col-sm-12 col-12">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
				<div class="kt-portlet__body">
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplStatus">배포 상태</span></label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<select class="form-control kt-select2" id="dplStsCd" name="dplStsCd" disabled="disabled" opttype="02" cmmcode="DPL00001">
							</select>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplVersion">배포 버전</span></label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<input class="form-control" type="text" id="dplVer" name="dplVer" placeholder="배포 버전" maxlength="50" />
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplName">배포 명</span></label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<input class="form-control" type="text" id="dplNm" name="dplNm" placeholder="배포 명" maxlength="100" required/>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplDate">배포 일자</span></label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<input class="form-control" type="text" id="dplDt" name="dplDt" placeholder="배포 일자" readonly="readonly" modifyset="02" required/>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-user-cog kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplUser">배포자</span></label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="배포자" id="dplUsrNm" name="dplUsrNm" modifyset="02" required>
								<button type="button" class="btn btn-brand input-group-append search-usr__nm__btn" id="dpl1001DplUsrSearch"><span data-lang-cd="dpl1001.button.searchBtn">검색</span></button>
							</div>
						</div>
					</div>
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-file-signature kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplSignUse">결재 사용 유무</span></label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<select class="form-control kt-select2" id="dplSignUseCd" name="dplSignUseCd" modifyset="02">
							</select>
						</div>
					</div>
					<!-- 리비전 선택 주석처리
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplRevisionNum">배포 리비전</span></label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="리비전 검색 후 선택" id="dplRevisionNumStr" name="dplRevisionNumStr" opttype="05" >
								<button type="button" class="btn btn-brand input-group-append" id="searchDplRevBtn"><span data-lang-cd="dpl1001.button.searchBtn">검색</span></button>
							</div>
						</div>
					</div>	 -->
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fab fa-cloudsmith kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplType">배포 방법</span></label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<select class="form-control kt-select2" id="dplTypeCd" name="dplTypeCd" opttype="02" cmmcode="DPL00003">
							</select>
						</div>
					</div>		
					<div class="form-group row kt-margin-b-10" data-dpl-info-expans="dpltype">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplFailAction">실패 후 처리</span></label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<select class="form-control kt-select2" id="dplAutoAfterCd" name="dplAutoAfterCd" opttype="02" cmmcode="DPL00004">
							</select>
						</div>
					</div>
					<div class="form-group row kt-margin-b-10" data-dpl-info-expans="dpltype">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-clock kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplAutoTime">자동 실행 시간</span></label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<input type="text" class="form-control" id="dplAutoTm" name="dplAutoTm">
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10" data-dpl-info-expans="dpltype">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label required"><i class="fa fa-step-backward kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplRestoreType">원복 타입</span></label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<select class="form-control kt-select2" id="dplRestoreCd" name="dplRestoreCd" opttype="02" cmmcode="DPL00005">
							</select>
						</div>
					</div>
					<div class="form-group row kt-margin-b-10" data-dpl-info-expans="sign">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplSignText">결재요청 의견</span></label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<textarea class="form-control" id="dplSignTxt" name="dplSignTxt" maxlength="1000"></textarea>
						</div>
					</div>	
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplDesc">배포 설명</span></label>
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
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm btn-elevate btn-elevate-air" id="dpl1001JobOrdUp" title="JOB 순서 위로" data-title-lang-cd="dpl1001.tooltip.upMoveBtnTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="up" tabindex="5">
							<i class="fas fa-arrow-up"></i><span data-lang-cd="dpl1001.button.upMoveBtn">위로</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" id="dpl1001JobOrdDown" title="JOB 순서 아래로" data-title-lang-cd="dpl1001.tooltip.downMoveBtnTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="down" tabindex="6">
							<i class="fas fa-arrow-down"></i><span data-lang-cd="dpl1001.button.downMoveBtn">아래로</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air osl-jop-append" id="dpl1001DplJobInsert" title="JOB 배정" data-title-lang-cd="dpl1001.tooltip.assignBtnTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="7">
							<i class="fa fa-plus"></i><span data-lang-cd="dpl1001.button.assignBtn">배정</span>
						</button>
						<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 btn-elevate btn-elevate-air" id="dpl1001DplJobDelete" title="배정 JOB 삭제"  data-title-lang-cd="dpl1001.tooltip.deleteBtnTooltip" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="8">
							<i class="fa fa-trash-alt"></i><span data-lang-cd="dpl1001.button.deleteBtn">삭제</span>
						</button>
						<!-- end :: 버튼 영역 -->
					</div>
				</div>
				<div class="kt-portlet__body">
					<div id="dpl1001JobCardTable">
					</div>
				</div>
			</div>
		</div>
		<!-- end :: 배정된 JOB 표출 영역-->
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
		$("#dpl1001SaveSubmit > span").text($.osl.lang("dpl1001.button."+type+"Btn"));
		$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
		// textarea 자동 사이즈 조절 설정
    	autosize($("#dplSignTxt"));
    	autosize($("#dplDesc"));
    	
    	// dpl1001 팝업 공통코드 select 세팅
		var commonCodeArr = [
			{mstCd: "DPL00001", useYn: "Y",targetObj: "#dplStsCd", comboType:"OS"}, 		// 배포 진행 상태
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#dplSignUseCd", comboType:"OS"}, 	// 결재 사용 유무
			{mstCd: "DPL00003", useYn: "Y",targetObj: "#dplTypeCd", comboType:"OS"}, 		// 베포 방법
			{mstCd: "DPL00004", useYn: "Y",targetObj: "#dplAutoAfterCd", comboType:"OS"}, 	// 실패 후 처리
			{mstCd: "DPL00005", useYn: "Y",targetObj: "#dplRestoreCd", comboType:"OS"} 		// 원복 타입
		];

  		//공통코드 채우기
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		
		// 등록일 경우 배포 상태 대기로 변경
  		if(type == "insert"){
  			$("#dplStsCd").val("01");
  			
  		}else if(type == "update"){
  			// 배포 계획 단건 정보 조회
  			selectDplInfo();
  		}
		
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
					"applyLabel": $.osl.lang("dpl1001.label.autoTimeCompl"),
					"cancelLabel": $.osl.lang("dpl1001.label.autoTimeCancel")
			}
        }).on('show.daterangepicker', function (ev, picker) {
            picker.container.find(".calendar-table").hide();
        });
  		
		//배포자, 결재자 검색버튼 클릭 시 사용자 조회 팝업 실행
    	$("#dpl1001DplUsrSearch").click(function(){
    		
    		var data = {
   				usrNm : $("#dplUsrNm").val()
    		};
    		var options = {
    				idKey: "dpl1001SearchUsr",
					modalTitle: $.osl.lang("dpl1001.modal.title.dplUserSelect"),
					closeConfirm: true,
					autoHeight:false,
					modalSize: "xl",
					callback:[{
						targetId: "selectUsr",
						actionFn: function(thisObj){
							var usrInfo = OSLCmm6401Popup.getUsrInfo();
							if(!$.osl.isNull(usrInfo)){
								OSLDpl1001Popup.setUsrInfo(usrInfo);
							}
						}
					}]
    		};
    		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6400/selectCmm6401View.do',data,options);
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
    				idKey: "dpl1001AssignJob",
					modalTitle: $.osl.lang("dpl1001.modal.title.dplJobAssign"),
					closeConfirm: true,
					autoHeight:false
    		};
    		$.osl.layerPopupOpen('/dpl/dpl1000/dpl1000/selectDpl1003View.do',data,options);
		});
		
		// 배포 방법 변경시 
		$("#dplTypeCd").change(function(){
			var dplTypeCd = $(this).val();
			// 배포 방법에 따라 입력영역 show&hide
			fnDplInfoShowAndHide("dpltype", dplTypeCd);
		});
		
		// 결재 사용 유무 변경 시
		$("#dplSignUseCd").change(function(){
			var dplSignUseCd = $(this).val();
			fnDplInfoShowAndHide("sign", dplSignUseCd);
		});
		
		// JOB 순서 변경(위로)
		$("#dpl1001JobOrdUp").click(function(){
			//실행순서 변경
			fnJobInfoOrdMove("up");
		});
		
		// JOB 순서 변경(아래로)
		$("#dpl1001JobOrdDown").click(function(){
			//실행순서 변경
			fnJobInfoOrdMove("down");
		});
		
		// 배정된 job 삭제버튼 클릭
		$("#dpl1001DplJobDelete").click(function(){
			// 체크된 job 목록
			var chkInfo = $("input[type=checkbox][data-dpl-job-info=checkbox]:checked");
			
			// 체크된 값이 없을경우
			if(chkInfo.length == 0){
				$.osl.alert($.osl.lang("dpl1001.message.alert.delJob"));
				return false;
			}
			
			$.each(chkInfo, function(idx, map){
				
				var jenId = $(map).data("dpl-jenid");
				var jobId = $(map).data("dpl-jobid");
				
				// 체크된 job 정보 div를 가져온다.
				var chkJobInfo = $("[data-dpl-job-info=jobinfo][data-dpl-jenid="+jenId+"][data-dpl-jobid="+jobId+"]");
				
				// 삭제
				chkJobInfo.remove();
				
				// 순번 다시 세팅
				fnAllJobListOrdSet();
			});
			
			
			
		});
		
		
		// 배정된 job drag&drop
		new Sortable($('#dpl1001JobCardTable')[0], {
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
    		
    		// 배포자 Id
    		var dplUsrId = $("#dplUsrId").val();
    		// 배포자 ID가 없을 경우
    		if($.osl.isNull(dplUsrId)){
    			// 경고 문구 출력
    			$("#dplUsrNm").parents("div.input-group").after(
   					'<div class="invalid-feedback invalid-dplUsrNm" style="display:block">'+$.osl.lang("dpl1001.message.warning.notDplUsr")+'</div>'
    			);
    			
    			$("#dplUsrNm").addClass("is-invalid");
    			return false;
    		}
    		
    		// 배정된 job 건수
    		var dplAssignJob = $("[data-dpl-job-info=jobinfo]").length;
    		if(dplAssignJob == 0){
    			$.osl.alert($.osl.lang("dpl1001.message.alert.jobAssign"),{type: "warning"});
				return false;
    		}
    		
    		// 배포 계획 등록&수정 시작
    		$.osl.confirm($.osl.lang("dpl1001.message.confirm."+type), null,function(result) {
    	        if (result.value) {
    	        	// 등록&수정
    	        	saveDpl1001FormAction();
    	        }
    		});
		});
	};
	
	// 전체 JOB 목록 ord 재세팅
	var fnAllJobListOrdSet = function(){
		
		var jobTarget = $("[data-dpl-job-info='jobinfo']");
		if(jobTarget.length > 0){
			// job 목록 loop하며 ord 다시 세팅
			$.each(jobTarget, function(idx, map){
				$(map).attr("data-job-ord",idx+1);
				$(map).find("span[data-dpl-job-info='ord']").attr("data-job-ord", idx+1);
				$(map).find("span[data-dpl-job-info='ord']").text(idx+1);
			});
		}
	};
	
	
	/**
	 * function 명 	: selectDplInfo
	 * function 설명	: 배포 계획 단건 정보 조회
	 */
	 var selectDplInfo = function() {
		 
    	var paramPrjId = $("#paramPrjId").val();
    	var paramDplId = $("#paramDplId").val();
    	var paramDplDelCd = $("#paramDplDelCd").val();
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dpl/dpl1000/dpl1000/selectDpl1000DplInfoAjax.do'/>"}
				,{"prjId": paramPrjId, "dplId" : paramDplId, "dplDelCd":paramDplDelCd});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				
				// 배포 계획 정보
				var dplInfo = data.dplInfo;
				// 배정 JOB 정보
				var dplJobList = data.dplJobList;
				
				// 배포 계획 정보 세팅
		    	$.osl.setDataFormElem(dplInfo,"frDpl1001", ["dplVer","dplNm","dplDt","dplUsrId","dplUsrNm","dplSignTxt", "dplDesc"]);
				
		    	// combobox selected setting
   				$("#dplStsCd").val(dplInfo.dplStsCd).trigger('change.select2');
   				$("#dplSignUseCd").val(dplInfo.dplSignUseCd).trigger('change.select2');
		    	$("#dplTypeCd").val(dplInfo.dplTypeCd).trigger('change.select2');
		    	$("#dplAutoAfterCd").val(dplInfo.dplAutoAfterCd).trigger('change.select2');
		    	$("#dplRestoreCd").val(dplInfo.dplRestoreCd).trigger('change.select2');
				
		    	// 자동 실행 시간 세팅
		    	var dplAuthDtm = dplInfo.dplAutoDtm;
		    	if(!$.osl.isNull(dplAuthDtm)){
		    		var dplAutoTm = new Date(dplAuthDtm).format("HH:mm:ss");
		    		$("#dplAutoTm").val(dplAutoTm);
		    	}
		    	
		    	// 배포 방법에 따라 입력영역 show&hide
		    	fnDplInfoShowAndHide("dpltype", dplInfo.dplTypeCd);
		    	
		    	// 결재 사용 유무에 따라 입력영역 show&hide
		    	fnDplInfoShowAndHide("sign", dplInfo.dplSignUseCd);
		    	
		    	// 배정된 JOB 목록 세팅
		    	$("#dpl1001JobCardTable").html("");
				if(!$.osl.isNull(dplJobList)){
			    	fnSetDplJobInfo(dplJobList);
				}
				
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
	
	/**
	 * function 명 	: saveDpl1001FormAction
	 * function 설명	: 배포 계획 등록
	 */
	var saveDpl1001FormAction = function(){
		
		//formData
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	// 배포일시
    	var dplDt = $("#dplDt").val();
    	// 자동 배포 시간
    	var dplAutoTm = $("#dplAutoTm").val();
    	
    	// formdata 필요정보 추가
		fd.append("prjId", $("#paramPrjId").val());
		fd.append("dplId", $("#paramDplId").val());
    	
    	// 자동배포 일시 데이터 추가
		fd.append("dplAutoDtm", dplDt+" "+dplAutoTm);
    	
		// 배정 Job 목록
    	var dplJobElmtList = $("[data-dpl-job-info=jobinfo]");
    	
    	// 배정된 JOB목록을 formData에 추가
   		var jobList = [];
   		$.each(dplJobElmtList, function(idx, map){
   			
   			var jenId = $(map).data("dpl-jenid");
   			var jobId = $(map).data("dpl-jobid");
   			//var jobOrd = $(map).data("job-ord");
   			var jobOrd = $(map).attr("ord");
   			
   			jobList.push({jenId: jenId, jobId: jobId, jobStartOrd: jobOrd});
   		});
   		
   		fd.append("selJobList",JSON.stringify(jobList));
    	
    	//AJAX 설정
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/dpl/dpl1000/dpl1000/saveDpl1000DplInfoAjax.do'/>", "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		//AJAX 전송 성공 함수
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				//등록 성공
   				$.osl.toastr(data.message);

   				//모달 창 닫기
   				$.osl.layerPopupClose();
   				
   				//datatable 조회
   				$("button[data-datatable-id=dpl1000Table][data-datatable-action=select]").click();
   			}
   		});
   		
   		//AJAX 전송
   		ajaxObj.send();
	};
	
	
	/**
	 * function 명 	: fnDplInfoShowAndHide
	 * function 설명	: 옵션에 따라 정보 입력 영역 숨김/표시
	 * @param optType : dpltype(배포 방법), sign(결재 사용 유무)
	 * @param optVal : 각 옵션에 따른 값
	 */
	var fnDplInfoShowAndHide = function(optType, optVal){
		
		//  숨김/표시 대상 
		var target = $(".form-group[data-dpl-info-expans="+optType+"]");
		 
		 if(optType == "dpltype"){
			
			// 자동 선택 시 자동항목 표시
			if(optVal == "01"){
				target.slideDown();
			}else{
				target.slideUp();
			}
		}else if(optType == "sign"){
			
			// 자동 선택 시 자동항목 표시
			if(optVal == "01"){
				target.slideDown();
			}else{
				target.slideUp();
			}
		}
	}
	
	/**
	 * function 명 	: fnSetDplJobInfo
	 * function 설명	: 선택한 job을 배포 계획 정보에 추가한다.
	 * @param jobDatas : 선택한 job json data
	 */
	var fnSetDplJobInfo = function(jobDatas){
    	
    	// 선택한 job이 있을 경우
    	if(!$.osl.isNull(jobDatas)){
    	
    		// 전체 등록된 job 수
    		var jobCount = $("[data-dpl-job-info=jobinfo]").length;
    		
    		var jobInfoHtmlStr = '';
    		
    		$.each(jobDatas, function(idx, map){
    			
    			var jobOrd = ++jobCount;
    			var jobRestoreStr = '-';
    			var jobRestoreId = map.jobRestoreId;
    			
    			// 원복 JOB ID 있을경우 표시
    			if(!$.osl.isNull(jobRestoreId)){
    				jobRestoreStr = jobRestoreId
    			}
    			
    			jobInfoHtmlStr += '<div class="kt-portlet border" data-dpl-job-info="jobinfo" data-dpl-jenid="'+map.jenId+'" data-dpl-jobid="'+$.osl.escapeHtml(map.jobId)+'" data-job-ord="'+ jobOrd +'" ord="'+ jobOrd +'" >'
				    				+ '<div class="kt-portlet__head">'
				    					+ '<div class="kt-portlet__head-label">'
				    						+ '<label class="kt-checkbox kt-checkbox--single kt-checkbox--solid kt-margin-b-0"><input type="checkbox" data-dpl-job-info="checkbox" data-dpl-jenid="'+map.jenId+'" data-dpl-jobid="'+$.osl.escapeHtml(map.jobId)+'">&nbsp;<span></span></label>'
				    						+ '<span class="osl-badge-brand osl-jenkins-card__num">No.<span data-dpl-job-info="ord"  data-job-ord="'+ jobOrd +'" ord="'+ jobOrd +'" data-dpl-jenid="'+map.jenId+'" data-dpl-jobid="'+$.osl.escapeHtml(map.jobId)+'" >' + jobOrd + '</span></span>'
				    						+ '<span class="osl-badge-brand osl-badge-brand-outline osl-cursor-pointer" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" title="JOB Type">'+ map.jobTypeNm +'</span>'
				    						+ '<h5 class="kt-portlet__head-title kt-margin-l-10">'
				    							+ '<p class="kt-margin-b-0 kt-font-dark kt-font-sm">'+ $.osl.escapeHtml(map.jenNm) +'</p>'+ $.osl.escapeHtml(map.jobId)
				    						+ '</h5>'
				    					+ '</div>'
				    				+ '</div>'
				    				+ '<div class="kt-portlet__body kt-padding-t-10 kt-padding-b-10">'
				    					+ '<div class="row">'
				    						+ '<div class="col-6">'
				    							+ '<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>JENKINS URL</label>'
				    							+ '<p class="kt-margin-b-0">'+ $.osl.escapeHtml(map.jenUrl) +'</p>'
				    						+ '</div>'
				    						+ '<div class="col-6">'
				    							+ '<label class="font-weight-bold kt-margin-r-10"><i class="fa fa-edit kt-margin-r-5"></i>원복 JOB ID</label>'
				    							+ '<p class="kt-margin-b-0">-</p>'
				    						+ '</div>'
				    					+ '</div>'
				    				+ '</div>'
				    			+ '</div>';
				
    		});
    		
    		// 선택한 job 정보 추가
			$("#dpl1001JobCardTable").append(jobInfoHtmlStr);
    		
			// 툴팁 재호출
			KTApp.initTooltips();
    	}
	};
	
	/**
	 * function 명 	: fnJobInfoOrdMove
	 * function 설명	: 배포 계획에 배정된 JOB의 실행 순서를 변경한다.
	 * @param type : up, down 2가지 type 값
	 */
	var fnJobInfoOrdMove = function(type){
		 
		// 배정된 전체 JOB 수
		var jobList = $("[data-dpl-job-info=jobinfo]").length;
		
		// 선택 JOB INFO 가져오기
		var chkInfo = $("input[type=checkbox][data-dpl-job-info=checkbox]:checked");
		
		if(chkInfo.length == 0){
			$.osl.alert($.osl.lang("dpl1001.message.alert.jobMove"));
			return false;
		}
		
		// 체크된 job이 여러개일 경우
		if(chkInfo.length > 1){
			$.osl.alert($.osl.lang("dpl1001.message.alert.selectOneJob"));
			return false;
		}
		
		//jenId, jobId
		var jenId = chkInfo.data("dpl-jenid");
		var jobId = chkInfo.data("dpl-jobid");
		
		//선택 JOB 부모 div
		var chkJobInfo = $("[data-dpl-job-info=jobinfo][data-dpl-jenid="+jenId+"][data-dpl-jobid="+jobId+"]");
		var jobOrd = parseInt(chkJobInfo.attr("data-job-ord"));
		
		//선택 JOB ord
		if(type == "up"){
			
			//실행순서가 1일경우 위로 불가능
			if(jobOrd == 1){
				return false;
			}
			
			//변경 ord
			var chgJobOrd = jobOrd-1;
			
			//체크된 JOB의 보다 순번이 하위인 JOB
			var targetObj = $("[data-dpl-job-info=jobinfo][data-job-ord="+chgJobOrd+"]");
			targetObj.before(chkJobInfo);
		
			// 체크된 job의 순번 변경
			var chkJobChildren = chkJobInfo.find("[data-dpl-job-info=ord]");
			chkJobChildren.attr("data-job-ord",chgJobOrd);
			chkJobChildren.text(chgJobOrd);
			// 체크된 job의 data 값 변경
			chkJobInfo.attr("data-job-ord",chgJobOrd);
		
			//체크된 JOB의 보다 순번이 하위인 JOB의 순번을 변경해준다.
			var targetObjChildren = targetObj.find("[data-dpl-job-info=ord]");
			targetObjChildren.attr("data-job-ord",jobOrd);
			targetObjChildren.text(jobOrd);
			targetObj.attr("data-job-ord",jobOrd);
		}
		else if(type == "down"){
			
			//실행순서가 마지막일경우 위로 불가능
			if(jobOrd == jobList){
				return false;
			}
			
			//변경 ord
			var chgJobOrd = jobOrd+1;

			var targetObj = $("[data-dpl-job-info=jobinfo][data-job-ord="+chgJobOrd+"]");
			targetObj.after(chkJobInfo);
			
			// 체크된 job의 순번 변경
			var chkJobChildren = chkJobInfo.find("[data-dpl-job-info=ord]");
			chkJobChildren.attr("data-job-ord",chgJobOrd);
			chkJobChildren.text(chgJobOrd);
			// 체크된 job의 data 값 변경
			chkJobInfo.attr("data-job-ord",chgJobOrd);
		
			//체크된 JOB의 보다 순번이 하위인 JOB의 순번을 변경해준다.
			var targetObjChildren = targetObj.find("[data-dpl-job-info=ord]");
			targetObjChildren.attr("data-job-ord", jobOrd);
			targetObjChildren.text(jobOrd);
			targetObj.attr("data-job-ord", jobOrd);
		}
	};
	
	/**
	 * function 명 	: fnJobDivOrdModify
	 * function 설명	: 배정된 JOB의 실행순서를 변경한다.
	 * @param item : 변경 대상 job element
	 * @param newIndex : 새로운 순번값
	 * @param oldIndex : 이전 순번값
	 */
	var fnJobDivOrdModify = function(item, newIndex, oldIndex){
		
		//ord 변경하기
		$.each($("[data-dpl-job-info=ord]"),function(idx, map){
			
			//현재 ord가져오기
			var targetOrd = parseInt($(map).attr("data-job-ord"));
						
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
			$(map).attr("data-job-ord", targetOrd);
			$(map).text(targetOrd);
			$(map).parents("[data-dpl-job-info=jobinfo]").attr("data-job-ord",targetOrd);
		});
		
		// 변경대상에 새로운 순번정보 적용
		var changeTarget = $(item).find("[data-dpl-job-info=ord]");
		changeTarget.attr("data-job-ord", newIndex+1);
		changeTarget.text(newIndex+1);
		changeTarget.parents("[data-dpl-job-info=jobinfo]").attr("data-job-ord",newIndex+1); 
	};
	
	/**
	 * function 명 	: fnGetDplAssignJobList
	 * function 설명	: 배포 계획에 배정된 JOB 목록을 가져온다.
	 */
	var fnGetDplAssignJobList = function(){
	
		var sendDatas = [];
    	// 배포 계획에 배정된 job 정보 세팅
    	$.each($("[data-dpl-job-info=jobinfo]"), function(idx, map){
    		var jenId = $(map).data("dpl-jenid");
    		var jobId = $(map).data("dpl-jobid");
    		sendDatas.push({jenId:jenId, jobId:jobId});
    	});
		
    	return sendDatas;
	};
	
	
	
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
        // job목록에서 선택한 job을 배포 계획에 배정한다.
        setDplJob:function(jobDatas){
        	fnSetDplJobInfo(jobDatas);
        },
        // 배포계획에 배정된 job정보를 가져온다.
        getDplJob: function(){
        	return fnGetDplAssignJobList();
        }
    };
}();

$.osl.ready(function(){
	OSLDpl1001Popup.init();
});
</script>
<!-- end script -->
