package kr.opensoftlab.lunaops.req.req4000.req4100.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;



import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.jfree.util.Log;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.cmm.cmm6000.cmm6600.service.Cmm6600Service;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.prj.prj1000.prj1000.service.Prj1000Service;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.impl.Prj1100DAO;
import kr.opensoftlab.lunaops.prj.prj1000.prj1300.service.Prj1300Service;
import kr.opensoftlab.lunaops.req.req3000.req3000.service.impl.Req3000DAO;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.Req4100Service;
import kr.opensoftlab.lunaops.req.req6000.req6000.service.Req6000Service;
import kr.opensoftlab.lunaops.req.req6000.req6000.vo.Req6001VO;
import kr.opensoftlab.sdf.util.CommonScrty;

@Service("req4100Service")
public class Req4100ServiceImpl extends EgovAbstractServiceImpl implements Req4100Service {

	
    @Resource(name="req4100DAO")
    private Req4100DAO req4100DAO;
    
    
    @Resource(name="req3000DAO")
    private Req3000DAO req3000DAO;
    
    
    @Resource(name="prj1100DAO")
    private Prj1100DAO prj1100DAO;

	
    @Resource(name = "prj1300Service")
    private Prj1300Service prj1300Service;
    
	
    @Resource(name = "prj1000Service")
    private Prj1000Service prj1000Service;
    
	
	@Resource(name = "req6000Service")
	private Req6000Service req6000Service;

	
	@Resource(name = "cmm6600Service")
	Cmm6600Service cmm6600Service;
	
	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
    @Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Map<String, String> selectReq4100JsonToMap(Map paramMap){
		Map rtnMap = new HashMap();
		for( Object key : paramMap.keySet() ) {
			String jsonVal = "";
			try{
				jsonVal = (String) paramMap.get(key);
			}catch(ClassCastException cce){	
				continue;
			}
			
			JSONObject jsonObj = null;
			
			
			try{
				JSONParser jsonParser = new JSONParser();
				jsonObj = (JSONObject) jsonParser.parse(jsonVal);
				rtnMap.put(key, jsonObj.get("optVal"));
			}catch(Exception e){
				rtnMap.put(key, jsonVal);
			}
		}
		return rtnMap;
	}
	
	
	@SuppressWarnings("rawtypes")
	public int  selectReq4100ReqListCnt(Map paramMap) throws Exception {
		return req4100DAO.selectReq4100ReqListCnt(paramMap);
	} 
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map>  selectReq4100ReqList(Map paramMap) throws Exception {
		return  req4100DAO.selectReq4100ReqList(paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public int  selectReq4100PrepListCnt(Map paramMap) throws Exception {
		return  req4100DAO.selectReq4100PrepListCnt(paramMap);
	} 
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map>  selectReq4100PrepList(Map paramMap) throws Exception {
		List<Map> list = req4100DAO.selectReq4100PrepList(paramMap);
		int total = req4100DAO.selectReq4100PrepListCnt(paramMap);
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).put("total", Integer.toString(total));
		}
		return list;
	}

	
	public String selectReq4100UserCheck(Map<String, String> paramMap) throws Exception{
		
		return req4100DAO.selectReq4100UserCheck(paramMap);
	}
	
	
	public String selectReq4100ReqPwCheck(Map<String, String> paramMap) throws Exception{
		
		String reqPw = req4100DAO.selectReq4100ReqPwInfo(paramMap);
		
		
		String enReqPw = EgovFileScrty.encryptPassword((String) paramMap.get("reqPw"), (String)paramMap.get("reqId"));
		
		
		String resultStr = "N";
		if(reqPw.equals(enReqPw)) {
			resultStr = "Y";
		}else {
			resultStr = "N";
		}
			
		return resultStr;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String insertReq4100ReqCopy(Map<String, String> paramMap) throws Exception{

		Map<String, String> convertParamMap = selectReq4100JsonToMap(paramMap);

		
    	Map prjInfo = req4100DAO.selectReq4100ReqPrjInfo(convertParamMap);
    	
		String prjAcrm = (String) prjInfo.get("prjAcrm");
		
		
		String prjId = (String)convertParamMap.get("prjId");
		
		
		String nextOrd = req4100DAO.selectReq4100NextReqOrd(convertParamMap);
		String newReqOrd = nextOrd;
		
		
		if(prjAcrm != null && !"".equals(prjAcrm)){
			newReqOrd = prjAcrm+"-"+nextOrd;
		}
		
		convertParamMap.put("reqOrd", newReqOrd);

		
		String insNewReqId = req4100DAO.insertReq4101ReqInfo(convertParamMap);
		
		
		if(insNewReqId == null || "".equals(insNewReqId)){
			throw new Exception(egovMessageSource.getMessage("fail.common.insert"));
		}

		
		String enReqKey = CommonScrty.encryptedAria(prjId, insNewReqId);
		
		Map<String, String> newReqMap = new HashMap<String, String>();
		
		newReqMap.put("prjId", prjId);
		newReqMap.put("reqId", insNewReqId);
		newReqMap.put("reqKey", enReqKey);
		
		
		req4100DAO.updateReq4101ReqKey(newReqMap);

		
		String reqPw = (String) convertParamMap.get("reqPw");
		if(reqPw != null && !reqPw.isEmpty()) {
			
			newReqMap.put("reqPw", EgovFileScrty.encryptPassword(reqPw, insNewReqId));
			
			
			req4100DAO.updateReq4101ReqPwInfo(newReqMap);
		}
		
		
		
		String oriAtchFileId = (String) convertParamMap.get("oriAtchFileId");
		String newAtchFileId = (String) convertParamMap.get("atchFileId");
		if(oriAtchFileId != null) {
			if(!oriAtchFileId.isEmpty()) {
				
				
            	FileVO fileVO = new FileVO();
            	
				fileVO.setAtchFileId(oriAtchFileId);
				
				List<FileVO> fileList = fileMngService.fileDownList(fileVO);
				
				
				List<FileVO> newFileList = null;
				
				
				String fileHistory = (String) paramMap.get("fileHistory");
				
				
				JSONParser jsonParser = new JSONParser();
				JSONArray jsonArray = (JSONArray) jsonParser.parse(fileHistory);

				
				for(int i=0;i<jsonArray.size();i++) {
					JSONObject jsonObj = (JSONObject) jsonArray.get(i);
					String source = (String) jsonObj.get("source"); 

					
					JSONObject fileMetaInfo = (JSONObject) jsonObj.get("meta");
					String fileSn = "";
					
					if("database".equals(source)) {
						fileSn = String.valueOf(fileMetaInfo.get("fileSn"));
						
        				
        				for(int j=0; j<fileList.size(); j++) {
        					String fileType = fileList.get(j).getFileType();
        					
        					
        					if(fileSn.equals(fileList.get(j).getFileSn()) && fileType.indexOf("image") == -1) {
        						
        						
                            	FileVO newFileVO = new FileVO();
        						
        						if(newFileList == null) {
        							newFileList = new ArrayList<FileVO>();
        						}
        						
        						newFileVO.setAtchFileId(newAtchFileId);
        						
        						newFileVO.setFileSn(fileSn);
        						
        						newFileVO.setFileCn(fileList.get(j).getFileCn());
        						
        						newFileVO.setFileExtsn(fileList.get(j).getFileExtsn());
        						
        						newFileVO.setFileMg(fileList.get(j).getFileMg());
        						
        						newFileVO.setFileStreCours(fileList.get(j).getFileStreCours());
        						
        						newFileVO.setOrignlFileNm(fileList.get(j).getOrignlFileNm());

        						
        						
        						String pattern = "yyyyMMddhhmmssSSS";
        						SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
        						Timestamp ts = new Timestamp(System.currentTimeMillis());
        						newFileVO.setStreFileNm(sdfCurrent.format(ts.getTime()));
        						
        						
        						newFileVO.setFileType(fileList.get(j).getFileType());
        						
        						newFileList.add(newFileVO);
        						
        						
        						File oriFile = new File(EgovWebUtil.filePathBlackList(fileList.get(j).getFileStreCours()+fileList.get(j).getStreFileNm()));
        						
        						File copyFile = new File(EgovWebUtil.filePathBlackList(newFileVO.getFileStreCours()+newFileVO.getStreFileNm()));
        						
        						try {
        							
        							FileInputStream inFile = new FileInputStream(oriFile);
        							
        							FileOutputStream outFile = new FileOutputStream(copyFile);
        							
        							int fileByte = 0;
        							
        							
        							while( (fileByte = inFile.read()) != -1) {
        								outFile.write(fileByte);
        							}
        							
        							inFile.close();
        							outFile.close();
        						}catch(Exception fileE){	
        							Log.error(fileE);
        						}
        					}
        				}
					}
				}
				if(newFileList != null && newFileList.size() > 0) {
					
					
					fileMngService.insertFileDetail(newFileList);
				}
			}
		}
		
		
		
		
		JSONParser jsonParser = new JSONParser();
		String basicItemList = (String) paramMap.get("basicItemList");
		String basicItemInsertList = (String) paramMap.get("basicItemInsertList");
		String basicItemDelList = (String) paramMap.get("basicItemDelList");
		JSONArray basicItemJsonArray = (JSONArray) (JSONArray) jsonParser.parse(basicItemList);;
		JSONArray basicItemInsertJsonArray = (JSONArray) jsonParser.parse(basicItemInsertList);
		JSONArray basicItemDelJsonArray = (JSONArray) jsonParser.parse(basicItemDelList);
		
		for(int idx=0;idx<basicItemJsonArray.size();idx++) {
			JSONObject itemInfo = (JSONObject) basicItemJsonArray.get(idx);
			Map itemMap = new Gson().fromJson(itemInfo.toString(), HashMap.class);
			itemMap.put("prjId", prjId);
			itemMap.put("reqId", insNewReqId);
			itemMap.put("licGrpId", paramMap.get("licGrpId"));
			itemMap.put("itemDivision", "04");
			itemMap.put("itemRequestCd", "01");

			prj1000Service.savePrj1003ItemAjax(itemMap);
		}
		
		for(int idx=0;idx<basicItemInsertJsonArray.size();idx++) {
			JSONObject itemInfo = (JSONObject) basicItemInsertJsonArray.get(idx);
			Map itemMap = new Gson().fromJson(itemInfo.toString(), HashMap.class);
			itemMap.put("prjId", prjId);
			itemMap.put("reqId", insNewReqId);
			itemMap.put("licGrpId", paramMap.get("licGrpId"));
			itemMap.put("itemDivision", "04");
			itemMap.put("itemRequestCd", "01");

			prj1000Service.savePrj1002ItemAjax(itemMap);
			prj1000Service.savePrj1003ItemAjax(itemMap);
		}
		
		for(int idx=0;idx<basicItemDelJsonArray.size();idx++) {
			JSONObject itemInfo = (JSONObject) basicItemDelJsonArray.get(idx);
			Map itemMap = new Gson().fromJson(itemInfo.toString(), HashMap.class);
			itemMap.put("prjId", prjId);
			itemMap.put("reqId", insNewReqId);
			itemMap.put("licGrpId", paramMap.get("licGrpId"));
			prj1000Service.deletePrj1002ItemInfoAjax(itemMap);
		}
		return insNewReqId;
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq4100ReqInfo(Map paramMap) throws Exception{
		return req4100DAO.selectReq4100ReqInfo(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Object saveReq4100ReqInfo(Map paramMap) throws Exception{

		JSONParser jsonParser = new JSONParser();
		
		Map<String, String> convertParamMap = selectReq4100JsonToMap(paramMap);

		
    	Map prjInfo = req4100DAO.selectReq4100ReqPrjInfo(convertParamMap);
    	
		String popupType	= convertParamMap.get("type");
		String prjAcrm = (String) prjInfo.get("prjAcrm");
		
		
		String prjId = (String)convertParamMap.get("prjId");
		
		
		if("insert".equals(popupType) ){
			
			String nextOrd = req4100DAO.selectReq4100NextReqOrd(convertParamMap);
			String newReqOrd = nextOrd;
			
			
			if(prjAcrm != null && !"".equals(prjAcrm)){
				newReqOrd = prjAcrm+"-"+nextOrd;
			}
			
			convertParamMap.put("reqOrd", newReqOrd);

			
			String insNewReqId = req4100DAO.insertReq4101ReqInfo(convertParamMap);
			
			
			
			if(insNewReqId == null || "".equals(insNewReqId)){
				throw new Exception(egovMessageSource.getMessage("fail.common.insert"));
			}
	
    		
    		String enReqKey = CommonScrty.encryptedAria(prjId, insNewReqId);
    		
			Map<String, String> newReqMap = new HashMap<String, String>();
			
			
			newReqMap.put("prjId", prjId);
			newReqMap.put("reqId", insNewReqId);
			newReqMap.put("reqKey", enReqKey);
			convertParamMap.put("reqId", insNewReqId);
			
    		
    		req4100DAO.updateReq4101ReqKey(newReqMap);

    		
    		if(!"".equals(convertParamMap.get("reqGrpId"))) {
    			
    			Integer reqLinkOrd = req3000DAO.selectReq3001ReqOrd(convertParamMap) + 1;
    			convertParamMap.put("reqLinkOrd", reqLinkOrd.toString());
    			req3000DAO.insertReq3001ReqGrpLinkReqInfo(convertParamMap);
    		}
    		
    		
    		String reqPw = (String) convertParamMap.get("reqPw");
    		if(reqPw != null && !reqPw.isEmpty()) {
    			
    			newReqMap.put("reqPw", EgovFileScrty.encryptPassword(reqPw, insNewReqId));
    			
    			
    			req4100DAO.updateReq4101ReqPwInfo(newReqMap);
    		}
    		
    		
    		
    		String basicItemList = (String) paramMap.get("basicItemList");
    		String basicItemInsertList = (String) paramMap.get("basicItemInsertList");
    		JSONArray basicItemJsonArray = (JSONArray) (JSONArray) jsonParser.parse(basicItemList);;
    		JSONArray basicItemInsertJsonArray = (JSONArray) jsonParser.parse(basicItemInsertList);
    		
    		for(int idx=0;idx<basicItemJsonArray.size();idx++) {
    			JSONObject itemInfo = (JSONObject) basicItemJsonArray.get(idx);
    			Map itemMap = new Gson().fromJson(itemInfo.toString(), HashMap.class);
    			itemMap.put("prjId", prjId);
    			itemMap.put("reqId", insNewReqId);
    			itemMap.put("licGrpId", paramMap.get("licGrpId"));
    			itemMap.put("itemDivision", "04");
    			itemMap.put("itemRequestCd", "01");

    			prj1000Service.savePrj1003ItemAjax(itemMap);
    		}
    		
    		for(int idx=0;idx<basicItemInsertJsonArray.size();idx++) {
    			JSONObject itemInfo = (JSONObject) basicItemInsertJsonArray.get(idx);
    			Map itemMap = new Gson().fromJson(itemInfo.toString(), HashMap.class);
    			itemMap.put("prjId", prjId);
    			itemMap.put("reqId", insNewReqId);
    			itemMap.put("licGrpId", paramMap.get("licGrpId"));
    			itemMap.put("itemDivision", "04");
    			itemMap.put("itemRequestCd", "01");

    			prj1000Service.savePrj1002ItemAjax(itemMap);
    			prj1000Service.savePrj1003ItemAjax(itemMap);
    		}
    		
			return insNewReqId;
		}
		
		else if("update".equals(popupType)){
			
			Map reqInfoMap = (Map) req4100DAO.selectReq4100ReqInfo(convertParamMap);		
			String reqProType = (String) reqInfoMap.get("reqProType");
			
			
			if(!"01".equals(reqProType)){
				throw new Exception(egovMessageSource.getMessage("fail.common.update"));
			}
			
			
			if(convertParamMap.get("reqGrpId") == null || !"".equals(convertParamMap.get("reqGrpId"))) {
				
				
				req3000DAO.deleteReq3001ReqCon(convertParamMap);
				
				
				List<Map> reqGrpLinkList = req3000DAO.selectReq3001ReqGrpLinkReqList(convertParamMap);
				for(Integer i = 1; i <= reqGrpLinkList.size(); i++) {
					Map requirement = reqGrpLinkList.get(i-1);
					requirement.put("reqOrd", i.toString());
					req3000DAO.updateReq3001ReqOrd(requirement);
				}
				
				
				Integer reqLinkOrd = req3000DAO.selectReq3001ReqOrd(convertParamMap) + 1;
				convertParamMap.put("reqLinkOrd", reqLinkOrd.toString());
				req3000DAO.insertReq3001ReqGrpLinkReqInfo(convertParamMap);
				
			}
			
			
			
			
			
			String reqPw = (String) convertParamMap.get("reqPw");
    		if(reqPw != null && !reqPw.isEmpty()) {
    			convertParamMap.put("changePw", "Y");
    			
    			
    			String enReqPw = EgovFileScrty.encryptPassword(reqPw, (String) reqInfoMap.get("reqId"));
				
				convertParamMap.put("reqPw", enReqPw);
    		}
			
			
			int uptCnt = req4100DAO.updateReq4101ReqInfo(convertParamMap);

			
			String atchFileId = (String) convertParamMap.get("atchFileId"); 
			
			
			String removeFileStr = (String) paramMap.get("fileHistory");
			
			JSONArray jsonArray = (JSONArray) jsonParser.parse(removeFileStr);
			
			List<String> removeFileSn = new ArrayList<String>();
			
			
			for(int i=0;i<jsonArray.size();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				
				String source = (String) jsonObj.get("source");
				
				
				if("remove".equals(source)) {
					
					JSONObject fileMetaInfo = (JSONObject) jsonObj.get("meta");
					Object fileSn;
					try {
						fileSn = (Long) fileMetaInfo.get("fileSn");
					}catch(ClassCastException cce) {
						fileSn = (String) fileMetaInfo.get("fileSn");
					}
				
					removeFileSn.add(String.valueOf(fileSn));
				}
			}
			
			FileVO fileVo = new FileVO();
			fileVo.setAtchFileId(atchFileId);
			
			List<FileVO> selFileList = fileMngDAO.selectFileInfs(fileVo);
			
			
			for(FileVO fileInfo : selFileList) {
				String fileSn = fileInfo.getFileSn();
				
				
				if(removeFileSn.indexOf(fileSn) != -1) {
					
					fileMngDAO.deleteFileInf(fileInfo);
					
					
					try{
						
						String fileDeletePath  = fileInfo.getFileStreCours()+fileInfo.getStreFileNm();
					    EgovFileMngUtil.deleteFile(fileDeletePath);
					}catch(Exception fileE){	
						Log.error(fileE);
					}
				}
			}
			
			
    		
    		String basicItemList = (String) paramMap.get("basicItemList");
    		String basicItemInsertList = (String) paramMap.get("basicItemInsertList");
    		String basicItemDelList = (String) paramMap.get("basicItemDelList");
    		JSONArray basicItemJsonArray = (JSONArray) (JSONArray) jsonParser.parse(basicItemList);;
    		JSONArray basicItemInsertJsonArray = (JSONArray) jsonParser.parse(basicItemInsertList);
    		JSONArray basicItemDelJsonArray = (JSONArray) jsonParser.parse(basicItemDelList);
    		
    		for(int idx=0;idx<basicItemJsonArray.size();idx++) {
    			JSONObject itemInfo = (JSONObject) basicItemJsonArray.get(idx);
    			Map itemMap = new Gson().fromJson(itemInfo.toString(), HashMap.class);
    			itemMap.put("prjId", prjId);
    			itemMap.put("reqId", reqInfoMap.get("reqId"));
    			itemMap.put("licGrpId", paramMap.get("licGrpId"));
    			itemMap.put("itemDivision", "04");
    			itemMap.put("itemRequestCd", "01");

    			prj1000Service.savePrj1003ItemAjax(itemMap);
    		}
    		
    		for(int idx=0;idx<basicItemInsertJsonArray.size();idx++) {
    			JSONObject itemInfo = (JSONObject) basicItemInsertJsonArray.get(idx);
    			Map itemMap = new Gson().fromJson(itemInfo.toString(), HashMap.class);
    			itemMap.put("prjId", prjId);
    			itemMap.put("reqId", reqInfoMap.get("reqId"));
    			itemMap.put("licGrpId", paramMap.get("licGrpId"));
    			itemMap.put("itemDivision", "04");
    			itemMap.put("itemRequestCd", "01");

    			prj1000Service.savePrj1002ItemAjax(itemMap);
    			prj1000Service.savePrj1003ItemAjax(itemMap);
    		}
    		
    		for(int idx=0;idx<basicItemDelJsonArray.size();idx++) {
    			JSONObject itemInfo = (JSONObject) basicItemDelJsonArray.get(idx);
    			Map itemMap = new Gson().fromJson(itemInfo.toString(), HashMap.class);
    			itemMap.put("prjId", prjId);
    			itemMap.put("reqId", reqInfoMap.get("reqId"));
    			itemMap.put("licGrpId", paramMap.get("licGrpId"));
    			prj1000Service.deletePrj1002ItemInfoAjax(itemMap);
    		}
			
			
			if(uptCnt == 0 ){
				throw new Exception(egovMessageSource.getMessage("fail.common.update"));
			}
			return uptCnt;
		}

		return false;
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void deleteReq4100ReqList(Map<String, String> paramMap)  throws Exception{
		
		String deleteDataList = paramMap.get("deleteDataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);

		
		List<FileVO> removeFileList = new ArrayList();
		
		
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			String reqProType = (String) infoMap.get("reqProType");
			
			
			if( !"01".equals(reqProType) ){
				
				throw new UserDefineException(egovMessageSource.getMessage("처리중인 요구사항은 삭제 불가"));
			}

			
			req4100DAO.deleteReq4100ReqInfo(infoMap);
			
			
			req3000DAO.deleteReq3001ReqCon(infoMap);
			
			
			List<Map> reqGrpLinkList = req3000DAO.selectReq3001ReqGrpLinkReqList(infoMap);
			for(Integer index = 1; index <= reqGrpLinkList.size(); index++) {
				Map requirement = reqGrpLinkList.get(index-1);
				requirement.put("reqOrd", index.toString());
				req3000DAO.updateReq3001ReqOrd(requirement);
			}
			
			
			String atchFileId = (String) infoMap.get("atchFileId");
			
			
        	FileVO fileVO = new FileVO();
        	fileVO.setAtchFileId(atchFileId);
        	
        	
			List<FileVO> fileList = fileMngService.fileDownList(fileVO);
			
			if(fileList.size() > 0) {
				removeFileList.addAll(fileList);
			}
		}
		
		if(removeFileList.size() > 0) {
			
			for(FileVO fileInfo : removeFileList) {
				
				fileMngDAO.deleteFileInf(fileInfo);
				
				
				try{
					
					String fileDeletePath  = fileInfo.getFileStreCours()+fileInfo.getStreFileNm();
				    EgovFileMngUtil.deleteFile(fileDeletePath);
				}catch(Exception fileE){	
					Log.error(fileE);
				}
			}
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateReq4100ReqRejectList(Map paramMap) throws Exception{
		
		String licGrpId = (String) paramMap.get("licGrpId");
		String regUsrId = (String) paramMap.get("regUsrId");
		String regUsrIp = (String) paramMap.get("regUsrIp");
		
		
		String paramRejectContents = (String) paramMap.get("paramRejectContents");
		paramMap.put("reqAcceptTxt", paramRejectContents);
		
		
		String paramRejectReqList = (String) paramMap.get("paramRejectReqList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(paramRejectReqList);
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject reqInfo = (JSONObject) jsonArray.get(i);
			
			
			String prjId = (String) reqInfo.get("prjId");
			String reqId = (String) reqInfo.get("reqId");
			
			
			paramMap.put("prjId", prjId);
			paramMap.put("reqId", reqId);
			req4100DAO.updateReq4100ReqRejectInfo(paramMap);
			
			
			Req6001VO req6001Vo = new Req6001VO(licGrpId, prjId, reqId, "04");
			req6001Vo.setChgUsrId(regUsrId);
			req6001Vo.setRegUsrId(regUsrId);
			req6001Vo.setRegUsrIp(regUsrIp);
			req6001Vo.setModifyUsrId(regUsrId);
			req6001Vo.setModifyUsrIp(regUsrIp);
			
			paramMap.put("req6001Vo", req6001Vo);
			req6000Service.insertReq6001ReqChgInfo(paramMap);
			
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateReq4100ReqAcceptList(Map paramMap) throws Exception{
		
		String licGrpId = (String) paramMap.get("licGrpId");
		String regUsrId = (String) paramMap.get("regUsrId");
		
		
		String defaultSwitchCd = (String) paramMap.get("defaultSwitchCd");
		
		String selReqChargerId = (String) paramMap.get("selReqChargerId");
		
		
		if("02".equals(defaultSwitchCd)) {
			
			if(selReqChargerId != null && !"".equals(selReqChargerId)) {
				paramMap.put("reqChargerId", selReqChargerId);
			}
		}
		
		
		String processId = (String) paramMap.get("selProcessId");
		
		
		paramMap.put("processId", processId);
		paramMap.put("flowStartCd", "01");
		Map startFlowInfo = prj1100DAO.selectPrj1101FlowInfo(paramMap);
		
		
		if(startFlowInfo == null || startFlowInfo.isEmpty()) {
			throw new UserDefineException("프로세스 데이터 조회에 실패했습니다.");
		}
		
		
		String flowId = (String) startFlowInfo.get("flowId");
		paramMap.put("flowId", flowId);
		
		
		String reqAcceptTxt = (String) paramMap.get("reqAcceptTxt");
		paramMap.put("reqAcceptTxt", reqAcceptTxt);
		
		
		String paramSelReqInfoList = (String) paramMap.get("paramSelReqInfoList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(paramSelReqInfoList);
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject reqInfo = (JSONObject) jsonArray.get(i);
			
			
			String prjId = (String) reqInfo.get("prjId");
			String reqId = (String) reqInfo.get("reqId");
			
			
			paramMap.put("prjId", prjId);
			paramMap.put("reqId", reqId);
			
			
			Req6001VO req6001Vo = new Req6001VO(licGrpId, prjId, reqId, "03");
			req6001Vo.setChgProcessId(processId);
			req6001Vo.setChgFlowId(flowId);
			req6001Vo.setChgUsrId(regUsrId);
			
			
			if("02".equals(defaultSwitchCd)) {
				req6001Vo.setChgChargerId(selReqChargerId);
			}
			
			else {
				
				Map selReqInfo = req4100DAO.selectReq4100ReqInfo(paramMap);
				if(selReqInfo != null) {
					String reqChargerId = (String) selReqInfo.get("reqChargerId");
					req6001Vo.setChgChargerId(reqChargerId);
					paramMap.put("reqChargerId", reqChargerId);
				}
			}
			
			
			req4100DAO.updateReq4100ReqAcceptInfo(paramMap);
			
			paramMap.put("req6001Vo", req6001Vo);
			req6000Service.insertReq6001ReqChgInfo(paramMap);
			

			
			
			String basicItemList = (String) paramMap.get("basicItemList");
			String basicItemInsertList = (String) paramMap.get("basicItemInsertList");
			
			
			
			JSONArray basicItemJsonArray = (JSONArray) jsonParser.parse(basicItemList);
			JSONArray basicItemInsertJsonArray = (JSONArray) jsonParser.parse(basicItemInsertList);
			
			
			
			for(int idx=0;idx<basicItemJsonArray.size();idx++) {
				JSONObject itemInfo = (JSONObject) basicItemJsonArray.get(idx);
				Map itemMap = new Gson().fromJson(itemInfo.toString(), HashMap.class);
    			itemMap.put("processId", processId);
    			itemMap.put("flowId", paramMap.get("selFlowId"));
    			itemMap.put("prjId", prjId);
    			itemMap.put("reqId", reqId);
    			itemMap.put("licGrpId", paramMap.get("licGrpId"));
				prj1300Service.savePrj1103ItemAjax(itemMap);
			}
			
			
			for(int idx=0;idx<basicItemInsertJsonArray.size();idx++) {
				JSONObject itemInfo = (JSONObject) basicItemInsertJsonArray.get(idx);
				Map itemMap = new Gson().fromJson(itemInfo.toString(), HashMap.class);
    			itemMap.put("processId", processId);
    			itemMap.put("flowId", paramMap.get("selFlowId"));
    			itemMap.put("prjId", prjId);
    			itemMap.put("reqId", reqId);
    			itemMap.put("licGrpId", paramMap.get("licGrpId"));
    			itemMap.put("itemDivision", "02");

    			prj1300Service.savePrj1102ItemAjax(itemMap);
    			prj1300Service.savePrj1103ItemAjax(itemMap);
			}
			
			
		}
	}
	

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateReq4100ReqSignRejectInfo(Map paramMap) throws Exception{
		
		paramMap.put("reqSignCd", "03");
		paramMap.put("targetCd", "01");
		paramMap.put("targetId", paramMap.get("reqId"));
		paramMap.put("signUsrId", paramMap.get("regUsrId"));
		paramMap.put("signTypeCd", "03");
		
		
		cmm6600Service.insertCmm6601SignLogInfo(paramMap);
		
		
		
		
		req4100DAO.updateReq4101ReqProcessInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateReq4100ReqSignAcceptInfo(Map paramMap) throws Exception{
		
		String licGrpId = (String) paramMap.get("licGrpId");
		String prjId = (String) paramMap.get("prjId");
		String reqId = (String) paramMap.get("reqId");
		String regUsrId = (String) paramMap.get("regUsrId");
		String regUsrIp = (String) paramMap.get("regUsrIp");
		
		
		Map reqInfo = (Map) req4100DAO.selectReq4100ReqInfo(paramMap);
		
		
		String reqSignProcessId = (String) reqInfo.get("reqSignProcessId");
		String reqSignFlowId = (String) reqInfo.get("reqSignFlowId");
		String reqSignOrd = String.valueOf(reqInfo.get("reqSignOrd"));
		String processId = (String) reqInfo.get("processId");
		String flowId = (String) reqInfo.get("flowId");
		
		
		paramMap.put("reqSignCd", "02");
		paramMap.put("targetCd", "01");
		paramMap.put("targetId", paramMap.get("reqId"));
		paramMap.put("signUsrId", paramMap.get("regUsrId"));
		paramMap.put("signTypeCd", "02");
		paramMap.put("ord", reqSignOrd);
		paramMap.put("reqSignOrd", (Integer.parseInt(reqSignOrd)+1));
		
		
		paramMap.put("subTargetFstId", processId);
		paramMap.put("subTargetScdId", flowId);
		
		
		int signDoneOrd = cmm6600Service.select6600MaxOrd(paramMap);
		
		
		cmm6600Service.insertCmm6601SignLogInfo(paramMap);
		
		
		if(String.valueOf(signDoneOrd).equals(reqSignOrd)) {
			
			paramMap.put("reqSignCd", "04");
			paramMap.put("reqSignOrd", "0");
			paramMap.put("processId", reqSignProcessId);
			paramMap.put("flowId", reqSignFlowId);
			
			
			Map selFlowInfo = prj1100DAO.selectPrj1101FlowInfo(paramMap);
			
			
			String selFlowDoneCd = (String) selFlowInfo.get("flowDoneCd");
			if("01".equals(selFlowDoneCd)) {
				
				paramMap.put("reqProType", "04");
			}
			
			
			String reqChargerId = (String) reqInfo.get("reqChargerId");
			
			
			Req6001VO req6001Vo = new Req6001VO(licGrpId, prjId, reqId, "01", flowId, reqSignFlowId, reqChargerId);
			req6001Vo.setPreProcessId(processId);
			req6001Vo.setChgProcessId(reqSignProcessId);
			req6001Vo.setRegUsrId(regUsrId);
			req6001Vo.setRegUsrIp(regUsrIp);
			req6001Vo.setModifyUsrId(regUsrId);
			req6001Vo.setModifyUsrIp(regUsrIp);
			
			paramMap.put("req6001Vo", req6001Vo);
			req6000Service.insertReq6001ReqChgInfo(paramMap);
		}
		
		
		req4100DAO.updateReq4101ReqProcessInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateReq4101ReqSubInfo(Map paramMap) throws Exception{
		req4100DAO.updateReq4101ReqSubInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq4100ReqUserInfo(Map paramMap) throws Exception {
		return	req4100DAO.selectReq4100ReqUserInfo(paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq4100ReqPrjInfo(Map paramMap) throws Exception {
		return	req4100DAO.selectReq4100ReqPrjInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectReq4100IntegratedDshAcceptReqList(Map paramMap) throws Exception {
		return req4100DAO.selectReq4100IntegratedDshAcceptReqList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectReq4100IntegratedDshAcceptReqListCnt(Map paramMap) throws Exception {
		 return req4100DAO.selectReq4100IntegratedDshAcceptReqListCnt(paramMap);
	} 
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectReq4100ReqProTypeOrdList(Map paramMap) throws Exception {
		
		return req4100DAO.selectReq4100ReqProTypeOrdList(paramMap);
	} 
	
	
	@SuppressWarnings("rawtypes")
	public int  selectReq4100ChargeReqListCnt(Map paramMap) throws Exception {
		return req4100DAO.selectReq4100ChargeReqListCnt(paramMap);
	} 
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map>  selectReq4100ChargeReqList(Map paramMap) throws Exception {
		return  req4100DAO.selectReq4100ChargeReqList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void saveReq4100ReqProcessActionInfo(Map paramMap) throws Exception {
		
		String licGrpId = (String) paramMap.get("licGrpId");
		String prjId = (String) paramMap.get("prjId");
		String reqId = (String) paramMap.get("reqId");
		String regUsrId = (String) paramMap.get("regUsrId");
		String regUsrIp = (String) paramMap.get("regUsrIp");

		JSONParser jsonParser = new JSONParser();

		
		
		String basicItemList = (String) paramMap.get("basicItemList");
		String basicItemInsertList = (String) paramMap.get("basicItemInsertList");
		String basicItemDelList = (String) paramMap.get("basicItemDelList");
		
		
		JSONArray basicItemJsonArray = (JSONArray) jsonParser.parse(basicItemList);
		JSONArray basicItemInsertJsonArray = (JSONArray) jsonParser.parse(basicItemInsertList);
		JSONArray basicItemDelJsonArray = (JSONArray) jsonParser.parse(basicItemDelList);
		
		
		String signRequiredCd = (String) paramMap.get("signRequiredCd");
		
		
		Map beforeReqInfo = req4100DAO.selectReq4100ReqInfo(paramMap);
		
		
		String beforeReqChargerId = (String) beforeReqInfo.get("reqChargerId");
		
		String beforeFlowId = (String) beforeReqInfo.get("flowId");
		
		
		String processId = (String) paramMap.get("processId");
		
		String selFlowId = (String) paramMap.get("selFlowId");
		paramMap.put("processId", processId);
		paramMap.put("flowId", selFlowId);
		
		
		Map selFlowInfo = prj1100DAO.selectPrj1101FlowInfo(paramMap);
		
		
		String selFlowDoneCd = (String) selFlowInfo.get("flowDoneCd");
		
		if("01".equals(selFlowDoneCd) && !"01".equals(signRequiredCd)) {
			
			paramMap.put("reqProType", "04");
		}
		
		
		String reqChargerId = (String) paramMap.get("reqChargerId");
		
		
		if(!reqChargerId.equals(beforeReqChargerId)) {
			
			Req6001VO req6001Vo = new Req6001VO(licGrpId, prjId, reqId, "02", beforeReqChargerId, reqChargerId, regUsrId);
			req6001Vo.setRegUsrId(regUsrId);
			req6001Vo.setRegUsrIp(regUsrIp);
			req6001Vo.setModifyUsrId(regUsrId);
			req6001Vo.setModifyUsrIp(regUsrIp);
			
			paramMap.put("req6001Vo", req6001Vo);
			req6000Service.insertReq6001ReqChgInfo(paramMap);
		}
		
		
		
		if(!beforeFlowId.equals(selFlowId) && !"01".equals(signRequiredCd)) {
			
			Req6001VO req6001Vo = new Req6001VO(licGrpId, prjId, reqId, "01", beforeFlowId, selFlowId, regUsrId);
			req6001Vo.setPreProcessId(processId);
			req6001Vo.setChgProcessId(processId);
			req6001Vo.setRegUsrId(regUsrId);
			req6001Vo.setRegUsrIp(regUsrIp);
			req6001Vo.setModifyUsrId(regUsrId);
			req6001Vo.setModifyUsrIp(regUsrIp);
			
			paramMap.put("req6001Vo", req6001Vo);
			req6000Service.insertReq6001ReqChgInfo(paramMap);
		}
		
		
		if("01".equals(signRequiredCd)) {
			Map newMap = new HashMap<>();
			
			
			if(!beforeFlowId.equals(selFlowId)) {
				
				paramMap.put("reqSignCd", "01");
				paramMap.put("reqSignOrd", "1");
			}
			
			newMap.put("type", "update");
			newMap.put("signUsrInfList", paramMap.get("signUsrList"));
			newMap.put("targetId", beforeReqInfo.get("reqId"));
			newMap.put("targetCd", "01");	
			newMap.put("targetNm", beforeReqInfo.get("reqNm"));
			newMap.put("subTargetFstId", processId);
			newMap.put("subTargetScdId", beforeFlowId);

			
			newMap.put("licGrpId", licGrpId);
			newMap.put("prjId", prjId);
			newMap.put("regUsrId", regUsrId);
			newMap.put("regUsrIp", regUsrIp);
			newMap.put("modifyUsrId", regUsrId);
			newMap.put("modifyUsrIp", regUsrIp);
			
			
			cmm6600Service.saveCmm6600SignLine(newMap);
			
			
			paramMap.put("reqSignProcessId", processId);
			paramMap.put("reqSignFlowId", selFlowId);
			paramMap.remove("processId");
			paramMap.remove("flowId");
		}
		
		
		req4100DAO.updateReq4101ReqProcessInfo(paramMap);
		
		
		for(int idx=0;idx<basicItemJsonArray.size();idx++) {
			JSONObject itemInfo = (JSONObject) basicItemJsonArray.get(idx);
			Map itemMap = new Gson().fromJson(itemInfo.toString(), HashMap.class);
			itemMap.put("processId", processId);
			itemMap.put("flowId", beforeFlowId);
			itemMap.put("prjId", prjId);
			itemMap.put("reqId", reqId);
			itemMap.put("licGrpId", paramMap.get("licGrpId"));
			prj1300Service.savePrj1103ItemAjax(itemMap);
		}
		
		
		for(int idx=0;idx<basicItemInsertJsonArray.size();idx++) {
			JSONObject itemInfo = (JSONObject) basicItemInsertJsonArray.get(idx);
			Map itemMap = new Gson().fromJson(itemInfo.toString(), HashMap.class);
			itemMap.put("processId", processId);
			itemMap.put("flowId", beforeFlowId);
			itemMap.put("prjId", prjId);
			itemMap.put("reqId", reqId);
			itemMap.put("licGrpId", paramMap.get("licGrpId"));
			itemMap.put("itemDivision", "02");

			prj1300Service.savePrj1102ItemAjax(itemMap);
			prj1300Service.savePrj1103ItemAjax(itemMap);
		}

		
		for(int idx=0;idx<basicItemDelJsonArray.size();idx++) {
			JSONObject itemInfo = (JSONObject) basicItemDelJsonArray.get(idx);
			Map itemMap = new Gson().fromJson(itemInfo.toString(), HashMap.class);
			itemMap.put("processId", processId);
			itemMap.put("flowId", beforeFlowId);
			itemMap.put("prjId", prjId);
			itemMap.put("reqId", reqId);
			itemMap.put("licGrpId", paramMap.get("licGrpId"));
			prj1300Service.deletePrj1103ItemAjax(itemMap);
			prj1300Service.deletePrj1102ItemInfoAjax(itemMap);
		}
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectReq4100FlowInfoAjax(Map paramMap) throws Exception{
		return req4100DAO.selectReq4100FlowInfoAjax(paramMap);
	}
	
}
