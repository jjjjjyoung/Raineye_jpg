package egovframework.com.cmm;

import java.io.Serializable;

@SuppressWarnings("serial")
public class CpyrhtPrtcVO implements Serializable{

	private String cpyrhtId;
	private String cpyrhtPrtcPolicyCn;		
	private String frstRegisterPnttm;
	private String frstRegisterId;
	private String lastUpdusrPnttm;
	private String lastUpdusrId;
	
	public String getCpyrhtId() {
		return cpyrhtId;
	}
	public void setCpyrhtId(String cpyrhtId) {
		this.cpyrhtId = cpyrhtId;
	}
	public String getCpyrhtPrtcPolicyCn() {
		return cpyrhtPrtcPolicyCn;
	}
	public void setCpyrhtPrtcPolicyCn(String cpyrhtPrtcPolicyCn) {
		this.cpyrhtPrtcPolicyCn = cpyrhtPrtcPolicyCn;
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
