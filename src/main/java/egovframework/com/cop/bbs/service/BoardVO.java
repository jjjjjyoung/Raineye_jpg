package egovframework.com.cop.bbs.service;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;


/**
 * 게시물 관리를 위한 VO 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------      --------    ---------------------------
 *   2009.3.19  이삼섭          최초 생성
 *   2009.06.29  한성곤		2단계 기능 추가 (댓글관리, 만족도조사)
 *
 * </pre>
 */
@SuppressWarnings("serial")
public class BoardVO extends Board implements Serializable {

    /** 검색시작일 */
    private String searchBgnDe = "";
    
    /** 검색조건 */
    private String searchCnd = "";
    
    /** 검색종료일 */
    private String searchEndDe = "";
    
    /** 검색단어 */
    private String searchWrd = "";
    
    /** 정렬순서(DESC,ASC) */
    private long sortOrdr = 0L;

    /** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 10;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** 첫페이지 인덱스 */
    private int firstIndex = 1;

    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;

    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 10;

    /** 레코드 번호 */
    private int rowNo = 0;

    /** 최초 등록자명 */
    private String frstRegisterNm = "";

    /** 최초 등록자ID*/
    private String frstRegisterId = "";
    
    /** 최종 수정자명 */
    private String lastUpdusrNm = "";

    /** 유효여부 */
    private String isExpired = "N";

    /** 상위 정렬 순서 */
    private String parntsSortOrdr = "";

    /** 상위 답변 위치 */
    private String parntsReplyLc = "";

    /** 게시판 유형코드 */
    private String bbsTyCode = "";
    
    /** 게시판 속성코드 */
    private String bbsAttrbCode = "";

    /** 게시판 명 */
    private String bbsNm = "";
    
    /** 부서별 게시판*/
    private String dept ="";

	////////////공연///////////////////////////
    /** 공연명*/
    private String sjBoldAt = "";
    
    /** 공연 소개*/
    private String nttCn = "";
    
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
    private String charge ="";
    
    /** 문의전화*/
    private String tell = "";
    
    
    private MultipartFile file_0;
    
    private String startDate;
    
    private String endDate;
    
    private String startTime;

    private String endTime;

    private String takeTime;

    private String dateCheak;

    private String dayCheak;

    private String yearCheak;

    private String ticketLink;
    
    private String skin;

    private String youtube;
    
    private int eduPrice;
    private String eduUrl;
    
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

	public String getCharge() {
		return charge;
	}

	public void setCharge(String charge) {
		this.charge = charge;
	}

	private String showKind;
    
    private String  type = "";
    
    
    
    public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getTakeTime() {
		return takeTime;
	}

	public void setTakeTime(String takeTime) {
		this.takeTime = takeTime;
	}

	public String getDateCheak() {
		return dateCheak;
	}

	public void setDateCheak(String dateCheak) {
		this.dateCheak = dateCheak;
	}

	public String getDayCheak() {
		return dayCheak;
	}

	public void setDayCheak(String dayCheak) {
		this.dayCheak = dayCheak;
	}

	public String getYearCheak() {
		return yearCheak;
	}

	public void setYearCheak(String yearCheak) {
		this.yearCheak = yearCheak;
	}

	public String getShowKind() {
		return showKind;
	}

	public void setShowKind(String showKind) {
		this.showKind = showKind;
	}

	///////////예술단원///////////
	/** 단원 이름*/
    private String empNm="";
	
	/** 단원 부서*/
    private String empDept="";
    
    /** 단원 직책*/
    private String empPosi="";

    /** 어린이 국악단*/
    private String empKidAt="";

	/** 단원 경력*/
    private String empCareer="";
    
    /**단원 학력*/
    private String empEdu="";
    
    /**단원 한줄소개*/
    private String empIntro="";
    
    /**첨부 이미지 파일 경로*/
    private String filePath;
    
    /**첨부 이미지 파일 이름*/
    private String originFileNm;
    
    /**첨부파일갯수**/
    private String filenum;

    /////////////겔러리//////////    
    /** 유튜브 키값*/
    private String galYoutube;

	public String getSjBoldAt() {
		return sjBoldAt;
	}

	public void setSjBoldAt(String sjBoldAt) {
		this.sjBoldAt = sjBoldAt;
	}

	public String getNttCn() {
		return nttCn;
	}

	public void setNttCn(String nttCn) {
		this.nttCn = nttCn;
	}

	public String getAddress() {
		return address;
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



	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public MultipartFile getFile_0() {
		return file_0;
	}

	public void setFile_0(MultipartFile file_0) {
		this.file_0 = file_0;
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

	public String getGalYoutube() {
		return galYoutube;
	}

	public void setGalYoutube(String galYoutube) {
		this.galYoutube = galYoutube;
	}
	
	public String getEduStyle() {
		return eduStyle;
    }
	
	public void setEduStyle(String eduStyle) {
		this.eduStyle = eduStyle;
	}


	/** 파일첨부가능여부 */
    private String fileAtchPosblAt = "";
    
    /** 첨부가능파일숫자 */
    private int posblAtchFileNumber = 0;
    
    /** 답장가능여부 */
    private String replyPosblAt = "";
    
    /** 조회 수 증가 여부 */
    private boolean plusCount = false;
    
    /** 익명등록 여부 */
    private String anonymousAt = "";
    
    /** 하위 페이지 인덱스 (댓글 및 만족도 조사 여부 확인용) */
    private String subPageIndex = "";

    /** 게시글 댓글갯수 */
    private String commentCo = "";
    
    /**
     * searchBgnDe attribute를 리턴한다.
     * 
     * @return the searchBgnDe
     */
    public String getSearchBgnDe() {
	return searchBgnDe;
    }

    /**
     * searchBgnDe attribute 값을 설정한다.
     * 
     * @param searchBgnDe
     *            the searchBgnDe to set
     */
    public void setSearchBgnDe(String searchBgnDe) {
	this.searchBgnDe = searchBgnDe;
    }

    /**
     * searchCnd attribute를 리턴한다.
     * 
     * @return the searchCnd
     */
    public String getSearchCnd() {
	return searchCnd;
    }

    /**
     * searchCnd attribute 값을 설정한다.
     * 
     * @param searchCnd
     *            the searchCnd to set
     */
    public void setSearchCnd(String searchCnd) {
	this.searchCnd = searchCnd;
    }

    /**
     * searchEndDe attribute를 리턴한다.
     * 
     * @return the searchEndDe
     */
    public String getSearchEndDe() {
	return searchEndDe;
    }

    /**
     * searchEndDe attribute 값을 설정한다.
     * 
     * @param searchEndDe
     *            the searchEndDe to set
     */
    public void setSearchEndDe(String searchEndDe) {
	this.searchEndDe = searchEndDe;
    }

    /**
     * searchWrd attribute를 리턴한다.
     * 
     * @return the searchWrd
     */
    public String getSearchWrd() {
	return searchWrd;
    }

    /**
     * searchWrd attribute 값을 설정한다.
     * 
     * @param searchWrd
     *            the searchWrd to set
     */
    public void setSearchWrd(String searchWrd) {
	this.searchWrd = searchWrd;
    }

    /**
     * sortOrdr attribute를 리턴한다.
     * 
     * @return the sortOrdr
     */
    public long getSortOrdr() {
	return sortOrdr;
    }

    /**
     * sortOrdr attribute 값을 설정한다.
     * 
     * @param sortOrdr
     *            the sortOrdr to set
     */
    public void setSortOrdr(long sortOrdr) {
	this.sortOrdr = sortOrdr;
    }

    /**
     * searchUseYn attribute를 리턴한다.
     * 
     * @return the searchUseYn
     */
    public String getSearchUseYn() {
	return searchUseYn;
    }

    /**
     * searchUseYn attribute 값을 설정한다.
     * 
     * @param searchUseYn
     *            the searchUseYn to set
     */
    public void setSearchUseYn(String searchUseYn) {
	this.searchUseYn = searchUseYn;
    }

    /**
     * pageIndex attribute를 리턴한다.
     * 
     * @return the pageIndex
     */
    public int getPageIndex() {
	return pageIndex;
    }

    /**
     * pageIndex attribute 값을 설정한다.
     * 
     * @param pageIndex
     *            the pageIndex to set
     */
    public void setPageIndex(int pageIndex) {
	this.pageIndex = pageIndex;
    }

    /**
     * pageUnit attribute를 리턴한다.
     * 
     * @return the pageUnit
     */
    public int getPageUnit() {
	return pageUnit;
    }

    /**
     * pageUnit attribute 값을 설정한다.
     * 
     * @param pageUnit
     *            the pageUnit to set
     */
    public void setPageUnit(int pageUnit) {
	this.pageUnit = pageUnit;
    }

    /**
     * pageSize attribute를 리턴한다.
     * 
     * @return the pageSize
     */
    public int getPageSize() {
	return pageSize;
    }

    /**
     * pageSize attribute 값을 설정한다.
     * 
     * @param pageSize
     *            the pageSize to set
     */
    public void setPageSize(int pageSize) {
	this.pageSize = pageSize;
    }

    /**
     * firstIndex attribute를 리턴한다.
     * 
     * @return the firstIndex
     */
    public int getFirstIndex() {
	return firstIndex;
    }

    /**
     * firstIndex attribute 값을 설정한다.
     * 
     * @param firstIndex
     *            the firstIndex to set
     */
    public void setFirstIndex(int firstIndex) {
	this.firstIndex = firstIndex;
    }

    /**
     * lastIndex attribute를 리턴한다.
     * 
     * @return the lastIndex
     */
    public int getLastIndex() {
	return lastIndex;
    }

    /**
     * lastIndex attribute 값을 설정한다.
     * 
     * @param lastIndex
     *            the lastIndex to set
     */
    public void setLastIndex(int lastIndex) {
	this.lastIndex = lastIndex;
    }

    /**
     * recordCountPerPage attribute를 리턴한다.
     * 
     * @return the recordCountPerPage
     */
    public int getRecordCountPerPage() {
	return recordCountPerPage;
    }

    /**
     * recordCountPerPage attribute 값을 설정한다.
     * 
     * @param recordCountPerPage
     *            the recordCountPerPage to set
     */
    public void setRecordCountPerPage(int recordCountPerPage) {
	this.recordCountPerPage = recordCountPerPage;
    }

    /**
     * rowNo attribute를 리턴한다.
     * 
     * @return the rowNo
     */
    public int getRowNo() {
	return rowNo;
    }

    /**
     * rowNo attribute 값을 설정한다.
     * 
     * @param rowNo
     *            the rowNo to set
     */
    public void setRowNo(int rowNo) {
	this.rowNo = rowNo;
    }

    /**
     * frstRegisterNm attribute를 리턴한다.
     * 
     * @return the frstRegisterNm
     */
    public String getFrstRegisterNm() {
	return frstRegisterNm;
    }

    /**
     * frstRegisterNm attribute 값을 설정한다.
     * 
     * @param frstRegisterNm
     *            the frstRegisterNm to set
     */
    public void setFrstRegisterNm(String frstRegisterNm) {
	this.frstRegisterNm = frstRegisterNm;
    }

    public String getFrstRegisterId() {
		return frstRegisterId;
	}

	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	/**
     * lastUpdusrNm attribute를 리턴한다.
     * 
     * @return the lastUpdusrNm
     */
    public String getLastUpdusrNm() {
	return lastUpdusrNm;
    }

    /**
     * lastUpdusrNm attribute 값을 설정한다.
     * 
     * @param lastUpdusrNm
     *            the lastUpdusrNm to set
     */
    public void setLastUpdusrNm(String lastUpdusrNm) {
	this.lastUpdusrNm = lastUpdusrNm;
    }

    /**
     * isExpired attribute를 리턴한다.
     * 
     * @return the isExpired
     */
    public String getIsExpired() {
	return isExpired;
    }

    /**
     * isExpired attribute 값을 설정한다.
     * 
     * @param isExpired
     *            the isExpired to set
     */
    public void setIsExpired(String isExpired) {
	this.isExpired = isExpired;
    }

    /**
     * parntsSortOrdr attribute를 리턴한다.
     * 
     * @return the parntsSortOrdr
     */
    public String getParntsSortOrdr() {
	return parntsSortOrdr;
    }

    /**
     * parntsSortOrdr attribute 값을 설정한다.
     * 
     * @param parntsSortOrdr
     *            the parntsSortOrdr to set
     */
    public void setParntsSortOrdr(String parntsSortOrdr) {
	this.parntsSortOrdr = parntsSortOrdr;
    }

    /**
     * parntsReplyLc attribute를 리턴한다.
     * 
     * @return the parntsReplyLc
     */
    public String getParntsReplyLc() {
	return parntsReplyLc;
    }

    /**
     * parntsReplyLc attribute 값을 설정한다.
     * 
     * @param parntsReplyLc
     *            the parntsReplyLc to set
     */
    public void setParntsReplyLc(String parntsReplyLc) {
	this.parntsReplyLc = parntsReplyLc;
    }

    /**
     * bbsTyCode attribute를 리턴한다.
     * 
     * @return the bbsTyCode
     */
    public String getBbsTyCode() {
	return bbsTyCode;
    }

    /**
     * bbsTyCode attribute 값을 설정한다.
     * 
     * @param bbsTyCode
     *            the bbsTyCode to set
     */
    public void setBbsTyCode(String bbsTyCode) {
	this.bbsTyCode = bbsTyCode;
    }

    /**
     * bbsAttrbCode attribute를 리턴한다.
     * 
     * @return the bbsAttrbCode
     */
    public String getBbsAttrbCode() {
	return bbsAttrbCode;
    }

    /**
     * bbsAttrbCode attribute 값을 설정한다.
     * 
     * @param bbsAttrbCode
     *            the bbsAttrbCode to set
     */
    public void setBbsAttrbCode(String bbsAttrbCode) {
	this.bbsAttrbCode = bbsAttrbCode;
    }

    /**
     * bbsNm attribute를 리턴한다.
     * 
     * @return the bbsNm
     */
    public String getBbsNm() {
	return bbsNm;
    }

    /**
     * bbsNm attribute 값을 설정한다.
     * 
     * @param bbsNm
     *            the bbsNm to set
     */
    public void setBbsNm(String bbsNm) {
	this.bbsNm = bbsNm;
    }

    /**
     * fileAtchPosblAt attribute를 리턴한다.
     * 
     * @return the fileAtchPosblAt
     */
    public String getFileAtchPosblAt() {
	return fileAtchPosblAt;
    }

    /**
     * fileAtchPosblAt attribute 값을 설정한다.
     * 
     * @param fileAtchPosblAt
     *            the fileAtchPosblAt to set
     */
    public void setFileAtchPosblAt(String fileAtchPosblAt) {
	this.fileAtchPosblAt = fileAtchPosblAt;
    }

    /**
     * posblAtchFileNumber attribute를 리턴한다.
     * 
     * @return the posblAtchFileNumber
     */
    public int getPosblAtchFileNumber() {
	return posblAtchFileNumber;
    }

    /**
     * posblAtchFileNumber attribute 값을 설정한다.
     * 
     * @param posblAtchFileNumber
     *            the posblAtchFileNumber to set
     */
    public void setPosblAtchFileNumber(int posblAtchFileNumber) {
	this.posblAtchFileNumber = posblAtchFileNumber;
    }

    /**
     * replyPosblAt attribute를 리턴한다.
     * 
     * @return the replyPosblAt
     */
    public String getReplyPosblAt() {
	return replyPosblAt;
    }

    /**
     * replyPosblAt attribute 값을 설정한다.
     * 
     * @param replyPosblAt
     *            the replyPosblAt to set
     */
    public void setReplyPosblAt(String replyPosblAt) {
	this.replyPosblAt = replyPosblAt;
    }

    /**
     * plusCount attribute를 리턴한다.
     * @return the plusCount
     */
    public boolean isPlusCount() {
        return plusCount;
    }

    /**
     * plusCount attribute 값을 설정한다.
     * @param plusCount the plusCount to set
     */
    public void setPlusCount(boolean plusCount) {
        this.plusCount = plusCount;
    }

    /**
     * subPageIndex attribute를 리턴한다.
     * @return the subPageIndex
     */
    public String getSubPageIndex() {
        return subPageIndex;
    }

    /**
     * subPageIndex attribute 값을 설정한다.
     * @param subPageIndex the subPageIndex to set
     */
    public void setSubPageIndex(String subPageIndex) {
        this.subPageIndex = subPageIndex;
    }

    /**
     * anonymousAt attribute를 리턴한다.
     * @return the anonymousAt
     */
    public String getAnonymousAt() {
        return anonymousAt;
    }

    /**
     * anonymousAt attribute 값을 설정한다.
     * @param anonymousAt the anonymousAt to set
     */
    public void setAnonymousAt(String anonymousAt) {
        this.anonymousAt = anonymousAt;
    }
    
    /**
     * commentCo attribute를 리턴한다.
     * @return the commentCo
     */
    public String getCommentCo() {
        return commentCo;
    }

    
    /**
     * commentCo attribute 값을 설정한다.
     * @param commentCo the commentCo to set
     */
    public void setCommentCo(String commentCo) {
        this.commentCo = commentCo;
    }
    
    public String getEmpKidAt() {
		return empKidAt;
	}

	public void setEmpKidAt(String empKidAt) {
		this.empKidAt = empKidAt;
	}

	
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getOriginFileNm() {
		return originFileNm;
	}

	public void setOriginFileNm(String originFileNm) {
		this.originFileNm = originFileNm;
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
	
	
	
	public String getFilenum() {
		return filenum;
	}

	public void setFilenum(String filenum) {
		this.filenum = filenum;
	}
	
    public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}
	
	public String getEmpNm() {
		return empNm;
	}

	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}

	public String getEmpIntro() {
		return empIntro;
	}

	public void setEmpIntro(String empIntro) {
		this.empIntro = empIntro;
	}
}
