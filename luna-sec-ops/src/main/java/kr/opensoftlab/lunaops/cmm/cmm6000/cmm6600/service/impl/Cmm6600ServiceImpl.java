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
			}
		}
		
	}

}








