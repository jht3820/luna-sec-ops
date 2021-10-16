package kr.opensoftlab.lunaops.stm.stm8000.stm8200.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;


@Repository("stm8200DAO")
public class Stm8200DAO extends ComOslitsAbstractDAO {

	
	@SuppressWarnings("rawtypes" )
	public int selectStm8200AssRepAllListCnt(Map paramMap) throws Exception {
		return  (int) select("stm8200DAO.selectStm8200AssRepAllListCnt", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm8200AssRepAllList(Map paramMap) throws Exception {
		return  (List<Map>) list("stm8200DAO.selectStm8200AssRepAllList", paramMap);
	}
}
