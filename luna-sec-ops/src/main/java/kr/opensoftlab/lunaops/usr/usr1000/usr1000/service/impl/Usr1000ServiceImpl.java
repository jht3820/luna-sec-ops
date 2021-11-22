package kr.opensoftlab.lunaops.usr.usr1000.usr1000.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.cmm.cmm6000.cmm6000.service.Cmm6000Service;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.impl.Stm3000DAO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3003.service.impl.Stm3003DAO;
import kr.opensoftlab.lunaops.usr.usr1000.usr1000.service.Usr1000Service;

import org.jfree.util.Log;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("usr1000Service")
public class Usr1000ServiceImpl extends EgovAbstractServiceImpl implements Usr1000Service{
	
	
    @Resource(name="usr1000DAO")
    private Usr1000DAO usr1000DAO;
    
    
    @Resource(name="stm3003DAO")
    private Stm3003DAO stm3003DAO;
    
    
    @Resource(name="stm3000DAO")
    private Stm3000DAO stm3000DAO;
    
    
    @Resource(name="cmm6000Service")
    private Cmm6000Service cmm6000Service;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;
	
	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
    
	
    @SuppressWarnings("rawtypes")
   	public Map selectUsr1000UsrInfo(Map paramMap) throws Exception {
   		return (Map) usr1000DAO.selectUsr1000UsrInfo(paramMap) ;
   	}
	
    
    @SuppressWarnings("rawtypes")
   	public int selectUsr1000emailChRepAjax(Map paramMap) throws Exception {
   		return usr1000DAO.selectUsr1000emailChRepAjax(paramMap) ;
   	}
    
    
   	public int updateUsr1000UsrInfo(Map<String, String> paramMap, MultipartHttpServletRequest mptRequest) throws Exception {
    	
		String atchFileId = paramMap.get("usrImgId");
		String defaultImgYn = paramMap.get("defaultImgYn"); 
    	
		
		int uCnt = usr1000DAO.updateUsr1000UsrInfo(paramMap);
    	
    	
		if(uCnt == 0){
			
			throw new UserDefineException(egovMessageSource.getMessage("stm3000.fail.user.update"));
		}
		
		
		paramMap.put("logState", "U");	
		paramMap.put("pwChangeState", "N");	
		
		stm3003DAO.insertStm3003UserChangeLog(paramMap);
    	
		
		if(mptRequest.getFileMap().size() > 0 || "Y".equals(defaultImgYn) ){
			
			
			FileVO fileVo = new FileVO();
			fileVo.setAtchFileId(atchFileId);
			fileVo.setFileSn("0");
			
			
			fileVo = fileMngDAO.selectFileInf(fileVo);
			
			
			if(fileVo != null){
				
				fileMngDAO.deleteFileInf(fileVo);
			}
			
			
			if(!"Y".equals(defaultImgYn)){
				List<FileVO> _result = fileUtil.fileUploadInsert(mptRequest,atchFileId,0,"UsrImg");
				fileMngDAO.insertFileDetail(_result);
			}

			if(fileVo != null){
				
				try{
					
					String fileDeletePath  = fileVo.getFileStreCours()+fileVo.getStreFileNm();
					EgovFileMngUtil.deleteFile(fileDeletePath);
				}catch(Exception fileE){	
					Log.error(fileE);
				}
			}
		}
		
		return uCnt;
   	}

    
	@Override
	public Map<String, String> updateUsr1000PasswordChange(Map<String, String> paramMap) throws Exception {
		
		
		Map<String,String> resultMap = new HashMap<String,String>();
		
		String usrId = paramMap.get("usrId");
		String usrPw = paramMap.get("usrPw");
		String newUsrPw = paramMap.get("newUsrPw");
		
		
    	String bePw = usr1000DAO.selectUsr1000BeforePwCheck(paramMap);
    	
		
		String enUsrPw 	= EgovFileScrty.encryptPassword(usrPw, usrId);
		
		
		newUsrPw = EgovFileScrty.encryptPassword(newUsrPw, usrId);
		paramMap.put("usrPw", newUsrPw);
		
		
		if(bePw.equals(EgovStringUtil.isNullToString(enUsrPw))) {
			
			
			String isUsedPw = (String) stm3003DAO.selectStm3003BeforeUsedPwCheck(paramMap);
			
			
			if(!isUsedPw.equals("Y")) {
				
				
				usr1000DAO.updateUsr1000PasswordChange(paramMap) ;
				
				
				paramMap.put("logState", "U");
				paramMap.put("pwChangeState", "Y");	
				
				
				stm3003DAO.insertStm3003UserChangeLog(paramMap);
				
			}else{
				resultMap.put("code", "-1");
				resultMap.put("message", egovMessageSource.getMessage("prs3000.fail.user.usedPw"));
			}
			
		
		}else{
			resultMap.put("code", "-1");
			resultMap.put("message", egovMessageSource.getMessage("fail.user.wrongCurrPassword"));
		}
		
		return resultMap;
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectUsr1002(Map<String, String> paramMap) throws Exception {
		return usr1000DAO.selectUsr1002(paramMap);
	}

	
	@Override
	public int updateUsr1002(Map<String, String> paramMap) throws Exception {
		
		int dCnt = usr1000DAO.updateUsr1002(paramMap);
		
		
		paramMap.put("logState", "U");
		paramMap.put("pwChangeState", "N");	
		
		
		stm3003DAO.insertStm3003UserChangeLog(paramMap);
		
		return dCnt;
	}

	
	@Override
	public LoginVO selectUsr1000LoginVO(Map<String, String> paramMap) throws Exception {
		return usr1000DAO.selectUsr1000LoginVO(paramMap);
	}
    
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<Map> selectUsr1000ShortcutList(Map paramMap) throws Exception {
		
		
		Integer hasCnt = usr1000DAO.selectUsr1000ShortcutListCnt(paramMap);
		
		
		if(hasCnt == 0) {
			paramMap.put("usrId", "ROOTSYSTEM_USR");
		}
		
		List<Map> usr1000List = usr1000DAO.selectUsr1000ShortcutList(paramMap);
		
		List<Map> shortcutInfo = new ArrayList<Map>();
		
		for(Map _shortcut: usr1000List) {
			
			Map shortcut = new HashMap();
			List<String> shortcutString= new ArrayList();
			
			if("01".equals(_shortcut.get("ctrlCd"))) {
				shortcutString.add("Ctrl");
			}
			if("01".equals(_shortcut.get("shiftCd"))) {
				shortcutString.add("Shift");
			}
			if("01".equals(_shortcut.get("altCd"))) {
				shortcutString.add("Alt");
			}
			
			
						
			shortcutString.add(_shortcut.get("keyCd").toString().replace(" ", ""));
			shortcut.put("actionCd", _shortcut.get("actionCd"));
			shortcut.put("shortcut", String.join(" + ",shortcutString));
			shortcut.put("subCdNm", _shortcut.get("subCdNm"));
			shortcut.put("popupActionCd", _shortcut.get("popupActionCd"));
			
			shortcutInfo.add(shortcut);
			
		}
		return shortcutInfo;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void saveUsr1000ShortcutInfo(Map paramMap) throws Exception {
		
		
		Integer hasCnt = usr1000DAO.selectUsr1000ShortcutListCnt(paramMap);
		
		JSONParser parser = new JSONParser();
		
		
		String shortcutString = (String) paramMap.get("shortcutList");
		JSONArray shortcutList = (JSONArray) parser.parse(shortcutString);
		
		for(int i=0;i<shortcutList.size();i++) {
			
			JSONObject shortcut = (JSONObject) shortcutList.get(i);
			Map param = new ObjectMapper().readValue(shortcut.toString(), Map.class);
			param.put("usrId", paramMap.get("usrId"));
			param.put("regUsrId", paramMap.get("regUsrId"));
			param.put("modifyUsrId", paramMap.get("modifyUsrId"));
			param.put("regUsrIp", paramMap.get("regUsrIp"));
			param.put("modifyUsrIp", paramMap.get("regUsrIp"));
			
			
			if(param.get("keyCd") == null || "".equals(param.get("keyCd"))) {
				param.put("keyCd", " ");
				param.put("useCd", "02");
			}else {
				param.put("useCd", "01");
			}
			
    		
    		if(hasCnt == 0) {
    			
    			usr1000DAO.insertUsr1000ShortcutList(param);
    			
    		
    		}else {
    			
    			usr1000DAO.updateUsr1000ShortcutList(param);
    			
    		}
        }
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public void saveUsr1000AllSubSignUsr(Map<String, String> paramMap) throws Exception {
		
		
		int totCnt = cmm6000Service.selectReq1000ReqListCnt(paramMap);
		
		paramMap.put("firstIndex", "0");
		paramMap.put("lastIndex", String.valueOf(totCnt));
		
		
		List<Map> cmm6000List = cmm6000Service.selectReq1000ReqList(paramMap);
		
		List<String> usrAuthPrjList = new ArrayList<String>();
		
		
		for(Map cmm6000Info:cmm6000List) {
			usrAuthPrjList.add((String)cmm6000Info.get("prjId"));
		}
		
		
		String usrId = paramMap.get("usrId");
		String subSignUsrId = paramMap.get("subSignUsrId");
		paramMap.put("usrId", subSignUsrId);
		
		
		totCnt = cmm6000Service.selectReq1000ReqListCnt(paramMap);
		
		paramMap.put("lastIndex", String.valueOf(totCnt));
		
		
		List<Map> cmm6000SubList = cmm6000Service.selectReq1000ReqList(paramMap);
		
		paramMap.put("usrId", usrId);
		
		for(Map cmm6000SubInfo: cmm6000SubList) {
			
			String prjId = (String) cmm6000SubInfo.get("prjId");
			
			if(usrAuthPrjList.indexOf(prjId) != -1) {
				paramMap.put("prjId", prjId);
				
				
				stm3000DAO.deleteStm3005SubSignUsrInfo(paramMap);
				
				
				stm3000DAO.insertStm3005SubSignUsrInfo(paramMap);
			}
		}
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectUsr1000SubSignUsrInfo(Map<String, String> paramMap) throws Exception {
		return stm3000DAO.selectStm3005SubSignUsrInfo(paramMap);
	}

	
	@Override
	public void saveUsr1000SelSubSignUsr(Map<String, String> paramMap) throws Exception {
		
		stm3000DAO.deleteStm3005SubSignUsrInfo(paramMap);
		
		
		stm3000DAO.insertStm3005SubSignUsrInfo(paramMap);
	}
    
}
