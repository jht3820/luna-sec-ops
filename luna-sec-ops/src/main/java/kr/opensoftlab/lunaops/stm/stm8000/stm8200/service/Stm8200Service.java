package kr.opensoftlab.lunaops.stm.stm8000.stm8200.service;

import java.util.List;
import java.util.Map;


public interface Stm8200Service {

	
	@SuppressWarnings( "rawtypes" )
	public int selectStm8200AssRepAllListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8200AssRepAllList(Map paramMap) throws Exception;
	
}
