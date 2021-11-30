package kr.opensoftlab.lunaops.prj.prj1000.prj1300.web;

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
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.cmm.cmm4000.cmm4000.service.Cmm4000Service;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.prj.prj1000.prj1000.service.Prj1000Service;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.Prj1100Service;
import kr.opensoftlab.lunaops.prj.prj1000.prj1300.service.Prj1300Service;
import kr.opensoftlab.lunaops.stm.stm4000.stm4000.service.Stm4000Service;
import kr.opensoftlab.sdf.util.ModuleUseCheck;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;


@Controller
public class Prj1300Controller {
	
	private static final Logger Log = Logger.getLogger(Prj1300Controller.class);
	
	
    @Resource(name = "cmm4000Service")
    private Cmm4000Service cmm4000Service;
    
    
    @Resource(name = "stm4000Service")
    private Stm4000Service stm4000Service;

	
    @Resource(name = "prj1000Service")
    private Prj1000Service prj1000Service;
    
	
    @Resource(name = "prj1100Service")
    private Prj1100Service prj1100Service;
    
	
    @Resource(name = "prj1300Service")
    private Prj1300Service prj1300Service;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "moduleUseCheck")
	private ModuleUseCheck moduleUseCheck;
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1300View.do")
    public String selectPrj1300View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1300/prj1300";
    }
	
	
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1301View.do")
    public String selectPrj1301View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1300/prj1301";
    }
	
	
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1302View.do")
    public String selectPrj1302View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1300/prj1302";
    }
	
	
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1303View.do")
    public String selectPrj1303View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1300/prj1303";
    }
	
	
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1304View.do")
    public String selectPrj1304View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1300/prj1304";
    }
	
	
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1305View.do")
    public String selectPrj1305View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1300/prj1305";
    }

    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1300TemplateListAjax.do")
    public ModelAndView selectPrj1300TemplateListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
    		
			String paramPrjId = (String) paramMap.get("paramPrjId");
        	
        	
    		HttpSession ss = request.getSession();
    		
    		
    		if(paramPrjId == null || "".equals(paramPrjId)){
    			paramPrjId = (String)ss.getAttribute("selPrjId");
    		}
    		
    		paramMap.put("prjId", paramPrjId);
        	
    		List<Map> templateList = null;
    		
			
			templateList = (List) prj1300Service.selectPrj1300TemplateList(paramMap);
			
        	model.addAttribute("templateList", templateList);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView", paramMap);
    	}
    	catch(Exception ex){
    		Log.error("selectPrj1300DocListAjax()", ex);
    		
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    

    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1300TemplateInfoAjax.do")
    public ModelAndView selectPrj1300TemplateInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
        	
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	
			String paramPrjId = (String) paramMap.get("paramPrjId");
        	
        	
    		HttpSession ss = request.getSession();
    		
    		
    		if(paramPrjId == null || "".equals(paramPrjId)){
    			paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
    		}else{
    			paramMap.put("prjId", paramPrjId);
    		}
        	
        	Map<String, String> templateInfoMap = (Map) prj1300Service.selectPrj1300TemplateInfo(paramMap);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	
        	model.addAttribute("templateInfoMap",templateInfoMap);
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectPrj1300TemplateInfoAjax()", ex);

    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
	
	@RequestMapping(value="/prj/prj1000/prj1300/savePrj1301TemplateInfo.do")
	public ModelAndView savePrj1301TemplateInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();
			String type = (String) paramMap.get("type");
			
			
			String paramPrjId = (String) paramMap.get("paramPrjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
        	
			paramMap.put("prjId", paramPrjId);
			
			
			if("insert".equals(type)) {
				
				prj1300Service.insertPrj1300PrjTemplateAjax(paramMap);
			}
			
			else if("update".equals(type)) {
				
				prj1300Service.updatePrj1300PrjTemplateAjax(paramMap);
			}else {
				
				model.addAttribute("errorYn", "Y");
	        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
	        	return new ModelAndView("jsonView");
			}
			
			
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.save"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("savePrj1002PrjGrpInfo()", ex);
			
			
			model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			throw new Exception(ex.getMessage());
		}
	}
	
   	
   	@RequestMapping(value = "/prj/prj1000/prj1300/deletePrj1300PrjTemplateAjax.do")
   	public ModelAndView deletePrj1300DocInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
   		
   		try {
			
   			
           	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
   			
           	
        	prj1300Service.deletePrj1300PrjTemplateAjax(paramMap);
        	
        	
           	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
           	
   	   		return new ModelAndView("jsonView");
   	   		
		} catch (Exception ex) {
			Log.error("deletePrj1300DocInfoAjax()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
       		return new ModelAndView("jsonView");
			
		}
   	}
   	
   	

   	
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1302AllItemListAjax.do")
    public ModelAndView selectPrj1302AllItemListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try {

    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	
			String paramPrjId = (String) paramMap.get("paramPrjId");
			String paramLicGrpId = (String) paramMap.get("paramLicGrpId");
        	
        	
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		
    		
    		if(paramPrjId == null || "".equals(paramPrjId)){
    			paramPrjId = (String)ss.getAttribute("selPrjId");
    		}
    		
    		
    		if(paramLicGrpId == null || "".equals(paramLicGrpId)){
    			paramLicGrpId = (String)loginVO.getLicGrpId();
    		}
    		
    		paramMap.put("prjId", paramPrjId);
    		paramMap.put("licGrpId", paramLicGrpId);
    		
        	
    		List<Map> itemList = prj1300Service.selectPrj1302AllItemList(paramMap);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	
        	model.addAttribute("itemList",itemList);
        	
        	return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectBad1000ListAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
    	
    	
    }
    
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1302ItemListAjax.do")
    public ModelAndView selectPrj1302ItemListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			String paramPrjId = (String) paramMap.get("paramPrjId");
			String paramLicGrpId = (String) paramMap.get("paramLicGrpId");
        	
        	
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		
    		
    		if(paramPrjId == null || "".equals(paramPrjId)){
    			paramPrjId = (String)ss.getAttribute("selPrjId");
    		}
    		
    		
    		if(paramLicGrpId == null || "".equals(paramLicGrpId)){
    			paramLicGrpId = (String)loginVO.getLicGrpId();
    		}
    		
    		paramMap.put("prjId", paramPrjId);
    		paramMap.put("licGrpId", paramLicGrpId);
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = prj1300Service.selectPrj1302ItemListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Object> pageMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			pageMap.put("sort", sortDirection);
			pageMap.put("field", sortFieldId);
			
			List<Map> allItemList = prj1300Service.selectPrj1302AllItemList(paramMap);
			
			pageMap.put("allItemList", allItemList);
			
			
			List<Map> prj1200List = prj1300Service.selectPrj1302ItemList(paramMap);
			

			
			model.addAttribute("data", prj1200List);
			model.addAttribute("meta", pageMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectBad1000ListAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
    	
    	
    }
    

    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1302ItemInfoAjax.do")
    public ModelAndView selectPrj1302ItemInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
        	
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	
			String paramPrjId = (String) paramMap.get("paramPrjId");
			String paramLicGrpId = (String) paramMap.get("paramLicGrpId");
        	
        	
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		
    		
    		if(paramPrjId == null || "".equals(paramPrjId)){
    			paramPrjId = (String)ss.getAttribute("selPrjId");
    		}
    		
    		
    		if(paramLicGrpId == null || "".equals(paramLicGrpId)){
    			paramLicGrpId = (String)loginVO.getLicGrpId();
    		}
    		
    		paramMap.put("prjId", paramPrjId);
    		paramMap.put("licGrpId", paramLicGrpId);
    		
        	
        	Map<String, String> templateInfoMap = (Map) prj1300Service.selectPrj1302ItemInfo(paramMap);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	
        	model.addAttribute("templateInfoMap",templateInfoMap);
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectPrj1302ItemInfoAjax()", ex);

    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
	
	@RequestMapping(value="/prj/prj1000/prj1300/savePrj1302ItemInfo.do")
	public ModelAndView savePrj1302ItemInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();
			String type = (String) paramMap.get("type");
			
			
			String paramPrjId = (String) paramMap.get("paramPrjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
        	
			paramMap.put("prjId", paramPrjId);
			
			
			if("insert".equals(type)) {
				
				prj1300Service.insertPrj1302ItemAjax(paramMap);
			}
			
			else if("update".equals(type)) {
				
				prj1300Service.updatePrj1302ItemAjax(paramMap);
			}else {
				
				model.addAttribute("errorYn", "Y");
	        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
	        	return new ModelAndView("jsonView");
			}
			
			
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.save"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("savePrj1002PrjGrpInfo()", ex);
			
			
			model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			throw new Exception(ex.getMessage());
		}
	}
	
   	
   	@RequestMapping(value = "/prj/prj1000/prj1300/deletePrj1302ItemAjax.do")
   	public ModelAndView deletePrj1301PrjItemAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
   		
   		try {
			
   			
           	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
   			
           	
        	prj1300Service.deletePrj1302ItemAjax(paramMap);
        	
        	
           	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
           	
   	   		return new ModelAndView("jsonView");
   	   		
		} catch (Exception ex) {
			Log.error("deletePrj1300DocInfoAjax()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
       		return new ModelAndView("jsonView");
			
		}
   	}
   	
   	
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1302CommonCodeListAjax.do")
    public ModelAndView selectPrj1302CommonCodeListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
    		
			String paramLicGrpId = (String) paramMap.get("paramLicGrpId");
        	
        	
    		HttpSession ss = request.getSession();

    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		
    		
    		if(paramLicGrpId == null || "".equals(paramLicGrpId)){
    			paramLicGrpId = (String)loginVO.getLicGrpId();
    		}
    		
    		paramMap.put("licGrpId", paramLicGrpId);
        	
    		List<Map> commonCodeList = null;
    		
			
    		commonCodeList = (List) prj1300Service.selectPrj1302CommonCodeList(paramMap);
			
        	model.addAttribute("commonCodeList", commonCodeList);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView", paramMap);
    	}
    	catch(Exception ex){
    		Log.error("selectPrj1302CommonCodeListAjax()", ex);
    		
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
   	
    
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1102AllItemListAjax.do")
    public ModelAndView selectPrj1102AllItemListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try {

    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	
			String paramPrjId = (String) paramMap.get("paramPrjId");
			String paramLicGrpId = (String) paramMap.get("paramLicGrpId");
        	
        	
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		
    		
    		if(paramPrjId == null || "".equals(paramPrjId)){
    			paramPrjId = (String)ss.getAttribute("selPrjId");
    		}
    		
    		
    		if(paramLicGrpId == null || "".equals(paramLicGrpId)){
    			paramLicGrpId = (String)loginVO.getLicGrpId();
    		}
    		
    		paramMap.put("prjId", paramPrjId);
    		paramMap.put("licGrpId", paramLicGrpId);
    		
        	
    		List<Map> itemList = prj1300Service.selectPrj1102AllItemList(paramMap);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	
        	model.addAttribute("itemList",itemList);
        	
        	return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectPrj1102AllItemListAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
    	
    	
    }
}
