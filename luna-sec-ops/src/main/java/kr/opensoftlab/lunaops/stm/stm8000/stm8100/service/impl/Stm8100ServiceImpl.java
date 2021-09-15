package kr.opensoftlab.lunaops.stm.stm8000.stm8100.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

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
		
		
		JSONParser jsonParser = new JSONParser();
		
		
    	JSONArray selStrRepList = (JSONArray) jsonParser.parse((String)paramMap.get("selStrRepList"));
    	
    	
    	for(int i=0; i < selStrRepList.size(); i++){
    		
    		JSONObject jsonObj = (JSONObject)selStrRepList.get(i);
    		
    		
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
		
		
		JSONParser jsonParser = new JSONParser();
				
		
    	JSONArray selStrRepList = (JSONArray) jsonParser.parse((String)paramMap.get("selStrRepList").toString());
    	
    	
    	for(int i=0; i < selStrRepList.size(); i++){
    		
    		JSONObject jsonObj = (JSONObject)selStrRepList.get(i);
    		
    		
    		HashMap<String, Object> addStrgRepInfoMap = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
			
    		
    		addStrgRepInfoMap.put("prjId", prjId);
    		addStrgRepInfoMap.put("strgRepId", String.valueOf(jsonObj.get("strgRepId")));
    		
    		
    		stm8100DAO.deleteStm8110RevisionAuthInfo(addStrgRepInfoMap);
    		stm8100DAO.deleteStm8120FileCodeAuthInfo(addStrgRepInfoMap);
    		
			stm8100DAO.deleteStm8100ServerInfo(addStrgRepInfoMap);
    	}
	}
    	
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8110RevisionAuthList(Map paramMap) throws Exception {
		return  stm8100DAO.selectStm8110RevisionAuthList(paramMap);
	}

	
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8120FileCodeAuthList(Map paramMap) throws Exception {
		return  stm8100DAO.selectStm8120FileCodeAuthList(paramMap);
	}
	
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8100PrjAllAuthAndUserList(Map paramMap) throws Exception {
		return  stm8100DAO.selectStm8100PrjAllAuthAndUserList(paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void insertStm8100AuthList(Map paramMap) throws Exception {
				
		
		stm8100DAO.deleteStm8110RevisionAuthInfo(paramMap);

		
		String listStr = (String) paramMap.get("stmRevision");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = null;
		Map infoMap = null;
		JSONObject jsonObj = null;
		
		jsonArray = (JSONArray) jsonParser.parse(listStr);
	
		for(int i=0; i<jsonArray.size(); i++){
			jsonObj = (JSONObject) jsonArray.get(i);
			
			
			infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			infoMap.put("licGrpId", paramMap.get("licGrpId"));
			infoMap.put("regUsrId", paramMap.get("modifyUsrId"));
			infoMap.put("regUsrIp", paramMap.get("modifyUsrIp"));
			infoMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
			infoMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
			
			
			stm8100DAO.insertStm8110RevisionAuthInfo(infoMap);
		}
		
		
		stm8100DAO.deleteStm8120FileCodeAuthInfo(paramMap);
		
		
		listStr = (String) paramMap.get("stmFileCode");
		jsonArray = (JSONArray) jsonParser.parse(listStr);
		
		for(int i=0; i<jsonArray.size(); i++){
			jsonObj = (JSONObject) jsonArray.get(i);
			
			
			infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			infoMap.put("licGrpId", paramMap.get("licGrpId"));
			infoMap.put("regUsrId", paramMap.get("modifyUsrId"));
			infoMap.put("regUsrIp", paramMap.get("modifyUsrIp"));
			infoMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
			infoMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
			
			
			stm8100DAO.insertStm8120FileCodeAuthInfo(infoMap);
		}
	}
}
