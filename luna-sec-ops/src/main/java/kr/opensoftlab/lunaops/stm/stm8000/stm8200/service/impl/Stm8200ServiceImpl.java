package kr.opensoftlab.lunaops.stm.stm8000.stm8200.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.stm.stm8000.stm8200.service.Stm8200Service;



@Service("stm8200Service")
public class Stm8200ServiceImpl extends EgovAbstractServiceImpl implements Stm8200Service {

	
	@Resource(name = "stm8200DAO")
	private Stm8200DAO stm8200DAO;

	
	@SuppressWarnings( "rawtypes" )
	public int selectStm8200AssRepAllListCnt(Map paramMap) throws Exception{
		return stm8200DAO.selectStm8200AssRepAllListCnt(paramMap);
	}
	
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8200AssRepAllList(Map paramMap) throws Exception{
		return stm8200DAO.selectStm8200AssRepAllList(paramMap);
	}
	
}
