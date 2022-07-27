package egovframework.com.jpg.service;

import java.io.Serializable;

public class HtmlEditorVO implements Serializable {
	
	private String ctsIdx;
	
	private String ctsId;

	private String ctsNm;

	private String ctsTi;
	
	private String ctsCn;

	public String getCtsIdx() {
		return ctsIdx;
	}

	public void setCtsIdx(String ctsIdx) {
		this.ctsIdx = ctsIdx;
	}

	public String getCtsId() {
		return ctsId;
	}

	public void setCtsId(String ctsId) {
		this.ctsId = ctsId;
	}

	public String getCtsNm() {
		return ctsNm;
	}

	public void setCtsNm(String ctsNm) {
		this.ctsNm = ctsNm;
	}

	public String getCtsTi() {
		return ctsTi;
	}

	public void setCtsTi(String ctsTi) {
		this.ctsTi = ctsTi;
	}

	public String getCtsCn() {
		return ctsCn;
	}

	public void setCtsCn(String ctsCn) {
		this.ctsCn = ctsCn;
	}

	@Override
	public String toString() {
		return "HtmlEditorVO [ctsIdx=" + ctsIdx + ", ctsId=" + ctsId + ", ctsNm=" + ctsNm + ", ctsTi=" + ctsTi
				+ ", ctsCn=" + ctsCn + "]";
	}	
}
