package kr.opensoftlab.lunaops.cmm.cmm6000.cmm6600.service;

import java.util.List;
import java.util.Map;


public interface Cmm6600Service {

	
	List<Map> selectCmm6600SignUsrList(Map<String, String> paramMap) throws Exception;
}
