package kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.impl;

import java.util.ArrayList;



import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.Prj1100Service;
import kr.opensoftlab.lunaops.prj.prj1000.prj1300.service.Prj1300Service;

@Service("prj1100Service")
public class Prj1100ServiceImpl extends EgovAbstractServiceImpl implements Prj1100Service {
	
	
    @Resource(name="prj1100DAO")
    private Prj1100DAO prj1100DAO; 

	
    @Resource(name = "prj1300Service")
    private Prj1300Service prj1300Service;
    
	
	@SuppressWarnings("rawtypes")
	public int  selectPrj1100ProcessListCnt(Map paramMap) throws Exception {
		return  prj1100DAO.selectPrj1100ProcessListCnt(paramMap);
	} 
	
    
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectPrj1100ProcessList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1100ProcessInfo(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String insertPrj1100ProcessInfo(Map paramMap) throws Exception {
		String processId = (String) prj1100DAO.insertPrj1100ProcessInfo(paramMap);
		paramMap.put("processId", processId);
		
		
		paramMap.put("flowNm", "최종 완료");
		paramMap.put("flowDesc", "최종 완료");
		paramMap.put("flowLeft", "20");
		paramMap.put("flowTop", "20");
		paramMap.put("flowStartCd", "02");
		paramMap.put("flowDoneCd", "01");
		paramMap.put("flowEssentialCd", "02");
		paramMap.put("flowSignCd", "02");
		paramMap.put("flowSignStopCd", "02");
		paramMap.put("flowMiddleEndCd", "02");
		paramMap.put("flowWorkCd", "02");
		paramMap.put("flowRevisionCd", "02");
		paramMap.put("flowDplCd", "02");
		paramMap.put("flowAuthCd", "02");
		paramMap.put("flowTitleBgColor", "02");
		paramMap.put("flowTitleColor", "02");
		paramMap.put("useCd", "02");
		prj1100DAO.insertPrj1101FlowInfo(paramMap);
		
		
		String usrIdList = (String) paramMap.get("usrIdList");
		if(usrIdList != null && !"[]".equals(usrIdList)) {
			
			JSONArray jsonArray = new JSONArray(usrIdList);
			
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				String usrId = jsonObj.getString("usrId");
				String authTypeCd = jsonObj.getString("authTypeCd");
				
				paramMap.put("processAuthTargetId", usrId);
				paramMap.put("processAuthTypeCd", authTypeCd);
				prj1100DAO.insertPrj1100ProcessAuthInfo(paramMap);
			}
		}
		
		return processId;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updatePrj1100ProcessInfo(Map paramMap) throws Exception {
		
		prj1100DAO.updatePrj1100ProcessInfo(paramMap);
		
		
		String usrIdList = (String) paramMap.get("usrIdList");
				
				
		
		if(usrIdList != null && !"[]".equals(usrIdList)) {
			
			prj1100DAO.deletePrj1100ProcessAuthInfo(paramMap);
			
			
			JSONArray jsonArray = new JSONArray(usrIdList);
			
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				String usrId = jsonObj.getString("usrId");
				String authTypeCd = jsonObj.getString("authTypeCd");
				
				paramMap.put("processAuthTargetId", usrId);
				paramMap.put("processAuthTypeCd", authTypeCd);
				prj1100DAO.insertPrj1100ProcessAuthInfo(paramMap);
			}
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void savePrj1100ProcessDataInfo(Map paramMap) throws Exception{
		
		String processData = (String) paramMap.get("processData");
		String addData = (String) paramMap.get("addData");
		String removeData = (String) paramMap.get("removeData");
		
		
		Map newFlowIdList = new HashMap<>();
		
		String prjId = (String) paramMap.get("prjId");
		String processId = (String) paramMap.get("processId");
		
		
		String startFlowId = (String) paramMap.get("startFlowId");
		
		
		String endFlowId = (String) paramMap.get("endFlowId");
		
		
		JSONObject jsonObj = new JSONObject(processData);
		JSONArray addDataObj = new JSONArray(addData);
		JSONArray removeDataObj = new JSONArray(removeData);
		
		
		prj1100DAO.deletePrj1100FlowNextIdList(paramMap);
		
		
		if(addDataObj != null && addDataObj.length() > 0) {
			for(int i=0;i<addDataObj.length();i++) {
				String key = addDataObj.getString(i);
				
				JSONObject newFlowData = jsonObj.getJSONObject(key);
				JSONObject newFlowProp = newFlowData.getJSONObject("properties");
				
				String beforeFlowId = newFlowProp.getString("id");
				
				
				Map newMap = new Gson().fromJson(newFlowProp.toString(), HashMap.class);
				newMap.put("prjId", prjId);
				newMap.put("processId", processId);
				newMap.put("flowLeft", newFlowData.get("left"));
				newMap.put("flowTop", newFlowData.get("top"));
				newMap.put("flowNm", newFlowProp.get("title"));
				newMap.put("flowDesc", newFlowProp.get("flowDesc"));
				newMap.put("regUsrId", paramMap.get("regUsrId"));
				newMap.put("regUsrIp", paramMap.get("regUsrIp"));
				newMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
				newMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
				
				
			    if(startFlowId.equals(key)) {
			    	newMap.put("flowStartCd", "01");
			    }else {
			    	newMap.put("flowStartCd", "02");
			    }
			    
			    
			    if(endFlowId.equals(key)) {
			    	newMap.put("flowDoneCd", "01");
			    }else {
			    	newMap.put("flowDoneCd", "02");
			    }
				
				String newFlowId = prj1100DAO.insertPrj1101FlowInfo(newMap);
				
				if(newFlowProp.has("basicItemList")) {
			    	JSONArray itemList = newFlowProp.getJSONArray("basicItemList");
		    		if(itemList.length() > 0) {
			    		for(int idx=0;idx<itemList.length();idx++) {
			    			JSONObject obj = itemList.getJSONObject(idx);
			    			Map itemMap = new Gson().fromJson(obj.toString(), HashMap.class);
			    			itemMap.put("processId", processId);
			    			itemMap.put("flowId", newFlowId);
			    			itemMap.put("prjId", prjId);
			    			itemMap.put("licGrpId", paramMap.get("licGrpId"));
			    			prj1300Service.savePrj1102ItemAjax(itemMap);
			    		}
			    	}
			    }
				
				
				newFlowIdList.put(beforeFlowId, newFlowId);
			}
		}
		
		
		Iterator<String> keys = jsonObj.keys();
		while(keys.hasNext()) {
		    String key = keys.next();
		    String beforeKey = key;
		    
		    paramMap.put("flowId", key);
		    
		    JSONObject flowInfo = jsonObj.getJSONObject(key);
		    
		    int left = flowInfo.getInt("left");
		    int top = flowInfo.getInt("top");
		    
		    JSONObject properties = flowInfo.getJSONObject("properties");
		    
		    JSONArray flowNextIdList = null;
		    
		    
		    if(!newFlowIdList.isEmpty() && newFlowIdList.containsKey(beforeKey)) {
		    	key = (String) newFlowIdList.get(beforeKey);
		    	paramMap.put("flowId", newFlowIdList.get(beforeKey));
		    }
		    
		    
		    if(startFlowId.equals(key)) {
		    	paramMap.put("flowStartCd", "01");
		    }else {
		    	paramMap.put("flowStartCd", "02");
		    }
		    
		    
		    if(endFlowId.equals(key)) {
		    	paramMap.put("flowDoneCd", "01");
		    }else {
		    	paramMap.put("flowDoneCd", "02");
		    }
		    
		    
		    if(properties.has("flowNextId")) {
		    	flowNextIdList = properties.getJSONArray("flowNextId");
		    	if(flowNextIdList.length() > 0) {
		    		for(int i=0;i<flowNextIdList.length();i++) {
		    			String flowNextId = flowNextIdList.getString(i);
		    			
		    			
		    			if(!newFlowIdList.isEmpty() && newFlowIdList.containsKey(flowNextId)) {
		    				flowNextId = (String) newFlowIdList.get(flowNextId);
		    			}
		    			
		    			paramMap.put("flowNextId", flowNextId);
		    		
		    			
				    	prj1100DAO.insertPrj1100FlowNextIdInfo(paramMap);
		    		}
		    	}
		    }
		    
		    
		    if(!newFlowIdList.isEmpty() && newFlowIdList.containsKey(beforeKey)) {
		    	continue;
		    }
		    
		    Map flowMapData = new Gson().fromJson(properties.toString(), HashMap.class);
		    flowMapData.put("prjId", prjId);
		    flowMapData.put("processId", processId);
		    flowMapData.put("flowId", key);
		    flowMapData.put("flowLeft", left);
		    flowMapData.put("flowTop", top);
		    flowMapData.put("flowNm", flowMapData.get("title"));
		    flowMapData.put("flowDesc", flowMapData.get("flowDesc"));
		    flowMapData.put("flowStartCd", paramMap.get("flowStartCd"));
		    flowMapData.put("flowDoneCd", paramMap.get("flowDoneCd"));
		    flowMapData.put("modifyUsrId", paramMap.get("modifyUsrId"));
		    flowMapData.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
		    
		    
		    prj1100DAO.updatePrj1101FlowInfo(flowMapData);
		    
		    
		    if(properties.has("basicItemList")) {
		    	JSONArray itemList = properties.getJSONArray("basicItemList");
	    		if(itemList.length() > 0) {
		    		for(int i=0;i<itemList.length();i++) {
		    			JSONObject obj = itemList.getJSONObject(i);
		    			Map itemMap = new Gson().fromJson(obj.toString(), HashMap.class);
		    			itemMap.put("processId", processId);
		    			itemMap.put("flowId", key);
		    			itemMap.put("prjId", prjId);
		    			itemMap.put("licGrpId", paramMap.get("licGrpId"));
		    			prj1300Service.savePrj1102ItemAjax(itemMap);
		    		}
		    	}
		    }
		    
		    
		    if(properties.has("basicItemDelList")) {
		    	JSONArray itemList = properties.getJSONArray("basicItemDelList");
	    		if(itemList.length() > 0) {
		    		for(int i=0;i<itemList.length();i++) {
		    			JSONObject obj = itemList.getJSONObject(i);
		    			Map itemMap = new Gson().fromJson(obj.toString(), HashMap.class);
		    			itemMap.put("processId", processId);
		    			itemMap.put("flowId", key);
		    			itemMap.put("prjId", prjId);
		    			prj1300Service.deletePrj1102ItemInfoAjax(itemMap);
		    		}
		    	}
		    }
		}
		
		
		for(int i=0;i<removeDataObj.length();i++) {
			String removeFlowId = removeDataObj.getString(i);
			Map newMap = new HashMap<>();
			newMap.put("prjId", prjId);
			newMap.put("processId", processId);
			newMap.put("flowId", removeFlowId);
			newMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
			newMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
		    
			prj1100DAO.deletePrj1101FlowInfo(newMap);
			
			prj1300Service.deletePrj1102ItemAjax(newMap);
		}
		
	}
	
	
	@SuppressWarnings({ "rawtypes"})
	public void deletePrj1100ProcessInfo(Map paramMap) throws Exception {
		String deleteDataList = (String) paramMap.get("deleteDataList");

		
		JSONArray jsonArray = new JSONArray(deleteDataList);
		
		
		for(int i=0;i<jsonArray.length();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map infoMap = new Gson().fromJson(jsonObj.toString(), new HashMap().getClass());
			
			
			prj1100DAO.deletePrj1100ProcessInfo(infoMap);
		
			
			prj1100DAO.deletePrj1101FlowInfo(infoMap);
			prj1100DAO.deletePrj1100FlowNextIdList(infoMap);
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1100ProcessAuthUsrList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessAuthUsrList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1100ProcessAuthUsrListCnt(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessAuthUsrListCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1100ProcessAuthNoneUsrList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessAuthNoneUsrList(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1100ProcessAuthNoneUsrListCnt(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessAuthNoneUsrListCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj1100ProcessAuthInfo(Map paramMap) throws Exception{
		return prj1100DAO.insertPrj1100ProcessAuthInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj1100ProcessAuthInfo(Map paramMap) throws Exception{
		return prj1100DAO.deletePrj1100ProcessAuthInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1100ProcessReqCnt(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessReqCnt(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectPrj1101FlowList(Map paramMap) throws Exception {
		List flowList = prj1100DAO.selectPrj1101FlowList(paramMap);
		for(int i=0;i<flowList.size();i++) {
			Map<String, Object> map =  (Map<String, Object>) flowList.get(i);
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("licGrpId", paramMap.get("licGrpId"));
			param.put("processId", map.get("processId"));
			param.put("prjId", map.get("prjId"));
			param.put("flowId", map.get("flowId"));
			
			flowList.set(i, map);
		}
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("licGrpId", paramMap.get("licGrpId"));
		param.put("processId", paramMap.get("processId"));
		param.put("prjId", paramMap.get("prjId"));
		
		List<Map<String, Object>> itemList = prj1300Service.selectPrj1102AllItemList(param);
		for(int i=0;i<flowList.size();i++) {
			Map<String, Object> map =  (Map<String, Object>) flowList.get(i);
			List<Map<String, Object>> basicItemList = new ArrayList<>();
			
			for(int j=0;j<itemList.size();j++) {
				Map<String, Object> itemMap =  (Map<String, Object>) itemList.get(j);
				if(itemMap.get("flowId").equals(map.get("flowId"))) {
					basicItemList.add(itemMap);
				}
			}
			map.put("basicItemList", basicItemList);
			
			flowList.set(i, map);
		}
		return flowList;
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1101FlowInfo(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1101FlowInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1101FlowInfo(Map paramMap) throws Exception {
		
		prj1100DAO.updatePrj1101FlowInfo(paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj1101FlowInfo(Map paramMap) throws Exception {
		
		return prj1100DAO.insertPrj1101FlowInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1101FlowInfo(Map paramMap) throws Exception {
		
		prj1100DAO.deletePrj1101FlowInfo(paramMap);
		
		
		prj1100DAO.deletePrj1102OtpInfo(paramMap);
		
		
		prj1100DAO.updatePrj1100ProcessInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1107FlowLinkList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1107FlowLinkList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1100FlowReqListCnt(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100FlowReqListCnt(paramMap);
	} 
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1102ReqOptList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1102ReqOptList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1102OptList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1102OptList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1103OptFileList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1103OptFileList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1102OptCntInfo(Map paramMap) throws Exception {
		 return prj1100DAO.selectPrj1102OptCntInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1102OtpInfo(Map paramMap) throws Exception {
		prj1100DAO.updatePrj1102OtpInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void insertPrj1102OtpInfo(Map paramMap) throws Exception {
		
		prj1100DAO.insertPrj1102OtpInfo(paramMap);
		
		
		prj1100DAO.updatePrj1100ProcessInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1102OtpInfo(Map paramMap) throws Exception {
		
		prj1100DAO.deletePrj1102OtpInfo(paramMap);
		
		
		prj1100DAO.updatePrj1100ProcessInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1103OtpValueInfo(Map paramMap) throws Exception {
		prj1100DAO.insertPrj1103OtpValueInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1103OtpValueInfo(Map paramMap) throws Exception {
		prj1100DAO.updatePrj1103OtpValueInfo(paramMap);
	}
	

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int insertPrj1105RevisionNumList(Map paramMap) throws Exception {
		int selRepNumCnt = Integer.parseInt((String)paramMap.get("selRepNumCnt"));
		
		
		int addFailRepNumCnt = 0;
		
		if(selRepNumCnt > 1){
			List<String> selRepNumList = (List<String>) paramMap.get("selRepNum");
			
			for(String selRepNumInfo : selRepNumList){
				Map newMap = new HashMap<String, String>();
				
				JSONObject jsonObj = null;
				jsonObj = new JSONObject(selRepNumInfo);
				
				newMap.put("licGrpId", String.valueOf(paramMap.get("licGrpId")));
				newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
				newMap.put("reqId", String.valueOf(paramMap.get("reqId")));
				newMap.put("processId", String.valueOf(paramMap.get("processId")));
				newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
				newMap.put("svnRepId", String.valueOf(jsonObj.get("svnRepId")));
				newMap.put("revisionNum", String.valueOf(jsonObj.get("revisionNum")));
				newMap.put("revisionComment", String.valueOf(jsonObj.get("revisionComment")));
				
				
				int reqRepCnt = prj1100DAO.selectPrj1104ReqRevisionNumCnt(newMap);
				
				
				if(reqRepCnt == 0){
					prj1100DAO.insertPrj1105RevisionNumInfo(newMap);
				}else{
					addFailRepNumCnt++;
				}
			}
		}else{
			String selRepNumInfo = (String) paramMap.get("selRepNum");
			
			Map newMap = new HashMap<String, String>();
			
			JSONObject jsonObj = null;
			jsonObj = new JSONObject(selRepNumInfo);
			
			newMap.put("licGrpId", String.valueOf(paramMap.get("licGrpId")));
			newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
			newMap.put("reqId", String.valueOf(paramMap.get("reqId")));
			newMap.put("processId", String.valueOf(paramMap.get("processId")));
			newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
			newMap.put("svnRepId", String.valueOf(jsonObj.get("svnRepId")));
			newMap.put("revisionNum", String.valueOf(jsonObj.get("revisionNum")));
			newMap.put("revisionComment", String.valueOf(jsonObj.get("revisionComment")));
			
			
			int reqRepCnt = prj1100DAO.selectPrj1104ReqRevisionNumCnt(newMap);
			
			
			if(reqRepCnt == 0){
				prj1100DAO.insertPrj1105RevisionNumInfo(newMap);
			}else{
				addFailRepNumCnt++;
			}
		}
		
		return addFailRepNumCnt;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deletePrj1104RevisionNumList(Map paramMap) throws Exception {
		int selRepNumCnt = Integer.parseInt((String)paramMap.get("selRepNumCnt"));
		
		if(selRepNumCnt > 1){
			List<String> selRepNumList = (List<String>) paramMap.get("selRepNum");
			
			for(String selRepNumInfo : selRepNumList){
				Map newMap = new HashMap<String, String>();
				
				JSONObject jsonObj = null;
				jsonObj = new JSONObject(selRepNumInfo);
				
				newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
				newMap.put("reqId", String.valueOf(paramMap.get("reqId")));
				newMap.put("processId", String.valueOf(paramMap.get("processId")));
				newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
				newMap.put("svnRepId", String.valueOf(jsonObj.get("svnRepId")));
				newMap.put("revisionNum", String.valueOf(jsonObj.get("revisionNum")));
				
				
				prj1100DAO.deletePrj1104RevisionNumInfo(newMap);
			}
		}else{
			String selRepNumInfo = (String) paramMap.get("selRepNum");
			
			Map newMap = new HashMap<String, String>();
			
			JSONObject jsonObj = null;
			jsonObj = new JSONObject(selRepNumInfo);
			
			newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
			newMap.put("reqId", String.valueOf(paramMap.get("reqId")));
			newMap.put("processId", String.valueOf(paramMap.get("processId")));
			newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
			newMap.put("svnRepId", String.valueOf(jsonObj.get("svnRepId")));
			newMap.put("revisionNum", String.valueOf(jsonObj.get("revisionNum")));
			
			
			prj1100DAO.deletePrj1104RevisionNumInfo(newMap);
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1104RevisionNumInfo(Map paramMap) throws Exception {
		prj1100DAO.deletePrj1104RevisionNumInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1104ReqRevisionNumList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1104ReqRevisionNumList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1104ReqRevisionNumListCnt(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1104ReqRevisionNumListCnt(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int selectPrj1104ReqRevisionNumCnt(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1104ReqRevisionNumCnt(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int insertPrj1105FlowAuthGrpList(Map paramMap) throws Exception {
		int selAuthCnt = Integer.parseInt((String)paramMap.get("selAuthCnt"));
		
		
		int addFailAuthCnt = 0;
		
		if(selAuthCnt > 1){
			List<String> selAuthList = (List<String>) paramMap.get("selAuth");
			
			for(String selAuthInfo : selAuthList){
				Map newMap = new HashMap<String, String>();
				
				JSONObject jsonObj = null;
				jsonObj = new JSONObject(selAuthInfo);
				
				newMap.put("licGrpId", String.valueOf(paramMap.get("licGrpId")));
				newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
				newMap.put("processId", String.valueOf(paramMap.get("processId")));
				newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
				newMap.put("authGrpId", String.valueOf(jsonObj.get("authGrpId")));
				newMap.put("authGrpTargetCd", String.valueOf(jsonObj.get("authGrpTargetCd")));
				
				
				int flowAuthCnt = prj1100DAO.selectPrj1105FlowAuthGrpCnt(newMap);
				
				
				if(flowAuthCnt == 0){
					prj1100DAO.insertPrj1105FlowAuthGrpInfo(newMap);
				}else{
					addFailAuthCnt++;
				}
			}
		}else{
			String selAuthInfo = (String) paramMap.get("selAuth");
			
			Map newMap = new HashMap<String, String>();
			
			JSONObject jsonObj = null;
			jsonObj = new JSONObject(selAuthInfo);
			
			newMap.put("licGrpId", String.valueOf(paramMap.get("licGrpId")));
			newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
			newMap.put("processId", String.valueOf(paramMap.get("processId")));
			newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
			newMap.put("authGrpId", String.valueOf(jsonObj.get("authGrpId")));
			newMap.put("authGrpTargetCd", String.valueOf(jsonObj.get("authGrpTargetCd")));
			
			
			int reqRepCnt = prj1100DAO.selectPrj1105FlowAuthGrpCnt(newMap);
			
			
			if(reqRepCnt == 0){
				prj1100DAO.insertPrj1105FlowAuthGrpInfo(newMap);
			}else{
				addFailAuthCnt++;
			}
		}
		
		return addFailAuthCnt;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deletePrj1105FlowAuthGrpList(Map paramMap) throws Exception {
		int selAuthCnt = Integer.parseInt((String)paramMap.get("selAuthCnt"));
		
		if(selAuthCnt > 1){
			List<String> selAuthList = (List<String>) paramMap.get("selAuth");
			
			for(String selAuthInfo : selAuthList){
				Map newMap = new HashMap<String, String>();
				
				JSONObject jsonObj = null;
				jsonObj = new JSONObject(selAuthInfo);
				
				newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
				newMap.put("processId", String.valueOf(paramMap.get("processId")));
				newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
				newMap.put("authGrpId", String.valueOf(jsonObj.get("authGrpId")));
				newMap.put("authGrpTargetCd", String.valueOf(jsonObj.get("authGrpTargetCd")));
				
				
				prj1100DAO.deletePrj1105FlowAuthGrpInfo(newMap);
			}
		}else{
			String selAuthInfo = (String) paramMap.get("selAuth");
			
			Map newMap = new HashMap<String, String>();
			
			JSONObject jsonObj = null;
			jsonObj = new JSONObject(selAuthInfo);
			
			newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
			newMap.put("processId", String.valueOf(paramMap.get("processId")));
			newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
			newMap.put("authGrpId", String.valueOf(jsonObj.get("authGrpId")));
			newMap.put("authGrpTargetCd", String.valueOf(jsonObj.get("authGrpTargetCd")));
			
			
			prj1100DAO.deletePrj1105FlowAuthGrpInfo(newMap);
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1105FlowAuthGrpInfo(Map paramMap) throws Exception {
		prj1100DAO.insertPrj1105FlowAuthGrpInfo(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1105FlowAuthGrpInfo(Map paramMap) throws Exception {
		prj1100DAO.deletePrj1105FlowAuthGrpInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1105FlowAuthGrpList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1105FlowAuthGrpList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1105FlowAuthGrpCnt(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1105FlowAuthGrpCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1100FlowChargerCntList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100FlowChargerCntList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1100ProcessCopyList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessCopyList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertPrj1100ProcessCopyInfo(Map paramMap) throws Exception{
		
		List<Map> flowList = prj1100DAO.selectPrj1101FlowList(paramMap);

		
		List<Map> flowOptList = prj1100DAO.selectPrj1102OptList(paramMap);
		
		
		List<Map> flowAuthGrpList = prj1100DAO.selectPrj1105FlowAuthGrpList(paramMap);
				
		paramMap.remove("prjId");
		paramMap.put("prjId", paramMap.get("selPrjId"));
		
		
		paramMap.put("processConfirmCd", "02");
		String processJsonData = (String) paramMap.get("processJsonData");
		paramMap.remove("processJsonData");
		
		String newProcessId = prj1100DAO.insertPrj1100ProcessInfo(paramMap);
		
		paramMap.put("processJsonData", processJsonData);
		paramMap.put("processId", newProcessId);
		
		prj1100DAO.updatePrj1100ProcessInfo(paramMap);
		
		for(Map flowInfo: flowList){
			
			flowInfo.remove("prjId");
			flowInfo.remove("processId");
			
			flowInfo.put("prjId", paramMap.get("prjId"));
			flowInfo.put("processId", newProcessId);
			
			
			prj1100DAO.insertPrj1101FlowInfo(flowInfo);
		}
		

		for(Map flowOptInfo: flowOptList){
			
			flowOptInfo.remove("prjId");
			flowOptInfo.remove("processId");
			
			flowOptInfo.put("prjId", paramMap.get("prjId"));
			flowOptInfo.put("processId",newProcessId);
			
			
			prj1100DAO.insertPrj1102OtpCopyInfo(flowOptInfo);
		}
		
		
		for(Map flowAuthGrpInfo: flowAuthGrpList){
			
			flowAuthGrpInfo.remove("prjId");
			flowAuthGrpInfo.remove("processId");
			
			flowAuthGrpInfo.put("prjId", paramMap.get("prjId"));
			flowAuthGrpInfo.put("processId", newProcessId);
			
			
			prj1100DAO.insertPrj1105FlowAuthGrpInfo(flowAuthGrpInfo);
		}
	}
	

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1102FlwOptExistFileIdList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1102FlwOptExistFileIdList(paramMap);
	}
}
