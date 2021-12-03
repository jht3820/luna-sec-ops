package kr.opensoftlab.lunaops.dpl.dpl3000.dpl3000.service.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;


@Repository("dpl3000DAO")
public class Dpl3000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({"rawtypes" })
	public Map selectDpl1400DplJobBuildInfo(Map paramMap)  throws Exception{
		return (Map) select("dpl3000DAO.selectDpl1400DplJobBuildInfo", paramMap);
	}
} 
