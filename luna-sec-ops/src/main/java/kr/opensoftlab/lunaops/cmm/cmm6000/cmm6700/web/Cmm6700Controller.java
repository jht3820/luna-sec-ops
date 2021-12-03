package kr.opensoftlab.lunaops.cmm.cmm6000.cmm6700.web;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;



@Controller
public class Cmm6700Controller {

	
	@SuppressWarnings("unused")
	private static final Logger Log = Logger.getLogger(Cmm6700Controller.class);
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
    
    @RequestMapping(value="/cmm/cmm6000/cmm6700/selectCmm6700View.do")
    public String selectCmm6700View(Model model) throws Exception {
    	return "/cmm/cmm6000/cmm6700/cmm6700";
    }
}
