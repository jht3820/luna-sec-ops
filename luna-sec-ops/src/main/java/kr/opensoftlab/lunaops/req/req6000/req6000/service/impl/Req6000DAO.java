package kr.opensoftlab.lunaops.req.req6000.req6000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("req6000DAO")
public class Req6000DAO extends ComOslitsAbstractDAO {
	
		
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectReq6001ReqChgList(Map paramMap) throws Exception{
		return (List<Map>) list("req6000DAO.selectReq6001ReqChgList", paramMap);
	}
	
		
	@SuppressWarnings("rawtypes")
	public String insertReq6001ReqChgInfo(Map paramMap) throws Exception{
		return (String)insert("req6000DAO.insertReq6001ReqChgInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deleteReq6001ReqChgInfo(Map paramMap) throws Exception{
		return (int) delete("req6000DAO.deleteReq6001ReqChgInfo", paramMap);
	}
	
}
