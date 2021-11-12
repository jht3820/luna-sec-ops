package kr.opensoftlab.lunaops.req.req6000.req6000.vo;

import kr.opensoftlab.lunaops.com.vo.DefaultVO;





public class Req6001VO extends DefaultVO {
	private String rn;
	
	
	private String licGrpId;
	
	
	private String prjId;
	
	private String reqId;
	
	
	private String reqChgId;
	
	private String reqChgTypeCd;
	
	
	private String chgUsrId;
	
	private String chgDtm;
	
	
	private String preProcessId;
	private String chgProcessId;
	
	
	private String preFlowId;
	private String chgFlowId;
	
	
	private String preChargerId;
	private String chgChargerId;
	
	
	
	public Req6001VO() {
		super();
	}
	
		
	public Req6001VO(String licGrpId, String prjId, String reqId, String reqChgType) {
		this();
		this.licGrpId = licGrpId;
		this.prjId = prjId;
		this.reqId = reqId;
		this.reqChgTypeCd = reqChgType;
	}
	
		
	public Req6001VO(String licGrpId, String prjId, String reqId, String reqChgType, String preData, String chgData) {
		this(licGrpId, prjId, reqId, reqChgType);
		
		
		if(reqChgType == "01") {
			this.preFlowId = preData;
			this.chgFlowId = chgData;
		}
		
		else if(reqChgType == "02") {
			this.preChargerId = preData;
			this.chgChargerId = chgData;
		}
		
		else if(reqChgType == "05") {
			this.preProcessId = preData;
			this.chgProcessId = chgData;
		}
	}
	
		
	public Req6001VO(String licGrpId, String prjId, String reqId, String reqChgType, String preData, String chgData, String chgUsrId) {
		this(licGrpId, prjId, reqId, reqChgType, preData, chgData);
		this.chgUsrId = chgUsrId;
	}
	
	public String getRn() {
		return rn;
	}

	public void setRn(String rn) {
		this.rn = rn;
	}

	public String getLicGrpId() {
		return licGrpId;
	}
	public void setLicGrpId(String licGrpId) {
		this.licGrpId = licGrpId;
	}
	public String getPrjId() {
		return prjId;
	}
	public void setPrjId(String prjId) {
		this.prjId = prjId;
	}
	public String getReqId() {
		return reqId;
	}
	public void setReqId(String reqId) {
		this.reqId = reqId;
	}
	public String getReqChgId() {
		return reqChgId;
	}
	public void setReqChgId(String reqChgId) {
		this.reqChgId = reqChgId;
	}
	public String getReqChgTypeCd() {
		return reqChgTypeCd;
	}

	public void setReqChgTypeCd(String reqChgTypeCd) {
		this.reqChgTypeCd = reqChgTypeCd;
	}

	public String getChgUsrId() {
		return chgUsrId;
	}
	public void setChgUsrId(String chgUsrId) {
		this.chgUsrId = chgUsrId;
	}
	public String getChgDtm() {
		return chgDtm;
	}
	public void setChgDtm(String chgDtm) {
		this.chgDtm = chgDtm;
	}
	public String getPreProcessId() {
		return preProcessId;
	}
	public void setPreProcessId(String preProcessId) {
		this.preProcessId = preProcessId;
	}
	public String getChgProcessId() {
		return chgProcessId;
	}
	public void setChgProcessId(String chgProcessId) {
		this.chgProcessId = chgProcessId;
	}
	public String getPreFlowId() {
		return preFlowId;
	}
	public void setPreFlowId(String preFlowId) {
		this.preFlowId = preFlowId;
	}
	public String getChgFlowId() {
		return chgFlowId;
	}
	public void setChgFlowId(String chgFlowId) {
		this.chgFlowId = chgFlowId;
	}
	public String getPreChargerId() {
		return preChargerId;
	}
	public void setPreChargerId(String preChargerId) {
		this.preChargerId = preChargerId;
	}
	public String getChgChargerId() {
		return chgChargerId;
	}
	public void setChgChargerId(String chgChargerId) {
		this.chgChargerId = chgChargerId;
	}
	
	
	
}
