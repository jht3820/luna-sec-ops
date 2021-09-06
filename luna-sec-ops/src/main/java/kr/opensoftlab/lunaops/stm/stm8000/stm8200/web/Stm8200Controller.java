package kr.opensoftlab.lunaops.stm.stm8000.stm8200.web;

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
import kr.opensoftlab.lunaops.stm.stm8000.stm8200.service.Stm8200Service;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Stm8200Controller {

	
	private static final Logger Log = Logger.getLogger(Stm8200Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "stm8200Service")
	private Stm8200Service stm8200Service;
	
	
	
	@RequestMapping(value="/stm/stm8000/stm8200/selectStm8200View.do")
	public String selectStm8200View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm8000/stm8200/stm8200";
	}
	
	
	@SuppressWarnings( "rawtypes" )
	@RequestMapping(value="/stm/stm8000/stm8200/selectStm8200AssStrgListAjax.do")
	public ModelAndView selectStm8200AssStrgListAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			paramMap.put("type", "ass");
			
			
			List<Map> stm8200AssList = null;

			String paramStrgRepId = paramMap.get("strgRepId");
			
			if(paramStrgRepId != null && !paramStrgRepId.isEmpty()) {
							
				
				stm8200AssList = stm8200Service.selectStm8200RevisionAuthList(paramMap);
			}
			
			
			model.addAttribute("stm8200AssList", stm8200AssList);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8200AssStrgListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings( "rawtypes" )
	@RequestMapping(value="/stm/stm8000/stm8200/selectStm8200NonAssStrgListAjax.do")
	public ModelAndView selectStm8200NonAssStrgListAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			paramMap.put("type", "non");
			
			
			List<Map> stm8200NonAssList = null;

			String paramStrgRepId = paramMap.get("strgRepId");
			
			if(paramStrgRepId != null && !paramStrgRepId.isEmpty()) {
							
				
				stm8200NonAssList = stm8200Service.selectStm8200RevisionAuthList(paramMap);
			}
			
			
			model.addAttribute("stm8200NonAssList", stm8200NonAssList);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8200NonAssStrgListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}


	
	@SuppressWarnings( "rawtypes" )
	@RequestMapping(value="/stm/stm8000/stm8200/selectStm8200PrjAllAuthAndUserList.do")
	public ModelAndView selectStm8200PrjAllAuthAndUserList( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			List<Map> stm8200AllList = stm8200Service.selectStm8200PrjAllAuthAndUserList(paramMap);
			
			
			model.addAttribute("stm8200AllList", stm8200AllList);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8200AssStrgListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value = "/stm/stm8000/stm8200/insertStm8200RevisionAuthListAjax.do")
	public ModelAndView insertStm8200RevisionAuthListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			stm8200Service.insertStm8200RevisionAuthList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("insertStm8200RevisionAuthListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value = "/stm/stm8000/stm8200/deleteStm8200RevisionAuthListAjax.do")
	public ModelAndView deleteStm8200RevisionAuthListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			stm8200Service.deleteStm8200RevisionAuthList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("deleteStm8200RevisionAuthListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	
	
}
