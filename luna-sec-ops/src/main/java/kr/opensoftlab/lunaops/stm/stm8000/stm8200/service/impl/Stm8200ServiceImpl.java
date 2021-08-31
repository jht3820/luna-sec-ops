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

/**
 * @Class Name : Stm8200ServiceImpl.java
 * @Description : Stm8200ServiceImpl Business Implement class
 * @Modification Information
 *
 * @author 안지혜
 * @since 2020.10.31
 * @version 1.0
 * @see
 * 
 * 		Copyright (C) All right reserved.
 */

@Service("stm8200Service")
public class Stm8200ServiceImpl extends EgovAbstractServiceImpl implements Stm8200Service {

	/* Stm8200DAO */
	@Resource(name = "stm8200DAO")
	private Stm8200DAO stm8200DAO;

	/**
	 * Stm8200 소스저장소 전체 배정 현황 목록 총 개수
	 * @param paramMap 목록조회 정보
	 * @return int
	 * @exception Exception
	 */
	@SuppressWarnings( "rawtypes" )
	public int selectStm8200AssRepAllListCnt(Map paramMap) throws Exception{
		return stm8200DAO.selectStm8200AssRepAllListCnt(paramMap);
	}
	
	/**
	 * Stm8200 소스저장소 전체 배정 현황 목록
	 * @param paramMap 목록조회 정보
	 * @return list 
	 * @exception Exception
	 */
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8200AssRepAllList(Map paramMap) throws Exception{
		return stm8200DAO.selectStm8200AssRepAllList(paramMap);
	}
	
}
