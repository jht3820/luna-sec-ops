/**
 * UMD(Universal Module Definition - 범용 모듈 정의) 패턴 
 * @param factory
 * @since 2020.02.19
 * @author 진주영
 */
//IIFE(즉시 함수 호출 표현식)
;(function (factory) {	//코드 닫힘 없는 예외 상황 해결 위해 ; 추가
	"use strict";
	//jQuery 즉시 호출
	factory(jQuery);
}(function ($, undefined) {	//익명 함수
	"use strict";
	/* 기본 설정 */
	//osl 기본 생성자
	$.osl = {
		name: "LUNA™OPS 2.0"	//솔루션명
		,deferred: $.Deferred() //비동기 처리 완수 시점 제어를 위한 지연변수
		,version: "2.0"		//솔루션 버전
		,cVersion: "1.08"	//코어 버전
		,langCd: "ko"		//코어 언어
		,selPrjGrpId: ''
		,selPrjId: ''
		,selAuthGrpId: ''
		,isReady: false		//코어 준비 상태 (init 실행 완료 유무)
		/**
		 *  function 명 	: $.osl.ready
		 *  function 설명	: 코어 init 실행이 모두 완료된 경우 callback 실행
		 *  @param callback: 코어 init 실행 이후 callback 함수
		 **/
		,ready: function(callback){
			//callback이 함수가 아닌 경우 종료
			if(typeof callback != "function"){
				return false;
			}
			
			//modal 선언이 있는 경우 modal script 실행 시 호출 타이밍
			//modal에서 호출 시 core는 호출 완료 상태 (필수 선행 조건)
			if($(".modal-body").length > 0){
				$.osl.deferred.then(function(){
					//select2
					$(".modal-body:eq(0)").find(".kt-select2").select2({width: '100%'});
					
					callback();
					
					//언어팩 적용
					$.osl.langConvert(".modal-body");
					
					$.osl.isReady = true;
				});
			}
			
			//이미 코어 준비 상태라면 바로 callback 실행
			else if(this.isReady){
				callback();
			}else{
				//코어 준비 상태 아닌 경우
				//비동기로 init실행 완료 시 callback 실행
				$.osl.deferred.then(function(){
					callback();
					
					//언어팩 적용
					$.osl.langConvert("#kt_content");
					$.osl.isReady = true;
				});
			}
		}
		/**
		 *  function 명 	: $.osl.init
		 *  function 설명	: 즐겨찾기, 메뉴, 프로젝트 및 권한 그룹 및 솔루션 초기 세팅
		 **/
		,init: function(){
			//validator 정규식 메소드 추가
			$.validator.addMethod("regex", function(value, element, regexpr) {
				//정규식 체크
				var rtnVal = regexpr.test(value);
				
				//필수 값이 아니고 값이 빈값인경우 체크 안함
				if($.osl.isNull(value) && $.osl.isNull($(element).attr("required"))){
					rtnVal = true;
				}
				
			    return rtnVal;
			});
			
			//언어 정보 세팅
			OSLCoreLangSetting.init();

			//차트 정보 세팅
			OSLCoreChartSetting.init();
			
			//이메일 타입 추가
			$.validator.addMethod("email", function(value, element) {
			    if (/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(value)) {
			        return true;
			    } else {
			        return false;
			    }
			}, "이메일 형식이 아닙니다.");
			/* taostr options */
			toastr.options = {
					  "closeButton": true,
					  "debug": false,
					  "newestOnTop": false,
					  "progressBar": true,
					  "positionClass": "toast-top-right",
					  "preventDuplicates": false,
					  "onclick": null,
					  "showDuration": "0",
					  "hideDuration": "300",
					  "timeOut": "3000",
					  "extendedTimeOut": "1000",
					  "showEasing": "swing",
					  "hideEasing": "linear",
					  "showMethod": "fadeIn",
					  "hideMethod": "fadeOut"
					};
			var headerExist = $("#kt_header");
			var contentExist = $("#kt_content");
			
			
			
			//키입력 이벤트 요청
			$(document).keydown(function(event) {
				
				//로그인 창에서 동작안함.
				if($("#kt_login_form").length != 0){
					return;
				}
				
				//단축키 설정창에서 동작안함.
				if($("#shortcutAside").hasClass("active")){
					return;
				}
				
				//조합키 단일 중복값 입력시 입력안됨.
				if(event.keyCode == 17){
	        		//CTRL
	        		return;
	        	}
	        	if(event.keyCode == 16){
	        		//SHIFT
	        		return;
	        	}
	        	if(event.keyCode == 18){
	        		//ALT
	        		return;
	        	}
	        	
				//이벤트 입력 변환
				var shortcut = new Array();
				
				if(event.ctrlKey){
					shortcut.push("Ctrl");
				}
				if(event.shiftKey){
					shortcut.push("Shift");
				}
				if(event.altKey){
					shortcut.push("Alt");
				}
				//대문자 처리
				shortcut.push(event.key.toUpperCase());
				//이벤트 단축키로 변환
				shortcut = shortcut.join(" + ");
				
				//동작코드
				var actionCd = '';
				//등록되어있는 단축키
				var shortcutList = new Array();
				
				//이벤트 비교
				$.each($.osl.user.shortcutList, function(index, item){
					shortcutList.push(item.shortcut);
					//입력된 단축키와 저장되어있는 단축키 비교 후 저장
					if(item.shortcut == shortcut){
						//팝업창이 켜져 있을 때 동작하지 않음.
						if($(document).find(".modal-content").length != 0){
							if(item.popupActionCd == "02"){
								return;
							}
						}
						//동작 단축키 값 저장
						actionCd = item.actionCd;
					}
					
				});
				switch (actionCd){
				//단축키 정보 열기
				case "01":
					var data = {};
					var options = {
						modalTitle: "단축키 설정 정보",
						closeConfirm: false,
						modalSize: "lg",
					};
					$.osl.layerPopupOpen("/usr/usr1000/usr1100/selectUsr1003View.do",data,options);
					break;
					
				//프로젝트 및 권한 그룹 툴바 열기
			    case "02" :
				 	$("#kt_aside_toggler").click();
				    break;
				//Modal 위치 복구
				case "03" :
					var modalList = $(".modal");
					$.each(modalList, function(idx, map){
						var dragObj = $(map).data("draggabilly");
						
						if(!$.osl.isNull(dragObj)){
							//위치 복구
							dragObj.setPosition(0,0);
						}
					});
				  	break;
				//추가 기능바
				case "04" :
					//두번 눌렀을 때 닫기
					if($("body").hasClass("kt-header__topbar--pc-on")){
						
						$("body").removeClass("kt-header__topbar--pc-on");
						$("#kt_header_pc_topbar_toggler").removeClass("kt-header-pc__toolbar-topbar-toggler--active");
						return;
					}
					$("body").addClass("kt-header__topbar--pc-on");
					$("#kt_header_pc_topbar_toggler").addClass("kt-header-pc__toolbar-topbar-toggler--active");
				    break;
			    //새로고침
				case "05" :
					location.reload();
					break;
				//검색
				case "06" :
				    $("#kt_offcanvas_toolbar_search_toggler_btn").click();
				    break;	
				//마이페이지
				case "07" :
					$("#kt_offcanvas_toolbar_mypage_toggler_btn").click();
				    break;
				//메세지
				case "08" :
					$("#kt_offcanvas_toolbar_message_toggler_btn").click();
				    break;
				//알림
				case "09" :
					$("#kt_offcanvas_toolbar_notifications_toggler_btn").click();
					break;
			    //개인설정
				case "10" :
					$("#kt_offcanvas_toolbar_quick_actions_toggler_btn").click();
					break;
			    //담당요구사항
				case "11" :
					$("#kt_quick_panel_toggler_btn").click();
					break;
				//로그아웃
				case "12" :
					$.osl.user.logout();
					break;
			    }
				
				//브라우저 단축키 방지
				if(shortcutList.includes(shortcut)){
					event.preventDefault();
				}
				
			});
			
			//header 있는 경우에만 데이터 조회
			if(!$.osl.isNull(headerExist) && headerExist.length > 0){
				//영역 초기화
				$.osl.initHeaderClear();
				//header init function
				$.osl.initHeader(function(){
					var headerFnBar = new KTToggle('kt_header_pc_topbar_toggler', {
			            target: 'body',
			            targetState: 'kt-header__topbar--pc-on',
			            togglerState: 'kt-header-pc__toolbar-topbar-toggler--active'
			        });

					//상단 기능 바 옵션 세팅
					if($.osl.user.usrOptData.hasOwnProperty("OPT00002") && !$.osl.isNull($.osl.user.usrOptData["OPT00002"].value)){
	    				if($.osl.user.usrOptData["OPT00002"].value == "02"){
	    					headerFnBar.toggleOn();
	    					KTLayout.getAsideToggler().toggleOn();
	    				}
	    			}
					
    				//KT 툴팁 재 호출
        			KTApp.initTooltips();
        			
        			//실행 완료 호출
        			$.osl.deferred.resolve();
				});
			}else{
				//실행 완료 호출
				$.osl.deferred.resolve();
			}
			
			//content 있는 경우에만 데이터 조회
			if(!$.osl.isNull(contentExist) && contentExist.length > 0){
				//content 내에 kt-portlet이 있는 경우 생성 (각자 제어 없음)
				var portletList = contentExist.find(".kt-portlet");
				$.each(portletList, function(idx, map){
					var elemId = $(map).attr("id");
					
					if(!$.osl.isNull(portletList)){
						//new KTPortlet(elemId, $.osl.lang("portlet"));
					}
				});
			}
			
			return $.osl.deferred.promise();
		}
		/**
		 *  function 명 	: $.osl.file
		 *  function 설명	: 파일 기본 객체
		 **/
		,file:{
			/**
			 *  function 명 	: $.osl.file.uploadSet
			 *  function 설명	: 해당 targetId element에 파일 업로드를 세팅한다.
			 *  @param targetId: 파일 업로드 영역 대상 Id (# 제외)
			 *  @param config: 
			 **/
			uploadSet: function(targetId, config){
				var rtnObject = null;
				
				var defaultConfig = {
					/* 고정 옵션 - 변경 없음 */
					proudlyDisplayPoweredByUppy: false,
					inline: true,
					browserBackButtonClose: true,
					debug: false,
					logger: {
						debug: function(args){},
						warn: function(args){},
						error: function(args){}
					},
					
					/* 동적 옵션 */
					target: "#"+targetId,
					width:'100%',
					height:370,
					note: '',
					replaceTargetContent: true,
					showProgressDetails: true,
					disableStatusBar:true,
					hideCancelButton: true,
					/* 파일 다운로드, 읽기 전용 기능 */
					fileDownload: false,
					fileReadonly: false,
					/* core config */
					autoProceed: false,
					maxFileSize: 100,	//MB단위
					maxNumberOfFiles: 10,
					minNumberOfFiles: 0,
					allowedFileTypes: null,	//['image/*', '.jpg', '.jpeg', '.png', '.gif'] mime또는 확장자로 선언
					locale:Uppy.locales.ko_KR,
					meta: {},
					onBeforeUpload: $.noop,
					onBeforeFileAdded: $.noop,
				};
				
				//설정 값 적용
				config = $.extend(true, defaultConfig, config);
				
				var targetObj = $("#"+targetId);
				if(targetObj.length > 0){
					rtnObject = Uppy.Core({
						targetId: targetId,
						autoProceed: config.autoProceed,
						restrictions: {
							maxFileSize: ((1024*1024)*parseInt(config.maxFileSize)),
							maxNumberOfFiles: config.maxNumberOfFiles,
							minNumberOfFiles: config.minNumberOfFiles,
							allowedFileTypes: config.allowedFileTypes
						},
						locale:config.locale,
						meta: config.meta,
						onBeforeUpload: function(files){
							return config.onBeforeUpload(files);
						},
						onBeforeFileAdded: function(currentFile, files){
							//데이터베이스 파일 제외,  파일 읽기 전용인경우 파일 업로드 불가 
							if(currentFile.source != "database" && config.fileReadonly){
								$.osl.toastr($.osl.lang("file.error.fileReadonly"),{type:"warning"});
								return false;
							}
							return config.onBeforeFileAdded(currentFile, files);
						},
						debug: config.debug,
						logger: config.logger,
						fileDownload: config.fileDownload
					});
					
					rtnObject.use(Uppy.Dashboard, config);
					rtnObject.use(Uppy.XHRUpload, { endpoint: config.url,formData: true });
				}
				
				return rtnObject;
			},
			
			/**
			 * function 명 	: $.osl.file.makeAtchfileId
			 * function 설명	: atchFileId를 생성하고 해당 data를 반환한다.
			 * 
			 * @param	callback: atchFileId 생성 후 처리 함수
			 */
			makeAtchfileId: function(callback){
				//AJAX 설정
				var ajaxObj = new $.osl.ajaxRequestAction(
						{"url":"/com/fms/insertAtchFileIdInfo.do", "loadingShow": false, "async": false});

				//AJAX 전송 성공 함수
				
				ajaxObj.setFnSuccess(function(data){
					callback(data);
				});
				
				//AJAX 전송
				ajaxObj.send();
			},
			
			/**
			 * function 명 	: $.osl.file.fileListSetting
			 * function 설명	: 조회된 파일목록 Json Data를 파일 업로드 객체에 세팅한다.
			 * 
			 * @param	paramFileList: 파일 목록 Json Data
			 * @param	paramFileUploadObj: 파일 업로드 객체
			 */
			fileListSetting: function(paramFileList, paramFileUploadObj){
				//canvas toDataURL -> blob
			    function dataUrlToBlob( uri ) {
					var str, arr, i, matches, type;
			        uri = uri.split( ',' );
			        matches = /data:([^;]+)/.exec( uri[ 0 ] );
			        if ( matches ) {
			            type = matches[ 1 ];
			        }
			        str = atob( uri[ 1 ] );
			        arr = new Uint8Array( str.length );
			        for ( i = 0; i < arr.length ; i++ ) {
			            arr[ i ] = str.charCodeAt( i );
			        }
			        return new Blob( [ arr ], { type: type } );
			    }
			    
				if(paramFileList.length > 0){
					var atchFileId = null;
					
		    		$.each(paramFileList,function(idx, map){
		    			atchFileId = map.atchFileId;
		    			if(!$.osl.isNull(map.fileType) && map.fileType.indexOf("image") != -1){
		    				try{
				    			/* 해당 파일 url -> blob 구하기 (image만)*/
				    			var fileImage = new Image();
				    			fileImage.src = "/cmm/fms/getImage.do?fileSn="+map.fileSn+"&atchFileId="+map.atchFileId;
				    			
				    			
				    			//파일 이미지 로드 완료 시 이미지데이터 세팅
				    			fileImage.onload = function () {
				    				//해당 링크 이미지 canvas에 세팅
				    				var canvas = document.createElement("canvas"),
					    	        ctx = canvas.getContext( "2d" );
				    			
									canvas.width = fileImage.width;
					    	        canvas.height = fileImage.height;
					    	        ctx.drawImage( fileImage, 0, 0, fileImage.width, fileImage.height );
						    	    
					    	        //이미지 데이터 blob 변환
									var fileData = dataUrlToBlob(canvas.toDataURL(map.type));
									
									//파일 객체에 이미지 추가
									var fileId = paramFileUploadObj.addFile({
					    			    name: map.orignlFileNm,
					    			    type: map.fileType,
					    			    source: 'database',
					    			    meta: {
					    			    	atchFileId: map.atchFileId,
					    			    	fileSn: map.fileSn
					    			    },
					    				data: fileData,
				    				});
									
									//파일 다운로드 기능 있는 경우
									if(paramFileUploadObj.opts.fileDownload){
										//생성 파일에 이벤트 바인딩
										fileAddListener(paramFileUploadObj, fileId);
									}
								}
		    				}catch(error){
		    					//오류 발생하는 경우 기본
		    				}
		    			}else{
		    				//파일 객체에 이미지 추가 
		    				var fileId = paramFileUploadObj.addFile({
			    			    name: map.orignlFileNm,
			    			    type: map.fileType,
			    			    source: 'database',
			    			    meta: {
			    			    	atchFileId: map.atchFileId,
			    			    	fileSn: map.fileSn
			    			    },
			    				data: {
			    					blob: new Blob(),
			    					size: parseInt(map.fileMg)
			    				}
		    				});
		    				//파일 다운로드 기능 있는 경우
							if(paramFileUploadObj.opts.fileDownload){
			    				//생성 파일에 이벤트 바인딩
			    				fileAddListener(paramFileUploadObj, fileId);
							}
		    			}
		    		});
		    		
		    		//생성 파일에 이벤트 바인딩
		    		function fileAddListener(paramFileUploadObj, paramFileId){
		    			//해당 파일에 이벤트 걸기
						$("#"+paramFileUploadObj.opts.targetId).off("click mouseenter", "#"+$.escapeSelector("uppy_"+paramFileId));
						$("#"+paramFileUploadObj.opts.targetId).on({
								"click": function(){
									//파일 정보 불러오기
									var source = paramFileUploadObj.getFile(paramFileId).source;
									var atchFileId = paramFileUploadObj.getFile(paramFileId).meta.atchFileId;
									var fileSn = paramFileUploadObj.getFile(paramFileId).meta.fileSn;
									
		    						//remove 상태 다운로드 불가 
		    						if(source == "remove"){
		    							$.osl.toastr($.osl.lang("file.error.downloadWait"));
		    						}
		    						else{
		    							$.osl.file.fileDownload(atchFileId, fileSn);
		    						}
								},
								/* 마우스 hover이벤트 걸기 (파일 생성 후 DOM생성이 비동기로 되어있어서 파일 객체에 직접 이벤트 바인딩 */
								"mouseenter": function(){
									$("#"+paramFileUploadObj.opts.targetId+" .osl-uppy-DashboardItem-action--download").remove();
									$("#"+$.escapeSelector("uppy_"+paramFileId)).append('<div class="osl-uppy-DashboardItem-action--download"><i class="fas fa-arrow-circle-down"></i></div>');
									/*
									$("#"+paramFileUploadObj.opts.targetId+" .osl-uppy-DashboardItem-action--download").removeClass("osl-uppy-DashboardItem-action--download");
									$("#"+$.escapeSelector("uppy_"+paramFileId)).addClass("osl-uppy-DashboardItem-action--download");
									*/
								},
								"mouseleave": function(){
									$("#"+$.escapeSelector("uppy_"+paramFileId)+" .osl-uppy-DashboardItem-action--download").remove();
								}},
								"#"+$.escapeSelector("uppy_"+paramFileId)
						);
		    		}
		    	}
			},
			/**
			 *  function 명 	: $.osl.file.fileDownload
			 *  function 설명	: 파일 다운로드 함수
			 *  @param paramAtchFileId: 파일 ID
			 *  @param paramFileSn: 파일 Sn
			 **/
			fileDownload: function(paramAtchFileId, paramFileSn){
				if(!$.osl.isNull(paramAtchFileId) && !$.osl.isNull(paramFileSn)){
					var url = '/com/fms/FileDown.do?downAtchFileId='+paramAtchFileId+'&downFileSn='+paramFileSn;
					var fileLink = document.createElement("a");
					fileLink.href = url;
					fileLink.target = "_self";
					document.fileDownFrame.downForm.append(fileLink);
					fileLink.click();
					fileLink.remove();
				}else{
					$.osl.alert("다운로드에 필요한 정보가 부족합니다.");
				}
			}
		}
		/**
		 *  function 명 	: $.osl.tree
		 *  function 설명	: 트리 기본 객체
		 **/
		,tree: {
			/* 노드 제어 함수 실행 시 로딩바가 출력되는 기준 개수 */
			loadingNodeCnt:500,
			/**
			 *  function 명 	: $.osl.tree.list
			 *  function 설명	: 페이지에 생성된 tree 목록
			 **/
			list:{},
			/**
			 *  function 명 	: $.osl.tree.setting
			 *  function 설명	: 요소에 트리 객체 세팅
			 *  @param targetId: 요소 id (#id)
			 *  @param config: 트리 설정 값
			 **/
			setting: function(targetId, config){
				//트리 객체
				var treeObj = null;
				
				var targetObj = $("#"+targetId);
				if(targetObj.length > 0){
					/**
					 * 자식 노드 전체 펼치기/접기
					 * @param jstreeTarget: jstree 대상 (선언 객체)
					 * @param childrenList: 자식 노드 목록
					 * @param openClose: 접힘&펼침 (true - 펼침, false - 접힘)
					 */
					var nodeChildHandler = function(jstreeTarget, childrenList, openClose){
						if($.osl.isNull(childrenList) || childrenList.length == 0){
							return true;
						}
						
						//자식 객체 loop
						$.each(childrenList, function(idx, map){
							//자식 객체 노드 정도
							var childrenNodeInfo = jstreeTarget.jstree().get_node(map);
							
							//자식 노드 정보 없는 경우 skip
							if($.osl.isNull(childrenNodeInfo)){
								return true;
							}else{
								//현재 노드 자식이 있는 경우 open/close
								if(childrenNodeInfo.children.length > 0){
									//close
									var flagNodeStr = "close_node";
									//open
									if(openClose){
										flagNodeStr = "open_node";
									}
									jstreeTarget.jstree(flagNodeStr, childrenNodeInfo.id);
									
									//재귀 호출로 현재 함수 호출
									nodeChildHandler(jstreeTarget, childrenNodeInfo.children, openClose);
								}else{
									//없는 경우 skip
									return true
								}
							}
						});
					};
					
					//action 동작 함수
					var actionFunction = {
						select: function(){
							if($.osl.isNull(treeObj)){
            					$.osl.toastr($.osl.lang("tree.error.handler"));
            					return false;
            				}
							
							/* data 셋팅 */
							var url = config.data.url;
							var paramData = treeObj.jstree().settings.data.param;
							
							//AJAX 설정
							var ajaxObj = new $.osl.ajaxRequestAction(
									{"url": url, "async": false}
									,paramData);
							
							//AJAX 전송 성공 함수
							ajaxObj.setFnSuccess(function(data){
								if(data.errorYn == "Y"){
									$.osl.alert(data.message,{type: 'error'});
								}else{
									var treeDataList = data.list;
									
									//list data가 없는 경우 넘어온 data에서 배열 값 찾기
									if($.osl.isNull(treeDataList)){
										$.each(data,function(idx, map){
											if(typeof map == "object"){
												try{
													if(map.length > 0){
														treeDataList = map;
														return false;
													}
												}catch(e){
													return true;
												}
											}
										});
									}
									
									//treeData 세팅하기
									if(treeDataList.length > 0){
										var rtnTreeData = [];
										var tmpMap = {};
										
										var key = config.data.key;
										var pKey = config.data.pKey;
										var labelKey = config.data.labelKey;
										
										/* jsonArray => key:{jsonData} 변환*/
										$.each(treeDataList, function(idx, map){
											map["text"] = map[labelKey];
											tmpMap[map[key]] = map;
										});
										
										/* 위에서 세팅된 목록 값으로 계층 데이터 구현하기 */
										$.each(treeDataList, function(idx, map){
											//현재 데이터의 부모값이 존재하고, 해당 키 값과 부모 키값이 다른 경우
											if(tmpMap[map[pKey]] && map[key] != map[pKey]){
												//children 없는 경우 배열로 생성
												if (!tmpMap[map[pKey]]["children"]){
													tmpMap[map[pKey]]["children"] = [];
												}
												
												//부모 자식 배열 값에 해당 값을 대입
												tmpMap[map[pKey]]["children"].push(map);
											}else{
												//부모 값이 존재하지 않는 경우 반환 데이터에 삽입
												rtnTreeData.push(map);
											}
										});
										
										treeObj.jstree(true).settings.core.data = rtnTreeData;
										treeObj.jstree(true).refresh();
									}
								}
							});
							
							//AJAX 전송
							ajaxObj.send();
						},
						allNodeOpen: function(obj){
							if($.osl.isNull(treeObj)){
            					$.osl.toastr($.osl.lang("tree.error.handler"));
            					return false;
            				}
							//노드 수에 따라 로딩바 출력
							var nodeSize = Object.keys(treeObj.jstree()._model.data).length;
							if(nodeSize > parseInt($.osl.tree.loadingNodeCnt)){
            					$.osl.showLoadingBar(true,{target: targetId ,message: "data loading..."});
            				}
            				treeObj.jstree("open_all");

            				if(nodeSize > parseInt($.osl.tree.loadingNodeCnt)){
            					$.osl.showLoadingBar(false,{target: targetId});
            				}
						},
						allNodeClose: function(obj){
							if($.osl.isNull(treeObj)){
            					$.osl.toastr($.osl.lang("tree.error.handler"));
            					return false;
            				}
							//노드 수에 따라 로딩바 출력
							var nodeSize = Object.keys(treeObj.jstree()._model.data).length;
							if(nodeSize > parseInt($.osl.tree.loadingNodeCnt)){
            					$.osl.showLoadingBar(true,{target: targetId ,message: "data loading..."});
            				}
							
            				treeObj.jstree("close_all");

            				if(nodeSize > parseInt($.osl.tree.loadingNodeCnt)){
            					$.osl.showLoadingBar(false,{target: targetId});
            				}
						},
						selNodeOpen: function(obj){
							if($.osl.isNull(treeObj)){
            					$.osl.toastr($.osl.lang("tree.error.handler"));
            					return false;
            				}
            				var nodeInfo = treeObj.jstree().get_node(obj.reference);
            				treeObj.jstree("open_node",nodeInfo.id);
            				
            				//자식의 모든 노드 수
            				var childSize = nodeInfo.children_d.length;
            				if(childSize > parseInt($.osl.tree.loadingNodeCnt)){
            					$.osl.showLoadingBar(true,{target: "#"+treeObj[0].id,message: "data loading..."});
            				}
            				
            				//전체 loop
            				nodeChildHandler(treeObj, nodeInfo.children, true);
            				
            				if(childSize > parseInt($.osl.tree.loadingNodeCnt)){
            					$.osl.showLoadingBar(false,{target: "#"+treeObj[0].id});
            				}
						},
						selNodeClose: function(obj){
							if($.osl.isNull(treeObj)){
            					$.osl.toastr($.osl.lang("tree.error.handler"));
            					return false;
            				}
            				var nodeInfo = treeObj.jstree().get_node(obj.reference);
            				treeObj.jstree("close_node",nodeInfo.id);
            				
            				//자식의 모든 노드 수
            				var childSize = nodeInfo.children_d.length;
            				
            				if(childSize > parseInt($.osl.tree.loadingNodeCnt)){
            					$.osl.showLoadingBar(true,{target: "#"+treeObj[0].id,message: "data loading..."});
            				}
            				
            				//전체 loop
            				nodeChildHandler(treeObj, nodeInfo.children, false);
            				
            				if(childSize > parseInt($.osl.tree.loadingNodeCnt)){ 
            					$.osl.showLoadingBar(false,{target: "#"+treeObj[0].id});
            				}
						}
					};
					
					//기본 설정 값
					var defaultConfig = {
							'data':{
								url:"",
								param:"",
								key:"",
								/* 부모 key 값 */
								pKey:"",
								/* 출력 text key */
								labelKey: ""
							},
				            'plugins': ["contextmenu", "types", "search"],
				            'core': {
				                "themes" : {
				                	/* 노드 내용 영역 넘어가는 경우 줄임 */
				                    "ellipsis": true,
				                    "stripes": false
				                },    
				                'data': []
				            },
				            "types" : {
				                "default" : { "icon" : "fa fa-folder kt-font-warning" },
				                "file" : {"icon" : " flaticon2-file  kt-font-warning"}
				            },
				            "search":{
								//대소문자 구분
								"case_insensitive": false,
								//검색 결과 노드만 표시
								"show_only_matches": false,
								
								//show_only_matches: true 일때 하위 노드도 같이 표시 할건지
								"show_only_matches_children": false,
							},
				            "contextmenu": {
				            	"display": ["allNodeOpen","allNodeClose","selNodeOpen","selNodeClose"],
				            	"items": {
				            		"allNodeOpen" : {
				            			"separator_before": true,
				            			"separator_after": false,
				            			"label": $.osl.lang("tree.label.contextmenu.allNodeOpen"),
				            			"title": $.osl.lang("tree.label.contextmenu.allNodeOpen"),
				            			"action": function (obj){
				            				actionFunction["allNodeOpen"](obj);
				            			}
				            		},
				            		"allNodeClose" : {
				            			"separator_before": false,
				            			"separator_after": true,
				            			"label": $.osl.lang("tree.label.contextmenu.allNodeClose"),
				            			"title": $.osl.lang("tree.label.contextmenu.allNodeClose"),
				            			"action": function (obj){
				            				actionFunction["allNodeClose"](obj);
				            			}
				            		},
				            		"selNodeOpen" : {
				            			"separator_before": true,
				            			"separator_after": false,
				            			"label": $.osl.lang("tree.label.contextmenu.selNodeOpen"),
				            			"title": $.osl.lang("tree.label.contextmenu.selNodeOpen"),
				            			"action": function (obj){
				            				actionFunction["selNodeOpen"](obj);
				            			}
				            		},
				            		"selNodeClose" : {
				            			"separator_before": false,
				            			"separator_after": true,
				            			"label": $.osl.lang("tree.label.contextmenu.selNodeClose"),
				            			"title": $.osl.lang("tree.label.contextmenu.selNodeClose"),
				            			"action": function (obj){
				            				actionFunction["selNodeClose"](obj);
				            			}
				            		}
				            	}
				            },
				            "actionFn":{
				            	
				            },
				            "callback":{
				            	/* tree 로딩 후 호출 */
				            	"init": $.noop,
				            	/* tree node 선택(클릭) 시 호출 */
								"onclick": $.noop
							}
				        };
					
					config = $.extend(true, defaultConfig, config);

					//contextmenu에 actionFn 처리하기
					if(config.hasOwnProperty("contextmenu") && config.contextmenu.hasOwnProperty("items")){
						$.each(config.contextmenu.items, function(key, map){
							//사용자 정의 함수 대상 설정이 있는 경우 action 대체
							if(map.hasOwnProperty("actionFn") && typeof map.actionFn == "string"){
								//사용자 정의 함수 있는지 체크
								if(config.hasOwnProperty("actionFn") && config.actionFn.hasOwnProperty(map.actionFn)){
									map.action = function(obj){
										//선택 노드
										var selectNodeIds = treeObj.jstree("get_selected");
										
										// 선택노드
										var selectNode = treeObj.jstree().get_node(selectNodeIds[0]);
										var nodeData = selectNode.original;
										
										config.actionFn[map.actionFn](obj, nodeData, obj.reference.eq(0));
									};
								}
								//없는 경우 tree actionFunction 변수에서 검색
								else if(actionFunction.hasOwnProperty(map.actionFn)){
									map.action = function(obj){
										actionFunction[map.actionFn](obj);
									}
								}
							}
						});
					}
					
					//page내에 action 버튼 세팅
					var actionBtnList = $(".osl-tree-action[data-tree-id="+targetId.replace("#","")+"]");
					if(actionBtnList.length > 0){
						$.each(actionBtnList, function(idx, map){
							//해당 버튼 action 동작 가져오기
							var action = $(map).data("tree-action");
							
							//config에 해당 action동작 있는지 체크 - 없는 경우 사용자 정의 함수 체크
							if(!actionFunction.hasOwnProperty(action)){
								if(config.hasOwnProperty("actionFn") && config.actionFn.hasOwnProperty(action) && typeof config.actionFn[action] == "function"){
									//해당 버튼에 이벤트 주입
									$(map).click(function(){
										var nodeData = null;
										
										if(treeObj != null){
											//선택 노드
											var selectNodeIds = treeObj.jstree("get_selected");
											
											// 선택노드
											var selectNode = treeObj.jstree().get_node(selectNodeIds[0]);
											nodeData = selectNode.original;
										}
										
										config.actionFn[action](treeObj, nodeData, map);
									});
								}else{
									//없는 경우 버튼 제거
									$(map).remove();
								}
							}else{
								//해당 버튼에 이벤트 주입
								$(map).click(function(){
									actionFunction[action]();
								});
							}
						});
					}
					
					/* context 셋팅*/
					treeObj = targetObj.jstree(config);
					
					//jsTree event
					treeObj.bind('select_node.jstree', function(event, data){
						var selNode = data.instance.get_node(data.selected);
			            var id = selNode.id;
			            treeObj.jstree().selNode = {id: id, data:data};
			            
			            //사용자 입력 callback function 호출
			            config.callback.onclick(treeObj, selNode);
			        }).bind('deselect_node.jstree', function(event, data){
			        	treeObj.jstree().selNode = null;
			        }).bind('search.jstree', function(nodes, str, res){
			        	//검색 결과 없는 경우
			        	if(str.nodes.length == 0){
			        		//노드 감추기
			        		treeObj.jstree(true).hide_all();
			        		
			        		//데이터 없음 문구 출력
			        		$(str.instance.element).after('<div class="osl-tree-empty kt-align-center" data-tree-id="'+targetId+'">"'+str.str+'" 검색 결과가 없습니다.</div>');
			        	}
			        	
			        }).bind('loaded.jstree', function(event, data) {
			        	//사용자 입력 callback function 호출
			            config.callback.init(treeObj, data);
			        });
					
					
					var searchTarget = $('.osl-tree-search[data-tree-id="'+targetId+'"]');
					
					//검색 Element 있는지 체크
					if(searchTarget.length > 0){
						/* 검색  input 세팅 */
						//내용 비우기
						searchTarget.empty();
						
						//버튼 style 값
						var btnStyle = searchTarget.data("search-style");
						//기본 값
						var btnStyleStr = "btn-brand";
						
						if(!$.osl.isNull(btnStyle)){
							btnStyleStr = "btn-"+btnStyle;
						}
						
						//내용 채우기
						var searchTargetHtml = 
							'<div class="input-group">'
								+'<div class="kt-input-icon kt-input-icon--left osl-border-radius-none--right">'
									+'<input type="text" class="form-control" placeholder="'+$.osl.lang("tree.search.placeholder")+'" id="treeSearch_'+targetId+'" name="treeSearch" data-tree-id="'+targetId+'">'
									+'<span class="kt-input-icon__icon kt-input-icon__icon--left">'
										+'<span><i class="la la-search"></i></span>'
									+'</span>'
								+'</div>'
								+'<div class="input-group-append">'
									+'<button class="btn '+btnStyleStr+' osl-tree-search__button" type="button" data-tree-id="'+targetId+'">'
										+'<i class="fa fa-search"></i><span class=""><span>'+$.osl.lang("tree.search.title")+'</span></span>'
									'</button>'
								+'</div>'
							+'</div>';
						
						searchTarget.html(searchTargetHtml);
						
						//tree 검색 이벤트
						var fnTreeSearch = function(searchValue){
							treeObj.jstree(true).show_all();
							
							//empty div 있는 경우 제거 
							if($(".osl-tree-empty[data-tree-id="+targetId+"]").length > 0){
								$(".osl-tree-empty[data-tree-id="+targetId+"]").remove();
							}
							
							treeObj.jstree("search", searchValue);
						};
						
						//입력 창 엔터키 이벤트
						$(".osl-tree-search[data-tree-id="+targetId+"] input#treeSearch_"+targetId+"[data-tree-id="+targetId+"]").off('keypress');
						$(".osl-tree-search__button[data-tree-id="+targetId+"]").off('click');
						$(".osl-tree-search[data-tree-id="+targetId+"] input#treeSearch_"+targetId+"[data-tree-id="+targetId+"]").on('keypress', function(e) {
							if (e.which === 13){
								
								var thisObj = $(this).siblings("span.kt-input-icon__icon").children("span");
								//검색 icon 제거
								thisObj.children("i").removeClass("la la-search");
								
								//조회 load 효과
								thisObj.addClass("kt-spinner kt-spinner--v2 kt-spinner--sm kt-spinner--brand");
								
								//조회 동작
								fnTreeSearch($(this).val());
								
								setTimeout(function(){
									thisObj.removeClass("kt-spinner kt-spinner--v2 kt-spinner--sm kt-spinner--brand");
									
									//검색 icon 추가
									thisObj.children("i").addClass("la la-search");
								},300);
							}
						});
						
						$(".osl-tree-search__button[data-tree-id="+targetId+"]").click(function(){

							var thisObj = $(this).children("span");
							
							//조회 load 효과
							thisObj.children("span").hide();
							thisObj.addClass("spinner-border spinner-border-sm");

							fnTreeSearch($("#treeSearch_"+targetId).val());
							
							setTimeout(function(){
								thisObj.removeClass("spinner-border spinner-border-sm");
								thisObj.children("span").show();
							},300);
						});
					}
					
					//data 조회
					actionFunction["select"]();
					
					//생성된 데이터 저장
					$.osl.tree.list[targetId] = treeObj;
				}
				return treeObj;
			}
		}
		,langData: {}
		/**
		 *  function 명 	: $.osl.lang
		 *  function 설명	: 언어 코드
		 *  @param langId: 언어 값 가져오려는 계층 코드 (예: file.error.downloadWait)
		 **/
		,lang: function(langId){
			//언어 데이터 (osl-lang.js)
			var langData = this.langData;
			
			//var rtnLangStr = "제공되지 않는 언어입니다.</br>(Language not available.)";
			var rtnLangStr = null;
			
			//파라미터 값 없는 경우
			if($.osl.isNull(langId)){
				return "";
			}
			
			//langId 분리
			var langTreeData = langId.split("\.");
			
			try{
				//이전 계층 구조
				var prevTreeData = langData[$.osl.langCd];
				$.each(langTreeData, function(idx, map){
					//해당 아이디가 존재하는지 체크
					if(!prevTreeData.hasOwnProperty(map)){
						return false;
					}
					
					//끝 부분인 경우 해당 데이터 출력
					if(langTreeData.length == (idx+1)){
						rtnLangStr = prevTreeData[map];
						return false;
					}else{
						prevTreeData = prevTreeData[map];
					}
				});
			}catch(e){
			}
			
			//해당 데이터 값이 빈 값인경우 빈값 출력
			if($.osl.isNull(rtnLangStr)){
				return "";
			}
			
			//추가 변수 있는 경우 세팅하기 {1}부터 시작
			if(arguments.length > 1){
				var mainArgu = arguments;
				rtnLangStr = rtnLangStr.replace(/\${(\d+)}/g, function(match, idx){
				    return typeof mainArgu[idx] != 'undefined' ? mainArgu[idx] : match;
				});
			}
			
			return rtnLangStr;
		}
		/**
		 *  function 명 	: $.osl.langConvert
		 *  function 설명	: 대상 영역에 span 태그 문자열을 언어 코드에 맞게 변경한다.
		 *  @param targetElem: 대상 영역 (대상 영역 하위의 span만 적용)  
		 **/
		,langConvert: function(targetElem){
			//TEST - 2020-09-02 한국어인경우 변환 안함
			if($.osl.langCd == "ko"){
				return true;
			}
			
			var spanList = $(targetElem).find("span[data-lang-cd]");
			if(!$.osl.isNull(spanList) && spanList.length > 0){
				$.each(spanList, function(idx, map){
					//언어 코드
					var langCd = $(map).data("lang-cd");
					var langStr = $.osl.lang(langCd);
					if($.osl.isNull(langStr)){
						return true;
					}
					$(map).html(langStr);
				});
			}
			
			//그 외 title 언어 적용
			var tagTitleList = $("[data-title-lang-cd]");
			if(!$.osl.isNull(tagTitleList) && tagTitleList.length > 0){
				$.each(tagTitleList, function(idx, map){
					//언어 코드
					var langCd = $(map).data("title-lang-cd");
					var langStr = $.osl.lang(langCd);
					if($.osl.isNull(langStr)){
						return true;
					}
					$(map).attr("title",langStr);
					$(map).attr("data-original-title",langStr);
				});
			}
		}
		/**
		 *  function 명 	: $.osl.btnAuthVal
		 *  function 설명	: 공통 버튼 권한 전역 변수
		 **/
		,btnAuthVal: {
			btnAuthSelectYn:	"N"
			,btnAuthInsertYn:	"N"
			,btnAuthUpdateYn:	"N"
			,btnAuthDeleteYn:	"N"
			,btnAuthExcelYn:	"N"
			,btnAuthPrintYn:	"N"
		}
		/**
		 *  function 명 	: $.osl.prjMenuList
		 *  function 설명	: 메뉴 계층 데이터
		 **/
		,prjMenuList:{}
		/**
		 *  function 명 	: $.osl.prjGrpAuthList
		 *  function 설명	: 프로젝트 그룹, 프로젝트, 권한그룹 데이터
		 **/
		,prjGrpAuthList:{}
		/**
		 *  function 명 	: $.osl.prjGrpAuthSelSetting
		 *  function 설명	: 프로젝트 그룹, 프로젝트, 권한그룹 데이터를 select에 세팅
		 *  @param depth: 출력 깊이
		 *  		1: 프로젝트 그룹
		 *  		2: 프로젝트 그룹(optGroup) > 프로젝트
		 *  		3: 프로젝트(optGroup) > 권한 그룹
		 *  @param paramSelFlag (Boolean): 현재 선택된 프로젝트 그룹, 프로젝트, 권한그룹 초기 선택지정 유무  (기본 - false)
		 **/
		,prjGrpAuthSelSetting: function(depth, paramSelFlag){
			var rtnValue = '';
			
			var selFlag = false;
			if(!$.osl.isNull(paramSelFlag)){
				selFlag = paramSelFlag;
			}
			
			if(!$.osl.isNull($.osl.prjGrpAuthList)){
				$.each($.osl.prjGrpAuthList, function(idx1, map1){
					//프로젝트 그룹만 option으로 출력
					if(depth == 1){
						var selected = '';
						//selected
						if(selFlag){
							if($.osl.selPrjGrpId == map1.prjGrpInfo.prjId){
								selected = "selected";
							}
						}
						rtnValue += '<option value="'+map1.prjGrpInfo.prjId+'" '+selected+'>'+$.osl.escapeHtml(map1.prjGrpNm)+'</option>';
						return true;
					}
					
					//프로젝트 목록 없는 경우 skip
					if(Object.keys(map1.prjList).length == 0){
						return true;
					}
					
					//프로젝트 그룹 optgroup으로 출력
					if(depth == 2){
						rtnValue += '<optgroup label="'+$.osl.escapeHtml(map1.prjGrpNm)+'" data-prj-grp-id="'+map1.prjGrpInfo.prjId+'">';
					}
					
					//프로젝트 loop
					$.each(map1.prjList, function(idx2, map2){
						//프로젝트 option
						if(depth == 2){
							var selected = '';
							//selected
							if(selFlag){
								if($.osl.selPrjId == map2.prjId){
									selected = "selected";
								}
							}
							rtnValue += '<option value="'+map2.prjId+'" data-prj-grp-id="'+map1.prjGrpInfo.prjId+'" '+selected+'>'+$.osl.escapeHtml(map2.prjNm)+'</option>';
							return true;
						}
						//권한그룹 목록 없는 경우 skip
						if(Object.keys(map2.authGrpList).length == 0){
							return true;
						}
						
						//프로젝트 optgroup
						if(depth == 3){
							rtnValue += '<optgroup label="'+$.osl.escapeHtml(map2.prjNm)+'" data-prj-grp-id="'+map1.prjGrpInfo.prjId+'" data-prj-id="'+map2.prjId+'">';
						}
						
						//권한그룹 loop
						$.each(map2.authGrpList, function(idx3, map3){
							var selected = '';
							//selected
							if(selFlag){
								if($.osl.selAuthGrpId == map3.authGrpId){
									selected = "selected";
								}
							}
							rtnValue += '<option value="'+map3.authGrpId+'" data-prj-grp-id="'+map1.prjGrpInfo.prjId+'" data-prj-id="'+map2.prjId+'" '+selected+'>'+$.osl.escapeHtml(map3.authGrpNm)+'</option>';
						});
						
						if(depth == 3){
							rtnValue += '</optgroup>';
						}
					});
					
					//프로젝트 그룹 optGroup닫기
					if(depth == 2){
						rtnValue += '</optgroup>';
					}
				});
				
				return rtnValue;
			}
		}
		/**
		 *  function 명 	: $.osl.initHeaderClear
		 *  function 설명	: 헤더 데이터 세팅에 필요한 영역 초기화
		 **/
		,initHeaderClear: function(){
			//메뉴 목록
			$("#globalsTopMenuUl > li.osl-menu-1depth").remove();
			
			//프로젝트 목록
			$("#osl_aside_prjAuth_List").empty();
			
			//즐겨찾기 영역
			$("ul[id^=fvrListType]").empty();
			
			//프로젝트 그룹, 프로젝트, 권한그룹 선택
			$("#submenu-prjGrp-sel_opt, #submenu-prj-sel_opt, #submenu-authGrp-sel_opt").empty();
			
			//사용자 설정 공통코드 option 초기화
			$("select[id^=usrOpt_]").empty();
		}
		/**
		 *  function 명 	: $.osl.initHeader
		 *  function 설명	: 즐겨찾기, 메뉴, 프로젝트 및 권한그룹 등 top 데이터 세팅
		 *  @param callBackFn : Header init 완료 후 실행 함수
		 **/
		,initHeader: function(callBackFn){
			/* 즐겨찾기 데이터 조회 */
			//AJAX 설정
			var ajaxObj = new $.osl.ajaxRequestAction(
					{"url":"/cmm/cmm9000/cmm9000/selectCmm9000InitHeaderData.do", "loadingShow": false});
			
			//AJAX 전송 성공 함수
			ajaxObj.setFnSuccess(function(data){
				
	        	if( data.errorYn == "N" ){
	        		//버튼 권한 값
	        		if(!$.osl.isNull(data.btnAuthMap)){
	        			$.extend($.osl.btnAuthVal, data.btnAuthMap);
	        			
	        			//접근 권한
	        			var authAccessYn = data.btnAuthMap.authAccessYn;
	        			
	        			//접근 권한 없는 경우
	        		}

	        		//사용자 정보
	        		if(!$.osl.isNull(data.usrInfo)){
	        			$.osl.user.userInfo = data.usrInfo;
	        		}
	        		
	        		//사용자 단축키 정보
	        		if(!$.osl.isNull(data.shortcutList)){
	        			$.osl.user.shortcutList = data.shortcutList;
	        		}
	        		
	        		
	        		//html에 사용자 설정 값 있는 경우
        			if($("form#userSettingForm select").length > 0){
        				//개인 설정 공통코드
            			var commonCodeArr = [];
            			
            			//개인 설정 공통코드 자동 parse
            			$.each($("form#userSettingForm select"),function(idx, map){
            				var targetId = $(map).attr("id");
            				var targetMstCd = $(map).data("mst-cd");
            				
            				//변수에 세팅
            				commonCodeArr.push({mstCd: targetMstCd ,useYn: "Y",targetObj: "#"+targetId, comboType:"OS"});
            			});
            			
		        		//사용자 설정 값 데이터 세팅
		        		if(!$.osl.isNull(data.usrOptList)){
		        			var usrOptData = {};
		        			
		        			$.each(data.usrOptList, function(idx, map){
		        				var optSelect = $("#usrOpt_"+map.usrOptMstCd);
		        				
		        				if(optSelect.length > 0){
		        					//select box
		        					optSelect.attr("data-osl-value",map.usrOptCd);
		        				}
		        				
		        				usrOptData[map.usrOptMstCd] = {"value": map.usrOptCd, "name": map.mstCdNm, "desc": map.mstCdDesc, "valueNm": map.subCdNm};
		        			});
		        			
		        			//사용자 설정 데이터
		        			$.osl.user.usrOptData = usrOptData;
		        		}
		        		//공통코드 채우기
	        			$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		        	}
        			//언어 목록 채우기
        			if(!$.osl.isNull(data.langList)){
        				var opt4 = $.osl.user.usrOptData["OPT00004"];
        					
        				//사용자 언어 active
        				var usrLangCd = null;
        				if(!$.osl.isNull(opt4)){
        					usrLangCd = opt4.value;
        				}
        				
        				var langListStr = '';
        				$.each(data.langList, function(idx, map){
        					var activeStr = '';
        					if($.osl.isNull(usrLangCd) && idx == 0 || !$.osl.isNull(usrLangCd) && map.subCd == usrLangCd){
        						activeStr = 'active';
        						$("#usrCurrentLangCd img").attr("src","/media/flags/"+map.subCdRef2);
        						$.osl.langCd = map.subCdNm; 
        					}
        					
        					langListStr +=
        						'<li class="kt-nav__item '+activeStr+'">'
		        					+'<a href="#" class="kt-nav__link" value="'+map.subCd+'" id="usrLangCd_'+map.subCdNm+'" data-mst-cd="OPT00004" data-sub-cd="'+map.subCdNm+'" data-sub-cd-ref1="'+$.osl.escapeHtml(map.subCdRef1)+'" data-sub-cd-ref2="'+map.subCdRef2+'" onclick="$.osl.user.usrOptLangChg(this);">'
		        						+'<span class="kt-nav__link-icon"><img src="/media/flags/'+map.subCdRef2+'" alt="" /></span>'
		        						+'<span class="kt-nav__link-text">'+$.osl.escapeHtml(map.subCdRef1)+'</span>'
		        					+'</a>'
		        				+'</li>';
        				});
        				$("#usrLangCdList").html(langListStr);
        			}
        			
	        		//메뉴 데이터 세팅
	        		if(!$.osl.isNull(data.menuList)){
	        			//현재 메뉴 타입
	        			var topMenuType = "01";
	        			if($.osl.user.usrOptData.hasOwnProperty("OPT00001") && !$.osl.isNull($.osl.user.usrOptData["OPT00001"].value)){
	        				topMenuType = $.osl.user.usrOptData["OPT00001"].value;
	        			}
	        			
	        			//메뉴 설정
	        			var menuConfig = {
	        				"01":{
	        					"submenu-type": "kt-menu__submenu--fixed",
	        					"submenu-frame-cnt":4
	        				},
	        				"02":{
	        					"submenu-type": "kt-menu__submenu--classic"
	        				}
	        			};
	        			var menuList = {};
	        			
	        			//메뉴 목록 계층 세팅
	        			$.each(data.menuList,function(idx, map){
	        				//접근 권한 없는경우 skip
	        				if(map.accessYn != "Y"){
	        					return true;
	        				}
	        				//depth 분리
	        				if(map.lvl == "1"){
	        					//1depth 이미 추가된경우 나머지 정보만 기입
	        					if(menuList.hasOwnProperty(map.menuId)){
	        						menuList[map.menuId]["menuNm"] = map.menuNm;
	        						menuList[map.menuId]["menuInfo"] = map;
	        					}else{
	        						menuList[map.menuId] = {"menuNm":map.menuNm, "menuInfo":map, "childMenuList":{}};
	        					}
	        				}
	        				else if(map.lvl == "2"){
	        					//1depth 없는 경우
	        					if(!menuList.hasOwnProperty(map.upperMenuId)){
	        						menuList[map.upperMenuId] = {};
	        						menuList[map.upperMenuId]["childMenuList"] = {};
	        					}
	        					//2depth 이미 추가된경우 나머지 정보만 기입
	        					if(menuList[map.upperMenuId]["childMenuList"].hasOwnProperty(map.menuId)){
	        						menuList[map.upperMenuId]["childMenuList"][map.menuId]["menuNm"] = map.menuNm;
	        						menuList[map.upperMenuId]["childMenuList"][map.menuId]["menuInfo"] = map;
	        					}else{
	        						//2depth 추가
	        						menuList[map.upperMenuId]["childMenuList"][map.menuId] = {"menuNm":map.menuNm, "menuInfo":map, "childMenuList":{}};
	        					}
	        				}
	        				else if(map.lvl == "3"){
	        					//3depth 추가
	        					menuList[map.twoUpperMenuId]["childMenuList"][map.upperMenuId]["childMenuList"][map.menuId] = map;
	        				}else{
	        					return true;
	        				}
	        			});
	        			
	        			var idx = 0;
	        			//메뉴 데이터 세팅
	        			$.each(menuList, function(key, map){
	        				//1depth 세팅
	        				var menuInfoStr = 
	        					'<li class="kt-menu__item kt-menu__item--submenu kt-menu__item--rel osl-menu-1depth" data-ktmenu-submenu-toggle="click" aria-haspopup="true">'	
									+'<a href="javascript:void(0);" class="kt-menu__link kt-menu__toggle" data-toggle="kt-tooltip" data-skin="brand" title="'+$.osl.escapeHtml(map.menuNm)+'">'
										+'<span class="kt-menu__link-text">'+$.osl.escapeHtml(map.menuNm)+'</span>'
										+'<i class="kt-menu__hor-arrow la la-angle-down"></i>'
										+'<i class="kt-menu__ver-arrow la la-angle-right"></i>'
									+'</a>';
	        				
	        				//2depth 수 체크
	        				var depthTwoCnt = 0;
	        				if(!$.osl.isNull(map.childMenuList)){
	        					depthTwoCnt = Object.keys(map.childMenuList).length;
	        				}
	        				
	        				//2depth 0인경우 skip
	        				if(depthTwoCnt == 0){
	        					return true;
	        				}
	        				
	        				
	        				//dropDown 방향 지정
	        				var submenudir = "kt-menu__submenu--left";
	        				if(idx == 3){
	        					submenudir = "kt-menu__submenu--center";
	        				}
	        				else if(idx > 3){
	        					submenudir = "kt-menu__submenu--right";
	        				}
	        				idx++;
	        				
	        				var addStyleStr = "";
	        				//메뉴 type이 "02"인경우 min-width 지정
	        				if(topMenuType == "01"){
	        					var depth2Cnt = Object.keys(map.childMenuList).length;
	        					if(depth2Cnt > menuConfig[topMenuType]["submenu-frame-cnt"]){
	        						depth2Cnt = menuConfig[topMenuType]["submenu-frame-cnt"];
	        					}
	        					//addStyleStr = 'style="min-width:'+(depth2Cnt * 230)+'px;"';
	        				}
	        				menuInfoStr += '<div class="kt-menu__submenu '+menuConfig[topMenuType]["submenu-type"]+' '+submenudir+'" '+addStyleStr+'>';
	        				
	        				//메뉴 type에 따라 메뉴 출력방식 변경
	        				if(topMenuType == "02"){
	        					menuInfoStr += '<ul class="kt-menu__subnav">';
	        					
	        					//2depth loop
	        					$.each(map.childMenuList, function(key2, map2){
	        						//메뉴 아이콘
	        						var menuIcon = map2["menuInfo"]["menuIcon"];
	        						if($.osl.isNull(menuIcon)){
	        							menuIcon = "";
	        						}
	        						
	        						menuInfoStr += 
	        							'<li class="kt-menu__item  kt-menu__item--submenu" data-ktmenu-submenu-toggle="hover" aria-haspopup="true">'
											+'<a href="javascript:;" class="kt-menu__link kt-menu__toggle">'
												+'<i class="kt-menu__link-icon '+menuIcon+'"></i>'
												+'<span class="kt-menu__link-text">'+$.osl.escapeHtml(map2.menuNm)+'</span>'
												+'<i class="kt-menu__hor-arrow la la-angle-right"></i>'
												+'<i class="kt-menu__ver-arrow la la-angle-right"></i>'
											+'</a>'
											+'<div class="kt-menu__submenu kt-menu__submenu--classic kt-menu__submenu--right">'
												+'<ul class="kt-menu__subnav">';
	        						
	        						//3depth 데이터
	        						if(map2.hasOwnProperty("childMenuList")){
	        							$.each(map2.childMenuList, function(key3, map3){
											menuInfoStr +=
												'<li class="kt-menu__item " aria-haspopup="true">'
													+'<a href="javascript:$.osl.goMenu(\''+$.osl.escapeHtml(map3.menuUrl)+'\', \''+map3.menuId+'\', \''+$.osl.escapeHtml(map3.menuNm)+'\', \''+$.osl.escapeHtml(map3.menuTypeCd)+'\' );" class="osl-favorites__item kt-menu__link ">'
														+'<i class="kt-menu__link-icon flaticon-star" data-fvr-data1="'+map3.menuId+'" data-fvr-data2="'+$.osl.escapeHtml(map3.menuUrl)+'" data-fvr-data3="'+$.osl.escapeHtml(map3.menuTypeCd)+'" data-fvr-data4="'+$.osl.escapeHtml(map.menuNm)+'" data-fvr-data5="'+$.osl.escapeHtml(map2.menuNm)+'" data-fvr-data6="" data-fvr-type="01" onclick="$.osl.favoritesEdit(event,this)"></i>'
														+'<span class="kt-menu__link-text">'+$.osl.escapeHtml(map3.menuNm)+'</span>'
													+'</a>'
												+'</li>';
	        							});
	        						}
	        						
	        						menuInfoStr +=
	        									'</ul>'
	        								+'</div>'
	        							+'</li>';
	        					});
	        					menuInfoStr += '</ul>'
	        				}else {	//기본
	        					menuInfoStr += 
	        						'<div class="kt-menu__subnav">'
	        							+'<ul class="kt-menu__content">';
	        					
	        					
	        					var submenuFrameData = {};
	        					var loopCnt = 0;
	        					
	        					//2depth loop
	        					$.each(map.childMenuList, function(key2, map2){
	        						var submenuFrameCalc = (loopCnt % menuConfig[topMenuType]["submenu-frame-cnt"]);
	        						
	        						//배열 데이터 없는 경우 생성
	        						if(!submenuFrameData.hasOwnProperty(submenuFrameCalc)){
	        							submenuFrameData[submenuFrameCalc] = [];
	        						}
	        						
	        						//메뉴 아이콘
	        						var menuIcon = map2["menuInfo"]["menuIcon"];
	        						if($.osl.isNull(menuIcon)){
	        							menuIcon = "";
	        						}
	        						
	        						//데이터 String 세팅
	        						var menu2DepthInfo = 
	        							'<h3 class="kt-menu__heading kt-menu__toggle">'
											+'<i class="kt-font-dark kt-menu__link-icon '+menuIcon+'"></i>'
											+'<span class="kt-menu__link-text">'+$.osl.escapeHtml(map2.menuNm)+'</span>'
											+'<i class="kt-menu__ver-arrow la la-angle-right"></i>'
										+'</h3>';
	        						
	        						//3depth 데이터
	        						if(map2.hasOwnProperty("childMenuList")){
	        							menu2DepthInfo += '<ul class="kt-menu__inner">';
	        							$.each(map2.childMenuList, function(key3, map3){
	        								menu2DepthInfo += 
	        									'<li class="kt-menu__item " aria-haspopup="true">'
													+'<a href="javascript:$.osl.goMenu(\''+$.osl.escapeHtml(map3.menuUrl)+'\', \''+map3.menuId+'\', \''+$.osl.escapeHtml(map3.menuNm)+'\', \''+$.osl.escapeHtml(map3.menuTypeCd)+'\' )" class="osl-favorites__item kt-menu__link ">'
														+'<i class="kt-menu__link-icon flaticon-star" data-fvr-data1="'+map3.menuId+'" data-fvr-data2="'+$.osl.escapeHtml(map3.menuUrl)+'" data-fvr-data3="'+$.osl.escapeHtml(map3.menuTypeCd)+'" data-fvr-data4="'+$.osl.escapeHtml(map.menuNm)+'" data-fvr-data5="'+$.osl.escapeHtml(map2.menuNm)+'" data-fvr-type="01" onclick="$.osl.favoritesEdit(event,this)"></i>'
														+'<span class="kt-menu__link-text">'+$.osl.escapeHtml(map3.menuNm)+'</span>'
													+'</a>'
												+'</li>';
	        							});
	        							menu2DepthInfo += '</ul>';
	        						}
	        						
	        						//배열 데이터에 추가
	        						submenuFrameData[submenuFrameCalc].push(menu2DepthInfo);
	        						
	        						loopCnt++;
	        					});
	        					
	        					//메뉴 추가
	        					$.each(submenuFrameData,function(subIdx, subMap){
	        						menuInfoStr += '<li class="kt-menu__item kt-scroll osl-top__menu--height" data-scroll="true">';
	        						menuInfoStr += subMap.join('');
	        						menuInfoStr += '</li>';
	        					});
	        				}
	        				
	        				//마무리
	        				menuInfoStr +=
	        						'</div>'
	        					+'</li>';
	        				$("#globalsTopMenuUl").append(menuInfoStr);
	        			});
	        			$.osl.prjMenuList = menuList;
	        		}
	        		
	        		//프로젝트 데이터 세팅
	        		if(!$.osl.isNull(data.prjList)){
	        			//현재 선택된 프로젝트 그룹,프로젝트,권한 그룹 ID
	        			var selPrjGrpId = $("#submenu-prjGrp-sel").data("target-id");
	        			var selPrjId = $("#submenu-prj-sel").data("target-id");
	        			var selAuthGrpId = $("#submenu-authGrp-sel").data("target-id");
	        			
	        			//$.osl 변수 대입
	        			$.osl.selPrjGrpId = selPrjGrpId;
	        			$.osl.selPrjId = selPrjId;
	        			$.osl.selAuthGrpId = selAuthGrpId;
	        			
	        			var prjOrdList = {};
	        			
	        			//프로젝트 목록 계층 세팅
	        			$.each(data.prjList, function(idx, map){
	        				//프로젝트 그룹인 경우
	        				if(map.prjGrpCd == "01"){
	        					prjOrdList[map.prjId] = {"prjGrpNm":map.prjNm, "prjGrpInfo":map, "prjList":{}};
	        				}else{
	        					//프로젝트 인경우
	        					prjOrdList[map.prjGrpId]["prjList"][map.prjId] = map;
	        				}
	        				
	        				//현재 프로젝트 그룹 명
	        				if(selPrjGrpId == map.prjId){
	        					$("#submenu-prjGrp-sel").html('<i class="kt-menu__link-icon fa fa-project-diagram"></i>'+$.osl.escapeHtml(map.prjNm));
	        				}
	        				//현재 프로젝트 명
	        				if(selPrjId == map.prjId){
	        					$("#submenu-prj-sel").html('<i class="kt-menu__link-icon flaticon2-box-1"></i>'+$.osl.escapeHtml(map.prjNm));
	        				}
	        			});

	        			
	        			//프로젝트 그룹 목록 세팅
	        			$.each(prjOrdList, function(idx, map){
	        				if(Object.keys(map.prjList).length == 0){
	        					return true;
	        				}
	        				
	        				//프로젝트 그룹 정보
	        				var prjGrpInfo = map.prjGrpInfo;
	        				
	        				//tooltip
	        				var tooltipStr = '';
	        				
	        				//tooltip 빈 경우 출력 안함
	        				if(!$.osl.isNull(prjGrpInfo.prjDesc)){
	        					tooltipStr = ' data-toggle="kt-tooltip" data-skin="brand" title="'+$.osl.escapeHtml(prjGrpInfo.prjDesc).trim()+'"';
	        				}
	        				
	        				var itemActive = '';
	        				//현재 그룹 active
	        				if(selPrjGrpId == idx){
	        					itemActive = "active";
	        				}
	        				
	        				//서브메뉴 프로젝트 그룹 세팅
	        				$("#submenu-prjGrp-sel_opt").append(
	        						'<li class="kt-nav__item '+itemActive+'" data-toggle="kt-tooltip" data-skin="brand" data-html="true" title="['+$.osl.escapeHtml(map.prjGrpNm)+']</br>'+$.osl.escapeHtml(prjGrpInfo.prjDesc)+'">'
										+'<a href="javascript:$.osl.goPrjGrp(\''+idx+'\')" class="kt-nav__link">'
											+'<span class="badge badge-dark badge-pill kt-font-sm kt-font-bolder osl-aside__badge fa fa-project-diagram kt-margin-r-10"></span>'
											+'<span class="kt-nav__link-text">'+$.osl.escapeHtml(map.prjGrpNm)+'</span>'
										+'</a>'
									+'</li>'
	        				);
	        				
	        				
	        				//프로젝트 그룹 그리기
	        				var appendStr = 
	        					'<li class="osl-favorites__item kt-menu__section kt-menu__section--first"'+tooltipStr+'>'
	        					+'	<i class="kt-menu__link-icon flaticon-star" data-fvr-data1="'+prjGrpInfo.prjId+'" data-fvr-data2="'+$.osl.escapeHtml(prjGrpInfo.prjNm)+'" data-fvr-data3="'+$.osl.escapeHtml(prjGrpInfo.prjDesc)+'" data-fvr-type="02" onclick="$.osl.favoritesEdit(event,this)"></i>'
			    						+'<span class="kt-menu__section-text kt-font-lg kt-label-font-color-4 font-weight-bold" onclick="$.osl.goPrjGrp(\''+idx+'\');">'
			    							+'<span class="badge badge-dark badge-pill kt-font-sm kt-font-bolder osl-aside__badge fa fa-project-diagram kt-margin-r-10"></span>'
			    							+$.osl.escapeHtml(map.prjGrpNm)
			    						+'</span>'
		    					+'	<i class="kt-menu__section-icon flaticon-more-v2"></i>'
		    					+'</li>';
	        				
	        				//프로젝트 목록
        					$.each(map.prjList,function(idx2, map2){

		        				//tooltip
		        				var tooltipStr = '';
		        				
		        				//tooltip 빈 경우 출력 안함
		        				if(!$.osl.isNull(map2.prjDesc)){
		        					tooltipStr = ' data-toggle="kt-tooltip" data-skin="brand" title="'+$.osl.escapeHtml(map2.prjDesc).trim()+'"';
		        				}

		        				var itemActive = '';
		        				//현재 프로젝트 active
		        				if(selPrjId == map2.prjId){
		        					itemActive = "active";
		        				}
		        				
		        				//서브메뉴 프로젝트 세팅
		        				if(selPrjGrpId == map2.prjGrpId){
		        					$("#submenu-prj-sel_opt").append(
			        						'<li class="kt-nav__item '+itemActive+'" data-toggle="kt-tooltip" data-skin="brand" data-html="true" title="['+$.osl.escapeHtml(map2.prjNm)+']</br>'+$.osl.escapeHtml(map2.prjDesc)+'">'
												+'<a href="javascript:$.osl.goPrj(\''+map2.prjGrpId+'\',\''+map2.prjId+'\');" class="kt-nav__link">'
													+'<span class="badge badge-dark badge-pill kt-font-sm kt-font-bolder osl-aside__badge flaticon2-box-1 kt-margin-r-10"></span>'
													+'<span class="kt-nav__link-text">'+$.osl.escapeHtml(map2.prjNm)+'</span>'
												+'</a>'
											+'</li>'
			        				);
		        				}
		        				
        						appendStr += 
        							'<li class="kt-menu__item  kt-menu__item--submenu" aria-haspopup="true" data-ktmenu-submenu-toggle="hover">'
			        				+'	<a href="javascript:void(0);" class="osl-favorites__item kt-menu__link kt-menu__toggle" '+tooltipStr+'>'
			        				+'		<i class="kt-menu__link-icon flaticon-star" data-fvr-data1="'+map2.prjGrpId+'" data-fvr-data2="'+map2.prjId+'" data-fvr-data3="'+$.osl.escapeHtml(prjGrpInfo.prjNm)+'" data-fvr-data4="'+$.osl.escapeHtml(map2.prjNm)+'" data-fvr-data5="'+$.osl.escapeHtml(map2.prjDesc)+'" data-fvr-type="03" onclick="$.osl.favoritesEdit(event,this)"></i>'
			        						+'<span class="kt-menu__link-text kt-font-md kt-font-bolder">'
			        						+'<span class="badge badge-dark badge-pill kt-font-sm kt-font-bolder osl-aside__badge flaticon2-box-1 kt-margin-r-10"></span>'
			        							+$.osl.escapeHtml(map2.prjNm)
			        						+'</span>'
			        				+'		<i class="kt-menu__ver-arrow la la-angle-right"></i>'
			        				+'	</a>'
			        				+'	<div class="kt-menu__submenu "><span class="kt-menu__arrow"></span>'
			        				+'		<ul class="kt-menu__subnav osl-submenu-list__authGrp" data-prj-id="'+map2.prjId+'">'
			        				+'		</ul>'
			        				+'	</div>'
			        				+'</li>'; 
        					});
	        				
        					//구분선
        					appendStr += '<div class="kt-separator kt-separator--space-sm kt-separator--border-solid"></div>';
        					
	        				$("#osl_aside_prjAuth_List").append(appendStr);
	        			});
	        			
	        			//권한 그룹 목록 세팅
	        			if(!$.osl.isNull(data.authList)){
	        				$.each(data.authList, function(idx, map){
	        					//현재 권한그룹 명
		        				if(selPrjGrpId == map.prjGrpId && selPrjId == map.prjId && selAuthGrpId == map.authGrpId){
		        					$("#submenu-authGrp-sel").html('<i class="kt-menu__link-icon fa fa-user-tie"></i>'+$.osl.escapeHtml(map.authGrpNm));
		        				}
		        				
		        				
	        					if(!prjOrdList[map.prjGrpId]["prjList"].hasOwnProperty(map.prjId)){
	        						prjOrdList[map.prjGrpId]["prjList"][map.prjId] = {};
	        					}
	        					
		        				if(!prjOrdList[map.prjGrpId]["prjList"][map.prjId].hasOwnProperty("authGrpList")){
		        					prjOrdList[map.prjGrpId]["prjList"][map.prjId]["authGrpList"] = {};
		        				}
	        					//프로젝트 권한 그룹 목록에 추가
	        					prjOrdList[map.prjGrpId]["prjList"][map.prjId]["authGrpList"][map.authGrpId] = map;

		        				//tooltip
		        				var tooltipStr = '';
		        				
		        				//tooltip 빈 경우 출력 안함
		        				if(!$.osl.isNull(map.authGrpDesc)){
		        					tooltipStr = ' data-toggle="kt-tooltip" data-skin="brand" title="'+$.osl.escapeHtml(map.authGrpDesc).trim()+'"';
		        				}
		        				

		        				var itemActive = '';
		        				//현재 프로젝트 active
		        				if(selAuthGrpId == map.authGrpId){
		        					itemActive = "active";
		        				}
		        				
		        				//서브메뉴 권한 그룹 세팅
		        				if(selPrjGrpId == map.prjGrpId && selPrjId == map.prjId){
		        					$("#submenu-authGrp-sel_opt").append(
			        						'<li class="kt-nav__item '+itemActive+'" data-toggle="kt-tooltip" data-skin="brand" data-html="true" title="['+$.osl.escapeHtml(map.authGrpNm)+']</br>'+$.osl.escapeHtml(map.authGrpDesc)+'">'
												+'<a href="javascript:$.osl.goAuthGrp(\''+map.prjGrpId+'\',\''+map.prjId+'\',\''+map.authGrpId+'\');" class="kt-nav__link">'
													+'<span class="badge badge-dark badge-pill kt-font-sm kt-font-bolder osl-aside__badge fa fa-user-tie kt-margin-r-10"></span>'
													+'<span class="kt-nav__link-text">'+$.osl.escapeHtml(map.authGrpNm)+'</span>'
												+'</a>'
											+'</li>'
			        				);
		        				}
		        				
	        					$(".osl-submenu-list__authGrp[data-prj-id="+map.prjId+"]").append(
	        							'<li class="kt-menu__item " aria-haspopup="true">'
		        						+'	<a href="javascript:$.osl.goAuthGrp(\''+map.prjGrpId+'\',\''+map.prjId+'\',\''+map.authGrpId+'\');" class="osl-favorites__item kt-menu__link ">'
		        						+'		<i class="kt-menu__link-bullet kt-menu__link-bullet--dot"><span></span></i>'
		        						+'		<i class="kt-menu__link-icon flaticon-star" data-fvr-data1="'+map.prjGrpId+'" data-fvr-data2="'+map.prjId+'" data-fvr-data3="'+map.authGrpId+'" data-fvr-data4="'+$.osl.escapeHtml(prjOrdList[map.prjGrpId].prjGrpNm)+'" data-fvr-data5="'+$.osl.escapeHtml(prjOrdList[map.prjGrpId]["prjList"][map.prjId].prjNm)+'" data-fvr-data6="'+$.osl.escapeHtml(map.authGrpNm)+'" data-fvr-type="04" onclick="$.osl.favoritesEdit(event,this)"></i>'
		        								+'<span class="kt-menu__link-text kt-font-md">'
		        									+'<span class="badge badge-dark badge-pill kt-font-sm kt-font-bolder osl-aside__badge fa fa-user-tie kt-margin-r-10"></span>'
		        									+$.osl.escapeHtml(map.authGrpNm)
		        								+'</span>'
		        						+'	</a>'
		        						+'</li>');
	        				});
	        			}
	        		}
	        		
	        		//즐겨찾기 데이터 세팅
	        		if(!$.osl.isNull(data.fvrList)){
	        			$.each(data.fvrList, function(idx, map){
	        				//즐겨찾기 타입
	        				var fvrType = map.fvrType;
	        				
	        				//메뉴 대상
	        				var fvrTargetElem;
	        				var fvrTargetEvt;
	            			var fvrTitleStr = "";
	            			
	        				//현재 추가된 메뉴 즐겨찾기 상태 변경
	        				if(fvrType == "01"){
	        					fvrTargetElem = $(".osl-favorites__item i[data-fvr-data1="+$.osl.escapeHtml(map.fvrSubData1)+"][data-fvr-type="+fvrType+"]");
	        					fvrTargetEvt = '$.osl.goMenu(\''+$.osl.escapeHtml(map.fvrSubData2)+'\', \''+$.osl.escapeHtml(map.fvrSubData1)+'\', \''+$.osl.escapeHtml(map.fvrNm)+'\', \''+$.osl.escapeHtml(map.fvrSubData3)+'\' )';
	        					fvrTitleStr = 
	        						'<div class="kt-align-left">'
	        							+'<i class="fa fa-layer-group"></i>&nbsp;'
	        							+$.osl.lang("common.menu.top")+' : '
		        						+$.osl.escapeHtml(map.fvrSubData4)+'</br>'
		        						+'<i class="fa fa-layer-group"></i>&nbsp;'
		        						+$.osl.lang("common.menu.upper")+'　 : '
		        						+$.osl.escapeHtml(map.fvrSubData5)+'</br>'
		        						+'<i class="fa fa-layer-group"></i>&nbsp;'
		        						+$.osl.lang("common.menu.name")+' : '
		        						+$.osl.escapeHtml(map.fvrNm)
	        						'/<div>';
	        				}
	        				else if(fvrType == "02"){
	        					fvrTargetElem = $(".osl-favorites__item i[data-fvr-data1="+$.osl.escapeHtml(map.fvrSubData1)+"][data-fvr-type="+fvrType+"]");
	        					fvrTargetEvt = '$.osl.goPrjGrp(\''+map.fvrSubData1+'\')';
	        					fvrTitleStr = '';
	        					fvrTitleStr = 
	        						'<div class="kt-align-left">'
		        						+$.osl.escapeHtml(map.fvrNm)
	        						'/<div>';
	        				}
	        				else if(fvrType == "03"){
	        					fvrTargetElem = $(".osl-favorites__item i[data-fvr-data1="+$.osl.escapeHtml(map.fvrSubData1)+"][data-fvr-data2="+$.osl.escapeHtml(map.fvrSubData2)+"][data-fvr-type="+fvrType+"]");
	        					fvrTargetEvt = '$.osl.goPrj(\''+map.fvrSubData1+'\',\''+map.fvrSubData2+'\')';
	        					fvrTitleStr = 
	        						'<div class="kt-align-left">'
	        							+'<i class="fa fa-layer-group"></i>&nbsp;'
	        							+$.osl.lang("common.name.prjGrp")+': '
		        						+$.osl.escapeHtml(map.fvrSubData3)+'</br>'
		        						+'<i class="fa fa-layer-group"></i>&nbsp;'
		        						+$.osl.lang("common.name.prj")+': '
		        						+$.osl.escapeHtml(map.fvrNm)+'</br>'
	        						'/<div>';
	        				}
	        				else if(fvrType == "04"){
	        					fvrTargetElem = $(".osl-favorites__item i[data-fvr-data1="+$.osl.escapeHtml(map.fvrSubData1)+"][data-fvr-data2="+$.osl.escapeHtml(map.fvrSubData2)+"][data-fvr-data3="+$.osl.escapeHtml(map.fvrSubData3)+"][data-fvr-type="+fvrType+"]");
	        					fvrTargetEvt = '$.osl.goAuthGrp(\''+map.fvrSubData1+'\',\''+map.fvrSubData2+'\',\''+map.fvrSubData3+'\')';
	        					fvrTitleStr = 
	        						'<div class="kt-align-left">'
	        							+'<i class="fa fa-layer-group"></i>&nbsp;'
	        							+$.osl.lang("common.name.prjGrp")+': '
		        						+$.osl.escapeHtml(map.fvrSubData4)+'</br>'
		        						+'<i class="fa fa-layer-group"></i>&nbsp;'
		        						+$.osl.lang("common.name.prj")+': '
		        						+$.osl.escapeHtml(map.fvrSubData5)+'</br>'
		        						+'<i class="fa fa-layer-group"></i>&nbsp;'
		        						+$.osl.lang("common.name.authGrp")+': '
		        						+$.osl.escapeHtml(map.fvrNm)
	        						'/<div>';
	        				}
	        				
	        				//현재 즐겨찾기 메뉴가 전체 메뉴에 포함되어있는지 체크
	        				if(!$.osl.isNull(fvrTargetElem) && fvrTargetElem.length > 0){
		        				var fvrElem =
		        					'<li class="kt-menu__item " aria-haspopup="true" data-toggle="kt-tooltip" data-html="true" data-placement="top" data-skin="brand" title="'+$.osl.escapeHtml(fvrTitleStr)+'">'
									+'			<a href="javascript:'+fvrTargetEvt+';" class="kt-menu__link fvrHoverInfo">'
									+'		<i class="kt-menu__link-icon flaticon-star osl-favorites--active" data-fvr-id="'+map.fvrId+'" data-fvr-data1="'+$.osl.escapeHtml(map.fvrSubData1)+'"data-fvr-data2="'+$.osl.escapeHtml(map.fvrSubData2)+'"data-fvr-data3="'+$.osl.escapeHtml(map.fvrSubData3)+'" data-fvr-data4="'+$.osl.escapeHtml(map.fvrSubData4)+'" data-fvr-data5="'+$.osl.escapeHtml(map.fvrSubData5)+'" data-fvr-data6="'+$.osl.escapeHtml(map.fvrSubData6)+'" data-fvr-type="'+map.fvrType+'" onclick="$.osl.favoritesEdit(event,this)"></i>'
									+'		<span class="kt-menu__link-text">'+$.osl.escapeHtml(map.fvrNm)+'</span>'
									+'	</a>'
									+'</li>';
		        				
		        				//즐겨찾기 메뉴 추가
		        				$("#fvrListType"+map.fvrType).append(fvrElem);
		        				
	        					fvrTargetElem.attr("data-fvr-id",map.fvrId);
	        					fvrTargetElem.addClass("osl-favorites--active");
	        				}
	        				
	        			});
	        		}

	        		//알림 리스트
        			$.osl.datatable.setting("notificationsTable",{
        				data: {
        					source: {
        						read: {
        							url: "/arm/arm1000/arm1100/selectArm1100NtfListAjax.do"
        						}
        					}
        				},
        				columns: [
        					{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
        				],
        				actionBtn:{
        					"update": false,
        					"delete" : false,
        				},
        				toolbar:{
        					items:{
        						pagination:{
        							pageSizeSelect : [10, 20, 30, 50, 100],
        							pages:{
        								desktop: {
        									layout: 'compact',
        								},
            							tablet: {
            								layout: 'compact'
            							},
        							}
        						}
        					}
        				},
        				callback:{
        					initComplete: function(evt,config){
        						$("#notificationsTable .kt-datatable__table").css({visibility: "hidden", height: 0});
        						$("#notificationsCardTable").show();
        					},
        					ajaxDone: function(evt, list){
        						var ntfStr = '';
        						var cardMsg = '';
        						$.each(list, function(idx, map){
        							//알림 유형에 따른 색상 변경
        							var cardUi = map.armSendTypeNm;
        							
        							
        							//미확인 알림 백그라운드 색 변경
        							var cardStat = '';
        							if(map.checkCd=='02'){
        								cardStat = 'osl-notification-not-read__bg-color';
        							}
        							if(map.armTypeCd == '01'){
        								cardMsg = "프로젝트 그룹명 : " + $.osl.escapeHtml(map.prjGrpNm);
        							}else if(map.armTypeCd == '02'){
        								cardMsg = "프로젝트명 : " + $.osl.escapeHtml(map.prjNm);
        							}else if(map.armTypeCd == '03'){
        								cardMsg = "권한그룹명 : " + $.osl.escapeHtml(map.authGrpNm);
        							}else if(map.armTypeCd == '04'){
        								cardMsg = "사용자명 : " + $.osl.escapeHtml(map.sendUsrNm);
        								cardMsg += "<br/>사용자 이메일 : " + $.osl.escapeHtml(map.sendUsrEmail);
        							}
        							
        							
        							//cardUi=flaticon-bell kt-font-focus;
        							//카드 UI
        							ntfStr +=
        								 '<a href="#" class="kt-notification-v2__item '+cardStat+'" data-html="true" data-toggle="kt-tooltip" data-skin="brand osl-notification-tooltip" data-original-title="'+cardMsg+'">'
										+'	<div class="kt-notification-v2__item-icon">'
										+'		<i class="'+cardUi+'"></i>'
										+'	</div>'
										+'	<div class="kt-notification-v2__item-wrapper">'
										+'		<div class="kt-notification-v2__item-title">'
										+'			'+$.osl.escapeHtml(map.armTitle)+''
										+'		</div>'
										+'		<div class="kt-notification-v2__item-desc">'
										+'			'+$.osl.escapeHtml(map.armContent)+''
										+'		</div>'
										+'	</div>'
										+'</a>';
										
        						});
        						
        						//로드된 데이터 CARD형식으로 추가
        						$("#notificationsCardTable").html(ntfStr);
        						KTApp.initTooltips();
        						
        						//미확인 알림 확인 ajax 설정
        						var ajaxObj = new $.osl.ajaxRequestAction({"url":"/arm/arm1000/arm1100/selectArm1100NtfNotReadCntAjax.do"});
        						//ajax 전송 성공 함수
        						ajaxObj.setFnSuccess(function(data){
        				    		if(data.errorYn == "Y"){
        								$.osl.alert(data.message,{type: 'error'});
        							}else{
        								var notRead = data.notRead;
        								if(notRead.notReadCnt==0){
        									$("#kt_offcanvas_toolbar_notifications_toggler_btn .pulse-ring").remove();
            								$("#kt_offcanvas_toolbar_notifications_toggler_btn .kt-badge").remove();
        								}
        							}
        				    	});
        						//미확인 알림 확인 ajax 전송
        						ajaxObj.send();
        						
        						//알림 버튼 클릭시 미확인 알림 확인 이력 등록
        						$("#kt_offcanvas_toolbar_notifications_toggler_btn").click(function(){
        							$.osl.datatable.list.notificationsTable.targetDt.reload();
        							
        							//미확인 알림 확인 처리 ajax 설정
            						var ajaxObj = new $.osl.ajaxRequestAction({"url":"/arm/arm1000/arm1100/insertArm1101NtfInfoAjax.do"});
            						//ajax 전송 성공 함수
            						ajaxObj.setFnSuccess(function(data){
            				    		if(data.errorYn == "Y"){
            								$.osl.alert(data.message,{type: 'error'});
            							}else{
            								$("#kt_offcanvas_toolbar_notifications_toggler_btn .pulse-ring").remove();
            								$("#kt_offcanvas_toolbar_notifications_toggler_btn .kt-badge").remove();
            								var newNtfMsg = data.notRead.notReadCnt+"건의 새로운 알림"
            								$("#newNtfMsg").html(newNtfMsg);
            							}
            				    	});
            						//미확인 알림 확인 처리 ajax 전송
            						ajaxObj.send();
        						})
        						
        					}
        				}
        			});
        			
	        		//담당 요구사항 리스트
        			$.osl.datatable.setting("chargeReqTable",{
        				data: {
        					source: {
        						read: {
        							url: "/req/req4000/req4100/selectReq4100ChargeReqListAjax.do"
        						}
        					}
        				},
        				columns: [
        					{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
        					{field: 'rn', title: 'No.', textAlign: 'center', width: 25, autoHide: false, sortable: false},
        					{field: 'prjNm', title: '프로젝트명', textAlign: 'left', width: 150, search: true},
        					{field: 'reqOrd', title: '요청번호', textAlign: 'left', width: 110, autoHide: false, search: true},
        					{field: 'reqProTypeNm', title:'처리유형', textAlign: 'left', width: 100, autoHide: false, search: true, searchType:"select", searchCd: "REQ00008", searchField:"reqProTypeCd", sortField: "reqProTypeCd"},
        					{field: 'reqNm', title: '요구사항명', textAlign: 'left', width: 380, search: true, autoHide: false,
        						template: function(row){
        							var resultStr = $.osl.escapeHtml(row.reqNm);
        							//비밀번호가 있는 경우
        							if(row.reqPw == "Y"){
        								resultStr += "<i class='la la-unlock kt-icon-xl kt-margin-l-5 kt-margin-r-5'></i>";
        							}
        							return resultStr;
        						}
        					},
        					{field: 'reqDtm', title: '요청일', textAlign: 'center', width: 100, search: true, searchType:"date"},
        					{field: 'regDtm', title: '등록일', textAlign: 'center', width: 100, search: true, searchType:"date",
        						template: function (row) {
        							var paramDatetime = new Date(row.regDtm);
        			                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
        			                return agoTimeStr.agoString;
        						}
        					},
        					{field: 'reqUsrNm', title: '요청자', textAlign: 'center', width: 120, search: true,
        						template: function (row) {
        							if($.osl.isNull(row.reqUsrNm)){
        								row.reqUsrNm = "";
        							}
        							var usrData = {
        								html: row.reqUsrNm,
        								imgSize: "sm",
        								class:{
        									cardBtn: "osl-width__fit-content"
        								}
        							};
        							return $.osl.user.usrImgSet(row.reqUsrImgId, usrData);
        						},
        						onclick: function(rowData){
        							$.osl.user.usrInfoPopup(rowData.reqUsrId);
        						}
        					},
        					{field: 'reqUsrEmail', title:'요청자e-mail', textAlign: 'left', width: 180, search: true},
        					{field: 'reqUsrDeptNm', title:'요청자 조직', textAlign: 'center', width: 300, sortable: false},
        					{field: 'reqUsrNum', title: '요청자 연락처', textAlign: 'center', width: 100, search: true},
        					{field: 'reqKey', title: '요구사항 key', textAlign: 'center', width: 300, sortable: false, search: true}
        				],
        				searchColumns:[
        					{field: 'prjGrpNm', title: $.osl.lang("req4100.field.prjGrpNm"), searchOrd: 0}
        				],
        				actionBtn:{
        					"update": false,
        					"delete" : false,
        				},
        				toolbar:{
        					items:{
        						pagination:{
        							pageSizeSelect : [4, 10, 20, 30, 50, 100],
        							pages:{
        								desktop: {
        									layout: 'compact',
        								},
            							tablet: {
            								layout: 'compact'
            							},
        							}
        						}
        					}
        				},
        				callback:{
        					initComplete: function(evt,config){
        						$("#chargeReqTable .kt-datatable__table").css({visibility: "hidden", height: 0});
        						$("#chargeReqCardTable").show();
        					},
        					ajaxDone: function(evt, list){
        						var prjGrpStr = '';
        						$.each(list, function(idx, map){
        							var prjGrpAuthList = '';
        							var prjAuthTargetList = [];
        							var fvrUse = '';
        							//처리 유형에 따른 색상 변경
        							var cardUi = 'kt-portlet--solid-success';
        							
        							//프로젝트 그룹 번호
        							var rnStr = "No. "+map.rn;
        							var rnClass = "badge-primary";
        							var usrData = {
    									html: map.reqUsrNm,
    									imgSize: "sm",
    									class:{
    										cardBtn: "osl-width__fit-content",
    										cardName: "osl-charge-requirements__color--white",
    									}
    								};
        							
        							if(map.fvrUseCd == '01'){
    									fvrUse = 'osl-favorites--active';
    								}        							
        							//카드 UI
        							prjGrpStr +=
        								 '	<div class="kt-portlet osl-charge-requirements '+cardUi+'" data-prj-grp-id="'+map.prjGrpId+'" data-prj-id="'+map.prjId+'" data-req-id="'+map.reqId+'">'
										+'		<div class="kt-portlet__head ">'
										+'			<div class="kt-portlet__head-label">'
										+'				<h3 class="kt-portlet__head-title osl-charge-requirements__head-title" data-toggle="kt-tooltip" data-skin="brand" title="" data-original-title="['+$.osl.escapeHtml(map.reqOrd)+'] '+$.osl.escapeHtml(map.reqNm)+'">['+$.osl.escapeHtml(map.reqOrd)+'] '+$.osl.escapeHtml(map.reqNm)+'</h3>'
										+'			</div>'
										+'			<div class="kt-portlet__head-toolbar">'
										+'				<i class="kt-nav__link-icon flaticon-star osl-charge-flaticon-star '+fvrUse+'" data-fvr-data1="'+$.osl.escapeHtml(map.reqId)+'" data-fvr-type="05" data-fvr-id="'+map.fvrId+'" onclick="$.osl.favoritesEdit(event,this);$.osl.datatable.list.chargeReqTable.targetDt.reload();"></i>'
										+'			</div>'
										+'		</div>'
										+'		<div class="kt-portlet__body osl-padding-b-7">'
										+'			<div class="kt-portlet__content osl-charge-requirements__body"  data-toggle="kt-tooltip" data-skin="brand" title="" data-original-title="'+$.osl.escapeHtml(map.reqDesc)+'">'
										+'				'+$.osl.escapeHtml(map.reqDesc)+''
										+'			</div>'
										+'			<div class="kt-align-right osl-margin-t-1rm">'
										+'				<i class="fa fa-key"></i>'
						        		+'				<i class="fa fa-file-signature"></i>'
						        		+'				<i class="far fa-stop-circle"></i>'
						        		+'				<i class="fa fa-sign-out-alt"></i>'
						        		+'				<i class="fa fa-code-branch"></i>'
						        		+'				<i class="fa fa-code"></i>'
						        		+'				<i class="fa fa-puzzle-piece"></i>'
						        		+'				<i class="fa fa-user-shield"></i>'
										+'			</div>'
										+'		</div>'
										+'		<div class="kt-portlet__foot kt-portlet__foot--sm kt-align-right" style="display: flex;justify-content: space-between;">'
										+'			<div class="osl-charge-requirements__footer-label" style="display: flex;align-items: center;-webkit-box-align: center;" onclick="$.osl.user.usrInfoPopup(\''+map.reqUsrId+'\');">'
										+'				'+$.osl.user.usrImgSet(map.reqUsrImgId, usrData)+''
										+'			</div>'
										+'			<div class="osl-charge-requirements__footer-toolbar" style="display: flex;align-content: flex-end;">'
										+'				<a href="#" class="btn btn-bold btn-upper btn-sm btn-font-light btn-outline-hover-light">업무화면</a>'
										+'				<a href="#" class="btn btn-bold btn-upper btn-sm btn-font-light btn-outline-hover-light">상세보기</a>'
										+'			</div>'
										+'		</div>'
										+'	</div>';
        						});
        						
        						
        						//로드된 데이터 CARD형식으로 추가
        						$("#chargeReqCardTable").html(prjGrpStr);
        						KTApp.initTooltips();
        					}
        				}
        			});
        			
	        		$.osl.prjGrpAuthList = prjOrdList;
	        		$.osl.showLoadingBar(false,{target: "#kt_header"});
	        		
	        		//프로젝트 조회 이동
	        		$("#searchPrjNmBtn").click(function(){
	        			var data = {
	        					paramUsrId: $.osl.user.usrId,
	        					paramPrjNm : $("#mainPrjNm").val(),
	        			};
	        			var options = {
	        					modalTitle: $.osl.lang("cmm17000.title.searchPrj"),
	        					closeConfirm: false,
	        					modalSize:"xl",
	        					callback:[{
	        						targetId: "selectPrj",
	        						actionFn: function(thisObj){
	        							var prjNm = OSLCmm17000Popup.getPrjInfo();
	        							$("#mainPrjNm").val(prjNm);
	        						}
	        					}]
	        			};
	        			$.osl.layerPopupOpen('/cmm/cmm10000/cmm17000/selectCmm17000View.do', data, options);
	        			
	        		});
	        		
	        		//엔터키
	        		$("#mainPrjNm").keydown(function(e){
	        			if(e.keyCode=='13'){
	        				//해당 값으로 검색화면 띄우기
	        				$("#searchPrjNmBtn").click();
	        			}
	        		});
	        		//메인프로젝트 설정
	        		$("#mainPrjNm").val(data.mainPrjInfo[0].popPrjNm);
	        		
	        	}else{
	        		$.osl.toastr(data.message);
	        	}
	        	
	        	if(typeof callBackFn == "function"){
					//calback 함수
	        		callBackFn();
	        	}
			});
			
			//AJAX 전송
			ajaxObj.send();
		}
		/**
		 *  function 명 	: $.osl.chart
		 *  function 설명	: chart 생성자
		 **/
		,chart:{
			/**
			 *  function 명 	: $.osl.chart.list
			 *  function 설명	: 페이지에 생성된 chart 목록
			 **/
			list: {},
			/**
			 *  function 명 	: $.osl.chart.setting
			 *  function 설명	: targetId div에 chart를 생성한다.
			 **/
			setting: $.noop
		}
		/**
		 *  function 명 	: $.osl.datatable
		 *  function 설명	: datatable 생성자
		 **/
		,datatable:{
			/**
			 *  function 명 	: $.osl.datatable.list
			 *  function 설명	: 페이지에 생성된 datatable 목록
			 **/
			list:{},
			/**
			 *  function 명 	: $.osl.datatable.setting
			 *  function 설명	: targetId div에 datatable를 생성한다.
			 *  @param targetId: datatable 생성 타겟 요소 ID (# 제외) 
			 *  @param config: datatable 설정 값
			 **/
			setting: function(targetId, config){
				//id값 없는 경우 skip
				if($.osl.isNull(targetId)){
					return true;
				}
				
				//내부에서 추가된 datatable 목록
				var datatables = {};
				
				//기능 동작 버튼 제어
				var btnEvt = {
					//데이터 테이블 외부에 있는 버튼 이벤트 대입
					list: function(){
						//각 버튼에 이벤트 걸기
						if($("[data-datatable-id="+targetId+"][data-datatable-action]").length > 0){
							$.each($("[data-datatable-id="+targetId+"][data-datatable-action]"), function(idx, map){
								var btnDatatableId = $(map).data("datatable-id");
								var btnAction = $(map).data("datatable-action");
								
								//action별 동작 호출
								if(btnEvt.action.hasOwnProperty(btnAction)){
									btnEvt.action[btnAction](this, btnDatatableId, "list");
								}else{
									//action 없는경우 사용자 설정 값에 해당 함수 있는지 체크
									if(targetConfig.actionFn.hasOwnProperty(btnAction)){
										$(this).off("click");
										$(this).click(function(event){
											//중복 이벤트 중지
											event.cancelable = true;
											event.stopPropagation();
											event.preventDefault();
											event.returnValue = false;
											
											var rowData = [];
											
											//선택 레코드 수
											var selRecords = datatables.targetDt.getSelectedRecords();
											
											$.each(selRecords, function(idx, map){
												var rowIdx = $(map).data("row");
												var tmp_rowData = datatables.targetDt.dataSet[rowIdx];
												rowData.push(tmp_rowData);
											});
											
											targetConfig.actionFn[btnAction](rowData, btnDatatableId, "list", rowData.length, this);
										});
									}
								}
							});
						}
					},
					//데이터 테이블 내부의 row에 추가된 active 버튼 이벤트 대입
					info: function(row){
						if($(row).find("[data-datatable-id="+targetId+"][data-datatable-action]").length > 0){
							var btnRowNum = $(row).data("row");
							
							$.each($(row).find("[data-datatable-id="+targetId+"][data-datatable-action]"), function(idx, map){
								var btnDatatableId = $(map).data("datatable-id");
								var btnAction = $(map).data("datatable-action");

								//action별 동작 호출
								if(btnEvt.action.hasOwnProperty(btnAction)){
									btnEvt.action[btnAction](this, btnDatatableId, "info", btnRowNum, row);
								}else{
									//action 없는경우 사용자 설정 값에 해당 함수 있는지 체크
									if(targetConfig.actionFn.hasOwnProperty(btnAction)){
										$(this).off("click");
										$(this).click(function(event){
											//중복 이벤트 중지
											event.cancelable = true;
											event.stopPropagation();
											event.preventDefault();
											event.returnValue = false;

											var tmp_rowData = datatables.targetDt.dataSet[btnRowNum];
											
											targetConfig.actionFn[btnAction](tmp_rowData, btnDatatableId, "info", btnRowNum, this);
										});
									}
								}
							});
							
							//tooltip 세팅
							KTApp.initTooltips();
						}
					},
					/**
					 * 해당되는 버튼 동작 함수 - 사전 데이터 가공 작업
					 * select -> 해당 datatable 페이지 1로 복귀하고 데이터 재 조회
					 * insert -> config에 선언된 insert 함수 호출 (페이지 제어) 
					 * update,delete -> config에 선언된 insert 함수 호출 (페이지 제어)
					 * 				-> 선택된 데이터 Json 파라미터 값으로 전달
					 */
					action: {
						"select": function(elem, datatableId, bubleFlag) {
							$(elem).off("click");
							$(elem).click(function(event){
								if(bubleFlag != false){
									//중복 이벤트 중지
									event.cancelable = true;
									event.stopPropagation();
									event.preventDefault();
									event.returnValue = false;
								}
								
								//사용자 정의함수에 select가 있는 경우 함수 호출
								if(datatables.config.actionFn.hasOwnProperty("select")){
									//해당 datatable select 로직 가져오기
									datatables.config.actionFn["select"](datatableId, elem, datatables.targetDt);
								}
								//select없는 경우 데이터테이블 기본 조회 동작
								else{
									datatables.targetDt.setDataSourceParam("pagination.page",1);
									datatables.targetDt.reload();
								}
							});
						},
						"insert": function(elem, datatableId, type, rowNum, bubleFlag) {
							$(elem).off("click");
							$(elem).click(function(event){
								if(bubleFlag != false){
									//중복 이벤트 중지
									event.cancelable = true;
									event.stopPropagation();
									event.preventDefault();
									event.returnValue = false;
								}
								
								//해당 datatable insert 로직 가져오기
								datatables.config.actionFn["insert"](datatableId, type, rowNum,elem);
							});
						},
						"update": function(elem, datatableId, type, rowNum, bubleFlag) {
							$(elem).off("click");
							$(elem).click(function(event){
								if(bubleFlag != false){
									//중복 이벤트 중지
									event.cancelable = true;
									event.stopPropagation();
									event.preventDefault();
									event.returnValue = false;
								}
								
								var rowData;
								//외부 버튼 클릭 시 (체크박스 데이터 연동)
								if(type == "list"){
									//선택 레코드 수
									var selRecords = datatables.targetDt.getSelectedRecords();
									
									//선택 레코드 없는 경우
									if(selRecords.length == 0){
										$.osl.alert($.osl.lang("datatable.action.update.nonSelect"));
										return true;
									}
									//선택 레코드 2개이상인경우 alert 띄우기
									else if(selRecords.length > 1){
										$.osl.alert($.osl.lang("datatable.action.update.manySelect",selRecords.length));
										return true;
									}
									else{
										var rowIdx = datatables.targetDt.getSelectedRecords().data("row");
										
										rowData = datatables.targetDt.dataSet[rowIdx];
									}
								}
								//레코드 내부 Action 버튼 클릭 시
								else if(type == "info"){
									rowData = datatables.targetDt.dataSet[rowNum];
								}
								
								//해당 datatable update 로직 가져오기
								datatables.config.actionFn["update"](rowData, datatableId, type, rowNum,elem);
								
							});
						},
						"delete": function(elem, datatableId, type, rowNum, bubleFlag) {
							$(elem).off("click");
							$(elem).click(function(event){
								if(bubleFlag != false){
									//중복 이벤트 중지
									event.cancelable = true;
									event.stopPropagation();
									event.preventDefault();
									event.returnValue = false;
								}
								
								var rowData = [];
								//외부 버튼 클릭 시 (체크박스 데이터 연동)
								if(type == "list"){
									//선택 레코드 수
									var selRecords = datatables.targetDt.getSelectedRecords();
									
									//선택 레코드 없는 경우
									if(selRecords.length == 0){
										$.osl.alert($.osl.lang("datatable.action.delete.nonSelect"));
										return true;
									}
									else{
										$.each(selRecords, function(idx, map){
											var rowIdx = $(map).data("row");
											var tmp_rowData = datatables.targetDt.dataSet[rowIdx];
											
											rowData.push(tmp_rowData);
										});
									}
								}
								//레코드 내부 Action 버튼 클릭 시
								else if(type == "info"){
									rowData.push(datatables.targetDt.dataSet[rowNum]);
								}
								
								$.osl.confirm($.osl.lang("datatable.action.delete.confirm",rowData.length),null, function(result){
									if (result.value) {
										//해당 datatable delete 로직 가져오기
										datatables.config.actionFn["delete"](rowData, datatableId, type, rowNum, elem);
									}
								});
								
							});
						},
						"click": function(elem, datatableId, type, rowNum, row, bubleFlag){
							//action btn click evt
							$(elem).off("click");
							$(elem).click(function(event){
								if(bubleFlag != false){
									//중복 이벤트 중지
									event.cancelable = true;
									event.stopPropagation();
									event.preventDefault();
									event.returnValue = false;
								}
								
								var rowData = datatables.targetDt.dataSet[rowNum];
								
								//해당 datatable click 로직 가져오기
								datatables.config.actionFn["click"](rowData, datatableId, type, rowNum, elem);
							});
							
							//row click evt
							//$(row).off("click");
							$(row).click(function(event){
								//체크박스, 펼치기인경우 return 
								if($(event.target.parentElement).hasClass("kt-checkbox") || $(event.target.parentElement).hasClass("kt-datatable__toggle-detail")){
									return true;
								}
								if(bubleFlag != false){
									//중복 이벤트 중지
									event.cancelable = true;
									event.stopPropagation();
									event.preventDefault();
									event.returnValue = false;
								}
								
								//테이블 선택 효과
								$(".kt_datatable[id="+datatableId+"] tr.kt-datatable__row.osl-datatable__row--selected").removeClass("osl-datatable__row--selected");
								$(".kt_datatable[id="+datatableId+"] tr.kt-datatable__row[data-row="+$(row).data("row")+"]").addClass("osl-datatable__row--selected");
								
								var rowData = datatables.targetDt.dataSet[rowNum];
								
								//해당 datatable click 로직 가져오기
								datatables.config.actionFn["click"](rowData, datatableId, type, rowNum, elem);
							});
						},
						"dblClick": function(elem, datatableId, type, rowNum, row, bubleFlag){
							$(elem).off("click");
							$(elem).click(function(event){
								if(bubleFlag != false){
									//중복 이벤트 중지
									event.cancelable = true;
									event.stopPropagation();
									event.preventDefault();
									event.returnValue = false;
								}
								var rowData = datatables.targetDt.dataSet[rowNum];
								
								//해당 datatable dblClick 로직 가져오기
								datatables.config.actionFn["dblClick"](rowData, datatableId, type, rowNum, elem );
							});

							//row double click evt
							$(row).off("dblclick");
							$(row).on('dblclick', function (event) {
								if(bubleFlag != false){
									//중복 이벤트 중지
									event.cancelable = true;
									event.stopPropagation();
									event.preventDefault();
									event.returnValue = false;
								}
								var rowData = datatables.targetDt.dataSet[rowNum];
								
								//해당 datatable click 로직 가져오기
								datatables.config.actionFn["dblClick"](rowData, datatableId, type, rowNum, elem );
							});
						}
					}
				};
				
				/**
				 * 검색 영역 세팅
				 * @desc 페이지 내에서 datatable config - columns 세팅 시 사용 값
				 * search: true (검색 기능 사용 유무)
				 * searchType:"select" (검색 종류 [select, date, daterange, text])
				 * searchCd: "REQ00008" (검색 종류가 select인 경우 사용되는 공통 코드 마스터 코드 값)
				 * searchField:"reqProTypeCd" (DB 조회 시 실제 검색 되는 컬럼 명)
				 */
				var searchEvt = {
					init: function(elemId, searchColumns){
						//search div target
						var searchTarget = $(".osl-datatable-search[data-datatable-id="+elemId+"]");
						searchTarget.empty();
						
						if(searchTarget.length > 0){
							//버튼 타이틀 출력 여부
							var btnTitle = "";
							if(!searchTarget.hasClass("osl-datatable-search__btn-title--none")){
								btnTitle = '<span class=""><span>'+$.osl.lang("datatable.search.title")+'</span></span>';
							}
							
							//버튼 style 값
							var btnStyle = searchTarget.data("search-style");
							//기본 값
							var btnStyleStr = "btn-brand";
							
							if(!$.osl.isNull(btnStyle)){
								btnStyleStr = "btn-"+btnStyle;
							}
							
							//div target frame setting
							var searchTargetHtml = 
								//'<div class="form-group">'
									'<div class="input-group">'
										+'<div class="input-group-prepend">'
											+'<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="0">'+$.osl.lang("datatable.search.allTitle")+'</button>'
											+'<div class="dropdown-menu osl-datatable-search__dropdown" data-datatable-id="'+elemId+'">'
												+'<a class="dropdown-item active" href="javascript:void(0);" data-field-id="-1" data-opt-type="all">'+$.osl.lang("datatable.search.allTitle")+'</a>'
											+'</div>'
										+'</div>'
										+'<select class="form-control kt-select2 osl-datatable-search__select" id="searchSelect_'+elemId+'" name="searchSelect" aria-hidden="true" data-datatable-id='+elemId+'>'
										+'</select>'
										+'<div class="kt-input-icon kt-input-icon--right osl-border-radius-none osl-datatable-search__input" data-datatable-id="'+elemId+'">'
											+'<input type="text" class="form-control" aria-label="'+$.osl.lang("datatable.search.placeholder")+'" disabled="disabled" name="searchData_'+elemId+'" id="searchData_'+elemId+'" data-datatable-id="'+elemId+'">'
											+'<span class="kt-input-icon__icon kt-input-icon__icon--right">'
												+'<span><i class="la"></i></span>'
											+'</span>'
											+'<input type="hidden" name="searchStartDt" id="searchStartDt_'+elemId+'" data-datatable-id="'+elemId+'">'
											+'<input type="hidden" name="searchEndDt" id="searchEndDt_'+elemId+'" data-datatable-id="'+elemId+'">'
										+'</div>'
										+'<div class="input-group-append">'
											+'<button class="btn '+btnStyleStr+' osl-datatable-search__button" type="button" data-datatable-id="'+elemId+'">'
												+'<i class="fa fa-search"></i>'+btnTitle
											+'</button>'
										+'</div>'
									//+'</div>'
								+'</div>';
							
							//target append
							searchTarget.html(searchTargetHtml);
							
							//option 목록
							var selectOptList = [];
							
							//검색 변수 세팅
							$.each(searchColumns, function(idx, map){
								var field = map.field;
								
								//검색 대체 필드 ID 있는 경우 교체
								if(map.hasOwnProperty("searchField")){
									field = map.searchField;
								}
								
								//select 처리
								if(map.hasOwnProperty("searchType")){
									if(map.searchType == "select"){
										//common mstCd
										if(!map.hasOwnProperty("searchCd")){
											return true;
										}
										$(".osl-datatable-search__dropdown[data-datatable-id="+elemId+"]").append('<a class="dropdown-item" href="javascript:void(0);" data-field-id="'+field+'" data-opt-type="select" data-opt-mst-cd="'+map.searchCd+'">'+$.osl.escapeHtml(map.title)+'</a>');
									}
									else if(map.searchType == "date"){
										$(".osl-datatable-search__dropdown[data-datatable-id="+elemId+"]").append('<a class="dropdown-item" href="javascript:void(0);" data-field-id="'+field+'" data-opt-type="date">'+$.osl.escapeHtml(map.title)+'</a>');
									}
									else if(map.searchType == "daterange"){
										$(".osl-datatable-search__dropdown[data-datatable-id="+elemId+"]").append('<a class="dropdown-item" href="javascript:void(0);" data-field-id="'+field+'" data-opt-type="daterange">'+$.osl.escapeHtml(map.title)+'</a>');
									}
									else{ //일반 text 입력
										$(".osl-datatable-search__dropdown[data-datatable-id="+elemId+"]").append('<a class="dropdown-item" href="javascript:void(0);" data-field-id="'+field+'" data-opt-type="text">'+$.osl.escapeHtml(map.title)+'</a>');
									}
								}else{ //일반 text 입력
									$(".osl-datatable-search__dropdown[data-datatable-id="+elemId+"]").append('<a class="dropdown-item" href="javascript:void(0);" data-field-id="'+field+'" data-opt-type="text">'+$.osl.escapeHtml(map.title)+'</a>');
								}
							});

							//dropdown append event 
							$(".osl-datatable-search__dropdown[data-datatable-id="+elemId+"] > .dropdown-item").click(function(){
								$(".osl-datatable-search__dropdown[data-datatable-id="+elemId+"] > .dropdown-item.active").removeClass("active");
								$(this).addClass("active");
								$(".osl-datatable-search__dropdown[data-datatable-id="+elemId+"]").siblings("button").text($(this).text());
								var searchFieldId = $(this).data("field-id");
								var searchType = $(this).data("opt-type");
								var searchCd = $(this).data("opt-mst-cd");
								
								searchEvt.inputHandle(elemId, searchFieldId, searchType, searchCd);
							});
						}
						$(".osl-datatable-search__select[data-datatable-id="+elemId+"]").hide();
						$(".osl-datatable-search__input[data-datatable-id="+elemId+"]").show();
					},
					/* 실제 동작 코드 */
					action: {
						"select":function(){
							//사용자 정의함수에 select가 있는 경우 함수 호출
							if(datatables.config.actionFn.hasOwnProperty("select")){
								//해당 datatable select 로직 가져오기
								datatables.config.actionFn["select"](datatables.targetDt[0].id, datatables.targetDt[0], datatables.targetDt);
							}
							//select없는 경우 데이터테이블 기본 조회 동작
							else{
								datatables.targetDt.setDataSourceParam("pagination.page",1);
								datatables.targetDt.reload();
							}
						},
						"select-input":function(targetObj){
							//조회 load 효과
							$(targetObj).addClass("kt-spinner kt-spinner--v2 kt-spinner--sm kt-spinner--brand");
							
							//조회 동작
							searchEvt.action.select();
							
							setTimeout(function(){
								$(targetObj).removeClass("kt-spinner kt-spinner--v2 kt-spinner--sm kt-spinner--brand");
							},300);
						},
						"select-button":function(targetObj){
							//조회 load 효과
							$(targetObj).children("span").hide();
							$(targetObj).addClass("spinner-border spinner-border-sm");
							
							//조회 동작
							searchEvt.action.select();
							
							setTimeout(function(){
								$(targetObj).removeClass("spinner-border spinner-border-sm");
								$(targetObj).children("span").show();
							},300);
						},
						"select-block":function(targetId){
							$.osl.showLoadingBar(true,{target: targetId,message: ""});
							//조회 동작
							searchEvt.action.select();
							
							setTimeout(function(){
								$.osl.showLoadingBar(false,{target: targetId});
							},300);
						},
						/**
						 * 검색 드롭다운 메뉴 변경 시 타입에 따라 input, select 세팅
						 * @param type: [input, select]
						 * @param disabled: 입력 상자 disabled 유무 (select 해당 없음)
						 * @param readonly: 입력 상자 readonly 유무 (select 해당 없음)
						 */
						"layout-clean": function(elemId, type, disabled, readonly, laIcon){
							//select인 경우
							if(type == "select"){
			        			$(".osl-datatable-search__select[data-datatable-id="+elemId+"]~span").removeClass("osl-datatable-search--hide");
								$(".osl-datatable-search__input[data-datatable-id="+elemId+"]").addClass("osl-datatable-search--hide");
								$(".osl-datatable-search__input[data-datatable-id="+elemId+"] > input#searchData_"+elemId+"").attr("disabled",false);
								return true;
							}else{ //default 'input'
								//기본 input 상자 보이기
								$(".osl-datatable-search__select[data-datatable-id="+elemId+"]~span").addClass("osl-datatable-search--hide");
								$(".osl-datatable-search__input[data-datatable-id="+elemId+"]").removeClass("osl-datatable-search--hide");
								
								//input icon 변경
								$(".osl-datatable-search__input[data-datatable-id="+elemId+"] > span i.la").removeClass("la-calendar");
								if(!$.osl.isNull(laIcon)){
									$(".osl-datatable-search__input[data-datatable-id="+elemId+"] > span i.la").addClass(laIcon);
								}
								
							}
							$(".osl-datatable-search__input[data-datatable-id="+elemId+"] > input#searchData_"+elemId+"").attr("disabled",disabled);
							$(".osl-datatable-search__input[data-datatable-id="+elemId+"] > input#searchData_"+elemId+"").attr("readonly",readonly);
						}
					},
					//dropdown 선택시 type에 맞게 select, input ,date, datetime 제어
					inputHandle: function(elemId, searchFieldId, searchType, searchCd){
						//input target
						var searchDataTarget = $(".osl-datatable-search__input[data-datatable-id="+elemId+"] > input#searchData_"+elemId+"[data-datatable-id="+elemId+"]");
						//input clear
						searchDataTarget.val('');
						//datepicker clear
						$.osl.date.datepicker(searchDataTarget,"destroy");
						//daterangepicker clear
						$.osl.date.daterangepicker(searchDataTarget,"destroy");
						//searchStartDt,searchEndDt clear
						$(".osl-datatable-search__input[data-datatable-id="+elemId+"] > input#searchStartDt_"+elemId+"[data-datatable-id="+elemId+"]").val('');
						$(".osl-datatable-search__input[data-datatable-id="+elemId+"] > input#searchEndDt_"+elemId+"[data-datatable-id="+elemId+"]").val('');
						//keypress event off
						searchDataTarget.off('keypress');
						
						if(searchType == "select"){
							//공통코드로 select 세팅하기
							var commonCodeArr = [
								{mstCd: searchCd, useYn: "Y",targetObj: "#searchSelect_"+elemId+"[data-datatable-id="+elemId+"]", comboType:"N"}
							];

			        		//공통코드 채우기
		        			$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
		        			
		        			//select box show
		        			searchEvt.action["layout-clean"](elemId,searchType);
							
							//select2 init
							$("#searchSelect_"+elemId+"[data-datatable-id="+elemId+"]").select2({width: '100%'});
							
							//최초 데이터 로드
							searchEvt.action["select-block"]("#searchSelect_"+elemId+"[data-datatable-id="+elemId+"]+span");
							
							$("#searchSelect_"+elemId+"[data-datatable-id="+elemId+"]").off("select2:select");
							$("#searchSelect_"+elemId+"[data-datatable-id="+elemId+"]").on("select2:select", function(e) {
								searchEvt.action["select-block"]("#searchSelect_"+elemId+"[data-datatable-id="+elemId+"]+span");
							});
						}
						
						else if(searchType == "all"){
							//input 상자 제어
							searchEvt.action["layout-clean"](elemId,searchType,true,false);
							
							//조회 동작
							searchEvt.action["select-input"]($(".osl-datatable-search__input[data-datatable-id="+elemId+"] > span i.la"));
						}
						else if(searchType == "date"){
							//input 상자 제어
							searchEvt.action["layout-clean"](elemId,searchType,false,true,"la-calendar");
							
							//datepicker 세팅
							$.osl.date.datepicker(searchDataTarget, {}, function(defaultConfig, selected){
								var minDate = new Date(selected.date).format("yyyy-MM-dd 00:00:00");
								var maxDate = new Date(selected.date).format("yyyy-MM-dd 23:59:59");
								
								//날짜 범위 입력
								$(".osl-datatable-search__input[data-datatable-id="+elemId+"] > input#searchStartDt_"+elemId+"[data-datatable-id="+elemId+"]").val(minDate);
								$(".osl-datatable-search__input[data-datatable-id="+elemId+"] > input#searchEndDt_"+elemId+"[data-datatable-id="+elemId+"]").val(maxDate);
								
								//조회 동작
								searchEvt.action["select-input"]($(".osl-datatable-search__input[data-datatable-id="+elemId+"] > span i.la"));
							});
							
						}
						else if(searchType == "daterange"){
							//input 상자 제어
							searchEvt.action["layout-clean"](elemId,searchType,false,true,"la-calendar");
							
							//datepicker 세팅
							$.osl.date.daterangepicker(searchDataTarget, {}, function(defaultConfig, start, end, label){
								
								var minDate = new Date(start).format("yyyy-MM-dd 00:00:00");
								var maxDate = new Date(end).format("yyyy-MM-dd 23:59:59");
								
								//날짜 범위 입력
								$(".osl-datatable-search__input[data-datatable-id="+elemId+"] > input#searchStartDt_"+elemId+"[data-datatable-id="+elemId+"]").val(minDate);
								$(".osl-datatable-search__input[data-datatable-id="+elemId+"] > input#searchEndDt_"+elemId+"[data-datatable-id="+elemId+"]").val(maxDate);
								
								//조회 동작
								searchEvt.action["select-input"]($(".osl-datatable-search__input[data-datatable-id="+elemId+"] > span i.la"));
							});
							
						}
						else{
							//input 상자 제어
							searchEvt.action["layout-clean"](elemId,searchType,false,false);
							
							//field id, data
							var fieldId = $(".osl-datatable-search__dropdown[data-datatable-id="+elemId+"] > .dropdown-item.active").data("field-id");
							var fieldData = datatableInfo.getColumnByField(fieldId);
							
							//keyCode 13 enter인경우 기본 검색 동작 안함
							var enterKeyPressFlag = true;
							
							//컬럼에 없는 경우 searchColumns에서 검색
							if($.osl.isNull(fieldData)){
								if(datatableInfo.options.hasOwnProperty("searchColumns") && datatableInfo.options.searchColumns.length > 0){
									$.each(datatableInfo.options.searchColumns, function(idx, map){
										if(fieldId == map.field){
											fieldData = map;
											return false;
										}
									});
								}
							}
							if(!$.osl.isNull(fieldData)){
								//key 이벤트 있는지 체크
								if(fieldData.hasOwnProperty("searchKeyCode") && fieldData.hasOwnProperty("searchKeyEvt")){
									var keyCode = fieldData["searchKeyCode"];
									var keyEvt = fieldData["searchKeyEvt"];
									
									//keyCode null이 아닌경우, 13엔터키인경우 기본 검색 동작 중지
									if(!$.osl.isNull(keyCode) && typeof keyEvt == "function"){
										//Enter인경우 기본 동작 안함
										if(keyCode == 13){
											enterKeyPressFlag = false;
										}
										//input 박스 엔터키 이벤트 걸기
										searchDataTarget.on('keypress', function(e) {
											if (e.which == keyCode){
												var thisObj = $(this);
												var thisObjIcon = thisObj.siblings("span").find("i.la");
												
												keyEvt(e, datatableInfo, searchDataTarget, function(){searchEvt.action["select-input"](thisObjIcon)});
											}
											//-1인경우 모든 키에 반응
											else if(keyCode == -1){
												var thisObj = $(this);
												var thisObjIcon = thisObj.siblings("span").find("i.la");
												
												keyEvt(e, datatableInfo, searchDataTarget, function(){searchEvt.action["select-input"](thisObjIcon)});
											}
										});
									}
								}
							}
							if(enterKeyPressFlag){
								//input 박스 엔터키 이벤트 걸기
								searchDataTarget.on('keypress', function(e) {
									if (e.which === 13){
										var thisObj = $(this);
										var thisObjIcon = thisObj.siblings("span").find("i.la");
										
										//조회 동작
										searchEvt.action["select-input"](thisObjIcon);
									}
								});
							}
						}
					}
				};
				
				var ktDatatableTarget = $("#"+targetId);
				if(ktDatatableTarget.length > 0){
					/* datatable 기본 설정 값 */
					var datatableConfig = {
						data: {
							type: 'remote',
							pageSize: 10,
							serverPaging: true,
							serverFiltering: false,
							serverSorting: true,
							saveState: {webstorage: false}
						},
						layout: {
							scroll: false,
							footer: false
						},
						translate:{
							records:{
								processing: $.osl.lang("datatable.translate.records.processing"),
								noRecords: $.osl.lang("datatable.translate.records.noRecords")
							},
							toolbar:{
								pagination:{
									items:{
										default: {
											  first: $.osl.lang("datatable.translate.toolbar.pagination.items.first"),
											  prev: $.osl.lang("datatable.translate.toolbar.pagination.items.prev"),
											  next: $.osl.lang("datatable.translate.toolbar.pagination.items.next"),
											  last: $.osl.lang("datatable.translate.toolbar.pagination.items.last"),
											  more: $.osl.lang("datatable.translate.toolbar.pagination.items.more"),
											  input: $.osl.lang("datatable.translate.toolbar.pagination.items.input"),
											  select: $.osl.lang("datatable.translate.toolbar.pagination.items.select")
										},
										info: $.osl.lang("datatable.translate.toolbar.pagination.items.info")
									}
								}
							}
						},
						rows:{
							beforeTemplate: function (row, data, index){
								
							},
							clickCheckbox: false,
							minHeight: null
						},
						sortable: true,
						pagination: true,
						search: false,
						columns: [],
						searchColumns: [],
						cardUiTarget: null,
						actionBtn:{
							"autoHide": false,
							"title": "Actions",
							"width": false,
							"lastPush": true,
							"update": true,
							"delete": true,
							"click": false,
							"dblClick": false
						},
						actionFn:{
							"insert":$.noop,
							"update":$.noop,
							"delete":$.noop,
							"click":$.noop,
							"dblClick":$.noop
						},
						actionTooltip:{
							"update": null,
							"delete": null,
							"click": null,
							"dblClick": null
						},
						toolbar:{
							items:{
								pagination:{
									pages:{
										desktop: {
											layout: 'default',
											pagesNumber: 10
										},
										tablet:{
											layout: 'default',
											pagesNumber: 6
										},
										mobile:{
											layout: 'default',
											pagesNumber: 3
										}
									}
								}
							}
						},
						theme: {
							actionBtn:{
								"update": "",
								"delete": "",
								"click": "",
								"dblClick": ""
							},
							actionBtnIcon:{
								"update": "la la-edit",
								"delete": "la la-trash",
								"click": "la la-check-square",
								"dblClick": "la la-external-link"
							}
						},
						callback:{
							/* datatable 호출 완료 후 */
							initComplete: $.noop,
							/* datatable 내부 ajax 호출 성공 시 */
							ajaxDone: $.noop,
							/* datatable reload */
							reloaded: $.noop,
							/* datatable sort*/
							sort: $.noop,
							/* datatable page size change*/
							perpage: $.noop,
							/* datatable page number change*/
							gotoPage: $.noop,
							/* datatable row checked */
							onCheck: $.noop,
							/* datatable row unCheck */
							unCheck: $.noop
						}
					};
					
					/* datatable 세팅 */
					//config 깊은 복사
					var targetConfig = $.extend(true, {}, datatableConfig);
						
					//깊은 복사
					targetConfig = $.extend(true, targetConfig, config, config);

					//afterTemplate 재 정의
					targetConfig.rows["afterTemplate"] = function(row, data, index){
						//row 옵션 가져오기
						if(config.hasOwnProperty("rows")){
							//row minHeight null이 아닌 경우
							if(config.rows.hasOwnProperty("minHeight")){
								var minHeight = config.rows.minHeight;
								
								//number 체크
								if(!$.osl.isNull(minHeight) && $.isNumeric(minHeight)){
									$(row).css({"min-height": parseInt(minHeight)+"px"});
								}
							}
							if(config.rows.hasOwnProperty("clickCheckbox")){
								//row click에 check 변동 true인경우
								if(config.rows.clickCheckbox == true){
									//해당 row에 checkbox가 생성되는 경우 이벤트 적용
									row.click(function(){
										var targetRow = $(this).closest("tr");
										var targetElem = targetRow.find("label.kt-checkbox").children("input[type=checkbox]");
										
										if(targetElem.is(":checked") == true){
											targetElem.prop("checked", false);
											datatables.targetDt.setInactive(targetElem);
											//선택된것처럼 row 컬러가 그대로 남아있으므로
											targetRow.removeClass("osl-datatable__row--selected");
											targetRow.addClass("kt-datatable__row--even");
										}else{
											targetElem.prop("checked", true);
											datatables.targetDt.setActive(targetElem);
										}
										
									});
								}
							}
						}
						
						//사용자 정의 afterTemplate 있는 경우
						if(config.hasOwnProperty("rows") && config.rows.hasOwnProperty("afterTemplate")){
							config.rows.afterTemplate(row, data, index);
						}
						btnEvt["info"](row);
					};
					
					//width 계산
					var actionWidth = 0;
					
					//action 버튼 세팅
					if(targetConfig.hasOwnProperty("actionBtn")){
						var actionBtnStr = '';
						var actionBtnFlag = false;
						/*
						//action 없는경우 사용자 설정 값에 해당 함수 있는지 체크
						if(targetConfig.actionFn.hasOwnProperty(btnAction)){
							$(this).off("click");
							$(this).click(function(event){
								//중복 이벤트 중지
								event.cancelable = true;
								event.stopPropagation();
								event.preventDefault();
								event.returnValue = false;
								
								targetConfig.actionFn[btnAction](btnDatatableId);
							});
						}
						*/
						//actionBtn 제외 버튼
						var ignoreActionBtn = ["autoHide", "title", "width", "lastPush"];
						//actionBtn loop
						$.each(targetConfig.actionBtn, function(actionBtnNm, actionData){
							//해당 버튼이 true인경우
							if(actionData === true && ignoreActionBtn.indexOf(actionBtnNm) == -1){
								//theme와 tooltip에서 데이터 가져오기
								actionBtnFlag = true;
								actionWidth += 40;
								
								//action 추가 class
								var actionClass = "";
								if(!$.osl.isNull(targetConfig.theme.actionBtn[actionBtnNm])){
									actionClass = "btn-"+$.osl.escapeHtml(targetConfig.theme.actionBtn[actionBtnNm]);
								}
								
								//action button tooltip
								var actionTooltip = "";
								if(!$.osl.isNull(targetConfig.actionTooltip[actionBtnNm])){
									actionTooltip = ' data-toggle="kt-tooltip" title="'+targetConfig.actionTooltip[actionBtnNm]+'" data-placement="top"';
								}
								
								actionBtnStr += '<a href="javascript:void(0);" class="btn btn-clean btn-icon '+actionClass+'" data-datatable-id="'+targetId+'" data-datatable-action="'+actionBtnNm+'"'+actionTooltip+'><i class="'+targetConfig.theme.actionBtnIcon[actionBtnNm]+'"></i></a>';
							}
						});
					}
					//action btn있는 경우 컬럼에 추가
					if(actionBtnFlag){
						//action column title
						var actionBtnTitle = targetConfig.actionBtn.title;
						//텍스트가 아닌 경우 기본 값으로
						if(typeof actionBtnTitle != "string"){
							actionBtnTitle = "Actions";
						}
						
						//actoin column width
						var actionBtnWidth = targetConfig.actionBtn.width;
						if(actionBtnWidth != null && actionBtnWidth === false){
							actionBtnWidth = actionWidth;
						}
						
						var addJson = {
								field: 'actions',
			                    width: actionBtnWidth,
			                    title: actionBtnTitle,
			                    sortable: false,
			                    textAlign: 'center',
			                    overflow: 'visible',
			                    autoHide: targetConfig.actionBtn.autoHide,
			                    template: function (row) {
			                    	return actionBtnStr;
			                    }
							};
						
						//맨 마지막 컬럼 추가
						if(targetConfig.actionBtn["lastPush"]){
							targetConfig.columns.push(addJson);
						}
						//맨 앞 컬럼 추가
						else{
							targetConfig.columns.unshift(addJson);
						}
					}
					
					//search Columns
					var searchColumns = [];
					//추가된 컬럼 필드 ID (중복 방지)
					var searchAddList = [];
					
					//컬럼 XSS 공격 막기 + search 대상 컬럼 찾기 + onclick
					$.each(targetConfig.columns, function(idx, map){
						//기존 template 선언 없는 경우 제어
						if(!map.hasOwnProperty("template")){
							var fieldId = map.field;
							
							map.template = function(row){
								return $.osl.escapeHtml(row[fieldId]);
							}
						}
						
						//언어팩 적용
						var fieldLangTitle = $.osl.lang("datatable."+targetId+"."+map.field);
						if(!$.osl.isNull(fieldLangTitle)){
							map.title = fieldLangTitle;
						}
						
						//search 찾기
						if(map.hasOwnProperty("search")){
							if(map.search){
								searchColumns.push(map);
								searchAddList.push(map.field);
							}
						}
					});
					
					//추가 검색 필드
					if(targetConfig.searchColumns.length > 0){
						$.each(targetConfig.searchColumns, function(idx, map){
							//기존 추가된 필드가 아닌경우에만 추가
							if(searchAddList.indexOf(map.field) == -1){
								//언어팩 적용
								var fieldLangTitle = $.osl.lang("datatable."+targetId+"."+map.field);
								if(!$.osl.isNull(fieldLangTitle)){
									map.title = fieldLangTitle;
								}
								
								//ord값 있는 경우 해당 ord에 추가
								if(map.hasOwnProperty("searchOrd")){
									var searchOrd = map.searchOrd;
									//ord가 이미 추가된 검색 필드 수보다 큰 경우 그냥 push
									if(searchOrd < 0 && searchOrd >= searchColumns.length){
										searchColumns.push(map);
									}else{
										//해당 인덱스 위치에 추가
										searchColumns.splice(searchOrd,0,map);
									}
									
								}else{
									searchColumns.push(map);
								}
							}
						});
					}
					
					//data type이 local이 아닌경우
					if(targetConfig.data.type != 'local'){
						//검색 내용 파라미터 전달
						targetConfig = $.extend(true, targetConfig, {
							data:{
								source:{
									read:{
										params: {
											//프로젝트 그룹, 프로젝트, 권한그룹 기본 정보
											dtParamPrjGrpId: $.osl.selPrjGrpId,
											dtParamPrjId: $.osl.selPrjId,
											dtParamAuthGrpId: $.osl.selAuthGrpId,
											
											//검색 대상 Id
											searchTargetId: function(){
												return $(".osl-datatable-search__dropdown[data-datatable-id="+targetId+"] > .dropdown-item.active").data("field-id");
											},
											//검색 대상 타입
											searchTargetType: function(){
												return $(".osl-datatable-search__dropdown[data-datatable-id="+targetId+"] > .dropdown-item.active").data("opt-type");
											},
											
											//검색 입력 데이터
											searchTargetData: function(){
												var searchTargetType = $(".osl-datatable-search__dropdown[data-datatable-id="+targetId+"] > .dropdown-item.active").data("opt-type");
												var searchTargetData;
												if(searchTargetType == "select"){
													searchTargetData = $(".osl-datatable-search__select[data-datatable-id="+targetId+"]").val();
												}
												else if(searchTargetType == "all"){ //전체 검색
													searchTargetData = null;
												}
												else{
													searchTargetData = $(".osl-datatable-search__input[data-datatable-id="+targetId+"] > input#searchData_"+targetId).val();
												}
												
												return searchTargetData;
											},
											//기간 데이터 시작일
											searchStartDt: function(){
												return $(".osl-datatable-search__input[data-datatable-id="+targetId+"] > input#searchStartDt_"+targetId+"").val();
											},
											//기간 데이터 종료일
											searchEndDt: function(){
												return $(".osl-datatable-search__input[data-datatable-id="+targetId+"] > input#searchEndDt_"+targetId+"").val();
											}
										}
									}
								}
							}
						});
					}

					//search 세팅함수 호출
					if(searchColumns.length > 0){
						searchEvt.init(targetId, searchColumns);
						//검색 버튼 클릭 이벤트 걸기
						$(".osl-datatable-search__button[data-datatable-id="+targetId+"]").click(function(){
							var thisObj = $(this);
							var thisObjIcon = thisObj.children("span");
							
							//조회 동작 
							searchEvt.action["select-button"](thisObjIcon);
						});
					}
				
					//datatable 생성
					var datatableInfo = $(ktDatatableTarget).KTDatatable(targetConfig);
					
					//type: remote - ajax complete
					$(ktDatatableTarget).on("kt-datatable--on-ajax-done",function(evt,list){
						//사용자 함수 실행
						targetConfig.callback.ajaxDone(evt.target, list, datatableInfo);
						
						//카드 UI 대상 있는 경우 해당 UI제어 동작
						if(!$.osl.isNull(targetConfig.cardUiTarget)){
							var targetUIs = targetConfig.cardUiTarget;
							if(targetUIs.length > 0){
								//loop돌면서 대상 UI에 모든 동작 적용 - (단일 UI대상이 아닌경우 속도 저하 우려 있음)
								$.each(targetUIs, function(idx, targetUI){
									//dropdown item list
									var dropdownItems = $(targetUI).find(".dropdown-item[data-datatable-id="+targetId+"][data-datatable-expans=dropdown]");
									$.each(dropdownItems, function(itemIdx, item){
										//대상 action타입 가져오기
										var btnAction = $(this).data("datatable-action");
										
										//대상 rownum 가져오기
										var rownum = $(this).data("datatable-rownum");
										
										//rownum 값이 없는경우 dropdown-menu에서 찾음
										if($.osl.isNull(rownum)){
											rownum = $(this).parent(".dropdown-menu").data("datatable-rownum");
										}
										
										//부모에서 rownum 값이 없는경우 상위에서 datatable-rownum 찾음
										if($.osl.isNull(rownum)){
											rownum = $(this).parents("[data-datatable-rownum]").data("datatable-rownum");
										}
										
										//그래도 없으면 동작 중지
										if($.osl.isNull(rownum)){
											return true;
										}
										
										//action이 있는경우
										if(!$.osl.isNull(btnAction)){
											//action별 동작 호출
											if(btnEvt.action.hasOwnProperty(btnAction)){
												var rowData = datatables.targetDt.dataSet[rownum];
												btnEvt.action[btnAction](this, targetId, "info", rownum, false);
											}else{
												//action 없는경우 사용자 설정 값에 해당 함수 있는지 체크
												if(targetConfig.actionFn.hasOwnProperty(btnAction)){
													$(this).off("click");
													$(this).click(function(event){
														//중복 이벤트 중지
														event.cancelable = true;
														event.stopPropagation();
														event.preventDefault();
														event.returnValue = false;
														
														var rowData = datatables.targetDt.dataSet[rownum];
														var rowDatas = [];
														rowDatas.push(rowData);
														
														targetConfig.actionFn[btnAction](rowDatas, targetId, "info", this);
													});
												}
											}
										}
									});
									
									//체크박스 제어
									$(targetUI).find("input[type=checkbox][data-datatable-id="+targetId+"]").click(function(){
										var rowNum = this.value;
										var targetRow = datatableInfo.row("[data-row="+rowNum+"]").nodes();
										
										var targetElem = targetRow.find("label.kt-checkbox").children("input[type=checkbox]");
										
										if(targetElem.length > 0){
											if(targetElem.is(":checked") == true){
												targetElem.prop("checked", false);
												datatableInfo.setInactive(targetElem);
												//선택된것처럼 row 컬러가 그대로 남아있으므로
												targetRow.removeClass("osl-datatable__row--selected");
												targetRow.addClass("kt-datatable__row--even");
											}else{
												targetElem.prop("checked", true);
												datatableInfo.setActive(targetElem);
											}
										}
									});
									
									//tooltip 적용
									$(targetUI).find('[data-toggle="kt-tooltip"]').each(function() {
							            KTApp.initTooltip($(this));
							        });
									
									// .osl-datatable__card에 onclick 이벤트 걸기
									$(targetUI).find(".osl-datatable__card").click(function(){
										var rowNum = $(this).data("datatable-rownum");
										var rowData = datatables.targetDt.dataSet[rowNum];
										targetConfig.actionFn["click"](rowData, targetId, "card", rowNum, this);
									});
									
								});
							}
						}
					});
					
					//datatable init
					$(ktDatatableTarget).on("kt-datatable--on-init",function(evt,config){
						targetConfig.callback.initComplete(evt.target, config, datatableInfo);
						
						//카드형 UI 대상이 있는 경우 체크박스 제어하기
						if(!$.osl.isNull(targetConfig.cardUiTarget)){
							//datatable checkbox에 이벤트 걸기
							var datatableBody = datatableInfo.tableBody;
							var datatableChkbox = $(datatableBody).find("label.kt-checkbox").children("input[type=checkbox]");
							
							//체크박스가 있는경우
							if(datatableChkbox.length > 0){
								datatableChkbox.change(function(){
									var rowNum = $(this).parents("tr.kt-datatable__row").data("row");
									var targetElem = targetConfig.cardUiTarget.find("input[type=checkbox][data-datatable-id="+targetId+"][value="+rowNum+"]");
									if(targetElem.length > 0){
										if(targetElem.is(":checked") == true){
											targetElem.prop("checked", false);
										}else{
											targetElem.prop("checked", true);
										}
									}
								});
							}
							
							//datatable all-check에 이벤트 걸기
							var datatableHead = datatableInfo.tableHead;
							var datatableChkbox = $(datatableHead).find("label.kt-checkbox.kt-checkbox--all").children("input[type=checkbox]");
							
							datatableChkbox.change(function(){
								var rowNum = $(this).parents("tr.kt-datatable__row").data("row");
								var targetElem = targetConfig.cardUiTarget.find("input[type=checkbox][data-datatable-id="+targetId+"]");
								
								if(targetElem.length > 0){
									if($(this).is(":checked") == true){
										targetElem.prop("checked", true);
									}else{
										targetElem.prop("checked", false);
									}
								}
							});
						}
					});
					
					//datatable reload
					$(ktDatatableTarget).on("kt-datatable--on-reloaded",function(evt,config){
						targetConfig.callback.reloaded(evt.target, config, datatableInfo);
					});
					
					//페이지 내 레코드 수 변경 이벤트
					$(ktDatatableTarget).on("kt-datatable--on-update-perpage",function(evt,args){
						targetConfig.callback.perpage(evt.target, args, datatableInfo);
					});
					
					//페이지 강제 이동 이벤트
					$(ktDatatableTarget).on("kt-datatable--on-goto-page",function(evt,args){
						targetConfig.callback.gotoPage(evt.target, args, datatableInfo);
					});
					
					//데이터 체크박스 체크 이벤트
					$(ktDatatableTarget).on("kt-datatable--on-check",function(evt,ids){
						targetConfig.callback.onCheck(evt.target, ids, datatableInfo);
					});
					//데이터 체크박스 체크해제 이벤트
					$(ktDatatableTarget).on("kt-datatable--on-uncheck",function(evt,ids){
						targetConfig.callback.unCheck(evt.target, ids, datatableInfo);
					});
					
					//datatable column sort
					$(ktDatatableTarget).on("kt-datatable--on-sort",function(evt,data){
						//필드ID 검증
						if($.osl.isNull(datatableInfo.getColumnByField(data.field))){
							$.osl.alert($.osl.lang("datatable.sort.fieldNotMatch"));
						}else{
							/* 
							 * sort 해당 컬럼에 sortField 있는지 체크, 있다면 대체
							 * sort정보 데이터 테이블 파라미터에 대입 
							 * 페이지 재 조회
							 * */
							var field = data.field;
							var columnTarget = datatableInfo.getColumnByField(data.field);
							if(columnTarget.hasOwnProperty("sortField")){
								field = columnTarget.sortField;
							}
							datatableInfo.setDataSourceParam("sortFieldId",field);
							datatableInfo.setDataSourceParam("sortDirection",data.sort);
							
							//데이터 테이블 재 조회
							datatableInfo.reload();
							
							//테이블 정렬 callback 실행
							targetConfig.callback.sort(evt.target, data, datatableInfo);
						}
					});
					
					//레이아웃 업데이트시 (화면 비율 변경) 이벤트
					$(ktDatatableTarget).on("kt-datatable--on-layout-updated",function(evt,config){
						//컬럼 이벤트 대입
						$.each(targetConfig.columns, function(idx, map){
							//onclick
							if(map.hasOwnProperty("onclick")){
								var targetObj = $("#"+targetId+" td.kt-datatable__cell[data-field="+map.field+"]");
								
								//click event 대입
								targetObj.off("click");
								targetObj.click(function(event){
									//함수일때만 실행
									if(typeof map.onclick == "function"){
										//중복 이벤트 중지
										event.cancelable = true;
										event.stopPropagation();
										event.preventDefault();
										event.returnValue = false;
										
										//로우 데이터 조회
										var rowNum = $(this).parent("tr").data("row");
										var rowData = null;
										try{
											rowData = datatableInfo.getDataSet()[rowNum];
										}catch(e){
											//error skip
											console.log(e);
										}
										
										//설정에 걸려있는 onclick 이벤트 실행
										map.onclick(rowData, event);
									}
								});
							}
						});
						//카드형 UI 대상이 있는 경우 체크박스 제어하기
						if(!$.osl.isNull(targetConfig.cardUiTarget)){
							var targetElem = targetConfig.cardUiTarget.find("input[type=checkbox]:checked");
							
							//체크 해제
							$.each(targetElem, function(idx, map){
								map.checked = false;
							});
						}
					});
					
					//전체 버튼 이벤트 대입
					btnEvt.list();
					datatables = {"config": targetConfig, "targetDt": datatableInfo};
					
					//생성된 데이터 저장
					$.osl.datatable.list[targetId] = datatables;
				}
				
				return datatables;
			}
		}
		,date: {
			/**
			 *  function 명 	: $.osl.date.init
			 *  function 설명	: datepicker, datetimepicker 언어 처리
			 **/
			init: function(){
				//datepicker 언어 처리
				$.fn.datepicker.dates['ko'] = $.osl.lang("date.datepicker");
				
				moment.updateLocale('fr', $.osl.lang("date.moment"));
			}
			/**
			 *  function 명 	: $.osl.date.datepicker
			 *  function 설명	: 타겟 오브젝트에 datepicker 세팅
			 *  @param targetObj : datepicker 대상 오브젝트
			 *  @param config : datepicker 설정 값 (String == 'destroy'인 경우 해당 datepicker 제거)
			 *  		예) $.osl.date.datepicker($(".osl-datatable-search__input > input#searchData"),"destroy")
			 *  @param callback: 일자 선택시 반환 함수
			 **/
			,datepicker: function(targetObj, config, callback){
				//target elem 있는 경우
				if($.osl.isNull($(targetObj)) || $(targetObj).length == 0){
					return true;
				}
				//callback 함수가 아닌 경우 빈 함수 대입
				if(typeof callback != "function"){
					callback = $.noop;
				}
				
				//해당 elem datepicker 제거
				if(typeof config == "string" && config == "destroy"){
					$(targetObj).datepicker('destroy');
				}else{
					var defaultConfig = {
							rtl: KTUtil.isRTL(),
							format: "yyyy-mm-dd",
							todayHighlight: true,
							orientation: "bottom left",
							language: 'ko',
							maxViewMode: 2,
							autoclose: true,
							templates:{
								leftArrow: '<i class="la la-angle-left"></i>',
								rightArrow: '<i class="la la-angle-right"></i>'
							}
					};
					
					//사용자 입력 config extend
					defaultConfig = $.extend(true, defaultConfig, config);
					
					//datepicker
					$(targetObj).datepicker(defaultConfig).on('changeDate', function (selected) {
						callback(defaultConfig, selected);
					});
				}
			}
			/**
			 *  function 명 	: $.osl.date.daterangepicker
			 *  function 설명	: 타겟 오브젝트에 daterangepicker 세팅
			 *  @param targetObj : daterangepicker 대상 오브젝트
			 *  @param config : daterangepicker 설정 값 (String == 'destroy'인 경우 해당 daterangepicker 제거)
			 *  		예) $.osl.date.daterangepicker($(".osl-datatable-search__input > input#searchData"),"destroy")
			 *  @param callback: 일시 선택시 반환 함수
			 **/
			,daterangepicker: function(targetObj, config, callback){
				var datePickerObj = null;
				//target elem 있는 경우
				if($.osl.isNull($(targetObj)) || $(targetObj).length == 0){
					return true;
				}
				//callback 함수가 아닌 경우 빈 함수 대입
				if(typeof callback != "function"){
					callback = $.noop;
				}
				
				//해당 elem datepicker 제거
				if(typeof config == "string" && config == "destroy"){
					//선언된 객체 존재하는 경우 제거
					if(!$.osl.isNull($(targetObj).data('daterangepicker'))){
						$(targetObj).data('daterangepicker').remove();
					}
				}else{
					var minYear = moment().subtract(10, 'year').format('YYYY');
					var maxYear = moment().subtract(-10, 'year').format('YYYY');
					
					var defaultConfig = {
				            buttonClasses: 'btn btn-sm',
				            applyClass: "btn-primary",
				            cancelClass: "btn-secondary",
							autoApply: true,
							showDropdowns: true,
							todayHighlight: false,
							minYear : parseInt(minYear),
							maxYear : parseInt(maxYear),
				        };
					
					//사용자 입력 config extend
					defaultConfig = $.extend(true, defaultConfig, config);
					
					//datepicker
					datePickerObj = $(targetObj).daterangepicker(defaultConfig,
						function(start, end, label) {
							callback(defaultConfig, start, end, label);
						}
					);
				}
				return datePickerObj;
			}
		}
		
		/**
		 *  function 명 	: $.osl.user
		 *  function 설명	: 사용자 처리 기본 생성자 함수
		 **/
		,user: {
			/* 사용자 정보 */
			userInfo:{}
			/* 사용자 설정 값 데이터 */
			,usrOptData:{}
			/**
			 *  function 명 	: $.osl.user.logout
			 *  function 설명	: 로그아웃 처리
			 * @param cookieName 쿠키이름
			 */
			,logout: function(){
				$.osl.confirm($.osl.lang("common.logout.confirm"),{"confirmButtonText": $.osl.lang("common.logout.button")},function(result) {
			        if (result.value) {
			        	// 로그인 시 생성한 비밀번호 만료 쿠키 삭제
			        	$.osl.user.deleteCookie("pwExpire");
						$(location).attr('href',"/cmm/cmm4000/cmm4000/selectCmm4000Logout.do");
			        }
			    });
			}
			/**
			 *  function 명 	: $.osl.user.deleteCookie
			 *  function 설명	: 비밀번호 만료일 alert이 로그인 시 한번만 나타나게 하기위해 생성한 쿠키를 삭제
			 * @param cookieName 쿠키이름
			 */
			,deleteCookie: function(cookieName){
				var expireDate = new Date();
				  
			  	//어제 날짜를 쿠키 소멸 날짜로 설정
				expireDate.setDate( expireDate.getDate() - 1 );
				document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
			}
			/**
			 *  function 명 	: $.osl.user.pwChangeDay
			 *  function 설명	: 사용자 비밀번호 만료일 체크
			 * @param pwlimitDay 비밀번호 만료일
			 */
			,pwChangeDay: function(pwExpireDay){
				// 비밀번호 만료일 쿠키가 없을경우 
				if( $.osl.user.isCookie("pwExpire") == false ){
				
					if( !$.osl.isNull(pwExpireDay) ){
						
						$.osl.alert($.osl.lang("common.alert.title"),$.osl.lang("common.user.pwChange", pwExpireDay),"warning", function(result){
							// 비밀번호 만료일 alert이 로그인 시 한번만 나타나게 하기위한 쿠키를 생성
							$.osl.user.setCookie("pwExpire", "expire"); 
						});
					}	
				}
			}
			/**
			 *  function 명 	: $.osl.user.isCookie
			 *  function 설명	:   쿠키의 유무 체크
			 * @param cookieName 쿠키이름
			 */
			,isCookie: function(cookieName) {
				cookieName = cookieName + '=';
				var cookieData = document.cookie;
				var cIdx = cookieData.indexOf(cookieName);
				var exist = false;	
				
				if(cIdx != -1 ){
					exist = true;	
				}
				return exist;
			}
			/**
			 *  function 명 	: $.osl.user.setCookie
			 *  function 설명	:  비밀번호 만료일 alert이 로그인 시 한번만 나타나게 하기위한 쿠키를 생성한다.
			 * @param cookieName 쿠키이름
			 * @param cookieValue 쿠키값
			 */
			,setCookie: function(cookieName, cookieValue) {   
				var cDate = new Date();
				cDate.setTime(cDate.getTime() + 1000*60*60*1); // 만료시간 1시간
				document.cookie = cookieName + "=" + cookieValue + "; path=/; expires=" + cDate.toGMTString() + ";";
			}
			/**
			 *  function 명 	: $.osl.user.usrOptChg
			 *  function 설명	: 사용자 설정 값 변경 시 즉시 적용 함수
			 * @param 사용자 설정 값
			 */
			,usrOptChg: function(thisTarget){
				//선택 값
				var usrOptCd = thisTarget.value;
				
				//설정 코드 값
				var usrOptMstCd = $(thisTarget).data("mst-cd");
				
				var paramData = {"usrOptCd": usrOptCd, "usrOptMstCd": usrOptMstCd};
				
				//AJAX 설정
				var ajaxObj = new $.osl.ajaxRequestAction(
						{"url":"/stm/stm3000/stm3001/saveStm3001UsrOptInfo.do", "loadingShow":true}
						,paramData);
				
				//AJAX 전송 성공 함수
				ajaxObj.setFnSuccess(function(data){
					
		        	if( data.errorYn == "N" ){
		        		//변경 값 적용
						$("#usrOpt_"+usrOptMstCd).data("osl-value",usrOptCd);
						
		        		//영역 초기화
						$.osl.initHeaderClear();
		        		//헤더 다시 불러오기
						$.osl.initHeader();
		        		
		        	}
		        	
		        	$.osl.toastr(data.message);
		        	
				});
				
				//AJAX 전송
				ajaxObj.send();
			}
			/**
			 *  function 명 	: $.osl.user.usrOptLangChg
			 *  function 설명	: 사용자 언어 코드 설정
			 * @param 언어코드 Element 대상
			 */
			,usrOptLangChg: function(thisTarget){
				//선택 값
				var usrOptCd = $(thisTarget).attr("value");
				
				//설정 코드 값
				var usrOptMstCd = $(thisTarget).data("mst-cd");
				var subCd = $(thisTarget).data("sub-cd");
				var subCdRef1 = $(thisTarget).data("sub-cd-ref1");
				var subCdRef2 = $(thisTarget).data("sub-cd-ref2");
				
				var paramData = {"usrOptCd": usrOptCd, "usrOptMstCd": usrOptMstCd};
				
				//AJAX 설정
				var ajaxObj = new $.osl.ajaxRequestAction(
						{"url":"/stm/stm3000/stm3001/saveStm3001UsrOptInfo.do", "loadingShow":true}
						,paramData);
				
				//AJAX 전송 성공 함수
				ajaxObj.setFnSuccess(function(data){
					
					if( data.errorYn == "N" ){
						//화면 리로드
						location.reload();
						/*
						//변경 값 적용
						$("#usrCurrentLangCd > img").attr("src","/media/flags/"+subCdRef2);
						$(thisTarget).children(".kt-nav__link-text").text(subCdRef1);
						
						//언어 코드 수정
						$.osl.langCd = subCd;
						
						//active 수정
						$("#usrLangCdList .kt-nav__item.active").removeClass("active");
						$(thisTarget).parent(".kt-nav__item").addClass("active");
						
						//영역 초기화
						$.osl.initHeaderClear();
						//헤더 다시 불러오기
						$.osl.initHeader();
						*/
					}
					
					$.osl.toastr(data.message);
					
				});
				
				//AJAX 전송
				ajaxObj.send();
			}
			/**
			 *  function 명 	: $.osl.user.usrImgSet
			 *  function 설명	: 사용자 프로필 이미지와 사용자명을 세팅해서 반환한다.
			 * @param paramUsrImgId 사용자 프로필 이미지 ID
			 * @param paramData 사용자 명 또는 Json Object
			 * 			json Object인경우
			 * 			html: 사용자 이미지 우측에 출력하려는 내용 (화면에서 변수 넘길 시 $.osl.escapeHtml 처리 필수)
			 * 			imgSize: 사용자 이미지 사이즈 (sm, md, lg, xl) - sm 기본
			 * 			class:{
			 * 				cardBtn: 최 상위 요소 class
			 * 				cardPic: 사용자 이미지 상위 요소 class
			 * 				usrImg: 사용자 이미지 class
			 * 				cardDetail: 사용자 이미지 우측 내용 상위 요소 class
			 * 				cardName: 우측 내용 class
			 * 			}
			 * 
			 * 예제)
			 * 	var paramData =	{
			 * 		html: row.usrNm,
			 * 		imgSize: md,
			 * 		class: {
			 * 			cardBtn: "",
			 * 			cardPic: "",
			 * 			usrImg: "",
			 * 			cardDetail: "",
			 * 			cardName: ""
			 * 		}
			 * 	}
			 */
			,usrImgSet: function(paramUsrImgId, paramData){
				var usrImgId = $.osl.user.usrImgUrlVal(paramUsrImgId);
				
				var cardContent = $.osl.escapeHtml(paramData);
				var imgSize = "kt-media--sm";
				
				//css
				var cardBtn = ""
					, cardPic = ""
					, usrImg = ""
					, cardDetail = ""
					, cardName = "";
				
				//json object인 경우
				if(typeof paramData == "object"){
					cardContent = paramData["html"];
					imgSize = "kt-media--"+$.osl.escapeHtml(paramData["imgSize"]);
					//imgSize가 md인경우 공백
					if(paramData["imgSize"] == "md"){
						imgSize = "";
					}
					
					//각 요소 class
					if(paramData.hasOwnProperty("class")){
						cardBtn = $.osl.escapeHtml(paramData["class"]["cardBtn"]);
						cardPic = $.osl.escapeHtml(paramData["class"]["cardPic"]);
						usrImg = $.osl.escapeHtml(paramData["class"]["usrImg"]);
						cardDetail = $.osl.escapeHtml(paramData["class"]["cardDetail"]);
						cardName = $.osl.escapeHtml(paramData["class"]["cardName"]);
					}
				}
				
				var returnStr = 
					'<div class="kt-user-card-v2 btn '+cardBtn+'">'
						+'<div class="kt-user-card-v2__pic kt-media '+imgSize+' kt-media--circle '+cardPic+'">'
							+'<img class=" '+usrImg+'" src="'+usrImgId+'" onerror="this.src=\'/media/users/default.jpg\'"/>'
						+'</div>'
						+'<div class="kt-user-card-v2__details '+cardDetail+'">'
							+'<span class="kt-user-card-v2__name '+cardName+'">'+cardContent+'</span>'
						+'</div>'
					+'</div>';
				
				//cardContent 없는경우 
				if($.osl.isNull(cardContent) || cardContent.replace(/(\s*)/g, "") == ""){
					returnStr = "";
				}
				
				return returnStr;
			}
			/**
			 *  function 명 	: $.osl.user.usrImgUrlVal
			 *  function 설명	: 사용자 프로필 이미지 Url 세팅
			 * @param paramUsrImgId 사용자 프로필 이미지 ID
			 */
			,usrImgUrlVal: function(paramUsrImgId){
				var usrImgId = '/cmm/fms/getImage.do?fileSn=0&atchFileId='+paramUsrImgId;
				if($.osl.isNull(paramUsrImgId)){
					usrImgId = '/media/users/default.jpg';
				}
				
				return usrImgId;
			}
			/**
			 *  function 명 	: $.osl.user.usrInfoPopup
			 *  function 설명	: 사용자 정보 팝업
			 * @param paramUsrId 사용자 ID
			 */
			,usrInfoPopup: function(paramUsrId){
				if(!$.osl.isNull(paramUsrId) && paramUsrId.replace(/(\s*)/g, "") != ""){
					var data = {paramUsrId: paramUsrId};
					var options = {
							autoHeight: false,
							modalSize: "lg",
							modalTitle: "사용자 정보",
							keyboard: true,
							closeConfirm: false,
							class:{
								body:"osl-padding-none"
							}
					
					};
					$.osl.layerPopupOpen('/cmm/cmm8000/cmm8000/selectCmm8000View.do',data,options);
				}
			}
			/**
			 *  function 명 	: $.osl.user.passwordValidate
			 *  function 설명	: 사용자가 입력한 비밀번호 유효성 체크
			 *  			  1. 비밀번호에 사용자 아이디 포함되었는지 체크
			 *  			  2. 비밀번호에 같은 문자가 3자 이상 연속해서 사용되었는지 체크
			 *  			  3. 비밀번호에 연속된 문자열(123, abc 등)이 3자 이상 포함되어있는지 체크
			 * @param inUsrId 입력한 사용자 ID
			 * @param inUsrPw 입력한 사용자 비밀번호
			 */
			,passwordValidate: function(inUsrId, inUsrPw){
				
				if($.osl.isNull(inUsrId)){
					$.osl.alert($.osl.lang("common.user.validate.usrId"), {type:"warning"});
					return true;
				}
				
				if($.osl.isNull(inUsrPw)){
					$.osl.alert($.osl.lang("common.user.validate.usrPw"), {type:"warning"});
					return true;
				}
				
				// 비밀번호에 사용자 아이디가 포함되어있는지 체크
				if(inUsrPw.indexOf(inUsrId) > -1) {
					$.osl.alert($.osl.lang("common.user.validate.usrPwIndexOfUsrId"), {type:"warning"});
					return true;
				}
				
				// 같은 문자열 반복 체크
				var repetRegx = /(\w)\1\1/;
				if(repetRegx.test(inUsrPw)) {
					$.osl.alert($.osl.lang("common.user.validate.usrPwContinue"), {type:"warning"});
					return true;
				}
				
				// 문자열 연속성 체크 - 123, 321, abc, cba
				var continueMatchNum = 3;
				if(!$.osl.continueStrChk(inUsrPw, continueMatchNum)){
					$.osl.alert($.osl.lang("common.user.validate.usrPwContinueMatch",continueMatchNum), {type:"warning"});
					return true;
				}
				
				return false;
			}
			/**
			 *  function 명 	: $.usrMyPagePopUp
			 *  function 설명	: 사용자 개인정보 수정 팝업을 오픈한다.
			 * @param usrId : 로그인한 사용자 아이디
			 */
			,usrMyPagePopUp:function(usrId){
				
				// 마이페이지 팝업 오픈시 사용자 아이디 없을경우
				if($.osl.isNull(usrId)){
					$.osl.alert($.osl.lang("common.user.myPage.error"), {type:"error"});
					return false;
				}
				
				var data = {"usrId":usrId};
				var options = {
						idKey: "prs3000",
						modalSize: 'xl',
						modalTitle: $.osl.lang("common.user.myPage.title"),
						closeConfirm: false
					};
				
				$.osl.layerPopupOpen('/usr/usr1000/usr1000/selectUsr1000View.do',data,options);
			}
		}
		/**
		 *  function 명 	: $.osl.goMenu
		 *  function 설명	: 상단 메뉴 클릭시 메뉴페이지 이동
		 * @param menuUrl 메뉴 URL
		 * @param menuId 메뉴 ID
		 * @param menuNm 메뉴명
		 * @param menuTypeCd 메뉴 이동 타입
		 */
		,goMenu: function(menuUrl, menuId, menuNm, menuTypeCd){
			if(menuTypeCd != null && menuTypeCd != "" && menuTypeCd == "03"){
				var popupWidth = window.screen.availWidth;
				var popupHeight = window.screen.availHeight;
				window.open(menuUrl,menuNm ,'width='+popupWidth+', height='+(popupHeight-100)+', menubar=no, status=no, toolbar=no, location=no, scrollbars =yes');
			}else{
				document.hideMoveForm.menuUrl.value = menuUrl;
				document.hideMoveForm.menuId.value = menuId;
				document.hideMoveForm.menuNm.value = menuNm;
				document.hideMoveForm.action= "/cmm/cmm9000/cmm9000/selectCmm9000MenuChgView.do";
				document.hideMoveForm.submit();
			}
		}
		/**
		 * function 명 	: $.osl.goPrjGrp
		 * function 설명	: 프로젝트 그룹 선택 시 페이지 이동
		 * @param prjGrpId 프로젝트 그룹 Id
		 */
		,goPrjGrp: function(prjGrpId){
			document.hideMoveForm.moveType.value = "01";
			document.hideMoveForm.prjGrpId.value = prjGrpId;
			document.hideMoveForm.action= "/cmm/cmm9000/cmm9000/selectCmm9000PageChgView.do";
			document.hideMoveForm.submit();
		}
		/**
		 * function 명 	: $.osl.goPrj
		 * function 설명	: 프로젝트 선택 시 페이지 이동
		 * @param prjGrpId 프로젝트 그룹 Id
		 * @param prjId 프로젝트 Id
		 */
		,goPrj: function(prjGrpId, prjId){
			document.hideMoveForm.moveType.value = "02";
			document.hideMoveForm.prjGrpId.value = prjGrpId;
			document.hideMoveForm.prjId.value = prjId;
			document.hideMoveForm.action= "/cmm/cmm9000/cmm9000/selectCmm9000PageChgView.do";
			document.hideMoveForm.submit();
		}
		/**
		 * function 명 	: $.osl.goAuthGrp
		 * function 설명	: 권한그룹 선택 시 페이지 이동
		 * @param prjGrpId 프로젝트 그룹 Id
		 * @param prjId 프로젝트 Id
		 * @param authGrpId 권한 그룹 Id
		 */
		,goAuthGrp: function(prjGrpId, prjId, authGrpId){
			document.hideMoveForm.moveType.value = "03";
			document.hideMoveForm.prjGrpId.value = prjGrpId;
			document.hideMoveForm.prjId.value = prjId;
			document.hideMoveForm.authGrpId.value = authGrpId;
			document.hideMoveForm.action= "/cmm/cmm9000/cmm9000/selectCmm9000PageChgView.do";
			document.hideMoveForm.submit();
		}
	};
	
	/* osl 추가 메소드 */
	/**
	 *  function 명 	: $.osl.ajaxRequestAction
	 *  function 설명	: AJAX 통신 공통 처리
	 * - ajax통신 옵션은 property에서 배열로 처리
	 * - 로딩 바 기본(통신 완료 퍼센트)
	 * - AJAX통신 중 Background처리가 있는 경우 무조건 async = true(동기) 처리  예) 메일 전송 AJAX
	 * property 옵션
	 * - url
	 * - dataType
	 * - contentType
	 * - async
	 * - cache
	 * - processData
	 * data는 setData로 따로 설정 가능
	 * 예제)
	 * 1. 객체 선언과 동시에 옵션 세팅
	 * var ajaxObj = new $.osl.ajaxRequestAction({
			"url":"<c:url value='/req/req2000/req2000/insertReq2000ReqCommentInfoAjax.do'/>"
			,"contentType":"application/x-www-form-urlencoded; charset=UTF-8"
			,"datatype":"json"
			,"async":false
			,"cache":true
			,"processData":true
			});
	 * 
	 * 2. 객체 선언과 이후 옵션 세팅
	 * //setProperty를 여러번 나누어서 설정해도 상관 없음
	 * var ajaxObj = new $.osl.ajaxRequestAction({
			"url":"<c:url value='/req/req2000/req2000/insertReq2000ReqCommentInfoAjax.do'/>"
			});
		ajaxObj.setProperty({
			"contentType":"application/x-www-form-urlencoded; charset=UTF-8"
			,"datatype":"json"
			,"async":false
			,"cache":true
			,"processData":true
		});
	 * 
	 * 3. data 설정
	 * ajaxObj.setData({"prjId" : prjId, "reqId" : reqId, "reqCmnt" : reqCmnt});
	 * var ajaxObj = new $.osl.ajaxRequestAction({
			"url":"<c:url value='/req/req2000/req2000/insertReq2000ReqCommentInfoAjax.do'/>"
			,"contentType":"application/x-www-form-urlencoded; charset=UTF-8"
			,"datatype":"json"
			,"async":false
			,"cache":true
			,"processData":true}
			,{"prjId" : prjId, "reqId" : reqId, "reqCmnt" : reqCmnt});
	 * 3-1. 객체 선언과 동시에 data 설정
	 * 
	 * 4. AJAX 성공처리 함수 설정
	 * //AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
	    	//코멘트 등록 실패의 경우 리턴
	    	if(data.saveYN == 'N'){
	    		$.osl.toastr(data.message);
	    		return;
	    	}
	    	//코멘트 리스트 세팅
	    	gfnSetData2CommentsArea(data.reqCommentList, "reqCmntListDiv", "BRD");
	    	//코멘트 입력창 클리어
	    	$("#reqCmnt").val("");
	    	$.osl.toastr(data.message);
		});
	 * 
	 * 5. AJAX 에러처리 함수 설정
	 * ajaxObj.fnError(function(xhr, status, err){
	 	
	 	});
	 * 
	 * 6. AJAX 통신 준비, 통신 완료처리 4번과 동일
	 * 
	 * 7. AJAX 통신 시작
	 * ajaxObj.send();
	 * 
	 * 		- 그 외 커스텀 추가 시 내용 삽입 - 
	 * 2016-09-13			최초 작성			진주영
	 * 2016-09-19			수정				진주영
	 */
	$.osl.ajaxRequestAction = function(property,data){
		//url, data
		this.url = this.data = this.mimeType = "";
		
		// xml, json, script, html
		this.dataType ="json";
		
		//application/x-www-form-urlencoded, multipart/form-data, text/plain
		this.contentType = "application/x-www-form-urlencoded; charset=UTF-8";
		
		//false = 동기, true = 비동기
		this.async = true;
		
		//GET 방식 전달인 경우 IE 캐싱 문제 때문에 false로 설정해야 한다.
		this.cache = "true";
		
		//기본값인 true일 때 객체로 전달된 데이터를 쿼리 문자열로 변환한다. FormData 등 쿼리 문자열 변환이 불가능한 -비 처리된- 데이터를 전달할 때는 false로 설정한다.
		this.processData = "true";
		
		//로딩바 표현 여부
		this.loadingShow = true;
		
		//Success, beforeSend, complete, error에 null값인 경우 빈 Function 삽입
		//$.noop = jQuery에서 제공하는 빈함수 no-op
		this.fnSuccess = this.fnbeforeSend = this.fnComplete = this.fnError = $.noop;

		//함수 setter
		this.setData = function setData(data){
			this.data = data;
		}
		this.setFnSuccess = function setFnSuccess(fnContent){
			this.fnSuccess = fnContent;
		}
		this.setFnBeforeSend = function setFnbeforeSend(fnContent){
			this.fnbeforeSend = fnContent;
		}
		this.setFnComplete = function setFnComplete(fnContent){
			this.fnComplete = fnContent;
		}
		this.setFnError = function setFnError(fnContent){
			this.fnError = fnContent;
		}

		//AJAX 옵션 설정
		this.setProperty = function setProperty(prop){
			if(!$.osl.isNull(prop)){
				this.url = $.osl.isNull(prop['url'])?this.url:prop['url'];
				this.dataType = $.osl.isNull(prop['dataType'])?this.dataType:prop['dataType'];
				this.contentType = $.osl.isNull(prop['contentType'])?this.contentType:prop['contentType'];
				this.async = $.osl.isNull(prop['async'])?this.async:prop['async'];
				this.cache = $.osl.isNull(prop['cache'])?this.cache:prop['cache'];
				this.processData = $.osl.isNull(prop['processData'])?this.processData:prop['processData'];
				this.mimeType = $.osl.isNull(prop['mimeType'])?this.mimeType:prop['mimeType'];
				this.loadingShow = $.osl.isNull(prop['loadingShow'])?true:prop['loadingShow'];
			}
		}

		//생성자
		if(!$.osl.isNull(property)){
			eval(this.setProperty(property));
		}
		if(!$.osl.isNull(data)){
			eval(this.setData(data));
		}
		//AJAX 전송
		this.send = function send(){
			//AJAX 객체 변수
			var obj = this;

			//로딩 show 변수
			var tmp_loadingShow = this.loadingShow;
			
			try{
				//AJAX 호출
				$.ajax({
			        type: "POST",
			        url: this.url,
			        data: this.data,
			        contentType: this.contentType,
			        async: this.async,
			        cache: this.cache,
			        processData: this.processData,
			        mimeType: this.mimeType,
			        beforeSend: function(){
			        	if(tmp_loadingShow){
			        		//로딩 게이지 바 출력
			        		$.osl.showLoadingBar(true);
			        	}
			    		
			    		obj.fnbeforeSend();
			        },
			        success: function(data, status, xhr) {
			        	xhr: /*@cc_on false && @*/window.XMLHttpRequest ? 
						function() { return new window.XMLHttpRequest(); } : 
						function() { 
						    try { return new window.ActiveXObject("Microsoft.XMLHTTP"); } 
						    catch(e) {} 
						}
			        	try{
			        		obj.fnSuccess(data, status, xhr);
			        	}catch(e){
			        		console.log(e);
			        		console.log("success error: "+e);
			        		return;
			        	}
			        },
			        error: function(xhr, status, err){
			        	//세션이 만료된 경우
			        	if(xhr.status == '999'){
			        		$.osl.alert($.osl.lang("common.error.sessionInvalid"),"error",
			        				function(){
					        			document.location.href="/cmm/cmm4000/cmm4000/selectCmm4000View.do";
					        		}
			        		);
			        		//3초간 응답 없는경우 강제 redirect
				    		 setTimeout(function(){
				    			 document.location.href="/cmm/cmm4000/cmm4000/selectCmm4000View.do"
				    		 },3000);
			        		return;
			        	}else if(xhr.status == '998'){
			        		$.osl.alert($.osl.lang("common.error.nonAuth"),"error");
			        		if(tmp_loadingShow){
			        			$.osl.showLoadingBar(false);
			        		}
			        		return;
			        	}else{
			        		//그 외에 커스텀 에러 처리
			        		obj.fnError(xhr, status, err);
			        		if(tmp_loadingShow){
			        			$.osl.showLoadingBar(false);
			        		}
			        		return;
			        	}
			        },
			        complete: function(){
			        	if(tmp_loadingShow){
			        		$.osl.showLoadingBar(false);
			        	}
			        	obj.fnComplete();
			        }
			    });
			}catch(exception){
				if(tmp_loadingShow){
					$.osl.showLoadingBar(false);
				}
				console.log(exception);
			}
		}
	};
	
	/**
	 *  function 명 	: $.osl.showLoadingBar
	 *  function 설명	: loading 바를 show/hide 한다.
	 * @param isShow: 로딩바호출 : true , 로딩바숨김 : false
	 * @param config{
	 * 			opacity			: 배경 투명도
	 * 			overlayColor	: 배경 색상
	 * 			type			: v2 (고정)
	 * 			state			: 로딩바 이미지 색상 [brand, metal, light, dark, accent, focus, primary, success, info, waning, danger]
	 * 			message			: 로딩 출력 문구
	 * 			target			: 로딩바 표현 대상 (기본값 = 'page')
	 */
	$.osl.showLoadingBar = function(isShow, paramConfig){
		var defaultConfig = {
				opacity: 0.05,
                overlayColor: '#000000',
                type: 'v2',
                state: 'success',
                message: 'Loading...'
            };
		
		var config = $.extend(defaultConfig, paramConfig);
		
		//target block
		if(!$.osl.isNull(paramConfig) && paramConfig.hasOwnProperty("target") && paramConfig["target"] != "page"){
			//타겟 elem
			var targetObj = $(paramConfig["target"]);
			
			//타겟이 존재하지 않는 경우 전체 block
			if(targetObj.length == 0){
				if(isShow){
					KTApp.blockPage(config);
				}else{
					setTimeout(function(){
						KTApp.unblockPage();
					},300);
				}
			}else{
				if(isShow){
					KTApp.block(paramConfig["target"], config);
				}else{
					setTimeout(function(){
						KTApp.unblock(paramConfig["target"]);
					},300);
				}
			}
		}else{ //페이지 전체 block
			if(isShow){
				KTApp.blockPage(config);
			}else{
				setTimeout(function(){
					KTApp.unblockPage();
				},300);
			}
		}
	};
	
	/**
	 *  function 명 	: $.osl.isNull
	 *  function 설명	:  널 체크
	 * @param sValue
	 * @returns {Boolean}
	 */
	$.osl.isNull = function(sValue)
	{
		if( typeof sValue == "undefined") {
	        return true;
	    }
	    if( String(sValue).valueOf() == "undefined") {
	        return true;
	    }
	    if( sValue == null ){
	        return true;
	    }
	    if( ("x"+sValue == "xNaN") && ( new String(sValue.length).valueOf() == "undefined" ) ){
	        return true;
	    }
	    if( sValue.length == 0 ){
	        return true;
	    }
	    if( sValue == "NaN"){
	        return true;
	    }
	    return false;
	};
	
	/**
	 *  function 명 	: $.osl.escapeHtml
	 *  function 설명	: &<>'" 문자 치환
	 * @param sValue
	 * @returns {Replace String}
	 */
	$.osl.escapeHtml = function(sValue){
		var rtnValue = sValue;
		//숫자인경우 반환
		if(typeof sValue == "number"){
			return rtnValue;
		}
		try{
			rtnValue =  sValue ? sValue.replace( /[&<>'"]/g,
				function (c, offset, str) {
					if (c === "&") {
						var substr = str.substring(offset, offset + 6);
						if (/&(amp|lt|gt|apos|quot);/.test(substr)) {
							return c;
						}
					}
					return "&" + {
						"&": "amp",
						"<": "lt",
						">": "gt",
						"'": "apos",
						'"': "quot"
					}[c] + ";";
				}
			) : "";
		}catch(error){
			return "";
		}
		
		//br은 태그 복구
		rtnValue = rtnValue.replace(/(&lt;\/br&gt;|&lt;br&gt;|&lt;br\/&gt;|&lt;br \/&gt;)/gi, '</br>');
		
		return rtnValue;
	};
	
	/**
	 *  function 명 	: $.osl.unEscapeHtml
	 *  function 설명	: (&amp;)|(&lt;)|(&gt;)|(&apos;)|(&quot;)문자 치환 => &<>'" 
	 * @param sValue
	 * @returns {Replace String}
	 */
	$.osl.unEscapeHtml = function(sValue){
		//숫자인경우 반환
		if(typeof sValue == "number"){
			return sValue;
		}
		try{
			return sValue ? sValue.replace( /(&amp;)|(&lt;)|(&gt;)|(&apos;)|(&quot;)]/g,
				function (c, offset, str) {
					return {
						"&amp;": "&",
						"&lt;": "<",
						"&gt;": ">",
						"&apos;": "\"",
						'&quot;': "\'"
					}[c];
				}
			) : "";
		}catch(error){
			return "";
		}
	};

	/**
	 *  function 명 	: $.osl.toastr
	 *  function 설명	: toast 창을 팝업 한다.
	 * @param msg: 내용
	 * @param agument - typeof string: 제목
	 * @param agument - typeof object: 
	 * 					{
	 * 						title: String					
	 *  					,type: ['error', 'warning', 'info', 'success'] (default - success)
	 * 					}
	 * 
	 * ex) 단순 내용, 타이틀 toast
	 * $.osl.toastr("message","title");
	 * 
	 * ex) 타입 지정 toast
	 * $.osl.toastr("message",{"title":"title", "type":"warning"});
	 */
	$.osl.toastr = function(msg, agument){
		//기본 타입
		var type = "success";
		//값이 없는 경우 공백
		var title = "";
		var targetConfig = {
				"closeButton": false,
				"debug": false,
				"newestOnTop": false,
				"progressBar": true,
				"positionClass": "toast-top-right",
				"preventDuplicates": false,
				"onclick": null,
				"showDuration": "300",
				"hideDuration": "1000",
				"timeOut": "2000",
				"extendedTimeOut": "1000",
				"showEasing": "swing",
				"hideEasing": "linear",
				"showMethod": "fadeIn",
				"hideMethod": "fadeOut"
		};
		
		//두번째 인자 type 분기
		if(!$.osl.isNull(agument) && typeof agument == "string"){
			//type string인 경우 title로 사용
			title = agument;
		}
		else if(!$.osl.isNull(agument) && typeof agument == "object"){
			//type object인 경우 json으로 해당 요소 가져오기
			//title 있는지 체크
			if(agument.hasOwnProperty("title")){
				title = agument.title;
			}
			
			//깊은 복사
			targetConfig = $.extend(true, targetConfig, agument, agument);
		}
		
		//type 요소 존재 체크
		if(typeof agument == "object" && agument.hasOwnProperty("type")){
			type = agument.type;
		}
		
		toastr.options = targetConfig;
		switch(type){
			case "info":
				toastr.info(msg, title);
			break;
			case "error":
				toastr.error(msg, title);
			break;
			case "warning":
				toastr.warning(msg, title);
			break;
			case "success":
				toastr.success(msg, title);
			break;
		}
	};
	
	/**
	 *  function 명 	: $.osl.alert
	 *  function 설명	: alert 창을 팝업 한다. (window.alert)
	 * @param title			alert 제목
	 * @param options		alert 옵션
	 * 			text		alert 내용
	 * 			type		경고창 type [error, warning, info, success, question]
	 * 			position	[top, bottom, center, top-right, top-left, bottom-right, bottom-left]
	 * 			showConfirmButton	경고 창 버튼 유무 (defatul-false)
	 * 			timer		자동 close 시간
	 * @param callbackFn	alert ok 버튼 클릭 시 발생하는 이벤트
	 */
	$.osl.alert = function(title, options, callbackFn){
		var defaultConfig = {
			title: title,
			type: 'info',
			position: 'center',
            showConfirmButton: true,
            timer: 0,
            confirmButtonText: $.osl.lang("common.alert.ok"),
            confirmButtonAriaLabel: $.osl.lang("common.alert.ok"),
            cancelButtonText:$.osl.lang("common.alert.cancel"),
            cancelButtonAriaLabel: $.osl.lang("common.alert.cancel")
		};
		
		//options setting
		options = $.extend(true, defaultConfig, options);
		
		swal.fire(options).then(function(result){
			if(typeof callbackFn == "function"){
				callbackFn(result);
			}
		});;
	};
	
	/**
	 *  function 명 	: $.osl.confirm
	 *  function 설명	: 버튼이 있는 alert 창을 팝업한다. (window.confirm)
	 * @param msg			alert 내용
	 * @param optoins		alert 옵션
	 * 						-title					팝업 제목
	 * 						-confirmButtonText		팝업 ok 버튼 문구
	 * 						-type					경고창 type ['error', 'warning', 'info', 'success', 'question'] (default - warning)
	 * @param callbackFn	
	 */
	$.osl.confirm = function(msg,options,callbackFn){
		//msg가 없는 경우 공백
		if($.osl.isNull(msg)){
			msg = "";
		}
		
		//기본 변수
		var defaultValue = {
				"title": $.osl.lang("common.alert.title")
				,"confirmButtonText": $.osl.lang("common.alert.ok")
				,"cancelButtonText": $.osl.lang("common.alert.cancel")
				,"showCancelButton": true
				,"allowOutsideClick": false
				,"text": msg
				,"type": 'warning'
		}
		
		//options value extend
		if(!$.osl.isNull(options)){
			$.extend(defaultValue, options, defaultValue);
		}

		//option에 html체크 있는경우 추가
		if(options != null && options.hasOwnProperty("html")){
			if(options.html === true){
				defaultValue["html"] = msg;
			}
		}
		
		//sweet alert action
		swal.fire(defaultValue).then(function(result) {
			if(typeof callbackFn == "function"){
				callbackFn(result);
			}
	    });
	};
	
	/**
	 *  function 명 	: $.osl.validate
	 *  function 설명	: 폼값 유효성 체크 validate rules, messages 자동 세팅
	 * @param formId	: 대상 form Id
	 * 속성에 유효성 조건 선언
	 * 
	 * @attribute
	 * 		required	: 필수(싱글 선언 또는 true,required)
	 * 		minlength	: 입력 글자 수 최소값
	 * 		maxlength	: 입력 글자 수 최대값
	 * 		regexstr	: 정규식 체크
	 * 		regexalert	: 정규식 조건에 맞지 않는 경우 포함하는 문구 "영문,숫자 필수 포함, $@$!%*#?&"
	 * 		equalTo		: 동일한 값 체크 #element_id 형식으로 입력 (ex. #in_usrPw)
	 * 
	 * ex)
	 *  <input type="text" class="form-control" id="in_usrId" name="in_usrId" placeholder="(20자 까지 입력 가능)" minlength="3" maxlength="20" regexstr="^[a-z0-9_-]{5,20}$" regexalert="영문, 숫자, _-" required>
	 *  
	 *  @return validate 객체 반환 ( 반환 이후 페이지에서 .valid() 사용
	 */
	$.osl.validate = function(formId){
		var formTarget = $("#"+formId);
		
		//form에 있는 input, select ,textarea 조회
		var formInElem = formTarget.find("input,select,textarea");

		//rules
		var rules = {};
		
		//messages
		var messages = $.osl.lang("fromValidate.messages");
		
		//rules, messages 세팅
		$.each(formInElem,function(idx, map){
			
			//target id
			var targetId = map.id;
			
			//유효값 체크 대상 객체
			var $elemInfo = $(map);
			
			//label값 불러오기
			var labelText = $elemInfo.siblings("label").text();
			
			//label없는경우 속성 label 찾기
			if($.osl.isNull(labelText)){
				labelText = $elemInfo.attr("label");
				
				//label없는경우 id값으로 대체
				if($.osl.isNull(labelText)){
					labelText = targetId;
				}else{
					labelText = labelText.toString();
				}
			}
			
			//tag type이 hidden이 아닌경우에만
			if($elemInfo.attr("type") != "hidden"){
				//rules ,messages 선언
				if($.osl.isNull(rules[targetId])){
					rules[targetId] = {};
				}
				if($.osl.isNull(messages[targetId])){
					messages[targetId] = {};
				}
			}
			
			//message에 대한 rule 입력
			$.each(messages, function(messageId, messageStr){
				if(!$.osl.isNull($elemInfo.attr(messageId))){
					var ruleVal = $elemInfo.attr(messageId);
					if($.osl.isNull(ruleVal)){
						return true;
					}
					//필수인경우 true로 변경
					if(ruleVal == "required"){
						ruleVal = true;
					}
					//정규식인경우 정규식 포함
					if(messageId == "regexstr"){
						//정규식
						var regexstr = $elemInfo.attr("regexstr");
						var regexErrorStr = $elemInfo.attr("regexerrorstr");
						
						//rule 세팅
						var ruleJson = {regex: new RegExp(regexstr)};
						$.extend(rules[targetId],ruleJson);
						
						//정규식 경고문 가져오기 
						if(!$.osl.isNull(regexErrorStr)){
							regexErrorStr = "&nbsp; ("+regexErrorStr+")";
						}else{
							regexErrorStr = "";
						}
						
						//정규식 유효성 값 체크 실패시 알림 문구
						var regexalertStr = "입력 값이 형식에 맞지 않습니다."+regexErrorStr;
						var regexalert = $elemInfo.attr("regexalert");
						
						//알림 문구 존재하는 경우 포함
						if(!$.osl.isNull(regexalert)){
							regexalertStr = regexalertStr + "("+regexalert+")";
						}
						
						//메시지 세팅
						var msgJson = {regex: function(paramRegex,paramElem){
							return regexalertStr;
						}};
						$.extend(messages[targetId],msgJson);
					}else{
						//rule 세팅
						var ruleJson = {};
						ruleJson[messageId] = ruleVal;
						$.extend(rules[targetId],ruleJson);
						
						//메시지 세팅
						var msgJson = {};
						msgJson[messageId] = messageStr;
						$.extend(messages[targetId],msgJson);
					}
				}
			});
			/*
			//select2 multiple
			if(!$.osl.isNull($elemInfo.attr("multipleValid"))){
				var targetValue = $elemInfo.val();
			}
			*/
		});
		//form 필수 체크
		var v = formTarget.validate({
			//숨겨진 객체거나 직접 수정 기능인 객체인경우 제외
			ignore: ":hidden:not(.summernote), .note-editable",
			rules : rules,
			messages : messages,
			invalidHandler: function (form, validator) {
	            var errors = validator.numberOfInvalids();
	            if (errors) {
	                //$.osl.alert(validator.errorList[0].message);
	                validator.errorList[0].element.focus();
	            }
	        },
	        submitHandler: function (frm){
                return false;
            },
		});
		
		return v;
	};
	
	/**
	 * Date Format Function
	 * @param f
	 * @param type = null or true
	 * 		UTC로 저장된 컬럼인 경우 null
	 * 		그 외 지역 시간으로 저장된 컬럼인 경우 true
	 * @returns
	 */
	//getTime to date
	Date.prototype.format = function(f,type) {
	    if (!this.valueOf()) return " ";
	    if($.osl.isNull(type)){type = true;}
	 
	    var weekName = $.osl.lang("date.datepicker.days");
	    var d = this;

	    //GMT와 현재 시스템의 지역 시간차를 분으로 나타낸다.
	    var gmtOffset = new Date().getTimezoneOffset();
	    
	    
	    //UTC 시간을 구할 경우 GMT 차이를 더해준다.(-9)
	    if(!$.osl.isNull(type) && type == 'UTC' && !$.osl.isNull(gmtOffset)){
		    //차이값을 빼준다.
		    d.setMinutes(d.getMinutes()+(gmtOffset));
	    }
	    //한국 시 설정인 경우 GMT 차이를 빼준다.(-9)
	    else if($.osl.isNull(type) && type != true && !$.osl.isNull(gmtOffset)){
		    //차이값을 빼준다.
		    d.setMinutes(d.getMinutes()-(gmtOffset));
	    }

	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|ms|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "ms": return d.getMilliseconds().zf(3);
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
	            default: return $1;
	        }
	    });
	};
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};
	
	/**
	 * function 명 	: $.osl.showLoading 
	 * function 설명	: Ajax로 트랜잭션시 사용할 loading 바를 show/hide 한다.
	 * @param isShow: 로딩바호출 : true , 로딩바숨김 : false
	 * @param data{
	 * 			targetObj: 대상 $ : body (default)
	 * 	
	 */
	$.osl.showLoading = function(isShow,data){
		//기본 대상 body
		var $targetObj = $("body");
		var message = "";
		var background = "rgba(0, 0, 0, 0.21)";
		var custom = null;
		
		if(!$.osl.isNull(data)){
			//대상 값 세팅
			if(data.hasOwnProperty("target") && !$.osl.isNull(data.target)){
				$targetObj = $(data.target);
			}
			
			//출력 메시지 있는 경우 세팅
			if(data.hasOwnProperty("message") && !$.osl.isNull(data.message)){
				message = data.message;
			}	
			
			//배경색상 세팅
			if(data.hasOwnProperty("background") && !$.osl.isNull(data.background)){
				background = data.background;
			}	
			
			//사용자 정의
			if(data.hasOwnProperty("custom") && !$.osl.isNull(data.custom)){
				custom = data.custom;
			}	
		}
		//false일때 body에 로딩 없는경우 전체 로딩바 닫기
		if(!isShow && !$("body").hasClass("busy-load-active")){
			$(".busy-load-active").busyLoad("hide");
		}
		else if(isShow){
			$targetObj.busyLoad("show", {
				custom:custom,
				image: "/media/etc/loading.gif",
				text: message,
				textPosition:"bottom",
				maxSize:"100px",
				minSize:"60px",
				containerClass:"loading-fixed",
				background:background
			});
		}
		else{
			//해당 객체 로딩 지우기
			$targetObj.busyLoad("hide");
		}
	};
	
	/**
	 *  function 명 	: $.osl.byteCalc
	 *  function 설명	: byte 용량을 받아서 형 변환 후 리턴해주는 함수
	 * @param bytes
	 * @returns {String} 변환 값
	 */
	$.osl.byteCalc = function(bytes){
		if(bytes < 0){
			return 0+" bytes";
		}
	    var bytes = parseInt(bytes);
	    var s = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB'];
	    var e = Math.floor(Math.log(bytes)/Math.log(1024));
	   
	    if(e == "-Infinity") return "0 "+s[0]; 
	    else 
	    return (bytes/Math.pow(1024, Math.floor(e))).toFixed(2)+" "+s[e];
	};
	
	/**
	 * 	function 명 	: $.osl.layerPopupOpen
	 *  function 설명	: 레이어 팝업을 호출한다.
	 * @param url		: 모달창 내용 ajax url
	 * @param data		: 모달창 ajax에 전달할 data
	 * @param opt		: 모달창 옵션
	 * @opt
	 * 			modalSize		: 모달 창 크기 [xl, lg, md, sm]
	 * 			backdrop		: 모달 창 영역 외에 클릭으로 모달 창 닫기 여부 [true - default(static), false]
	 * 			keyboard		: 키보드 ESC 버튼으로 모달 창 닫기 여부
	 * 			showLoading		: 모달 창 오픈시 로딩화면 여부
	 * 			closeConfirm	: 모달 창 닫기 클릭 했을때 닫을건지 경고창 여부
	 * 			idKeyDuple		: 같은 모달 창 중복 팝업 여부 (권장 하지 않음, 변수 중복 문제 등)
	 * 			idKey			: 모달 창을 오픈한 객체(같은 모달 중복 팝업 방지) 
	 * 			focus			: open modal auto focusing
	 * 			class			: header, body, footer에 추가 class 선언
	 */
	$.osl.layerPopupOpen = function(url, data, opt){
		//모달창 오픈
		return modal_popup(url, data, opt);
	};
	
	/**
	 * 	function 명 	: $.osl.layerPopupClose
	 *  function 설명	: 최상위 레이어 팝업을 닫는다.
	 */
	$.osl.layerPopupClose = function(){
		//모달창 강제 닫기
		modalCloseFlag = true;
		$("button.close:eq(0)").click();
	};

	
	/**
	 * 	function 명 	: $.favoritesEdit
	 *  function 설명	: 즐겨찾기 아이콘 클릭 시 발생 이벤트
	 */
	$.osl.favoritesEdit = function(e, thisObj){
		//링크 이벤트 중지
		e.preventDefault();
		//상위 서브메뉴 닫힘 이벤트 중지
		e.stopPropagation();
		
		//fvr 정보
		var fvrId = $(thisObj).data("fvr-id");
		var fvrType = $(thisObj).data("fvr-type");
		var fvrNm = $(thisObj).siblings("span").text();
		var fvrData1 = $(thisObj).data("fvr-data1");
		var fvrData2 = $(thisObj).data("fvr-data2");
		var fvrData3 = $(thisObj).data("fvr-data3");
		var fvrData4 = $(thisObj).data("fvr-data4");
		var fvrData5 = $(thisObj).data("fvr-data5");
		var fvrData6 = $(thisObj).data("fvr-data6");
		
		//즐겨찾기 추가 유무
		var activeFlag = $(thisObj).hasClass("osl-favorites--active");
		
		//사용처리
		var fvrUseCd = "01";
		
		//즐겨찾기 css toggle
		if(activeFlag){
			$(thisObj).removeClass("osl-favorites--active");
			fvrUseCd = "02";
		}else{
			$(thisObj).addClass("osl-favorites--active");
		}
		
		var paramData = {
				fvrId: fvrId
				,fvrType: fvrType
				,fvrUseCd: fvrUseCd
				,fvrData1: fvrData1
				,fvrData2: fvrData2
				,fvrData3: fvrData3
				,fvrData4: fvrData4
				,fvrData5: fvrData5
				,fvrData6: fvrData6
		};
		
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"/stm/stm2000/stm2000/saveStm2002FavoriteInfo.do", "loadingShow":true}
				,paramData);
		
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
			
        	if( data.errorYn == "N" ){
        		var fvrId = data.fvrId;
        		
        		$(thisObj).attr("data-fvr-id",fvrId);
        		
        		
        		//즐겨찾기 css toggle
        		if(activeFlag){
        			//즐겨찾기 메뉴 제거
        			$("ul[id=fvrListType"+fvrType+"] li.kt-menu__item i[data-fvr-id="+fvrId+"]").parent("a").parent("li").remove();
        			$(".osl-favorites--active[data-fvr-id="+fvrId+"]").removeClass("osl-favorites--active");
        		}else{
        			//출력 문구
        			var fvrTitleStr = "";
        			
        			//이동 링크
        			var fvrTargetEvt = '';
        			
        			//type별 title
        			if(fvrType == "01"){
    					fvrTitleStr = 
    						'<div class="kt-align-left">'
    							+'<i class="fa fa-layer-group"></i>&nbsp;'
    							+$.osl.lang("common.menu.top")+' : '
        						+$.osl.escapeHtml(fvrData4)+'</br>'
        						+'<i class="fa fa-layer-group"></i>&nbsp;'
        						+$.osl.lang("common.menu.upper")+'　 : '
        						+$.osl.escapeHtml(fvrData5)+'</br>'
        						+'<i class="fa fa-layer-group"></i>&nbsp;'
        						+$.osl.lang("common.menu.name")+' : '
        						+$.osl.escapeHtml(fvrNm)
    						'/<div>';
    					fvrTargetEvt = '$.osl.goMenu(\''+$.osl.escapeHtml(fvrData2)+'\', \''+$.osl.escapeHtml(fvrData1)+'\', \''+$.osl.escapeHtml(fvrNm)+'\', \''+$.osl.escapeHtml(fvrData3)+'\' )';
    				}
    				else if(fvrType == "02"){
    					fvrTitleStr = 
    						'<div class="kt-align-left">'
        						+$.osl.escapeHtml(fvrNm)
    						'/<div>';
    					fvrTargetEvt = '$.osl.goPrjGrp(\''+fvrData1+'\')';
    				}
    				else if(fvrType == "03"){
    					fvrTitleStr = 
    						'<div class="kt-align-left">'
    							+'<i class="fa fa-layer-group"></i>&nbsp;'
    							+$.osl.lang("common.name.prjGrp")+': '
        						+$.osl.escapeHtml(fvrData3)+'</br>'
        						+'<i class="fa fa-layer-group"></i>&nbsp;'
        						+$.osl.lang("common.name.prj")+': '
        						+$.osl.escapeHtml(fvrNm)+'</br>'
    						'/<div>';
    					fvrTargetEvt = '$.osl.goPrj(\''+fvrData1+'\',\''+fvrData2+'\')';
    				}
    				else if(fvrType == "04"){
    					fvrTitleStr = 
    						'<div class="kt-align-left">'
    							+'<i class="fa fa-layer-group"></i>&nbsp;'
    							+$.osl.lang("common.name.prjGrp")+': '
        						+$.osl.escapeHtml(fvrData4)+'</br>'
        						+'<i class="fa fa-layer-group"></i>&nbsp;'
        						+$.osl.lang("common.name.prj")+': '
        						+$.osl.escapeHtml(fvrData5)+'</br>'
        						+'<i class="fa fa-layer-group"></i>&nbsp;'
        						+$.osl.lang("common.name.authGrp")+': '
        						+$.osl.escapeHtml(fvrNm)
    						'/<div>';
    					fvrTargetEvt = '$.osl.goAuthGrp(\''+fvrData1+'\',\''+fvrData2+'\',\''+fvrData3+'\')';
    				}
        			
        			var $fvrElem =
    					$('<li class="kt-menu__item " aria-haspopup="true" data-toggle="kt-tooltip" data-html="true" data-placement="top" data-skin="brand" title="'+$.osl.escapeHtml(fvrTitleStr)+'">'
    					+'	<a href="javascript:'+fvrTargetEvt+'" class="osl-favorites__item kt-menu__link fvrHoverInfo">'
    					+'		<i class="kt-menu__link-icon flaticon-star osl-favorites--active" data-fvr-id="'+fvrId+'" data-fvr-data1="'+$.osl.escapeHtml(fvrData1)+'"data-fvr-data2="'+$.osl.escapeHtml(fvrData2)+'"data-fvr-data3="'+$.osl.escapeHtml(fvrData3)+'" data-fvr-data4="'+$.osl.escapeHtml(fvrData4)+'" data-fvr-data5="'+$.osl.escapeHtml(fvrData5)+'" data-fvr-data6="'+$.osl.escapeHtml(fvrData6)+'" data-fvr-type="'+fvrType+'" onclick="$.osl.favoritesEdit(event,this)"></i>'
    					+'		<span class="kt-menu__link-text">'+$.osl.escapeHtml(fvrNm)+'</span>'
    					+'	</a>' 
    					+'</li>');
            		
    				$("#fvrListType"+fvrType).append($fvrElem);
    				
    				//KT 툴팁 재 호출
        			KTApp.initTooltips();
        		}
        		
        	}else{
        		$.osl.toastr(data.message);
        	}
		});
		
		//AJAX 전송
		ajaxObj.send();
	};
	
	
	/**
	 * function명 	: $.osl.getMulticommonCodeDataForm [조회 조건 select Box 용]
	 * function설명	: 트랜잭션을 여러번 날리는게 아닌 단일 트랜잭션으로 콤보 코드를 가지고 오는 용도로 사용, 콤보용 공통 코드 및 공통코드명 가져올때 사용
	 * 				  공통코드 테이블을 참조하여 콤보데이터를 가지고 온다.
	 * 				  Ex>
	 * 					  1. json data 세팅
	 *	 						mstCd: 공통코드 마스터 코드
	 *	 						useYn: 사용구분 저장(Y: 사용중인 코드만, N: 비사용중인 코드만, 그 외: 전체)
	 *	 						comboType: 공통코드 가져와 적용할 콤보타입 객체 배열 ( S:선택, A:전체(코드값 A 세팅한 조회조건용), N:전체, E:공백추가, OS:select 객체에 OS="" 값 설정할경우 값 적용,그 외:없음 )
	 *	 						targetObj: 공통코드 적용할 select 객체 ID(*)
	 * 					  2. 대분류 코드를 세팅할 selectBox 객체를 배열로 대분류 코드 순서와 일치하게 세팅하여 보낸다.
	 * 					  3. 사용여부가 사용인지, 미사용인지 아니면 전체를 다 가지고 올지를 판단. (N: 사용하지 않는 것만, Y: 사용하는 것만, 그외: 전체)
	 *            		  4. 콤보타입을 전체, 선택, 일반 바로 선택 가능한 상태에 대한 조건을 순서대로 배열로 보낸다. ["S", "A", "E", "JSON",""] S: 선택, A: 전체, E:공백추가 OS:선택 값 selected , JSON:반환 데이터를 json으로 리턴 , 그 외: 없음  
	 *            			OS: 해당 select attr에 OS="01" 등과 같이 입력 -> option elements 생성 후 해당 value의 option을 selected한다.
	 *            			JSON: 반환 데이터를 기타 사용 할 수 있도록 JSON OBJECT로 제공 
	 *                    5. input box data-osl-value="" 지정 후 값 넣는 경우 해당 option selected
	 * @param commonCodeArr		:	공통코드 조회 필요 데이터
	 * var commonCodeArr = [
			{mstCd: "ADM00003",useYn: "Y",targetObj: "#in_usrPositionCd"},
			{mstCd: "ADM00004",useYn: "Y",targetObj: "#in_usrDutyCd"},
			{mstCd: "CMM00001",useYn: "Y",targetObj: "#in_asideShowCd"},
			{mstCd: "CMM00001",useYn: "Y",targetObj: "#in_useCd"}
		]
		$.osl.getMulticommonCodeDataForm(commonCodeArr , true);
	 * @param isAsyncMode	:	동기, 비동기 모드( true: 비동기식 모드, false: 동기식 모드 )
	 */
	
	$.osl.getMulticommonCodeDataForm = function(commonCodeArr , isAsyncMode){
		//AJAX 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
				{"url":"/stm/stm4000/stm4000/selectStm4000MultiCommonCodeList.do"
					,"async":isAsyncMode,"loadingShow":false}
				,{commonCodeArr: JSON.stringify(commonCodeArr)});
		//AJAX 전송 성공 함수
		ajaxObj.setFnSuccess(function(data){
	    	if(data.ERROR_CODE == '-1'){
	    		$.osl.toastr(data.ERROR_MSG);
				return;
			}
	    	
	    	//공통코드 데이터
	    	var commonCodeList = data.commonCodeList;
	    	
	    	//파라미터 대상 object loop
	    	$.each(commonCodeArr ,function(idx, map){
	    		//넘겨받은 jsonData 불러오기
	    		var subList = commonCodeList[map.targetObj];
	    		
	    		//콤보박스 세팅 타입
	    		var comboType = map.comboType;
	    		
	    		//select target object
	    		var $targetObject = $(map.targetObj);
	    		
	    		//target empty
	    		$targetObject.empty();
	    		
	    		//target object empty check
	    		if($targetObject == null || $.osl.isNull(subList)){
	    			return true;
	    		}
	    		
	    		if(comboType == 'A'){
					//옵션키 A 로 세팅한 전 체(검색조건용)
	    			$targetObject.append("<option value='A'>"+$.osl.lang("common.name.all")+"</option>");
	    			
					//서브 코드 목록
		    		$.each(subList, function(idx2, subMap){
		    			$targetObject.append("<option value='" + subMap.subCd + "' data-sub-cd-ref1='"+subMap.subCdRef1+"' data-sub-cd-ref2='"+subMap.subCdRef2+"'>" + subMap.subCdNm + "</option>");
		    		});
				}
	    		else if(comboType == 'N'){
	    			//전체 한줄 추가
	    			$targetObject.append("<option value=''>"+$.osl.lang("common.name.all")+"</option>");
	    			
	    			//서브 코드 목록
		    		$.each(subList, function(idx2, subMap){
		    			$targetObject.append("<option value='" + subMap.subCd + "' data-sub-cd-ref1='"+subMap.subCdRef1+"' data-sub-cd-ref2='"+subMap.subCdRef2+"'>" + subMap.subCdNm + "</option>");
		    		});
				}
	    		else if(comboType == 'S'){
	    			//선택 한줄 추가
	    			$targetObject.append("<option value=''>"+$.osl.lang("common.name.select")+"</option>");
	    			
	    			//서브 코드 목록
		    		$.each(subList, function(idx2, subMap){
		    			$targetObject.append("<option value='" + subMap.subCd + "' data-sub-cd-ref1='"+subMap.subCdRef1+"' data-sub-cd-ref2='"+subMap.subCdRef2+"'>" + subMap.subCdNm + "</option>");
		    		});
				}
	    		else if(comboType == 'E'){
	    			//공백 한줄 추가
	    			$targetObject.append("<option value=''></option>");
	    			
	    			//서브 코드 목록
		    		$.each(subList, function(idx2, subMap){
		    			$targetObject.append("<option value='" + subMap.subCd + "' data-sub-cd-ref1='"+subMap.subCdRef1+"' data-sub-cd-ref2='"+subMap.subCdRef2+"'>" + subMap.subCdNm + "</option>");
		    		});
				}
				else{
					//서브 코드 목록
					$.each(subList, function(idx2, subMap){
		    			$targetObject.append("<option value='" + subMap.subCd + "' data-sub-cd-ref1='"+subMap.subCdRef1+"' data-sub-cd-ref2='"+subMap.subCdRef2+"'>" + subMap.subCdNm + "</option>");
		    		});
				}
	    		//comboType이 OS인 경우 selected 지정
				var selVal = $targetObject.data("osl-value");
				
				//기존 값이 null인경우 선택 안함
				if(!$.osl.isNull(selVal)){
					var $seledObj = $targetObject.children('option[value='+selVal+']');
					
					if($seledObj.length > 0){
						$seledObj.attr('selected','selected');
					}
				}
	    	});
		});
		
		//AJAX 전송
		ajaxObj.send();
	}
	
	/**
	 * function 명 	: $.osl.setDataFormElem
	 * function 설명	: json데이터로 온 객체(Json 형식 단건 list 아님)를 키와 FORM 안의 ID값을 찾아
	 * 				  자동으로 데이터를 세팅하는 메서드.
	 * 				  부모 obj 안에 포함되어 있는 폼엘레먼트들도 type을 체크하여 라디오 버튼을 제외하고는 밸류를 세팅한다.
	 * @param json 	: json info(단건)
	 * @param formId : Form ID
	 * @param matchKey (ArrayList) : 해당하는 Key값만 매치해서 값을 세팅한다.
	 * 
	 * 사용 예) $.osl.setDataFormElem($.osl.user.userInfo,"frReq1001", ["usrNm","email","telno","deptName","deptId"])
	 */
	$.osl.setDataFormElem = function(jsonObj, formId, matchKey){
		if(jsonObj != null && Object.keys(jsonObj).length > 0){
			var form = $("#"+formId);
			if(form.length > 0){
				try{
					$.each(jsonObj, function(key, val){
						//해당 폼에서 key값을 가진 element 찾기
						var targetElem = form.find("#"+key);
						if(targetElem.length > 0){
							//matchKey에 내용이 있는 경우 해당 key값만 세팅
							if(!$.osl.isNull(matchKey) && matchKey.length > 0){
								if(matchKey.indexOf(key) == -1){
									return true;
								}
							}
							
							//elemType
							var elemType = targetElem.attr("type");
							//elemTagName
							var elemTagNm = targetElem.prop('tagName').toLowerCase();
							
							 //textarea인경우
					        if(elemTagNm == "textarea"){
					        	if(!$.osl.isNull(val)){
					        		targetElem.text(val.replace(/(<\/br>|<br>|<br\/>|<br \/>)/gi, '\r\n'));
					        	}
					        }
					        else{
								//radio의 경우 child가 배열형태가 되므로, child의 타입을 알수 없다.
						        if (typeof elemType == "undefined") {
						        	elemType = targetElem[0].type;
						        }
						        
						        //radio type도 아닌 경우 내용에 덮어쓰기
						        if(typeof elemType == "undefined"){
						        	targetElem.text(val);
						        	targetElem.val(val);
						        }
						        else{
						        	//타입별로 값을 설정한다.
							        switch(elemType) {
							            case undefined:
							            case "button":
							            case "reset":
							            case "submit":
							            	break;
							            case "select-one":
							            	if(!$.osl.isNull(val)){
							            		targetElem.val(val);
							            	}
							            	break;
							            case "radio":
							            case "checkbox":
							            	targetElem[0].checked = (val == 1);
							            	break;
							            case "img":
							            	targetElem.attr("src",$.osl.user.usrImgUrlVal(val));
							            	break;
							            default :
							                if(!$.osl.isNull(val)){
							                	targetElem.val(val);
							            	}
							            	break;
							        }
						        }
					        }
						}
					});
				}catch(error){
					//오류 있는 경우 skip
				}
			}
		}
	}
	
	/**
	 * function 명 	: $.osl.editorSetting
	 * function 설명	: targetId Elemenet에 summernote 생성
	 * 
	 * @param	targetId: summernote 사용 Object (#제외)
	 * @param	config: 해당 form에 주입된 validate
	 */
	$.osl.editorSetting = function(targetId, config){
		var targetObj = $("#"+targetId);
		
		var rtnEditObj = {};
		
		if(targetObj.length > 0){
			//target
			var container = targetObj.parents(".modal");
			if(container.length == 0){
				container = targetObj;
			}
			
			var defaultConfig = {
				container: container,
	    		lang: 'ko-KR',
	    		height: null,
				maxHeight: null,
				minHeight: 150,
				disabledEditor: false,
				disableResizeEditor: true,
				dialogsInBody: true,
				dialogsFade: true,
				airMode:false,
				disableDragAndDrop: true,
				codeviewFilter: true,
				toolbar: [
					['style', ['style']],
	                ['font', ['bold', 'underline', 'clear']],
	                ['color', ['color']],
	                ['para', ['ul', 'ol', 'paragraph']],
	                ['table', ['table']],
	                ['view', ['fullscreen', 'codeview', 'help']],
	                //['insert', ['link', 'picture', 'video']],
	                ['insert', ['picture']],
	            ],
	            popover:{
	            	image: [
	            		    ['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
	            		    ['float', ['floatLeft', 'floatRight', 'floatNone']],
	            		    ['remove', ['removeMedia']]
	            	],
	            	link: [
            		    ['link', ['linkDialogShow', 'unlink']]
            		],
            		table: [
            		    ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
            		    ['delete', ['deleteRow', 'deleteCol', 'deleteTable']],
            		],
	            },
				callbacks: {
					onChange: function(contents, $editable) {
						targetObj.val(targetObj.summernote('isEmpty') ? "" : contents);
						if(!$.osl.isNull(config) && config.hasOwnProperty("formValidate") &&  !$.osl.isNull(config.formValidate)){
							config.formValidate.element(targetObj);
						}
					}
				}
			};
			
			var targetConfig = $.extend(true, defaultConfig, config);
			
	    	//요구사항 내용 editor
	    	var summernoteObj = targetObj.summernote(targetConfig);
	    	
	    	//입력된 값 넣기
	    	if(!$.osl.isNull(targetObj.val())){
	    		targetObj.summernote('code',targetObj.val());
	    	}

	    	//display:none 제외하고 visibility hidden 처리
	    	targetObj.show();
	    	targetObj.css({visibility: "hidden", height: 0});
	    	
	    	//에디터 disabled 적용
	    	if(targetConfig.disabledEditor){
	    		targetObj.summernote('disable');
	    	}
	    	
	    	rtnEditObj = {id: targetId, target: summernoteObj, element: targetObj[0], config: targetConfig};
		}
		
		return rtnEditObj;
	}
	
	/**
	 * function 명 	: $.osl.formDataToJsonArray
	 * function 설명	: 해당 폼에서 자동으로 폼값을 가져와 FormData()에 세팅 (객체 name값을 key값으로 사용, name없는 경우 id값으로 대체)
	 * @attr
	 * - input box -	title -> 항목 명
	 *					value -> 항목 값
	 *					id	  -> 항목 필드명
	 *					type  -> 항목 타입
	 *					modifyset	-> 01- 이력 저장 항목[기본값], 02- 이력 저장 안함
	 *					opttarget	-> 01 - 기본 컬럼, 02 - 추가 항목, 03 - 배포계획, 04 - 기본 항목
	 *					opttype		-> (-1) - 입력 값 그대로 전송, 01 - 기본값 , 02- 공통코드(cmmcode 속성 값 필요), 03- 사용자, 04- 배포계획
	 *					cmmcode		-> 공통코드
	 *					optFlowId		-> 작업흐름 Id
	 * @param formId	값을 가져올 폼 Id

	 */
	$.osl.formDataToJsonArray = function(formId){
		var fd = new FormData();
		
		var form = $("#"+formId);
		if(form.length > 0){
			try{
				var elements = form.find("input[name], select[name], textarea[name]");
				
				$.each(elements, function(index, element){
					var elemKey = element.name;
					
					//name값이 없다면 id 값으로 대체
					if($.osl.isNull(elemKey)){
						elemKey = element.id;
						//id값이 없는 경우 skip
						if($.osl.isNull(elemKey)){
							return true;
						}
					}
					
					//항목 작업흐름
					var optFlowId = element.getAttribute("optflowid");
					
					//항목 타겟
					var chgDetailOptTarget = element.getAttribute("opttarget");
					
					//항목 타겟 없는경우 normal
					if($.osl.isNull(chgDetailOptTarget)){
						chgDetailOptTarget = "01";
					}
					
					//항목 타입
					var chgDetailOptType = element.getAttribute("opttype");
					
					//항목 타입 없는경우 normal
					if($.osl.isNull(chgDetailOptType)){
						chgDetailOptType = "01";
					}
					
					//항목 공통코드
					var chgDetailCommonCd = element.getAttribute("cmmcode");
					
					//항목 공통코드 없는경우 공백
					if($.osl.isNull(chgDetailCommonCd)){
						chgDetailCommonCd = "";
					}
					
					//결과값에 포함시키지 않는 경우 제외
					var modifySetCd = element.getAttribute("modifyset");
					
					//수정 이력 저장 구분 값 없는경우 01
					if($.osl.isNull(modifySetCd)){
						modifySetCd = "01";
					}
					
					/* jsonData 세팅 */
					//개체 항목 명 (title)
					var eleTitle = element.title;
					
					//개체 항목 명 없는경우 id값이 항목 명
					if($.osl.isNull(eleTitle)){
						eleTitle = elemKey;
					}
					
					//개체 값(value)
					var eleValue = element.value.replace(/\n/gi,'</br>');
					
					//체크 박스인경우 checked로 값 판별
					if(element.type == "checkbox"){
						eleValue = (element.checked)?"01":"02";
					}
					
					//jsonData
					var rtnVal = JSON.stringify({optNm:eleTitle,optVal:eleValue,chgDetailOptTarget:chgDetailOptTarget, chgDetailOptType:chgDetailOptType, chgDetailCommonCd:chgDetailCommonCd, modifySetCd:modifySetCd, optFlowId: optFlowId});
					
					//hidden인경우 String, 배포계획, 사용자 제외, optType이 단순 값 전송인경우
					if(chgDetailOptType != "05" && chgDetailOptType != "03" && element.type == "hidden" || chgDetailOptType == -1){
						rtnVal = eleValue;
					}
					
					fd.append(elemKey, rtnVal);
				});
				
			}catch(error){console.log(error)}
		}
		return fd;
	}
	
	/**
	 * function 명 	: $.osl.continueStrChk
	 * function 설명	: 입력된 문자열에 연속된 문자(123, abc 등)가 있는지 체크한다.
	 * 
	 * @param	str: 입력 문자열
	 * @param	limit: 연속된 문자열 자리수, 3입력시 123, abc등 3자리 연속된 문자열 체크
	 * @returns 연속된 문자열 체크 결과(boolean)
	 */
	$.osl.continueStrChk = function(str, limit){
		var char1, char2, char3, char4 = 0;

		for (var i = 0; i < str.length; i++) {
			var inputChar = str.charCodeAt(i);

			if (i > 0 && (char3 = char1 - inputChar) > -2 && char3 < 2 && (char4 = char3 == char2 ? char4 + 1 : 0) > limit - 3){
				return false;
			}	
			char2 = char3;
			char1 = inputChar;
		}
		return true;
	}
	
	/**
	 * function 명 	: $.osl.datetimeAgo
	 * function 설명	: 현재 시간 기준으로 입력된 시간이 얼마나 경과됬는지를 반환한다.
	 * 
	 * @param	paramDatetime: 입력 문자열
	 * @param	option: 반환 설정 값
	 * 
	 * 	returnTime: 반환 시간 기준 (입력된 기준 시간 값을 반환한다 m - 90분 전, s - 5100초 전)
	 * 			(y - 연도, M - 월, d - 일, h - 시간, m - 분, s - 초)
	 * 			- returnTime 선언시 fullTime 무시
	 * 
	 * 	fullTime: 전체 시간 반환 기준 (입력된 기준 시간이 0보다 큰 경우 전체 시간 값을 반환한다 M이 1개월 이상인경우 "yyyy-MM-dd HH:mm:ss"로 반환)
	 * 			$.osl.datetimeAgo(timestamp, M) -> month : 1인 경우 "yyyy-MM-dd HH:mm:ss"로 반환
	 * 			(y - 연도, M - 월, d - 일, h - 시간, m - 분, s - 초)
	 * 	returnFormat: 시간값 출력 포맷 기준 (기본값: yyyy-MM-dd HH:mm:ss)
	 * @returns 
	 */
	$.osl.datetimeAgo = function(paramDatetime, options){
		var today = new Date();
		var agoTime = new Date() - paramDatetime;
		
		var formatDate = new Date(paramDatetime).format("yyyy-MM-dd HH:mm:ss");
		
		//포맷 타입 설정있는 경우
		if(options.hasOwnProperty("returnFormat")){
			formatDate = new Date(paramDatetime).format(options.returnFormat);
		}
		
		if(!$.osl.isNull(agoTime) && agoTime > 0){
			agoTime = agoTime/1000;
			
			//시간 기준
			var min = 60;
			var hour = (60*min);
			var day = (24*day); 
			
			//경과 초,분,시,일
			var secAgo = parseInt(agoTime);
			var minAgo = Math.floor((agoTime/60));
			var hourAgo = Math.floor((agoTime/(60*60)));
			var dayAgo = Math.floor((agoTime/(60*60*24)));
			
			//몇개월 전
			var agoMonth = new Date(paramDatetime).getMonth();
			var todayMonth = today.getMonth();
			var monthAgo = new Date(new Date().setMonth(todayMonth-agoMonth)).getMonth();
			
			//몇년 전
			var yearAgo = Math.floor(dayAgo/365);
			
			//배열 순서
			var agoTimeStr = ["y","M","d","h","m","s"];
			var agoTimeArr = [yearAgo, monthAgo, dayAgo, hourAgo, minAgo, secAgo];

			//문구 세팅
			var suffixAgo = $.osl.lang("date.agoTime.suffixAgo");
			var agoString = formatDate;
			
			//반환 시간 기준
			if(!$.osl.isNull(options) && options.hasOwnProperty("returnTime")){
				var searchIdx = agoTimeStr.indexOf(options.returnTime);
				if(searchIdx > 0 && agoTimeArr[searchIdx] > 0){
					agoString = $.osl.lang("date.agoTime."+agoTimeStr[searchIdx],agoTimeArr[searchIdx])+" "+suffixAgo;
				}
			}else{
				$.each(agoTimeArr, function(idx, map){
					if(map > 0){
						//전체 시간 반환 기준
						if(!$.osl.isNull(options) && options.hasOwnProperty("fullTime")){
							var searchIdx = agoTimeStr.indexOf(options.fullTime);
							
							//입력 값이 배열에 존재하는지 체크
							if(!$.osl.isNull(searchIdx) && searchIdx >= 0){
								//해당 기준과 큰 값은 전체 출력
								if(searchIdx >= idx){
									agoString = formatDate;
									return false;
								}else{ //작은 값인경우 변환 출력
									agoString = $.osl.lang("date.agoTime."+agoTimeStr[idx],map)+" "+suffixAgo;
									return false;
								}
							}
						}
						//해당 기간 변환
						agoString = $.osl.lang("date.agoTime."+agoTimeStr[idx],map)+" "+suffixAgo;
						return false;
					}
				});
			}
		
			
			return {
				sec: secAgo,
				min: minAgo,
				hour: hourAgo,
				day: dayAgo,
				month: monthAgo,
				year: yearAgo,
				formatDate: formatDate,
				agoString: agoString
			};
		}
		return {
			sec: 0,
			min: 0,
			hour: 0,
			day: 0,
			month: 0,
			year: 0,
			formatDate: formatDate,
			agoString: formatDate
		};
	}
}));


$(document).ready(function() {
	$.osl.init().done(function(){
		$.osl.isReady = true;
	});
});



