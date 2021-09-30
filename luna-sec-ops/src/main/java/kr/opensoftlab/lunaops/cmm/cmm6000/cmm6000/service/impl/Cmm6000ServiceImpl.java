package src.main.java.kr.opensoftlab.lunaops.cmm.cmm6000.cmm6000.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.cmm.cmm6000.cmm6000.service.Cmm6000Service;



@Service("cmm6000Service")
public class Cmm6000ServiceImpl extends EgovAbstractServiceImpl implements Cmm6000Service {
	
	
	
    @Resource(name="cmm6000DAO")
    private Cmm6000DAO cmm6000DAO;
    
	
	@SuppressWarnings({ "rawtypes" })
	@Override
	public List<Map>  selectReq1000ReqList(Map paramMap) throws Exception {
		return  cmm6000DAO.selectCmm17000PrjList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public int  selectReq1000ReqListCnt(Map paramMap) throws Exception {
		 return cmm6000DAO.selectCmm17000PrjListCnt(paramMap);
	}
	
	
	
	@Override
	public void updateCmm17000UsrMainPrj(Map<String, String> paramMap) throws Exception {
		
		cmm6000DAO.updateCmm17000UsrMainPrj(paramMap);
	} 
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectCmm17000UsrMainPrj(Map<String, String> paramMap) throws Exception {
		
		return cmm6000DAO.selectCmm17000UsrMainPrj(paramMap);
		
	} 

}
