<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<title>OpenSoftLab</title>
<style>
.pop_menu_topLine{border-top: 1px solid #ddd;}
.pop_menu_col2 select {
    width: 100%;
    height: 100%;
    border: 1px solid #ccc;
    text-align-last: center;
    font-size: 10pt !important;
}
.button_complete{margin: 0 10px 0 10px;}
.pop_menu_row .pop_menu_col1, .pop_menu_row .pop_menu_col2{height:48px;line-height:33px;}
</style>
<script>

var popupGb = "${param.popupGb}";

$(document).ready(function() {
	
	var mstCdStrArr = "CMM00005";
	var strUseYn = 'Y';
	var arrObj = [$("#processMiddleDoneCd")];
	var arrComboType = ["OS",];
	getMulticommonCodeDataForm(mstCdStrArr, strUseYn, arrObj, arrComboType , false);
	
	
	var arrChkObj = {"processNm":{"type":"length","msg":"프로세스 명은 100byte까지 입력이 가능합니다.",max:100}
					,"processDesc":{"type":"length","msg":"프로세스 설명은 4000byte까지 입력이 가능합니다.",max:4000}
					,"processOrd":{"type":"number","msg":"프로세스 순서는 숫자만 입력 가능합니다.",min:0}
					};
	gfnInputValChk(arrChkObj);
	
	
	$('#btn_close_optClose').click(function() {
		gfnLayerPopupClose();
	});
	
	
	if(popupGb == "insert"){
		
		$("#processOrd").val(($(".process_box").length+1));
	}
	
	if(popupGb == "update"){
		
		if(!gfnIsNull("${processInfo.processDesc}")){
			
			$("#processDesc").val(decodeURI("${processInfo.processDesc}"));
		}
	}
	
	
	$("#processNm").focus();

	
	$("#btn_insert_flowPopup").click(function(){
		
		if(gfnSaveInputValChk(arrChkObj)){
			fnProcessSaveAjax();
		}
	});
});



function fnProcessSaveAjax(){
	
	if($(".inputError").length > 0){
		jAlert("유효하지 않은 값이 입력된 항목이 존재합니다.<br>항목을 확인해주세요.","알림");
		$(".inputError")[0].focus()
		return false;
	}
	
	var processId = "";
	var processConfirmCd = "";
	var url = "";
	var queryJson = {};
	
	
	if(popupGb == "insert"){ 
		url = "<c:url value='/prj/prj1000/prj1100/insertPrj1100ProcessInfoAjax.do'/>"
		processConfirmCd = "01";
	}else if(popupGb == "update"){ 
		url = "<c:url value='/prj/prj1000/prj1100/updatePrj1100ProcessInfoAjax.do'/>"
		processId = $(".process_box.active").attr('id');
	}else{
		jAlert("잘못된 요청입니다.","경고");
	}
	
	
	var processNm = $("#processNm").val();
	if(!gfnIsNull(processNm)){
		
		var processDesc = encodeURI(gfnCutStrLen($("#processDesc").val(),4000));

		
		var processId = "${param.processId}";
		var processNm = $("#processNm").val();
		var processOrd = $("#processOrd").val();
		var processConfirmCd = $("#processConfirmCd").val();
		var processMiddleDoneCd = $("#processMiddleDoneCd").val();
		
		
		if(gfnIsNull(processConfirmCd)){
			processConfirmCd = "01";
		}
		
		
		var ajaxObj = new gfnAjaxRequestAction(
				{"url":url},
				{processNm:processNm,processId: processId,processDesc: processDesc, processOrd: processOrd, processMiddleDoneCd: processMiddleDoneCd, processConfirmCd: processConfirmCd});
		
		ajaxObj.setFnSuccess(function(data){
			data = JSON.parse(data);
			
			toast.push(data.message);
			
			
			if(data.errorYN != "Y"){
				
				if(popupType == "update"){
					$(".process_box.active").html(processNm);
					$(".process_box.active").attr("desc",processDesc);
					$(".process_box.active").attr("ord",processOrd);
				}else{
	        		
	        		fnProcessListAjax();
				}
				
				$("#btn_insert_plcCancle").click();
			}
			
			gfnLayerPopupClose();
		});
		
		
		ajaxObj.setFnError(function(xhr, status, err){
			data = JSON.parse(data);
			jAlert(data.message, "알림");
	 	});
		
		ajaxObj.send();
	}else{
		jAlert("프로세스명을 입력해주세요.","알림",function(){
			
			$("#processNm").focus();
		});
		return false;
	}
}
</script>

<div class="popup" style="height:100%;">
<form id="prj1105PopupFrm" name="prj1105PopupFrm" method="post">
	<input type="hidden" name="processConfirmCd" id="processConfirmCd" value="${processInfo.processConfirmCd}" />
	<div class="pop_title">프로세스 <c:choose><c:when test="${param.popupGb == 'update'}">수정</c:when><c:otherwise>생성</c:otherwise></c:choose></div>
	<div class="pop_sub" style="padding:15px;display: inline-block;">
		<div class="pop_menu_row pop_menu_oneRow pop_menu_topLine">
			<div class="pop_menu_col1"><label for="prjNm">프로세스 명 </label><span class="required_info">&nbsp;*</span></div>
			<div class="pop_menu_col2">
				<input id="processNm" type="text" name="processNm" title="프로세스 명" value="${processInfo.processNm}" />
			</div>
		</div>
		<div class="pop_menu_row pop_menu_oneRow">
			<div class="pop_menu_col1"><label for="prjNm">순서 </label><span class="required_info">&nbsp;*</span></div>
			<div class="pop_menu_col2">
				<input id="processOrd" type="number" name="processOrd" title="순서" value="${processInfo.processOrd}" min="0"/>
			</div>
		</div>
		<div class="pop_menu_row pop_menu_oneRow">
			<div class="pop_menu_col1"><label for="prjNm">중간 종료 가능 여부</label><span class="required_info">&nbsp;*</span></div>
			<div class="pop_menu_col2">
				<select id="processMiddleDoneCd" name="processMiddleDoneCd" modifyset="false" OS="${processInfo.processMiddleDoneCd}"></select>
			</div>
		</div>
		<div class="pop_note" style="margin-bottom:10px;">
			<div class="note_title">프로세스 설명</div>
			<textarea class="input_note" title="프로세스 설명" name="processDesc" id="processDesc" rows="7" value=""  ></textarea>
		</div>
		
		<div class="flw_btn_box">
			<div class="button_complete" id="btn_insert_flowPopup"><i class="fa fa-save"></i>&nbsp;저장</div>
			<div class="button_complete" id="btn_close_optClose"><i class="fa fa-times"></i>&nbsp;닫기</div>
		</div>
	</div>
</div>
</form>
</div>
</html>
