CREATE OR REPLACE PROCEDURE SP_PRJ1000_PRJ_INFO_DELETE
(
   		I_LIC_GRP_ID	IN	VARCHAR2
	  ,	I_PRJ_ID		IN	VARCHAR2
    ,	O_CODE			OUT	VARCHAR2
    ,	O_MSG			OUT	VARCHAR2
)


IS

BEGIN


    O_CODE := '-1';
    O_MSG := '초기화';

   
    BEGIN
		
        DELETE
        FROM	ADM1100 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '권한 그룹 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

   
    BEGIN

	
        DELETE
        FROM	ADM1200 A
        WHERE	1=1
        AND	A.LIC_GRP_ID = I_LIC_GRP_ID
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '메뉴별 접근 권한 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

  
    BEGIN
	
        DELETE
        FROM	ADM1300 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '권한프로젝트별 사용자 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;


   
    BEGIN
	
        DELETE
        FROM	API1100 A
        WHERE	1=1
        AND		A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '프로젝트 배정 API정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;
    
    
  
    BEGIN
	
        DELETE
        FROM	DPL1000 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '배포 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;
    

   
    BEGIN
	
        DELETE
        FROM	DPL1100 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '배포 요구사항 배정 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;


   
    BEGIN
	
        DELETE
        FROM	DPL1200 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '배포 결재 이력 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

  
    BEGIN
	
        DELETE
        FROM	DPL1300 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '배포 JOB 목록 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

  
    BEGIN
	
        DELETE
        FROM	DPL1400 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '배포 실행이력 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

    
   
    BEGIN
	
        DELETE
        FROM	DPL1500 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '배포 수정이력 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;


  
    BEGIN
	
        DELETE
        FROM	FLW1000 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '프로세스 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

   
    BEGIN
	
        DELETE
        FROM	FLW1100 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '작업흐름 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

 
    BEGIN
	
        DELETE
        FROM	FLW1200 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '작업흐름 항목 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

  
    BEGIN
	
        DELETE
        FROM	FLW1300 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '작업흐름 항목 값 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

   
    BEGIN
	
        DELETE
        FROM	FLW1400 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '작업흐름별 리비전 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

  
    BEGIN
	
        DELETE
        FROM	FLW1500 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '작업흐름별 허용역할 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

   
    BEGIN
	
        DELETE
        FROM	JEN1200 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := 'JOB 권한정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

  
    BEGIN
	
        DELETE
        FROM	JEN1300 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := 'JOB 허용역할 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

  
    BEGIN
	
        DELETE
        FROM	MIL1000 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '마일스톤 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;


  
    BEGIN
	
        DELETE
        FROM	PRJ1000 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '프로젝트 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

   
    BEGIN
	
        DELETE
        FROM	PRJ3000 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '프로젝트 산출물 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

   
    BEGIN
	
        DELETE
        FROM	REQ4000 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '요구사항 분류 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

    
    
    BEGIN
	
        DELETE
        FROM	REQ4100 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '요구사항 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;


 
    BEGIN
	
        DELETE
        FROM	REQ4300 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '요구사항 코멘트 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

  
    BEGIN
	
        DELETE
        FROM	REQ4400 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '요구사항 결재 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

   
    BEGIN
	
        DELETE
        FROM	REQ4600 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '요구사항 클립보드 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

   
    BEGIN
	
        DELETE
        FROM	REQ4700 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '요구사항 변경 이력 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

  
    BEGIN
	
        DELETE
        FROM	REQ4800 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '요구사항 수정 이력 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;


  
    BEGIN
	
        DELETE
        FROM	REQ4900 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '요구사항 결재 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

  
    BEGIN
	
        DELETE
        FROM	RPT1000 A
        WHERE	1=1
	AND	A.LIC_GRP_ID = I_LIC_GRP_ID
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '보고서 설정 Master 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;


   
    BEGIN
	
        DELETE
        FROM	RPT1100 A
        WHERE	1=1
	AND	A.LIC_GRP_ID = I_LIC_GRP_ID
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '보고서 설정 Detail 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

  
    BEGIN
	
        DELETE
        FROM	RPT1200 A
        WHERE	1=1
	AND	A.LIC_GRP_ID = I_LIC_GRP_ID
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '보고서 Master 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;



  
    BEGIN
	
        DELETE
        FROM	RPT1300 A
        WHERE	1=1
	AND	A.LIC_GRP_ID = I_LIC_GRP_ID
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := '보고서 Detail 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

   
    BEGIN
	
        DELETE
        FROM	SVN1100 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := 'SVN 권한 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

 
    BEGIN
	
        DELETE
        FROM	SVN1200 A
        WHERE	1=1
        AND	A.PRJ_ID = I_PRJ_ID
        ;

    EXCEPTION
    	WHEN OTHERS THEN
          O_CODE := '-1';
          O_MSG := 'SVN 허용 역할 정보를 삭제할 수 없습니다.';
          ROLLBACK;
          RETURN;
    END;

    O_CODE := '1';
    O_MSG := '저장 성공';

EXCEPTION
	WHEN OTHERS THEN
    	O_CODE 	:= '-1';
      	O_MSG 	:= SQLCODE || ' : ' || SQLERRM;
    	DBMS_OUTPUT.PUT_LINE('프로젝트 삭제시 예기치 못한 오류 발생' || CHR(13) || SQLCODE || ' : ' || SQLERRM);
    	ROLLBACK;
      RETURN;
END;