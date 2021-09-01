package kr.opensoftlab.lunaops.stm.stm8000.stm8300.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;


@Repository("stm8300DAO")
public class Stm8300DAO extends ComOslitsAbstractDAO {

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm8300FileCodeAuthList(Map paramMap) throws Exception {
		return  (List<Map>) list("stm8300DAO.selectStm8300FileCodeAuthList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm8300FileCodeAuthInfo(Map paramMap) throws Exception {
		insert("stm8300DAO.insertStm8300FileCodeAuthInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteStm8300FileCodeAuthInfo(Map paramMap) throws Exception {
		delete("stm8300DAO.deleteStm8300FileCodeAuthInfo", paramMap);
	}
}
