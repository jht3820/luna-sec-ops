
package kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.cmm.cmm4000.cmm4000.service.Cmm4000Service;
import kr.opensoftlab.lunaops.cmm.cmm6000.cmm6600.service.Cmm6600Service;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.service.Dpl1000Service;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.vo.Dpl1000VO;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.vo.Dpl1300VO;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.service.Dpl1100Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.service.Stm9000Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9100.service.Stm9100Service;
import kr.opensoftlab.sdf.jenkins.AutoBuildInit;
import kr.opensoftlab.sdf.jenkins.JenkinsClient;
import kr.opensoftlab.sdf.util.OslAgileConstant;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Dpl1000Controller {

	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
    
    
    @Resource(name = "dpl1000Service")
    private Dpl1000Service dpl1000Service;
    
	
    @Resource(name = "dpl1100Service")
    private Dpl1100Service dpl1100Service;
    
    
	@Resource(name = "stm9000Service")
	private Stm9000Service stm9000Service;
	
	
	@Resource(name = "stm9100Service")
	private Stm9100Service stm9100Service;
	
	 
    @Resource(name = "cmm4000Service")
    private Cmm4000Service cmm4000Service;
	
    
    @Resource(name = "cmm6600Service")
    private Cmm6600Service cmm6600Service;
    
	
	@Resource(name = "jenkinsClient")
	private JenkinsClient jenkinsClient;
	
	
	@Resource(name = "autoBuildInit")
	private AutoBuildInit autoBuildInit;
	
	@Value("${Globals.fileStorePath}")
	private String tempPath;

	
	@RequestMapping(value="/dpl/dpl1000/dpl1000/selectDpl1000View.do")
    public String selectDpl1000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/dpl/dpl1000/dpl1000/dpl1000";
    }
	
	
    @RequestMapping(value="/dpl/dpl1000/dpl1000/selectDpl1001View.do")
    public String selectDpl1001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		 return "/dpl/dpl1000/dpl1000/dpl1001";
    }
    
    
    @SuppressWarnings("rawtypes")
    @RequestMapping(value="/dpl/dpl1000/dpl1000/selectDpl1002View.do")
    public String selectDpl1002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try {
    		
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		
			
			String paramPrjId = (String) paramMap.get("prjId");
			HttpSession ss = request.getSession();
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjId", paramPrjId);
			paramMap.put("dplId", paramMap.get("paramDplId"));
			
			
			Map dplInfo = dpl1000Service.selectDpl1000DplInfo(paramMap);
			model.addAttribute("dplInfo", dplInfo);
			
    	}catch(Exception e) {
			model.addAttribute("dplInfo", null);
		}
    	
    	return "/dpl/dpl1000/dpl1000/dpl1002";
    }
    
    
    @RequestMapping(value="/dpl/dpl1000/dpl1000/selectDpl1003View.do")
    public String selectDpl1003View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			HttpSession ss = request.getSession();
			String prjId = (String)ss.getAttribute("selPrjId");
			String prjGrpId = (String) ss.getAttribute("selPrjGrpId");
			
			String paramPrjGrpId = paramMap.get("prjGrpId");
			String paramPrjId = paramMap.get("prjId");

			
			if(paramPrjGrpId != null && !"".equals(paramPrjGrpId)){
				prjGrpId = paramPrjGrpId;
			}
			
			
			if(paramPrjId != null && !"".equals(paramPrjId)){
				prjId = paramPrjId;
			}
			
			model.addAttribute("prjGrpId",prjGrpId);
        	model.addAttribute("prjId",prjId);
			
			 return "/dpl/dpl1000/dpl1000/dpl1003";
		}
		catch(Exception ex){
			Log.error("selectDpl1003View()", ex);
			throw new Exception(ex.getMessage());
		}
    }
    
    
    @SuppressWarnings("rawtypes")
    @RequestMapping(value="/dpl/dpl1000/dpl1000/selectDpl1004View.do")
    public String selectDpl1004View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try {
    		
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		
			
			String paramPrjId = (String) paramMap.get("prjId");
			HttpSession ss = request.getSession();
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjId", paramPrjId);
			paramMap.put("dplId", paramMap.get("paramDplId"));
			
			
			Map dplInfo = dpl1000Service.selectDpl1000DplInfo(paramMap);
			model.addAttribute("dplInfo", dplInfo);
			
    	}catch(Exception e) {
			model.addAttribute("dplInfo", null);
			model.addAttribute("signLineList", null);
		}
    	
    	return "/dpl/dpl1000/dpl1000/dpl1004";
    }
    
    
    @RequestMapping(value="/dpl/dpl1000/dpl1000/selectDpl1005View.do")
    public String selectDpl1005View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		 return "/dpl/dpl1000/dpl1000/dpl1005";
    }
    
    
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/dpl/dpl1000/dpl1000/selectDpl1000DplListAjax.do")
	public ModelAndView selectDpl1000DplListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
			
			String paramPrjId = paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjId", paramPrjId);
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			int totCnt = 0;
			List<Map> dataList = null;
			Map<String, Object> metaMap = null;
			
			
			totCnt = dpl1000Service.selectDpl1000DplListCnt(paramMap);

			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);

			
			
			dataList = dpl1000Service.selectDpl1000DplList(paramMap);
			
        	
			
			metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", dataList);
			model.addAttribute("meta", metaMap);
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectDpl1000DplListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/dpl/dpl1000/dpl1000/selectDpl1000DplInfoAjax.do")
	public ModelAndView selectDpl1000DplInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			
			
			String paramPrjId = paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjId", paramPrjId);
			
			
			Map dplInfo = dpl1000Service.selectDpl1000DplInfo(paramMap);
			
			
			List dplJobList = dpl1000Service.selectDpl1300DplJobList(paramMap);
			
			model.addAttribute("dplInfo", dplInfo);
			model.addAttribute("dplJobList", dplJobList);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectDpl1000DplInfoAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(method=RequestMethod.POST, value="/dpl/dpl1000/dpl1000/saveDpl1000DplInfoAjax.do")
    public ModelAndView saveDpl1000DplInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		HttpSession ss = request.getSession();
    		
    		
			String prjId = paramMap.get("prjId");
			if(prjId == null || "".equals(prjId)) {
				prjId = (String) ss.getAttribute("selPrjId"); 
			}
			paramMap.put("prjId", prjId);
			
			String type = paramMap.get("type");
			
			if("insert".equals(type)){
				
	        	dpl1000Service.insertDpl1000DplInfo(paramMap);
			}else if("update".equals(type)){
				
				dpl1000Service.updateDpl1000DplInfo(paramMap);
			}
			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("insertDpl1000DplInfoAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
    		return new ModelAndView("jsonView");
    	}
	}
	
	
	@RequestMapping(method=RequestMethod.POST, value="/dpl/dpl1000/dpl1000/deleteDpl1000DplListAjax.do")
    public ModelAndView deleteDpl1000DplListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
    		dpl1000Service.deleteDpl1000DplList(paramMap);
    		
    		
    		model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("deleteDpl1000DplListAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value="/dpl/dpl1000/dpl1000/selectDpl1000DplHistoryListAjax.do")
    public ModelAndView selectDpl1000DplHistoryListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		HttpSession ss = request.getSession();

        	
			String prjId = paramMap.get("prjId");
			if(prjId == null || "".equals(prjId)) {
				prjId = (String) ss.getAttribute("selPrjId"); 
			}
			paramMap.put("prjId", prjId);
        	
        	
        	List<Map> dplAllBldHistoryList = dpl1000Service.selectDpl1000DplAllBldHistoryList(paramMap);
        	
        	
        	
        	
        	
        	List<Map> jobList = dpl1000Service.selectDpl1300DplJobList(paramMap);
        	
        	
			paramMap.put("targetId", paramMap.get("dplId"));
        	paramMap.put("targetCd", "02");
        	
			
			List<Map> dplSignHistoryList = dpl1000Service.selectCmm6601SignHistoryList(paramMap);
			
        	model.addAttribute("dplAllBldHistoryList", dplAllBldHistoryList);
        	
        	model.addAttribute("dplSignHistoryList",dplSignHistoryList);
        	model.addAttribute("jobList", jobList);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("selectDpl1000DplHistoryListAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView", model);
    	}
    }
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value="/dpl/dpl1000/dpl1000/selectDpl1400DplSelBuildConsoleLogAjax.do")
	public ModelAndView selectDpl1400DplSelBuildConsoleLogAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		
    		
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO)ss.getAttribute("loginVO");
			paramMap.put("licGrpId",loginVO.getLicGrpId());
			
			
    		String prjId = (String) paramMap.get("prjId");
	
    		
    		List<Map> prjUsrAuthList = new ArrayList<Map>();

    		
			String usrId = (String)loginVO.getUsrId();
    		
    		if(prjId == null || "".equals(prjId)) {
    			paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
    			
        		String selAuthGrpId = (String) ss.getAttribute("selAuthGrpId");
    			Map<String,String> authMap = new HashMap<String,String>();
				authMap.put("authGrpId", selAuthGrpId);
				prjUsrAuthList.add(authMap);
    		}else {
    			
        		Map<String,String> authParamMap = new HashMap<String,String>();
    			authParamMap.put("prjId", prjId);
				authParamMap.put("usrId", usrId);
				List<Map> prjAuthList = cmm4000Service.selectCmm4000UsrPrjAuthList(authParamMap);
				prjUsrAuthList.addAll(prjAuthList);
    		}
    		
    		
    		
 			
    		List<Map> dplRunAuthGrp = null;
 			
 			












































 			
    		
    		Map dpl1400InfoMap = dpl1000Service.selectDpl1400DplSelBuildInfo(paramMap);
 			
    		model.addAttribute("dpl1400InfoMap", dpl1400InfoMap);
			
    		
    		model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectDpl1400DplSelBuildConsoleLogAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	

     
     
    

     
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value="/dpl/dpl1000/dpl1000/selectDpl1000DeployNmListAjax.do")
    public ModelAndView selectDpl1000DeployNmListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{

    		
        	Map paramMap = RequestConvertor.requestParamToMap(request, true);
        	paramMap.put("prjId", request.getSession().getAttribute("selPrjId"));

        	
        	List<Map> dplDeployNmList = (List) dpl1000Service.selectDpl1000DeployNmList(paramMap);
        	
        	model.addAttribute("dplDeployNmList", dplDeployNmList);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("selectDpl1000DeployNmListAjax()", ex);
    		
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView", model);
    	}
    }
    
	
	@RequestMapping(method=RequestMethod.POST, value="/dpl/dpl1000/dpl1000/selectDpl1000DeployVerInfoListAjax.do")
    public ModelAndView selectDpl1000DeployVerInfoListAjax(@ModelAttribute("dpl1000VO") Dpl1000VO dpl1000VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{

    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			String _pageNo_str = paramMap.get("pageNo");
			String _pageSize_str = paramMap.get("pageSize");
			
			int _pageNo = 1;
			int _pageSize = OslAgileConstant.pageSize;
			
			if(_pageNo_str != null && !"".equals(_pageNo_str)){
				_pageNo = Integer.parseInt(_pageNo_str)+1;  
			}
			if(_pageSize_str != null && !"".equals(_pageSize_str)){
				_pageSize = Integer.parseInt(_pageSize_str);  
			}
			
			
			dpl1000VO.setPageIndex(_pageNo);
			dpl1000VO.setPageSize(_pageSize);
			dpl1000VO.setPageUnit(_pageSize);
        	
        	
        	PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(dpl1000VO); 
			List<Dpl1000VO> dpl1000List = null;
			
			HttpSession ss = request.getSession();
			String prjId	= (String) ss.getAttribute("selPrjId");
			String licGrpId	= (String) paramMap.get("licGrpId");
			
			dpl1000VO.setPrjId(prjId);
			dpl1000VO.setLicGrpId(licGrpId);
        	
        	dpl1000List = (List<Dpl1000VO>) dpl1000Service.selectDpl1000DeployVerInfoList(dpl1000VO);
        	
			int totCnt = dpl1000Service.selectDpl1000ListCnt(dpl1000VO);
					
        	paginationInfo.setTotalRecordCount(totCnt);
        	
        	model.addAttribute("list", dpl1000List);
        	
			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",dpl1000VO.getPageIndex());
			pageMap.put("listCount", dpl1000List.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);
			
			model.addAttribute("page", pageMap);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("selectDpl1000DeployInfoListAjax()", ex);
    		
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView", model);
    	}
    }
	
	
	@RequestMapping(method=RequestMethod.POST, value="/dpl/dpl1000/dpl1000/selectDpl1300DplJobListAjax.do")
    public ModelAndView selectDpl1300DplJobListAjax(@ModelAttribute("dpl1300VO") Dpl1300VO dpl1300VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{

    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			String _pageNo_str = paramMap.get("pageNo");
			String _pageSize_str = paramMap.get("pageSize");
			
			int _pageNo = 1;
			int _pageSize = OslAgileConstant.pageSize;
			
			if(_pageNo_str != null && !"".equals(_pageNo_str)){
				_pageNo = Integer.parseInt(_pageNo_str)+1;  
			}
			if(_pageSize_str != null && !"".equals(_pageSize_str)){
				_pageSize = Integer.parseInt(_pageSize_str);  
			}
			
			
			dpl1300VO.setPageIndex(_pageNo);
			dpl1300VO.setPageSize(_pageSize);
			dpl1300VO.setPageUnit(_pageSize);
        	
        	
        	PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(dpl1300VO); 
			List<Dpl1300VO> dpl1300List = null;
			
			HttpSession ss = request.getSession();
			String licGrpId	= (String) paramMap.get("licGrpId");

			String  prjId = "";
			
			if(paramMap.get("popupPrjId") != null){
				prjId = paramMap.get("popupPrjId");
			}
			else if(paramMap.get("prjId") != null){
				prjId = paramMap.get("prjId");
			}
			
			else{
				
				prjId = (String) ss.getAttribute("selPrjId");
			}
			
			dpl1300VO.setPrjId(prjId);
			dpl1300VO.setLicGrpId(licGrpId);
        	
        	dpl1300List = (List<Dpl1300VO>) dpl1000Service.selectDpl1300dplJobGridList(dpl1300VO);
        	
			int totCnt = dpl1000Service.selectDpl1300dplJobGridListCnt(dpl1300VO);
					
        	paginationInfo.setTotalRecordCount(totCnt);
        	
        	model.addAttribute("list", dpl1300List);
        	
			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",dpl1300VO.getPageIndex());
			pageMap.put("listCount", dpl1300List.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);
			
			model.addAttribute("page", pageMap);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("selectDpl1300DplJobListAjax()", ex);
    		
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView", model);
    	}
    }
		

	
	@RequestMapping(method=RequestMethod.POST, value="/dpl/dpl1000/dpl1000/insertDpl1000DplsignRequestAjax.do")
    public ModelAndView insertDpl1000DplsignRequestAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{

    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		HttpSession ss = request.getSession();
    		String prjId = (String) ss.getAttribute("selPrjId");
			paramMap.put("prjId", prjId);
			
			
			dpl1000Service.insertDpl1000DplSignRequestList(paramMap);
			
        	
			model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
        	
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("insertDpl1000DplsignRequestAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
    		return new ModelAndView("jsonView", model);
    	}
	}
	
	
	@RequestMapping(value="/dpl/dpl1000/dpl1000/selectDpl1000BuildInfoListAjax.do")
    public ModelAndView selectDpl1000BuildInfoListAjax(@ModelAttribute("dpl1000VO") Dpl1000VO dpl1000VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{

    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			String _pageNo_str = paramMap.get("pageNo");
			String _pageSize_str = paramMap.get("pageSize");
			
			int _pageNo = 1;
			int _pageSize = OslAgileConstant.pageSize;
			
			if(_pageNo_str != null && !"".equals(_pageNo_str)){
				_pageNo = Integer.parseInt(_pageNo_str)+1;  
			}
			if(_pageSize_str != null && !"".equals(_pageSize_str)){
				_pageSize = Integer.parseInt(_pageSize_str);  
			}
			
			
			dpl1000VO.setPageIndex(_pageNo);
			dpl1000VO.setPageSize(_pageSize);
			dpl1000VO.setPageUnit(_pageSize);
        	
        	
        	PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(dpl1000VO); 
			List<Dpl1000VO> dpl1000List = null;
			
			HttpSession ss = request.getSession();
			String prjId	= (String) ss.getAttribute("selPrjId");
			String licGrpId	= (String) paramMap.get("licGrpId");
			
			dpl1000VO.setPrjId(prjId);
			dpl1000VO.setLicGrpId(licGrpId);
			
			paramMap.put("prjId", prjId);
			
		
						
        	
        	dpl1000List = (List<Dpl1000VO>) dpl1000Service.selectDpl1000BuildInfoList(dpl1000VO);
        	
			int totCnt = dpl1000Service.selectDpl1000BuildInfoListCnt(dpl1000VO);
					
        	paginationInfo.setTotalRecordCount(totCnt);
        	
        	model.addAttribute("list", dpl1000List);
        	
			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",dpl1000VO.getPageIndex());
			pageMap.put("listCount", dpl1000List.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);
			
			model.addAttribute("page", pageMap);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("selectDpl1000BuildInfoListAjax()", ex);
    		
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView", model);
    	}
    }
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value="/dpl/dpl1000/dpl1000/selectDpl1600DplSvnChangeLogListAjax.do")
	public ModelAndView selectDpl1600DplSvnChangeLogListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
			
			
    		String prjId = (String) paramMap.get("prjId");
    		
    		if(prjId == null || "".equals(prjId)) {
    			paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
    		}
    		
			
			List<Map> svnChangeLogList = dpl1000Service.selectDpl1600SvnChangeLogsList(paramMap);
			
			
			List<Map> svnChangePathsList = dpl1000Service.selectDpl1700SvnChangePathList(paramMap);
			
			model.addAttribute("svnChangeLogList", svnChangeLogList);
			model.addAttribute("svnChangePathsList", svnChangePathsList);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			return new ModelAndView("jsonView", model);
		}
		catch(Exception ex){
			Log.error("selectDpl1600DplSvnChangeLogListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", "콘솔 내용 조회 오류");
			return new ModelAndView("jsonView", model);
		}
	}
	
	
	@RequestMapping(value="/dpl/dpl1000/dpl1000/insertDpl1000SignLineAjax.do")
    public ModelAndView insertDpl1000signLineAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{

    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		HttpSession ss = request.getSession();
    		
    		
    		String prjId = (String) ss.getAttribute("selPrjId");
			paramMap.put("prjId", prjId);
			
			
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("usrId", loginVO.getUsrId());
			
			
			dpl1000Service.saveDpl1000SignLine(paramMap);
			
        	
			model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
        	
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("insertDpl1000signLineAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
    		return new ModelAndView("jsonView", model);
    	}
	}
}
