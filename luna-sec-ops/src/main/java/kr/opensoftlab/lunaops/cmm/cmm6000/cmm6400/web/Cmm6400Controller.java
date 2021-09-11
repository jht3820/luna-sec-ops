package kr.opensoftlab.lunaops.cmm.cmm6000.cmm6400.web;

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
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.Stm3000Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Cmm6400Controller {

	
	private static final Logger Log = Logger.getLogger(Cmm6400Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "stm3000Service")
	private Stm3000Service stm3000Service;
	
	
	@RequestMapping(value="/cmm/cmm6000/cmm6400/selectCmm6400View.do")
	public String selectCmm6400View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/cmm/cmm6000/cmm6400/cmm6400";
	}
	
	
	@RequestMapping(value="/cmm/cmm6000/cmm6400/selectCmm6401View.do")
	public String selectCmm6401View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/cmm/cmm6000/cmm6400/cmm6401";
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/cmm/cmm6000/cmm6400/selectCmm6401UsrListAjax.do")
	public ModelAndView selectCmm6401UsrListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = stm3000Service.selectStm3000UsrListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);
			
			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> req4103UsrList = stm3000Service.selectStm3000UsrList(paramMap);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			
			model.addAttribute("data", req4103UsrList);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectCmm6401UsrListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
}
