<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form class="kt-form" id="frDpl1001">
	<input type="hidden" id="type" name="type" value="${param.type}">
	<input type="hidden" id="paramPrjId" name="paramPrjId" value="${param.paramPrjId}">
	<input type="hidden" id="paramDplId" name="paramDplId" value="${param.paramDplId}">
	<input type="hidden" id="paramDplDelCd" name="paramDplDelCd" value="${param.paramDplDelCd}">
	<input type="hidden" id="dplUsrId" name="dplUsrId" value="">
	<input type="hidden" id="dplRevisionNum" name="dplRevisionNum" value="">
	<div class="row">
		
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
					<div class="form-group row kt-margin-b-10">
						<label class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12 col-form-label"><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="dpl1001.label.dplRevisionNum">배포 리비전</span></label>
						<div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="리비전 검색 후 선택" id="dplRevisionNumStr" name="dplRevisionNumStr" opttype="05" >
								<button type="button" class="btn btn-brand input-group-append" id="dpl1001DplRevisionSearch"><span data-lang-cd="dpl1001.button.searchBtn">검색</span></button>
							</div>
						</div>
					</div>
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
		
		
		<div class="col-xl-7 col-lg-6 col-md-12 col-sm-12 col-12 kt-margin-t-20-tablet kt-margin-t-20-mobile">
			<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
				<div class="kt-portlet__head kt-portlet__head--lg">
					<div class="kt-portlet__head-label"></div>
					<div class="kt-portlet__head-toolbar">
						
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
						
					</div>
				</div>
				<div class="kt-portlet__body">
					<div id="dpl1001JobCardTable">
					</div>
				</div>
			</div>
		</div>
		
	</div>
</form>


<div class="modal-footer">
	<button type="button" class="btn btn-brand" id="dpl1001SaveSubmit"><i class="fa fa-save"></i><span class="osl-resize__display--show">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>



<script>
"use strict";
var OSLDpl1001Popup = function () {
	
	var formId = 'frDpl1001';
	
	
	var type = $("#type").val();
	
	
	var formValidate = $.osl.validate(formId);
	
	var documentSetting = function(){
		
		
		$("#dpl1001SaveSubmit > span").text($.osl.lang("dpl1001.button."+type+"Btn"));
		$(".btn.btn-outline-brand[data-dismiss=modal] > span").text($.osl.lang("modal.close"));
	
		
    	autosize($("#dplSignTxt"));
    	autosize($("#dplDesc"));
    	
    	
		var commonCodeArr = [
			{mstCd: "DPL00001", useYn: "Y",targetObj: "#dplStsCd", comboType:"OS"}, 		
			{mstCd: "CMM00001", useYn: "Y",targetObj: "#dplSignUseCd", comboType:"OS"}, 	
			{mstCd: "DPL00003", useYn: "Y",targetObj: "#dplTypeCd", comboType:"OS"}, 		
			{mstCd: "DPL00004", useYn: "Y",targetObj: "#dplAutoAfterCd", comboType:"OS"}, 	
			{mstCd: "DPL00005", useYn: "Y",targetObj: "#dplRestoreCd", comboType:"OS"} 		
		];

  		
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		
		
  		if(type == "insert"){
  			$("#dplStsCd").val("01");
  			
  		}else if(type == "update"){
  			
  			selectDplInfo();
  		}
		
  		
		var minMaxYear = new Date().getFullYear();
		var minDate = new Date(new Date().setDate(new Date().getDate()+ 1));
		var maxDate =  new Date(minMaxYear, 12, 0);
		
		
		$.osl.date.daterangepicker($("#dplDt"), {
			singleDatePicker: true, 
			timePicker: false, 
			timePicker24Hour: false,
			minDate: minDate,
			maxDate: maxDate,
			locale: {
				format: 'YYYY-MM-DD'
	        }
		});
		
		
		$.osl.date.daterangepicker($('#dplAutoTm'), {
			singleDatePicker: false,
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
    	
    	
		$("#dplUsrNm").keydown(function(e){
			if(e.keyCode=='13'){
				
				$("#dpl1001DplUsrSearch").click();
			}
		});
    	
    	
    	
    	$("#dpl1001DplRevisionSearch").click(function(){
    		var data = {
    				paramRevisionNum : $("#dplRevisionNumStr").val(),
    				paramTypeCd : "01" 
        		};
    		
    		var options = {
    				idKey: "dpl1001SearchRevsionNum",
					modalTitle: "리비전 선택",
					closeConfirm: true,
					autoHeight:false,
					modalSize: "xl",
					callback:[{
						
					}]
    		};
    		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6800/selectCmm6800View.do',data,options);
    	});
    	
    	
		$("#dplRevisionNumStr").keydown(function(e){
			if(e.keyCode=='13'){
				
				$("#dpl1001DplRevisionSearch").click();
			}
		});
		
		
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
		
		
		$("#dplTypeCd").change(function(){
			var dplTypeCd = $(this).val();
			
			fnDplInfoShowAndHide("dpltype", dplTypeCd);
		});
		
		
		$("#dplSignUseCd").change(function(){
			var dplSignUseCd = $(this).val();
			fnDplInfoShowAndHide("sign", dplSignUseCd);
		});
		
		
		$("#dpl1001JobOrdUp").click(function(){
			
			fnJobInfoOrdMove("up");
		});
		
		
		$("#dpl1001JobOrdDown").click(function(){
			
			fnJobInfoOrdMove("down");
		});
		
		
		$("#dpl1001DplJobDelete").click(function(){
			
			var chkInfo = $("input[type=checkbox][data-dpl-job-info=checkbox]:checked");
			
			
			if(chkInfo.length == 0){
				$.osl.alert($.osl.lang("dpl1001.message.alert.delJob"));
				return false;
			}
			
			$.each(chkInfo, function(idx, map){
				
				var jenId = $(map).data("dpl-jenid");
				var jobId = $(map).data("dpl-jobid");
				
				
				var chkJobInfo = $("[data-dpl-job-info=jobinfo][data-dpl-jenid="+jenId+"][data-dpl-jobid="+jobId+"]");
				
				
				chkJobInfo.remove();
				
				
				fnAllJobListOrdSet();
			});
		});
		
		
		
		new Sortable($('#dpl1001JobCardTable')[0], {
			group:'shared',
	        animation: 100,
	        
	        chosenClass: "chosen",
	        
	        onEnd:function(evt){
	        	
				var newIndex = evt.newIndex;
				var oldIndex = evt.oldIndex;
				
				
				if(newIndex == oldIndex){
					return false;
				}
				
				
				fnJobDivOrdModify(evt.item, newIndex, oldIndex);
			}
	    });
		
		
		
		$("#dpl1001SaveSubmit").click(function(){
			var form = $('#'+formId);    		
        	
    		
    		if (!form.valid()) {
    			return;
    		}
    		
    		
    		var dplUsrId = $("#dplUsrId").val();
    		
    		if($.osl.isNull(dplUsrId)){
    			
    			$("#dplUsrNm").parents("div.input-group").after(
   					'<div class="invalid-feedback invalid-dplUsrNm" style="display:block">'+$.osl.lang("dpl1001.message.warning.notDplUsr")+'</div>'
    			);
    			
    			$("#dplUsrNm").addClass("is-invalid");
    			return false;
    		}
    		
    		
    		var dplAssignJob = $("[data-dpl-job-info=jobinfo]").length;
    		if(dplAssignJob == 0){
    			$.osl.alert($.osl.lang("dpl1001.message.alert.jobAssign"),{type: "warning"});
				return false;
    		}
    		
    		
    		$.osl.confirm($.osl.lang("dpl1001.message.confirm."+type), null,function(result) {
    	        if (result.value) {
    	        	
    	        	saveDpl1001FormAction();
    	        }
    		});
		});
	};
	
	
	var fnAllJobListOrdSet = function(){
		
		var jobTarget = $("[data-dpl-job-info='jobinfo']");
		if(jobTarget.length > 0){
			
			$.each(jobTarget, function(idx, map){
				$(map).attr("data-job-ord",idx+1);
				$(map).find("span[data-dpl-job-info='ord']").attr("data-job-ord", idx+1);
				$(map).find("span[data-dpl-job-info='ord']").text(idx+1);
			});
		}
	};
	
	
	
	 var selectDplInfo = function() {
		 
    	var paramPrjId = $("#paramPrjId").val();
    	var paramDplId = $("#paramDplId").val();
    	var paramDplDelCd = $("#paramDplDelCd").val();
    	
		
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/dpl/dpl1000/dpl1000/selectDpl1000DplInfoAjax.do'/>"}
				,{"prjId": paramPrjId, "dplId" : paramDplId, "dplDelCd":paramDplDelCd});
		
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				
				$.osl.layerPopupClose();
			}else{
				
				
				var dplInfo = data.dplInfo;
				
				var dplJobList = data.dplJobList;
				
				
		    	$.osl.setDataFormElem(dplInfo,"frDpl1001", ["dplVer","dplNm","dplDt","dplUsrId","dplUsrNm","dplSignTxt", "dplDesc"]);
				
		    	
   				$("#dplStsCd").val(dplInfo.dplStsCd).trigger('change.select2');
   				$("#dplSignUseCd").val(dplInfo.dplSignUseCd).trigger('change.select2');
		    	$("#dplTypeCd").val(dplInfo.dplTypeCd).trigger('change.select2');
		    	$("#dplAutoAfterCd").val(dplInfo.dplAutoAfterCd).trigger('change.select2');
		    	$("#dplRestoreCd").val(dplInfo.dplRestoreCd).trigger('change.select2');
				
		    	
		    	var dplAuthDtm = dplInfo.dplAutoDtm;
		    	if(!$.osl.isNull(dplAuthDtm)){
		    		var dplAutoTm = new Date(dplAuthDtm).format("HH:mm:ss");
		    		$("#dplAutoTm").val(dplAutoTm);
		    	}
		    	
		    	
		    	fnDplInfoShowAndHide("dpltype", dplInfo.dplTypeCd);
		    	
		    	
		    	fnDplInfoShowAndHide("sign", dplInfo.dplSignUseCd);
		    	
		    	
		    	$("#dpl1001JobCardTable").html("");
				if(!$.osl.isNull(dplJobList)){
			    	fnSetDplJobInfo(dplJobList);
				}
				
			}
		});
		
		
		ajaxObj.send();
	};
	
	
	var saveDpl1001FormAction = function(){
		
		
   		var fd = $.osl.formDataToJsonArray(formId);
    	
    	
    	var dplDt = $("#dplDt").val();
    	
    	var dplAutoTm = $("#dplAutoTm").val();
    	
    	
		fd.append("prjId", $("#paramPrjId").val());
		fd.append("dplId", $("#paramDplId").val());
    	
    	
		fd.append("dplAutoDtm", dplDt+" "+dplAutoTm);
    	
		
    	var dplJobElmtList = $("[data-dpl-job-info=jobinfo]");
    	
    	
   		var jobList = [];
   		$.each(dplJobElmtList, function(idx, map){
   			
   			var jenId = $(map).data("dpl-jenid");
   			var jobId = $(map).data("dpl-jobid");
   			var jobOrd = $(map).data("job-ord");
   			
   			jobList.push({jenId: jenId, jobId: jobId, jobStartOrd: jobOrd});
   		});
   		
   		fd.append("selJobList",JSON.stringify(jobList));
    	
    	
   		var ajaxObj = new $.osl.ajaxRequestAction({"url":"<c:url value='/dpl/dpl1000/dpl1000/saveDpl1000DplInfoAjax.do'/>", "async": false,"contentType":false,"processData":false ,"cache":false},fd);

   		
   		ajaxObj.setFnSuccess(function(data){
   			if(data.errorYn == "Y"){
   				$.osl.alert(data.message,{type: 'error'});
   			}else{
   				
   				$.osl.toastr(data.message);

   				
   				$.osl.layerPopupClose();
   				
   				
   				$("button[data-datatable-id=dpl1000Table][data-datatable-action=select]").click();
   			}
   		});
   		
   		
   		ajaxObj.send();
	};
	
	
	
	var fnDplInfoShowAndHide = function(optType, optVal){
		
		
		var target = $(".form-group[data-dpl-info-expans="+optType+"]");
		 
		 if(optType == "dpltype"){
			
			
			if(optVal == "01"){
				target.slideDown();
			}else{
				target.slideUp();
			}
		}else if(optType == "sign"){
			
			
			if(optVal == "01"){
				target.slideDown();
			}else{
				target.slideUp();
			}
		}
	}
	
	
	var fnSetDplJobInfo = function(jobDatas){
    	
    	
    	if(!$.osl.isNull(jobDatas)){
    	
    		
    		var jobCount = $("[data-dpl-job-info=jobinfo]").length;
    		
    		var jobInfoHtmlStr = '';
    		
    		$.each(jobDatas, function(idx, map){
    			
    			var jobOrd = ++jobCount;
    			var jobRestoreStr = '-';
    			var jobRestoreId = map.jobRestoreId;
    			
    			
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
    		
    		
			$("#dpl1001JobCardTable").append(jobInfoHtmlStr);
    		
			
			KTApp.initTooltips();
    	}
	};
	
	
	var fnJobInfoOrdMove = function(type){
		 
		
		var jobList = $("[data-dpl-job-info=jobinfo]").length;
		
		
		var chkInfo = $("input[type=checkbox][data-dpl-job-info=checkbox]:checked");
		
		if(chkInfo.length == 0){
			$.osl.alert($.osl.lang("dpl1001.message.alert.jobMove"));
			return false;
		}
		
		
		if(chkInfo.length > 1){
			$.osl.alert($.osl.lang("dpl1001.message.alert.selectOneJob"));
			return false;
		}
		
		
		var jenId = chkInfo.data("dpl-jenid");
		var jobId = chkInfo.data("dpl-jobid");
		
		
		var chkJobInfo = $("[data-dpl-job-info=jobinfo][data-dpl-jenid="+jenId+"][data-dpl-jobid="+jobId+"]");
		var jobOrd = parseInt(chkJobInfo.attr("data-job-ord"));
		
		
		if(type == "up"){
			
			
			if(jobOrd == 1){
				return false;
			}
			
			
			var chgJobOrd = jobOrd-1;
			
			
			var targetObj = $("[data-dpl-job-info=jobinfo][data-job-ord="+chgJobOrd+"]");
			targetObj.before(chkJobInfo);
		
			
			var chkJobChildren = chkJobInfo.find("[data-dpl-job-info=ord]");
			chkJobChildren.attr("data-job-ord",chgJobOrd);
			chkJobChildren.text(chgJobOrd);
			
			chkJobInfo.attr("data-job-ord",chgJobOrd);
		
			
			var targetObjChildren = targetObj.find("[data-dpl-job-info=ord]");
			targetObjChildren.attr("data-job-ord",jobOrd);
			targetObjChildren.text(jobOrd);
			targetObj.attr("data-job-ord",jobOrd);
		}
		else if(type == "down"){
			
			
			if(jobOrd == jobList){
				return false;
			}
			
			
			var chgJobOrd = jobOrd+1;

			var targetObj = $("[data-dpl-job-info=jobinfo][data-job-ord="+chgJobOrd+"]");
			targetObj.after(chkJobInfo);
			
			
			var chkJobChildren = chkJobInfo.find("[data-dpl-job-info=ord]");
			chkJobChildren.attr("data-job-ord",chgJobOrd);
			chkJobChildren.text(chgJobOrd);
			
			chkJobInfo.attr("data-job-ord",chgJobOrd);
		
			
			var targetObjChildren = targetObj.find("[data-dpl-job-info=ord]");
			targetObjChildren.attr("data-job-ord", jobOrd);
			targetObjChildren.text(jobOrd);
			targetObj.attr("data-job-ord", jobOrd);
		}
	};
	
	
	var fnJobDivOrdModify = function(item, newIndex, oldIndex){
		
		
		$.each($("[data-dpl-job-info=ord]"),function(idx, map){
			
			
			var targetOrd = parseInt($(map).attr("data-job-ord"));
						
			
			if(oldIndex > newIndex){
				
				if(idx < newIndex || idx > oldIndex){
					return true;
				}else{
					targetOrd = targetOrd+1;
				}
			}
			
			else if(oldIndex < newIndex){
				
				if(idx > newIndex || idx < oldIndex){
					return true;
				}else{
					targetOrd = targetOrd-1;
				}
			}
			
			
			$(map).attr("data-job-ord", targetOrd);
			$(map).text(targetOrd);
			$(map).parents("[data-dpl-job-info=jobinfo]").attr("data-job-ord",targetOrd);
		});
		
		
		var changeTarget = $(item).find("[data-dpl-job-info=ord]");
		changeTarget.attr("data-job-ord", newIndex+1);
		changeTarget.text(newIndex+1);
		changeTarget.parents("[data-dpl-job-info=jobinfo]").attr("data-job-ord",newIndex+1); 
	};
	
	
	var fnGetDplAssignJobList = function(){
	
		var sendDatas = [];
    	
    	$.each($("[data-dpl-job-info=jobinfo]"), function(idx, map){
    		var jenId = $(map).data("dpl-jenid");
    		var jobId = $(map).data("dpl-jobid");
    		sendDatas.push({jenId:jenId, jobId:jobId});
    	});
		
    	return sendDatas;
	};
	
	
	
	return {
        
        init: function() {
        	documentSetting();
        },
        setUsrInfo: function(usrInfo){
        	var parseUsrInfo = JSON.parse(usrInfo);
        	
        	
        	$("#dplUsrId").val(parseUsrInfo.usrId);
        	$("#dplUsrNm").val(parseUsrInfo.usrNm);
        },
        
        setDplJob:function(jobDatas){
        	fnSetDplJobInfo(jobDatas);
        },
        
        getDplJob: function(){
        	return fnGetDplAssignJobList();
        }
    };
}();

$.osl.ready(function(){
	OSLDpl1001Popup.init();
});
</script>

