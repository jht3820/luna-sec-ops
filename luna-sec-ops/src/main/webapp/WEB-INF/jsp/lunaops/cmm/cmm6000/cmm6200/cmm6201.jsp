<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form class="kt-form" id="frCmm6201" autocomplete="off">
	<input type="hidden" name="paramPrjId" id="paramPrjId"/>
	<input type="hidden" name="paramReqId" id="paramReqId"/>
	<div class="osl-req__process-main d-flex">
		<div class="osl-req__process-history">
			<div class="osl-flowchart__operator">
				<div class="flowchart-operator-title" style="background-color:#ffffff;color:#000000;">
					<div class="flowchart-operator-title__lebel d-inline-block text-truncate">1번 단계</div>
				</div>
				<div class="flowchart-operator-inputs-outputs">
				
				</div>
				<div class="osl-flowchart__label"><i class="fa fa-arrow-right"></i></div>
			</div>
			<div class="osl-flowchart__operator">
				<div class="flowchart-operator-title" style="background-color:#ffffff;color:#000000;">
					<div class="flowchart-operator-title__lebel d-inline-block text-truncate">1번 단계</div>
				</div>
				<div class="flowchart-operator-inputs-outputs">
				
				</div>
				<div class="osl-flowchart__label"><i class="fa fa-arrow-right"></i></div>
			</div>
			
			
		</div>
	</div>
	<div class="osl-wizard" id="requestProcessWizard" data-ktwizard-state="step-first">
		<div class="osl-wizard__nav">
			<div class="osl-wizard__nav-items osl-wizard__nav-items--clickable">
				<div class="osl-wizard__nav-item" data-ktwizard-type="step" data-ktwizard-state="current">
					<div class="osl-wizard-wrapper">
						<div class="wizard-label">
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.mmtTitle">요구사항 정보</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.mmtDesc">선택 요구사항 목록 확인</span></div>
						</div>
					</div>
				</div>
				<div class="osl-wizard__nav-item" data-ktwizard-type="step">
					<div class="osl-wizard-wrapper">
						<div class="wizard-label">
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.sprPtTitle">기본 항목 입력</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.sprPtDesc">요구사항 기본 항목 입력</span></div>
						</div>
					</div>
				</div>
				<div class="osl-wizard__nav-item" data-ktwizard-type="step">
					<div class="osl-wizard-wrapper">
						<div class="wizard-label">
							<div class="wizard-title"><span data-lang-cd="spr1003.wizard.main.chargerTitle">프로세스 선택</span></div>
							<div class="wizard-desc"><span data-lang-cd="spr1003.wizard.main.chargerDesc">이관 프로세스 선택</span></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="osl-wizard__content osl-min-h-px--575 w-100 kt-bg-light kt-padding-l-40 kt-padding-r-40" data-ktwizard-type="step-content" data-ktwizard-state="current">
		
		</div>
	</div>
</form>
<div class="modal-footer">
	<button type="button" class="btn btn-outline-brand" data-dismiss="modal"><i class="fa fa-window-close"></i><span data-lang-cd="modal.close">Close</span></button>
</div>
<script>
"use strict";
var OSLCmm6201Popup = function () {
	var formId = 'frCmm6201';
	
    
    var documentSetting = function () {
    	
    };
	
    return {
        
        init: function() {
        	documentSetting();
        }
    };
}();


$.osl.ready(function(){
	OSLCmm6201Popup.init();
});

	
</script>