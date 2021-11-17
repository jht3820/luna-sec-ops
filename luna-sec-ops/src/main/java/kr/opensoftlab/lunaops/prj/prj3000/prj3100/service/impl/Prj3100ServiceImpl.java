package kr.opensoftlab.lunaops.prj.prj3000.prj3100.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.prj.prj3000.prj3100.service.Prj3100Service;


@Service("prj3100Service")
public class Prj3100ServiceImpl extends EgovAbstractServiceImpl implements Prj3100Service{
	
	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name = "prj3100DAO")
	private Prj3100DAO prj3100DAO;
	
	@SuppressWarnings("unchecked")
	@Override
	public void deletePrj3100File(Map<String, String> paramMap) throws Exception {

		FileVO fileVo = new FileVO();
		fileVo.setAtchFileId(paramMap.get("atchFileId"));
		fileVo.setFileSn(paramMap.get("fileSn"));
		fileVo = fileMngDAO.selectFileInf(fileVo);
		
		String fileType = paramMap.get("fileType");
		
		if("atchFile".equals(fileType)) {
			
			
			Map<String, String> fileMap = prj3100DAO.selectPrj3001CngInf(paramMap);
			
			fileMap.putAll(paramMap);
			
			
			fileMap.put("ord", "-1");
			fileMap.put("infType", "05");
			
			
			prj3100DAO.insertPrj3001CngInf(fileMap);
		}
		
		
		fileMngDAO.deleteFileInf(fileVo);
		
		
		String fileDeletePath = fileVo.getFileStreCours() + fileVo.getStreFileNm();
		EgovFileMngUtil.deleteFile(fileDeletePath);
		
		
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public void updatePrj3100FileType(Map<String, String> paramMap) throws Exception {
		
		String updateType = paramMap.get("updateType");
		String signUseCd = paramMap.get("signUseCd");
		
		
		if("atchFile".equals(updateType)) {
			
			Map<String, String> fileMap = prj3100DAO.selectPrj3001CngInf(paramMap);
			
			fileMap.putAll(paramMap);
			
			
			fileMap.put("ord", "-1");
			fileMap.put("infType", "05");
			
			
			prj3100DAO.insertPrj3001CngInf(fileMap);
		}
		
		
		prj3100DAO.updatePrj3100FileType(paramMap);
		
		
		if("waitFile".equals(updateType)) {
			
			FileVO fileVO = new FileVO();
			
			
			fileVO.setAtchFileId(paramMap.get("afterFileId"));
			fileVO.setFileSn(paramMap.get("afterFileSn"));
			fileVO = fileMngDAO.selectFileInf(fileVO);
			
			paramMap.put("fileSn", fileVO.getFileSn());
			paramMap.put("fileStreCours", fileVO.getFileStreCours());
			paramMap.put("streFileNm", fileVO.getStreFileNm());
			paramMap.put("orignlFileNm", fileVO.getOrignlFileNm());
			paramMap.put("fileExtsn", fileVO.getFileExtsn());
			paramMap.put("fileType", fileVO.getFileType());
			paramMap.put("fileSize", fileVO.getFileMg());
			
			String infType = "";
			
			
			if("01".equals(signUseCd)) {
				
				infType = "02";
				paramMap.put("infType", infType);

				
				paramMap.put("ord", "0");
				prj3100DAO.insertPrj3001CngInf(paramMap);
				
				
				paramMap.put("ord", "1");
				
			
			}else if("02".equals(signUseCd)) {
				
				infType = "01";
				
				paramMap.put("infType", infType);
				
			}
			
			
			
			prj3100DAO.insertPrj3001CngInf(paramMap);
		}
		
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public List selectPrj3100MenuTree(Map<String, String> paramMap) throws Exception {
		return prj3100DAO.selectPrj3100MenuTree(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectPrj3001CngInf(Map<String, String> paramMap) throws Exception {
		return prj3100DAO.selectPrj3001CngInf(paramMap);
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public void insertPrj3100FileUpload(Map<String, String> paramMap, List<FileVO> _result) throws Exception {
		
		
		fileMngDAO.insertFileDetail(_result);
		
		
		if("atchFile".equals(paramMap.get("insertType"))) {
			
			FileVO fileVO = new FileVO();
			fileVO.setAtchFileId(paramMap.get("atchFileId"));
			
			for(FileVO fvo : _result) {
					
				fileVO.setFileSn(fvo.getFileSn());
				
				
				fileVO = fileMngDAO.selectFileInf(fileVO);
				
				
				Map<String, String> fileMap = BeanUtils.describe(fileVO);
				
				paramMap.putAll(fileMap);
				paramMap.put("fileSize", fileVO.getFileMg());
				
				String infType = "";
				String signUseCd = paramMap.get("signUseCd");
				
				
				if("01".equals(signUseCd)) {
					
					infType = "02";

					paramMap.put("infType", infType);
					
					
					paramMap.put("ord", "0");
					prj3100DAO.insertPrj3001CngInf(paramMap);
					
					
					paramMap.put("ord", "1");
				
				}else if("02".equals(signUseCd)) {
					
					
					infType = "01";
					
					paramMap.put("infType", infType);
					
					
				}
				
				
				
				prj3100DAO.insertPrj3001CngInf(paramMap);
			}
		}
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPrj3001CngInfList(Map<String, String> paramMap) throws Exception {
		return prj3100DAO.selectPrj3001CngInfList(paramMap);
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public void updatePrj3001SignApr(Map<String, String> paramMap) throws Exception {
		String checkedFileSn = (String) paramMap.get("deleteDataList");
		
		int maxOrd = prj3100DAO.selectPrj3001MaxOrd(paramMap);
		int ord = Integer.parseInt(paramMap.get("ord"));
		
		
		
		if(checkedFileSn != null && !"[]".equals(checkedFileSn)) {
			
			JSONArray jsonArray = new JSONArray(checkedFileSn);
			
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				
				paramMap.put("fileSn", jsonObj.getString("fileSn"));
				
				
				Map<String, String> fileMap = prj3100DAO.selectPrj3001CngInf(paramMap);
				
				
				fileMap.putAll(paramMap);
				
				
				if(maxOrd == ord) {
					
					fileMap.put("ord", "-1");
					fileMap.put("infType", "03");
				}
				else {
					
					fileMap.put("ord", String.valueOf(ord + 1));
					fileMap.put("infType", "02");
				}
				
				
				prj3100DAO.insertPrj3001CngInf(fileMap);
				
				
				if(maxOrd == ord) {
					
					
					fileMap.put("ord", "-1");
					fileMap.put("infType", "01");
					
					
					prj3100DAO.insertPrj3001CngInf(fileMap);
				}
			}
		}
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public void updatePrj3001SignRjt(Map<String, String> paramMap) throws Exception {

		String checkedFileSn = (String) paramMap.get("checkedFiles");

		String[] checkFileArr = checkedFileSn.split(",");
		
		if(checkFileArr != null) {
			
			for(String fileSn : checkFileArr) {
				paramMap.put("fileSn", fileSn);
				
				
				Map<String, String> fileMap = prj3100DAO.selectPrj3001CngInf(paramMap);
				
				fileMap.putAll(paramMap);
				
				
				fileMap.put("ord", "-1");
				fileMap.put("infType", "04");
				
				
				prj3100DAO.insertPrj3001CngInf(fileMap);
			}
		}
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public List selectPrj3100DocList(Map<String, String> paramMap) throws Exception {
		return prj3100DAO.selectPrj3100Prj3100DocList(paramMap);
	}
}
