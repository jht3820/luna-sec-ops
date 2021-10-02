package kr.opensoftlab.lunaops.req.req6000.req6000.service;

import java.util.List;
import java.util.Map;


public interface Req6000Service {
		
	@SuppressWarnings({ "rawtypes"})
	List<Map> selectReq6001ReqChgList(Map paramMap) throws Exception;
	
		
	@SuppressWarnings("rawtypes")
	String insertReq6001ReqChgInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int deleteReq6001ReqChgInfo(Map paramMap) throws Exception;
}
