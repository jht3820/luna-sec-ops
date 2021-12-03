
var OSLCoreLangSetting = function () {
	
	var lang = {};
	
	lang["ko"] = {
		fromValidate:{
			messages: {
				required: "필수 값 입니다.",
				remote: "값을 수정해주세요.",
				email: "유효한 이메일 주소를 입력해주세요.",
				url: "유효한 URL을 입력해주세요.",
				date: "유효한 날짜를 입력해주세요.",
				dateISO: "유효한 날짜를 입력해주세요. (ISO)",
				number: "유효한 번호를 입력해주세요.",
				digits: "숫자만 입력 가능합니다.",
				equalTo: "값을 다시 입력해주세요. (값이 동일하지 않음)",
				maxlength: "{0}자 이하로 입력해주세요.",
				minlength: "최소 {0}자 이상 입력해주세요.",
				rangelength: "{0}에서 {1}자 사이에 값을 입력해주세요.",
				range: "{0}에서 {1}사이의 값을 입력해주세요.",
				max: "{0} 보다 작거나 같은 값을 입력해주세요..",
				min: "{0} 보다 크거나 같은 값을 입력해주세요..",
				step: "{0}의 배수를 입력해주세요.",
				regexstr: "입력 값이 형식에 맞지 않습니다."
			}
		},
		modal:{
			close: "닫기",
			insert:{
				saveBtnString: "등록 완료"
			},
			update:{
				saveBtnString: "수정 완료"
			}
		},
		portlet:{
			tools: {
				toggle: {
					collapse: '접기',
					expand: '펼치기'
				},
				reload: '새로 고침',
				remove: '제거'
			}
		},
		process:{
			menu:{
				update: "수정",
				delete: "삭제",
				detail: "상세정보"
			}
		},
		tree:{
			label:{
				contextmenu:{
					allNodeOpen:"전체 펼치기",
					allNodeClose:"전체 접기",
					selNodeOpen:"선택 펼치기",
					selNodeClose:"선택 접기"
				}
			},
			search:{
				title: "검색",
				placeholder: "입력 후 엔터 키를 입력해주세요"
			},
			error:{
				handler:"트리 메뉴 제어 중 오류가 발생했습니다."
			}
		},
		file:{
			fileCnt:"${1}개의 파일",
			error:{
				downloadWait: "파일 데이터를 세팅중입니다. </br>다시 시도해주세요.",
				fileReadonly: "업로드가 불가능합니다."
			}
		},
		datatable:{
			button:{
				select: "조회",
				insert: "추가",
				update: "수정",
				delete: "삭제",
				redo: "복구",
				recordDelete: "완전삭제",
				prev: "돌아가기"
			},
			action:{
				functionNm: "기능 버튼",
				update:{
					nonSelect: "수정하려는 데이터를 선택해주세요",
					manySelect: "1건의 데이터만 선택해주세요.</br> ${1}건의 데이터가 선택되었습니다."
				},
				delete:{
					nonSelect:"삭제하려는 데이터를 선택해주세요",
					confirm: "${1}건의 데이터를 삭제하시겠습니까?"
				},
				dblClick:{
					nonSelect:"데이터를 선택해주세요",
					manySelect: "1건의 데이터만 선택해주세요.</br> ${1}건의 데이터가 선택되었습니다."
				}
			},
			translate:{
				records:{
					processing: "데이터 조회 중 입니다.",
					noRecords: "데이터가 없습니다.",
					nonSelect: "선택된 데이터가 없습니다.",
				},
				toolbar:{
					pagination:{
						items:{
							first: "처음",
							prev: "이전",
							next: "다음",
							last: "마지막",
							more: "더 보기",
							input: "페이지 번호",
							select: "목록 크기",
							info: "현재 {{start}} - {{end}} / {{total}} 건"
						}
					}
				}
			},
			search:{
				title: "검색",
				placeholder: "검색어를 입력해주세요",
				allTitle: "전체"
			},
			sort:{
				fieldNotMatch: "잘못된 정렬 데이터입니다."
			}
		},
		date:{
			datepicker:{
				days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
				daysShort: ["일", "월", "화", "수", "목", "금", "토"],
				daysMin: ["일", "월", "화", "수", "목", "금", "토"],
				months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				today: "오늘",
				monthsTitle: "일자 선택",
				clear: "다시 선택",
				weekStart: 0,
				format: "yyyy-mm-dd",
			},
			moment:{
				months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				monthsShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		        monthsParseExact : true,
		        weekdays : ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
		        weekdaysShort : ["일", "월", "화", "수", "목", "금", "토"],
		        weekdaysMin : ["일", "월", "화", "수", "목", "금", "토"],
		        weekdaysParseExact : true,
		        longDateFormat : {
		            LT : 'HH:mm',
		            LTS : 'HH:mm:ss',
		            L : 'YYYY-MM-DD',
		            LL : 'YYYY MMMM D',
		            LLL : 'YYYY MMMM D HH:mm',
		            LLLL : 'YYYY MMMM D dddd HH:mm'
		        },
		        calendar : {
		            sameDay : '오늘',
		            nextDay : '다음',
		            nextWeek : '다음 주',
		            lastDay : '어제',
		            lastWeek : '마지막 주',
		            sameElse : ''
		        },
		        relativeTime : {
		            future : 'dans %s',
		            past : 'il y a %s',
		            s : '초',
		            ss : '%d 초',
		            m : '분',
		            mm : '%d 분',
		            h : '시',
		            hh : '%d 시',
		            d : '일',
		            dd : '%d 일',
		            M : '월',
		            MM : '%d 월',
		            y : '년',
		            yy : '%d 년'
		        },
		        dayOfMonthOrdinalParse: /\d{1,2}(er|)/,
		        week : {
		            dow : 0,
		            doy : 4  
								
		        }
		    },
		    agoTime:{
				suffixAgo: "전",
				justNow: "방금",
				s : "${1}초",
	            m : "${1}분",
	            h : "${1}시간",
	            d : "${1}일",
	            M : "${1}개월",
	            y : "${1}년",
			}
		},
		common:{
			logout:{
				confirm:"로그아웃 하시겠습니까?",
				button:"로그 아웃"
			},
			user:{
				pwChange:"",
				validate:{
					usrId: "아이디를 입력해주세요.",
					usrPw: "비밀번호를 입력해주세요.",
					usrPwIndexOfUsrId: "비밀번호에는 사용자 아이디를 포함할 수 없습니다.",
					usrPwContinue: "비밀번호는 같은 문자를 3번 이상 연속해서</br> 사용하실 수 없습니다.",
					usrPwContinueMatch: "비밀번호는 연속된 문자열(123, abc 등)을</br> ${1}자 이상 사용 할 수 없습니다.",
				},
				myPage:{
					title:"개인정보 수정",
					error:"사용자 정보가 없으므로 개인정보 수정 화면으로 이동할 수 없습니다."
				},
				auth:{
					saveMsg: "${1}명의 사용자가 배정되었습니다.",
					saveDupleMsg: "이미 배정된 ${1}명의 사용자 제외",
					saveAllDupleMsg: "이미 배정중인 사용자입니다. (${1}명)",
					allUsrInsert:"${1}건의 사용자를 배정하시겠습니까?",
					allUsrInDelete:"${1}건의 사용자를 배정 제외하시겠습니까?"
				},
			},
			error:{
				sessionInvalid:"세션이 만료되어 로그인 페이지로 이동합니다.",
				nonAuth:"해당 요청의 권한이 없습니다.",
				popup:"팝업 페이지에서 오류가 발생했습니다.",
				modalDuple: "해당 기능 팝업은 중복으로 동작 할 수 없습니다."
			},
			menu:{
				top: "최상위",
				upper: "상위",
				name: "메뉴 명",
			},
			name:{
				prjGrp: "그룹 명",
				prj: "프로젝트 명",
				authGrp: "권한그룹 명",
				all: "전체",
				select: "선택"
			},
			alert:{
				title: "알림",
				ok: "확인",
				cancel: "취소"
			},
			modal:{
				closeAlert: "팝업 창을 닫으시겠습니까?"
			}
		},
		
		arm1000:{
			label:{
				title : "MESSAGE",
				get : "받은 메시지",
				send: "보낸 메시지",
				alone: "나에게 보낸 메시지"
			},
			button :{
				tooltip : {
					selectBtn : "메시지 조회",
					insertBtn : "메시지 보내기",
					reInsertBtn : "메시지 답장",
					checkBtn : "메시지 읽음 처리",
					deleteBtn : "메시지 삭제",
					dblClickBtn :"메시지 상세 조회",
				},
				detailBtn : "상세",
				reInsertBtn : "답장",
				checkBtn : "읽음",
			},
			
			field: {
				sendUsrId : "보낸 사람 ID",
				sendUsrEmail : "보낸 사람 e-mail",
				usrNm : "받는 사람",
				usrId : "받는 사람 ID",
				usrEmail :"받는 사람 e-mail",
				armContent : "내용"
			},
			actionBtn : {
				title : "삭제 / 상세 / 답장",
				insertTitle : "메시지 쓰기",
				reInsertTitle :"메시지 답장",
				dblClickTitle : "메시지 상세",
			},
			alert :{
				message : {
					selectMessage : "답장할 메시지를 선택하세요.",
					selectOneMessage : "1개의 메시지만 선택하세요. </br>${1}개의 메시지가 선택되었습니다.",
				}
			}
		},
		arm1001:{
			label : {
				to : "받는 사람",
				title : "제목",
				content : "내용",
				attachments: "파일 첨부", 
			},
			placeholder :{
				title : "제목",
				content : "내용",
				select2 : "선택 또는 입력"
			},
			message :{
				inputToUser : "받는 사람을 입력하세요.",
				send : "메시지를 보내시겠습니까?",
			},
			button : {
				submit : "보내기"
			}
		},
		arm1002 : {
			label : {
				title : "제목",
				content : "내용",
				attachments: "첨부 파일", 
			},
			button : {
				reSend : "답장"
			},
			title :"메시지 답장"
		},
		cmm6401:{
			field: {
				
				usrNm : "사용자명",
			},
			actionBtn : {
				title : "선택",
				clickBtn : "선택",
			},
		},
		cmm6206:{
			title: "요구사항 선택"
		},
		dpl1001:{
			label:{
				dplStatus : "배포 상태",
				dplVersion : "배포 버전",
				dplName : "배포 명",
				dplDate: "배포 일자",
				dplUser : "배포자",
				dplSignUse : "결재 사용 유무",
				dplRevisionNum : "배포 리비전",
				dplType : "배포 방법",
				dplFailAction : "실패 후 처리",
				dplAutoTime : "자동 실행 시간",
				dplRestoreType : "원복 타입",
				dplSignText : "결재 요청 의견",
				dplDesc : "배포 설명",
				autoTimeCompl : "적용",
				autoTimeCancel : "취소"	
			},
			button:{
				searchBtn : "검색",
				insertBtn : "작성 완료",
				updateBtn : "수정 완료",
				deleteBtn : "삭제",
				upMoveBtn : "위로",
				downMoveBtn : "아래로",
				assignBtn : "배정"
			},
			tooltip:{
				upMoveBtnTooltip : "JOB 순서 위로",
				downMoveBtnTooltip : "JOB 순서 아래로",
				deleteBtnTooltip : "배정 JOB 삭제",
				assignBtnTooltip : "JOB 배정"
			},
			modal:{
				title:{
					dplUserSelect : "배포자 선택",
					dplJobAssign : "JOB 배정",
				}
			},
			message:{
				confirm:{
					insert:"신규 JENKINS를 등록하시겠습니까?",
					update:"JENKINS 정보를 수정하시겠습니까?"
				},
				alert:{
					delJob : "삭제할 JOB에 체크해주세요.",
					jobAssign : "배포 계획에 배정된 JOB이 없습니다. JOB을 배정해주세요.",
					jobMove : "이동할 JOB을 선택해 주세요.",
					selectOneJob : "1개의 JOB만 선택하세요."
				},
				warning:{
					notDplUsr : "배포자를 검색하여 입력해주세요."
				}
			}
		},
		dpl1100:{
			title : {
				deploy : "배포계획 목록",
				assignment : "요구사항 배정 목록",
				unassigned : "요구사항 미배정 목록",
			},
			button:{
				removeBtn: "제외",
				addBtn:"배정"
			},
			actionBtn :{
				title :{
					selectBtn : "선택",
					removeBtn :"제외",
					addBtn :"배정",
					dplSelect : "배포계획 조회",
					assSelect : "요구사항 배정 조회",
					nonSelect : "요구사항 미배정 조회",
				},
				tooltip :{
					clickToolTip : "배포계획 선택",
					removeToolTip :"요구사항 배정 제외",
					addToolTip :"요구사항 배정",
				},
			},
			message : {
				alert:{
					notAssignedReq : "배포 상태가 대기인 배포 계획에만 요구사항 배정을 할 수 있습니다."
				}
			}
		},
		dpl2000:{
			modal : {
				title : {
					dplDetail : "[${1}] 상세정보"
				}
			}
		},
		dpl2100:{
			modal : {
				title : {
					signAprRes : "결재 의견",
					signRjtRes : "반려 사유",
					dplDetail : "[${1}] 상세정보"
				}
			},
			action : {
				sign : {
					nonSelect : "결재하려는 데이터를 선택해주세요."
				}
			},
			message : {
				confirm : {
					signApr : "결재 승인 하시겠습니까?",
					signRjt : "결재 반려 하시겠습니까?"
				}
			}
		},
		dpl4000:{
			dpl:{
				title: "배포 계획 목록",
				button:{
					tooltip:{
						selectTooltip: "배포 계획 조회",
						detailTooltip : "배포 계획 상세"
					},
					detailBtn : "상세"
				},
				addSearch : {
					"dplDesc" : "배포 설명",
				},
				actionBtn : {
					title : "기능 버튼",
					tooltip : {
						detailTooltip : "배포 계획 상세 보기",
					},
					modalTitle : "[${1}] 상세 정보"
				}
			},
			req:{
				title: "요구사항 배정 목록",
				button:{
					tooltip:{
						selectTooltip: "배정 요구사항 조회",
						detailTooltip : "요구사항 상세"
					},
					detailBtn : "상세"
				},
				actionBtn : {
					title : "기능 버튼",
					tooltip : {
						detailTooltip : "요구사항 상세 보기",
					},
					modalTitle : "[${1}] 요구사항 상세 정보"
				}
			},
			job:{
				title: "JOB 배정 목록",
				button:{
					tooltip:{
						selectTooltip: "배정 JOB 조회",
						detailTooltip : "JOB 상세"
					},
					detailBtn : "상세"
				},
				actionBtn : {
					title : "기능 버튼",
					tooltip : {
						detailTooltip : "JOB 상세 보기",
					},
					modalTitle : "JOB 상세 정보"
				}
			},
			message : {
				selectOneDpl : "${1}건의 배포 계획이 선택되었습니다. </br>1건의 배포 계획 정보를 선택하세요.",
				selectOneReq : "${1}건의 요구사항이 선택되었습니다. </br>1건의 요구사항 정보를 선택하세요.",
				selectOneJob : "${1}건의 JOB이 선택되었습니다. </br>1건의 JOB 정보를 선택하세요.",
			}
		},
		cmm6000:{
			title:{
				mainPrjSetting:"메인프로젝트 설정",
				searchPrj:"프로젝트 검색",
			},
			field: {
				
				prjNm : "프로젝트 명",
				
			},
			actionBtn : {
				title : "선택",
				clickBtn : "선택",
			},
		},
		cmm6600:{
			label : {
				signAuth : "결재 권한",
				sign : "결재",
				subSign : "대결",
				allSign : "전결",
				title : {
					usrList : "사용자 목록",
					signLineInfo : "결재선 정보" 
				}
			},
			button : {
				upMove : "위로",
				downMove : "아래로",
				saveSignLine : "결재선 저장"
			},
			message : {
				alert : {
					notRgsSignUsr : "등록된 결재자가 없습니다.",
					treeSelect : "선택된 사용자가 없습니다.",
					notSelSignUsr : "선택된 결재자가 없습니다."
				},
				confirm : {
					saveString : "결재선 정보를 저장 하시겠습니까?"
				}
			},
			modal : {
				title : {
					reqSignLine : "결재선 지정",
					
				}
			}
		},
		cmm6601:{
			infomation : {
				cannotUpdate : "결재 대기 파일이 존재할 경우 결재선을 수정할 수 없습니다."
			},
			sign : {
				success : "결재 성공",
				fail : "결재 실패"
			}
		
		},
		cmm6602:{
			label : {
				signApr : "결재 의견",
				signRjt : "반려 사유"
			},
			button : {
				signApr : "결재 승인",
				signRjt : "결재 반려"
			},
			message : {
				alert:{
					notSignOrd : "결재 순서가 아닙니다.",
					notEnterAprRes : "결재 사유를 입력해주세요.",
					notEnterRjtRes : "반려 사유를 입력해주세요.",
				}
			}
		},
		cmm6600:{
			label:{
				actionBtn:"선택",
				selDropDownMenu:"배포 명"
			},
			tooltip:{
				click:"배포 계획 선택"
			}
		},
		cmm6800 :{
			title :{
				revision : "리비전 목록",
				file :"파일 목록",
				actionTitle : {
					revisionFile : "상세",
					repository : "선택",
				},
			},
			label : {
				revisionNum : "리비전 번호",
			},
			revisionFile : {
				actionTitle : "선택",
				actionTooltip : {
					dblClickTooltip : "파일 소스보기",
					diffTooltip : "파일 비교"
				},
				message : {
					selectOne : "${1}개가 선택되었습니다. </br>한개의 파일만 선택하세요."
				}
			},
			repository:{
				actionTooltip : {
					chooseTooltip : "리비전 선택",
				}
			},
			dirTree:{
				message:{
					selectRevision : "리비전을 선택하세요.",
				}
			},
			placeholder : {
				revision : {
					start : "시작",
					end : "종료",
				}
			},
			actionBtn:{
				selectTooltip :"리비전 조회",
				selectFileTooltip : "리비전 파일 목록 조회",
				chooseTooltip : "리비전 선택 완료",
				chooseBtn : "선택 완료",
				detailTooltip : "소스보기",
				detailBtn : "상세",
				diffTooltip : "파일 비교",
				diffBtn : "DIFF"
			},
			message :{
				selectRevision : "리비전을 선택하세요.",
				auth: "접근 권한이 없습니다."
			}
		},
		cmm6801:{
			message :{
				selectRevision : "리비전을 선택하세요.",
				auth: "접근 권한이 없습니다."
			}
		},
		prj1400:{
			startDate: "시작일",
			endDate: "종료일",
			completedRatio: "진척률",
			projectCnt: "등록 프로젝트",
			requestAll: "전체 요구사항",
			requestInProgress: "진행 중",
			requestDone: "최종 완료",
			menu:{
				modify: "수정",
				trashMove: "휴지통 이동(삭제)",
				projectListMove: "프로젝트 목록 이동",
				createProject: "신규 프로젝트 추가",
				projectDetail: "상세 정보",
				recordDelete: "완전 삭제",
				projectRedo: "프로젝트 그룹 복구"
			},
			button:{
				title:{
					insert: "신규 프로젝트 그룹 등록",
					update: "프로젝트 그룹 수정",
					delete: "프로젝트 그룹 휴지통 이동(삭제)",
					trash: "프로젝트 그룹 휴지통 목록",
					redo: "프로젝트 그룹 복구",
					recordDelete: "프로젝트 그룹 완전 삭제",
					prev: "프로젝트 목록으로 이동"
				}
			},
			confirm:{
				prjGrpRedo: "${1}건의 프로젝트 그룹을 복구하시겠습니까?",
				prjGrpDelete: "${1}건의 프로젝트 그룹을 완전 삭제하시겠습니까?</br>삭제된 프로젝트 그룹은 복구 할 수 없습니다."
			},
			datatable:{
				action:{
					dblClick: "상세 정보",
					update: "프로젝트 그룹 수정",
					delete: "프로젝트 그룹 삭제"
				}
			}
		},
		prj1000:{
			startDate: "시작일",
			endDate: "종료일",
			completedRatio: "진척률",
			requestAll: "전체",
			requestInProgress: "진행 중",
			requestDone: "완료",
			menu:{
				modify: "수정",
				trashMove: "휴지통 이동(삭제)",
				projectDetail: "상세 정보",
				recordDelete: "완전 삭제",
				projectRedo: "프로젝트 복구"
			},
			confirm:{
				prjRedo: "${1}건의 프로젝트를 복구하시겠습니까?",
				prjDelete: "${1}건의 프로젝트를 완전 삭제하시겠습니까?</br>삭제된 프로젝트는 복구 할 수 없습니다."
			}
		},
		prj1001:{
			complete: "완료",
			insert:{
				title: "신규 프로젝트 생성",
				saveString: "신규 프로젝트를 생성하시겠습니까?",
				saveBtnString: "등록 완료",
				saveMsg: "${1}명의 사용자가 배정되었습니다.",
				saveDupleMsg: "이미 배정된 ${1}명의 사용자 제외",
				saveAllDupleMsg: "이미 배정중인 사용자입니다. (${1}명)"
			},
			update:{
				title: "프로젝트 수정",
				saveString: "프로젝트를 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			}
		},
		prj1100:{
			alert:{
				linkLimitLoop: "작업 흐름(단계)는 반복 진행될 수 없습니다.</br> A -> B -> A 불가",
				selNoneProcess: "프로세스를 선택 하세요.",
				selNoneFlow: "단계를 선택 하세요.",
				saveCancel: "저장이 취소되었습니다.",
				saveBefore: "변경된 데이터가 있습니다.</br> 저장하지 않고 진행하시겠습니까?",
				processSave: "시작 단계: ${1}</br></br>프로세스 데이터를 저장하시겠습니까?",
				manyStartFlow: "${1}개의 시작 단계가 발견되었습니다.",
				manyEndFlow: "${1}개의 종료 단계가 발견되었습니다.",
				flowLinkCheck: "</br>단계 연결 데이터를 확인하세요.",
				deleteFlow: "${1} 단계를 삭제하시겠습니까?</br>업무 처리에 문제가 발생 할 수 있습니다.",
				deleteReqCheck: "${1}건의 진행중인 요구사항이 있습니다.</br>요구사항의 단계 진행을 완료해야 삭제가 가능합니다.",
				searchEmpty: "검색하려는 단계명을 입력하세요.",
				processConfirmCdChg: "${1} 프로세스 상태를 변경하시겠습니까?",
				processNoneUse: "</br>업무 처리에 영향이 있을 수 있습니다.",
				flowDoneLinkChk: "마지막 단계는 최종완료 단계에 연결되어야합니다.",
				flowSizeChk: "작업흐름이 생성되지 않았습니다.",
				flowDoneDelErr: "최종 완료 단계는 삭제가 불가능합니다.",
				flowDoneUpdateErr: "최종 완료 단계는 수정이 불가능합니다."
			}
		},
		prj1401:{
			complete: "완료",
			insert:{
				title: "신규 프로젝트 그룹 생성",
				saveString: "신규 프로젝트 그룹을 생성하시겠습니까?</br>그룹 생성자는 프로젝트 그룹 담당자에</br>기본 배정됩니다.",
				saveBtnString: "등록 완료",
				saveMsg: "${1}명의 사용자가 배정되었습니다.",
				saveDupleMsg: "이미 배정된 ${1}명의 사용자 제외",
				saveAllDupleMsg: "이미 배정중인 사용자입니다. (${1}명)"
			},
			update:{
				title: "프로젝트 그룹 수정",
				saveString: "프로젝트 그룹을 수정하시겠습니까?</br>그룹 생성자는 프로젝트 그룹 담당자에</br>기본 배정됩니다.",
				saveBtnString: "수정 완료"
			}
		},
		prj1402:{
			title: "프로젝트 그룹 상세정보",
			insert:{
				saveString: "신규 프로젝트 그룹을 생성하시겠습니까?",
				saveBtnString: "등록 완료",
				saveMsg: "${1}명의 사용자가 배정되었습니다.",
				saveDupleMsg: "이미 배정된 ${1}명의 사용자 제외",
				saveAllDupleMsg: "이미 배정중인 사용자입니다. (${1}명)"
			},
			update:{
				saveString: "프로젝트 그룹을 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			}
		},
		prj1101:{
			complete: "완료",
			insert:{
				title: "신규 프로세스 생성",
				saveString: "신규 프로세스를 생성하시겠습니까?",
			},
			update:{
				title: "프로세스 수정",
				saveString: "프로세스를 수정하시겠습니까?",
			}
		},
		prj1102:{
			complete: "완료",
			insert:{
				title: "신규 단계 생성",
				saveString: "신규 단계를 생성하시겠습니까?",
			},
			update:{
				title: "단계 수정",
				saveString: "단계를 수정하시겠습니까?",
			}
		},
		prj1201:{
			title: "프로젝트 설정 수정",
			complete: "완료",
			update:{
				saveString: "프로젝트 설정을 수정하시겠습니까?",
				saveBtnString: "수정 완료",
			},
			actionBtn : {
				updateBtn : "프로젝트 설정 수정"
			},
			label : {
				prjSetNm: "설정명",
				prjSetDesc: "설정 설명",
				prjSetTarget: "설정 대상",
				valType: "설정 값 타입",
				prjSetVal: "설정값",
				useCd: "사용유무"
			}
		},

		prj1300 : {
			label : {
				templateId : "템플릿 ID",
				templateNm : "템플릿 명",
				templateDesc : "비고"
			},
			message : {
				alert : {
					treeSelect : "왼쪽 트리에서 템플릿을 선택해주세요.",
					notUsedTemplate : "미사용 템플릿에는 하위 템플릿을 추가할 수 없습니다.",
					notRootDelete : "최상위 템플릿(ROOT)은 삭제할 수 없습니다.",
				},
				confirm:{
					deleteTemplate:"템플릿 정보 삭제 시 선택한 템플릿 정보 및 하위 템플릿 정보가 모두 삭제됩니다. 선택한 템플릿 정보를 삭제 하시겠습니까?",
				} 
			},
			modal : {
				title : {
					insertTemplate : "신규 템플릿 등록",
					updateTemplate : "템플릿 수정",
					insertItem : "기본항목 등록",
					updateItem : "기본항목 수정",
				}
			},
			contextmenu : {
				insert : "하위 템플릿 등록",
				update : "템플릿 수정",
				delete : "템플릿 삭제"
			}
		},
		prj1301 : {
			label : {
				upperTemplateId : "상위 템플릿 ID",
				upperTemplateNm : "상위 템플릿 명",
				templateId : "템플릿 ID",
				templateNm : "템플릿 명",
				templateDesc : "비고"
				
			},
			button : {
				insert : "작성 완료",
				update : "수정 완료"
			},
			message : {
				confirm : {
					insert : "템플릿 정보를 추가 하시겠습니까?",
					update : "템플릿 정보를 수정 하시겠습니까?"
				}
			}
		},
		prj1302 : {
			label : {
				itemNm : "항목 명",
				itemCode : "항목 분류",
				itemType : "항목 타입",
				itemPcRowNum : "데스크탑 열 넓이",
				itemTabletRowNum : "테블릿 열 넓이",
				itemMobileRowNum : "모바일 열 넓이",
				itemOrd : "순서",
				itemCommonCode : "공통코드",
				itemLength : "길이제한",
				itemEssentialCd : "필수 유무",
				
			},
			button : {
				insert : "작성 완료",
				update : "수정 완료",
				updateJson : "수정 완료"
			},
			message : {
				confirm : {
					insert : "기본항목을 추가 하시겠습니까?",
					update : "기본항목을 수정 하시겠습니까?",
					updateJson : "기본항목을 수정 하시겠습니까?",
					itemNotSelect : "기본항목을 1개 이상 선택해주세요.",
				}
			}
		},
		prj2100:{
			allUsrInsert:"${1}건의 사용자를 배정하시겠습니까?",
			allUsrInDelete:"${1}건의 사용자를 배정 제외하시겠습니까?"
		},
		prj3000 : {
			label : {
				docId : "산출물 ID",
				docNm : "산출물 명",
				docUseCd : "사용 유무",
				docOrd : "순번",
				docEdDtm : "만료일자",
				signUseCd : "결재 사용 유무",
				docDesc : "비고"
			},
			message : {
				alert : {
					treeSelect : "왼쪽 트리에서 산출물을 선택해주세요.",
					notUsedDoc : "미사용 산출물에는 하위 산출물을 추가할 수 없습니다.",
					notRootDelete : "최상위 산출물(ROOT)은 삭제할 수 없습니다.",
					fileExtChk : "확장자가 [ ${1} ] 인 파일은 첨부가 불가능 합니다.",
					notHaveConfFile : "등록된 파일이 존재하지 않습니다.",
					notSignUseCd : "결재를 사용하지 않는 산출물 입니다."
				},
				confirm:{
					deleteDoc:"산출물 정보 삭제 시 선택한 산출물 정보 및 하위 산출물 정보가 모두 삭제됩니다. 선택한 산출물 정보를 삭제 하시겠습니까?",
					deleteFormFile:"산출물 양식 파일을 삭제 하시겠습니까?"
				} 
			},
			modal : {
				title : {
					insertDoc : "신규 산출물 양식 등록",
					updateDoc : "산출물 양식 수정",
					insertDocCon : "산출물 연결",
					saveSignLine : "결재선 지정",
					selectSignLine : "결재선 조회"
				}
			},
			contextmenu : {
				insert : "하위 산출물 등록",
				update : "산출물 수정",
				delete : "산출물 삭제"
			}
		},
		prj3001 : {
			label : {
				upperDocId : "상위 산출물 ID",
				upperDocNm : "상위 산출물 명",
				docId : "산출물 ID",
				docNm : "산출물 명",
				docEdDtm : "만료일자",
				docOrd : "순번",
				signUseCd : "결재 사용 유무",
				docUseCd : "사용 유무",
				docDesc : "비고"
				
			},
			button : {
				insert : "작성 완료",
				update : "수정 완료"
			},
			message : {
				confirm : {
					insert : "산출물 양식 정보를 추가 하시겠습니까?",
					update : "산출물 양식 정보를 수정 하시겠습니까?"
				}
			}
		},
		prj3002 : {
			label : {
				upperDocId : "상위 산출물 ID",
				upperDocNm : "상위 산출물 명",
				docId : "산출물 ID",
				docNm : "산출물 명",
				docEdDtm : "만료일자",
				docOrd : "순번",
				signUseCd : "결재 사용 유무",
				docUseCd : "사용 유무",
				docDesc : "비고"
			},
			insert : {
				saveBtnString : "등록 완료",
				saveString : "선택한 산출물 정보들을 연결하시겠습니까?",
				saveMsg : "${1}건의 정보가 연결되었습니다.",
				saveDupleMsg : "이미 연결된 ${1}명의 사용자 제외",
				saveAllDupleMsg : "이미 연결된 산출물 정보입니다. (${1}건)"
			},
			allDocConInsert : "${1}건의 산출물 정보를 연결하시겠습니까?",
			allDocConDelete : "${1}건의 산출물 정보를 연결 해제하시겠습니까?"
		},
		prj3100 : {
			label : {
				docId : "산출물 ID",
				docNm : "산출물 명",
				docUseCd : "사용 유무",
				docOrd : "순번",
				docEdDtm : "만료일자",
				signUseCd : "결재 사용 유무",
				docDesc : "비고"
			},
			message : {
				alert : {
					treeSelect : "왼쪽 트리에서 산출물을 선택해주세요.",
					fileExtChk : "확장자가 [ ${1} ] 인 파일은 첨부가 불가능 합니다.",
					notHaveConfFile : "등록된 파일이 존재하지 않습니다.",
					lackDownloadInfo : "다운로드에 필요한 정보가 부족합니다.",
					notCheckedFile : "선택된 파일이 없습니다."
				},
				confirm:{
					deleteFormFile:"산출물 파일을 삭제 하시겠습니까?",
					signAtchFile : "선택된 파일들을 결재 하시겠습니까?"
				} 
			},
			modal : {
				title : {
					insertDocCon : "산출물 연결",
					signRjtRes : "결재 반려"
				}
			},
			contextmenu : {
				formFileDownload : "양식 다운로드",
				atchFileDownload : "확정 산출물 다운로드",
				waitFileDownload : "확정 대기 산출물 다운로드"
			},
			toastr : {
				success : "${1} 건의 결재가 성공했습니다."
			}
		},
		prj3101 : {
			message : {
				alert : {
					notCheckedFile : "선택된 파일이 없습니다.",
					lackDownloadInfo : "다운로드에 필요한 정보가 부족합니다."
				}
			}
		},
		prj3102 : {
			label : {
				rjtRes : "반려 사유"
			},
			button : {
				save : "작성 완료"
			},
			message : {
				confirm : {
					save : "선택 파일들을 결재 반려 하시겠습니까?"
				}
			}
		},
		prj5000:{
			button:{
				title:{
					insert: "일정 등록",
					local: 'ko',
					today: '오늘',
					fourDay: '4일',
					dataSelect: '일정 데이터 조회',
					insert: '일정 등록'
				}
			}
		},
		prj5001:{
			complete: "완료",
			insert:{
				title: "프로젝트 일정 저장",
				saveString: "신규 프로젝트 일정을 생성하시겠습니까?",
				saveBtnString: "등록 완료",
			},
			delete:{
				deleteString: "프로젝트 일정을 삭제하시겠습니까?",
				deleteBtnString: "삭제",
			},
			update:{
				title: "프로젝트 일정 수정",
				saveString: "프로젝트 일정을 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			},
			view:{
				title: "일정 상세정보"
			},
			actionBtn : {
				insertBtn : "프로젝트 일정 저장",
				updateBtn : "프로젝트 일정 수정"
			},
			label : {
				evtNm: "일정명",
				evtRange: "일정 일자",
				evtDesc: "일정 설명",
				evtBgColor: "일정 배경 색상",
				evtColor: "일정 색상",
				guideColor: "가이드 색상",
			}
		},usr1100:{
			title:{
				shortcut:"메뉴 및 권한 관리 단축키",
				01:"프로젝트 및 권한그룹 선택",
				02:"팝업창 가운데 정렬",
				03:"추가 기능바",
				04:"검색",
				05:"마이페이지",
				06:"메시지",
				07:"알림",
				08:"개인설정",
				09:"담당요구사항",
				10:"로그아웃",
			},
			btn:{
				update:"수정 완료",
				dontuse:"사용 안함",
			}
		},
		req1001:{
			title: "신규 요구사항 요청",
			reqUser:{
				title: "요청자 정보",
				usrNm: "요청자 이름",
				email: "요청자 이메일",
				deptNm: "요청자 소속",
				telNo: "요청자 연락처"
			},
			prjNm: "프로젝트",
			reqDtm: "요청 일자",
			reqNm: "요청 제목",
			reqDesc: "요청 내용",
			reqPw: {
				title : "요구사항 잠금",
				password : "PW",
				passwordCheck :"PW 확인",
				placeholder : {
					password : "알파벳, 숫자 4-12자 이내",
					nullPassword : "공백인 경우 기존 비밀번호 사용",
				}
			},
			attachments: "파일 첨부", 
			complete: "완료",
			insert:{
				saveString: "신규 요구사항을 요청하시겠습니까?",
				saveBtnString: "작성 완료"
			},
			update:{
				saveString: "요구사항 정보를 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			},
			formCheck:{
				passwordMessage : "비밀글에 사용할 비밀번호를 입력해주세요.",
				passwordMatching : "입력된 비밀번호가 서로 다릅니다.",
			},
		},
		req1002:{
			label : {
				reqUser : {
					title : "요청자 정보", 
					usrNm : "요청자 이름",
					email : "요청자 e-mail",
					deptNm : "요청자 소속",
					telNo : "요청자 연락처",
				},
				group:{
					groupReqInfo : "그룹 요구사항 정보",
					groupReqId : "그룹 요구사항 번호",
					groupReq : "그룹 요구 사항",
					groupReqDesc : "그룹 요구사항 내용",
				},
				prjNm : "프로젝트",
				reqDtm : "요청일",
				reqId: "요구사항 ID",
				reqOrd : "요구사항 순번",
				reqProTypeNm : "처리 유형",
				processNm : "프로세스명",
				flowNm:"단계명",
				reqNm : "요청 제목",
				reqDesc : "요청 내용",
				attachments : "파일 첨부",
				requestDefaultOptNm : "접수 기본항목 입력"
			},
			message:{
				notGroupReqNo : "없음",
				notGroupReqInfo : "그룹 요구사항이 연결되어 있지 않습니다.",
				notProcess : "배정된 프로세스 없음",
				notStep : "없음"
			},
		},
		req3000:{
			allReqInDelete:"${1}건의 요구사항을 연결 해제하시겠습니까?",
			insert:{
				saveMsg: "${1}개의 요구사항이 연결되었습니다.",
				saveDupleMsg: "이미 연결된 ${1}개의 요구사항 제외",
				saveAllDupleMsg: "이미 연결중인 요구사항입니다. (${1}개)"
			},
			alert:{
				checkUsrId:"요청자 명을 검색하여 입력해주세요. \n 해당 요청자의 소속을 알아야합니다.",
				checkChargerId:"담당자 명을 검색하여 입력해주세요. \n 해당 담당자의 소속을 알아야합니다.",
			},
			confirm:{
				insert:"그룹 요구사항을 등록하시겠습니까?",
				delete:"선택된 그룹 요구사항을 삭제하시겠습니까?",
				deleteList:"${1}건의 그룹 요구사항을 삭제하시겠습니까?",
				update:"그룹 요구사항을 수정하시겠습니까?",
			},
			title:{
				detailTitle:"그룹 요구사항 상세보기",
				insert:"그룹 요구사항 등록",
				update:"그룹 요구사항 수정",
				detail:"그룹 요구사항 상세정보",
				selectCharger:"그룹 요구사항 담당자 검색",
				selectUsr:"그룹 요구사항 요청자 검색"
			},
			datatable:{
				action:{
					update:"그룹 요구사항 수정하기",
					delete:"그룹 요구사항 삭제하기",
					excel:"그룹 요구사항 목록 엑셀",
					print:"그룹 요구사항 목록 프린트",
					dblClick:"그룹 요구사항 상세보기"
				}
			}
		},
		req4100:{
			button:{
				copyBtn : "복사",
				requestAcceptBtn: "접수",
				detailBtn : "상세",
			},
			field:{
				
				prjGrpNm: "프로젝트 그룹명",
				reqGrpNm: "그룹 요구사항 명",
				reqGrpNo : "그룹 요구사항 번호",
				reqDesc : "요구사항 내용"
			},
			actionBtn:{
				title : "수정 / 삭제 / 상세 / 복사",
				updateBtn : "요구사항 수정",
				deleteBtn : "요구사항 삭제",
				detailBtn : "요구사항 상세",
				copyBtn : "요구사항 복사",
				selectTooltip : "요구사항 조회",
				insertTooltip : "요구사항 추가",
				updateTooltip : "요구사항 수정",
				deleteTooltip : "요구사항 삭제",
				detailTooltip : "요구사항 상세",
				copyTooltip : "요구사항 복사",
				requestAcceptTooltip: "요구사항 접수",
			},
			title:{
				insertTitle : "신규 요구사항 등록",
				updateTitle : "요구사항 수정",
				detailTitle : "요구사항 확인"
			},
			alert:{
				updateMsg : "접수 요청중인 요구사항만 수정 가능합니다.",
				multiPwMsg : "패스워드 확인이 필요한 요구사항이 ${1}건 있습니다. </br> 잠금된 요구사항을 제외 후 삭제 또는 잠금 요구사항은 단건 삭제하세요.",
				selectData : "요구사항을 선택해주세요.",
				selectDatas : "${1}건의 요구사항이 선택되었습니다.</br>1건의 요구사항만 선택해주세요.",
				LockData : "잠긴 요구사항은 복사할 수 없습니다.",
				selectCopyData : "복사는 1건에 대해서만 가능합니다. 현재 ${1}건 선택되었습니다."
			},
			message : {
				nothing : "없음",
			}
		},
		req4101:{
			complete : "완료",
			saveString :{
				insertStr : "요구사항을 등록하시겠습니까?",
				updateStr : "요구사항 수정을 완료하시겠습니까?",
				copyStr : "요구사항 복사를 완료하시겠습니까?",
			},
			label : {
				reqUser : {
					title : "요청자 정보",
					usrNm : "요청자 이름",
					email : "요청자 e-mail",
					deptNm : "요청자 소속",
					telNo : "요청자 연락처",
				},
				group:{
					groupReqInfo : "그룹 요구사항 정보",
					groupReq : "그룹 요구 사항",
					groupReqDesc : "그룹 요구사항 내용",
				},
				prjNm : "프로젝트",
				reqDtm : "요청일",
				reqNm : "요청 제목",
				reqDesc : "요청 내용",
				reqPw : "요구사항 잠금",
				password : "PW",
				passwordCheck : "PW 확인",
				attachments : "파일 첨부",
				requestDefaultOptNm : "접수 기본항목 입력"
			},
			placeholder:{
				usrNm : "요청자 이름",
				email : "요청자 e-mail",
				deptNm : "요청자 소속",
				tel : "요청자 연락처",
				selectGroup : "그룹 요구사항을 선택하세요.",
				reqDtm : "요청일",
				reqNm : "요청 제목",
				password : "알파벳, 숫자 4-12자 이내",
				nullPassword : "공백인 경우 기존 비밀번호 사용",
			},
			regex:{
				password : "알파벳, 숫자 4-12자 이내",
			},
			modalTitle : {
				userSearch : "요청자 검색",
				reqGrpSearch: "그룹 요구사항 검색",
			},
			button :{
				deleteResetBtn : "삭제 초기화",
				insertBtn : "등록",
				updateBtn : "수정 완료",
				copyBtn : "복사 완료",
				searchBtn : "검색",
			},
			prepData : {
				title : "선행처리 지식확인",
				reqNm : "요구사항명",
				result : "다음과 같은 연관 결과가 있습니다.",
				notResult : "연관 결과가 없습니다.",
				total : "총",
				count : "건",
				tooltip : {
					selectTooltip : "선행지식 조회",
					detailTooltip : "요구사항 상세",
					card : "카드형",
					grid : "그리드형",
				},
				button : {
					detailBtn : "상세 조회",
				},
			},
			formCheck:{
				passwordMessage : "비밀글에 사용할 비밀번호를 입력해주세요.",
				passwordMatching : "입력된 비밀번호가 서로 다릅니다.",
			},
		},
		req4102:{
			label : {
				reqUser : {
					title : "요청자 정보", 
					usrNm : "요청자 이름",
					email : "요청자 e-mail",
					deptNm : "요청자 소속",
					telNo : "요청자 연락처",
				},
				group:{
					groupReqInfo : "그룹 요구사항 정보",
					groupReqId : "그룹 요구사항 번호",
					groupReq : "그룹 요구 사항",
					groupReqDesc : "그룹 요구사항 내용",
				},
				prjNm : "프로젝트",
				reqDtm : "요청일",
				reqId: "요구사항 ID",
				reqOrd : "요구사항 순번",
				reqProTypeNm : "처리 유형",
				processNm : "프로세스명",
				flowNm:"단계명",
				reqNm : "요청 제목",
				reqDesc : "요청 내용",
				attachments : "파일 첨부",
				requestDefaultOptNm : "접수 기본항목 입력"
			},
			message:{
				notGroupReqNo : "없음",
				notGroupReqInfo : "그룹 요구사항이 연결되어 있지 않습니다.",
				notProcess : "배정된 프로세스 없음",
				notStep : "없음"
			},
		},
		req4103:{
			passwordMiss : "비밀번호가 틀렸습니다. </br> 다시 입력하세요.",
			text: "잠긴 요구사항입니다. </br> 비밀번호를 입력하세요.",
			button:{
				submit : "확인",
			}
		},
		req4104:{
			field:{
				reqGrpNm:"그룹 요구사항 명",
			},
			actionBtn:{
				title:"선택"
			}
		},
		spr1000:{
			nonSelect: "스프린트를 선택해주세요.",
			manySelect: "1건의 스프린트만 선택해주세요.",
			sprTypeWaitMsg: "대기 중인 스프린트만 시작 할 수 있습니다.",
			sprTypeStartMsg: "시작 중인 스프린트만 종료 할 수 있습니다.", 
			startDate: "시작일",
			endDate: "종료일",
			completedRatio: "진척률",
			projectCnt: "등록 프로젝트",
			requestAll: "전체 요구사항",
			requestInProgress: "진행 중",
			requestDone: "최종 완료",
			menu:{
				update: "스프린트 수정",
				delete: "스프린트 삭제",
				sprintStart: "스프린트 시작",
				sprintEnd: "스프린트 종료",
				sprintDetail: "스프린트 상세정보",
				sprintMeetList: "스프린트  회의록 목록",
				sprintResultList: "스프린트 회고록 목록",
				sprintReport: "보고서 출력"
			},
			button:{
				title:{
					sprStart: "시작",
					sprEnd: "종료"
				}
			},
			confirm:{
				prjGrpRedo: "${1}건의 프로젝트 그룹을 복구하시겠습니까?",
				prjGrpDelete: "${1}건의 프로젝트 그룹을 완전 삭제하시겠습니까?</br>삭제된 프로젝트 그룹은 복구 할 수 없습니다."
			},
			datatable:{
				action:{
					update: "스프린트 수정",
					delete: "스프린트 삭제",
					dblClick: "스프린트 상세 정보"
				}
			}
		},
		spr1002:{
			complete: "완료",
			insert:{
				title: "신규 스프린트 생성",
				saveString: "신규 스프린트를 등록하시겠습니까?",
				saveBtnString: "등록 완료",
			},
			update:{
				title: "스프린트 수정",
				saveString: "스프린트를 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			}
		},
		spr1003:{
			wizard:{
				main:{
					mmtTitle: "회의록 작성",
					mmtDesc: "스프린트 회의록 작성",
					sprPtTitle: "스토리 포인트 입력",
					sprPtDesc: "요구사항 스토리 포인트 입력",
					chargerTitle: "담당자 지정",
					chargerDesc: "요구사항 담당자 지정",
					processTitle: "프로세스 배정"
				},
				info:{
					mmt: "* 스프린트 시작 전 회의록을 작성하세요.",
					sprPt: "* 요구사항에 스토리 포인트를 입력하세요.",
					charger: "* 사용자를 클릭하고 담당자 입력 상자 클릭으로 담당자를 배정하세요.",
					process: "* 배정된 프로세스가 칸반 보드에 표시됩니다."
				},
				btn:{
					prev: "이전",
					submit: "완료",
					next: "다음"
				}
			},
			lebel:{
				mmtUsrList: "참여 인원",
				mmtTitle: "회의록 제목",
				mmtDesc: "회의록 내용"
			},
			alert:{
				reqSprPoint: "모든 요구사항의 스토리포인트를 입력해주세요.</br>미 입력 요구사항 ${1}건",
				saveProcessMsg: "${1}개의 프로세스가 배정되었습니다.",
				saveProcessDupleMsg: "이미 배정된 ${1}개의 프로세스 제외",
				saveProcessAllDupleMsg: "이미 배정중인 프로세스입니다. (${1}개)",
				reqCharger:"모든 요구사항의 담당자를 입력해주세요.</br>미 배정 요구사항 ${1}건",
			}
		},
		spr1004:{
			alert:{
				reqEndCnt: "결과 작성이 안된 요청이 있습니다. (${1}개)"
			}
		},
		spr1100:{
			title : {
				sprint : "스프린트 목록",
				assignment : "요구사항 배정 목록",
				unassigned : "요구사항 미배정 목록",
			},
			button:{
				removeBtn: "제외",
				addBtn:"배정"
			},
			actionBtn :{
				title :{
					selectBtn : "선택",
					removeBtn :"제외",
					addBtn :"배정",
					sprSelect : "스프린트 조회",
					assSelect : "요구사항 배정 조회",
					nonSelect : "요구사항 미배정 조회",
				},
				tooltip :{
					clickToolTip : "스프린트 선택",
					removeToolTip :"요구사항 배정 제외",
					addToolTip :"요구사항 배정",
				},
			}
		},
		spr2000:{
			title :"회의록 목록",
			button:{
				detailBtn : "상세",
			},
			actionBtn:{
				title : "수정 / 삭제 / 상세",
				selectTooltip : "회의록 조회",
				insertTooltip : "회의록 추가",
				updateTooltip : "회의록 수정",
				deleteTooltip : "회의록 삭제",
				detailTooltip : "회의록 상세",
			},
			message : {
				selectMsg : "스프린트를 선택하세요.",
			},
			title : {
				insertTitle : "스프린트 회의록 등록",
				updateTitle : "스프린트 회의록 수정",
				detailTitle : "스프린트 회의록 상세",
			}
		},
		spr2001:{
			submit: "완료",
			label : {
				sprNm : "스프린트명",
				rptMem: "참여 인원",
				rptNm :"회의록 제목",
				rptDesc : "회의록 내용",
			},
			button : {
				insertBtn : "등록",
				updateBtn : "수정 완료",
			},
			placeholder:{
				rptNm : "제목",
				select2 : "선택 또는 입력"
			},
			message : {
				select2 : "없을 경우 작성자가 자동으로 추가됩니다."
			}
		},
		spr2100:{
			title :"회고록 목록",
			button:{
				detailBtn : "상세",
			},
			actionBtn:{
				title : "수정 / 삭제 / 상세",
				selectTooltip : "회고록 조회",
				insertTooltip : "회고록 추가",
				updateTooltip : "회고록 수정",
				deleteTooltip : "회고록 삭제",
				detailTooltip : "회고록 상세",
			},
			message : {
				selectMsg : "스프린트를 선택하세요.",
			},
			title : {
				insertTitle : "스프린트 회고록 등록",
				updateTitle : "스프린트 회고록 수정",
				detailTitle : "스프린트 회고록 상세",
			}
		},
		spr2101:{
			submit: "완료",
			label : {
				sprNm : "스프린트명",
				mmrMem: "참여 인원",
				mmrNm :"회고록 제목",
				mmrDesc : "회고록 내용",
			},
			button : {
				insertBtn : "등록",
				updateBtn : "수정 완료",
			},
			placeholder:{
				mmrNM : "제목",
			}
		},
		dpl1000:{
			label:{
				button:{
					signLine:"결재선 지정",
					actionBtn:"기능 버튼"
				}
			},
			tooltip:{
				button:{
					signReqDplBtn: "배포 계획 결재선 지정",
					selectBtn: "배포 계획 조회",
					insertBtn: "신규 배포 계획 추가",
					updateBtn: "배포 계획 수정",
					deleteBtn: "배포 계획 삭제"
				},
				actionBtn:{
					signReqDplBtn: "결재선 지정",
					updateBtn: "배포 계획 수정",
					deleteBtn: "배포 계획 삭제",	
					detailBtn: "배포 계획 상세보기"
				}
			},
			modal:{
				title:{
					insertDpl:"신규 배포 계획 생성",
					updateDpl:"배포 계획 수정",
					detailDpl:"상세 정보",
					signReq : "[${1}] 배포 계획 결재 요청",
					selSignLine : "[${1}] 배포 계획 결재 현황",
					reSignReq : "[${1}] 배포 계획 결재 재요청",
				}
			},
			message:{
				alert:{
					successDplNotUpdate:"성공된 배포 계획은 수정이 불가능합니다.",
					signConfDplNotUpdate:"결재 승인된 배포 계획은 수정이 불가능합니다.",
					signStandDplNotUpdate:"결재 대기중인 배포 계획은 수정이 불가능합니다.",
					signConfDplNotDelete:"결재 승인된 배포 계획은 삭제가 불가능합니다.",
					signStandDplNotDelete:"결재 대기중인 배포 계획은 삭제가 불가능합니다.",
					signImpossible:"결재 사용 유무가 아니오인 경우 결재를 사용할 수 없습니다."
				}
			}
		},
		dpl1004 : {
			label:{
				dplStatus : "배포 상태",
				dplVersion : "배포 버전",
				dplName : "배포 명",
				dplDate: "배포 일자",
				dplUser : "배포자",
				dplSignUse : "결재 사용 유무",
				dplRevisionNum : "배포 리비전",
				dplType : "배포 방법",
				dplFailAction : "실패 후 처리",
				dplAutoTime : "자동 실행 시간",
				dplRestoreType : "원복 타입",
				dplSignText : "결재 요청 의견",
				dplDesc : "배포 설명",
				title : {
					dplInfo : "배포 정보",
					signLineInfo : "결재선 정보"
				}
			},
			tooltip : {
				selSignLine : "결재선 지정",
			},
			button : {
				selSignLine : "결재선 지정",
				reqSign : "결재 요청"
			}
		},
		stm2100:{
			selectStmInfoCnt : "1건의 게시판만 선택하세요. </br> ${1}건의 게시판이 선택되었습니다." ,
			notAuthority : {
					basic : "해당 게시판에 대한 권한이 없습니다.",
			},
			
			field:{
				stmTypeNm: "유형",
				stmNm: "게시판명",
				stmDsTypeNm: "공개범위",
				cnt: "전체글 수",
				badCnt: "유효글 수",
				delCnt: "삭제글 수",
			},
			actionBtn:{
				title : "수정 / 관리 / 통계",
				updateBtn : "게시판 속성",
				detailBtn : "게시글 관리",
				summeryBtn : "통계보기",
				selectTooltip : "게시판 조회",
				updateTooltip : "게시판 속성 수정",
				managmentTooltip : "게시글 관리",
				summeryTooltip : "게시판 통계"
			},
			button:{
				card : "카드형",
				grid : "그리드형",
				detail:"관리",
				summery:"통계",
			},
			title:{
				updateTitle : "게시판 속성",
				detailTitle : "게시글 관리",
				summeryTitle : "통계보기",
				chargerTitle : "담당자 목록 확인"
			},
			type:{
				normal:"[일반]",
				gallery:"[갤러리]",
				movie:"[영상]",
				storage:"[자료실]",
			},
			label:{
				summery : "통계",
			},
			chart:{
				noData : "데이터 없음",
				newPost : "등록 게시글",
				deletePost : "삭제 게시글"
			}
		},
		stm2101:{
			update: "게시판 정보를 수정하시겠습니까?",
			formCheck:{
				fileOptionMessage : "해당 게시판 유형은 첨부파일이 필수입니다.",
				fileCntMessage : "첨부파일 갯수는 최소 1부터 10까지 가능합니다</br> 첨부파일 갯수를 최솟값인 1로 변경합니다.",
				fileMaxCntMessage : "첨부파일 가능한 갯수를 초과합니다. </br> 최대 수로 적용됩니다.",
				fileMaxStrgMessage : "게시판 유형에 따라</br> 최대 첨부파일 용량으로 지정됩니다.",
				fileMaxStrgOutMessage : "최대 첨부파일 용량을 초과합니다</br> 최대용량(${1})으로 변경됩니다.",
			},
			label:{
				name: "게시판 명",
				type : "유형",
				dsType : "게시물 공개 범위",
				option : "옵션",
				noticeCheck : "공지사항 사용",
				commentCheck : "댓글 사용",
				secretCheck : "비밀글 사용",
				attachFileCheck : "첨부파일 사용",
				tagCheck : "태그 사용",
				fileCount : "첨부파일 갯수",
				maxFileCnt : "최대 갯수 : 10",
				limitFileStrg : "첨부파일 용량 제한(MB)",
				maxFileStrg:{
					basic : "최대 용량 : [자료실] 4GB(4096MB) [영상] 2GB(2048MB) [일반/갤러리] 500MB",
					normal: "최대 500MB",
					movie: "최대 2048MB(2GB)",
					storage: "최대 4096MB(4GB)"
				},
				admin : "담당자",
				writer : "글 작성 범위",
				nothing : "미배정 권한그룹 및 사용자",
				user : "사용자",
				authGrp : "권한그룹",
				otherAdmin : "그 외 담당자",
			},
			title:{
				admin: "담당자 지정",
				writer: "글 작성 범위 지정"
			},
			button : {
				reset : "초기화",
				equals : "담당자 동일",
				all : "전체",
				authNm : "권한그룹 명",
				userId : "사용자 ID",
				userName : "사용자 명",
				search : "검색",
				updateSubmit : "수정 완료",
			}
		},
		stm2102:{
			summery:{
				noticeCntY: "공지사항 수 : ${1} 건",
				noticeCntN: "공지사항 수 : 없음",
				ntcCurrentY: "최신 공지일 : ${1}",
				ntcCurrentN: "최신 공지일 : 없음",
				cmtAllCntY: "전체 댓글 수 : ${1} 건",
				cmtAllCntN: "전체 댓글 수 : 없음",
				cmtMaxInfoY: "최다 댓글 수 : ${1} 건",
				cmtMaxInfoN: "최다 댓글 수 : 없음",
				badAllCntY: {
					create : "전체 등록 게시글 수 : ${1} 건",
					delete : "전체 삭제 게시글 수 : ${1} 건",
				},
				badAllCntN: "전체 게시글 수 : 없음",
				badHitInfoY: "최다 조회 수 : ${1} 회",
				badHitInfoN: "최다 조회 수 : 없음",
				badPwCntY: "비밀글 수 : ${1} 건",
				badPwCntN: "비밀글 수 : 없음",
				tagLabelY: "사용 TOP ${1} : # ${2}",
				tagLabelN: "사용 태그 없음",
				fileAllCntY: "전체 첨부파일 수 : ${1} 건",
				fileAllCntN: "전체 첨부파일 수 : 없음",
				fileAllSizeY: "전체 첨부파일 크기 : ${1}",
				fileAllSizeN: "전체 첨부파일 없음 : 없음",
			},
			label:{
				notice : "공지사항",
				comment : "댓글",
				board : "게시글",
				tag : "태그",
				attachFile : "첨부파일",
			}
		},
		stm2200:{
			title:{
				authGrpList: "시스템권한 그룹 ",
				authList: "시스템 메뉴 권한",
				insert: "신규 시스템 권한 그룹 등록",
				update: "시스템 권한 그룹 수정",
				view: "시스템 권한 그룹 상세보기",
			},
			actionBtn : {
				updateBtn : "시스템 권한 그룹 수정",
				deleteBtn : "시스템 권한 그룹 삭제",
				clickBtn  : "시스템 메뉴 권한 조회",
				dblClickBtn : "시스템 권한 그룹 상세보기"
			},
			button:{
				title:{
					insert: "시스템 권한 그룹 추가",
					update: "시스템 권한 그룹 수정",
					delete: "시스템 권한 그룹 삭제",
					select: "시스템 권한 그룹 조회",
				}
			},
		},
		stm2201:{
			complete: "완료",
			insert:{
				saveString: "시스템 권한 그룹을 등록하시겠습니까?",
				saveBtnString: "등록 완료",
			},
			update:{
				saveString: "시스템 권한 그룹을  수정하시겠습니까?",
				saveBtnString: "수정 완료",
			},
			label : {
				authGrpNm: "권한그룹 명",
				ord: "순번",
				usrTyp: "사용자 유형",
				acceptUseCd: "접수권한 사용유무",
				useCd: "사용유무",
				authGrpDesc: "비고"
			}
		},
		stm6000:{
			button:{
				selectTooltip: "조직 조회",
				insertTooltip: "조직 추가",
				updateTooltip: "조직 수정",
				deleteTooltip: "조직 삭제"
			},
			label:{
				upperDeptId : "상위 조직 ID",
				upperDeptNm : "상위 조직 명",
				deptId : "조직 ID",
				deptNm : "조직 명",
				deptOrd : "순번",
				deptUseCd : "사용유무",
				deptEtc : "비고",
			},
			title:{
				deptList:"조직 목록",
				deptInfo:"조직 정보"
			},
			message:{
				alert:{
					treeSelect:"왼쪽 트리에서 조직을 선택해주세요.",
					notUsedDept:"미사용 조직에는 하위 조직을 추가할 수 없습니다.",
					notRootDelete:"최상위 조직(ROOT)은 삭제할 수 없습니다."
				},
				confirm:{
					deleteDept:"조직 삭제 시 선택한 조직 및 하위 조직이 모두 삭제됩니다. 선택한 조직을 삭제 하시겠습니까?"
				}
			},
			modal:{
				title:{
					insertDept:"신규 조직 등록",
					updateDept:"조직 수정"
				}
			}
		},
		stm6001:{
			label:{
				upperDeptId : "상위 조직 ID",
				upperDeptNm : "상위 조직 명",
				deptId : "조직 ID",
				deptNm : "조직 명",
				deptOrd : "순번",
				deptUseCd : "사용유무",
				deptEtc : "비고",
			},
			button:{
				insert : "작성 완료",
				update : "수정 완료"
			},
			message:{
				confirm:{
					insert:"신규 조직을 등록하시겠습니까?",
					update:"조직 정보를 수정하시겠습니까?"
				}
			}
		},
		stm8000:{
			title: {
				actionTitle : "수정 / 삭제 / 상세 / 접속 확인",
				insertTitle : "저장소 추가",
				updateTitle : "저장소 수정",
				dblClickTitle : "저장소 상세보기",
			},
			actionTooltip:{
				updateTooltip : "수정",
				deleteTooltip : "삭제",
				dblClickTooltip : "상세",
				connectTooltip : {
					select : "선택 접속 확인",
					all : "전체 접속 확인",
				},
			},
			actionBtn:{
				selectTooltip :"저장소 조회",
				insertTooltip : "저장소 추가",
				updateTooltip : "저장소 수정",
				deleteTooltip : "저장소 삭제",
				connectTooltip : {
					select : "선택 접속 확인",
					all : "전체 접속 확인",
				},
				connect : {
					select : "선택 접속 확인",
					all : "전체 접속 확인",
				},
			},
			message:{
				connect : {
					selectCount : "${1}개가 선택되었습니다. </br>접속 확인할 저장소를 선택하세요.",
					fail : {
						auth : "접속 실패 : ID 또는 PW를 확인하세요.",
						url : "접속 실패 : 유효한 URL이 아닙니다.",
						common : "접속 실패",
					},
					success : "접속 성공"
				},
				auth : "접근 권한이 없습니다."
			}
		},
		stm8001:{
			complete: "완료",
			submit: {
				insertBtn : "등록 완료",
				updateBtn : "수정 완료"
			},
			label:{
				strgTypeCd : "유형",
				useCd : "사용여부",
				strgRepTitle :"저장소명",
				strgRepUrl : "URL",
				strgUsrId : "USER",
				strgUsrPw : "PW",
				strgRepNm : "Repo.",
				strgKey : "TOKEN",
				strgTxt : "저장소 설명"
			},
			placeholder : {
				strgRepTitle :"저장소명",
				strgRepUrl : "SVN URL",
				strgUsrId : "사용자 ID",
				strgUsrPw : "사용자 PW",
				strgRepNm : "GIT 프로젝트명",
				strgKey : "GIT TOKEN",
			}
		},
		stm8002 :{
			title :{
				revision : "리비전 목록",
				file :"파일 목록",
				actionTitle : {
					revisionFile : "상세",
					repository : "선택",
				},
			},
			label : {
				revisionNum : "리비전 번호",
			},
			revisionFile : {
				actionTitle : "선택",
				actionTooltip : {
					dblClickTooltip : "파일 소스보기",
					diffTooltip : "파일 비교"
				},
				message : {
					selectOne : "${1}개가 선택되었습니다. </br>한개의 파일만 선택하세요."
				}
			},
			repository:{
				actionTooltip : {
					chooseTooltip : "리비전 선택",
				}
			},
			dirTree:{
				message:{
					selectRevision : "리비전을 선택하세요.",
				}
			},
			placeholder : {
				revision : {
					start : "시작",
					end : "종료",
				}
			},
			actionBtn:{
				selectTooltip :"리비전 조회",
				selectFileTooltip : "리비전 파일 목록 조회",
				chooseTooltip : "리비전 선택 완료",
				chooseBtn : "선택 완료",
				detailTooltip : "소스보기",
				detailBtn : "상세",
				diffTooltip : "파일 비교",
				diffBtn : "DIFF"
			},
			message :{
				selectRevision : "리비전을 선택하세요.",
				auth: "접근 권한이 없습니다."
			}
		},
		stm8003:{
			title : "파일 리비전 목록",
			revisionNum : "리비전 번호",
			actionBtn : {
				title : "선택",
				selectTooltip : "파일 리비전 조회",
				diffTooltip : "파일 비교",
				diffBtn : "DIFF"
			},
			placeholder : {
				revision : {
					start : "시작",
					end : "종료",
				}
			},
			message : {
				selectFile : "${1}개가 선택되었습니다. </br>한의 파일을 선택하세요.",
			}
		},
		stm8100:{
			title : {
				allProjectList : "전체 프로젝트 목록",
				assRepList : "소스 저장소 배정 목록",
				nonAssRepList : "소스 저장소 미배정 목록"
			},
			toolTip : {
				selectAssignStrg : "소스 저장소 배정 목록 조회",
				selectNonAssignStrg : "소스 저장소 미배정 목록 조회",
				removeStrg : "소스 저장소 배정 제외",
				addStrg : "소스 저장소 배정",
				authSetting : "리비전 및 소스코드 열림 권한 설정"
			},
			actionBtn : {
				removeBtn : "제외",
				addBtn : "배정",
				authSetting : "권한 설정"
			},
			message:{
				alert:{
					treeNodeSelect : "왼쪽 트리에서 프로젝트를 선택해주세요.",
				},
				toastr:{
					projectSelect : "프로젝트 그룹이 아닌 프로젝트를 선택해주세요."
				},
			},
			assignStrgTable : {
				actionBtn : {
					title : "제외",
				},
				tooltip : {
					dblClick : "소스 저장소 배정 제외",
					authSetting : "리비전 및 소스 열람 권한 설정"
				},
				message : {
					remove : "배정 제외 시 권한 설정 값도 초기화 됩니다.</br>그래도 제외하시겠습니까?",
					selectRep : "리비전 및 소스 열람 권한 설정을 위한</br>소스 저장소를 하나 선택하세요.",
					selectOnlyOne : "단건만 선택하세요",
				},
				title :{
					authPop : "권한 팝업"
				}
			},
			nonAssignStrgTable :{
				actionBtn : {
					title : "배정",
				},
				tooltip : {
					dblClick : "소스 저장소 배정",
					authSetting : "리비전 및 소스 열람 권한 설정"
				},
			}
		},
		stm8101:{
			complete : "저장",
			label : {
				revision : "리비전 열람 권한",
				fileCode : "소스 열람 권한",
				message : "소스 열람 권한은 리비전 열람 권한이 있어야 합니다.",
				nonAssList : "미배정 권한 그룹 및 사용자"
			},
			button : {
				equalBtn : "리비전 열람 권한 동일",
				resetBtn : "초기화",
				searchBtn : "검색",
			},
			select : {
				authGrpNm: "권한그룹 명",
				usrId : "사용자 ID",
				usrNm : "사용자 명"
			},
			draw : {
				revisionBtn : "리비전 열람",
				fileCodeBtn : "소스 열람",
				badge : {
					authGrp : "권한그룹",
					user : "사용자"
				}
			},
			message : {
				remove : "소스 열람 권한은 리비전 열람 권한이 있어야 가능합니다. </br>리비전 열람 권한이 제거됨에 따라 같이 제거됩니다.",
				add : "소스 열람을 위해선 리비전 열람 권한도 필요합니다. </br>리비전 열람 권한에도 배정됩니다.",
				link : "리비전 열람 권한 목록은 있으나 소스 열람 권한에 배정된 항목이 없습니다. </br>리비전 열람 권한과 동기화 됩니다."
			}
		},
		stm8200:{
			actionBtn:{
				selectTooltip :"전체 현황 조회",
			},
		},
		stm9000: {
			title : {
				jenkinsManagement : "JENKINS 관리"
			},
			button:{
				common:{
					selectConnection:"선택 접속 확인",
					allConnection:"전체 접속 확인"
				},
				jenkins:{
					selectTooltip: "Jenkins 조회",
					insertTooltip: "Jenkins 추가",
					updateTooltip: "Jenkins 수정",
					deleteTooltip: "Jenkins 삭제",
					selectConnectionTooltip: "선택 Jenkins 접속 확인",
					allConnectionTooltip: "전체 Jenkins 접속 확인"
				}
			},
			actionBtn:{
				jenkins:{
					updateBtn:"Jenkins 수정",
					deleteBtn:"Jenkins 삭제",
					dblClickBtn:"Jenkins 상세보기"
				}
			},
			modal:{
				jeknins:{
					insertJenkins:"신규 Jenkins 설정 등록",
					updateJenkins:"Jenkins 설정 수정",
					detailJenkins:"상세 정보"
				}
			},
			message:{
				jenkins:{
					nonSelect:"접속 확인할 Jenkins를 선택해주세요.",
					connectSuccess:" 접속 성공"
				}
			}
		},
		stm9001:{
			label:{
				jenkinsName : "JENKINS NAME",
				jenkinsUrl : "JENKINS URL",
				jenkinsUserId : "USER ID",
				tokenKey: "TOKEN KEY",
				jenkinsUseCd : "사용여부",
				jenkinsDesc : "JENKINS 설명",
			},
			button:{
				insert : "작성 완료",
				update : "수정 완료"
			},
			message:{
				confirm:{
					insert:"신규 JENKINS를 등록하시겠습니까?",
					update:"JENKINS 정보를 수정하시겠습니까?"
				}
			}
		},
		stm9002:{
			label:{
				leftTitle: "JENKINS 정보",
				rightTitle: "JOB 정보",
				jenkinsName : "JENKINS NAME",
				jenkinsUrl : "JENKINS URL",
				jenkinsUserId : "JENKNS USER ID",
				tokenKey: "TOKEN KEY",
				jenkinsUse : "사용 유무",
				mode : "mode",
				jenkinsClass : "_class",
				jenkinsDescription : "description",
				jenkinsNodeName : "nodeName",
				jenkinsNodeDesc : "nodeDescription",
				statusLable :"상태",
				systemRegisterLabel :"시스템 등록 유무",
				systemRegister : "등록",
				notSstemRegister : "미등록",
				jobClass : "_class",
				jobStatusEtc : "ETC",
				jobStatusSuccess : "SUCCESS",
				jobStatusFail : "FAIL",
				jobStatusAborted : "ABORTED",
				jobStatusNotBuilt : "NOT BUILT"
			},
			button:{
				jobUpdate : "수정",
				jobDelete : "삭제",
				jobDetail : "상세 정보",
				jobInsert : "신규 JOB 등록",
				moveJobList : "JOB 목록 이동"
			},
			message:{
				confirm:{
					deleteMessage :"를 삭제하시겠습니까?"
				}
			}
		},
		stm9100: {
			title : {
				jobManagement : "JOB 관리"
			},
			button:{
				common:{
					selectConnection:"선택 접속 확인",
					allConnection:"전체 접속 확인"
				},
				job:{
					selectTooltip: "Job 조회",
					insertTooltip: "Job 추가",
					updateTooltip: "Job 수정",
					deleteTooltip: "Job 삭제"	,
					selectConnectionTooltip: "선택 Job 접속 확인",
					allConnectionTooltip: "전체 Job 접속 확인"
				}
			},
			actionBtn:{
				job:{
					updateBtn:"Job 수정",
					deleteBtn:"Job 삭제",
					dblClickBtn:"Job 상세보기",
					detailJenkins:"Jenkins 상세보기"
				}
			},
			modal:{
				job:{
					insertJob:"신규 Job 설정 등록",
					updateJob:"Job 설정 수정",
					detailJob:"상세 정보"
				}
			},
			message:{
				job:{
					nonSelect:"접속 확인할 Job을 선택해주세요.",
					connectSuccess:" 접속 성공"
				}
			}
		},
		stm9101:{
			label:{
				jenkins : "JENKINS",
				job : "JOB",
				jobRestoreId : "원복 JOB ID",
				tokenKey: "TOKEN KEY",
				jobParameter: "JOB 매개변수",
				jobTypeCd : "JOB TYPE",
				jobUseCd : "사용 유무",
				jobDesc : "JOB 설명"
			},
			button:{
				insert : "작성 완료",
				update : "수정 완료"
			},
			message:{
				noExistJenkins : "JENKINS 등록이 필요합니다.",
				confirm:{
					insert:"신규 JOB을 등록하시겠습니까?",
					update:"JOB 정보를 수정하시겠습니까?"
				}
			}
		},
		stm9102:{
			label:{
				leftTitle : "JOB 빌드 목록",
				rightTitle : "콘솔 로그",
				jenkinsNm : "JENKINS NAME",
				jobId : "JOB ID",
				minute : "분",
				second : "초"
			},
			message:{
				selectBuildInfo: "좌측 빌드 정보를 선택해주세요.",
				notConsoleLog: "콘솔 로그가 없습니다."
			}
		},
		stm9200:{
			common:{
				assign : "배정",
				notAssign : "제외"
			},
			title:{
				allPrjList : "전체 프로젝트 목록",
				assignJobList : "JOB 배정 목록",
				notAssignJobList : "JOB 미배정 목록",
				dplAuthSettingModal : "배포 실행 권한 설정"
			},
			button:{
				dplAuthSetting : "배포 실행 권한 설정"
			},
			toolTip:{
				searchAssignJob:"JOB 배정 목록 조회",
				searchNotAssignJob:"JOB 미배정 목록 조회",
				jobAssign :"JOB 배정",
				jobDelete : "JOB 배정 제외",
			},
			message:{
				alert:{
					treeNodeSelect : "왼쪽 트리에서 프로젝트를 선택해주세요.",
					assignJobSelect : "프로젝트에 배정된 JOB을 선택해주세요.",
					selectOneJob : "프로젝트에 배정된 JOB을 1개만 선택하세요."
				},
				toastr:{
					projectSelect : "프로젝트 그룹이 아닌 프로젝트를 선택해주세요."
				},
				confirm:{
					selJobAssign : "선택한 JOB을 배정하시겠습니까?",
					selJobNotAssign : "선택한 JOB을 배정 제외하시겠습니까?",
				}
			}
		},
		stm9201:{
			title:{
				assignDplAuth : "배포 실행 권한 목록",
				notAssignDplAuth : "미배정 권한 그룹 및 사용자"
			},
			button:{
				title:{
					dplAuthInsert : "배정 등록",
					dplAuthDelete : "배정 제외"
				},
				toolTip:{
					dplAuthInsert : "배포 실행 권한 등록",
					dplAuthDelete : "배포 실행 권한 제외",
					assignAuthSearch : "배정 실행 권한 대상 목록 조회",
					notAssignAuthSearch : "미배정 권한 대상 목록 조회"
				}
			},
			message:{
				confirm:{
					dplAuthInsert:"${1}건의 대상을 배정하시겠습니까?",
					dplAuthDelete:"${1}건의 대상을 제외하시겠습니까?"
				}
			}
		},
		stm9300:{
			button:{
				toolTil:{
					prjAssignJobSearch:"프로젝트 배정 JOB 조회"
				}
			},
			search:{
				jenkinsDesc : "Jenkins 설명",
				jobDesc : "Job 설명"
			},
			actionBtn:{
				jenkinsDetail:"Jenkins 상세보기",
				jobDetail:"Job 상세보기"
			},
			modal:{
				title:{
					detail :"상세보기"
				}
			}
		},
		bad1000:{
			selectBadInfoCnt : "1건의 게시글을 선택하세요. </br> ${1}건의 게시글이 선택되었습니다." ,
			notAuthority : {
					basic : "해당 게시글에 대한 권한이 없습니다.",
					insertMessage : "게시글 등록 권한이 없습니다.",
					selectMessage : "해당 게시글에 대한 읽기 권한이 없습니다.",
					updateMessage : "해당 게시글에 대한 수정 권한이 없습니다.",
					deleteMessage : "해당 게시글에 대한 삭제 권한이 없습니다.",
			},
			notWriter : {
				deleteMessage : "본인이 작성한 게시글만 삭제 가능합니다.",
			},
			label:{
				deleteBadge: "삭제",
				noticeBadge: "공지",
			},
			field:{
				
				tagNm:"태그",
				
				badContent: "내용",
				badNtcCheck : "공지유무",
				delCd:"삭제유무",
				cmtContent:"댓글내용",
			},
			button:{
				dblClick : "상세",
			},
			actionBtn:{
				title: "수정 / 삭제 / 상세",
				updateBtn:"게시글 수정",
				deleteBtn:"게시글 삭제",
				dblClick:"게시글 상세보기",
				selectTooltip:"게시글 조회",
				insertTooltip:"게시글 추가",
				updateTooltip:"게시글 수정",
				deleteTooltip:"게시글 삭제",
				detailTooltip:"게시글 상세",
			},
			title:{
				passwordCheck:"비밀번호 확인",
				boardCheck:{
					oneStep: "[ NO.${1} ] 게시글",
					twoStep: "[ NO.${1} ] 게시글 외 ${2} 건"
				},
				deleteReason: "삭제 사유",
			}
		},
		bad1001:{
			notAuthority : {
				updateMessage : "해당 게시글에 대한 수정 권한이 없습니다.",
				restoreMessage : "해당 게시글에 대한 복원 권한이 없습니다.",
				deleteMessage : "해당 게시글에 대한 삭제 권한이 없습니다.",
				deleteCmtMessage : "해당 댓글에 대한 삭제 권한이 없습니다.",
			},
			notCmtWriter : {
				deleteMessage : "본인이 작성한 댓글만 삭제 가능합니다.",
			},
			button:{
				restore : "복구",
				submit : "등록",
			},
			label:{
				writeDate : "작성일시",
				attachFile : "파일 첨부",
				tag: "태그",
				comment:"댓글",
			},
			actionBtn:{
				title : "삭제",
				updateTooltip : "게시글 수정",
				deleteTooltip : "게시글 삭제",
				restoreTooltip : "게시글 복구",
				selectComment : "댓글 조회",
				deleteComment : "댓글 삭제",
			},
			title:{
				boardCheck:{
					oneStep: "[ NO.${1} ] 게시글",
				},
				deleteReason: "삭제 사유",
			}
		},
		bad1002:{
			insert: "글 작성을 완료하시겠습니까?",
			formCheck : {
				fileCntMessage : "첨부파일 가능한 개수는 ${1}개입니다.",
				passwordMessage : "비밀글에 사용할 비밀번호를 입력해주세요.",
				passwordMatching : "입력된 비밀번호가 서로 다릅니다.",
				tagMatching : "태그값이 중복됩니다.",
			},
			label:{
				title:"제목",
				content:"내용",
				noticeCheck:"공지사항 사용",
				noticeDate:"공지 기간",
				noticeDateIgnore:"공지 기간 무시",
				secretCheck:"비밀글 사용",
				password:"PW",
				passwordCheck:"PW 확인",
				commentCheck:"댓글 허용",
				attachFile : "파일 첨부",
				tag : "태그",
			},
			button:{
				insertSubmit:"등록",
				submit : "등록",
			},
			placeholder:{
				badTitle : "제목",
				badContent : "내용",
				password : "알파벳, 숫자 4-12자 이내",
				nullPassword : "공백인 경우 기존 비밀번호 사용",
			},
			regex:{
				password : "알파벳, 숫자 4-12자 이내",
			},
		},
		bad1003:{
			update: "글 수정을 완료하시겠습니까?",
			label:{
				title:"제목",
				content:"내용",
				noticeCheck:"공지사항 사용",
				noticeDate:"공지 기간",
				noticeDateIgnore:"공지 기간 무시",
				secretCheck:"비밀글 사용",
				password:"PW",
				passwordCheck:"PW 확인",
				commentCheck:"댓글 허용",
				attachFile : "파일 첨부",
				tag : "태그",
			},
			button:{
				deleteResetBtn:"삭제 초기화",
				updateSubmit : "수정 완료",
				submit : "등록",
			}
		},
		bad1004:{
			passwordMiss : "비밀번호가 틀렸습니다. </br> 다시 입력하세요.",
			title:{
				detail:"게시글 상세보기",
			},
			text : "이 글은 비밀글입니다. </br> 비밀번호를 입력하세요.",
			button:{
				submit: "확인",
			}
		},
		bad1005:{
			label:{
				deleteType : "삭제 유형",
				deleteReason: "삭제 사유"
			},
			button:{
				submit : "삭제",
			}
		},
		bad1006:{
			button:{
				card : "카드형",
				grid : "그리드형",
				folding : "접기",
				unfolding : "펼치기"
			},
			actionBtn:{
				title: "수정 / 삭제 / 상세",
				detailBtn : "상세",
				updateBtn:"게시글 수정",
				deleteBtn:"게시글 삭제",
				dblClick:"게시글 상세보기",
			},
			actionTooltip : {
				selectTooltip: " 게시글 조회",
				insertTooltip : "게시글 추가",
				updateTooltip : "게시글 수정",
				deleteTooltip : "게시글 삭제",
				dblClickTooltip : "게시글 상세"
			},
			notAuthority : {
				basic : "해당 게시글에 대한 권한이 없습니다.",
				insertMessage : "게시글 등록 권한이 없습니다.",
				selectMessage : "해당 게시글에 대한 읽기 권한이 없습니다.",
				updateMessage : "해당 게시글에 대한 수정 권한이 없습니다.",
				deleteMessage : "해당 게시글에 대한 삭제 권한이 없습니다.",
			},
			notWriter : {
				deleteMessage : "본인이 작성한 게시글만 삭제 가능합니다.",
			},
			label:{
				deleteBadge: "삭제",
				noticeBadge: "공지",
				hit : "조회수",
			},
			field:{
				
				tagNm:"태그",
				
				badContent: "내용",
				badNtcCheck : "공지유무",
				delCd:"삭제유무",
				cmtContent:"댓글내용",
			},
			title:{
				passwordCheck:"비밀번호 확인",
				boardCheck:{
					oneStep: "[ NO.${1} ] 게시글",
					twoStep: "[ NO.${1} ] 게시글 외 ${2} 건"
				},
				deleteReason: "삭제 사유",
			},
			alert:{
				selectBadInfoCnt : "1건의 게시글을 선택하세요. </br> ${1}건의 게시글이 선택되었습니다." ,
				notUser : "없는 회원입니다."
			}
		},
		bad1007 : {
			button:{
				restore : "복구",
				submit : "등록",
			},
			actionBtn:{
				title : "삭제"
			},
			actionTooltip : {
				updateTooltip : "게시글 수정",
				deleteTooltip : "게시글 삭제",
				restoreTooltip : "게시글 복원",
				selectCommentTooltip : "댓글 조회",
				deleteCommentTooltip : "댓글 삭제",
			},
			label:{
				tag : "태그",
				comment : "댓글",
			},
			notAuthority : {
				updateMessage : "해당 게시글에 대한 수정 권한이 없습니다.",
				restoreMessage : "해당 게시글에 대한 복원 권한이 없습니다.",
				deleteMessage : "해당 게시글에 대한 삭제 권한이 없습니다.",
				deleteCmtMessage : "해당 댓글에 대한 삭제 권한이 없습니다.",
			},
			notCmtWriter : {
				deleteMessage : "본인이 작성한 댓글만 삭제 가능합니다.",
			},
			title:{
				boardCheck:{
					oneStep: "[ NO.${1} ] 게시글",
				},
				deleteReason: "삭제 사유",
			},
			confirm : {
				fileDownload : "이미지를 다운로드하시겠습니까?",
				
			}
		},
		bad1008:{
			insert: "글 작성을 완료하시겠습니까?",
			button : {
				submit : "등록",
				insertSubmit : "등록"
			},
			label:{
				title : "제목",
				attachments : "파일 첨부",
				content : "내용",
				noticeCheck : "공지사항 사용",
				noticeDate : "공지 기간",
				noticeDateIgnore : "공지기간 무시",
				secretCheck : "비밀글 사용",
				password : "PW",
				passwordCheck : "PW 확인",
				commentCheck : "댓글 허용",
				tag : "태그",
			},
			placeholder:{
				badTitle : "제목",
				badContent : "내용",
				password : "알파벳, 숫자 4-12자 이내",
				nullPassword : "공백인 경우 기존 비밀번호 사용",
			},
			regex:{
				password : "알파벳, 숫자 4-12자 이내",
			},
			formCheck : {
				fileCntMessage : "첨부파일 가능한 개수는 ${1}개입니다.",
				passwordMessage : "비밀글에 사용할 비밀번호를 입력해주세요.",
				passwordMatching : "입력된 비밀번호가 서로 다릅니다.",
				tagMatching : "태그값이 중복됩니다.",
			},
		},
		bad1009:{
			update: "글 수정을 완료하시겠습니까?",
			label:{
				title:"제목",
				content:"내용",
				noticeCheck:"공지사항 사용",
				noticeDate:"공지 기간",
				noticeDateIgnore:"공지 기간 무시",
				secretCheck:"비밀글 사용",
				password:"PW",
				passwordCheck:"PW 확인",
				commentCheck:"댓글 허용",
				attachFile : "파일 첨부",
				tag : "태그",
			},
			button:{
				deleteResetBtn:"삭제 초기화",
				updateSubmit : "수정 완료",
				submit : "등록",
			},
			placeholder:{
				badTitle : "제목",
				badContent : "내용",
				password : "알파벳, 숫자 4-12자 이내",
				nullPassword : "공백인 경우 기존 비밀번호 사용",
			},
			regex:{
				password : "알파벳, 숫자 4-12자 이내",
			},
			formCheck : {
				fileCntMessage : "첨부파일 가능한 개수는 ${1}개입니다.",
				passwordMessage : "비밀글에 사용할 비밀번호를 입력해주세요.",
				passwordMatching : "입력된 비밀번호가 서로 다릅니다.",
				tagMatching : "태그값이 중복됩니다.",
			},
		}
	};
	
	
	lang["en"] = {
		fromValidate:{
			messages: {
				required: "This field is required.",
				remote: "Please fix this field.",
				email: "Please enter a valid email address.",
				url: "Please enter a valid URL.",
				date: "Please enter a valid date.",
				dateISO: "Please enter a valid date (ISO).",
				number: "Please enter a valid number.",
				digits: "Please enter only digits.",
				equalTo: "Please enter the same value again.",
				maxlength: "Please enter no more than {0} characters.",
				minlength: "Please enter at least {0} characters.",
				rangelength: "Please enter a value between {0} and {1} characters long.",
				range: "Please enter a value between {0} and {1}.",
				max: "Please enter a value less than or equal to {0}.",
				min: "Please enter a value greater than or equal to {0}.",
				step: "Please enter a multiple of {0}.",
				regexstr: "The input value does not fit the format."
			}
		},
		modal:{
			close: "Close"
		},
		portlet:{
			tools: {
				toggle: {
					collapse: 'Collapse',
					expand: 'Expand'
				},
				reload: 'Refresh',
				remove: 'Remove'
			}
		},
		tree:{
			label:{
				contextmenu:{
					allNodeOpen:"Expand All",
					allNodeClose:"Collapse All",
					selNodeOpen:"Expand Selection",
					selNodeClose:"Collapse Selection"
				}
			},
			search:{
				title: "Search",
				placeholder: "After entering, please press enter key"
			},
			error:{
				handler:"An error occurred while controlling the tree menu."
			}
		},
		file:{
			error:{
				downloadWait: "File data is being set. </br> Please try again."
			}
		},
		datatable:{
			button:{
				select: "Select",
				insert: "Insert",
				update: "Update",
				delete: "Delete",
				trash: "Trash",
				upload:"Upload",
				excel:"Excel",
				print:"Print",
				download:"Form Download",
				title:{
					select: "Data Select",
					insert: "Data Insert",
					update: "Data Update",
					delete: "Data Delete",
				}
			},
			action:{
				functionNm: "Function Button",
				update:{
					nonSelect: "Please select the data you want to modify",
					manySelect: "Please select only one data. </br> ${1} data was selected."
				},
				delete:{
					nonSelect:"Please select the data you want to delete",
					confirm: "Are you sure you want to delete ${1} data?"
				}
			},
			translate:{
				records:{
					processing: "Data is being retrieved.",
					noRecords: "There is no data.",
				},
				toolbar:{
					pagination:{
						items:{
							first: "first",
							prev: "previous",
							next: "Next",
							last: "Last",
							more: "More",
							input: "Page Number",
							select: "List Size",
							info: "Currently  {{start}} - {{end}} / {{total}}"
						}
					}
				}
			},
			search:{
				title: "Search",
				placeholder: "After entering, please press enter key",
				allTitle: "All"
			},
			
			arm1000ArmTable:{
				checkCd : "Read",
				sendUsrNm : "Send User",
				usrNm : "Recive User",
				armTitle : "Title",
				sendDtm : "Date"
			},
			arm1000CmmTable:{
				sendUsrNm : "From User Name",
				armTitle : "Title",
				sendDtm : "Date",
			},
			bad1000BadTable:{
				badContent: "Content",
				badNtcCheck : "Notice",
				delCd:"Delete",
				cmtContent:"Comment",
				tagNm:"Tag",
				badTitle:"Title",
				badHit: "Hit",
				badFileCnt: "Attachments Count",
				badUsrId: "Writer",
				badWtdtm: "Write Date",
			},
			bad1001CmtTable:{
				writer : "Writer",
				content:"Comment",
				writeDate : "Date"
			},
			cmm6401Table:{
				usrNm : "User Name",
				usrId : "Id",
				email : "E-mail",
				tel : "Contact",
				deptName: "Department",
			},
			cmm6700DplTable:{
				dplSignUseNm : "Sign Use",
				nowSignTypeNm : "Sign Status",
				lastSignUsrNm : "Sign User",
				dplStsNm:"Deploy Status",
				dplNm:"Deploy Title",
				dplDt:"Deploy Date",
				dplVer:"Deploy Version",
				dplTypeNm:"Deploy Type",
				dplRevisionNum:"Deploy Revision Number",
				dplDt : "Deploy Date",
				dplUsrNm : "Deploy User"	
			},
			cmm6800RevisionFileTable:{
				type : "Type",
				name : "File Name",
			},
			cmm6800RepTable:{
				revision : "Revision",
				comment : "Commit Log",
				author : "Commiter ID",
				logDate : "Date"
			},
			cmm6000PrjTable:{
				upPrjNm:"Project Group Name",
				prjId:"Project ID",
				prjNm:"Project Name",
				startDt:"Project Start Day",
				endDt:"Project End Day",
			},
			dpl1000DplTable:{
				dplSignUseNm : "Sign Use",
				nowSignTypeNm : "Sign Status",
				lastSignUsrNm : "Sign User",
				dplStsNm:"Deploy Status",
				dplNm:"Deploy Title",
				dplDt:"Deploy Date",
				dplVer:"Deploy Version",
				dplTypeNm:"Deploy Type",
				dplRevisionNum:"Deploy Revision Number",
				dplDt : "Deploy Date",
				dplUsrNm : "Deploy User"	
			},
			dpl4000DplTable:{
				dplSignUseNm: "Approval Used Check",
				nowSignTypeNm: "Approval Status",
				lastSignUsrNm : "Approver",
				dplStsNm: "Deploy Status",
				dplVer: "Deploy Version",
				dplNm: "Deploy Name",
				dplTypeNm : "Deploy Type",
				dplRevisionNum : "Deploy Revision Number",
				dplDt : "Deploy Date",
				dplUsrNm : "Deployer"
			},
			dpl4000AssReqTable:{
				reqNm : "Request Title",
				reqOrd : "Request Number",
				reqProTypeNm : "Processing Status",
				reqDtm : "Request Date",
			},
			dpl4000AssJobTable:{
				jobTypeNm : "Job Type",
				jobId : "JOB ID",
				jobRestoreId : "Restore JOB ID",
				bldResultMsg :"Build Result",
				jobParameter :"Job Parameter"
			},
			req1000ReqTable:{
				prjNm: "Project Name",
				prjGrpNm: "Prject Group Name",
				reqOrd: "Order",
				reqProTypeNm: "Process Type",
				reqNm: "Request Name",
				reqDtm: "Request Date",
				reqUsrNm: "Request User Name",
				regDtmDay: "Registration Date",
				reqUsrEmail: "Request User Email",
				reqUsrDeptNm: "Request Department Name",
				reqUsrNum: "Request User Number",
				reqKey: "Request Key",
			},
			req1100AssTable:{
				reqNm: "Request Name",
				reqOrd : "Request Number",
				reqProTypeNm :"Processing Status",
				reqDtm : "Request Date",
			},
			req1100NonTable:{
				reqNm: "Request Name",
				reqOrd : "Request Number",
				reqProTypeNm :"Processing Status",
				reqDtm : "Request Date",
			},req3000Table:{
				reqGrpNm:"Group requestion Name",
				reqGrpLinkCnt:"Linked requestion Counts",
				reqGrpUsrNm:"Request User Name",
				reqGrpUsrEmail:"Request email",
				reqGrpUsrDeptNm: "Request Department Name",
				reqGrpUsrNum: "Request User Number",
				regGrpChargerNm:"Request Charger Name",
				regDtmDay:"Write Date"
			},
			req3001UnconnectReqTable:{
				prjNm:"Project Name",
				reqOrd:"Request order",
				reqNm:"Request Name",
			},
			req3001ConnectReqTable:{
				prjNm:"Project Name",
				reqOrd:"Request order",
				reqNm:"Request Name",
			},
			req4100ReqTable:{
				prjGrpNm: "Project Group Name",
				prjNm: "Project Name",
				reqOrd: "Request Number",
				reqProTypeNm: "Processing Status",
				reqNm: "Title",
				reqDtm: "Request Date",
				regDtm: "Write Date",
				reqUsrNm: "Requester",
				reqUsrEmail: "Requester E-mail",
				reqUsrDeptNm: "Requester Department",
				reqUsrNum: "Requester Contact",
				reqKey: "Request Key"
			},
			prepListTable:{
				reqProTypeNm : "Processing Status",
				reqOrd : "Request Number",
				prjNm : "Project Name",
				reqNm : "Title",
				reqDtm : "Request Date"
			},
			prj1000PrjTable:{
				prjNm: "Project Group Name",
				startDt: "Start Date",
				endDt: "End Date",
				prjChildCnt: "Project Count",
				reqAllCnt: "Request All",
				reqInProgressCnt: "Request In Porgress",
				reqDoneCnt: "Request Done",
			},
			prj1200PrjTable:{
				prjSetTargetNm: "Setting Target",
				prjSetNm: "Setting Name",
				prjSetDesc : "Setting Description",
				prjSetValNm:"Setting Value",
				modifyDtmDay:"Modify Date",
				modifyUsrNm:"Final Modifier",
			},
			spr1000SprTable:{
				sprTypeNm : "Type",
				sprNm : "Sprint Title",
				sprStdtm : "Start Date",
				sprEddtm : "End Date",
				sprDesc : "Sprint Description",
				sprDtm :"Date Range",
			},
			spr2000RptTable:{
				rptNm : "Meeting Log Title",
				rptMemCnt : "Meeting Members",
				rptUsrId : "Writer",
				rptDtm : "Write Date",
			},
			spr2100RptTable:{
				sprNm:"Sprint Title",
				mmrNm:"Memoirs Title",
				mmrUsrId : "Wirter",
				mmrDtm :"Write Date",
			},
			stm2200AuthTable:{
				authGrpNm: "Auth Group Name",
				ord: "Ord",
				usrTypNm : "User Type",
				acceptUseNm:"Accept Use",
				useNm:"Use Name",
				authGrpDesc:"Auth Group Desc"
			},
			stm8000RepTable:{
				result : "Connection",
				useNm : "Used",
				strgTypeNm : "Type",
				strgRepTitle : "Repository Title",
				strgTxt : "Repository Description",
				strgRepUrl : "Repository URL",
			},
			stm8002RevisionFileTable:{
				type : "Type",
				name : "File Name",
			},
			stm8002RepTable:{
				revision : "Revision",
				comment : "Commit Log",
				author : "Commiter ID",
				logDate : "Date"
			},
			stm8004FileTable:{
				revision : "Revision",
				comment : "Commit Log",
				author : "Commiter ID",
				logDate : "Date"
			},
			stm8100AssignStrgTable:{
				strgTypeNm : "Type",
				strgRepTitle : "Repository Title",
				strgTxt : "Repository Description",
				strgRepUrl : "Repository URL",
			},
			stm8100NotAssignStrgTable : {
				strgTypeNm : "Type",
				strgRepTitle : "Repository Title",
				strgTxt : "Repository Description",
				strgRepUrl : "Repository URL",
			},
			stm8200RepTable:{
				useNm : "Used",
				prjGrpNm : "Project Group Name",
				prjNm : "Project Name",
				strgTypeNm : "Type",
				strgRepTitle : "Repository Title",
				strgTxt : "Repository Description",
				strgRepUrl : "Repository URL",
			},
			stm9000JenkinsTable:{
				result : "Connection check",
				jenNm: "Jenkins Name",
				jenUrl: "Jenkins Url",
				jenUsrId: "Jenkins User Id",
				useNm:"Jenkins Use",
				jenDesc:"Jenkins Description"
			},
			stm9100JobTable:{
				jenNm:"Jenkins Name",
				jobTypeNm:"Job Type",
				jobId:"Job Id",
				jobRestoreId:"Restore Job Id",
				jobParameter:"Job Parameter",
				useNm:"Jenkins Use",
				jobDesc:"Job Description"
			},
			stm9102JobBuildTable:{
				bldNum: "Build Number",
				bldResult: "Build Result",
				bldStartDtm: "Build Start Time",
				bldDurationTm: "Duration Time",
				regUsrNm: "Distributor"
			},
			stm9200AssignJobTable:{
				prjNm: "Project Name",
				jenNm: "Jenkins Name",
				jenUrl: "Jenkins URL",
				jobId: "Job Id",
				jobTypeNm: "Job Type",
				jobRestoreId: "Restore Job Id",
				jobParameter: "Job Parameter"
			},
			stm9200NotAssignJobTable:{
				jenNm: "Jenkins Name",
				jenUrl: "Jenkins URL",
				jobId: "Job Id",
				jobTypeNm: "Job Type",
				jobRestoreId: "Restore Job Id",
				jobParameter: "Job Parameter"
			},
			stm9201AssignDplAuthTable:{
				authTypeNm : "Authority Type",
				dplAuthTargetId: "Authority Target ID",
				dplAuthTargetNm : "Authority Target Name",
				usrPositionNm : "Position",
				usrDutyNm : "Duty Responsibility",
				deptName : "Department"
			},
			stm9201NotAssignDplAuthTable:{
				authTypeNm : "Authority Type",
				dplAuthTargetId: "Authority Target ID",
				dplAuthTargetNm : "Authority Target Name",
				usrPositionNm : "Position",
				usrDutyNm : "Duty Responsibility",
				deptName : "Department"
			},
			stm9300PrjJobTable:{
				prjNm: "Project Name",
				jenNm: "Jenkins Name",
				jenUrl: "Jenkins URL",
				jobId: "Job Id",
				jobTypeNm: "Job Type",
				jobRestoreId: "Restore Job Id",
				jobParameter: "Job Parameter",
				useNm: "Jenkins Use"
			}
		},
		date:{
			datepicker:{
				days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
				daysShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
				daysMin: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
				months: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
				monthsShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
				today: "Today",
				monthsTitle: "day select",
				clear: "Clear",
				weekStart: 0,
				format: "yyyy-mm-dd",
			},
			moment:{
				months: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
				monthsShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
		        weekdays : ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
		        weekdaysShort : ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
		        weekdaysMin : ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
		        longDateFormat : {
		            LT : 'HH:mm',
		            LTS : 'HH:mm:ss',
		            L : 'YYYY-MM-DD',
		            LL : 'YYYY MMMM D',
		            LLL : 'YYYY MMMM D HH:mm',
		            LLLL : 'YYYY MMMM D dddd HH:mm'
		        },
		        calendar : {
		            sameDay : 'Today',
		            nextDay : 'Next day',
		            nextWeek : 'Next week',
		            lastDay : 'yesterday',
		            lastWeek : 'Last week',
		            sameElse : ''
		        },
		        relativeTime : {
		            future : 'dans %s',
		            past : 'il y a %s',
		            s : 'second',
		            ss : '%d second',
		            m : 'minute',
		            mm : '%d minute',
		            h : 'hour',
		            hh : '%d hour',
		            d : 'day',
		            dd : '%d day',
		            M : 'month',
		            MM : '%d month',
		            y : 'year',
		            yy : '%d year'
		        },
		        dayOfMonthOrdinalParse: /\d{1,2}(er|)/,
		        week : {
		            dow : 0,
		            doy : 4  
								
		        }
		    },
		    agoTime:{
				suffixAgo: "ago",
				justNow: "Just now",
	            s : '${1} second',
	            m : '${1} minute',
	            h : '${1} hour',
	            d : '${1} day',
	            M : '${1} month',
	            y : '${1} year',
			}
		},
		common:{
			logout:{
				confirm:"Are you sure you want to log out?",
				button:"Log Out"
			},
			user:{
				pwChange:"",
				validate:{
					usrId: "Please enter your ID.",
					usrPw: "Please enter your password.",
					usrPwIndexOfUsrId: "Your password cannot contain your user ID.",
					usrPwContinue: "You can't use the same character </br> more than 3 times consecutively in the same password.",
					usrPwContinueMatch: "Password cannot use more than </br> ${1} characters in consecutive strings (123, abc, etc.)",
				},
				myPage:{
					title:"Update personal information",
					error:"Since there is no user information,</br> you cannot go to the personal information modification screen."
				}
			},
			error:{
				sessionInvalid:"The session has expired and you will be taken to the login page.",
				nonAuth:"ou are not authorized to do so."
			},
			menu:{
				top: "top",
				upper: "upper",
				name: "menu name",
			},
			name:{
				prjGrp: "Group Name",
				prj: "Project Name",
				authGrp: "AuthGroup Name",
				all: "All",
				select: "Select"
			},
			alert:{
				title: "Alarm",
				ok: "Ok",
				cancel: "Cancel"
			}
		},
		
		arm1000:{
			label:{
				title : "MESSAGE",
				get : "Received Message",
				send: "Sent Message",
				alone: "Sent To Me"
			},
			button :{
				tooltip : {
					selectBtn : "Select Message",
					insertBtn : "Send Message",
					reInsertBtn : "Reply Message",
					checkBtn : "Read Check Message",
					deleteBtn : "Delete Message",
					dblClickBtn :"Detail Message"
				},
				detailBtn : "Detail",
				reInsertBtn : "Reply",
				checkBtn : "Read Check"
			},
			
			field: {
				sendUsrId : "From User Id",
				sendUsrEmail : "From User E-mail",
				usrNm : "To User Name",
				usrId : "To User Id",
				usrEmail :"To User E-mail",
				armContent : "Content"
			},
			actionBtn : {
				title : "Del / Det / Rep",
				insertTitle : "Write Message",
				reInsertTitle :"Reply Message",
				dblClickTitle : "Detail Message",
			},
			alert :{
				message : {
					selectMessage : "Select a message to reply to.",
					selectOneMessage : "Please select only 1 message. </br>${1} messages have been selected.",
				}
			}
		},
		arm1001:{
			label : {
				to : "To",
				title : "Title",
				content : "Content",
				attachments: "Attachments", 
			},
			placeholder :{
				title : "Title",
				content : "Content",
				select2 : "Click or Search Text"
			},
			message :{
				inputToUser : "Please enter the recipient.",
				send : "Would you like to send a message?",
			},
			button : {
				submit : "Send"
			}
		},
		arm1002 : {
			label : {
				title: "Title",
				content: "Content",
				attachments: "Attachments", 
			},
			button : {
				reSend : "Reply"
			},
			title :"Reply Message"
		},
		cmm6000:{
			title:{
				mainPrjSetting:"Main Project Setting",
				searchPrj:"Project Search",
			},
			field:{
				prjNm:"Project Name",
			},
			actionBtn:{
				clickBtn:"Select",
			},
			button:{
				search:"Search"
			},
		},
		cmm6401:{
			field: {
				
				usrNm : "User Name",
			},
			actionBtn : {
				title : "Select",
				clickBtn : "Select",
			},
		},
		cmm6600:{
			label : {
				signAuth : "Signature authority",
				sign : "Signature",
				subSign : "대결",
				allSign : "전결",
				title : {
					usrList : "User List",
					signLineInfo : "Signature Line Info" 
				}
			},
			button : {
				upMove : "Up",
				downMove : "Down",
				saveSignLine : "Save signature line"
			},
			message : {
				alert : {
					notRgsSignUsr : "There are no registered approvers.",
					treeSelect : "Select a user in the tree on the left.",
					notSelSignUsr : "There are no selected signature user"
				},
				confirm : {
					saveString : "Do you want to save the approval line information?"
				}
			},
			modal : {
				title : {
					reqSignLine : "Save Signature Line",
					
				}
			}
		},
		cmm6601:{
			infomation : {
				cannotUpdate : "If there is a file waiting for approval, the approval line cannot be modified."
			}
		},
		cmm6602:{
			label : {
				signApr : "approval opinion",
				signRjt : "Reasons for rejection"
			},
			button : {
				signApr : "approval",
				signRjt : "return of approval"
			},
			message : {
				alert:{
					notSignOrd : "It is not your order of approval.",
					notEnterAprRes : "Please enter the reason for the approval.",
					notEnterRjtRes : "Please enter the reason for the rejection.",
				}
			}
		},
		cmm6800 :{
			title :{
				revision : "Revision List",
				file :"File List",
				actionTitle : {
					revisionFile : "Detail",
					repository : "Select",
				},
			},
			label : {
				revisionNum : "Revision Number",
			},
			revisionFile : {
				actionTitle : "Select",
				actionTooltip : {
					dblClickTooltip : "Code View",
					diffTooltip : "Code Diff"
				},
				message : {
					selectOne : "Please, select only 1 file. </br>${1} file have been selected."
				}
			},
			repository:{
				actionTooltip : {
					"chooseTooltip" : "Select Revision",
				}
			},
			dirTree:{
				message:{
					selectRevision : "Please, select revision.",
				}
			},
			placeholder : {
				revision : {
					start : "Start",
					end : "End",
				}
			},
			actionBtn:{
				selectTooltip :"Select Revision",
				selectFileTooltip : "Select Revision File List",
				chooseTooltip : "Revision Selection Complete",
				chooseBtn : "Complete",
				detailTooltip : "Code View",
				detailBtn : "View",
				diffTooltip : "Code Diff",
				diffBtn : "DIFF"
			},
			message :{
				selectRevision : "Please, select revision.",
				auth : "You don't have access rights."
			}
		},
		dpl2000:{
			modal : {
				title : {
					dplDetail : "[${1}] Detail Info"
				}
			}
		},
		dpl2100:{
			modal : {
				title : {
					signAprRes : "approval opinion",
					signRjtRes : "Reasons for rejection",
					dplDetail : "[${1}] Detail Info"
				}
			},
			action : {
				sign : {
					nonSelect : "Please select the data you want to approval"
				}
			},
			message : {
				confirm : {
					signApr : "Would you like to approve?",
					signRjt : "Would you like to return of approval?"
				}
			}
		},
		dpl4000:{
			dpl:{
				title: "Deployment Plan List",
				button:{
					tooltip:{
						selectTooltip: "Select Deployment Plan",
						detailTooltip : "Deployment Plan Info"
					},
					detailBtn : "Detail"
				},
				addSearch : {
					dplDesc : "Deployment Description",
				},
				actionBtn : {
					title : "Detail",
					tooltip : {
						detailTooltip : "Deployment Plan Info",
					},
					modalTitle : "[${1}] Detail Info"
				}
			},
			req:{
				title: "Request List",
				button:{
					tooltip:{
						selectTooltip: "Select Request List",
						detailTooltip : "Request Info"
					},
					detailBtn : "Detail"
				},
				actionBtn : {
					title : "Detail",
					tooltip : {
						detailTooltip : "Request Info",
					},
					modalTitle : "[${1}] Request Detail Info"
				}
			},
			job:{
				title: "JOB List",
				button:{
					tooltip:{
						selectTooltip: "Select JOB List ",
						detailTooltip : "JOB Info"
					},
					detailBtn : "Detail"
				},
				actionBtn : {
					title : "Detail",
					tooltip : {
						detailTooltip : "Job Info",
					},
					modalTitle : "Job Detail Info"
				}
			},
			message : {
				selectOneDpl : "Please, select only 1 deployment data. </br>${1} deployment datas have been selected.",
				selectOneReq : "Please, select only 1 request data. </br>${1} request datas have been selected.",
				selectOneJob : "Please, select only 1 job data. </br>${1} job datas have been selected.",
			}
		},
		prj1000:{
			startDate: "Start Date",
			endDate: "End Date",
			completedRatio: "Completed Ratio",
			projectCnt: "Register Project",
			requestAll: "All Request",
			requestInProgress: "In Progress",
			requestDone: "Done",
			menu:{
				modify: "Modify",
				trashMove: "Move Trash (delete)",
				projectListMove: "Move Project List",
				createProject: "Add New Prject",
				projectDetail: "Details"
			},
			button:{
				title:{
					select: "Project Group Select",
					insert: "New Project Group Insert",
					update: "Project Group Update",
					delete: "Project Group Delete",
					trash: "Project Group Trash List",
					card: "List View Card Type",
					grid: "List View Grid Type"
				}
			}
		},
		prj1001:{
			startDate: "시작일",
			endDate: "종료일",
			completedRatio: "진척률",
			requestAll: "전체",
			requestInProgress: "진행 중",
			requestDone: "완료",
			menu:{
				modify: "수정",
				trashMove: "휴지통 이동(삭제)",
				projectDetail: "상세 정보"
			}
		},
		prj1002:{
			title: "New Project Group Insert",
			complete: "Complete",
			insert:{
				saveString: "신규 프로젝트 그룹을 생성하시겠습니까?",
				saveBtnString: "Insert Action"
			},
			update:{
				saveString: "프로젝트 그룹을 수정하시겠습니까?",
				saveBtnString: "Update Action"
			}
		},
		prj1201:{
			title: "Project Setting Modify",
			complete: "Complete",
			update:{
				saveString: "프로젝트 설정을 수정하시겠습니까?",
				saveBtnString: "Update Action",
			},
			actionBtn : {
				updateBtn : "Project Setting Update"
			},
			label : {
				prjSetNm: "Setting Name",
				prjSetDesc: "Setting description",
				prjSetTarget: "Setting Target",
				valType: "Value Type",
				prjSetVal: "Setting Value",
				useCd: "Setting Use"
			}
		},
		prj2100:{
			allUsrInsert:"Do you want to allocate ${1} users?",
			allUsrInDelete:"Are you sure you want to exclude ${1} users?"
		},
		prj3000 : {
			label : {
				docId : "Document ID",
				docNm : "Document Name",
				docUseCd : "Document Use",
				docOrd : "Document Order",
				docEdDtm : "Document End Date",
				signUseCd : "Sign Use",
				docDesc : "Document description"
			},
			message : {
				alert : {
					treeSelect : "Select a document in the tree on the left.",
					notUsedDoc : "Sub-documents cannot be added to unused documents.",
					notRootDelete : "The top-level document(ROOT) cannot be deleted.",
					fileExtChk : "Files with an extension of [ ${1} ] cannot be attached.",
					notHaveConfFile : "Registered file does not exist.",
					notSignUseCd : "결재를 사용하지 않는 산출물 입니다."
				},
				confirm:{
					deleteDoc:"When deleting a document, the selected document and all sub-documents are deleted. Do you want to delete the selected document?",
					deleteFormFile:"Would you like to delete form file?"
				} 
			},
			modal : {
				title : {
					insertDoc : "Register New Document Form",
					updateDoc : "Modifying Document Form",
					insertDocCon : "Document Linkage",
					saveSignLine : "Designation of approval line",
					selectSignLine : "Select approval line"
				}
			},
			contextmenu : {
				insert : "Register New Document",
				update : "Modifying Document",
				delete : "delete Document"
			}
		},
		prj3001 : {
			label : {
				upperDocId : "Upper Document ID",
				upperDocNm : "Upper Document Name",
				docId : "Document ID",
				docNm : "Document Name",
				docEdDtm : "Document End Date",
				docOrd : "Document Order",
				signUseCd : "Sign Use",
				docUseCd : "Document Use",
				docDesc : "Document description"
				
			},
			button : {
				insert : "Complete",
				update : "Update Complete"
			},
			message : {
				confirm : {
					insert : "Would you like to register your document?",
					update : "Would you like to update your document?"
				}
			}
		},
		prj3002 : {
			label : {
				upperDocId : "Upper Document ID",
				upperDocNm : "Upper Document Name",
				docId : "Document ID",
				docNm : "Document Name",
				docEdDtm : "Document End Date",
				docOrd : "Document Order",
				signUseCd : "Sign Use",
				docUseCd : "Document Use",
				docDesc : "Document description"
			},
			insert : {
				saveBtnString : "Complete",
				saveString : "Would you like to link the selected document information?",
				saveMsg : "${1} data was linked.",
				saveDupleMsg : "Exclude ${2} users already connected",
				saveAllDupleMsg : "This is already linked document information. (${1})"
			},
			allDocConInsert : "Are you sure you want to connect ${1} document data?",
			allDocConDelete : "Are you sure you want to disconnect ${1} document data?"
		},
		prj3100 : {
			label : {
				docId : "Document ID",
				docNm : "Document Name",
				docUseCd : "Document Use",
				docOrd : "Document Order",
				docEdDtm : "Document End Date",
				signUseCd : "Sign Use",
				docDesc : "Document description"
			},
			message : {
				alert : {
					treeSelect : "Select a document in the tree on the left.",
					fileExtChk : "Files with an extension of [ ${1} ] cannot be attached.",
					notHaveConfFile : "Registered file does not exist.",
					lackDownloadInfo : "Insufficient information for download.",
					notCheckedFile : "No file selected."
				},
				confirm:{
					deleteFormFile:"Would you like to delete file?",
					signAtchFile : "Would you like to approve the selected files?"
				} 
			},
			modal : {
				title : {
					insertDocCon : "Document Linkage",
					signRjtRes : "return of approval"
				}
			},
			contextmenu : {
				formFileDownload : "Download Form Files",
				atchFileDownload : "Download confirmed Files",
				waitFileDownload : "Download wait Files"
			},
			toastr : {
				success : "success approval [${1} files]"
			}
		},
		prj3101 : {
			message : {
				alert : {
					notCheckedFile : "No file selected.",
					lackDownloadInfo : "Insufficient information for download."
				}
			}
		},
		prj3102 : {
			label : {
				rjtRes : "Reason for rejection"
			},
			button : {
				save : "save"
			},
			message : {
				confirm : {
					save : "Do you want to save the approval line information?"
				}
			}
		},
		prj5000:{
			button:{
				title:{
					insert: "일정 등록",
					local: 'ko',
					today: '오늘',
					fourDay: '4일',
					dataSelect: '일정 데이터 조회',
					insert: '일정 등록'
				}
			}
		},
		prj5001:{
			complete: "완료",
			insert:{
				title: "프로젝트 일정 저장",
				saveString: "신규 프로젝트 일정을 생성하시겠습니까?",
				saveBtnString: "등록 완료",
			},
			delete:{
				deleteString: "프로젝트 일정을 삭제하시겠습니까?",
				deleteBtnString: "삭제",
			},
			update:{
				title: "프로젝트 일정 수정",
				saveString: "프로젝트 일정을 수정하시겠습니까?",
				saveBtnString: "수정 완료"
			},
			view:{
				title: "일정 상세정보"
			},
			actionBtn : {
				insertBtn : "프로젝트 일정 저장",
				updateBtn : "프로젝트 일정 수정"
			},
			label : {
				evtNm: "일정명",
				evtRange: "일정 일자",
				evtDesc: "일정 설명",
				evtBgColor: "일정 배경 색상",
				evtColor: "일정 색상",
				guideColor: "가이드 색상",
			}
		},usr1100:{
			title:{
				shortcut:"Menu and rights management shortcut",
				shortcut01:"Shortcut View",
				shortcut02:"Project and Authority group select",
				shortcut03:"Popup align Center",
				shortcut04:"Add tool bar",
				shortcut05: "Refresh",
				shortcut06:"Search",
				shortcut07:"Mypage",
				shortcut08:"Message",
				shortcut09:"Alarm",
				shortcut10:"Personal Setting",
				shortcut11:"Charged requirements",
				shortcut12:"Logout",
				shortcutName:"ShortcutName",
				popupActionCd:"Action when pop-up",
				shortcutKey:"Shortcut",
			},
			btn:{
				update:"update",
				dontuse:"Dont use",
			},
			label:{
				shortcutNm:"Shortcut Name",
				popupActionCd :"Shortcut Action when popup exist",
				shortcut:"Shortcut",
			},
		},
		req1001:{
			title:"Request new requirements",
			reqUser:{
				title: "Requester Information",
				usrNm: "Name",
				email: "Email",
				deptNm: "Department Name",
				telNo: "Telephone number"
			},
			prjNm: "Project",
			reqDtm: "Request Date",
			reqNm: "Request Title",
			reqDesc: "Request description",
			reqPw:{
				title : "Request Lock",
				password : "PW",
				passwordCheck : "PW Check",
				placeholder : {
					password : "4 to 12 letters of alphabet and number combination.",
					nullPassword : "If blank, the old password is used.",
				}
			},
			attachments: "Attachments",
			requestDefaultOptNm: "Request Default Option Name",
			complete: "Complete",
			formCheck:{
				passwordMessage : "You must write password for secret request.",
				passwordMatching : "The entered passwords are different.",
			},
		},
		req1002:{
			label : {
				reqUser : {
					title : "Requester Information",
					usrNm : "Name",
					email : "E-mail",
					deptNm : "Department",
					telNo : "Contact",
				},
				group:{
					groupReqInfo : "Group Request Information",
					groupReqId : "Group Request Num",
					groupReq : "Group Request",
					groupReqDesc : "Group Request Content",
				},
				prjNm : "Project",
				reqDtm : "Request Date",
				reqId: "Request ID",
				reqOrd : "Request Ord.",
				reqProTypeNm : "Process Type Name",
				processNm : "Process",
				flowNm:"Step",
				reqNm : "Title",
				reqDesc : "Content",
				attachments : "Attachments",
				requestDefaultOptNm : "Enter basic items for application"
			},
			message:{
				notGroupReqNo : "Noting",
				notGroupReqInfo : "Group requirements are not linked.",
				notProcess : "No process assigned.",
				notStep : "Nothing"
			},
		},
		req3000:{
			allReqInDelete:"Are you sure you want to exclude ${1} requests?",
			insert:{
				saveMsg:"Connection success",
				saveDupleMsg:"That connection is already connected",
				saveAllDupleMsg:"All request is already connected",
			},
			alert:{
				checkUsrId:"You must search user name. \n because we must know about detail department belong user",
				checkChargerId:"You must search charger name. \n because we must know about detail department belong charger",
			},
			confirm:{
				insert:"Would you like to register your group requirement?",
				delete:"Would you like to delete your group requirement?",
				deleteList:"Would you like to delet your ${1} requirements?",
				update:"Would you like to update your group requirement?",
			},
			actionBtn:{
				title : "Select",
				clickBtn : "Select",
			},
			button:{
				select:"Select",
				delete:"Delete",
				insert:"Insert",
				connect:"Connect",
				reset:"Reset",
				done:"Done",
				deleteResetBtn:"Delete reset",
			},
			title:{
				detailTitle:"Group requirement detail",
				insert:"Group requirement insert",
				update:"Group requirement update",
				detail:"Group requirement Detail Information",
				selectUsr:"Search group requirement request user",
				selectCharger:"Search group requirement charger",
			},
			datatable:{
				action:{
					update:"Group requirement update",
					delete:"Group requirement delete",
					excel:"Group requirement excel",
					print:"Group requirement print",
					dblClick:"Group requirement detail"
				},
				button:{
					title:{
						select:"Group requirement select",
						insert:"Group requirement insert",
						delete:"Group requirement delete",
						update:"Group requirement update",
						excel:"Group requirement excel",
						print:"Group requirement print",
						upload:"Group requirement upload",
						download:"Form download",
						reset:"Connection reset",
						connect:"Connect"
					}
				},
			},
			label:{
				reqGrpNo:"Group requirement Number",
				reqGrpUsr:"Request User",
				reqGrpCharger:"Group requirement Charger",
				reqGrpNm:"Group requirement Name",
				reqGrpDesc:"Group requirement Descirption",
				fileUpload:"File Upload",
				linkedReqList:"Linked requirements List",
				unlinkedReqList:"Unlinked requirements List",
				linkedReqInfo:"Linked requirements Information",
				linkedReqTypeList:"Linked requirements Type List",
				total:"Total",
				ongoing:"Ongoing",
				done:"Done",
				linkedReqCount:"Linked requirements Counts",
			}
		},
		req4100:{
			button:{
				copyBtn : "Copy",
				requestAcceptBtn : "Acception"
			},
			field:{
				
				prjGrpNm: "Project Group Name",
				reqGrpNm: "Request Group Name",
				reqGrpNo : "Group Request Number",
				reqDesc : "Request Description"
			},
			actionBtn:{
				title : "Udp / Del / Det / Cop",
				updateBtn : "Request Update",
				deleteBtn : "Request Delete",
				detailBtn : "Request Detail",
				copyBtn : "Request Copy",
				selectTooltip : "Select Request",
				insertTooltip : "Insert Request",
				updateTooltip : "Update Request",
				deleteTooltip : "Delete Request",
				detailTooltip : "Detail Request",
				copyTooltip : "Copy Request",
				requestAcceptTooltip : "Acception Request"
			},
			title:{
				insertTitle : "Insert New Request",
				updateTitle : "Update Request",
				detailTitle : "Detail Request"
			},
			alert:{
				updateMsg : "You can only modify requirements whose processing status is being requested.",
				multiPwMsg : "There are ${1} requirements that require password verification. </br> You can delete locked requirements after excluding them, or you can delete locked requirements as a single item.",
				selectData : "Choose your data.",
				selectDatas : "There are ${1} requirements.</br>Select only 1 request.",
				LockData : "Locked requirements cannot be copied.",
				selectCopyData : "Copying is only possible for 1 copy. Currently ${1} are selected.",
			},
			message : {
				nothing : "Nothing",
			}
		},
		req4101:{
			complete : "Complete",
			saveString :{
				insertStr : "Would you like to register your requirements?",
				updateStr : "Would you like to modify your requirements?",
				copyStr : "Would you like to copy your requirements?",
			},
			label : {
				reqUser : {
					title : "Requester Information",
					usrNm : "Name",
					email : "E-mail",
					deptNm : "Department",
					telNo : "Contact",
				},
				group:{
					groupReqInfo : "Group Request Information",
					groupReq : "Group Request",
					groupReqDesc : "Group Request Content",
				},
				prjNm : "Project",
				reqDtm : "Request Date",
				reqNm : "Title",
				reqDesc : "Content",
				reqPw : "Request Lock",
				password : "PW",
				passwordCheck : "PW Check",
				attachments : "Attachments",
				requestDefaultOptNm : "Enter basic items for application"
			},
			placeholder:{
				usrNm : "Name",
				email : "E-mail",
				deptNm : "Department",
				tel : "Contact",
				selectGroup : "Select Group Request",
				reqDtm : "Request Date",
				reqNm : "Title",
				password : "4 to 12 letters of alphabet and number combination.",
				nullPassword : "If blank, the old password is used.",
			},
			regex:{
				password : "4 to 12 letters of alphabet and number combination.",
			},
			modalTitle : {
				userSearch : "User Search",
				reqGrpSearch: "Grop requirements Seacrh",
			},
			button :{
				deleteResetBtn : "Delete Reset",
				insertBtn : "Insert Request",
				updateBtn : "Update Request",
				copyBtn : "Copy Request",
				searchBtn : "Search"				
			},
			prepData : {
				title : "Previous Knowledge",
				reqNm : "Title",
				result : "Have the following concatenation result : ",
				notResult : "No Result",
				total : "Total",
				count : "Request",
				tooltip : {
					selectTooltip : "Select Previous Knowledge",
					detailTooltip : "Detail Request",
					card : "Card",
					grid : "Grid",
				},
				button : {
					detailBtn : "Detail",
				},
			},
			formCheck:{
				passwordMessage : "You must write password for secret request.",
				passwordMatching : "The entered passwords are different.",
			},
		},
		req4102:{
			label : {
				reqUser : {
					title : "Requester Information",
					usrNm : "Name",
					email : "E-mail",
					deptNm : "Department",
					telNo : "Contact",
				},
				group:{
					groupReqInfo : "Group Request Information",
					groupReqId : "Group Request Num",
					groupReq : "Group Request",
					groupReqDesc : "Group Request Content",
				},
				prjNm : "Project",
				reqDtm : "Request Date",
				reqId: "Request ID",
				reqOrd : "Request Ord.",
				reqProTypeNm : "Process Type Name",
				processNm : "Process",
				flowNm:"Step",
				reqNm : "Title",
				reqDesc : "Content",
				attachments : "Attachments",
				requestDefaultOptNm : "Enter basic items for application"
			},
			message:{
				notGroupReqNo : "Noting",
				notGroupReqInfo : "Group requirements are not linked.",
				notProcess : "No process assigned.",
				notStep : "Nothing"
			},
		},
		req4103:{
			passwordMiss : "It doesn’t match the password for this post. </br> Please try again.",
			text: "This is secret request. </br> You must entered password.",
			button:{
				submit : "Submit",
			}
		},
		req4104:{
			field:{
				reqGrpNm:"Group requirements Name",
			},
		},
		spr1100:{
			title : {
				sprint : "Sprint List",
				assignment : "Assignment Request List",
				unassigned : "Unassigned Request List",
			},
			button:{
				removeBtn: "Remove",
				addBtn:"Add"
			},
			actionBtn :{
				title :{
					selectBtn : "Select",
					removeBtn :"Remove",
					addBtn :"Add",
					sprSelect : "Select Sprint",
					assSelect : "Select Assignment Request",
					nonSelect : "Select Unassigned Request",
				},
				tooltip :{
					clickToolTip : "Select Sprint",
					removeToolTip :"Remove Request",
					addToolTip :"Add Request",
				},
			}
		},
		spr2000:{
			title :"Meeting Log List",
			button:{
				detailBtn : "Detail",
			},
			actionBtn:{
				title : "Upd / Del / Det",
				selectTooltip : "Select Meeting Log",
				insertTooltip : "Insert Meeting Log",
				updateTooltip : "Update Meeting Log",
				deleteTooltip : "Delete Meeting Log",
				detailTooltip : "Detail Meeting Log",
			},
			message : {
				selectMsg : "Please, select 1 sprint.",
			},
			title : {
				insertTitle : "Insert Meeting Log",
				updateTitle : "Update Meeting Log",
				detailTitle : "Detail Meeting Log",
			}
		},
		spr2001:{
			submit: "Complete",
			label : {
				sprNm : "Sprint Title",
				rptMem: "Meeting Members",
				rptNm :"Title",
				rptDesc : "Description",
			},
			button : {
				insertBtn : "Insert Meeting Log",
				updateBtn : "Update Meeting Log",
			},
			placeholder:{
				rptNm : "Title",
				select2 : "Click or Search Text"
			},
			message : {
				select2 : "If not, the writer is automatically added."
			}
		},
		spr2100:{
			title :"Memoris List",
			button:{
				detailBtn : "Detail",
			},
			actionBtn:{
				title : "Upd / Del / Det",
				selectTooltip : "Select Memoris",
				insertTooltip : "Insert Memoris",
				updateTooltip : "Update Memoris",
				deleteTooltip : "Delete Memoris",
				detailTooltip : "Detail Memoris",
			},
			message : {
				selectMsg : "Please, select 1 sprint.",
			},
			title : {
				insertTitle : "Insert Memoris",
				updateTitle : "Update Memoris",
				detailTitle : "Detail Memoris",
			}
		},
		spr2101:{
			submit: "Complete",
			label : {
				sprNm : "Sprint Title",
				mmrNm :"Title",
				mmrDesc : "Description",
			},
			button : {
				insertBtn : "Insert Memoris",
				updateBtn : "Update Memoris",
			},
			placeholder:{
				mmrNM : "Title",
			}
		},
		dpl1000:{
			label:{
				button:{
					signLine:"Request Signature",
					actionBtn:"기능 버튼"
				}
			},
			tooltip:{
				button:{
					signReqDplBtn: "배포 계획 결재선 지정",
					selectBtn: "배포 계획 조회",
					insertBtn: "신규 배포 계획 추가",
					updateBtn: "배포 계획 수정",
					deleteBtn: "배포 계획 삭제"
				},
				actionBtn:{
					signReqDplBtn: "Request Signature",
					updateBtn: "배포 계획 수정",
					deleteBtn: "배포 계획 삭제",	
					detailBtn: "배포 계획 상세보기"
				}
			},
			modal:{
				title:{
					insertDpl:"신규 배포 계획 생성",
					updateDpl:"배포 계획 수정",
					detailDpl:"상세 정보",
					signReq : "[${1}] Deployment plan signature Request",
					selSignLine : "[${1}] Deployment plan signature current situation",
					reSignReq : "[${1}] Deployment plan signature re-request",
				}
			},
			message:{
				alert:{
					successDplNotUpdate:"성공된 배포 계획은 수정이 불가능합니다.",
					signConfDplNotUpdate:"결재 승인된 배포 계획은 수정이 불가능합니다.",
					signStandDplNotUpdate:"결재 대기중인 배포 계획은 수정이 불가능합니다.",
					signConfDplNotDelete:"결재 승인된 배포 계획은 삭제가 불가능합니다.",
					signStandDplNotDelete:"결재 대기중인 배포 계획은 삭제가 불가능합니다.",
					signImpossible:"결재 사용 유무가 아니오인 경우 결재를 사용할 수 없습니다."
				}
			}
		},
		dpl1004 : {
			label:{
				dplStatus : "Deployment Status",
				dplVersion : "Deployment Version",
				dplName : "Deployment Name",
				dplDate: "Deployment Date",
				dplUser : "Deployment Usr",
				dplSignUse : "Signature Use",
				dplRevisionNum : "Deployment Revisin",
				dplType : "Deployment Type",
				dplFailAction : "Action after failure",
				dplAutoTime : "Auto Run Time",
				dplRestoreType : "Restore Type",
				dplSignText : "Sign Request Opinion",
				dplDesc : "Deployment description",
				title : {
					dplInfo : "Deployment Information",
					signLineInfo : "Signature Line Information"
				}
			},
			tooltip : {
				selSignLine : "Designation of approval line",
			},
			button : {
				selSignLine : "Select Signature Line",
				reqSign : "Request Signature"
			}
		},
		stm2100:{
			selectStmInfoCnt : "Please, select only 1 board. </br> ${1} boards have been selected." ,
			notAuthority : {
					basic : "You don’t have authority for that this board",
			},
			field:{
				stmTypeNm: "Type",
				stmNm: "Name",
				stmDsTypeNm: "Disclosure Scope",
				cnt: "Total Count",
				badCnt: "Valid Count",
				delCnt: "Deleted Count",
			},
			actionBtn:{
				title : "Upd / Mng / Set",
				updateBtn : "Board Option",
				detailBtn : "Post Management",
				summeryBtn : "Board Summery",
				selectTooltip : "Select Board",
				updateTooltip : "Update Board Option",
				managmentTooltip : "Management Post",
				summeryTooltip : "Summery Board"
			},
			button:{
				card : "Card",
				grid : "Grid",
				detail:"Management",
				summery:"Summery",
			},
			title:{
				updateTitle : "Board Setting",
				detailTitle : "Board Management",
				summeryTitle : "Board Summery",
				chargerTitle : "Board Manager List"
			},
			type:{
				normal:"[Normal]",
				gallery:"[Gallery]",
				movie:"[Movie]",
				storage:"[Storage]",
			},
			label:{
				summery : "Summery",
			},
			chart:{
				noData : "No Data",
				newPost : "New Post",
				deletePost : "Delete Post"
			}
		},
		stm2101:{
			update: "Would you like to update this board setting?",
			formCheck:{
				fileOptionMessage : "This board type must have attached file.",
				fileCntMessage : "The number of attachments is 1 to 10. </br> Change to minimum 1.",
				fileMaxCntMessage : "The number of attachments is over. </br> Change to maximum 10.",
				fileMaxStrgMessage : "Change to maximum storage by board type.",
				fileMaxStrgOutMessage : "Maximum storage is over. </br> Change to maximum storage(${1}).",
			},
			label:{
				name: "Board Name",
				type : "Type",
				dsType : "Disclosure Scope",
				option : "Option",
				noticeCheck : "Notice",
				commentCheck : "Comment",
				secretCheck : "Secret Post",
				attachFileCheck : "Attachments",
				tagCheck : "Tag",
				fileCount : "Attachments Count",
				maxFileCnt : "Max File Count : 10",
				limitFileStrg : "Limit File Storage(MB)",
				maxFileStrg:{
					basic : "Max : [Storage] 4096MB [Movie] 2048MB [Normal/Gallery] 500MB",
					normal: "Maximum 500MB",
					movie: "Maximum 2048MB(2GB)",
					storage: "Maximum 4096MB(4GB)"
				},
				admin : "Assign Admin",
				writer : "Assign Writer",
				nothing : "Others",
				user : "User",
				authGrp : "Authority",
				otherAdmin : "Others Assign Admin",
			},
			title:{
				admin: "Assign Admin",
				writer: "Assign Writer"
			},
			button : {
				reset : "Reset",
				equals : "Equals Admin",
				all : "All",
				authNm : "Authority Group Name",
				userId : "User ID",
				userName : "User Name",
				search : "Search",
				updateSubmit : "Update Setting",
			}
		},
		stm2102:{
			summery:{
				noticeCntY: "Notice Count : ${1}",
				noticeCntN: "Notice Count : -",
				ntcCurrentY: "Recent Notice Date : ${1}",
				ntcCurrentN: "Recent Notice Date : -",
				cmtAllCntY: "Total Comment : ${1}",
				cmtAllCntN: "Total Comment : -",
				cmtMaxInfoY: "Most Comment : ${1}",
				cmtMaxInfoN: "Most Comment : -",
				badAllCntY: {
					create : "Total Created Post : ${1}",
					delete : "Total Deleted Post : ${1}",
				},
				badAllCntN: "Total Post : -",
				badHitInfoY: "Most Hit : ${1}",
				badHitInfoN: "Most Hit : -",
				badPwCntY: "Secret Post : ${1}",
				badPwCntN: "Secret Post : -",
				tagLabelY: "Hashtag TOP ${1} : #${2}",
				tagLabelN: "No Hashtag",
				fileAllCntY: "Total Attachments : ${1}",
				fileAllCntN: "Total Attachments : -",
				fileAllSizeY: "Total Attachments Storage : ${1}",
				fileAllSizeN: "Total Attachments Storage : -",
			},
			label:{
				notice : "Notice",
				comment : "Comment",
				board : "Post",
				tag : "Tag",
				attachFile : "Attachments",
			}
		},
		stm2200:{
			title:{
				authGrpList: "시스템권한 그룹 ",
				authList: "시스템 메뉴 권한",
				insert: "신규 시스템 권한 그룹 등록",
				update: "시스템 권한 그룹 수정",
				view: "시스템 권한 그룹 상세보기",
			},
			actionBtn : {
				updateBtn : "시스템 권한 그룹 수정",
				deleteBtn : "시스템 권한 그룹 삭제",
				clickBtn  : "시스템 메뉴 권한 조회",
				dblClickBtn : "시스템 권한 그룹 상세보기"
			},
			button:{
				title:{
					insert: "시스템 권한 그룹 추가",
					update: "시스템 권한 그룹 수정",
					delete: "시스템 권한 그룹 삭제",
					select: "시스템 권한 그룹 조회",
				}
			},
		},
		stm2201:{
			complete: "완료",
			insert:{
				saveString: "시스템 권한 그룹을 등록하시겠습니까?",
				saveBtnString: "등록 완료",
			},
			update:{
				saveString: "시스템 권한 그룹을  수정하시겠습니까?",
				saveBtnString: "수정 완료",
			},
			label : {
				authGrpNm: "권한그룹 명",
				ord: "순번",
				usrTyp: "사용자 유형",
				acceptUseCd: "접수권한 사용유무",
				useCd: "사용유무",
				authGrpDesc: "비고"
			}
		},
		stm6000:{
			button:{
				selectTooltip: "Department Select",
				insertTooltip: "Department Insert",
				updateTooltip: "Department Update",
				deleteTooltip: "Department Delete"
			},
			label:{
				upperDeptId : "Upper department ID",
				upperDeptNm : "Upper department Name",
				deptId : "Department ID",
				deptNm : "Department Name",
				deptOrd : "Department Order",
				deptUseCd : "Department Use",
				deptEtc : "Department description"
			},
			title:{
				deptList:"Department List",
				deptInfo:"Department Information"
			},
			message:{
				alert:{
					treeSelect:"Select a department in the tree on the left.",
					notUsedDept:"Sub-departments cannot be added to unused departments.",
					notRootDelete:"The top-level department(ROOT) cannot be deleted."
				},
				confirm:{
					deleteDept:"When deleting a department, the selected department and all sub-departments are deleted. Do you want to delete the selected department?"
				}
			},
			modal:{
				title:{
					insertDept:"New department registration",
					updateDept:"Department modification"
				}
			}
		},
		stm6001:{
			label:{
				upperDeptId : "Upper department ID",
				upperDeptNm : "Upper department Name",
				deptId : "Department ID",
				deptNm : "Department Name",
				deptOrd : "Department Order",
				deptUseCd : "Department Use",
				deptEtc : "Department description"
			},
			button:{
				insert : "Complete",
				update : "Update completed"
			},
			message:{
				confirm:{
					insert:"Would you like to register a new department?",
					update:"Would you like to edit the department information?"
				}
			}
		},
		stm8000:{
			title: {
				actionTitle : "Upd / Del / Det / Con",
				insertTitle : "Insert Repository",
				updateTitle : "Update Repository",
				dblClickTitle : "Select Repository Info",
			},
			actionTooltip:{
				updateTooltip : "Update",
				deleteTooltip : "Delete",
				dblClickTooltip : "Detail",
				connectTooltip : {
					select : "Connection Check",
					all : "All Connection Check",
				},
			},
			actionBtn:{
				selectTooltip :"Select Repository",
				insertTooltip : "Insert Repository",
				updateTooltip : "Update Repository",
				deleteTooltip : "Delete Repository",
				connectTooltip : {
					select : "Connection Check",
					all : "All Connection Check",
				},
				connect : {
					select : "Connection Check",
					all : "All Connection Check",
				},
			},
			message:{
				connect : { 
					selectCount : "Please, select repository for connection check. </br> ${1} repository have been selected.",
					fail : {
						auth : "Connection Fail : Please checking ID or Password.",
						url : "Connection Fail  : Please checking URL.",
						common : "Connection Fail ",
					},
					success : "Connection Success"
				},
				auth : "You don't have access rights."
			}
		},
		stm8001:{
			complete: "Submit",
			submit: {
				insertBtn : "Insert Submit",
				updateBtn : "Update Submit"
			},
			label:{
				strgTypeCd : "Tyep",
				useCd : "Used",
				strgRepTitle :"Title",
				strgRepUrl : "URL",
				strgUsrId : "USER",
				strgUsrPw : "PW",
				strgRepNm : "Repo.",
				strgKey : "TOKEN",
				strgTxt : "Repository Description"
			},
			placeholder : {
				strgRepTitle :"Repository Title",
				strgRepUrl : "SVN URL",
				strgUsrId : "USER ID",
				strgUsrPw : "USER Password",
				strgRepNm : "GIT Project Repository Name",
				strgKey : "GIT TOKEN",
			}
		},
		stm8002 :{
			title :{
				revision : "Revision List",
				file :"File List",
				actionTitle : {
					revisionFile : "Detail",
					repository : "Select",
				},
			},
			label : {
				revisionNum : "Revision Number",
			},
			revisionFile : {
				actionTitle : "Select",
				actionTooltip : {
					dblClickTooltip : "Code View",
					diffTooltip : "Code Diff"
				},
				message : {
					selectOne : "Please, select only 1 file. </br>${1} file have been selected."
				}
			},
			repository:{
				actionTooltip : {
					"chooseTooltip" : "Select Revision",
				}
			},
			dirTree:{
				message:{
					selectRevision : "Please, select revision.",
				}
			},
			placeholder : {
				revision : {
					start : "Start",
					end : "End",
				}
			},
			actionBtn:{
				selectTooltip :"Select Revision",
				selectFileTooltip : "Select Revision File List",
				chooseTooltip : "Revision Selection Complete",
				chooseBtn : "Complete",
				detailTooltip : "Code View",
				detailBtn : "View",
				diffTooltip : "Code Diff",
				diffBtn : "DIFF"
			},
			message :{
				selectRevision : "Please, select revision.",
				auth : "You don't have access rights."
			}
		},
		stm8003:{
			title : "File Revision List",
			revisionNum : "Revision Number",
			actionBtn : {
				title : "Select",
				selectTooltip : "Select File Revision",
				diffTooltip : "Code Diff",
				diffBtn : "DIFF"
			},
			placeholder : {
				revision : {
					start : "Start",
					end : "End",
				}
			},
			message : {
				selectFile : "Please, select 1 file. </br>${1} file have been selected.",
			}
		},
		stm8100:{
			title : {
				allProjectList : "All Project List",
				assRepList : "Assign Repository List",
				nonAssRepList : "Non-assign Repository List"
			},
			toolTip : {
				selectAssignStrg : "Select Assign Repository List",
				selectNonAssignStrg : "Select Non-assign Repository List",
				removeStrg : "Send from Assign List to Non-assign List",
				addStrg : "Send from Non-assign List to Assign List",
				authSetting : "Setting authority for revision and file code"
			},
			actionBtn : {
				removeBtn : "Remove",
				addBtn : "Add",
				authSetting : "Setting Authority"
			},
			message:{
				alert:{
					treeNodeSelect : "Select project from left tree table.",
				},
				toastr:{
					projectSelect : "Please, select project not project group."
				},
			},
			assignStrgTable : {
				actionBtn : {
					title : "Remove",
				},
				tooltip : {
					dblClick : "Send from Assign List to Non-assign List",
					authSetting : "Setting authority for revision and file code"
				},
				message : {
					remove : "If you send form Assign List to non-assign List </br>then reset authority list. That's Ok?",
					selectRep : "Please, select only one repository </br>for authority setting to revision and file code.",
					selectOnlyOne : "Please, select only one repository.",
				},
				title :{
					authPop : "Setting Authority"
				}
			},
			nonAssignStrgTable :{
				actionBtn : {
					title : "Add",
				},
				tooltip : {
					dblClick : "Send from  Non-assign List to Assign List",
					authSetting : "Setting authority for revision and file code"
				},
			}
		},
		stm8101:{
			complete : "Save",
			label : {
				revision : "Revision Authority",
				fileCode : "File Code Authority",
				message : "To setting authority for open file code,</br>must have set authority for open revision.",
				nonAssList : "Non-assign Authority group and Users"
			},
			button : {
				equalBtn : "Equals Revision Authority",
				resetBtn : "Reset",
				searchBtn : "Search",
			},
			select : {
				authGrpNm: "Authority Group Name",
				usrId : "User ID",
				usrNm : "User Name"
			},
			draw : {
				revisionBtn : "Revision Authority",
				fileCodeBtn : "File Code Authority",
				badge : {
					authGrp : "Authority Group",
					user : "User"
				}
			},
			message : {
				remove : "To setting authority for open file code, must have set authority for open revision. </br>As revision authority is removed, file code authority is also removed.",
				add : "To setting authority for open file code, must have set authority for open revision. </br>Revision authority is also added.",
				link : "There is a list of Revision Authority, but no list of File Code Authority. </br>Synchronize with Revision Authority list.",
			}
		},
		stm8200:{
			actionBtn:{
				selectTooltip :"View all status",
			},
		},
		stm9000:{
			title:{
				jenkinsManagement : "JENKINS Management",
				jobManagement : "JENKINS Management"
			},
			button:{
				common:{
					selectConnection:"Select connection check",
					allConnection:"Check all connections"
				},
				jenkins:{
					selectTooltip: "Jenkins Select",
					insertTooltip: "Jenkins Insert",
					updateTooltip: "Jenkins Update",
					deleteTooltip: "Jenkins Delete",
					selectConnectionTooltip: "Selected Jenkins connection check",
					allConnectionTooltip: "All Jenkins connection check"
				},
				job:{
					selectTooltip: "Job Select",
					insertTooltip: "Job Insert",
					updateTooltip: "Job Update",
					deleteTooltip: "Job Delete",
					selectConnectionTooltip: "Selected Job connection check",
					allConnectionTooltip: "All Job connection check"
				}
			},
			actionBtn:{
				jenkins:{
					updateBtn:"Jenkins Update",
					deleteBtn:"Jenkins Delete",
					dblClickBtn:"Jenkins Detail Info"
				},
				job:{
					updateBtn:"Job Update",
					deleteBtn:"Job Delete",
					dblClickBtn:"Job Detail Info"
				}
			},
			modal:{
				jeknins:{
					insertJenkins:"Register new Jenkins settings",
					updateJenkins:"Modify Jenkins settings",
					detailJenkins:"Detail Info"
				},
				job:{
					insertJob:"Register new Job settings",
					updateJob:"Modify Job settings",
					detailJob:"Detail Info"
				}
			}
		},
		stm9001:{
			label:{
				jenkinsName : "JENKINS NAME",
				jenkinsUrl : "JENKINS URL",
				jenkinsUserId : "USER ID",
				tokenKey: "TOKEN KEY",
				jenkinsUseCd : "JENKINS Use",
				jenkinsDesc : "JENKINS Description",
			},
			button:{
				insert : "Complete",
				update : "Update completed"
			},
			message:{
				confirm:{
					insert:"Would you like to register a new jenkins?",
					update:"Would you like to edit the jenkins information?"
				}
			}
		},
		bad1000:{
			selectBadInfoCnt : "Please, select only 1 post. </br> ${1} posts have been selected" ,
			notAuthority : {
					basic : "You don’t have authority for that this post",
					insertMessage : "You don’t have authority for insert the post.",
					selectMessage : "You don’t have authority for read the post.",
					updateMessage : "You don’t have authority for update the post.",
					deleteMessage : "You don’t have authority for delete the post.",
			},
			notWriter : {
				deleteMessage : "Only posts written by you can be deleted.",
			},
			label:{
				deleteBadge: "Delete",
				noticeBadge: "Notice",
			},
			field:{ 
				tagNm:"Tag",
				
				badContent: "Content",
				badNtcCheck : "Notice",
				delCd:"Delete",
				cmtContent:"Comment",
			},
			button:{
				dblClick : "Detail",
			},
			actionBtn:{
				title: "Upd / Del / Det",
				updateBtn:"Update Post",
				deleteBtn:"Delete Post",
				dblClick:"Detail Post",
				selectTooltip:"Selete Posts",
				insertTooltip:"Insert Post",
				updateTooltip:"Update Post",
				deleteTooltip:"Delete Post",
				detailTooltip:"Detail Post",
			},
			title:{
				passwordCheck:"Password Check",
				boardCheck:{
					oneStep: "[ NO.${1} ] Post",
					twoStep: "[ NO.${1} ] Post and ${2} others."
				},
				deleteReason: "Delete Reason",
			}
		},
		bad1001:{
			notAuthority : {
				updateMessage : "You don’t have authority for update the post.",
				restoreMessage : "You don’t have authority for restore the post.",
				deleteMessage : "You don’t have authority for delete the post.",
				deleteCmtMessage : "You don’t have authority for delete the comment.",
			},
			notCmtWriter : {
				deleteMessage : "Only comments written by you can be deleted.",
			},
			button:{
				restore : "Restore",
				submit : "Submit",
			},
			label:{
				writeDate : "Date",
				attachFile : "Attachments",
				tag: "Tag",
				comment:"Comment",
			},
			actionBtn:{
				title : "Delete",
				updateTooltip : "Update Post",
				deleteTooltip : "Delete Post",
				restoreTooltip : "Restore Post",
				selectComment : "Select Comment",
				deleteComment : "Delete Comment",
			},
			title:{
				boardCheck:{
					oneStep: "[ NO.${1} ] Post",
				},
				deleteReason: "Delete Reason",
			}
		},
		bad1002:{
			insert: "Would you like to finish writing?",
			formCheck : {
				fileCntMessage : "The number of attachments possible is ${1}.",
				passwordMessage : "You must write password for secret post.",
				passwordMatching : "The entered passwords are different.",
				tagMatching : "The tag value is duplicated.",
			},
			label:{
				title:"Title",
				content:"Contnet",
				noticeCheck:"Notice",
				noticeDate:"Notice Date",
				noticeDateIgnore:"Notice Date Ignore",
				secretCheck:"Secret Post",
				password:"PW",
				passwordCheck:"PW Check",
				commentCheck:"Allow Comment",
				attachFile : "Attachments",
				tag : "Tag",
			},
			button:{
				insertSubmit:"Insert Submit",
				submit : "Submit",
			},
			placeholder:{
				badTitle : "Title",
				badContent : "Content",
				password : "4 to 12 letters of alphabet and number combination.",
				nullPassword : "If blank, the old password is used.",
			},
			regex:{
				password : "4 to 12 letters of alphabet and number combination.",
			},
		},
		bad1003:{
			update: "Would you like to finish update?",
			label:{
				title:"Title",
				content:"Contnet",
				noticeCheck:"Notice",
				noticeDate:"Notice Date",
				noticeDateIgnore:"Notice Date Ignore",
				secretCheck:"Secret Post",
				password:"PW",
				passwordCheck:"PW Check",
				commentCheck:"Allow Comment",
				attachFile : "Attachments",
				tag : "Tag",			
			},
			button:{
				deleteResetBtn:"Delete Reset",
				updateSubmit : "Update Request",
				submit : "Submit",
			}
		},
		bad1004:{
			passwordMiss : "It doesn’t match the password for this post. </br> Please try again.",
			title:{
				detail:"Detail Post",
			},
			text : "This is secret post. </br> You must entered password.",
			button:{
				submit: "Submit",
			}
		},
		bad1005:{
			label:{
				deleteType : "Delete Type",
				deleteReason: "Delte Reason"
			},
			button:{
				submit : "Delete",
			}
		}
	};
    return {
        
        init: function() {
        	
    		var langList = ["ko","en"];
    		
    		
    		var langData = {};
    		
    		$.each(langList, function(idx, map){
    			langData[map] = lang[map];
    		});
    		
    		$.osl.langData = langData;
    		
    		
    		$.osl.date.init();
        }
    };
}();