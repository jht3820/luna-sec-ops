package kr.opensoftlab.lunaops.cmm.cmm6000.cmm6000.web;

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
import kr.opensoftlab.lunaops.cmm.cmm6000.cmm6000.service.Cmm6000Service;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;





@Controller
public class Cmm6000Controller {
	
	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "cmm6000Service")
	private Cmm6000Service cmm6000Service;
	
	
    @RequestMapping(value="/cmm/cmm6000/cmm6000/selectCmm6000View.do")
    public String selectCmm17000View() throws Exception {
    	return "/cmm/cmm6000/cmm6000/cmm6000";
    }
    
    
    @SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/cmm/cmm6000/cmm6000/selectCmm6000PrjListAjax.do")
	public ModelAndView selectReq1000ListAjaxView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			paramMap.put("usrId", loginVO.getUsrId());

			
			
			int totCnt = cmm6000Service.selectReq1000ReqListCnt(paramMap);

			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);

			
			
			List<Map> cmm17000List = cmm6000Service.selectReq1000ReqList(paramMap);
			
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", cmm17000List);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectCmm6000ListView()", ex);
			
			model.addAttribute("errorYn", "Y");
			throw new Exception(ex.getMessage());
		}
	}

    
	@RequestMapping(value="/cmm/cmm6000/cmm6000/updateCmm6000UsrMainPrjAjax.do")
	public ModelAndView updateReq1001ReqInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			cmm6000Service.updateCmm17000UsrMainPrj(paramMap);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateCmm6000UsrMainPrjAjax()", ex);

			
			model.addAttribute("saveYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
}
