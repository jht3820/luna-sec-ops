package kr.opensoftlab.lunaops.cmm.cmm6000.cmm6200.web;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;



@Controller
public class Cmm6200Controller {

	
	private static final Logger Log = Logger.getLogger(Cmm6200Controller.class);
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
    
    @RequestMapping(value="/cmm/cmm6000/cmm6200/selectCmm6200View.do")
    public String selectCmm6000View(Model model) throws Exception {
    	return "/cmm/cmm6000/cmm6200/cmm6200";
    }
    

	
    @RequestMapping(value="/cmm/cmm6000/cmm6200/selectCmm6206View.do")
    public String selectCmm6006View(Model model) throws Exception {
    	return "/cmm/cmm6000/cmm6200/cmm6206";
    }
}
