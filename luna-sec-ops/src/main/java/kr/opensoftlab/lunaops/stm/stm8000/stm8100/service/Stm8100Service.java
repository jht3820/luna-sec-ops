package kr.opensoftlab.lunaops.stm.stm8000.stm8100.service;

import java.util.List;
import java.util.Map;


public interface Stm8100Service {
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm8100ServerListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8100ServerList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes" )
	public void insertStm8100ServerList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes" )
	public void deleteStm8100ServerList(Map paramMap) throws Exception;
    	
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8110RevisionAuthList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8120FileCodeAuthList(Map paramMap) throws Exception;
	

	
	@SuppressWarnings("rawtypes" )
	public void insertStm8100AuthList(Map paramMap) throws Exception;
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8100PrjAllAuthAndUserList(Map paramMap) throws Exception;
}
