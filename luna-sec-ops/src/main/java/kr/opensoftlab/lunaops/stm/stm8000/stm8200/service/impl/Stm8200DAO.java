package kr.opensoftlab.lunaops.stm.stm8000.stm8200.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;


@Repository("stm8200DAO")
public class Stm8200DAO extends ComOslitsAbstractDAO {

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm8200RevisionAuthList(Map paramMap) throws Exception {
		return  (List<Map>) list("stm8200DAO.selectStm8200RevisionAuthList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm8200RevisionAuthInfo(Map paramMap) throws Exception {
		insert("stm8200DAO.insertStm8200RevisionAuthInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteStm8200RevisionAuthInfo(Map paramMap) throws Exception {
		delete("stm8200DAO.deleteStm8200RevisionAuthInfo", paramMap);
	}
}
