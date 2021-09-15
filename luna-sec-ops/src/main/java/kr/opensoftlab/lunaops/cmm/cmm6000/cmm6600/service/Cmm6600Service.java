package kr.opensoftlab.lunaops.cmm.cmm6000.cmm6600.service;

import java.util.List;
import java.util.Map;


public interface Cmm6600Service {

	
	@SuppressWarnings("rawtypes")
	List<Map> selectCmm6600SignUsrList(Map<String, String> paramMap) throws Exception;

	
	void saveCmm6600SignLine(Map<String, String> paramMap) throws Exception;
}
