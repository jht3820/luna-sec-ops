package kr.opensoftlab.lunaops.cmm.cmm6000.cmm6600.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.cmm.cmm6000.cmm6600.service.Cmm6600Service;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;



@Service("cmm6600Service")
public class Cmm6600ServiceImpl extends EgovAbstractServiceImpl implements Cmm6600Service {

	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;
	
   	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;

   	@Resource(name = "cmm6600DAO")
   	private Cmm6600DAO cmm6600DAO;
   	
   	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectCmm6600SignUsrList(Map<String, String> paramMap) throws Exception {
		return cmm6600DAO.selectCmm6600SignUsrList(paramMap);
	}

	
	@Override
	public void saveCmm6600SignLine(Map<String, String> paramMap) throws Exception {
		
		String singUsrInfList = (String) paramMap.get("signUsrInfList");
		
		
		if("update".equals(paramMap.get("type"))) {
			cmm6600DAO.deleteCmm6600SignLine(paramMap);
		}
		
		if(singUsrInfList != null && !"[]".equals(singUsrInfList)) {
			
			JSONArray jsonArray = new JSONArray(singUsrInfList);
			
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				
				paramMap.put("signUsrId", jsonObj.getString("usrId"));
				paramMap.put("ord", jsonObj.getString("ord"));
				
				
				cmm6600DAO.insertCmm6600SignLine(paramMap);
				
				
				if("0".equals(paramMap.get("ord"))) {
					paramMap.put("signTypeCd", "01");
					cmm6600DAO.insertCmm6601SignInfo(paramMap);
				}
			}
		}
		
	}

	
	@Override
	public int selectCmm6600SignListCnt(Map<String, String> paramMap) throws Exception {
		return cmm6600DAO.selectCmm6600SignListCnt(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectCmm6600SignList(Map<String, String> paramMap) throws Exception {
		return cmm6600DAO.selectCmm6600SignList(paramMap);
	}

	
	@Override
	public int selectCmm6600UsrSignListCnt(Map<String, String> paramMap) throws Exception {
		return cmm6600DAO.selectCmm6600UsrSignListCnt(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<Map> selectCmm6600UsrSignList(Map<String, String> paramMap) throws Exception {
		return cmm6600DAO.selectCmm6600UsrSignList(paramMap);
	}

	
	@Override
	public void insertCmm6601SignInfo(Map<String, String> paramMap) throws Exception {
		String rowDatas = paramMap.get("rowDatas");
		
		if(rowDatas != null && !"[]".equals(rowDatas)) {
			
			JSONArray jsonArray = new JSONArray(rowDatas);
			
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				
				
				int ord = Integer.parseInt(jsonObj.getString("ord")) +1;
				
				paramMap.put("ord", String.valueOf(ord));
				paramMap.put("targetId", jsonObj.getString("dplId"));
				
				
				if("signRjt".equals(paramMap.get("type"))) {
					paramMap.put("signTypeCd", "04");
				
				
				}else if("signApr".equals(paramMap.get("type"))) {
					
					int maxOrd = cmm6600DAO.selectCmm6600MaxOrd(paramMap);
					
					
					if(maxOrd == ord) {
						paramMap.put("signTypeCd", "03");
					
					
					}else {
						paramMap.put("signTypeCd", "02");
					}
				}
				
				
				cmm6600DAO.insertCmm6601SignInfo(paramMap);
				
			}
		}
	}

}








