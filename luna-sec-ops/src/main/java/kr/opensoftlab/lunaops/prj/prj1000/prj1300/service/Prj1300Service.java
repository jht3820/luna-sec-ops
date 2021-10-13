package kr.opensoftlab.lunaops.prj.prj1000.prj1300.service;


import java.util.List;
import java.util.Map;



public interface Prj1300Service {
	
	@SuppressWarnings("rawtypes")
	List selectPrj1300TemplateList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectPrj1300TemplateInfo(Map paramMap) throws Exception;	
	
	
	String insertPrj1300PrjTemplateAjax(Map<String, String> paramMap) throws Exception;

	
	void updatePrj1300PrjTemplateAjax(Map<String, String> paramMap) throws Exception;

	
	void deletePrj1300PrjTemplateAjax(Map<String, String> paramMap) throws Exception;
	
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1302AllItemList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List selectPrj1302ItemList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectPrj1302ItemListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectPrj1302ItemInfo(Map paramMap) throws Exception;	
	
	
	String insertPrj1302ItemAjax(Map<String, String> paramMap) throws Exception;

	
	void updatePrj1302ItemAjax(Map<String, String> paramMap) throws Exception;

	
	void deletePrj1302ItemAjax(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1302CommonCodeList(Map paramMap) throws Exception;
	
	
	
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1102AllItemList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List selectPrj1102ItemList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectPrj1102ItemListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectPrj1102ItemInfo(Map paramMap) throws Exception;	

	
	void savePrj1102ItemAjax(Map<String, String> paramMap) throws Exception;


	
	void deletePrj1102ItemAjax(Map<String, String> paramMap) throws Exception;
	
}
