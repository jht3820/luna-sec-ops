package kr.opensoftlab.lunaops.req.req4000.req4100.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.cmm.cmm6000.cmm6600.service.Cmm6600Service;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.prj.prj1000.prj1000.service.Prj1000Service;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.Prj1100Service;
import kr.opensoftlab.lunaops.prj.prj1000.prj1300.service.Prj1300Service;
import kr.opensoftlab.lunaops.req.req3000.req3000.service.Req3000Service;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.Req4100Service;
import kr.opensoftlab.lunaops.req.req6000.req6000.service.Req6000Service;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.Stm3000Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Req4100Controller {

	
	private static final Logger Log = Logger.getLogger(Req4100Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "req3000Service")
	private Req3000Service req3000Service;
	
	
	@Resource(name = "req4100Service")
	private Req4100Service req4100Service;
	
	
	@Resource(name = "req6000Service")
	private Req6000Service req6000Service;
	
	
	@Resource(name = "stm3000Service")
	private Stm3000Service stm3000Service;

	
    @Resource(name = "prj1300Service")
    private Prj1300Service prj1300Service;
    
	
	@Resource(name = "prj1000Service")
	private Prj1000Service prj1000Service;

	
    @Resource(name = "prj1100Service")
    private Prj1100Service prj1100Service;

	
	@Resource(name = "cmm6600Service")
	Cmm6600Service cmm6600Service;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
   	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	
	
	@RequestMapping(value="/req/req4000/req4100/selectReq4100View.do")
	public String selectReq4100ReqListView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/req/req4000/req4100/req4100";
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/req/req4000/req4100/selectReq4100ReqListAjax.do")
	public ModelAndView selectReq4100ReqListAjax(HttpServletRequest request, ModelMap model) throws Exception {
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
			
			
			int totCnt = req4100Service.selectReq4100ReqListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> req4100List = req4100Service.selectReq4100ReqList(paramMap);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			
			model.addAttribute("data", req4100List);
			model.addAttribute("meta", metaMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectReq4100ReqListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/req/req4000/req4100/selectReq4100PrepListAjax.do")
	public ModelAndView selectReq4100PrepListAjax(HttpServletRequest request, ModelMap model) throws Exception {
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
			
			
			int totCnt = req4100Service.selectReq4100PrepListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);
			
			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> req4100PrepList = req4100Service.selectReq4100PrepList(paramMap);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			
			model.addAttribute("data", req4100PrepList);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectReq4100PrepListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/req/req4000/req4100/selectReq4100ReqFlowListAjax.do")
	public ModelAndView selectReq4100ReqFlowListAjax(HttpServletRequest request, ModelMap model) throws Exception {
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
			
			
			int totCnt = req4100Service.selectReq4100ReqListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> req4100List = req4100Service.selectReq4100ReqList(paramMap);
			List<Map> reqFlowListCnt = prj1100Service.selectPrj1100FlowChargerCntList(paramMap);

			metaMap.put("flowCntList", reqFlowListCnt);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			
			model.addAttribute("data", req4100List);
			model.addAttribute("meta", metaMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectReq4100ReqListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/req/req4000/req4100/selectReq4100SelReqListAjax.do")
	public ModelAndView selectReq4100SelReqListAjax(HttpServletRequest request, ModelMap model) throws Exception {
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
			
			
			
			String paramSelReqInfoList = (String) paramMap.get("paramSelReqInfoList");
			List<Map> reqInfoList = new ArrayList<Map>();
			
			JSONArray jsonList = new JSONArray(paramSelReqInfoList);
			if(jsonList != null) {
				for(int i=0;i<jsonList.length();i++) {
					
					JSONObject reqInfo = jsonList.getJSONObject(i);
					String jsonPrjId = reqInfo.getString("prjId");
					String jsonReqId = reqInfo.getString("reqId");
					
					
					Map newMap = new HashMap<>();
					newMap.put("prjId", jsonPrjId);
					newMap.put("reqId", jsonReqId);
					
					
					reqInfoList.add(newMap);
				}
			}
			
			
			Map<String, Object> newParamMap = new HashMap<String, Object>();
			newParamMap.putAll(paramMap);
			newParamMap.put("selReqInfoList", reqInfoList);
			
			
			int totCnt = req4100Service.selectReq4100ReqListCnt(newParamMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			newParamMap = PagingUtil.getPageSettingMap(newParamMap, paginationInfo);
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> req4100List = req4100Service.selectReq4100ReqList(newParamMap);

			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			
			model.addAttribute("data", req4100List);
			model.addAttribute("meta", metaMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectReq4100ReqListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/selectReq4101View.do")
	public String selectReq4101ReqInfoView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/req/req4000/req4100/req4101";
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/insertReq4101ReqAtchFileInfo.do")
	public ModelAndView insertReq4101ReqAtchFileInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
			
			
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
			
			String atchFileId = (String) paramMap.get("atchFileId");
			String fileSn = (String) paramMap.get("fileSn");
			
			
			List<FileVO> _result = fileUtil.fileUploadInsert(mptRequest, atchFileId, Integer.parseInt(fileSn), "Req");
			
			
			fileMngService.insertFileDetail(_result);  
			
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertReq4101ReqAtchFileInfo()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/insertReq4101ReqInfoAjax.do")
	public ModelAndView insertReq4101ReqInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
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
			
			
			Object insertKey = req4100Service.saveReq4100ReqInfo(paramMap);
			paramMap.put("reqId", (String)insertKey);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertReq4101ReqInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/selectReq4104View.do")
	public String selectReq4104View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/req/req4000/req4100/req4104";
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/req/req4000/req4100/selectReq4104ReqGrpListAjax.do")
	public ModelAndView selectReq4104UsrListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
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
			
			
			int totCnt = req3000Service.selectReq3000ReqGrpListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);
			
			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> req4104ReqGrpList = req3000Service.selectReq3000ReqGrpList(paramMap);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			
			model.addAttribute("data", req4104ReqGrpList);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectReq4103UsrListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/updateReq4101ReqInfoAjax.do")
	public ModelAndView updateReq4101ReqInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
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
			
			
			req4100Service.saveReq4100ReqInfo(paramMap);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateReq4101ReqInfoAjax()", ex);

			
			model.addAttribute("saveYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/updateReq4100ReqRejectList.do")
	public ModelAndView updateReq4100ReqRejectList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			req4100Service.updateReq4100ReqRejectList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateReq4100ReqRejectList()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/updateReq4100ReqAcceptList.do")
	public ModelAndView updateReq4100ReqAcceptList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			String paramPrjId = (String) paramMap.get("paramPrjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjId", paramPrjId);
			
			
			req4100Service.updateReq4100ReqAcceptList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateReq4100ReqAcceptList()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value="/req/req4000/req4100/updateReq4100ReqSignRejectInfo.do")
	public ModelAndView updateReq4100ReqSignRejectInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			req4100Service.updateReq4100ReqSignRejectInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateReq4100ReqSignRejectInfo()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/updateReq4100ReqSignAcceptInfo.do")
	public ModelAndView updateReq4100ReqSignAcceptInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			req4100Service.updateReq4100ReqSignAcceptInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateReq4100ReqSignAcceptInfo()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/selectReq4102View.do")
	public String selectReq4102View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			String fileSumMaxSize = EgovProperties.getProperty("Globals.lunaops.fileSumMaxSize");
			model.addAttribute("fileSumMaxSize",fileSumMaxSize);
			model.addAttribute("type",paramMap.get("type"));
			
			return "/req/req4000/req4100/req4102";
		}
		catch(Exception ex){
			Log.error("selectReq4102View()", ex);
			throw new Exception(ex.getMessage());
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/selectReq4100UserCheckAjax.do")
	public ModelAndView selectReq4100UserCheckAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
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
		
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);

			String reqAuth = req4100Service.selectReq4100UserCheck(paramMap);
			model.addAttribute("reqAuth", reqAuth);
			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("selectReq4100UserCheckAjax()", ex);
    		
    		model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
    		throw new Exception(ex.getMessage());
    	}
    }
	
	
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/req/req4000/req4100/selectReq4100ReqInfoAjax.do")
	public ModelAndView selectReq4100ReqInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
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
			
			
			List<Map> reqChgList = req6000Service.selectReq6001ReqChgList(paramMap); 
			model.addAttribute("reqChgList", reqChgList);
			
        	
        	Map reqInfoMap = (Map) req4100Service.selectReq4100ReqInfo(paramMap);        	
        	model.addAttribute("reqInfoMap", reqInfoMap);

        	List<FileVO> fileList = null;
        	int fileCnt = 0;
        	
        	if(reqInfoMap != null){
        		
            	FileVO fileVO = new FileVO();
	        	fileVO.setAtchFileId((String)reqInfoMap.get("atchFileId"));
	        	
	        	
				fileList = fileMngService.fileDownList(fileVO);
				
				
				
				for(FileVO temp : fileList){
					if(fileCnt < Integer.parseInt(temp.getFileSn())){
						fileCnt = Integer.parseInt(temp.getFileSn());
					}
				}
        	}else {
        		model.addAttribute("errorYn", "Y");
            	model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
        	}
			model.addAttribute("fileList",fileList);
			model.addAttribute("fileListCnt",fileCnt);

			
			paramMap.put("itemRequestCd", "01");
			
			List<Map> prjItemList = prj1000Service.selectPrj1002AllItemList(paramMap);
			List<Map> basicItemList = new ArrayList<>();
			List<Map> basicItemInsertList = new ArrayList<>();
			for(int i=0; i<prjItemList.size(); i++) {
				Map item = prjItemList.get(i);
				if(item.get("reqId").equals("ROOTSYSTEM_FLW")) {
					basicItemList.add(item);
				}else {
					basicItemInsertList.add(item);
				}
			}
			model.addAttribute("basicItemInsertList", basicItemInsertList);
			model.addAttribute("basicItemList", basicItemList);

			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("selectReq1000ReqInfoAjax()", ex);
    		
    		model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		throw new Exception(ex.getMessage());
    	}
    }
    
    
	@RequestMapping(value="/req/req4000/req4100/deleteReq4100ReqListAjax.do")
	public ModelAndView deleteReq4100ReqListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
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

			req4100Service.deleteReq4100ReqList(paramMap);
			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("deleteReq4100ReqInfoAjax()", ex);
    		
    		model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
    		throw new Exception(ex.getMessage());
    	}
    }
	
	
	@RequestMapping(value="/req/req4000/req4100/selectReq4103View.do")
	public String selectReq4103View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/req/req4000/req4100/req4103";
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/selectReq4100PwCheckAjax.do")
	public ModelAndView selectReq4100PwCheckAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
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

			String resultPwCheck = req4100Service.selectReq4100ReqPwCheck(paramMap);
			model.addAttribute("resultPwCheck", resultPwCheck);
			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("selectReq4100PwCheckAjax()", ex);
    		
    		model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		throw new Exception(ex.getMessage());
    	}
    }
	
	   
	@RequestMapping(value="/req/req4000/req4100/insertReq4100ReqCopyAjax.do")
	public ModelAndView insertReq4100ReqCopyAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
			
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
			
			
			String reqId = req4100Service.insertReq4100ReqCopy(paramMap);
			model.addAttribute("reqId", reqId);
			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("req4100.success.copy"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("insertReq4100ReqCopyAjax()", ex);
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("req4100.fail.copy"));
    		throw new Exception(ex.getMessage());
    	}
    }
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/req/req4000/req4100/selectReq4100ChargeReqListAjax.do")
	public ModelAndView selectReq4100ChargeReqListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			HttpSession ss = request.getSession();

    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		paramMap.put("usrId", loginVO.getUsrId());
    		
			
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = req4100Service.selectReq4100ChargeReqListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Integer> pageMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> req4100List = req4100Service.selectReq4100ChargeReqList(paramMap);

			
			model.addAttribute("data", req4100List);
			model.addAttribute("meta", pageMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectReq4100ReqListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/req/req4000/req4100/selectReq4100RequestProcessData.do")
	public ModelAndView selectReq4100RequestProcessData(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
			
			String usrId = loginVO.getUsrId();
			
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			
			String paramReqId = (String) paramMap.get("paramReqId");
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			paramMap.put("reqId", paramReqId);

			
			Map reqInfo = req4100Service.selectReq4100ReqInfo(paramMap);
			if(reqInfo == null){
				model.addAttribute("errorYn", "Y");
	        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
	        	return new ModelAndView("jsonView");
			}
			
			
			List<Map> reqChgList = req6000Service.selectReq6001ReqChgList(paramMap); 
			
			
			Map prjInfo = prj1000Service.selectPrj1000Info(paramMap);

			List<FileVO> fileList = null;
        	int fileCnt = 0;
        	
    		
        	FileVO fileVO = new FileVO();
        	fileVO.setAtchFileId((String)reqInfo.get("atchFileId"));
        	
        	
			fileList = fileMngService.fileDownList(fileVO);
			
			for(FileVO temp : fileList){
				if(fileCnt < Integer.parseInt(temp.getFileSn())){
					fileCnt = Integer.parseInt(temp.getFileSn());
				}
			}
        	
        	
        	String processId = (String)reqInfo.get("processId");
        	paramMap.put("processId", processId);
        	
        	
    		List<Map> flowList = prj1100Service.selectPrj1101FlowList(paramMap);
    		
    		
    		List<Map> flowLinkList = prj1100Service.selectPrj1107FlowLinkList(paramMap);
    		
    		
    		Map flowInfo = prj1100Service.selectPrj1101FlowInfo(reqInfo);
    		
    		
    		String flowSignCd = (String)flowInfo.get("flowSignCd");
    		
    		paramMap.put("processId", (String) flowInfo.get("processId"));
    		paramMap.put("flowId", (String) flowInfo.get("flowId"));
    		
    		
    		List<Map> itemList = prj1300Service.selectPrj1102AllItemList(paramMap);
    		
    		
    		List<Map> signUsrList = null;
    		Map currentSignUsrInfo = null;
    		String reqSignOrd = "-1";
    		
    		
    		if("01".equals(flowSignCd)) {
        		
        		paramMap.put("targetId", (String) reqInfo.get("reqId"));
        		paramMap.put("targetCd", "01");
        		paramMap.put("subTargetFstId", (String) reqInfo.get("processId"));
        		paramMap.put("subTargetScdId", (String) reqInfo.get("flowId"));

        		
    			signUsrList = cmm6600Service.selectCmm6600SignUsrList(paramMap);
    			
    			
    			String reqSignCd = (String) reqInfo.get("reqSignCd");
    			if(reqSignCd != null && !"03".equals(reqSignCd)) {
    				
    				reqSignOrd = String.valueOf(reqInfo.get("reqSignOrd"));
    				
    				paramMap.put("ord", String.valueOf(reqSignOrd));
    				
    				
    				currentSignUsrInfo = (Map)cmm6600Service.selectCmm6600NextOrdInfo(paramMap);
    			}
    		}
    		
    		
    		Boolean reqProcessAuthFlag = false;
    				
    		
    		String reqChargerId = (String) reqInfo.get("reqChargerId");
    		
    		
    		if(reqChargerId != null && !"".equals(reqChargerId) && usrId.equals(reqChargerId)) {
    			reqProcessAuthFlag = true;
    		}
    		
    		else if(reqChargerId == null || "".equals(reqChargerId)){
    			
    			paramMap.put("listType", "user");
    			
    			
    			int processAuthUsrCnt = prj1100Service.selectPrj1100ProcessAuthUsrListCnt(paramMap);
    			paramMap.put("firstIndex", "0");
    			paramMap.put("lastIndex", String.valueOf(processAuthUsrCnt));
    			
    			
    			List<Map> processAuthUsrList = prj1100Service.selectPrj1100ProcessAuthUsrList(paramMap);
    			
    			
    			for(Map processAuthUsrInfo : processAuthUsrList) {
    				
    				String authUsrId = (String) processAuthUsrInfo.get("usrId");
    				
    				
    				if(usrId.equals(authUsrId)) {
    					reqProcessAuthFlag = true;
    					break;
    				}
    			}
    		}
    		
    		
    		
    		
    		
			paramMap.put("prjId", paramPrjGrpId);
			
			Map prjGrpInfo = prj1000Service.selectPrj1000GrpInfo(paramMap);
    		
    		model.addAttribute("flowList", flowList);
    		model.addAttribute("flowInfo", flowInfo);
    		model.addAttribute("flowLinkList", flowLinkList);

    		model.addAttribute("itemList", itemList);
    		
			model.addAttribute("fileList",fileList);
			model.addAttribute("fileListCnt",fileCnt);
			
			model.addAttribute("reqInfo", reqInfo);
			model.addAttribute("prjInfo", prjInfo);
			model.addAttribute("prjGrpInfo", prjGrpInfo);
			model.addAttribute("reqChgList", reqChgList);
			
			model.addAttribute("signUsrList", signUsrList);
			model.addAttribute("currentSignUsrInfo", currentSignUsrInfo);
			model.addAttribute("reqSignOrd", reqSignOrd);
			
			model.addAttribute("reqProcessAuthFlag", reqProcessAuthFlag);
			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("selectReq4100RequestProcessData()", ex);
    		
    		model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		throw new Exception(ex.getMessage());
    	}
    }
	
	
	@RequestMapping(value="/req/req4000/req4100/saveReq4100ReqProcessAction.do")
	public ModelAndView saveReq4100ReqProcessAction(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			
			String paramReqId = (String) paramMap.get("paramReqId");
			

			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			paramMap.put("reqId", paramReqId);
			
			
			req4100Service.saveReq4100ReqProcessActionInfo(paramMap);
			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("saveReq4100ReqProcessAction()", ex);
    		
    		model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		throw new Exception(ex.getMessage());
    	}
    }
	
	
    
    @SuppressWarnings({ "rawtypes" })
	@RequestMapping(value="/req/req4000/req4100/selectReq4100FlowInfoAjax.do")
	public ModelAndView selectReq4100FlowInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjId", paramPrjId);
			
        	
        	Map flowInfo = (Map) req4100Service.selectReq4100FlowInfoAjax(paramMap);        	
        	model.addAttribute("flowInfo", flowInfo);

        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("selectReq1000ReqInfoAjax()", ex);
    		
    		model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		throw new Exception(ex.getMessage());
    	}
    }
}
