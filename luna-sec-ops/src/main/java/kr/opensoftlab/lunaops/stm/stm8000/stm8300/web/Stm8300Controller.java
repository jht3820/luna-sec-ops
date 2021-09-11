package kr.opensoftlab.lunaops.stm.stm8000.stm8300.web;

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
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm8000.stm8300.service.Stm8300Service;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Stm8300Controller {

	
	private static final Logger Log = Logger.getLogger(Stm8300Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "stm8300Service")
	private Stm8300Service stm8300Service;
	
	
	
	@RequestMapping(value="/stm/stm8000/stm8300/selectStm8300View.do")
	public String selectStm8300View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm8000/stm8300/stm8300";
	}
	
	
	@SuppressWarnings( "rawtypes" )
	@RequestMapping(value="/stm/stm8000/stm8300/selectStm8300AssStrgListAjax.do")
	public ModelAndView selectStm8300AssStrgListAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			paramMap.put("type", "ass");
			
			
			List<Map> stm8300AssList = null;

			String paramStrgRepId = paramMap.get("strgRepId");
			
			if(paramStrgRepId != null && !paramStrgRepId.isEmpty()) {
							
				
				stm8300AssList = stm8300Service.selectStm8300FileCodeAuthList(paramMap);
			}
			
			
			model.addAttribute("stm8300AssList", stm8300AssList);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8300AssStrgListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings( "rawtypes" )
	@RequestMapping(value="/stm/stm8000/stm8300/selectStm8300NonAssStrgListAjax.do")
	public ModelAndView selectStm8300NonAssStrgListAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			paramMap.put("type", "non");
			
			
			List<Map> stm8300NonAssList = null;

			String paramStrgRepId = paramMap.get("strgRepId");
			
			if(paramStrgRepId != null && !paramStrgRepId.isEmpty()) {
							
				
				stm8300NonAssList = stm8300Service.selectStm8300FileCodeAuthList(paramMap);
			}
			
			
			model.addAttribute("stm8300NonAssList", stm8300NonAssList);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8300NonAssStrgListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value = "/stm/stm8000/stm8300/insertStm8300FileCodeAuthListAjax.do")
	public ModelAndView insertStm8300FileCodeAuthListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			stm8300Service.insertStm8300FileCodeAuthList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("insertStm8300FileCodeAuthListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value = "/stm/stm8000/stm8300/deleteStm8300FileCodeAuthListAjax.do")
	public ModelAndView deleteStm8300FileCodeAuthListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			stm8300Service.deleteStm8300FileCodeAuthList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("deleteStm8300FileCodeAuthListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	
	
}
