<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/lunaops/top/header.jsp" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />

<link rel="stylesheet" href="<c:url value='/css/oslops/adm.css'/>" >
<script src="<c:url value='/js/common/layerPopup.js'/>" ></script>
<style>
img.ui-datepicker-trigger {margin-bottom: 7px; }
.spr_pop_text { width: 130px; height: 28px; border: 1px solid #ccc; }
</style>

<script type="text/javascript">
	var mySearch, firstGrid;
	var Grid  = {
			init : function() {
				//엔터키 검색
				gfnEnterAction2("fnMovePageLink(1)","loginUsrNm","loginIp","loginUsrId","licGrpId");
				
				//그리드 및 검색 상자 호출
				fnSearchBoxControl(); // Search Grid 초기화 설정
				fnAxGrid5View();  // Grid 초기화  설정
			}
		   , columnOption : {
				 adm5000View :  [
		            {key: "rn", label: "번호", width: 70, align: "center"}
		            ,{key: "loginUsrId",label: "사용자 ID", width: 200, align: "center"}
		            ,{key: "licGrpId",label: "라이선스 그룹 ID", width: 200, align: "center"}
		            ,{key: "usrNm", label: "사용자 명", width: 200, align: "center"}
		            ,{key: "loginIp", label: "IP", width: 200, align: "center"}
		            ,{key: "loginTime", label: "로그인 일시", width: 200, align: "center"}
		            ,{key: "logoutTime", label: "로그아웃 일시", width: 200, align: "center"}
		            ,{key: "loginStatus", label: "로그인 성공여부", width: 169, align: "center"}
				]
				,adm5000Search : [
                     {optionValue:"rn", 		optionText:"전체 보기", 	optionAll:true }
                    ,{optionValue:"usrNm", 		optionText:'사용자 명'}
                    ,{optionValue:"loginIp", 	optionText:"사용자 IP"}
                    ,{optionValue:"usrId", 		optionText:"사용자 ID"}
    			]
			}
	}
	

	//axisj5 그리드
	function fnAxGrid5View(){
		firstGrid = new ax5.ui.grid();
	            firstGrid.setConfig({
		            target: $('[data-ax5grid="first-grid"]'),
		            sortable:false,
		            header: {align:"center"},
		            columns: Grid.columnOption.adm5000View,
		            body: {
		                align: "center",
		                columnHeight: 30
		            },
		            page: {
		                navigationItemCount: 9,
		                height: 30,
		                display: true,
		                firstIcon: '<i class="fa fa-step-backward" aria-hidden="true"></i>',
		                prevIcon: '<i class="fa fa-caret-left" aria-hidden="true"></i>',
		                nextIcon: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
		                lastIcon: '<i class="fa fa-step-forward" aria-hidden="true"></i>',
		                onChange: function () {
		                   fnInGridListSet(this.page.selectPage,mySearch.getParam());
		                }
		            }
		        });

	}
	//그리드 데이터 넣는 함수
	function fnInGridListSet(_pageNo,ajaxParam){
	     	/* 그리드 데이터 가져오기 */
	     	//파라미터 세팅
			if(gfnIsNull(ajaxParam)){
				ajaxParam = $('form#searchFrm').serialize();
			}
	     	//페이지 세팅
	     	if(!gfnIsNull(_pageNo)){
	     		ajaxParam += "&pageNo="+_pageNo;
	     	}else if(typeof firstGrid.page.currentPage != "undefined"){
	     		ajaxParam += "&pageNo="+firstGrid.page.currentPage;
	     	}
	     	
	     	//AJAX 설정
			var ajaxObj = new gfnAjaxRequestAction(
					{"url":"<c:url value='/adm/adm5000/adm5000/selectAdm5000ListAjax.do'/>","loadingShow":true}
					,ajaxParam);
			//AJAX 전송 성공 함수
			ajaxObj.setFnSuccess(function(data){
				data = JSON.parse(data);
				var list = data.list;
				var page = data.page;

			   	firstGrid.setData({
			             	list:list,
			             	page: {
			                  currentPage: _pageNo || 0,
			                  pageSize: page.pageSize,
			                  totalElements: page.totalElements,
			                  totalPages: page.totalPages
			              }
			             });
			});
			
			//AJAX 전송 오류 함수
			ajaxObj.setFnError(function(xhr, status, err){
				//세션이 만료된 경우 로그인 페이지로 이동
	           	if(status == "999"){
	           		alert('세션이 만료되어 로그인 페이지로 이동합니다.');
	        		document.location.href="<c:url value='/cmm/cmm4000/cmm4000/selectCmm4000View.do'/>";
	        		return;
	           	}
			});
			
			//AJAX 전송
			ajaxObj.send();
	}


	//검색 상자
	function fnSearchBoxControl(){
		var pageID = "AXSearch";
		mySearch = new AXSearch();
		// 현재일과 현재일 기준 한달전 날짜 기본세팅
		var defaultStDt = new Date().format('yyyy-MM-dd');
		var defaultEndDt = new Date().format('yyyy-MM-dd');
		
		var fnObjSearch = {
			pageStart: function(){
				//검색도구 설정 01 ---------------------------------------------------------
				mySearch.setConfig({
					targetID:"AXSearchTarget",
					theme : "AXSearch",
					rows:[
						{display:true, addClass:"", style:"", list:[
							{label:"<i class='fa fa-search'></i>&nbsp;", labelWidth:"50", type:"selectBox", width:"", key:"searchSelect", addClass:"", valueBoxStyle:"", value:"all",
								options: Grid.columnOption.adm5000Search,
								onChange: function(selectedObject, value){
	                            	//선택 값이 전체목록인지 확인 후 입력 상자를 readonly처리
	    							if(!gfnIsNull(selectedObject.optionAll) && selectedObject.optionAll == true){
										axdom("#" + mySearch.getItemId("searchTxt")).attr("readonly", "readonly");	
										axdom("#" + mySearch.getItemId("searchTxt")).val('');	
									}else{
										axdom("#" + mySearch.getItemId("searchTxt")).removeAttr("readonly");
									}
									
									//공통코드 처리 후 select box 세팅이 필요한 경우 사용
									if(!gfnIsNull(selectedObject.optionCommonCode)){
										gfnCommonSetting(mySearch,selectedObject.optionCommonCode,"searchCd","searchTxt");
										
									}else{
										//공통코드 처리(추가 selectbox 작업이 아닌 경우 type=text를 나타낸다.)
										axdom("#" + mySearch.getItemId("searchTxt")).show();
										axdom("#" + mySearch.getItemId("searchCd")).hide();
									}
	    						}
							},
							{label:"", labelWidth:"", type:"inputText", width:"150", key:"searchTxt", addClass:"secondItem sendBtn", valueBoxStyle:"padding-left:0px;", value:"",
								onkeyup:function(e){
									if(e.keyCode == '13' ){
										axdom("#" + mySearch.getItemId("btn_search_login")).click();
									}
								}
							},
							{label:"", labelWidth:"", type:"selectBox", width:"100", key:"searchCd", addClass:"selectBox", valueBoxStyle:"padding-left:0px;", value:"01",
								options:[]
							},
							{label : "시작일",labelWidth : "70",type : "inputText",width : "150",key : "srchFromDt",addClass : "secondItem sendBtn",valueBoxStyle : "",value : defaultStDt,
							},
							{label : "종료일",labelWidth : "70",type : "inputText",width : "150",key : "srchToDt",addClass : "secondItem sendBtn",valueBoxStyle : "",value : defaultEndDt,
							},
							{label:"&nbsp;<i class='fas fa-list-ol'></i>&nbsp;목록 수&nbsp;", labelWidth:"60", type:"selectBox", width:"", key:"pageSize", addClass:"", valueBoxStyle:"padding-left:7px;", value:"30",
									options:[
												{optionValue:15, optionText:"15"},
												{optionValue:30, optionText:"30"},
												{optionValue:50, optionText:"50"},
												{optionValue:100, optionText:"100"},
												{optionValue:300, optionText:"300"},
												{optionValue:600, optionText:"600"},
												{optionValue:1000, optionText:"1000"},
												{optionValue:5000, optionText:"5000"},
												{optionValue:10000, optionText:"10000"}
				                                
				                            ],onChange: function(selectedObject, value){
				                            	// 목록 수 변경 시 검색 파라미터를 같이 넘겨준다.
				                            	fnInGridListSet(0,$('form#searchFrm').serialize()+"&"+mySearch.getParam());
				    						}
							},
							{label:"<i class='fas fa-arrows-alt-v'></i>&nbsp;목록 높이&nbsp;", labelWidth:"60", type:"selectBox", width:"", key:"gridHeight", addClass:"", valueBoxStyle:"", value:"600",
								options:[
								         	{optionValue:300, optionText:"300px"},
			                                {optionValue:600, optionText:"600px"},
			                                {optionValue:1000, optionText:"1000px"},
			                                {optionValue:1200, optionText:"1200px"},
			                                {optionValue:2000, optionText:"2000px"},
			                                
			                            ],onChange: function(selectedObject, value){
			                            	firstGrid.setHeight(value);
			    						}
							},
	       					{label:"", labelWidth:"", type:"button", width:"70", key:"btn_print_newReqDemand",style:"float:right;",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-print' aria-hidden='true'></i>&nbsp;<span>프린트</span>",
           						onclick:function(){
           							$(firstGrid.exportExcel()).printThis({importCSS: false,importStyle: false,loadCSS: "/css/common/printThis.css"});
           						}},
							{label:"", labelWidth:"", type:"button", width:"55", key:"btn_excel_newReqDemand",style:"float:right;",valueBoxStyle:"padding:5px;", value:"<i class='fa fa-file-excel' aria-hidden='true'></i>&nbsp;<span>엑셀</span>",
	       						onclick:function(){
	       							firstGrid.exportExcel("${sessionScope.selMenuNm}.xls");
	       						}},
							{label:"", labelWidth:"", type:"button", width:"55", key:"btn_search_login",style:"float:right;", valueBoxStyle:"padding:5px;", value:"<i class='fa fa-list' aria-hidden='true'></i>&nbsp;<span>조회</span>",
							onclick:function(){					
								/* 검색 조건 설정 후 reload */
	 							var pars = mySearch.getParam();
							    var ajaxParam = $('form#searchFrm').serialize();
							    if(!gfnIsNull(pars)){
							    	ajaxParam += "&"+pars;
							    }
							    
							    fnInGridListSet(0,ajaxParam);
							    
					             //폼 값 변경
					            $('#searchSelect').val(axdom("#" + mySearch.getItemId("searchSelect")).val());
								$('#searchCd').val(axdom("#" + mySearch.getItemId("searchCd")).val());
								$('#searchTxt').val(axdom("#" + mySearch.getItemId("searchTxt")).val());
							}}
						]}
					]
				});
			}
		};
		
		jQuery(document.body).ready(function(){
			fnObjSearch.pageStart();
			//검색 상자 로드 후 텍스트 입력 폼 readonly 처리
			axdom("#" + mySearch.getItemId("searchTxt")).attr("readonly", "readonly");
			
			//공통코드 selectBox hide 처리
			axdom("#" + mySearch.getItemId("searchCd")).hide();
			
			//버튼 권한 확인
			fnBtnAuthCheck(mySearch);

			//기간 검색 달기
			gfnCalRangeSet(mySearch.getItemId("srchFromDt"), mySearch.getItemId("srchToDt"));

			//그리드 검색 호출
			var pars = mySearch.getParam();
			fnInGridListSet(0,pars);
		});
		
	}
	
	$(document).ready(function() {
		Grid.init(); // AXISJ Grid 초기화 실행 부분들
	});
	
</script>

<div class="main_contents" style="height: auto;">
		<div class="tab_title">${sessionScope.selMenuNm }</div>
		<div class="tab_contents menu"  style="max-width:1500px;">
			<form:form commandName="adm5000VO" id="searchFrm" name="searchFrm" method="post" onsubmit="return false"></form:form>
			<form:form commandName="adm5000VO" id="excelForm" name="excelForm" method="post" onsubmit="return false;">
                        <input path="searchTxt" type="hidden" id="searchTxt" name="searchTxt"/>
                        <input path="searchCd" type="hidden" id="searchCd" name="searchCd"/>
                        <input path="searchSelect" type="hidden" id="searchSelect" name="searchSelect"/>
                </form:form>
			<div id="AXSearchTarget" style="border-top:1px solid #ccc;"></div>
			<br />
			<div data-ax5grid="first-grid" data-ax5grid-config="{}" style="height: 600px;"></div>
		</div>
</div>		

<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />