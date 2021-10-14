<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form class="kt-form" id="">
	<div class="kt-portlet kt-portlet--mobile kt-margin-b-0">
		
		<div class="kt-portlet__body">				
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group kt-margin-b-0">
						<label class="required">구성항목 명</label>
						<input type="text" class="form-control" value="서버" id="" name="">
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group kt-margin-b-0">
						<label class="required">순번</label>
						<input type="text" class="form-control"  id="" name="">
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="kt-portlet kt-portlet--mobile kt-margin-t-20 kt-margin-b-0" id="req2002MetaInfo">
		<div class="kt-portlet__head kt-portlet__head--lg">
			<div class="kt-portlet__head-label">
				<h4 class="kt-font-boldest kt-font-brand">
					<i class="fas fa-info-circle kt-margin-r-5"></i>메타 정보
				</h4>
			</div>
			<div class="kt-portlet__head-toolbar">
				
				<div class="kt-portlet__head-wrapper">
					<div class="dropdown dropdown-inline mr-4">
						<button type="button" class="btn btn-light-primary btn-icon btn-sm" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="far fa-plus-square kt-font-brand kt-font-xl"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-right">
							<div class="dropdown-item" id="newMetaInfo">메타정보 신규 추가</div>
							<div class="dropdown-item" id="existingMetaInfo">기존항목 불러오기</div>
						</div>
					</div>
				</div>
				
				
				<div class="kt-portlet__head-group">
					<a href="#" data-ktportlet-tool="toggle" class="btn btn-sm btn-icon btn-clean btn-icon-md">
						<i class="fa fa-chevron-down"></i>
					</a>
				</div>
				
			</div>
		</div>
		<div class="kt-portlet__body">
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label class="required">라이선스 명</label>
						<a href="#" class="btn btn-icon btn-sm float-right" data-card-tool="remove" data-toggle="tooltip" data-placement="top" title="" data-original-title="Remove Input">
							<i class="fas fa-times kt-font-metal"></i>
						</a>
						<input type="text" class="form-control" id="" name="">
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label>가동 시간</label>
						<a href="#" class="btn btn-icon btn-sm float-right" data-card-tool="remove" data-toggle="tooltip" data-placement="top" title="" data-original-title="Remove Input">
							<i class="fas fa-times kt-font-metal"></i>
						</a>
						<input type="text" class="form-control" id="" name="">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label>만료 일시</label>
						<a href="#" class="btn btn-icon btn-sm float-right" data-card-tool="remove" data-toggle="tooltip" data-placement="top" title="" data-original-title="Remove Input">
							<i class="fas fa-times kt-font-metal"></i>
						</a>
						<input type="date" class="form-control" id="expireDtm" name="expireDtm">
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="form-group">
						<label>구매 일자</label>
						<a href="#" class="btn btn-icon btn-sm float-right" data-card-tool="remove" data-toggle="tooltip" data-placement="top" title="" data-original-title="Remove Input">
							<i class="fas fa-times kt-font-metal"></i>
						</a>
						<input type="date" class="form-control" id="purchaseDtm" name="purchaseDtm">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="form-group">
						<label>비고</label>
						<a href="#" class="btn btn-icon btn-sm float-right" data-card-tool="remove" data-toggle="tooltip" data-placement="top" title="" data-original-title="Remove Input">
							<i class="fas fa-times kt-font-metal"></i>
						</a>
						<textarea class="form-control form-control-solid osl-textarea__resize--none" id="" name="" rows="3"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-brand" id=""><span>완료</span></button>
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><span data-lang-cd="modal.close">닫기</span></button>
</div>


<script>
"use strict";
var OSLReq2002Popup = function () {
	var documentSetting = function(){
		
		
    	new KTPortlet('req2002MetaInfo', $.osl.lang("portlet"));
		
		
		$.osl.date.datepicker($('#expireDtm'), {});
		
		
		$.osl.date.datepicker($('#purchaseDtm'), {});
		
		
		$('#newMetaInfo').click(function(){
			var data = {
			};
			var options = {
				modalTitle: "메타정보 항목 등록",
				autoHeight: false
			};
			$.osl.layerPopupOpen('/req/req2000/req2000/selectReq2003View.do',data,options);	
		});
		
		
		$('#existingMetaInfo').click(function(){
			var data = {
			};
			var options = {
				modalTitle: "기존항목 불러오기",
				autoHeight: false
			};
			$.osl.layerPopupOpen('/req/req2000/req2000/selectReq2004View.do',data,options);	
		});
		
	};
	
	return {
        
        init: function() {
        	documentSetting();
        }
        
    };
}();

$.osl.ready(function(){
	OSLReq2002Popup.init();
});
</script>

