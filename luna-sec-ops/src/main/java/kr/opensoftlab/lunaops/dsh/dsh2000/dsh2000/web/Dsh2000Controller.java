package kr.opensoftlab.lunaops.dsh.dsh2000.dsh2000.web;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.dsh.dsh1000.dsh1000.service.Dsh1000Service;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Dsh2000Controller {

	
	protected Logger Log = Logger.getLogger(this.getClass());
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;

   	
    @Resource(name = "dsh1000Service")
    private Dsh1000Service dsh1000Service;
   	
	@Value("${Globals.fileStorePath}")
	private String tempPath;
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
	
	@RequestMapping(value="/dsh/dsh2000/dsh2000/selectDsh2000View.do")
	public String selectDsh2000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			
			
			
			model.addAttribute("topMenuType","01");
			
			return "/dsh/dsh2000/dsh2000/dsh2000";
		}
		catch(Exception ex){
			Log.error("selectDsh2000View()", ex);
			throw new Exception(ex.getMessage());
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/dsh/dsh2000/dsh2000/selectDsh2000DashBoardDataAjax.do")
	public ModelAndView selectDsh2000DashBoardDataAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVo = (LoginVO) ss.getAttribute("loginVO");
			String usrId = loginVo.getUsrId();
    		paramMap.put("usrId", usrId);
			
    		
    		String paramPrjId = paramMap.get("prjId");
    		
    		if(paramPrjId == null || "".equals(paramPrjId)) {
    			paramPrjId = (String) ss.getAttribute("selPrjId");
    		}
    		
			paramMap.put("prjId", paramPrjId);
			
			
    		List<Map> processReqCnt = dsh1000Service.selectDsh1000ProcessReqCntList(paramMap);
    		
    		
    		List<Map> monthProcessReqCnt = dsh1000Service.selectDsh1000MonthProcessReqCntList(paramMap);
			
    		model.addAttribute("processReqCnt",processReqCnt);
			model.addAttribute("monthProcessReqCnt",monthProcessReqCnt);
			
			


















































			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectDsh2000DashBoardDataAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
}
