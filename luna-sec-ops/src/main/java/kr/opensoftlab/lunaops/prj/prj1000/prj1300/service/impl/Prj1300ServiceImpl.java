package kr.opensoftlab.lunaops.prj.prj1000.prj1300.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.prj.prj1000.prj1300.service.Prj1300Service;



@Service("prj1300Service")
public class Prj1300ServiceImpl extends EgovAbstractServiceImpl implements Prj1300Service {
	
	
    @Resource(name="prj1300DAO")
    private Prj1300DAO prj1300DAO;

	
	@Override
	public List selectPrj1300TemplateList(Map paramMap) throws Exception {
		return prj1300DAO.selectPrj1300TemplateList(paramMap);
	}

	
	@Override
	public Map selectPrj1300TemplateInfo(Map paramMap) throws Exception {
		return prj1300DAO.selectPrj1300TemplateInfo(paramMap);
	}
	
	
	@Override
	public String insertPrj1300PrjTemplateAjax(Map<String, String> paramMap) throws Exception {
		return prj1300DAO.insertPrj1300PrjTemplateAjax(paramMap);
	}

	
	@Override
	public void updatePrj1300PrjTemplateAjax(Map<String, String> paramMap) throws Exception {
		prj1300DAO.updatePrj1300PrjTemplateAjax(paramMap);
	}

	
	@Override
	public void deletePrj1300PrjTemplateAjax(Map<String, String> paramMap) throws Exception {
		String deleteDataList = (String) paramMap.get("deleteDataList");
		if(deleteDataList != null && !"[]".equals(deleteDataList)) {
			
			JSONArray jsonArray = new JSONArray(deleteDataList);
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				String prjId = jsonObj.getString("prjId");
				String templateId = jsonObj.getString("templateId");
				paramMap.put("prjId", prjId);
				paramMap.put("templateId", templateId);
				prj1300DAO.deletePrj1300PrjTemplateAjax(paramMap);
				
				prj1300DAO.deletePrj1302ItemAjax(paramMap);
			}
		}
	}
	

	
	@Override
	public List selectPrj1302ItemList(Map paramMap) throws Exception {
		return prj1300DAO.selectPrj1302ItemList(paramMap);
	}

	
	@Override
	public int selectPrj1302ItemListCnt(Map paramMap) throws Exception {
		return prj1300DAO.selectPrj1302ItemListCnt(paramMap);
	}

	
	@Override
	public Map selectPrj1302ItemInfo(Map paramMap) throws Exception {
		return prj1300DAO.selectPrj1302ItemInfo(paramMap);
	}
	
	
	@Override
	public String insertPrj1302ItemAjax(Map<String, String> paramMap) throws Exception {
		return prj1300DAO.insertPrj1302ItemAjax(paramMap);
	}

	
	@Override
	public void updatePrj1302ItemAjax(Map<String, String> paramMap) throws Exception {
		prj1300DAO.updatePrj1302ItemAjax(paramMap);
	}

	
	@Override
	public void deletePrj1302ItemAjax(Map<String, String> paramMap) throws Exception {
		
		String deleteDataList = (String) paramMap.get("deleteDataList");
		if(deleteDataList != null && !"[]".equals(deleteDataList)) {
			
			JSONArray jsonArray = new JSONArray(deleteDataList);
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				String prjId = jsonObj.getString("prjId");
				String templateId = jsonObj.getString("templateId");
				String itemId = jsonObj.getString("itemId");
				paramMap.put("prjId", prjId);
				paramMap.put("templateId", templateId);
				paramMap.put("itemId", itemId);
				prj1300DAO.deletePrj1302ItemAjax(paramMap);
			}
		}
	}
	
	
	@Override
	public List selectPrj1302CommonCodeList(Map paramMap) throws Exception {
		return prj1300DAO.selectPrj1302CommonCodeList(paramMap);
	}
}
