package src.main.java.kr.opensoftlab.lunaops.cmm.cmm6000.cmm6000.service;

import java.util.List;
import java.util.Map;


public interface Cmm6000Service {
	
	
	@SuppressWarnings("rawtypes")
	public int  selectReq1000ReqListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public List<Map>  selectReq1000ReqList(Map paramMap) throws Exception;
	
	
	public void updateCmm17000UsrMainPrj(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectCmm17000UsrMainPrj(Map<String, String> paramMap) throws Exception;
	
}
