package kr.opensoftlab.lunaops.req.req6000.req6000.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.service.impl.Dpl1100DAO;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.impl.Prj1100DAO;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.impl.Req4100DAO;
import kr.opensoftlab.lunaops.req.req6000.req6000.service.Req6000Service;
import kr.opensoftlab.lunaops.req.req6000.req6000.vo.Req6001VO;


@Service("req6000Service")
public class Req6000ServiceImpl  extends EgovAbstractServiceImpl implements Req6000Service{

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
    @Resource(name="req4100DAO")
    private Req4100DAO req4100DAO;
    
    @Resource(name="prj1100DAO")
    private Prj1100DAO prj1100DAO;
    
    @Resource(name="req6000DAO")
    private Req6000DAO req6000DAO;
    
    @Resource(name="dpl1100DAO")
    private Dpl1100DAO dpl1100DAO;
    
    	
	@SuppressWarnings({ "rawtypes"})
	public List<Map> selectReq6001ReqChgList(Map paramMap) throws Exception{
		return req6000DAO.selectReq6001ReqChgList(paramMap);
	}
	
		
	@SuppressWarnings("rawtypes")
	public String insertReq6001ReqChgInfo(Map paramMap) throws Exception{
		
		String newChgId = "";
		
		
		Req6001VO req6001vo = (Req6001VO) paramMap.get("req6001Vo");
		
		
		
		if(req6001vo == null) {
			throw new UserDefineException(egovMessageSource.getMessage("fail.common.insert"));
		}
		
		Map newMap = BeanUtils.describe(req6001vo);
		
		
		newChgId = req6000DAO.insertReq6001ReqChgInfo(newMap);
		
		return newChgId;
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deleteReq6001ReqChgInfo(Map paramMap) throws Exception{
		return req6000DAO.deleteReq6001ReqChgInfo(paramMap);
	}
}
