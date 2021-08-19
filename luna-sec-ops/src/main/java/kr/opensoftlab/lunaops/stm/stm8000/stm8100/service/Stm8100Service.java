package kr.opensoftlab.lunaops.stm.stm8000.stm8100.service;

import java.util.List;
import java.util.Map;


public interface Stm8100Service {
	
	
	public int selectStm8100ServerListCnt(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8100ServerList(Map<String, String> paramMap) throws Exception;

	
	public void insertStm8100ServerList(Map<String, String> paramMap) throws Exception;
	
	public void deleteStm8100ServerList(Map<String, String> paramMap) throws Exception;
}
