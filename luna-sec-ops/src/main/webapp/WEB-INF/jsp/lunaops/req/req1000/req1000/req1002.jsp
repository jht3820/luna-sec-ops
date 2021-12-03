<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frReq1002" autocomplete="off">
	<input type="hidden" name="type" id="type" value="<c:out value='${param.type}'/>">
	<input type="hidden" name="reqUsrId" id="reqUsrId" value="<c:out value='${param.paramReqUsrId}'/>">
	<input type="hidden" name="reqPrjId" id="reqPrjId" value="<c:out value='${param.paramPrjId}'/>">
	<input type="hidden" name="atchFileId" id="atchFileId">
	<div class="kt-portlet kt-portlet--collapsed" id="req1002RequestUsrInfo">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req1002.label.reqUser.title">요청자 정보</span>
			</div>
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-group">
					<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
				</div>
			</div>
		</div>
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-xl-2 kt-align-center">
					<a href="#" class="kt-media kt-media--xl kt-media--circle">
						<img type="img" id="usrImgId">
					</a>
				</div>
				<div class="col-xl-5">
					<div class="form-group">
						<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req1002.label.reqUser.usrNm">요청자 이름</span></label>
						<input type="text" class="form-control"  name="reqUsrNm" id="usrNm" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-5">
					<div class="form-group">
						<label><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req1002.label.reqUser.email">요청자 e-mail</span></label>
						<input type="text" class="form-control" name="reqUsrEmail" id="email" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-7">
					<div class="form-group">
						<label><i class="fa fa-envelope-square kt-margin-r-5"></i><span data-lang-cd="req1002.label.reqUser.deptNm">요청자 소속</span></label>
						<input type="text" class="form-control" name="reqUsrDeptNm" id="deptName" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-5">
					<div class="form-group">
						<label><i class="fa fa-phone-square-alt kt-margin-r-5"></i><span data-lang-cd="req1002.label.reqUser.telNo">요청자 연락처</span></label>
						<input type="text" class="form-control" name="reqUsrNum" id="telno" readonly="readonly">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet kt-portlet--collapsed" id="req1002ReqGroupInfo">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<i class="fa flaticon2-layers-1 kt-margin-r-5"></i><span data-lang-cd="req1002.label.group.groupReqInfo">그룹 요구사항 정보</span>
			</div>
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-group">
					<div class="kt-portlet__head-group">
						<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div class="kt-portlet__body">
			<div class="form-group">
				<label><i class="fa fa-pen-square kt-margin-r-5"></i><span data-lang-cd="req1002.label.group.groupReqNo">그룹 요구사항 번호</span></label>
				<div class="input-group">
					<input type="text" class="form-control" name="reqGrpNo" id="reqGrpNo" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req1002.label.group.groupReq">그룹 요구사항</span></label>
				<div class="input-group">
					<input type="text" class="form-control" name="reqGrpNm" id="reqGrpNm" readonly="readonly">
				</div>
			</div>
			<div class="form-group kt-margin-b-0"  id="groupReqDescDiv">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req1002.label.group.groupReqDesc">그룹 요구사항 내용</span></label>
				<textarea class="kt-hide" name="reqGrpDesc" id="reqGrpDesc"></textarea>
			</div>
		</div>
	</div>
	<div class="kt-portlet">
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-project-diagram kt-margin-r-5"></i><span data-lang-cd="req1002.label.prjNm">프로젝트</span></label>
						<input type="text" class="form-control" name="prjNm" id="prjNm" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-calendar-alt kt-margin-r-5"></i><span data-lang-cd="req1002.label.reqDtm">요청 일자</span></label>
						<input type="date" class="form-control" name="reqDtm" id="reqDtm" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-pen-square kt-margin-r-5"></i><span data-lang-cd="req1002.reqId">요구사항 ID</span></label>
						<input type="text" class="form-control" name="reqId" id="reqId" value="<c:out value='${param.paramReqId}'/>" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-6">
					<div class="form-group">
						<label><i class="fa fa-bars kt-margin-r-5"></i><span data-lang-cd="req1002.label.reqOrd">요구사항 순번</span></label>
						<input type="text" class="form-control" name="reqOrd" id="reqOrd" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4">
					<div class="form-group">
						<label><i class="fa fa-code-branch kt-margin-r-5"></i><span data-lang-cd="req1002.label.reqProTypeNm">처리 유형</span></label>
						<input type="text" class="form-control" name="reqProTypeNm" id="reqProTypeNm" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-4">
					<div class="form-group">
						<label><i class="fa fa-headset kt-margin-r-5"></i><span data-lang-cd="req1002.label.processNm">프로세스명</span></label>
						<input type="text" class="form-control" name="processNm" id="processNm" readonly="readonly">
					</div>
				</div>
				<div class="col-xl-4">
					<div class="form-group">
						<label><i class="fa fa-tasks kt-margin-r-5"></i><span data-lang-cd="req1002.label.flowNm">단계명</span></label>
						<input type="text" class="form-control" name="flowNm" id="flowNm" readonly="readonly" readonly="readonly">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req1002.label.reqNm">요청 제목</span></label>
				<input type="text" class="form-control" name="reqNm" id="reqNm"  readonly="readonly">
			</div>
			<div class="form-group">
				<label><i class="fa fa-edit kt-margin-r-5"></i><span data-lang-cd="req1002.label.reqDesc">요청 내용</span></label>
				<textarea  class="kt-hide" name="reqDesc" id="reqDesc"></textarea>
			</div>
			<div class="form-group kt-margin-t-25 form-group-last" id="reqFileListDiv">
				<label>
					<i class="fa fa-file-upload kt-margin-r-5"></i>
					<span data-lang-cd="req1002.label.attachments">파일 첨부</span> 
				</label>
				<div class="kt-uppy osl-max-h-px-260 fileReadonly" name="fileListDiv" id="fileListDiv">
					<div class="kt-uppy__dashboard"></div>
					<div class="kt-uppy__progress"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="kt-portlet" data-ktportlet="true" id="req1002NewRequestOpt">
		<div class="kt-portlet__head">
			<div class="kt-portlet__head-label">
				<i class="fa fa-user kt-margin-r-5"></i><span data-lang-cd="req1002.label.requestDefaultOptNm">접수 기본항목 입력</span>
			</div>
			<div class="kt-portlet__head-toolbar">
				<div class="kt-portlet__head-group">
					<a href="#" class="btn btn-sm btn-icon btn-clean btn-icon-md btn-elevate btn-elevate-air" data-toggle="dropdown" data-skin="brand" data-placement="bottom" tabindex="1"><i class="fa fa-plus"></i></a>
					<div class="dropdown-menu dropdown-menu-right">
						<div class="dropdown-item" id="insertBasicItemBtn"><i class="fa fa-plus kt-font-brand"></i>신규 항목 추가</div>
						<div class="dropdown-item" id="selectBasicItemBtn"><i class="fa fa-list-alt kt-font-brand"></i>기본항목 불러오기</div>
					</div>
					<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md"><i class="fa fa-chevron-down"></i></a>
				</div>
			</div>
		</div>
		<div class="kt-portlet__body">
			<div class="row" id="basicItemList">
			
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">Close</span></button>
</div>

<script>
"use strict";
var OSLReq1002Popup = function () {
	var formId = 'frReq1002';

	//edit 목록
	var formEditList = [];
	
	//파일 업로드 세팅
	var fileUploadObj;

	//프로젝트 기본항목 리스트
	var basicItemList = new Array();
	
    // Private functions
    var documentSetting = function () {

    	//Portlet 세팅
    	new KTPortlet('req1002RequestUsrInfo', $.osl.lang("portlet"));
    	new KTPortlet('req1002ReqGroupInfo', $.osl.lang("portlet"));
    	new KTPortlet('req1002NewRequestOpt', $.osl.lang("portlet"));
    	
    	//파일 업로드 세팅
    	fileUploadObj = $.osl.file.uploadSet("fileListDiv",{
    		maxFileSize: "${requestScope.fileSumMaxSize}",
    		meta: {"atchFileId": $("#atchFileId").val(), "fileSn": 0},
    		height: 260,
    		isDraggingOver: false,
    		fileDownload: true,
    		fileReadonly: true
    	});
    	
    	//요구사항 정보 조회
		selectReqInfo();
    };
    /**
	 * 	요구사항 정보 조회
	 */
	 var selectReqInfo = function() {
    	var data = {
    			prjId :  $("#reqPrjId").val(),
    			reqId :  $("#reqId").val(),
    			reqUsrId : $("#reqUsrId").val()
    	};
    	
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"<c:url value='/req/req4000/req4100/selectReq4100ReqInfoAjax.do'/>", "async":"false"}
				,data);
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});

				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				
				//요구사항 정보 세팅
		    	$.osl.setDataFormElem(data.reqInfoMap,"frReq1002");

				//요청자 정보 세팅
		    	$("#reqUsrId").val(data.reqInfoMap.reqUsrId);
		    	$("#usrNm").val(data.reqInfoMap.reqUsrNm);
		    	$("#email").val(data.reqInfoMap.reqUsrEmail);
		    	$("#telno").val(data.reqInfoMap.reqUsrNum);
		    	$("#deptName").val(data.reqInfoMap.reqUsrDeptNm);
		    	$("#deptId").val(data.reqInfoMap.reqUsrDeptId);
		    	$("#usrImgId").attr("src",$.osl.user.usrImgUrlVal(data.reqInfoMap.reqUsrImgId));
		    	
		    	//처리 유형이 접수 요청인 경우에만
		    	if(data.reqInfoMap.reqProType=='01'){
					//프로세스명과 단계명 메시지 입력
					$("#processNm").val($.osl.lang("req1002.message.notProcess"));
					$("#flowNm").val($.osl.lang("req1002.message.notStep"));
				}
		    	
		    	//edit 세팅
		    	formEditList.push($.osl.editorSetting("reqDesc", {
		    		toolbar: false,
	    			disableResizeEditor: false,
	    			disableDragAndDrop: true,
	    			disabledEditor: true,
	    			height:260
		    	}));
		    	//edit 세팅하고 나서 textarea 보이기
		    	$("#reqDesc").removeClass("kt-hide");
		    	
		    	//그룹요구사항 내용 세팅
		    	$("#reqGrpNo").val(data.reqInfoMap.reqGrpNo);
		    	$("#reqGrpNm").val(data.reqInfoMap.reqGrpNm);
		    	
		    	//그룹요구사항 내용이 있는지
				if($.osl.isNull(data.reqInfoMap.reqGrpId)){
					//연결된 요구사항이 없는 경우
					//그룹 요구사항 message를 제목에 세팅
					$("#reqGrpNo").val($.osl.lang("req1002.message.notGroupReqNo"));
					$("#reqGrpNm").val($.osl.lang("req1002.message.notGroupReqInfo"));
					//내용이 없으므로 라벨도 숨기기
					$("#groupReqDescDiv").addClass("kt-hide");
				}else{
					//연결된 요구사항이 있는 경우
			    	formEditList.push($.osl.editorSetting("reqGrpDesc", {
			    		toolbar: false,
		    			disableResizeEditor: false,
		    			disableDragAndDrop: true,
		    			disabledEditor: true,
		    			height:180
		    		}));
			    	//edit 세팅하고 나서 textarea 보이기
			    	$("#reqGroupDesc").removeClass("kt-hide");
				}
		    	
				if($.osl.isNull(data.fileList)){
		    		//파일 목록이 없는 경우 해당 div 숨기기
		    		$("#reqFileListDiv").addClass("kt-hide");
		    	}else{
		    		//파일 목록이 있는 경우
		    		$("#reqFileListDiv").removeClass("kt-hide");

			    	//파일Sn넣기
			    	//fileUploadObj.setMeta({fileSn: parseInt(data.fileListCnt)+1});
			    	
			    	//파일 목록 세팅
			    	$.osl.file.fileListSetting(data.fileList, fileUploadObj);
		    	}
				
				basicItemList = data.basicItemList;
				basicItemList = basicItemList.concat(data.basicItemInsertList);
		    	$.osl.customOpt.setting(basicItemList,  "basicItemList",
		    			//usrConfig
		    			{
		    				viewType: "preview",
		    				readOnly: true
						}
	    		);
				
			}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};

    return {
        // public functions
        init: function() {
        	documentSetting();
        },
        setUsrInfo: function(temp){
        	var parseTemp = JSON.parse(temp);
        	
        	//사용자 정보 입력하기
        	$("#reqUsrId").val(parseTemp.usrId);
        	$("#deptId").val(parseTemp.deptId);
        	$("#usrNm").val(parseTemp.usrNm);
        	$("#email").val(parseTemp.email);
        	$("#deptName").val(parseTemp.deptName);
        	$("#telno").val(parseTemp.telno);
        }
    };
}();

// Initialization
$.osl.ready(function(){
	OSLReq1002Popup.init();
});

	
</script>