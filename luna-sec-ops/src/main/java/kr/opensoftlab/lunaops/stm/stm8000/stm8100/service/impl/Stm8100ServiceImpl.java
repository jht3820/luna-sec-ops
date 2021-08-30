package kr.opensoftlab.lunaops.stm.stm8000.stm8100.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.stm.stm8000.stm8100.service.Stm8100Service;



@Service("stm8100Service")
public class Stm8100ServiceImpl extends EgovAbstractServiceImpl implements Stm8100Service {

	
	@Resource(name = "stm8100DAO")
	private Stm8100DAO stm8100DAO;

	
	
	@SuppressWarnings("rawtypes")
	public int selectStm8100ServerListCnt(Map paramMap) throws Exception {
		return  stm8100DAO.selectStm8100ServerListCnt(paramMap);
	}
	
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8100ServerList(Map paramMap) throws Exception {
		return  stm8100DAO.selectStm8100ServerList(paramMap);
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void insertStm8100ServerList(Map paramMap) throws Exception {
		
		String prjId = (String)paramMap.get("prjId");
		
		
    	JSONArray selStrRepList = new JSONArray(paramMap.get("selStrRepList").toString());
    	
    	
    	for(int i=0; i < selStrRepList.length(); i++){
    		
    		JSONObject jsonObj = selStrRepList.getJSONObject(i);
    		
    		
    		HashMap<String, Object> addStrgRepInfoMap = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
			
    		
    		addStrgRepInfoMap.put("prjId", prjId);
    		addStrgRepInfoMap.put("strgRepId", String.valueOf(jsonObj.get("strgRepId")));
    		addStrgRepInfoMap.put("regUsrId", paramMap.get("regUsrId"));
    		addStrgRepInfoMap.put("regUsrIp", paramMap.get("regUsrIp"));
    		addStrgRepInfoMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
    		addStrgRepInfoMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
    		
    		
			stm8100DAO.insertStm8100ServerInfo(addStrgRepInfoMap);
    	}
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void deleteStm8100ServerList(Map paramMap) throws Exception {
		
		String prjId = (String)paramMap.get("prjId");
		
		
    	JSONArray selStrRepList = new JSONArray(paramMap.get("selStrRepList").toString());
    	
    	
    	for(int i=0; i < selStrRepList.length(); i++){
    		
    		JSONObject jsonObj = selStrRepList.getJSONObject(i);
    		
    		
    		HashMap<String, Object> addStrgRepInfoMap = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
			
    		
    		addStrgRepInfoMap.put("prjId", prjId);
    		addStrgRepInfoMap.put("strgRepId", String.valueOf(jsonObj.get("strgRepId")));
    		
    		
			stm8100DAO.deleteStm8100ServerInfo(addStrgRepInfoMap);
    	}
	}
}
