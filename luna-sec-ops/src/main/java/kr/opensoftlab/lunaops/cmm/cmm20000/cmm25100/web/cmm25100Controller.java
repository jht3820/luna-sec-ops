package kr.opensoftlab.lunaops.cmm.cmm20000.cmm25100.web;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class Cmm25100Controller {

	
	@SuppressWarnings("unused")
	private static final Logger Log = Logger.getLogger(Cmm25100Controller.class);
	
	
    
    @RequestMapping(value="/cmm/cmm20000/cmm25100/selectCmm25100View.do")
    public String selectCmm3000View() throws Exception {
    	return "/cmm/cmm20000/cmm25100/cmm25100";
    }
}