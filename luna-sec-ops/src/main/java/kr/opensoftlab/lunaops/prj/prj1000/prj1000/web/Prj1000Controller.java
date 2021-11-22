package kr.opensoftlab.lunaops.prj.prj1000.prj1000.web;

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
public class Prj1000Controller {
	
	private static final Logger Log = Logger.getLogger(Prj1000Controller.class);
	
	
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
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/prj/prj1000/prj1000/selectPrj1000View.do")
	public String selectPrj1000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			String paramPrjGrpId = (String) paramMap.get("paramPrjGrpId");
			HttpSession ss = request.getSession();
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			LoginVO loginVo = (LoginVO) ss.getAttribute("loginVO");
			String usrId = loginVo.getUsrId();
			paramMap.put("usrId", usrId);
			paramMap.put("prjGrpCd", "01");
			paramMap.put("prjAuthTypeCd", "01");
			paramMap.put("prjId", paramPrjGrpId);
			
			
			Map prjInfo = prj1000Service.selectPrj1000GrpInfo(paramMap);
			model.addAttribute("prjInfo", prjInfo);
		}catch(Exception e) {
			model.addAttribute("prjInfo", null);
		}
		
		return "/prj/prj1000/prj1000/prj1000";
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1000/selectPrj1000PrjListView.do")
	public String selectPrj1000PrjListView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		String paramPrjGrpId = "";
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			paramPrjGrpId = (String) paramMap.get("paramPrjGrpId");
		}catch(Exception e) {
			
		}
		return "redirect:/prj/prj1000/prj1000/selectPrj1000View.do?paramPrjGrpId="+paramPrjGrpId;
	}
	
	
	
	@RequestMapping(value="/prj/prj1000/prj1000/selectPrj1001View.do")
	public String selectPrj1004View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1000/prj1001";
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1000/selectPrj1002View.do")
	public String selectPrj1005View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1000/prj1002";
	}
	
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/prj/prj1000/prj1000/selectPrj1000ListAjaxView.do")
	public ModelAndView selectPrj1000ListAjaxView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			String paramPrjGrpId = (String) paramMap.get("paramPrjGrpId");
			HttpSession ss = request.getSession();
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			
			
			LoginVO loginVo = (LoginVO) ss.getAttribute("loginVO");
			String usrId = loginVo.getUsrId();
			paramMap.put("usrId", usrId);
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			paramMap.put("prjGrpCd", "01");
			
			
			
			int totCnt = 0;
			List<Map> dataList = null;
			Map<String, Object> metaMap = null;
			
			
			totCnt = prj1000Service.selectPrj1000PrjListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);
			
			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			
			dataList = (List) prj1000Service.selectPrj1000PrjList(paramMap);
			
			List<Map> reqChartDataList = (List) req4100Service.selectReq4100ReqProTypeOrdList(paramMap);
			
			
			metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", dataList);
			model.addAttribute("meta", metaMap);
			model.addAttribute("reqChartDataList", reqChartDataList);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectPrj1000ListAjaxView()", ex);
			
			model.addAttribute("errorYn", "Y");
			throw new Exception(ex.getMessage());
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1000/savePrj1001PrjGrpInfo.do")
	public ModelAndView savePrj1001PrjGrpInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();
			String type = (String) paramMap.get("type");

			String paramLicGrpId = (String) paramMap.get("paramLicGrpId");
			
			
			LoginVO loginVo = (LoginVO) ss.getAttribute("loginVO");
			String usrId = loginVo.getUsrId();
			
    		
    		if(paramLicGrpId == null || "".equals(paramLicGrpId)){
    			paramLicGrpId = (String)loginVo.getLicGrpId();
    		}
    		
    		paramMap.put("licGrpId", paramLicGrpId);
			
			
			if("insert".equals(type)) {
				String prjGrpId = (String) paramMap.get("paramPrjGrpId");
				
				paramMap.put("prjGrpCd", "02");
				paramMap.put("prjGrpId", prjGrpId);
				
				
				paramMap.put("prjAuthTypeCd", "01");
				paramMap.put("prjAuthTargetId", usrId);
				
				
				prj1000Service.insertPrj1001Ajax(paramMap);
			}
			
			else if("update".equals(type)) {
				paramMap.put("prjGrpCd", "02");
				
				
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
			Log.error("savePrj1001PrjGrpInfo()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			throw new Exception(ex.getMessage());
		}
	}
	
	
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1000/selectPrj1000PrjAuthUsrListAjax.do")
    public ModelAndView selectPrj1000PrjAuthUsrListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
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
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			
			
			int totCnt = 0;
			List<Map> dataList = null;
			Map<String, Object> metaMap = null;
			
			
			totCnt = prj1000Service.selectPrj1000PrjAuthUsrListCnt(paramMap);

			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);

			
			
			dataList = (List) prj1000Service.selectPrj1000PrjAuthUsrList(paramMap);
			
        	
			
			metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			model.addAttribute("data", dataList);
			model.addAttribute("meta", metaMap);
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectPrj1000PrjAuthUsrListAjax()", ex);
    		
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value="/prj/prj1000/prj1000/selectPrj1000PrjAuthNoneUsrListAjax.do")
    public ModelAndView selectPrj1000PrjAuthNoneUsrListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
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
    		
    		
    		String sortFieldId = (String) paramMap.get("sortFieldId");
    		sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
    		String sortDirection = (String) paramMap.get("sortDirection");
    		String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
    		paramMap.put("paramSortFieldId", paramSortFieldId);
    		
    		
    		
    		
    		
    		int totCnt = 0;
    		List<Map> dataList = null;
    		Map<String, Object> metaMap = null;
    		
			
			totCnt = prj1000Service.selectPrj1000PrjAuthNoneUsrListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);
			
			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			
			dataList = (List) prj1000Service.selectPrj1000PrjAuthNoneUsrList(paramMap);
			
			
			
			metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
    		model.addAttribute("data", dataList);
    		model.addAttribute("meta", metaMap);
    		
    		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    		
    		return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectPrj1000PrjAuthNoneUsrListAjax()", ex);
    		
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    
	@RequestMapping(value="/prj/prj1000/prj1000/updatePrj1000PrjGrpTrashListAjax.do")
	public ModelAndView updatePrj1000PrjGrpTrashListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

        	
        	paramMap.put("delCd", "01");
        	
			
        	prj1000Service.updatePrj1000PrjGrpTrashListAjax(paramMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));

			return new ModelAndView("jsonView");
		}
		catch(Exception e){
			Log.error("updatePrj1000PrjGrpTrashListAjax()", e);

			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));

			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1000/updatePrj1000PrjGrpTrashRedoListAjax.do")
	public ModelAndView updatePrj1000PrjGrpTrashRedoListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
        	paramMap.put("delCd", "02");
        	
			
			prj1000Service.updatePrj1000PrjGrpTrashListAjax(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception e){
			Log.error("updatePrj1000PrjGrpTrashRedoListAjax()", e);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value="/prj/prj1000/prj1000/deletePrj1000PrjDeleteListAjax.do")
	public ModelAndView deletePrj1000PrjDeleteListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			prj1000Service.deletePrj1001Ajax(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception e){
			Log.error("deletePrj1000PrjDeleteListAjax()", e);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			
			return new ModelAndView("jsonView");
		}
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1000/selectPrj1000PrjInfoAjax.do")
	public ModelAndView selectPrj1000PrjInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();
			
			
			LoginVO loginVo = (LoginVO) ss.getAttribute("loginVO");
			String usrId = loginVo.getUsrId();
			paramMap.put("usrId", usrId);
			paramMap.put("prjGrpCd", "02");
			
			
			Map prjInfo = prj1000Service.selectPrj1000Info(paramMap);
			model.addAttribute("prjInfo", prjInfo);
			
			
			
			int totCnt = prj1000Service.selectPrj1000PrjAuthUsrListCnt(paramMap);
			
			paramMap.put("firstIndex", "0");
			paramMap.put("lastIndex", String.valueOf(totCnt));
			
			
			List<Map> prjAuthList = prj1000Service.selectPrj1000PrjAuthUsrList(paramMap);
			model.addAttribute("prjAuthList", prjAuthList);
			
			
			paramMap.put("itemDivision", "04");
			List<Map> basicItemList = prj1000Service.selectPrj1002AllItemList(paramMap);
			model.addAttribute("basicItemList", basicItemList);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception e){
			Log.error("selectPrj1000PrjInfoAjax()", e);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			
			return new ModelAndView("jsonView");
		}
	}
    
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1000/selectPrj1002AllItemListAjax.do")
    public ModelAndView selectPrj1002AllItemListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
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
    		
        	
    		List<Map> itemList = prj1000Service.selectPrj1002AllItemList(paramMap);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	
        	model.addAttribute("itemList",itemList);
        	
        	return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectPrj1002AllItemListAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
    	
    	
    }
}
