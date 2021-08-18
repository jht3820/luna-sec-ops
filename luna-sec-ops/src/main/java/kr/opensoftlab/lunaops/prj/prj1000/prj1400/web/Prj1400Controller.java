package kr.opensoftlab.lunaops.prj.prj1000.prj1400.web;

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
import kr.opensoftlab.lunaops.prj.prj2000.prj2000.service.Prj2000Service;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.Req4100Service;
import kr.opensoftlab.sdf.util.ModuleUseCheck;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Prj1400Controller {
	
	private static final Logger Log = Logger.getLogger(Prj1400Controller.class);
	
	
    @Resource(name = "prj1000Service")
    private Prj1000Service prj1000Service;
    
    
    @Resource(name = "cmm4000Service")
    private Cmm4000Service cmm4000Service;
    
    
    @Resource(name = "prj2000Service")
    private Prj2000Service prj2000Service;
    
    
    @Resource(name = "req4100Service")
    private Req4100Service req4100Service;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "moduleUseCheck")
	private ModuleUseCheck moduleUseCheck;
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
	@RequestMapping(value="/prj/prj1000/prj1400/selectPrj1400View.do")
    public String selectPrj1400View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
        	return "/prj/prj1000/prj1400/prj1400";
    }
	
	
	@RequestMapping(value="/prj/prj1000/prj1400/selectPrj1401View.do")
	public String selectPrj1401View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1400/prj1401";
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1400/selectPrj1402View.do")
	public String selectPrj1402View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1400/prj1402";
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/prj/prj1000/prj1400/selectPrj1400ListAjaxView.do")
	public ModelAndView selectPrj1400ListAjaxView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			String paramPrjId = (String) paramMap.get("paramPrjId");
			HttpSession ss = request.getSession();
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			paramMap.put("prjId", paramPrjId);
			
			
			LoginVO loginVo = (LoginVO) ss.getAttribute("loginVO");
			String usrId = loginVo.getUsrId();
			paramMap.put("usrId", usrId);

			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			paramMap.put("prjGrpCd", "01");
			
			metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", dataList);
			model.addAttribute("meta", metaMap);
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectPrj1400ListAjaxView()", ex);
			
			model.addAttribute("errorYn", "Y");
			throw new Exception(ex.getMessage());
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1400/savePrj1401PrjGrpInfo.do")
	public ModelAndView savePrj1401PrjGrpInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();
			String type = (String) paramMap.get("type");
			
			
			LoginVO loginVo = (LoginVO) ss.getAttribute("loginVO");
			String usrId = loginVo.getUsrId();
			
			
			if("insert".equals(type)) {
				paramMap.put("prjGrpCd", "01");
				
				
				paramMap.put("prjAuthTypeCd", "01");
				paramMap.put("prjAuthTargetId", usrId);
				
				
				prj1000Service.insertPrj1000PrjGrpAjax(paramMap);
			}
			
			else if("update".equals(type)) {
				paramMap.put("prjGrpCd", "01");
				
				
				paramMap.put("prjAuthTypeCd", "01");
				paramMap.put("prjAuthTargetId", usrId);
				
				
				prj1000Service.updatePrj1000PrjGrp(paramMap);
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
			Log.error("savePrj1401PrjGrpInfo()", ex);
			
			
			model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			throw new Exception(ex.getMessage());
		}
	}

	
	@RequestMapping(value="/prj/prj1000/prj1400/deletePrj1400PrjGrpDeleteListAjax.do")
	public ModelAndView deletePrj1400PrjGrpDeleteListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			prj1000Service.deletePrj1000PrjAjax(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception e){
			Log.error("deletePrj1400PrjGrpDeleteListAjax()", e);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			
			return new ModelAndView("jsonView");
		}
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1400/selectPrj1400PrjGrpInfoAjax.do")
	public ModelAndView selectPrj1400PrjGrpInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();
			
			
			LoginVO loginVo = (LoginVO) ss.getAttribute("loginVO");
			String usrId = loginVo.getUsrId();
			paramMap.put("usrId", usrId);
			paramMap.put("prjGrpCd", "01");
			paramMap.put("prjAuthTypeCd", "01");
			
			
			Map prjInfo = prj1000Service.selectPrj1000GrpInfo(paramMap);
			model.addAttribute("prjInfo", prjInfo);
			
			
			
			int totCnt = prj1000Service.selectPrj1000PrjAuthUsrListCnt(paramMap);
			
			paramMap.put("firstIndex", "0");
			paramMap.put("lastIndex", String.valueOf(totCnt));
			
			
			List<Map> prjAuthList = prj1000Service.selectPrj1000PrjAuthUsrList(paramMap);
			model.addAttribute("prjAuthList", prjAuthList);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception e){
			Log.error("selectPrj1400PrjGrpInfoAjax()", e);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			
			return new ModelAndView("jsonView");
		}
	}
}
