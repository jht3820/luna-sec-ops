CREATE OR REPLACE FUNCTION SF_DPL1400_LAST_INFO
(
		I_PRJ_ID		IN	VARCHAR2
	,   I_DPL_ID		IN	VARCHAR2
    ,   I_JEN_ID		IN	VARCHAR2
    ,   I_JOB_ID		IN	VARCHAR2
	,	I_DPL_INFO_CODE	IN 	VARCHAR2
)


RETURN VARCHAR2 IS
 	V_BLD_NUM			NUMBER;
    V_BLD_RESULT		VARCHAR(20);
	V_BLD_DURATION_TM	VARCHAR(40);
    V_BLD_START_DTM		DATE;
    V_BLD_MAIN_NUM		NUMBER;
    V_BLD_CONSOLE_LOG	CLOB;
    V_BLD_RESULT_MSG	VARCHAR2(1000);
    V_BLD_SEQ			NUMBER;

BEGIN

	BEGIN

    	SELECT Y.BLD_NUM
              ,Y.BLD_RESULT
              ,Y.BLD_DURATION_TM
              ,Y.BLD_START_DTM
              ,Y.BLD_MAIN_NUM
              ,Y.BLD_CONSOLE_LOG
              ,Y.BLD_RESULT_MSG
              ,Y.BLD_SEQ
        INTO	V_BLD_NUM
        		,V_BLD_RESULT
                ,V_BLD_DURATION_TM
                ,V_BLD_START_DTM
                ,V_BLD_MAIN_NUM
                ,V_BLD_CONSOLE_LOG
                ,V_BLD_RESULT_MSG
                ,V_BLD_SEQ
        FROM DPL1400 Y
        WHERE 1=1
        AND Y.PRJ_ID = I_PRJ_ID
        AND Y.DPL_ID = I_DPL_ID
        AND Y.JEN_ID = I_JEN_ID
        AND Y.JOB_ID = I_JOB_ID
        AND Y.BLD_SEQ = (
                    SELECT
                                /*+ INDEX_DESC (Z PK_DPL1400 ) */  BLD_SEQ
                      FROM
                                DPL1400 Z
                       WHERE 	1=1
                        AND 	Z.PRJ_ID 	= I_PRJ_ID
                        AND 	Z.DPL_ID 	= I_DPL_ID
                        AND 	Z.JEN_ID 	= I_JEN_ID
                        AND 	Z.JOB_ID 	= I_JOB_ID
                        AND 	ROWNUM 		= 1
                    )
        ;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
           V_BLD_NUM :=  -1;
           V_BLD_RESULT := '';
           V_BLD_DURATION_TM := '';
           V_BLD_START_DTM := '';
           V_BLD_MAIN_NUM := '';
           V_BLD_CONSOLE_LOG := '';
           V_BLD_RESULT_MSG := '';
           V_BLD_SEQ := -1;
        WHEN OTHERS THEN
   			V_BLD_NUM :=  -1;
           V_BLD_RESULT := '';
           V_BLD_DURATION_TM := '';
           V_BLD_START_DTM := '';
           V_BLD_MAIN_NUM := '';
           V_BLD_CONSOLE_LOG := '';
           V_BLD_RESULT_MSG := '';
           V_BLD_SEQ := -1;
    END;

	IF I_DPL_INFO_CODE = '1' THEN RETURN V_BLD_NUM;
    ELSIF I_DPL_INFO_CODE ='2' THEN RETURN V_BLD_RESULT;
    ELSIF I_DPL_INFO_CODE ='3' THEN RETURN V_BLD_RESULT_MSG;
    ELSIF I_DPL_INFO_CODE ='4' THEN RETURN V_BLD_DURATION_TM;
    ELSIF I_DPL_INFO_CODE ='5' THEN RETURN V_BLD_START_DTM;
    ELSIF I_DPL_INFO_CODE ='6' THEN RETURN V_BLD_MAIN_NUM;
    ELSIF I_DPL_INFO_CODE ='7' THEN RETURN V_BLD_CONSOLE_LOG;
    ELSIF I_DPL_INFO_CODE ='8' THEN RETURN V_BLD_SEQ;
 	END IF;

END;