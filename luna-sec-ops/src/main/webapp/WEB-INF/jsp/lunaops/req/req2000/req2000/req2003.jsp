<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form class="kt-form" id="">
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
		<div class="kt-portlet__body">				
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required">항목 명</label>
						<input type="text" class="form-control"  id="" name="" />
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required">항목 분류</label>
						<select class="form-control" id="" name="">
							<option value="1">기타</option>
							<option value="2">가동시간 (uptime)</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required">항목 타입</label>
						<select class="form-control" id="" name="">
							<option value="1">텍스트 박스</option>
							<option value="2">일시 (datetime)</option>
							<option value="3">일자 (date)</option>
							<option value="4">텍스트 영역 (textarea)</option>
						</select>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required">열 넓이</label>
						<select class="form-control" id="" name="">
							<option value="1">전체 (1)</option>
							<option value="2">부분 (1/2)</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required">순서</label>
						<input type="text" class="form-control" id="" name="" />
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required">공통 코드</label>
						<select class="form-control" id="" name="">
							<option value="1">사용</option>
							<option value="2">미사용</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row kt-margin-b-0">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required">길이 제한(byte)</label>
						<input type="text" class="form-control" id="" name="" />
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required">필수 유뮤</label>
						<select class="form-control" id="" name="">
							<option value="1">예</option>
							<option value="2">아니오</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id=""><i class="fa fa-save"></i><span class="osl-resize__display--show">완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span class="osl-resize__display--show" data-lang-cd="modal.close">닫기</span></button>
</div>


<script>
"use strict";
var OSLReq2003Popup = function () {
	var documentSetting = function(){
	};
	
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLReq2003Popup.init();
});
</script>

