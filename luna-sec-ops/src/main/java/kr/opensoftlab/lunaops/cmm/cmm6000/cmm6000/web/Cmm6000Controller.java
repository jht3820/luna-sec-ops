package kr.opensoftlab.lunaops.cmm.cmm6000.cmm6000.web;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;



@Controller
public class Cmm6000Controller {

	
	private static final Logger Log = Logger.getLogger(Cmm6000Controller.class);
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
    
    @RequestMapping(value="/cmm/cmm6000/cmm6000/selectCmm6000View.do")
    public String selectCmm6000View(Model model) throws Exception {
    	return "/cmm/cmm6000/cmm6000/cmm6000";
    }
}
