package kr.opensoftlab.lunaops.cmm.cmm6000.cmm6600.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;
import kr.opensoftlab.lunaops.cmm.cmm6000.cmm6600.service.Cmm6600Service;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Cmm6600Controller {

	
	private static final Logger Log = Logger.getLogger(Cmm6600Controller.class);
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
	@Resource(name = "cmm6600Service")
	Cmm6600Service cmm6600Service;
	
    
    @RequestMapping(value="/cmm/cmm6000/cmm6600/selectCmm6600View.do")
    public String selectCmm6600View(Model model) throws Exception {
    	return "/cmm/cmm6000/cmm6600/cmm6600";
    }
    
    
    @RequestMapping(value="/cmm/cmm6000/cmm6600/selectCmm6601View.do")
    public String selectCmm6601View(Model model) throws Exception {
       	return "/cmm/cmm6000/cmm6600/cmm6601";
    }
    
    
    @RequestMapping(value="/cmm/cmm6000/cmm6600/selectCmm6602View.do")
    public String selectCmm6602View(Model model) throws Exception {
       	return "/cmm/cmm6000/cmm6600/cmm6602";
    }
    
    
    @SuppressWarnings("rawtypes")
	@RequestMapping(value="/cmm/cmm6000/cmm6600/selectCmm6600SignLineUsrTree.do")
    public ModelAndView selectCmm6600SignLineUsrTree(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			HttpSession ss = request.getSession();
			
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			
			/
    @SuppressWarnings("rawtypes")
	@RequestMapping(value="/cmm/cmm6000/cmm6600/selectCmm6600SignUsrListAjax.do")
    public ModelAndView selectCmm6600SignUsrListAjax(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			/
	@RequestMapping(value="/cmm/cmm6000/cmm6600/saveCmm6600SignLineAjax.do")
    public ModelAndView savecmm6600SignLineAjax(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			/
	@RequestMapping(value = "/cmm/cmm6000/cmm6600/insertCmm6601SignInfoAjax.do")
	public ModelAndView insertCmm6601SignInfoAjax(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
			
			paramMap.put("signUsrId", loginVO.getUsrId());
			paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
			paramMap.put("targetCd", "02");
			
			/
    @SuppressWarnings("rawtypes")
	@RequestMapping(value="/cmm/cmm6000/cmm6600/selectCmm6601SignInfoAjax.do")
    public ModelAndView selectCmm6600SignInfoAjax(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			Map signUsrInf = cmm6600Service.selectCmm6601SignInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("signUsrInf", signUsrInf);
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectCmm6600SignInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			throw new Exception(ex.getMessage());
		}
    }
}
