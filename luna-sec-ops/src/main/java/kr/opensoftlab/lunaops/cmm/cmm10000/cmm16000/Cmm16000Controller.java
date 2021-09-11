package kr.opensoftlab.lunaops.cmm.cmm10000.cmm16000.web;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;





@Controller
public class Cmm16000Controller {
	
	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
    @RequestMapping(value="/cmm/cmm10000/cmm16000/selectCmm16000View.do")
    public String selectCmm16000View() throws Exception {
    	return "/cmm/cmm10000/cmm16000/cmm16000";
    }
}
