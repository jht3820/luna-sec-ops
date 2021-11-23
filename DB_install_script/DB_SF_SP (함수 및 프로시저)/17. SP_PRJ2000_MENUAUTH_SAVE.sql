
CREATE OR REPLACE PROCEDURE SP_PRJ2000_MENUAUTH_SAVE
(
   		I_LIC_GRP_ID	IN	VARCHAR2
	,	I_PRJ_ID		IN	VARCHAR2
	,	I_AUTH_GRP_ID	IN	VARCHAR2
  ,	I_MENU_ID		IN	VARCHAR2
  ,	I_MAIN_MENU_ID		IN	VARCHAR2
	,	I_ACCESS_YN		IN	VARCHAR2
	,	I_SELECT_YN		IN	VARCHAR2
	,	I_REG_YN		IN	VARCHAR2
	,	I_MODIFY_YN		IN	VARCHAR2
	,	I_DEL_YN		IN	VARCHAR2
	,	I_EXCEL_YN		IN	VARCHAR2
	,	I_PRINT_YN		IN	VARCHAR2
	,	I_REG_USR_ID	IN	VARCHAR2
	,	I_REG_USR_IP	IN	VARCHAR2
	,	I_MODIFY_USR_ID	IN	VARCHAR2
	,	I_MODIFY_USR_IP	IN	VARCHAR2

    ,	O_CODE			OUT	VARCHAR2
    ,	O_MSG			OUT	VARCHAR2
)

IS


BEGIN

	 SP_ADM1000_MENUAUTH_SAVE(
      		I_LIC_GRP_ID
	,	I_PRJ_ID
	,	I_AUTH_GRP_ID
  ,	I_MENU_ID
	,	I_ACCESS_YN
	,	I_SELECT_YN
	,	I_REG_YN
	,	I_MODIFY_YN
	,	I_DEL_YN
	,	I_EXCEL_YN
	,	I_PRINT_YN
	,	I_REG_USR_ID
	,	I_REG_USR_IP
	,	I_MODIFY_USR_ID
	,	I_MODIFY_USR_IP
    ,	O_CODE
    ,	O_MSG
   );

  BEGIN
	IF O_CODE = 1 THEN

   UPDATE  ADM1200 SET    MAIN_YN		=  DECODE( I_MAIN_MENU_ID , I_MENU_ID ,'Y' ,'N' )
    WHERE  LIC_GRP_ID      =  I_LIC_GRP_ID
       AND   PRJ_ID            =  I_PRJ_ID
       AND   AUTH_GRP_ID  =  I_AUTH_GRP_ID
       AND   MENU_ID        =  I_MENU_ID;

   O_CODE := '1';
    O_MSG := '저장 성공';
    END IF;
    EXCEPTION
	    WHEN OTHERS THEN
    	O_CODE 	:= '-1';
      O_MSG 	:= SQLCODE || ' : ' || SQLERRM;
    	DBMS_OUTPUT.PUT_LINE('예기치 못한 오류 발생' || CHR(13) || SQLCODE || ' : ' || SQLERRM);
    	ROLLBACK;
    END;

END;


