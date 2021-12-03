
var OSLCoreCustomOptionSetting = function () {
	
	var osl_option_setting = function(optList, htmlTargetObj, usrConfig, callbackFn){
		
		var optList = optList;
		
		
		var optDateDataArr = [];

		
		var optHtmlData = '';

		
		var dateObjList = [];
		var dateTimeObjList = [];
		
		
		var mstCdStrArr = '';
		var selectObjList = [];
		var arrComboType = [];

		
		var readonlyFileIdList = [];

		
		var fileIdList = [];
		
		
		var commonPopup_charger = [];
		var commonPopup_cls = [];
		var commonPopup_dept = [];
		
		
		
		var defaultConfig = {
				
				"viewType": "default",
				
				"delAt": false,
				
				"updAt": false,
				
				"badgeAt": false,
				
				"readOnly": false,
				
				"actionFn":{},	
				
				"htmlAppendType":false,
				
				"classNm":{
					"preview_readonly": "osl-preview-readonly",
					"preview_hide": "osl-preview-hide",
					
					"option_readonly": "option_readonly",
				},
		};
		
		
		var config = $.extend(true,defaultConfig, usrConfig);

		
		
		
		var rtnStrArr = [];
		var rtnStrValue = [];
		
		
		if(!$.osl.isNull(optList) && optList.length > 0){
			
			
			
			
			
			
			
			
			$.each(optList,function(idx, map){
				
				
				var optionPcWidthSize = "col-lg-"+map.itemPcRowNum;
				var optionTabletWidthSize = "col-md-"+map.itemTabletRowNum;
				var optionMobileWidthSize = "col-sm-"+map.itemMobileRowNum;
				
				
				var optContentData = '';
				
				var optContentLabel = '';
				
				var requiredLabelTxt = "";
				var requiredTxt = "";
				var previewReadOnlyClass="";
				var previewHideClass="";
				if(config.viewType=="preview"){
					previewReadOnlyClass = config.classNm.preview_readonly;
					previewHideClass = config.classNm.preview_hide;
				}
				
				if(map.itemEssentialCd=='01'){
					requiredLabelTxt = "required";
					if(config.viewType=="preview"){
						requiredTxt = "";
					}else{
						requiredTxt = "required";
					}
					
				}
				
				
				var itemNm = map.itemNm;
				
				
				itemNm = $.osl.escapeHtml(itemNm);
				
				
				var itemValue = '';
				var itemValueNm = '';
				
				
				var optReadOnlyChk = false;
				var optReadOnly = 'readonly="readonly"';
				var optAddClass = config.classNm.option_readonly;
				
				
				if(config.readOnly){
					optReadOnlyChk = true;
				}
				
				
				if(!$.osl.isNull(map.itemValue)){
					itemValue = map.itemValue;
					
					itemValue = $.osl.escapeHtml(itemValue);
				}
				
				
				if(!$.osl.isNull(map.itemValueNm)){
					itemValueNm = map.itemValueNm;
					
					
					itemValueNm = $.osl.escapeHtml(itemValueNm);
				}
				
				
				if(map.itemCode == "01"){ 
					if(map.itemType == "01"){ 
						if(!optReadOnlyChk){
							
							optReadOnly = optAddClass = '';
						}
						
						optContentLabel = '<label class="'+requiredLabelTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
						optContentData = '<input type="text" class="form-control '+previewReadOnlyClass+'" title="'+itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" maxlength="'+map.itemLength+'" value="'+itemValue+'" '+optReadOnly+' '+requiredTxt+'/>';
					}else if(map.itemType == "02"){ 
						if(!optReadOnlyChk){
							
							optReadOnly = optAddClass = '';
						}
					
						
						itemValue = itemValue.replace(/<br>/gi,"\n").replace(/<\/br>/gi,"\n");
						optContentLabel = '<label class="'+requiredLabelTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
						optContentData = '<textarea class="form-control osl-min-h-px--220 osl-textarea__resize--none '+previewReadOnlyClass+' '+optAddClass+'" title="'+itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" '+optReadOnly+' '+requiredTxt+'>'+itemValue+'</textarea>';
					}else if(map.itemType == "03"){ 
						if(!optReadOnlyChk){
							optReadOnly = optAddClass = '';
						}
						var optChkVal = ""
						
						if(map.itemValue == "01"){
							optChkVal = " checked";
						}
						
						optContentLabel = '<label class="'+requiredLabelTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
						optContentData = 
							 '<div class="form-group kt-margin-b-10"><label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" class="'+previewReadOnlyClass+'" id="'+map.itemId+'" name="'+map.itemId+'" '+optChkVal+' '+optReadOnly+' '+requiredTxt+'/>'
							+'<span></span></label></div>';
					}else if(map.itemType == "04"){ 
						if(!optReadOnlyChk){
							optAddClass = '';
							
							dateObjList.push(map.itemId);
							previewReadOnlyClass="osl-input-readonly-none";
						}
						optContentLabel = '<label class="'+requiredLabelTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
						optContentData = '<input type="text" class="form-control '+previewReadOnlyClass+'" title="'+itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" readonly="readonly"  value="'+itemValue+'" '+optReadOnly+' '+requiredTxt+'/>';
					}else if(map.itemType == "05"){ 
						if(!optReadOnlyChk){
							optAddClass = '';
							
							dateTimeObjList.push(map.itemId);
							previewReadOnlyClass="osl-input-readonly-none";
						}
						
						optContentLabel = '<label class="'+requiredLabelTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
						optContentData = '<input type="text" class="form-control '+previewReadOnlyClass+'" title="'+itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" readonly="readonly"  value="'+itemValue+'" '+optReadOnly+' '+requiredTxt+'/>';
					}else if(map.itemType == "06"){ 
						if(!optReadOnlyChk){
							optReadOnly = optAddClass = '';
						}
						
						optContentLabel = '<label class="'+requiredLabelTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
						optContentData = '<input type="number" class="form-control basicItemNumber" placeholder="'+itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" min="'+map.itemMinVal+'" max="'+map.itemMaxVal+'" maxlength="11" value="'+itemValue+'" '+optReadOnly+' '+requiredTxt+'/>';
					}else if(map.itemType == "07"){ 
						if(!optReadOnlyChk){
							
							
							
						}
						
						
						
					}
				}else if(map.itemCode == "02"){ 
					if(optReadOnlyChk){
						optReadOnly = 'disabled="disabled"';
					}else{
						optAddClass = '';
						
						selectObjList.push({targetId:map.itemId, commCode : map.itemCommonCode});
					}
					optContentLabel = '<label class="'+requiredLabelTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
					optContentData = '<select class="form-control kt-select2 '+previewReadOnlyClass+'" title="'+itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" opttype="-1" data-osl-value="'+itemValue+'" '+optReadOnly+' '+requiredTxt+'></select>';
					
				}else if(map.itemCode == "03"){ 
					
					if(!optReadOnlyChk){
						fileIdList.push(map.itemId);
					}
					
					optContentLabel = '<label class="'+requiredLabelTxt+'"><i class="fa fa-file-upload kt-margin-r-5"></i>'+itemNm+'<button type="button" class="btn btn-sm btn-danger d-none kt-margin-l-10" id="fileRemoveResetBtn">삭제 초기화</button></label>'
					optContentData = 
						 '<div class="kt-uppy osl-max-h-px-260 fileReadonly" name="'+map.itemId+'FileDiv" id="'+map.itemId+'FileDiv" '+requiredTxt+'>'
						+	'<input type="hidden" id="'+map.itemId+'" name="'+map.itemId+'">'
						+	'<div class="kt-uppy__dashboard"></div>'
						+	'<div class="kt-uppy__progress"></div>'
						+'</div>';
				}else if(map.itemCode == "04"){ 
					var popupBtnStr = '';
					if(!optReadOnlyChk){
						optReadOnly = optAddClass = '';
						
						
						commonPopup_charger.push(map.itemId);
					}
					optContentLabel = '<label class="'+requiredLabelTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
					optContentData = 
						'<div class="input-group">'
						+'		<input type="text" class="form-control kt-hide" placeholder="'+itemNm+'" name="'+map.itemId+'" id="'+map.itemId+'" value="'+itemValue+'" opttype="-1" '+optReadOnly+'>'
						+'		<input type="text" class="form-control '+previewReadOnlyClass+'" placeholder="'+itemNm+'" name="'+map.itemId+'Nm" id="'+map.itemId+'Nm" value="'+itemValueNm+'" opttype="-1" '+optReadOnly+'>'
						+'		<button type="button" class="btn btn-brand input-group-append '+config.classNm.preview_hide+'" id="'+map.itemId+'Btn" name="'+map.itemId+'Btn"><i class="fa fa-search"></i><span>검색</span></button>'
						+'</div>' ;
				}else if(map.itemCode == "05"){ 
					var popupBtnStr = '';
					
					if(!optReadOnlyChk){
						optReadOnly = optAddClass = '';
						
						
						commonPopup_cls.push(map.itemId);
						popupBtnStr = '<span class="button_normal2 fl" id="btn_cls_select_'+map.itemId+'"><li class="fa fa-search"></li></span>';
					}
					optContentData = '<input type="text" name="'+map.itemId+'" id="'+map.itemId+'" title="'+itemNm+'" value="'+itemValue+'" style="display:none;"/>'
										+'<input type="text" class="'+optAddClass+'" title="'+itemNm+'" name="'+map.itemId+'Nm" id="'+map.itemId+'Nm" modifyset="02" value="'+$.trim(map.itemValueNm)+'" readonly="readonly"/>'
										+popupBtnStr;
				}else if(map.itemCode == "06"){ 
					var popupBtnStr = '';
					if(!optReadOnlyChk){
						optReadOnly = optAddClass = '';
						
						
						commonPopup_dept.push(map.itemId);
					}
					
					
					
					optContentLabel = '<label class="'+requiredLabelTxt+'"><i class="fa fa-id-card kt-margin-r-5"></i><span>'+itemNm+'</span></label>';

					optContentData = 
						'<div class="input-group">'
						+'		<input type="text" class="form-control kt-hide" placeholder="'+itemNm+'" name="'+map.itemId+'" id="'+map.itemId+'" value="'+itemValue+'" opttype="-1" '+optReadOnly+'>'
						+'		<input type="text" class="form-control '+previewReadOnlyClass+'" placeholder="'+itemNm+'" name="'+map.itemId+'Nm" id="'+map.itemId+'Nm" value="'+itemValueNm+'" opttype="-1" '+optReadOnly+'>'
						+'		<button type="button" class="btn btn-brand input-group-append '+previewHideClass+'" id="'+map.itemId+'Btn" name="'+map.itemId+'Btn"><i class="fa fa-search"></i><span>부서검색</span></button>'
						+'</div>' ;
					
				}
				var delBtn = "";
				var updBtn = "";
				var optBadge = "";
				var badgeColor = "";
				
				
				if(config.delAt){
					delBtn = "<button type='button' class='osl-uppy__right close itemDelete' data-item-id='"+map.itemId+"'><i class='fa fa-window-close'></i></button>";
				}
				if(config.updAt){
					updBtn = "<button type='button' class='osl-uppy__right close kt-margin-r-5 itemUpdateBtn' data-item-id='"+map.itemId+"'><i class='fa fa-pen-square'></i></button>";
				}
				if(config.badgeAt){
					if(map.itemRequestCd == '01'){
						badgeColor = 'badge-info';
					}else{
						badgeColor = "osl-badge-lightgray";
					}
					optBadge += "<div class='badge "+badgeColor+" d-inline-block kt-margin-l-5 osl-basic-item-badge itemBadgeBtn' data-item-id='"+map.itemId+"' data-target-nm='itemRequestCd'>요청</div>";

					if(map.itemAcceptCd == '01'){
						badgeColor = 'badge-info';
					}else{
						badgeColor = "osl-badge-lightgray";
					}
					optBadge += "<div class='badge "+badgeColor+" d-inline-block kt-margin-l-5 osl-basic-item-badge itemBadgeBtn' data-item-id='"+map.itemId+"' data-target-nm='itemAcceptCd'>접수</div>";
				}
				
				var optCompleData =
							'<div class="'+optionPcWidthSize+' '+optionTabletWidthSize+' '+optionMobileWidthSize+' basicItemDiv">'
							+'	<div class="form-group">'
							+		optContentLabel
							+		optBadge
							+		delBtn
							+		updBtn
							+		optContentData
							+'	</div>'
							+'</div>';

				rtnStrValue += optCompleData;
				rtnStrArr.push($(optCompleData));
			});
			
			
			if(rtnStrArr.length > 0){
				
				if(!config.htmlAppendType){
					$("#"+htmlTargetObj).html(rtnStrValue);
				}else{
					$("#"+htmlTargetObj).append(rtnStrValue);
				}
			}
			
			
			$.osl.util.initInputNumber(".basicItemNumber");
			
			
			$(".itemDelete").off();
			$(".itemDelete").click(function(){
				if(config.actionFn.hasOwnProperty("delete")){
					config.actionFn.delete($(this));
				}else{
					$(this).parents(".basicItemDiv:first").remove();
				}
			});
			
			$(".itemBadgeBtn").off();
			$(".itemBadgeBtn").click(function(){
				if(config.actionFn.hasOwnProperty("update")){
					config.actionFn.update($(this), "01");
				}
			});
			
			$(".itemUpdateBtn").off();
			$(".itemUpdateBtn").click(function(){
				if(config.actionFn.hasOwnProperty("updateBtn")){
					config.actionFn.updateBtn($(this));
				}
			});
			
			
			if(!$.osl.isNull(fileIdList)){
				
				$.each(fileIdList,function(idx, map){
					
					
					
				});
			};
			
			
			
			
			
			if(!$.osl.isNull(dateObjList)){
				$.each(dateObjList,function(idx, map){
					$.osl.date.datepicker($("#"+map), {});
				});
			}
			
			if(!$.osl.isNull(dateTimeObjList)){
				$.each(dateTimeObjList,function(idx, map){
					
					$.osl.date.daterangepicker($("#"+map), {
						singleDatePicker: true,
						timePicker: true,
			 			timePicker24Hour:true,
			 			autoUpdateInput:false,
			 		    locale: { 
			 		    	format: 'YYYY-MM-DD hh:mm' 
	 		    		}, 
					},function(defaultConfig, start, end, label){
						$("#"+map).val(new Date(start._d).format('yyyy-MM-dd HH:mm'))
					});
				});
			}
			
			
			if(!$.osl.isNull(selectObjList)){
				
				$.each(selectObjList,function(idx, map){
					var commonCodeArr = [
			 			{mstCd: map.commCode, useYn: "Y",targetObj: "#"+map.targetId, comboType:"OS"},
					];
		   	
					
					$.osl.getMulticommonCodeDataForm(commonCodeArr , false);

					
					$('#'+map.targetId).select2();
				});
			}
			
			
			
			if(!$.osl.isNull(commonPopup_charger)){
				
				$.each(commonPopup_charger,function(idx, map){

			    	
			    	$("#"+map+"Nm").keypress(function(e){
			    		if (e.which === 13){
			    			$("#"+map+"Btn").click();
						}
			    	});
			    	
					$("#"+map+"Btn").click(function(){
			    		var data = {
			    				usrNm : $("#"+map+"Nm").val()
			    		};
			    		var options = {
			    				idKey: "searchUsr",
								modalTitle: $.osl.lang("req4101.modalTitle.userSearch"),
								closeConfirm: true,
								autoHeight:false,
								modalSize: "xl",
								callback:[{
									targetId: "selectUsr",
									actionFn: function(thisObj){
										var selUsrInfo = OSLCmm6401Popup.getUsrInfo();
										if(!$.osl.isNull(selUsrInfo)){
								        	var usrInfo = JSON.parse(selUsrInfo);
								        	
								        	$("#"+map).val(usrInfo.usrId);
								        	$("#"+map+"Nm").val(usrInfo.usrNm);
									        	
										}
									}
								}]
			    		};
			    		$.osl.layerPopupOpen('/cmm/cmm6000/cmm6400/selectCmm6401View.do',data,options);
			    	});
					
				});
			}

			
			
			
			
			var selectDeptInfo = function(targetItem, searchDeptNm){
		    	
			   var ajaxObj = new $.osl.ajaxRequestAction({"url":"/stm/stm6000/stm6000/selectStm6000BeforeCmmDeptList.do", 
					"loadingShow": false}, {"searchDeptNm":$.trim(searchDeptNm)});
				
				ajaxObj.setFnSuccess(function(data){
					if(data.errorYn == "Y"){
						$.osl.alert(data.message,{type: 'error'});
					}else{
						var deptList = data.deptList;
						if(deptList.length == 1){
							
							var deptId = deptList[0].deptId;
							var deptNm = deptList[0].deptName;
							
							if(!$.osl.isNull(deptId) && !$.osl.isNull(deptNm)){
	                    		$("#"+targetItem).val(deptId);
	                    		$("#"+targetItem+"Nm").val(deptNm);
	                    	}
						}else{
							
							callCommonDeptPopup(targetItem, searchDeptNm);
						}
					}
				});
				
				
				ajaxObj.send();
		    	
		   	};
		   	
		   	
			var callCommonDeptPopup = function(targetItem, searchDeptNm){
				var data = {deptName:searchDeptNm};
    			var options = {
    					idKey: "cmm6500",
    					modalSize: 'xl',
    					modalTitle: "조직 검색",
    					closeConfirm: false,
    					callback:[{
    	                    targetId: "cmm6500SelDept",
    	                    actionFn: function(thisObj){
    	                		var deptId = $(thisObj).data("dept-id");
    	                		var deptNm = $(thisObj).data("dept-nm");

    	                		if(!$.osl.isNull(deptId) && !$.osl.isNull(deptNm)){
    	                    		$("#"+targetItem).val(deptId);
    	                    		$("#"+targetItem+"Nm").val(deptNm);
    	                    	}
    	                    }
    	                 }]
    				};
    			
    			$.osl.layerPopupOpen('/cmm/cmm6000/cmm6500/selectCmm6500View.do',data,options);
			};
			
			if(!$.osl.isNull(commonPopup_dept)){
				
				$.each(commonPopup_dept,function(idx, map){
			    	
			    	$("#"+map+"Nm").keypress(function(e){
			    		if (e.which === 13){
			    			$("#"+map+"Btn").click();
						}
			    	});
					$("#"+map+"Btn").click(function(){
			    		var searchDeptNm = $.trim($("#"+map+"Nm").val());
			    		if($.osl.isNull(searchDeptNm)){
			    			
			    			callCommonDeptPopup(map);  			
			    		}else{
			    			if(searchDeptNm.lastIndexOf(">") > 0){
			    				
			    				searchDeptNm = searchDeptNm.substring(searchDeptNm.lastIndexOf(">")+1);
			    			}
				    		
				    		selectDeptInfo(map, searchDeptNm);
			    		}
			    	});
				});
			}
		}else{
			
			rtnStrValue = "데이터가 없습니다.";
		}
		
		
		if(typeof callbackFn == "function"){
			callbackFn();
		}
		
		
		return rtnStrArr;
		
		
	}
	
	return {
        
        init: function() {
        	
    		$.osl.customOpt.setting = osl_option_setting;
        }
    };
}();