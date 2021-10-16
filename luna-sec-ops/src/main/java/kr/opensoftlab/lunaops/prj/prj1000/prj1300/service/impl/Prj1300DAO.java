package kr.opensoftlab.lunaops.prj.prj1000.prj1300.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("prj1300DAO")
public class Prj1300DAO  extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1300TemplateList(Map paramMap) throws Exception{
		return (List)list("prj1300DAO.selectPrj1300TemplateList",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1300TemplateInfo(Map paramMap) throws Exception{
		return (Map)select("prj1300DAO.selectPrj1300TemplateInfo",paramMap);
	}
	
	
	public String insertPrj1300PrjTemplateAjax(Map<String, String> paramMap) throws Exception{
		return (String) insert("prj1300DAO.insertPrj1300PrjTemplateAjax",paramMap);
		
	}

	
	public int updatePrj1300PrjTemplateAjax(Map<String, String> paramMap) throws Exception{
		return (int) update("prj1300DAO.updatePrj1300PrjTemplateAjax", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void deletePrj1300PrjTemplateAjax(Map infoMap) throws Exception{
		delete("prj1300DAO.deletePrj1300PrjTemplateAjax", infoMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1302AllItemList(Map paramMap) throws Exception{
		return (List)list("prj1300DAO.selectPrj1302AllItemList",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1302ItemList(Map paramMap) throws Exception{
		return (List)list("prj1300DAO.selectPrj1302ItemList",paramMap);
	}
	
	
	public int selectPrj1302ItemListCnt(Map<String, String> paramMap) throws Exception{
		return (int) select("prj1300DAO.selectPrj1302ItemListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1302ItemInfo(Map paramMap) throws Exception{
		return (Map)select("prj1300DAO.selectPrj1302ItemInfo",paramMap);
	}
	
	
	public String insertPrj1302ItemAjax(Map<String, String> paramMap) throws Exception{
		return (String) insert("prj1300DAO.insertPrj1302ItemAjax",paramMap);
		
	}

	
	public int updatePrj1302ItemAjax(Map<String, String> paramMap) throws Exception{
		return (int) update("prj1300DAO.updatePrj1302ItemAjax", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void deletePrj1302ItemAjax(Map infoMap) throws Exception{
		delete("prj1300DAO.deletePrj1302ItemAjax", infoMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1302CommonCodeList(Map paramMap) throws Exception{
		return (List)list("prj1300DAO.selectPrj1302CommonCodeList",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1102AllItemList(Map paramMap) throws Exception{
		return (List)list("prj1300DAO.selectPrj1102AllItemList",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1102ItemList(Map paramMap) throws Exception{
		return (List)list("prj1300DAO.selectPrj1102ItemList",paramMap);
	}
	
	
	public int selectPrj1102ItemListCnt(Map<String, String> paramMap) throws Exception{
		return (int) select("prj1300DAO.selectPrj1102ItemListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1102ItemInfo(Map paramMap) throws Exception{
		return (Map)select("prj1300DAO.selectPrj1102ItemInfo",paramMap);
	}
	
	
	public String insertPrj1102ItemAjax(Map<String, String> paramMap) throws Exception{
		return (String) insert("prj1300DAO.insertPrj1102ItemAjax",paramMap);
		
	}

	
	public int updatePrj1102ItemAjax(Map<String, String> paramMap) throws Exception{
		return (int) update("prj1300DAO.updatePrj1102ItemAjax", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void deletePrj1102ItemAjax(Map infoMap) throws Exception{
		delete("prj1300DAO.deletePrj1102ItemAjax", infoMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void deletePrj1102ItemInfoAjax(Map infoMap) throws Exception{
		delete("prj1300DAO.deletePrj1102ItemInfoAjax", infoMap);
	}
	

	
	
	public String insertPrj1103ItemAjax(Map<String, String> paramMap) throws Exception{
		return (String) insert("prj1300DAO.insertPrj1103ItemAjax",paramMap);
		
	}

	
	public int updatePrj1103ItemAjax(Map<String, String> paramMap) throws Exception{
		return (int) update("prj1300DAO.updatePrj1103ItemAjax", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void deletePrj1103ItemAjax(Map infoMap) throws Exception{
		delete("prj1300DAO.deletePrj1103ItemAjax", infoMap);
	}
	
}