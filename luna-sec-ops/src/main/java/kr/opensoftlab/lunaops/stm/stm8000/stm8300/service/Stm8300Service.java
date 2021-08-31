package kr.opensoftlab.lunaops.stm.stm8000.stm8300.service;

import java.util.List;
import java.util.Map;


public interface Stm8300Service {
	

	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8300FileCodeAuthList(Map paramMap) throws Exception;

	
	@SuppressWarnings( "rawtypes" )
	public void insertStm8300FileCodeAuthList(Map paramMap) throws Exception;

	
	@SuppressWarnings( "rawtypes" )
	public void deleteStm8300FileCodeAuthList(Map paramMap) throws Exception;
}
