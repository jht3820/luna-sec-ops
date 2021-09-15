package kr.opensoftlab.lunaops.cmm.cmm6000.cmm6600.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("cmm6600DAO")
public class Cmm6600DAO extends ComOslitsAbstractDAO {

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectCmm6600SignUsrList(Map<String, String> paramMap) throws Exception{
		return (List<Map>) list("cmm6600DAO.selectCmm6600SignUsrList", paramMap);
	}

}
