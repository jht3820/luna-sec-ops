package kr.opensoftlab.lunaops.stm.stm8000.stm8100.web;

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
import kr.opensoftlab.lunaops.stm.stm8000.stm8100.service.Stm8100Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Stm8100Controller {

	
	private static final Logger Log = Logger.getLogger(Stm8100Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "stm8100Service")
	private Stm8100Service stm8100Service;
	
	
	
	@RequestMapping(value="/stm/stm8000/stm8100/selectStm8100View.do")
	public String selectStm8100View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm8000/stm8100/stm8100";
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm8000/stm8100/selectStm8100AssStrgListAjax.do")
	public ModelAndView selectStm8000ListAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			paramMap.put("type", "ass");
			
			
			List<Map> stm8100AssList = null;
			
			Map<String, Object> metaMap = null; 
			
			
			int totCnt = 0;

			
			if(paramPrjId != null && !paramPrjId.isEmpty()) {
				
				PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

				
				totCnt = stm8100Service.selectStm8100ServerListCnt(paramMap);

				
				paginationInfo.setTotalRecordCount(totCnt);
				paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
				
				
				metaMap = PagingUtil.getPageReturnMap(paginationInfo);
							
				
				stm8100AssList = stm8100Service.selectStm8100ServerList(paramMap);
				
				
				metaMap.put("sort", sortDirection);
				metaMap.put("field", sortFieldId);
			}
			
			
			model.addAttribute("data", stm8100AssList);
			model.addAttribute("meta", metaMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8100AssStrgListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm8000/stm8100/selectStm8100NonAssStrgListAjax.do")
	public ModelAndView selectStm8100NonAssStrgListAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			paramMap.put("type", "non");
			
			
			List<Map> stm8100NonAssList = null;
			
			Map<String, Object> metaMap = null; 
			
			
			int totCnt = 0;

			
			if(paramPrjId != null && !paramPrjId.isEmpty()) {
				
				PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

				
				totCnt = stm8100Service.selectStm8100ServerListCnt(paramMap);

				
				paginationInfo.setTotalRecordCount(totCnt);
				paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
				
				
				metaMap = PagingUtil.getPageReturnMap(paginationInfo);
							
				
				stm8100NonAssList = stm8100Service.selectStm8100ServerList(paramMap);
				
				
				metaMap.put("sort", sortDirection);
				metaMap.put("field", sortFieldId);
			}
			
			model.addAttribute("data", stm8100NonAssList);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8100NonAssStrgListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value = "/stm/stm8000/stm8100/insertStm8100ServerListAjax.do")
	public ModelAndView insertStm8100ServerListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			stm8100Service.insertStm8100ServerList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("insertStm8100ServerListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value = "/stm/stm8000/stm8100/deleteStm8100ServerListAjax.do")
	public ModelAndView deleteStm8100ServerListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			stm8100Service.deleteStm8100ServerList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("deleteStm8100ServerListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm8000/stm8100/selectStm8101View.do")
	public String selectStm8101View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm8000/stm8100/stm8101";
	}
	
}
