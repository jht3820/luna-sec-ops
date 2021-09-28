package kr.opensoftlab.lunaops.cmm.cmm6000.cmm6800.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.Stm3000Service;
import kr.opensoftlab.lunaops.stm.stm8000.stm8000.service.Stm8000Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Cmm6800Controller {

	
	private static final Logger Log = Logger.getLogger(Cmm6800Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "stm8000Service")
	private Stm8000Service stm8000Service;
	
	
	@RequestMapping(value="/cmm/cmm6000/cmm6800/selectCmm6800View.do")
	public String selectCmm6800View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/cmm/cmm6000/cmm6800/cmm6800";
	}
	
	
	@RequestMapping(value="/cmm/cmm6000/cmm6800/selectCmm6801View.do")
	public String selectCmm6801View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/cmm/cmm6000/cmm6800/cmm6801";
	}
}
