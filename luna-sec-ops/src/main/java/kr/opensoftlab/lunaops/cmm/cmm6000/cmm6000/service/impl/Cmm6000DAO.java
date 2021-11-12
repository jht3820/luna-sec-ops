package src.main.java.kr.opensoftlab.lunaops.cmm.cmm6000.cmm6000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

@Repository("cmm6000DAO")
public class Cmm6000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectCmm17000PrjList(Map paramMap) throws Exception {
		return  (List<Map>) list("cmm6000DAO.selectCmm6000PrjList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int  selectCmm17000PrjListCnt(Map paramMap) throws Exception {
		 return  (Integer) select("cmm6000DAO.selectCmm6000PrjListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void  updateCmm17000UsrMainPrj(Map paramMap) throws Exception {
		update("cmm6000DAO.updateCmm6000UsrMainPrj", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map>  selectCmm17000UsrMainPrj(Map paramMap) throws Exception {
		return (List<Map>) list("cmm6000DAO.selectCmm6000UsrMainPrj", paramMap);
	}
	
	
}
