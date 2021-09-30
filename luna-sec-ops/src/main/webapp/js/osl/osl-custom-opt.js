
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

		
		var essentialCdFileIdList = [];
		
		
		var commonPopup_charger = [];
		var commonPopup_cls = [];
		var commonPopup_dept = [];
		
		
		
		var defaultConfig = {
				
				"classNm":{
					
					"option_half": "option_half",
					
					
					"option_all": "option_all",
					
					
					"option_clear": "option_clear",
					
					
					"option_desc": "option_desc",
					
					
					"option_file": "option_file",
					
					
					"option_fileBtn": "option_fileBtn",
					
					
					"option_readonly": "option_readonly",
					
					
					"option_input_text": "option_input_text",
					
					
					"option_textarea": "option_textarea",
					
					
					"option_checkbox": "option_checkbox",
					
					
					"option_input_date": "option_input_date",
					
					
					"option_select": "option_select",
					
					
					"option_optCharger": "option_optCharger",
					
					
					"option_cls": "option_cls",
					
					
					"option_dept": "option_dept",
					
					
					"option_title": "option_title",
					
					
					"option_deploy": "option_deploy"
				},
				
				"optType":{
					"option_select": "02",
					"option_optCharger": "03",
					"option_cls": "04",
					"option_deploy": "05",
					"option_dept": "06"
				},
				
				
				"optTarget": "02",
				
				
				"optInitReadonly": false,
				
				
				"optFileUploadFunction": $.noop,
				
				
				"optLayoutPreview": false,
				
				
				"optEmptyAppend": true,
				
				"prjId": null,
		};
		
		
		var config = $.extend(true,defaultConfig, usrConfig);

		
		
		
		var removeEventArr = ["dragenter", "dragover", "drop"];
		
		
		var rtnStrArr = [];
		var rtnStrValue = [];
		
		
		if(!$.osl.isNull(optList) && optList.length > 0){
			
			
			var optAtchFileChk = false;
			
			
			var dragAndDropListTmp = [];
			
			
			$.each(optList,function(idx, map){
				
				
				var optionWidthSize = '';
				
				
				var optionTitleClass = '';
				var optionDefaultWidthSize = '';
				
				
				var optionPcWidthSize = "col-lg-"+map.itemPcRowNum;
				var optionTabletWidthSize = "col-md-"+map.itemTabletRowNum;
				var optionMobileWidthSize = "col-sm-"+map.itemMobileRowNum;
				
				
				var optContentData = '';
				
				var optContentLabel = '';
				
				var requiredTxt = "";
				if(map.itemEssentialCd=='01'){
					requiredTxt = "required";
				}
				
				
				var itemNm = map.itemNm;
				
				
				itemNm = $.osl.escapeHtml(itemNm);
				
				
				var itemValue = '';
				
				
				var optTarget = config.optTarget;
				
				
				var optReadOnlyChk = false;
				var optReadOnly = 'readonly="readonly"';
				var optAddClass = config.classNm.option_readonly;
				
				
				if(map.itemRowNum == "01"){ 
					optionDefaultWidthSize = config.classNm.option_half;
					
				}else if(map.itemRowNum == "02"){ 
					optionDefaultWidthSize = config.classNm.option_all;
					optionTitleClass = config.classNm.option_clear;
				}
				

				
				if(map.itemCode == "01"){
					if(map.itemType == "02"){ 
						
						optionTitleClass = optionWidthSize = config.classNm.option_desc;
					}
				}
				else if(map.itemCode == "03"){ 
					
					optionTitleClass = optionWidthSize = config.classNm.option_file;
				}
				
				
				if(config.optInitReadonly){
					optReadOnlyChk = true;
				
				}
				
				
				if(!$.osl.isNull(config.optLayoutPreview) && config.optLayoutPreview){
					optReadOnlyChk = false;
				}
				
				
				if(!$.osl.isNull(map.itemValue)){
					itemValue = map.itemValue;
					
					
					itemValue = $.osl.escapeHtml(itemValue);
				}
				
				
				if(map.itemCode == "01"){ 
					if(map.itemType == "01"){ 
						if(!optReadOnlyChk){
							
							optReadOnly = optAddClass = '';
						}
						optContentLabel = '<label class="'+requiredTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
						optContentData = '<input type="text" class="form-control" title="'+itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" maxlength="'+map.itemLength+'" value="'+itemValue+'" '+optReadOnly+' '+requiredTxt+'/>';
					}else if(map.itemType == "02"){ 
						if(!optReadOnlyChk){
							
							optReadOnly = optAddClass = '';
						}
					
						
						itemValue = itemValue.replace(/<br>/gi,"\n").replace(/<\/br>/gi,"\n");
						optContentLabel = '<label class="'+requiredTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
						optContentData = '<textarea class="form-control osl-min-h-px--220 osl-textarea__resize--none '+config.classNm.option_textarea+' '+optAddClass+'" title="'+itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" '+optReadOnly+' '+requiredTxt+'>'+itemValue+'</textarea>';
					}else if(map.itemType == "03"){ 
						if(!optReadOnlyChk){
							optReadOnly = optAddClass = '';
						}
						var optChkVal = ""
						
						if(map.itemValue == "01"){
							optChkVal = " checked";
						}
						
						optContentLabel = '<label class="'+requiredTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
						optContentData = 
							 '<div class="form-group kt-margin-b-10"><label class="kt-checkbox kt-checkbox--bold kt-checkbox--success"><input type="checkbox" id="'+map.itemId+'" name="'+map.itemId+'" '+optChkVal+' '+optReadOnly+' '+requiredTxt+'/>'
							+'<span></span></label></div>';
					}else if(map.itemType == "04"){ 
						if(optReadOnlyChk){
							optReadOnly = 'disabled="disabled"';
						}else{
							optAddClass = '';
							
							dateObjList.push(map.itemId);
						}
						optContentLabel = '<label class="'+requiredTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
						optContentData = '<input type="text" class="form-control" placeholder="'+itemNm+'" title="'+itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" readonly="readonly"  value="'+itemValue+'" '+optReadOnly+' '+requiredTxt+'/>';
					}else if(map.itemType == "05"){ 
						if(optReadOnlyChk){
							optReadOnly = 'disabled="disabled"';
						}else{
							optAddClass = '';
							
							dateTimeObjList.push(map.itemId);
						}
						
						optContentLabel = '<label class="'+requiredTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
						optContentData = '<input type="text" class="form-control" placeholder="'+itemNm+'" title="'+itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" readonly="readonly"  value="'+itemValue+'" '+optReadOnly+' '+requiredTxt+'/>';
					}
				}else if(map.itemCode == "02"){ 
					if(optReadOnlyChk){
						optReadOnly = 'disabled="disabled"';
					}else{
						optAddClass = '';
					}
					optContentLabel = '<label class="'+requiredTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
					optContentData = '<select class="form-control kt-select2" title="'+itemNm+'" id="'+map.itemId+'" name="'+map.itemId+'" opttype="-1" '+optReadOnly+' '+requiredTxt+'></select>';
					
					
					selectObjList.push({targetId:map.itemId, commCode : map.itemCommonCode});
				}else if(map.itemCode == "03"){ 
					
					
					
					
					
					if(optReadOnlyChk){
						optFileReadOnlyCss = " fileReadOnly";
					}
					
					
					
					
				}else if(map.itemCode == "04"){ 
					var popupBtnStr = '';
					if(!optReadOnlyChk){
						optReadOnly = optAddClass = '';
						
						
						commonPopup_charger.push(map.itemId);
					}
					optContentLabel = '<label class="'+requiredTxt+'"><i class="fa fa-edit kt-margin-r-5"></i><span>'+itemNm+'</span></label>'
					optContentData = 
						'<div class="input-group">'
						+'		<input type="text" class="form-control kt-hide" placeholder="'+itemNm+'" name="'+map.itemId+'" id="'+map.itemId+'" opttype="-1" '+optReadOnly+'>'
						+'		<input type="text" class="form-control" placeholder="'+itemNm+'" name="'+map.itemId+'Nm" id="'+map.itemId+'Nm" opttype="-1" '+optReadOnly+'>'
						+'		<button type="button" class="btn btn-brand input-group-append" id="'+map.itemId+'Btn" name="'+map.itemId+'Btn"><i class="fa fa-search"></i><span>검색</span></button>'
						+'</div>' ;
				}else if(map.itemCode == "05"){ 
					var popupBtnStr = '';
					
					if(!optReadOnlyChk){
						optReadOnly = optAddClass = '';
						
						
						commonPopup_cls.push(map.itemId);
						popupBtnStr = '<span class="button_normal2 fl '+config.classNm.option_cls+'" id="btn_cls_select_'+map.itemId+'"><li class="fa fa-search"></li></span>';
					}
					optContentData = '<input type="text" name="'+map.itemId+'" id="'+map.itemId+'" title="'+itemNm+'" opttype="'+config.optType.option_cls+'"  value="'+itemValue+'" style="display:none;"/>'
										+'<input type="text" class="'+config.classNm.option_input_text+' '+config.classNm.option_cls+' '+optAddClass+'" title="'+itemNm+'" name="'+map.itemId+'Nm" id="'+map.itemId+'Nm" modifyset="02" value="'+$.trim(map.itemValueNm)+'" readonly="readonly"/>'
										+popupBtnStr;
				}else if(map.itemCode == "06"){ 
					var popupBtnStr = '';
					if(!optReadOnlyChk){
						optReadOnly = optAddClass = '';
						
						
						commonPopup_dept.push(map.itemId);
					}
					
					
					
					optContentLabel = '<label class="'+requiredTxt+'"><i class="fa fa-id-card kt-margin-r-5"></i><span>'+itemNm+'</span></label>';

					optContentData = 
						'<div class="input-group">'
						+'		<input type="text" class="form-control kt-hide" placeholder="'+itemNm+'" name="'+map.itemId+'" id="'+map.itemId+'" opttype="-1" '+optReadOnly+'>'
						+'		<input type="text" class="form-control" placeholder="'+itemNm+'" name="'+map.itemId+'Nm" id="'+map.itemId+'Nm" opttype="-1" '+optReadOnly+'>'
						+'		<button type="button" class="btn btn-brand input-group-append" id="'+map.itemId+'Btn" name="'+map.itemId+'Btn"><i class="fa fa-search"></i><span>부서검색</span></button>'
						+'</div>' ;
					
				}
				
				var optCompleData =
							'<div class="'+optionPcWidthSize+' '+optionTabletWidthSize+' '+optionMobileWidthSize+'">'
							+'	<div class="form-group">'
							+		optContentLabel
							+		optContentData
							+'	</div>'
							+'</div>';

				rtnStrValue += optCompleData;
				rtnStrArr.push($(optCompleData));
			});
			
			
			if(rtnStrArr.length > 0){
				
				$("#"+htmlTargetObj).html(rtnStrValue);
				
				
				if(!$.osl.isNull(config.optEmptyAppend) && config.optEmptyAppend){
					
					var targetElem = $("#"+htmlTargetObj).children("div."+config.classNm.option_title);
					
					
					$.each(targetElem,function(idx, map){
						
						
						var $nextDiv = $(map).next("div");
						
						var $nextNextDiv  = $nextDiv.next("div").next("div");
		
						
						var optionAll = $nextDiv.hasClass(config.classNm.option_all);
						var optionDesc = $(map).hasClass(config.classNm.option_desc);
		
						
						var nextOptionAll = $nextNextDiv.hasClass(config.classNm.option_all);
						
						var nextDesc = $nextDiv.next("div").hasClass(config.classNm.option_desc);
		
						
						if(!optionAll){
							
							
							if(optionDesc){
								
								if(halfCnt%2 == 1){
									
									if( nextOptionAll || (!nextOptionAll && !nextDesc) ){
										
										$nextDiv.after('<div class="'+config.classNm.option_title+' '+config.classNm.option_desc+'" optflowid="'+hlafFlowId+'"></div>'
												+'<div class="'+config.classNm.option_half+' '+config.classNm.option_desc+'" optflowid="'+hlafFlowId+'"></div>');
										
									}
								}
								
							
							}else{
								
								if(halfCnt%2 == 1){
									
									if( nextOptionAll || (!nextOptionAll && nextDesc) ){
										
										$nextDiv.after('<div class="'+config.classNm.option_title+'" optflowid="'+hlafFlowId+'"></div>'
												+'<div class="'+config.classNm.option_half+'" optflowid="'+hlafFlowId+'"></div>');
										
									}
								}
							}
						}
		
						
						if(targetElem.length == (idx+1)){
							
							
							if(halfCnt%2 == 1){	
								
								if(optionDesc){
									
									$nextDiv.after('<div class="'+config.classNm.option_title+' '+config.classNm.option_desc+'" optflowid="'+hlafFlowId+'"></div>'
											+'<div class="'+config.classNm.option_half+' '+config.classNm.option_desc+'" optflowid="'+hlafFlowId+'"></div>');
								
								
								}else{
									
									$nextDiv.after('<div class="'+config.classNm.option_title+'" optflowid="'+hlafFlowId+'"></div>'
											+'<div class="'+config.classNm.option_half+'" optflowid="'+hlafFlowId+'"></div>');
								}
							}
							return false;
						}
					});
				}
			}
			
			if(optAtchFileChk && dragAndDropListTmp.length > 0){
				
				if($.osl.isNull(config.optLayoutPreview) || !config.optLayoutPreview){
					
					if($.osl.isNull(config.optInitReadonly) || !config.optInitReadonly){
						var dragAndDropList = [];
						
						$.each(dragAndDropListTmp, function(idx, map){
							dragAndDropList.push({auth:"opt", obj:$("#fileDiv_"+map), rtnFunc: config.optFileUploadFunction});
						});
						
						fnDragAndDropEventSet(dragAndDropList);	
					}
					
				}
			}
			
			
			var removeArr = removeEventArr.slice();
			
			removeArr.push("click");
			
			$.each(readonlyFileIdList,function(idx, fileId){
				
				$.each(removeArr,function(arrIdx, delEvent){
					
					$(".opt_drop_file[fileid="+fileId+"]").off(delEvent);
				});
			});
			
			
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
				var arrObj = [];
				
				
				$.each(selectObjList,function(idx, map){
					var commonCodeArr = [
			 			{mstCd: map.commCode, useYn: "Y",targetObj: "#"+map.targetId, comboType:"OS"},
					];
		   	
					
					$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
				});
			}
			
			
			
			if(!$.osl.isNull(commonPopup_charger)){
				
				$.each(commonPopup_charger,function(idx, map){
					$("#"+map+"Btn").click(function(){
			    		var data = {
			    				usrNm : $("#"+map).val()
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

			if(!$.osl.isNull(commonPopup_cls)){
				
				$.each(commonPopup_cls,function(idx, map){
					$("#btn_cls_select_"+map).click(function() {
						gfnCommonClsPopup(function(reqClsId,reqClsNm){
							$('#'+map).val(reqClsId);
							$('#'+map+'Nm').val(reqClsNm);
						}, {prjId: config.prjId});
					});
				});
			}
			
			if(!$.osl.isNull(commonPopup_dept)){
				
				$.each(commonPopup_dept,function(idx, map){
					$("#"+map+"Btn").click(function(){
			    		var searchDeptNm = $.trim($("#"+map+"Nm").val());
		    			if(searchDeptNm.lastIndexOf(">") > 0){
		    				
		    				searchDeptNm = searchDeptNm.substring(searchDeptNm.lastIndexOf(">")+1);
		    			}
		    			var data = {deptName:searchDeptNm};
		    			var options = {
		    					idKey: "cmm6500",
		    					modalSize: 'xl',
		    					modalTitle: "조직 검색",
		    					closeConfirm: false,
		    					callback:[{
		    	                    targetId: "cmm6500SelDept",
		    	                    actionFn: function(thisObj){
							        	var deptInfo = JSON.parse(thisObj);
							        	
							        	$("#"+map).val(deptInfo.deptId);
							        	$("#"+map+"Nm").val(deptInfo.deptNm);
		    	                    }
		    	                 }]
		    				};
		    			
		    			$.osl.layerPopupOpen('/cmm/cmm6000/cmm6500/selectCmm6500View.do',data,options);
			    		
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