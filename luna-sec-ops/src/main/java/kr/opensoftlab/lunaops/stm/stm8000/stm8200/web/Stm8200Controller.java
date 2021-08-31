package kr.opensoftlab.lunaops.stm.stm8000.stm8200.web;

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
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm8000.stm8200.service.Stm8200Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;

/**
 * @Class Name : Stm8200Controller.java
 * @Description : Stm8200Controller Controller class
 * @Modification Information
 *
 * @author 안지혜
 * @since 2020.10.31
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
public class Stm8200Controller {

	/** 로그4j 로거 로딩 */
	private static final Logger Log = Logger.getLogger(Stm8200Controller.class);

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	/** Stm8200Service DI */
	@Resource(name = "stm8200Service")
	private Stm8200Service stm8200Service;
	
	
	/**
	 * Stm8200 소스저장소 전체 배정 현황 목록 화면
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @exception Exception
	 * @author 안지혜
	 * @since 2020.10.31
	 */
	@RequestMapping(value="/stm/stm8000/stm8200/selectStm8200View.do")
	public String selectStm8200View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm8000/stm8200/stm8200";
	}
	
	/**
	 * Stm8200 소스저장소 전체 배정 현황 목록 Ajax 조회
	 * 
	 * @throws Exception
	 * @author 안지혜
	 * @since 2020.10.31
	 */
	@SuppressWarnings( { "rawtypes", "unchecked" } )
	@RequestMapping(value="/stm/stm8000/stm8200/selectStm8200AssStrgListAjax.do")
	public ModelAndView selectStm8200AssStrgListAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			// 세션에서 필요 정보 가져오기
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			//정렬 Key있는경우 underScope로 변경
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			// 페이지 정보 세팅
			// 현재 페이지 값, 보여지는 개체 수, 전체 데이터 건수
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			// 총 데이터 개수
			int totCnt = stm8200Service.selectStm8200AssRepAllListCnt(paramMap);

			// 페이지 사이즈
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			// 총 페이지 개수
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			// 페이지 정보 세팅
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
						
			// 소스 저장소 목록 가져오기
			List<Map> stm8200List = stm8200Service.selectStm8200AssRepAllList(paramMap);
			
			//sort 정보
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			// 페이지 세팅하기
			model.addAttribute("data", stm8200List);
			model.addAttribute("meta", metaMap);

			// 조회성공 여부 및 조회 성공메시지 세팅
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8200AssStrgListAjax()", ex);
			// 조회 실패여부 및 실패메시지 세팅
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
}
