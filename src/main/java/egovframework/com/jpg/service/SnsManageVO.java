package egovframework.com.jpg.service;

import java.io.Serializable;

public class SnsManageVO implements Serializable {

	
	private String snsId;
	private String snsType;
	private String snsLink;
	private String snsFile;
	private String snsRegistDate;
	private String snsRegistId;
	private String snsTitle;
	
	public String getSnsTitle() {
		return snsTitle;
	}
	public void setSnsTitle(String snsTitle) {
		this.snsTitle = snsTitle;
	}
	public String getSnsId() {
		return snsId;
	}
	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}
	public String getSnsType() {
		return snsType;
	}
	public void setSnsType(String snsType) {
		this.snsType = snsType;
	}
	public String getSnsLink() {
		return snsLink;
	}
	public void setSnsLink(String snsLink) {
		this.snsLink = snsLink;
	}
	public String getSnsFile() {
		return snsFile;
	}
	public void setSnsFile(String snsFile) {
		this.snsFile = snsFile;
	}
	public String getSnsRegistDate() {
		return snsRegistDate;
	}
	public void setSnsRegistDate(String snsRegistDate) {
		this.snsRegistDate = snsRegistDate;
	}
	public String getSnsRegistId() {
		return snsRegistId;
	}
	public void setSnsRegistId(String snsRegistId) {
		this.snsRegistId = snsRegistId;
	}
	
	
	
}
