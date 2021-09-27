package kr.opensoftlab.lunaops.cmm.cmm6000.cmm6600.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("cmm6600DAO")
public class Cmm6600DAO extends ComOslitsAbstractDAO {

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectCmm6601SignHisList(Map<String, String> paramMap) throws Exception{
		return (List<Map>) list("cmm6600DAO.selectCmm6601SignHisList", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectCmm6600SignUsrList(Map<String, String> paramMap) throws Exception{
		return (List<Map>) list("cmm6600DAO.selectCmm6600SignUsrList", paramMap);
	}

	
	public void insertCmm6600SignLine(Map<String, String> paramMap) throws Exception{
		insert("cmm6600DAO.insertCmm6600SignLine",paramMap);
		
	}

	
	public void deleteCmm6600SignLine(Map<String, String> paramMap) throws Exception{
		update("cmm6600DAO.deleteCmm6600SignLine",paramMap);
	}

	
	public void insertCmm6601SignInfo(Map<String, String> paramMap) throws Exception{
		insert("cmm6600DAO.insertCmm6601SignInfo",paramMap);
	}

	
	public int selectCmm6600SignListCnt(Map<String, String> paramMap) throws Exception {
		return (Integer) select("cmm6600DAO.selectCmm6601SignListCnt", paramMap);
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectCmm6600SignList(Map<String, String> paramMap) throws Exception {
		return (List<Map>) list("cmm6600DAO.selectCmm6601SignList",paramMap);
	}

	
	public int selectCmm6600UsrSignListCnt(Map<String, String> paramMap) throws Exception {
		return (Integer) select("cmm6600DAO.selectCmm6601UsrSignListCnt",paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectCmm6600UsrSignList(Map<String, String> paramMap) throws Exception{
		return (List) list("cmm6600DAO.selectCmm6601UsrSignList",paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectCmm6601SignInfo(Map<String, String> paramMap) throws Exception{
		return (Map) select("cmm6600DAO.selectCmm6601SignInfo",paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectCmm6600NextOrdInfo(Map<String, String> paramMap) throws Exception{
		return (Map) select("cmm6600DAO.selectCmm6600NextOrdInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectCmm6600MaxOrd(Map paramMap) throws Exception{
		return (int) select("cmm6600DAO.selectCmm6600MaxOrd", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String selectCmm6600NewSignLineId(Map paramMap) throws Exception{
		return (String) select("cmm6600DAO.selectCmm6600NewSignLineId", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectCmm6601CmmInfo(Map paramMap) throws Exception{
		return (Map) select("cmm6600DAO.selectCmm6601CmmInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectCmm6600SignLineUsrTree(Map paramMap) throws Exception{
		return (List<Map>) list("cmm6600DAO.selectCmm6600SignLineUsrTree", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void insertCmm6602SignReqInfo(Map paramMap) throws Exception {
		insert("cmm6600DAO.insertCmm6602SignReqInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertCmm6603SignRfrInfo(Map paramMap) throws Exception {
		insert("cmm6600DAO.insertCmm6603SignRfrInfo", paramMap);
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectCmm6603SignRfrList(Map paramMap) throws Exception {
		return (List<Map>) list("cmm6600DAO.selectCmm6603SignRfrList", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void deleteCmm6602SignInfo(Map paramMap) throws Exception {
		update("cmm6600DAO.deleteCmm6602SignInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectCmm6602RfrTargetListCnt(Map paramMap) throws Exception {
		return (int) select("cmm6600DAO.selectCmm6602RfrTargetListCnt", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectCmm6602RfrTargetList(Map paramMap) throws Exception {
		return (List<Map>) list("cmm6600DAO.selectCmm6602RfrTargetList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updateCmm6603RfrCheck(Map paramMap) throws Exception {
		update("cmm6600DAO.updateCmm6603RfrCheck", paramMap);
	}
}
