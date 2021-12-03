package kr.opensoftlab.lunaops.dpl.dpl3000.dpl3000.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
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
import egovframework.com.cmm.service.EgovProperties;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.service.Dpl1000Service;
import kr.opensoftlab.lunaops.dpl.dpl3000.dpl3000.service.Dpl3000Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.service.Stm9000Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9200.service.Stm9200Service;
import kr.opensoftlab.sdf.jenkins.JenkinsClient;
import kr.opensoftlab.sdf.jenkins.service.BuildService;
import kr.opensoftlab.sdf.jenkins.vo.BuildVO;
import kr.opensoftlab.sdf.util.CommonScrty;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;


@Controller
public class Dpl3000Controller {
	
	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
    
    
    @Resource(name = "dpl1000Service")
    private Dpl1000Service dpl1000Service;
    
	
    
    
    
    
    @Resource(name = "dpl3000Service")
    private Dpl3000Service dpl3000Service;

    
    @Resource(name = "stm9000Service")
    private Stm9000Service stm9000Service;
    
    
	@Resource(name = "stm9200Service")
	private Stm9200Service stm9200Service;
	
	
	
	
	
	
	@Resource(name = "jenkinsClient")
	private JenkinsClient jenkinsClient;
	
	
	@Resource(name = "buildService")
	private BuildService buildService;
    
	
	@RequestMapping(value="/dpl/dpl3000/dpl3000/selectDpl3000View.do")
    public String selectDpl3000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/dpl/dpl3000/dpl3000/dpl3000";
    }
	  
	
	@RequestMapping(value="/dpl/dpl3000/dpl3000/selectDpl3001View.do")
    public String selectDpl3001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/dpl/dpl3000/dpl3000/dpl3001";
    }  
	
	
	@RequestMapping(value="/dpl/dpl3000/dpl3000/selectDpl3002View.do")
    public String selectDpl3002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/dpl/dpl3000/dpl3000/dpl3002";
    }
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/dpl/dpl3000/dpl3000/selectDpl3000DplJobListAjax.do")
	public ModelAndView selectDpl3000DplJobListAjax(HttpServletRequest request, ModelMap model) throws Exception {
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
			
			
			/
			/
			
			metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", dataList);
			model.addAttribute("meta", metaMap);
			
        	
			model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectDpl3000DplJobListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/dpl/dpl3000/dpl3000/selectDpl3000DplJobNormalListAjax.do")
	public ModelAndView selectDpl3000DplJobNormalListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
			
			String paramPrjId = paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjId", paramPrjId);
			
			
			List<Map> dataList = dpl1000Service.selectDpl1300DplJobList(paramMap);
			
			model.addAttribute("list", dataList);
			
        	
			model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectDpl3000DplJobNormalListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(value="/dpl/dpl3000/dpl3000/selectDpl3000JobBuildAjax.do")
	public ModelAndView selectDpl3000JobBuildAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		
    		
    		HttpSession ss = request.getSession();
    		
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		paramMap.put("licGrpId", loginVO.getLicGrpId());
    		
    		
    		String paramPrjId = paramMap.get("prjId");
    		if(paramPrjId == null || "".equals(paramPrjId)) {
    			
    			paramPrjId = (String) ss.getAttribute("selPrjId");
    		}
    		
    		String paramAuthGrpId = paramMap.get("authGrpId");
    		if(paramAuthGrpId == null || "".equals(paramAuthGrpId)) {
    			
    			paramAuthGrpId = (String) ss.getAttribute("selAuthGrpId");
    		}
    		
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
    		
    		Map jenMap = stm9000Service.selectStm9000JenkinsInfo(paramMap);
    		
    		
    		Map dplMap = dpl1000Service.selectDpl1000DplInfo(paramMap);
    		
    		
			String dplUsrId = (String) dplMap.get("dplUsrId");
    		
			
			boolean buildFlag = false;
			
    		
    		List<Map> bldAuthList = stm9200Service.selectStm9200PrjAssignDplAuthNormalList(paramMap);
    		
    		if(bldAuthList != null && bldAuthList.size() > 0) {
    			
    			for(int i=0 ;i<bldAuthList.size(); i++) {
    				Map bldAuthInfo = bldAuthList.get(i);
    				
    				String dplAuthTargetId = (String)bldAuthInfo.get("dplAuthTargetId");
    				
    				
    				if(dplAuthTargetId.equals(dplUsrId)){
    					buildFlag = true;
    					break;
    				
    				}else if(dplAuthTargetId.equals(paramAuthGrpId)){
    					buildFlag = true;
    					break;
    				}
    			}
    		
    		}else{
    			buildFlag = true;
    		}
    		
    		
    		if(!buildFlag){
    			
    			model.addAttribute("errorYn", "Y");
				model.addAttribute("message", "해당 JOB의 배포 실행 권한이 없습니다. 관리자에게 문의하세요.");
				return new ModelAndView("jsonView");
    		}
			
    		
    		if(!loginVO.getUsrId().equals(dplUsrId)){
    			
    			model.addAttribute("errorYn", "Y");
				model.addAttribute("message", "배포자만 실행이 가능합니다.");
				return new ModelAndView("jsonView");
    		}
    		
    		
    		String dplTypeCd = (String) dplMap.get("dplTypeCd");
    		
    		
    		String dplStsCd = (String)dplMap.get("dplStsCd");
    		
    		
    		String dplAutoAfterCd = (String)dplMap.get("dplAutoAfterCd");
    		
    		
    		if("01".equals(dplTypeCd)){
    			
    			if(!"03".equals(dplStsCd) && !"01".equals(dplAutoAfterCd)){
    				
    				model.addAttribute("errorYn", "Y");
    				model.addAttribute("message", "수동 실행이 불가능한 자동 배포 계획입니다.");
    				return new ModelAndView("jsonView");
    			}
    		}
    		
    		
    		if("02".equals(dplStsCd)){
    			
    			model.addAttribute("errorYn", "Y");
				model.addAttribute("message", "배포 상태가 성공인 배포 계획의 JOB은 수동 실행이 불가능합니다.");
				return new ModelAndView("jsonView");
    		}
    		
    		
    		String userId= (String)jenMap.get("jenUsrId");
			String tokenId= (String)jenMap.get("jenUsrTok");
			String jenUrl= (String)jenMap.get("jenUrl");
			
			
			
			
			String jobToken = (String)paramMap.get("jobTok");
			
			
			if(tokenId == null || "".equals(tokenId) || jobToken == null || "".equals(jobToken)){
				
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", egovMessageSource.getMessage("fail.deploy.build"));
				model.addAttribute("MSG_CD", "토큰 값 오류");
				return new ModelAndView("jsonView");
			}
			
			
			paramMap.put("userId", userId);
			paramMap.put("tokenId", tokenId);
			paramMap.put("jenUrl", jenUrl);
			paramMap.put("dplId", (String)dplMap.get("dplId"));
			paramMap.put("dplTypeCd", (String)dplMap.get("dplTypeCd"));
			paramMap.put("dplAutoAfterCd", (String)dplMap.get("dplAutoAfterCd"));
			paramMap.put("dplRestoreCd", (String)dplMap.get("dplRestoreCd"));
			paramMap.put("dplRevisionNum", (String)dplMap.get("dplRevisionNum"));
			paramMap.put("regUsrId", loginVO.getUsrId());
			paramMap.put("regUsrIp", request.getRemoteAddr());
			
			
			BuildVO buildVo = buildService.insertBuildVoSetting(paramMap);
			
			buildVo.setBldResult("START");
			buildVo.setBldResultCd("01");
			buildVo.setBldResultMsg("빌드 준비 중");
			buildVo.setEstimatedDuration(10000);
			
			
			dpl1000Service.insertDpl1400DeployJobBuildLogInfo(buildVo);
			
			
			model = buildService.insertJobBuildAction(buildVo,model);
			
			return new ModelAndView("jsonView");
			
		}catch(Exception ex){
			Log.error("selectDpl3000JobBuildAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/dpl/dpl3000/dpl3000/selectDpl3000JobConsoleLogAjax.do")
	public ModelAndView selectDpl3000JobConsoleLogAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			
			paramMap.remove("licGrpId");
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			String userId= (String)paramMap.get("jenUsrId");
			String tokenId= (String)paramMap.get("jenUsrTok");
			String jenUrl= (String)paramMap.get("jenUrl");
			
			
			String jobId = (String)paramMap.get("jobId");
			
			
			if(tokenId == null || "".equals(tokenId)){
				
				model.addAttribute("message", egovMessageSource.getMessage("fail.deploy.build"));
				model.addAttribute("MSG_CD", "토큰 값 오류");
				return new ModelAndView("jsonView");
			}
			
			
			String salt = EgovProperties.getProperty("Globals.lunaops.salt");
			
			
			String deTokenId = CommonScrty.decryptedAria(tokenId, salt);
			
			jenkinsClient.setUser(userId);
			jenkinsClient.setPassword(deTokenId);
			
			
			String bldNum = (String)paramMap.get("bldNum");
			
			
			String requestConsole = (String)paramMap.get("requestConsole");
			
			String consoleText = "";
			try{
				
				String buildUrl = jenUrl+"/job/"+jobId+"/"+bldNum+"/api/json";
				String buildContent = jenkinsClient.excuteHttpClientJenkins(buildUrl);
				Map buildMap = jenkinsClient.getJenkinsParser(buildContent);
				
				
				model.addAttribute("buildMap", buildMap);
				
				
				
				boolean building = (boolean) buildMap.get("building");
				
				
				String bldResult = (String) buildMap.get("result");
				
				
				if(building == false && bldResult != null && !"null".equals(bldResult)){
					
					Map localBldInfo = dpl3000Service.selectDpl1400DplJobBuildInfo(paramMap);
					
					
					String localBldResult = (String)localBldInfo.get("bldResult");
					
					
					if(localBldResult != null && !"START".equals(localBldResult) && !"PROGRESS".equals(localBldResult)){
						
						model.addAttribute("localBldInfo", localBldInfo);
					}else {
						

						
						long estimatedDuration = (long)buildMap.get("duration");
						BuildVO buildVo = new BuildVO();
						buildVo.setPrjId((String)localBldInfo.get("prjId"));
						buildVo.setDplId((String)localBldInfo.get("dplId"));
						buildVo.setJenId((String)localBldInfo.get("jenId"));
						buildVo.setJobId((String)localBldInfo.get("jobId"));
						
						buildVo.setBldNum(Integer.parseInt(bldNum));
						buildVo.setBldResult(bldResult);
						
						String bldResultMsg = "";
						
						if("ABORTED".equals(bldResult)){
							bldResultMsg = "빌드 중지";
						}
						
						else if("SUCCESS".equals(bldResult)){
							bldResultMsg = "빌드 성공";
						}
						
						else if("FAILURE".equals(bldResult)){
							bldResultMsg = "빌드 실패";
						}else {
							bldResultMsg = bldResult;
						}
						
						buildVo.setEstimatedDuration(estimatedDuration);
						
						
						long timestamp = Long.parseLong(String.valueOf(buildMap.get("timestamp")));
						
						Date bldStartTm = new Date();
						bldStartTm.setTime(timestamp);
						
			    		DateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
			    		
						buildVo.setBldStartDtm(fm.format(bldStartTm));
						
						
						String consoleurl =  jenUrl+"/job/"+jobId+"/"+bldNum+"/consoleText";
						String buildConsoleText = jenkinsClient.excuteHttpClientJenkins(consoleurl);
						
						buildVo.setBldConsoleLog(buildConsoleText);
						buildVo.setBldResultMsg(bldResultMsg);
						buildVo.setRegUsrId((String)localBldInfo.get("regUsrId"));
						buildVo.setRegUsrIp((String)localBldInfo.get("regUsrIp"));
						
						
						int bldSeq = dpl1000Service.insertDpl1400DeployJobBuildLogInfo(buildVo);
						
						localBldInfo.put("bldSeq", bldSeq);
						localBldInfo.put("bldResult", bldResult);
						localBldInfo.put("bldResultMsg", bldResultMsg);
						
						
						model.addAttribute("localBldInfo", localBldInfo);
					}
				}
	 			

				
				if(requestConsole != null && !"".equals(requestConsole) && "Y".equals(requestConsole)){
					
					
		 			List<Map> dplRunAuthGrp = null;
		 			
		 			
	 				boolean authGrpChk = true;
	 				
		 			

































		 			
		 			
	 				if(!authGrpChk){
	 					consoleText = "허용 권한이 없습니다.";
	 				}else{
	 					
						String consoleurl =  jenUrl+"/job/"+jobId+"/"+bldNum+"/consoleText";
						consoleText = jenkinsClient.excuteHttpClientJenkins(consoleurl);
	 				}
				}
				
				
				model.addAttribute("consoleText", consoleText);
			}catch(UserDefineException uex){
				
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
				model.addAttribute("errorYn", "Y");
				return new ModelAndView("jsonView");
			}
			
			model.addAttribute("errorYn", "N");
			return new ModelAndView("jsonView");
			
		}catch(Exception ex){
			Log.error("selectDpl3000JobConsoleLogAjax()", ex);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			model.addAttribute("errorYn", "Y");
			return new ModelAndView("jsonView");
		}
	}
	
	
    
 	@RequestMapping(value="/dpl/dpl3000/dpl3000/updateDpl3000DplStsCdView.do")
    public ModelAndView updateDpl3000DplStsCdView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		
    		
    		HttpSession ss = request.getSession();
    		
			paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
			
			
			dpl1000Service.updateDpl1000DplStsCdInfo(paramMap);
			
			
    		model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			return new ModelAndView("jsonView", model);
		}
		catch(Exception ex){
			Log.error("updateDpl3000DplStsCdView()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView", model);
		}
	}
 	
 	
 	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/dpl/dpl3000/dpl3000/selectDpl3000DplConsoleLogView.do")
 	public ModelAndView selectDpl3000DplConsoleLogView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
 		try{
 			
 			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
 			
 			
 			HttpSession ss = request.getSession();
 			
 			
    		String paramPrjId = paramMap.get("prjId");
    		if(paramPrjId == null || "".equals(paramPrjId)) {
    			
    			paramPrjId = (String) ss.getAttribute("selPrjId");
    		}
    		
    		paramMap.put("prjId", paramPrjId);
 			
 			
 			Map localJobInfo = dpl3000Service.selectDpl1400DplJobBuildInfo(paramMap);
 			model.addAttribute("localJobInfo", localJobInfo);
 			
 			
 			model.addAttribute("errorYn", "N");
 			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
 			return new ModelAndView("jsonView", model);
 		}
 		catch(Exception ex){
 			Log.error("updateDpl3000DplStsCdView()", ex);
 			
 			
 			model.addAttribute("errorYn", "Y");
 			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
 			return new ModelAndView("jsonView", model);
 		}
 	}
 }
