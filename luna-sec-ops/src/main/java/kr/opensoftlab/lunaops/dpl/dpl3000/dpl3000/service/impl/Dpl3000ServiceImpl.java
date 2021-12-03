package kr.opensoftlab.lunaops.dpl.dpl3000.dpl3000.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.dpl.dpl3000.dpl3000.service.Dpl3000Service;


@Service("dpl3000Service")
public class Dpl3000ServiceImpl  extends EgovAbstractServiceImpl implements Dpl3000Service{

	
    @Resource(name="dpl3000DAO")
    private Dpl3000DAO dpl3000DAO;

    
	@SuppressWarnings({"rawtypes" })
	public Map selectDpl1400DplJobBuildInfo(Map paramMap)  throws Exception{
		return dpl3000DAO.selectDpl1400DplJobBuildInfo(paramMap);
	} 

}
