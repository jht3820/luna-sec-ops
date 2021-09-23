package kr.opensoftlab.lunaops.cmm.cmm6000.cmm6500.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;



@Controller
public class Cmm6500Controller {
	
	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@RequestMapping(value="/cmm/cmm6000/cmm6500/selectCmm6500View.do")
    public String selectCmm6500View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/cmm/cmm6000/cmm6500/cmm6500";
	}
	

}
