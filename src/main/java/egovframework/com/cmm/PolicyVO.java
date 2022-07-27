package egovframework.com.cmm;

import java.io.Serializable;

@SuppressWarnings("serial")
public class PolicyVO implements Serializable{
    private String indvdlInfoId;
    private String indvdlInfoNm;
    private String indvdlInfoDc;
    private String indvdlInfoYn;
	private String frstRegisterPnttm;
    private String frstRegisterId;
    private String lastUpdusrPnttm;
    private String lastUpdusrId;
	public String getIndvdlInfoId() {
		return indvdlInfoId;
	}
	public void setIndvdlInfoId(String indvdlInfoId) {
		this.indvdlInfoId = indvdlInfoId;
	}
	public String getIndvdlInfoNm() {
		return indvdlInfoNm;
	}
	public void setIndvdlInfoNm(String indvdlInfoNm) {
		this.indvdlInfoNm = indvdlInfoNm;
	}
	public String getIndvdlInfoDc() {
		return indvdlInfoDc;
	}
	public void setIndvdlInfoDc(String indvdlInfoDc) {
		this.indvdlInfoDc = indvdlInfoDc;
	}
	public String getIndvdlInfoYn() {
		return indvdlInfoYn;
	}
	public void setIndvdlInfoYn(String indvdlInfoYn) {
		this.indvdlInfoYn = indvdlInfoYn;
	}
	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}
	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}
	public String getFrstRegisterId() {
		return frstRegisterId;
	}
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}
	public String getLastUpdusrPnttm() {
		return lastUpdusrPnttm;
	}
	public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
		this.lastUpdusrPnttm = lastUpdusrPnttm;
	}
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}
	
	
	
}
