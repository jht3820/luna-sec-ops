package kr.opensoftlab.lunaops.stm.stm8000.stm8200.service;

import java.util.List;
import java.util.Map;


public interface Stm8200Service {
	

	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8200RevisionAuthList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8200PrjAllAuthAndUserList(Map paramMap) throws Exception;

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void insertStm8200RevisionAuthList(Map paramMap) throws Exception;

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void deleteStm8200RevisionAuthList(Map paramMap) throws Exception;
}
