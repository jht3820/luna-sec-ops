package kr.opensoftlab.lunaops.stm.stm8000.stm8200.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.stm.stm8000.stm8200.service.Stm8200Service;



@Service("stm8200Service")
public class Stm8200ServiceImpl extends EgovAbstractServiceImpl implements Stm8200Service {

	
	@Resource(name = "stm8200DAO")
	private Stm8200DAO stm8200DAO;

	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8200RevisionAuthList(Map paramMap) throws Exception {
		return  stm8200DAO.selectStm8200RevisionAuthList(paramMap);
	}
	
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8200PrjAllAuthAndUserList(Map paramMap) throws Exception {
		return  stm8200DAO.selectStm8200PrjAllAuthAndUserList(paramMap);
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void insertStm8200RevisionAuthList(Map paramMap) throws Exception {
		
		
		stm8200DAO.deleteStm8200RevisionAuthInfo(paramMap);
		
		
    	JSONArray revisionList = new JSONArray(paramMap.get("revisionList").toString());
    	
    	
    	for(int i=0; i < revisionList.length(); i++){
    		
    		JSONObject jsonObj = revisionList.getJSONObject(i);
    		
    		
    		HashMap<String, Object> addStrgRepAuthInfoMap = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
			
    		
    		addStrgRepAuthInfoMap.put("licGrpId", paramMap.get("licGrpId"));
    		addStrgRepAuthInfoMap.put("regUsrId", paramMap.get("regUsrId"));
    		addStrgRepAuthInfoMap.put("regUsrIp", paramMap.get("regUsrIp"));
    		addStrgRepAuthInfoMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
    		addStrgRepAuthInfoMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
    		
    		
			stm8200DAO.insertStm8200RevisionAuthInfo(addStrgRepAuthInfoMap);
    	}
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void deleteStm8200RevisionAuthList(Map paramMap) throws Exception {
		
		
    	JSONArray revisionList = new JSONArray(paramMap.get("revisionList").toString());
    	
    	
    	for(int i=0; i < revisionList.length(); i++){
    		
    		JSONObject jsonObj = revisionList.getJSONObject(i);
    		
    		
    		HashMap<String, Object> addStrgRepAuthInfoMap = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
			
    		addStrgRepAuthInfoMap.put("licGrpId", paramMap.get("licGrpId"));
    		
    		
			stm8200DAO.deleteStm8200RevisionAuthInfo(addStrgRepAuthInfoMap);
    	}
	}
}
