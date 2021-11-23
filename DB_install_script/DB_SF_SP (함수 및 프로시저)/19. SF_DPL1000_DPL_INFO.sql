CREATE OR REPLACE FUNCTION SF_DPL1000_DPL_INFO
(
		I_PRJ_ID		IN	VARCHAR2
	,	I_DPL_ID		IN	VARCHAR2
	,	I_DPL_INFO_CODE		IN 	VARCHAR2
)

RETURN VARCHAR2 IS
	V_DPL_NM			VARCHAR(200);
    V_DPL_VER			VARCHAR(100);
    V_DPL_DT			DATE;
    V_DPL_USR_ID		VARCHAR(20);
    V_DPL_DESC			VARCHAR(1000);
    V_DPL_STS_CD		VARCHAR(2);
    V_DPL_TYPE_CD		VARCHAR(2);



BEGIN

	BEGIN

    	SELECT Y.DPL_NM
                ,Y.DPL_VER
                ,Y.DPL_DT
                ,Y.DPL_USR_ID
                ,Y.DPL_DESC
                ,Y.DPL_STS_CD
                ,Y.DPL_TYPE_CD
        INTO	V_DPL_NM
                ,V_DPL_VER
                ,V_DPL_DT
                ,V_DPL_USR_ID
                ,V_DPL_DESC
                ,V_DPL_STS_CD
                ,V_DPL_TYPE_CD
        FROM DPL1000 Y
        WHERE 1=1
        AND Y.PRJ_ID = I_PRJ_ID
        AND Y.DPL_ID = I_DPL_ID
        ;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
              V_DPL_NM := '';
              V_DPL_VER := '';
              V_DPL_DT := '';
              V_DPL_USR_ID := '';
              V_DPL_DESC := '';
              V_DPL_STS_CD := '';
              V_DPL_TYPE_CD := '';
        WHEN OTHERS THEN
    		V_DPL_NM := '';
    		V_DPL_VER := '';
    		V_DPL_DT := '';
    		V_DPL_USR_ID := '';
    		V_DPL_DESC := '';
    		V_DPL_STS_CD := '';
    		V_DPL_TYPE_CD := '';
    END;

	IF I_DPL_INFO_CODE = '1' THEN RETURN V_DPL_NM;
      ELSIF I_DPL_INFO_CODE ='2' THEN RETURN V_DPL_VER;
      ELSIF I_DPL_INFO_CODE ='3' THEN RETURN V_DPL_DT;
      ELSIF I_DPL_INFO_CODE ='4' THEN RETURN V_DPL_USR_ID;
      ELSIF I_DPL_INFO_CODE ='5' THEN RETURN V_DPL_DESC;
      ELSIF I_DPL_INFO_CODE ='6' THEN RETURN V_DPL_STS_CD;
      ELSIF I_DPL_INFO_CODE ='7' THEN RETURN V_DPL_TYPE_CD;
 	END IF;

END;


