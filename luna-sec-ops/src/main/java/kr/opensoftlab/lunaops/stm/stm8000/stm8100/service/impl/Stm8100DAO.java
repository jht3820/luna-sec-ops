package kr.opensoftlab.lunaops.stm.stm8000.stm8100.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;


@Repository("stm8100DAO")
public class Stm8100DAO extends ComOslitsAbstractDAO {

	
	@SuppressWarnings("rawtypes")
	public int selectStm8100ServerListCnt(Map paramMap) throws Exception {
		return  (int) select("stm8100DAO.selectStm8100ServerListCnt", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm8100ServerList(Map paramMap) throws Exception {
		return  (List<Map>) list("stm8100DAO.selectStm8100ServerList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm8100ServerInfo(Map paramMap) throws Exception {
		insert("stm8100DAO.insertStm8100ServerInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteStm8100ServerInfo(Map paramMap) throws Exception {
		delete("stm8100DAO.deleteStm8100ServerInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm8110RevisionAuthList(Map paramMap) throws Exception {
		return  (List<Map>) list("stm8100DAO.selectStm8110RevisionAuthList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm8110RevisionAuthInfo(Map paramMap) throws Exception {
		insert("stm8100DAO.insertStm8110RevisionAuthInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteStm8110RevisionAuthInfo(Map paramMap) throws Exception {
		delete("stm8100DAO.deleteStm8110RevisionAuthInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm8120FileCodeAuthList(Map paramMap) throws Exception {
		return  (List<Map>) list("stm8100DAO.selectStm8120FileCodeAuthList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm8120FileCodeAuthInfo(Map paramMap) throws Exception {
		insert("stm8100DAO.insertStm8120FileCodeAuthInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteStm8120FileCodeAuthInfo(Map paramMap) throws Exception {
		delete("stm8100DAO.deleteStm8120FileCodeAuthInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm8100PrjAllAuthAndUserList(Map paramMap) throws Exception {
		return  (List<Map>) list("stm8100DAO.selectStm8100PrjAllAuthAndUserList", paramMap);
	}
}
