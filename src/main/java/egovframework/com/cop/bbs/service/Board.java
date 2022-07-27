package egovframework.com.cop.bbs.service;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Class Name  : Board.java
 * @Description : 게시물에 대한 데이터 처리 모델
 * @Modification Information
 * 
 *     수정일         수정자                   수정내용
 *     -------          --------        ---------------------------
 *   2009.03.06       이삼섭                  최초 생성
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 02. 13
 * @version 1.0
 * @see 
 * 
 */
@SuppressWarnings("serial")
public class Board implements Serializable {

	/**
	 * 게시물 첨부파일 아이디
	 */
	private String atchFileId = "";
	/**
	 * 게시판 아이디
	 */
	private String bbsId = "";
	/**
	 * 최초등록자 아이디
	 */
	private String frstRegisterId = "";
	/**
	 * 최초등록시점
	 */
	private String frstRegisterPnttm = "";
	/**
	 * 최종수정자 아이디
	 */
	private String lastUpdusrId = "";
	/**
	 * 최종수정시점
	 */
	private String lastUpdusrPnttm = "";
	/**
	 * 게시시작일
	 */
	private String ntceBgnde = "";
	/**
	 * 게시종료일
	 */
	private String ntceEndde = "";
	/**
	 * 게시자 아이디
	 */
	private String ntcrId = "";
	/**
	 * 게시자명
	 */
	private String ntcrNm = "";
	/**
	 * 게시물 내용
	 */
	private String nttCn = "";
	/**
	 * 게시물 아이디
	 */
	private long nttId = 0L;
	/**
	 * 게시물 번호
	 */
	private long nttNo = 0L;
	/**
	 * 게시물 제목
	 */
	private String nttSj = "";
	/**
	 * 부모글번호
	 */
	private String parnts = "0";
	/**
	 * 패스워드
	 */
	private String password = "";
	/**
	 * 조회수
	 */
	private int inqireCo = 0;
	/**
	 * 답장여부
	 */
	private String replyAt = "";
	/**
	 * 답장위치
	 */
	private String replyLc = "0";
	/**
	 * 정렬순서
	 */
	private long sortOrdr = 0L;
	/**
	 * 사용여부
	 */
	private String useAt = "";
	/**
	 * 게시 종료일
	 */
	private String ntceEnddeView = ""; 
	/**
	 * 게시 시작일
	 */
	private String ntceBgndeView = "";
	/**
	 * 공지사항 여부 F
	 */
	private String noticeAt = "";
	/**
	 * 비밀글 여부 
	 */
	private String secretAt = "";
	/**
	 * 제목 Bold 여부 
	 */
	private String sjBoldAt = "";
	/**
	 * 블로그 게시판 여부 
	 */
	private String blogAt = "";
	/** 블로그 ID */
    private String blogId = "";
    
    
	////////////공연///////////////////////////
	
	/** 메인공연명*/
	private String sjBoldAtMain = "";    
	/** 공연주소*/
	private String address = "";
	
	/** 공연상세주소*/
	private String addressDetail = "";
	
	/** 공연주최*/
	private String host = "";
	
    /** 공연주관*/
    private String subhost = "";
	
	/** 관람연력*/
	private String ageLimit = "";
	
	/** 관람료*/
	private String charge = "";
	
	private String startTime;
	
	private String endTime;
	
	private String takeTime;
	
	private String yearCheak;
	
	private String  type = "";
	
	/** 관람연력*/
	private MultipartFile file_0;
	
	private String startDate;
	
	private String endDate;
	    
	private String ticketLink;
	
	private String skin;
	
	private String youtube;
	
	private String eduStyle;
	
	
	
	public String getSubhost() {
		return subhost;
	}

	public void setSubhost(String subhost) {
		this.subhost = subhost;
	}

	public String getYoutube() {
		return youtube;
	}

	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}

	public String getSkin() {
		return skin;
	}

	public void setSkin(String skin) {
		this.skin = skin;
	}

	public String getTicketLink() {
		return ticketLink;
	}

	public void setTicketLink(String ticketLink) {
		this.ticketLink = ticketLink;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public String getEduStyle() {
		return eduStyle;
	}

	public void setEduStyle(String eduStyle) {
		this.eduStyle = eduStyle;
	}

	public String getYearCheak() {
	return yearCheak;
	}
	
	public void setYearCheak(String yearCheak) {
	this.yearCheak = yearCheak;
	}
	
	public String getTakeTime() {
	return takeTime;
	}
	
	public void setTakeTime(String takeTime) {
	this.takeTime = takeTime;
	}
	
	public String getStartTime() {
	return startTime;
	}
	
	public void setStartTime(String startTime) {
	this.startTime = startTime;
	}
	
	public String getEndTime() {
	return endTime;
	}
	
	public void setEndTime(String endTime) {
	this.endTime = endTime;
	}
	
	/** 문의전화*/
	private String tell = "";
	
	public String getAddress() {
	return address;
	}
	
	public String getSjBoldAtMain() {
	return sjBoldAtMain;
	}
	
	public void setSjBoldAtMain(String sjBoldAtMain) {
	this.sjBoldAtMain = sjBoldAtMain;
	}
	
	public void setAddress(String address) {
	this.address = address;
	}
	
	public String getAddressDetail() {
	return addressDetail;
	}
	
	public void setAddressDetail(String addressDetail) {
	this.addressDetail = addressDetail;
	}
	
	public String getHost() {
	return host;
	}
	
	public void setHost(String host) {
	this.host = host;
	}
	
	
	public String getAgeLimit() {
	return ageLimit;
	}
	
	public void setAgeLimit(String ageLimit) {
	this.ageLimit = ageLimit;
	}
	
	public String getCharge() {
	return charge;
	}
	
	public void setCharge(String charge) {
	this.charge = charge;
	}
	
	public String getTell() {
	return tell;
	}
	
	public void setTell(String tell) {
	this.tell = tell;
	}
	
	public String getType() {
	return type;
	}
	
	public void setType(String type) {
	this.type = type;
	}
	
	public MultipartFile getFile_0() {
	return file_0;
	}
	
	public void setFile_0(MultipartFile file_0) {
	this.file_0 = file_0;
	}
	

	

    
    /* -------------------------- */
    
    /** 신청기간 시작 */
    private String applySdate = "";
    
    /** 신청기간 종료 */
    private String applyEdate = "";
    
    /** 교육기간 시작 */
    private String eduSdate = "";
    
    /** 교육기간 종료 */
    private String eduEdate = "";
    
    /** 접수상태 */
    private String recStatus = "";
    
    /** 수강료 */
    private String tutFee = "";
    
    /** 프로그램 소제목 */
    private String eduSubTitle = "";
    
    /** 교육 대상 */
    private String eduOb = "";
    
    /** 교육 장소 */
    private String eduLocation = "";

    /** 교육 타입 **/
    private String eduTypeA ="";
    private String eduTypeB ="";
    private String eduTypeC ="";
    private String eduTypeD ="";
    private String eduTypeE ="";
    private String eduTypeF ="";
    private String eduTypeG ="";
    private String eduTypeH ="";
    private String eduTypeI ="";
    private String eduTypeJ ="";
    
    private int eduPrice;
    private String eduUrl = "";
    
    /** 참가비 */
    private String eduFee = "";
    
    /** 입금계좌 */
    private String eduAcc = "";
    
    /** 담당자 이름 */
    private String eduManagerNm = "";
    
    /** 담당자 연락처 */
    private String eduManagerTel = "";
    
	/**
	 * atchFileId attribute를 리턴한다.
	 * @return the atchFileId
	 */
    /** 단원 번호*/
    private int empNo;
    /**
     * 단원 등록인지
     * */
    private String empAt;
    
    /** 교육/체험 분류값 */
    private String eduVal;
    

	///////////예술단원///////////
	    
	/** 단원 부서*/
	private String empDept;
	
	/** 단원 직책*/
	private String empPosi;
	
	/** 단원 한줄소개*/
	private String empIntro;
	
	
	/** 어린이 국악단*/
	private String empKidAt;
	
	/** 단원 경력*/
	private String empCareer="";
	
	/**단원 학력*/
	private String empEdu="";
	
	/**단원 이름*/
	private String empNm;
	
	
	
	    /** 교육/체험 분류값 */
	public String getAtchFileId() {
		return atchFileId;
	}

	/**
	 * atchFileId attribute 값을 설정한다.
	 * @param atchFileId the atchFileId to set
	 */
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	/**
	 * bbsId attribute를 리턴한다.
	 * @return the bbsId
	 */
	public String getBbsId() {
		return bbsId;
	}

	/**
	 * bbsId attribute 값을 설정한다.
	 * @param bbsId the bbsId to set
	 */
	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}

	/**
	 * frstRegisterId attribute를 리턴한다.
	 * @return the frstRegisterId
	 */
	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	/**
	 * frstRegisterId attribute 값을 설정한다.
	 * @param frstRegisterId the frstRegisterId to set
	 */
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	/**
	 * frstRegisterPnttm attribute를 리턴한다.
	 * @return the frstRegisterPnttm
	 */
	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}

	/**
	 * frstRegisterPnttm attribute 값을 설정한다.
	 * @param frstRegisterPnttm the frstRegisterPnttm to set
	 */
	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}

	/**
	 * lastUpdusrId attribute를 리턴한다.
	 * @return the lastUpdusrId
	 */
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	/**
	 * lastUpdusrId attribute 값을 설정한다.
	 * @param lastUpdusrId the lastUpdusrId to set
	 */
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}

	/**
	 * lastUpdusrPnttm attribute를 리턴한다.
	 * @return the lastUpdusrPnttm
	 */
	public String getLastUpdusrPnttm() {
		return lastUpdusrPnttm;
	}

	/**
	 * lastUpdusrPnttm attribute 값을 설정한다.
	 * @param lastUpdusrPnttm the lastUpdusrPnttm to set
	 */
	public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
		this.lastUpdusrPnttm = lastUpdusrPnttm;
	}

	/**
	 * ntceBgnde attribute를 리턴한다.
	 * @return the ntceBgnde
	 */
	public String getNtceBgnde() {
		return ntceBgnde;
	}

	/**
	 * ntceBgnde attribute 값을 설정한다.
	 * @param ntceBgnde the ntceBgnde to set
	 */
	public void setNtceBgnde(String ntceBgnde) {
		this.ntceBgnde = ntceBgnde;
	}

	/**
	 * ntceEndde attribute를 리턴한다.
	 * @return the ntceEndde
	 */
	public String getNtceEndde() {
		return ntceEndde;
	}

	/**
	 * ntceEndde attribute 값을 설정한다.
	 * @param ntceEndde the ntceEndde to set
	 */
	public void setNtceEndde(String ntceEndde) {
		this.ntceEndde = ntceEndde;
	}

	/**
	 * ntcrId attribute를 리턴한다.
	 * @return the ntcrId
	 */
	public String getNtcrId() {
		return ntcrId;
	}

	/**
	 * ntcrId attribute 값을 설정한다.
	 * @param ntcrId the ntcrId to set
	 */
	public void setNtcrId(String ntcrId) {
		this.ntcrId = ntcrId;
	}

	/**
	 * ntcrNm attribute를 리턴한다.
	 * @return the ntcrNm
	 */
	public String getNtcrNm() {
		return ntcrNm;
	}

	/**
	 * ntcrNm attribute 값을 설정한다.
	 * @param ntcrNm the ntcrNm to set
	 */
	public void setNtcrNm(String ntcrNm) {
		this.ntcrNm = ntcrNm;
	}

	/**
	 * nttCn attribute를 리턴한다.
	 * @return the nttCn
	 */
	public String getNttCn() {
		return nttCn;
	}

	/**
	 * nttCn attribute 값을 설정한다.
	 * @param nttCn the nttCn to set
	 */
	public void setNttCn(String nttCn) {
		this.nttCn = nttCn;
	}

	/**
	 * nttId attribute를 리턴한다.
	 * @return the nttId
	 */
	public long getNttId() {
		return nttId;
	}

	/**
	 * nttId attribute 값을 설정한다.
	 * @param nttId the nttId to set
	 */
	public void setNttId(long nttId) {
		this.nttId = nttId;
	}

	/**
	 * nttNo attribute를 리턴한다.
	 * @return the nttNo
	 */
	public long getNttNo() {
		return nttNo;
	}

	/**
	 * nttNo attribute 값을 설정한다.
	 * @param nttNo the nttNo to set
	 */
	public void setNttNo(long nttNo) {
		this.nttNo = nttNo;
	}

	/**
	 * nttSj attribute를 리턴한다.
	 * @return the nttSj
	 */
	public String getNttSj() {
		return nttSj;
	}

	/**
	 * nttSj attribute 값을 설정한다.
	 * @param nttSj the nttSj to set
	 */
	public void setNttSj(String nttSj) {
		this.nttSj = nttSj;
	}

	/**
	 * parnts attribute를 리턴한다.
	 * @return the parnts
	 */
	public String getParnts() {
		return parnts;
	}

	public String getEmpAt() {
		return empAt;
	}

	public void setEmpAt(String empAt) {
		this.empAt = empAt;
	}

	/**
	 * parnts attribute 값을 설정한다.
	 * @param parnts the parnts to set
	 */
	public void setParnts(String parnts) {
		this.parnts = parnts;
	}

	/**
	 * password attribute를 리턴한다.
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * password attribute 값을 설정한다.
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * inqireCo attribute를 리턴한다.
	 * @return the inqireCo
	 */
	public int getInqireCo() {
		return inqireCo;
	}

	/**
	 * inqireCo attribute 값을 설정한다.
	 * @param inqireCo the inqireCo to set
	 */
	public void setInqireCo(int inqireCo) {
		this.inqireCo = inqireCo;
	}

	/**
	 * replyAt attribute를 리턴한다.
	 * @return the replyAt
	 */
	public String getReplyAt() {
		return replyAt;
	}

	/**
	 * replyAt attribute 값을 설정한다.
	 * @param replyAt the replyAt to set
	 */
	public void setReplyAt(String replyAt) {
		this.replyAt = replyAt;
	}

	/**
	 * replyLc attribute를 리턴한다.
	 * @return the replyLc
	 */
	public String getReplyLc() {
		return replyLc;
	}

	/**
	 * replyLc attribute 값을 설정한다.
	 * @param replyLc the replyLc to set
	 */
	public void setReplyLc(String replyLc) {
		this.replyLc = replyLc;
	}

	/**
	 * sortOrdr attribute를 리턴한다.
	 * @return the sortOrdr
	 */
	public long getSortOrdr() {
		return sortOrdr;
	}

	/**
	 * sortOrdr attribute 값을 설정한다.
	 * @param sortOrdr the sortOrdr to set
	 */
	public void setSortOrdr(long sortOrdr) {
		this.sortOrdr = sortOrdr;
	}

	/**
	 * useAt attribute를 리턴한다.
	 * @return the useAt
	 */
	public String getUseAt() {
		return useAt;
	}

	/**
	 * useAt attribute 값을 설정한다.
	 * @param useAt the useAt to set
	 */
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}

	/**
	 * ntceEnddeView attribute를 리턴한다.
	 * @return the ntceEnddeView
	 */
	public String getNtceEnddeView() {
		return ntceEnddeView;
	}

	/**
	 * ntceEnddeView attribute 값을 설정한다.
	 * @param ntceEnddeView the ntceEnddeView to set
	 */
	public void setNtceEnddeView(String ntceEnddeView) {
		this.ntceEnddeView = ntceEnddeView;
	}

	/**
	 * ntceBgndeView attribute를 리턴한다.
	 * @return the ntceBgndeView
	 */
	public String getNtceBgndeView() {
		return ntceBgndeView;
	}

	/**
	 * ntceBgndeView attribute 값을 설정한다.
	 * @param ntceBgndeView the ntceBgndeView to set
	 */
	public void setNtceBgndeView(String ntceBgndeView) {
		this.ntceBgndeView = ntceBgndeView;
	}
	
	/**
	 * noticeAt attribute를 리턴한다.
	 * @return the noticeAt
	 */
	public String getNoticeAt() {
		return noticeAt;
	}

	/**
	 * noticeAt attribute 값을 설정한다.
	 * @param noticeAt the noticeAt to set
	 */
	public void setNoticeAt(String noticeAt) {
		this.noticeAt = noticeAt;
	}
	
	/**
	 * secretAt attribute를 리턴한다.
	 * @return the secretAt
	 */
	public String getSecretAt() {
		return secretAt;
	}

	/**
	 * secretAt attribute 값을 설정한다.
	 * @param secretAt the secretAt to set
	 */
	public void setSecretAt(String secretAt) {
		this.secretAt = secretAt;
	}
	
	/**
	 * sjBoldAt attribute를 리턴한다.
	 * @return the sjBoldAt
	 */
	public String getSjBoldAt() {
		return sjBoldAt;
	}

	/**
	 * sjBoldAt attribute 값을 설정한다.
	 * @param sjBoldAt the sjBoldAt to set
	 */
	public void setSjBoldAt(String sjBoldAt) {
		this.sjBoldAt = sjBoldAt;
	}
	
	public String getBlogAt() {
		return blogAt;
	}

	public void setBlogAt(String blogAt) {
		this.blogAt = blogAt;
	}

	public String getBlogId() {
		return blogId;
	}

	public void setBlogId(String blogId) {
		this.blogId = blogId;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	
	public String getEduVal() {
		return eduVal;
	}

	public void setEduVal(String eduVal) {
		this.eduVal = eduVal;
	}

	public String getApplySdate() {
		return applySdate;
	}

	public void setApplySdate(String applySdate) {
		this.applySdate = applySdate;
	}

	public String getApplyEdate() {
		return applyEdate;
	}

	public void setApplyEdate(String applyEdate) {
		this.applyEdate = applyEdate;
	}

	public String getEduSdate() {
		return eduSdate;
	}

	public void setEduSdate(String eduSdate) {
		this.eduSdate = eduSdate;
	}

	public String getEduEdate() {
		return eduEdate;
	}

	public void setEduEdate(String eduEdate) {
		this.eduEdate = eduEdate;
	}

	public String getRecStatus() {
		return recStatus;
	}

	public void setRecStatus(String recStatus) {
		this.recStatus = recStatus;
	}

	public String getTutFee() {
		return tutFee;
	}

	public void setTutFee(String tutFee) {
		this.tutFee = tutFee;
	}

	public String getEduSubTitle() {
		return eduSubTitle;
	}

	public void setEduSubTitle(String eduSubTitle) {
		this.eduSubTitle = eduSubTitle;
	}

	public String getEduOb() {
		return eduOb;
	}

	public void setEduOb(String eduOb) {
		this.eduOb = eduOb;
	}

	public String getEduLocation() {
		return eduLocation;
	}

	public void setEduLocation(String eduLocation) {
		this.eduLocation = eduLocation;
	}

	public String getEduFee() {
		return eduFee;
	}

	public void setEduFee(String eduFee) {
		this.eduFee = eduFee;
	}

	public String getEduAcc() {
		return eduAcc;
	}

	public void setEduAcc(String eduAcc) {
		this.eduAcc = eduAcc;
	}

	public String getEduManagerNm() {
		return eduManagerNm;
	}

	public void setEduManagerNm(String eduManagerNm) {
		this.eduManagerNm = eduManagerNm;
	}

	public String getEduManagerTel() {
		return eduManagerTel;
	}

	public void setEduManagerTel(String eduManagerTel) {
		this.eduManagerTel = eduManagerTel;
	}

	public String getEmpDept() {
		return empDept;
	}

	public void setEmpDept(String empDept) {
		this.empDept = empDept;
	}

	public String getEmpPosi() {
		return empPosi;
	}

	public void setEmpPosi(String empPosi) {
		this.empPosi = empPosi;
	}

	public String getEmpKidAt() {
		return empKidAt;
	}

	public void setEmpKidAt(String empKidAt) {
		this.empKidAt = empKidAt;
	}

	public String getEmpCareer() {
		return empCareer;
	}

	public void setEmpCareer(String empCareer) {
		this.empCareer = empCareer;
	}

	public String getEmpEdu() {
		return empEdu;
	}

	public void setEmpEdu(String empEdu) {
		this.empEdu = empEdu;
	}

	public String getEmpNm() {
		return empNm;
	}

	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}

	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}

	public String getEduTypeA() {
		return eduTypeA;
	}

	public void setEduTypeA(String eduTypeA) {
		this.eduTypeA = eduTypeA;
	}

	public String getEduTypeB() {
		return eduTypeB;
	}

	public void setEduTypeB(String eduTypeB) {
		this.eduTypeB = eduTypeB;
	}

	public String getEduTypeC() {
		return eduTypeC;
	}

	public void setEduTypeC(String eduTypeC) {
		this.eduTypeC = eduTypeC;
	}

	public String getEduTypeD() {
		return eduTypeD;
	}

	public void setEduTypeD(String eduTypeD) {
		this.eduTypeD = eduTypeD;
	}

	public String getEduTypeE() {
		return eduTypeE;
	}

	public void setEduTypeE(String eduTypeE) {
		this.eduTypeE = eduTypeE;
	}

	public String getEmpIntro() {
		return empIntro;
	}

	public void setEmpIntro(String empIntro) {
		this.empIntro = empIntro;
	}

	public String getEduTypeF() {
		return eduTypeF;
	}

	public void setEduTypeF(String eduTypeF) {
		this.eduTypeF = eduTypeF;
	}

	public String getEduTypeG() {
		return eduTypeG;
	}

	public void setEduTypeG(String eduTypeG) {
		this.eduTypeG = eduTypeG;
	}

	public String getEduTypeH() {
		return eduTypeH;
	}

	public void setEduTypeH(String eduTypeH) {
		this.eduTypeH = eduTypeH;
	}

	public String getEduTypeI() {
		return eduTypeI;
	}

	public void setEduTypeI(String eduTypeI) {
		this.eduTypeI = eduTypeI;
	}

	public String getEduTypeJ() {
		return eduTypeJ;
	}

	public void setEduTypeJ(String eduTypeJ) {
		this.eduTypeJ = eduTypeJ;
	}
	
	public int getEduPrice() {
		return eduPrice;
	}

	public void setEduPrice(int eduPrice) {
		this.eduPrice = eduPrice;
	}
	
	public String getEduUrl() {
		return eduUrl;
	}

	public void setEduUrl(String eduUrl) {
		this.eduUrl = eduUrl;
	}
}
