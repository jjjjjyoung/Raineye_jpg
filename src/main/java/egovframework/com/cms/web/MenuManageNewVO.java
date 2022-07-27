package egovframework.com.cms.web;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MenuManageNewVO implements Serializable{

	public String meId = "";
	public String meCode = "";
	public String meName ="";
	public String meLink = "";
	public String meTarget = "";
	public String meOrder = "";
	public String meUse = "";
	public String meDepth = "";
	public String meParent = "";
	public String mePlace ="";
	public int meNewCount = 0;
	
	public int getMeNewCount() {
		return meNewCount;
	}
	public void setMeNewCount(int meNewCount) {
		this.meNewCount = meNewCount;
	}
	
	
	public String getMePlace() {
		return mePlace;
	}
	public void setMePlace(String mePlace) {
		this.mePlace = mePlace;
	}
	public String getMeParent() {
		return meParent;
	}
	public void setMeParent(String meParent) {
		this.meParent = meParent;
	}
	public String getMeDepth() {
		return meDepth;
	}
	public void setMeDepth(String meDepth) {
		this.meDepth = meDepth;
	}
	public String getMeId() {
		return meId;
	}
	public void setMeId(String meId) {
		this.meId = meId;
	}
	public String getMeCode() {
		return meCode;
	}
	public String getMeName() {
		return meName;
	}
	public void setMeName(String meName) {
		this.meName = meName;
	}
	public void setMeCode(String meCode) {
		this.meCode = meCode;
	}
	public String getMeLink() {
		return meLink;
	}
	public void setMeLink(String meLink) {
		this.meLink = meLink;
	}
	public String getMeTarget() {
		return meTarget;
	}
	public void setMeTarget(String meTarget) {
		this.meTarget = meTarget;
	}
	public String getMeOrder() {
		return meOrder;
	}
	public void setMeOrder(String meOrder) {
		this.meOrder = meOrder;
	}
	public String getMeUse() {
		return meUse;
	}
	public void setMeUse(String meUse) {
		this.meUse = meUse;
	}

	 
	
}
