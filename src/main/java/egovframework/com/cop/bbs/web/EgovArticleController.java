package egovframework.com.cop.bbs.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.util.EgovXssChecker;
import egovframework.com.cms.web.MenuManageNewVO;
import egovframework.com.cop.bbs.service.BlogVO;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovArticleService;
import egovframework.com.cop.bbs.service.EgovBBSMasterService;
import egovframework.com.cop.bbs.service.EgovBBSSatisfactionService;
import egovframework.com.cop.cmt.service.CommentVO;
import egovframework.com.cop.cmt.service.EgovArticleCommentService;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.fdl.string.EgovStringUtil;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 게시물 관리를 위한 컨트롤러 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------       --------    ---------------------------
 *   2009.3.19  이삼섭          최초 생성
 *   2009.06.29	한성곤			2단계 기능 추가 (댓글관리, 만족도조사)
 *   2011.07.01 안민정		 	댓글, 스크랩, 만족도 조사 기능의 종속성 제거
 *   2011.8.26	정진오			IncludedInfo annotation 추가
 *   2011.09.07 서준식           유효 게시판 게시일 지나도 게시물이 조회되던 오류 수정
 *   2016.06.13 김연호			표준프레임워크 3.6 개선
 * </pre>
 */

@Controller
public class EgovArticleController {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovArticleController.class);
	
	@Resource(name = "EgovArticleService")
    private EgovArticleService egovArticleService;

    @Resource(name = "EgovBBSMasterService")
    private EgovBBSMasterService egovBBSMasterService;

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileMngService;

    @Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    @Resource(name = "EgovArticleCommentService")
    protected EgovArticleCommentService egovArticleCommentService;

    @Resource(name = "EgovBBSSatisfactionService")
    private EgovBBSSatisfactionService bbsSatisfactionService;
    
	/** EgovMenuManageService */
	@Resource(name = "meunManageService")
	private EgovMenuManageService menuManageService;

    @Autowired
    private DefaultBeanValidator beanValidator;

    //protected Logger log = Logger.getLogger(this.getClass());
    
    /**
     * XSS 방지 처리.
     * 
     * @param data
     * @return
     */
    protected String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }
        
        String ret = data;
        
        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");
        
        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");
        
        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");
        
        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        
        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;
    }

    /**
     * 게시물에 대한 목록을 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectArticleList.do")
    public String selectArticleList(@ModelAttribute("searchVO") BoardVO boardVO, HttpServletRequest request,MenuManageNewVO searchVO,ModelMap model,
    		@RequestParam HashMap<String,String> paramMap, String date,String day,
    	   @RequestParam(required=false, defaultValue="0") int year ,
    	   @RequestParam(required=false, defaultValue="M") String skin,
    	   @RequestParam(required=false, defaultValue="N") String type,
    	   @RequestParam(required=false, defaultValue="L") String ca
    	   ) throws Exception {
    	/*
    	String id=boardVO.getBbsId().substring(boardVO.getBbsId().length()-3, boardVO.getBbsId().length());
		int bBsId=Integer.parseInt(id.toString());
    	 */
		if(type.equals("k")) {
			model.addAttribute("kid","Y");
		}else {
			model.addAttribute("kid","N");
		}
		
		
		/* 22.06.28 창준추가 
    	 * 대메뉴별 최신글 확인
    	 * */
    	paramMap.put("num", "2");
    	int m2 = egovArticleService.getArticleMenuCount(paramMap);
    	paramMap.put("num", "3");
    	int m3 = egovArticleService.getArticleMenuCount(paramMap);
    	paramMap.put("num", "4");
    	int m4 = egovArticleService.getArticleMenuCount(paramMap);
    	
    	model.addAttribute("m2", m2);
    	model.addAttribute("m3", m3);
    	model.addAttribute("m4", m4);
		 
		
		String message = (String)request.getParameter("message");
		if (message!=null) model.addAttribute("message", message);
    	
    	
		SimpleDateFormat format1 = new SimpleDateFormat ("MM");
    	SimpleDateFormat format2 = new SimpleDateFormat ("yyyy");
    	Date time = new Date();
    	String dateCheak="";
    	String datePluse="0";
    	int month=0;
    	String time1 = format1.format(time);
        int time2 =  Integer.parseInt(format2.format(time));	
      
    	if(year==0) {
    		year=time2;
    	}
    	boardVO.setYearCheak(Integer.toString(year));
		
    	if(day == null) {
			SimpleDateFormat dayformat1 = new SimpleDateFormat ( "dd");
			Date daytime = new Date();
			day = dayformat1.format(daytime);
		}
    	
    	if(date==null) {
    		if(!skin.equals("M") &&  !skin.equals("Y")) {
	    		boardVO.setDateCheak(time1);
	    		boardVO.setDayCheak(day);
	    		dateCheak=time1;
    		}else{
    			dateCheak=time1;
    		}
    	}else {
    		boardVO.setDateCheak(date);
    		if(!skin.equals("Y") && !skin.equals("M")) {
    			boardVO.setDayCheak(day);
    		}
    		dateCheak=date;
    	}
    	
    	if(dateCheak.length()<2) {
    		dateCheak=datePluse.concat(dateCheak);
    	}
    	
    	if(!skin.equals("Y")) {
    		boardVO.setDateCheak(dateCheak);
    	}
    	
    	switch(dateCheak){
	         case "01" : 
	        	 month = Calendar.JANUARY;
	             break;
	         case "02" : 
	        	 month = Calendar.FEBRUARY;
	             break;  
	         case "03" : 
	        	 month = Calendar.MARCH;
	             break;  
	         case "04" : 
	        	 month = Calendar.APRIL;
	             break;  
	         case "05" : 
	        	 month = Calendar.MAY;
	             break;  
	         case "06" : 
	        	 month = Calendar.JUNE;
	             break;  
	         case "07" : 
	        	 month = Calendar.JANUARY;
	             break;  
	         case "08" : 
	        	 month = Calendar.AUGUST;
	             break;  
	         case "09" : 
	        	 month = Calendar.SEPTEMBER;
	             break;  
	         case "10" : 
	        	 month = Calendar.OCTOBER;
	             break;  
	         case "11" : 
	        	 month = Calendar.NOVEMBER;
	             break;
	         case "12" : 
	        	 month = Calendar.DECEMBER;
	             break;     
	    }
    	
        int days = 1;
        Calendar cal = new GregorianCalendar(year, month, days);
        int daysOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		BoardMasterVO vo = new BoardMasterVO();
		
		vo.setBbsId(boardVO.getBbsId());
		//vo.setUniqId(user.getUniqId());
		BoardMasterVO master = egovBBSMasterService.selectBBSMasterInf(vo);

		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());
	
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		boardVO.setSkin(skin);
		 
		Map<String, Object> map = egovArticleService.selectArticleList(boardVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		if(master.getBbsTyCode().equals("SKIN04")) {
			
			/*egovArticleService.updateRecStatus(boardVO);*/
		}
		
		//공지사항 추출
		
		List<BoardVO> noticeList = egovArticleService.selectNoticeArticleList(boardVO);
		
		paginationInfo.setTotalRecordCount(totCnt);
		
		//교육/체험 프로그램 용 공지사항 추출
		if(master.getBbsTyCode().equals("SKIN04")) {
			BoardVO notiVO = new BoardVO();
			notiVO.setBbsId("BBSMSTR_000000000046");
			List<BoardVO> noticeEduList = egovArticleService.selectNoticeEduArticleList(notiVO);
			model.addAttribute("noticeEduList", noticeEduList);
		}
	
		if(user != null) {
	    	model.addAttribute("sessionUniqId", user.getUniqId());
	    }
		
		List<BoardVO> resultList = (List)map.get("resultList");
		for(BoardVO v : resultList) {
			String career = v.getEmpCareer();
			career = career.replaceAll("(\r\n|\r|\n|\n\r)","<br/>");
			v.setEmpCareer(career);
			
			String edu = v.getEmpEdu();
			edu = edu.replaceAll("(\r\n|\r|\n|\n\r)","<br/>");
			v.setEmpEdu(edu);
		}
		
		
		SimpleDateFormat todayformat1 = new SimpleDateFormat ( "yyyy-MM-dd");
		Date todaytime = new Date();
		String Today = todayformat1.format(todaytime);
		String Pastday = year+"-"+dateCheak+"-"+day;
		String Pastday_temp = year+""+dateCheak+""+day;
		
		model.addAttribute("Today", Today); 
		model.addAttribute("Pastday", Pastday);
		model.addAttribute("Pastday_temp", Pastday_temp);
		
		model.addAttribute("user", user); 
		model.addAttribute("daysOfMonth", daysOfMonth); 
		model.addAttribute("dateCheak", dateCheak);
		model.addAttribute("dayCheak", day);
		model.addAttribute("yearCheak", year);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("articleVO", boardVO);
		model.addAttribute("boardMasterVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("noticeList", noticeList);
		
		//System.out.println(boardVO.toString());
		
		//메뉴
		MenuManageNewVO meCode = menuManageService.seachMenu(boardVO.getBbsId());
		String parentCode = null;
		String parentName = null;
		String meName = null;
		if(meCode == null ) {
			
			parentCode = "10";
			parentName = "미등록";
			meCode = new MenuManageNewVO();
			meCode.setMeCode("1010");
			meName = "미등록";
			
		}else {
			
			parentCode = meCode.getMeCode().substring(0,2);
			MenuManageNewVO parent = menuManageService.parentName(parentCode);
			parentName = parent.getMeName();
			if(meCode.getMeCode().equals("4010")) {
				meName = "공지사항";
			}else {
				meName = meCode.getMeName();
			}
		}
		
		model.addAttribute("meName", meName);
		model.addAttribute("parentName", parentName);
		model.addAttribute("parentCode", parentCode);
		model.addAttribute("meCode", meCode.getMeCode());
		
		List<?> list_menumanage = menuManageService.selectMenuManageListNew(searchVO);
		model.addAttribute("list_menumanage", list_menumanage);
		
		/* 리스트 스킨 분기 */
		if(master.getBbsTyCode().equals("SKIN01")) {
			return "egovframework/com/jpg/skinBbsList";
		} else if(master.getBbsTyCode().equals("SKIN02")) {
			return "egovframework/com/jpg/skinGalleryList";
		} else if(master.getBbsTyCode().equals("SKIN03")) {
			return "egovframework/com/jpg/skinProfileList";
		} else if(master.getBbsTyCode().equals("SKIN04")) {
			return "egovframework/com/jpg/skinEduList";
		} else if(master.getBbsTyCode().equals("SKIN05")) {
			if(skin.equals("M")) {
				if(ca.equals("L")) {
					return "egovframework/com/cop/bbs/EgovPeformanceList";
				}else {
					return "egovframework/com/cop/bbs/EgovPeformanceCalList";
				}
			}else if(skin.equals("D")) {
				return "egovframework/com/cop/bbs/EgovPeformanceListDay";
			}else if(skin.equals("Y")) {
				return "egovframework/com/cop/bbs/EgovPeformanceListYear";
			}	
	    } 
			return "forward:/home.do";
		
    }
    
    
    
    /**
     * 게시물에 대한 상세 정보를 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectArticleDetail.do")
    public String selectArticleDetail(@ModelAttribute("searchVO") BoardVO boardVO, MenuManageNewVO searchVO,ModelMap model,@RequestParam(required=false, defaultValue="M") String skin,
    	@RequestParam HashMap<String,String> paramMap) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			
//		boardVO.setLastUpdusrId(user.getUniqId());
		BoardVO vo = egovArticleService.selectArticleDetail(boardVO);
		
		String ctsCn = vo.getNttCn();
    	ctsCn = ctsCn.replaceAll("&lt;", "<");
    	ctsCn = ctsCn.replaceAll("&gt;", ">");
    	ctsCn = ctsCn.replaceAll("&quot;", "\"");
    	vo.setNttCn(ctsCn);
    	 
		String career = vo.getEmpCareer();
		career = career.replaceAll("(\r\n|\r|\n|\n\r)","<br/>");
		vo.setEmpCareer(career);
		
		String edu = vo.getEmpEdu();
		edu = edu.replaceAll("(\r\n|\r|\n|\n\r)","<br/>");
		vo.setEmpEdu(edu);
    	
		model.addAttribute("result", vo); 
		model.addAttribute("user", user); 
		//model.addAttribute("sessionUniqId", user.getUniqId());
		
		//비밀글은 작성자만 볼수 있음 
		
		/* 22.06.28 창준추가 
    	 * 대메뉴별 최신글 확인
    	 * */
    	paramMap.put("num", "2");
    	int m2 = egovArticleService.getArticleMenuCount(paramMap);
    	paramMap.put("num", "3");
    	int m3 = egovArticleService.getArticleMenuCount(paramMap);
    	paramMap.put("num", "4");
    	int m4 = egovArticleService.getArticleMenuCount(paramMap);
    	
    	model.addAttribute("m2", m2);
    	model.addAttribute("m3", m3);
    	model.addAttribute("m4", m4);
		
		
		if(user == null && !EgovStringUtil.isEmpty(vo.getSecretAt()) && vo.getSecretAt().equals("Y") ){
			LoginVO login = new LoginVO();
			login.setUniqId("");
			String uniqId = login.getUniqId();
			
			if(!uniqId.equals(vo.getFrstRegisterId())) {
				String message = "비밀글은 작성자만 볼 수 있습니다.";
				model.addAttribute("message", message);
				return "redirect:/cop/bbs/selectArticleList.do?bbsId="+vo.getBbsId();
			}
		}
		
		BoardMasterVO master = new BoardMasterVO();
		
		master.setBbsId(boardVO.getBbsId());
		//master.setUniqId(user.getUniqId());
		
		BoardMasterVO masterVo = egovBBSMasterService.selectBBSMasterInf(master);
		
		model.addAttribute("boardMasterVO", masterVo);
		
		//메뉴
		MenuManageNewVO meCode = menuManageService.seachMenu(boardVO.getBbsId());
		String parentCode = null;
		if(meCode == null && (boardVO.getBbsId().equals("BBSMSTR_000000000054") || boardVO.getBbsId().equals("BBSMSTR_000000000053")) ) {
			parentCode = "20";
			meCode = new MenuManageNewVO();
			meCode.setMeCode("2010");
			meCode.setMeName("공연정보");
		}else {
			parentCode = meCode.getMeCode().substring(0,2);	
		}
		MenuManageNewVO parent = menuManageService.parentName(parentCode);
		String parentName = parent.getMeName();
		model.addAttribute("parentName", parentName);
		model.addAttribute("parentCode", parentCode);
		model.addAttribute("meName", meCode.getMeName());
		model.addAttribute("meCode", meCode.getMeCode());
		List<?> list_menumanage = menuManageService.selectMenuManageListNew(searchVO);
		model.addAttribute("list_menumanage", list_menumanage);
		model.addAttribute("skin", skin);
		
		SimpleDateFormat todayformat1 = new SimpleDateFormat ( "yyyy-MM-dd");
		Date todaytime = new Date();
		String Today = todayformat1.format(todaytime);
		
		model.addAttribute("Today", Today); 
		
		if(boardVO.getBbsId().equals("BBSMSTR_000000000061")) {
			model.addAttribute("kid","Y");
		}
		
		/* 스킨 분기 */
		if(masterVo.getBbsTyCode().equals("SKIN01")) {
			return "egovframework/com/jpg/skinBbsView";
		} else if(masterVo.getBbsTyCode().equals("SKIN02")) {
			return "egovframework/com/jpg/skinGalleryList";
		} else if(masterVo.getBbsTyCode().equals("SKIN03")) {
			return "egovframework/com/jpg/skinProfileView";
		} else if(masterVo.getBbsTyCode().equals("SKIN04")) {
			return "egovframework/com/jpg/skinEduView";
		} else if(masterVo.getBbsTyCode().equals("SKIN05")) {
			return "egovframework/com/cop/bbs/EgovPeformanceDetail";
		} else if(masterVo.getBbsTyCode().equals("SKIN06")) {
			return "egovframework/com/jpg/skinContents";
		} else {
			return "home.do";
		}
    }

    /**
     * 게시물 등록을 위한 등록페이지로 이동한다.
     * 
     * @param boardVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/insertArticleView.do")
    public String insertArticleView(@ModelAttribute("searchVO") BoardVO boardVO, MenuManageNewVO searchVO,ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	
		if(user == null) {
			return "redirect:/cop/bbs/selectArticleList.do?bbsId="+boardVO.getBbsId();
		}
		
		BoardMasterVO bdMstr = new BoardMasterVO();
		
	    BoardMasterVO vo = new BoardMasterVO();
	    vo.setBbsId(boardVO.getBbsId());
	    vo.setUniqId(user.getUniqId());
	
	    bdMstr = egovBBSMasterService.selectBBSMasterInf(vo);
		
		model.addAttribute("articleVO", boardVO);
		model.addAttribute("boardMasterVO", bdMstr);
		
		//메뉴
		MenuManageNewVO meCode = menuManageService.seachMenu(boardVO.getBbsId());
		String parentCode = null;
		if(meCode == null ) {
			parentCode = "20";
			meCode = new MenuManageNewVO();
			meCode.setMeCode("2010");
			meCode.setMeName("공연정보");
		}else {
			parentCode = meCode.getMeCode().substring(0,2);
		}
		MenuManageNewVO parent = menuManageService.parentName(parentCode);
		String parentName = parent.getMeName();
		model.addAttribute("parentName", parentName);
		model.addAttribute("parentCode", parentCode);
		model.addAttribute("meName", meCode.getMeName());
		model.addAttribute("meCode", meCode.getMeCode());
		List<?> list_menumanage = menuManageService.selectMenuManageListNew(searchVO);
		model.addAttribute("list_menumanage", list_menumanage);
		
		model.addAttribute("user", user);
		/* 글쓰기 스킨 분기 */
		if(bdMstr.getBbsTyCode().equals("SKIN01")) {
			return "egovframework/com/jpg/skinBbsWrite";
		} else if(bdMstr.getBbsTyCode().equals("SKIN02")) {
			return "egovframework/com/cop/bbs/EgovGalleryRegist";
		} else if(bdMstr.getBbsTyCode().equals("SKIN03")) {
			return "egovframework/com/cop/bbs/EgovEmployeeRegist";
		} else if(bdMstr.getBbsTyCode().equals("SKIN04")) {
			return "egovframework/com/jpg/skinEduWrite";
		} else if(bdMstr.getBbsTyCode().equals("SKIN05")) {
			return "egovframework/com/cop/bbs/EgovPerformanceRegist";
		} else {
			return "forward:/home.do";
		}
    }
    /**
     * 게시물을 등록한다.
     * 
     * @param boardVO
     * @param board
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/insertArticle.do")
    public String insertArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") BoardVO board, BindingResult bindingResult, 
	    ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		BoardMasterVO vo = new BoardMasterVO();
		
		vo.setBbsId(boardVO.getBbsId());
		BoardMasterVO master = egovBBSMasterService.selectBBSMasterInf(vo);
		
		//System.out.println(bindingResult);
		
		/** 벨리데이션 체크에 걸림 */
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
	
		    model.addAttribute("boardMasterVO", master);
		    
		    /* 글쓰기 스킨 분기 */
			if(bdMstr.getBbsTyCode().equals("SKIN01")) {
				return "egovframework/com/jpg/skinBbsWrite";
			} else if(bdMstr.getBbsTyCode().equals("SKIN02")) {
				return "egovframework/com/cop/bbs/EgovGalleryRegist";
			} else if(bdMstr.getBbsTyCode().equals("SKIN03")) {
				return "egovframework/com/cop/bbs/EgovEmployeeRegist";
			} else if(bdMstr.getBbsTyCode().equals("SKIN04")) {
				return "egovframework/com/jpg/skinEduWrite";
			} else if(bdMstr.getBbsTyCode().equals("SKIN05")) {
				return "egovframework/com/cop/bbs/EgovPerformanceRegist";
			} else {
				return "forward:/home.do";
			}
		}
		
	    List<FileVO> result = null;
	    String atchFileId = "";
	    
	    final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    if (!files.isEmpty()) {
		result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
		atchFileId = fileMngService.insertFileInfs(result);
	    }
	    board.setAtchFileId(atchFileId);
	    board.setFrstRegisterId(user.getUniqId());
	    board.setBbsId(boardVO.getBbsId());
	    board.setBlogId(boardVO.getBlogId());
	    
	    if(master.getBbsTyCode().equals("SKIN04")) {
	    	board.setRecStatus("1");
	    	if(!board.getEduFee().equals(null)) {
	    		board.setTutFee("1");
	    	}
	    }
	    
	    //익명등록 처리 
	    if(board.getAnonymousAt() != null && board.getAnonymousAt().equals("Y")){
	    	board.setNtcrId("anonymous"); //게시물 통계 집계를 위해 등록자 ID 저장
	    	board.setNtcrNm("익명"); //게시물 통계 집계를 위해 등록자 Name 저장
	    	board.setFrstRegisterId("anonymous");
	    	
	    } else {
	    	board.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
	    	board.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장	
	    }
	    
	    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

	    /** 리스트 스킨 분기 
	     * 각 쿼리도 스킨분기에 맞춰서 같이 분기시켜주세요.
	     * 기존에 하나의 유형이어서 하나의 쿼리로 커버 됬었지만 우리는 여러 유형으로 나눠서
	     * 기존쿼리 그냥 바꿔버리면 다른사람들 쪽에서 오류 납니다.
	     * 서로 방해되지 않게 그냥 스킨별로 나눠버립시다.
	     * 각자 만드는 게시판 SELECT 쿼리 제외하고는 스킨별로 나눠주세요.
	     * 쿼리 명명은 insertSkin1Article 의 식으로 가운데에 스킨명 넣어주세요.*/
	    
		if(master.getBbsTyCode().equals("SKIN01")) {
			
			egovArticleService.insertSkin1Article(board);
			return"redirect:/cop/bbs/selectArticleList.do?bbsId="+board.getBbsId();
			
		} else if(master.getBbsTyCode().equals("SKIN02")) {
			egovArticleService.insertSkin2Article(board);
			
			return "redirect:/cop/bbs/selectArticleList.do?bbsId="+board.getBbsId();
		} else if(master.getBbsTyCode().equals("SKIN03")) {
			egovArticleService.insertSkin3Article(board);
			// 계속 등록할 수 있도록 요청옴 (04월14일 PPT) 
			return "redirect:/cop/bbs/insertArticleView.do?bbsId="+board.getBbsId();
		} else if(master.getBbsTyCode().equals("SKIN04")) {
			egovArticleService.insertSkin4Article(board);			
			return"redirect:/cop/bbs/selectArticleList.do?bbsId="+board.getBbsId();
			
		} else if(master.getBbsTyCode().equals("SKIN05")) {
			egovArticleService.insertSkin5Article(board);
			return"redirect:/cop/bbs/selectArticleList.do?bbsId="+board.getBbsId();
		} else {
			return "redirect:/home.do";
		}
		
    }

    /**
     * 게시물에 대한 답변 등록을 위한 등록페이지로 이동한다.
     * 
     * @param boardVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/replyArticleView.do")
    public String addReplyBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();//KISA 보안취약점 조치 (2018-12-10, 이정은)

        if(!isAuthenticated) {
            return "egovframework/com/uat/uia/EgovLoginUsr";
        }
        
		BoardMasterVO master = new BoardMasterVO();
		BoardVO articleVO = new BoardVO();
		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());
	
		master = egovBBSMasterService.selectBBSMasterInf(master);
		boardVO = egovArticleService.selectArticleDetail(boardVO);
		
		//----------------------------
		// 기본 BBS template 지정 
		//----------------------------
		if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
		    master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}
	
		model.addAttribute("boardMasterVO", master);
		model.addAttribute("result", boardVO);
	
		model.addAttribute("articleVO", articleVO);
		
		if(boardVO.getBlogAt().equals("chkBlog")){
			return "egovframework/com/cop/bbs/EgovArticleBlogReply";
		}else{
			return "egovframework/com/cop/bbs/EgovArticleReply";
		}
    }

    /**
     * 게시물에 대한 답변을 등록한다.
     * 
     * @param boardVO
     * @param board
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/replyArticle.do")
    public String replyBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") BoardVO board, BindingResult bindingResult, ModelMap model
	    ) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if(!isAuthenticated) {	//KISA 보안취약점 조치 (2018-12-10, 이정은)
            return "egovframework/com/uat/uia/EgovLoginUsr";
        }
		
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
		    BoardMasterVO master = new BoardMasterVO();
		    
		    master.setBbsId(boardVO.getBbsId());
		    master.setUniqId(user.getUniqId());
	
		    master = egovBBSMasterService.selectBBSMasterInf(master);
		    
	
		    //----------------------------
		    // 기본 BBS template 지정 
		    //----------------------------
		    if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
			master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		    }
	
		    model.addAttribute("articleVO", boardVO);
		    model.addAttribute("boardMasterVO", master);
		    ////-----------------------------
	
		    return "egovframework/com/cop/bbs/EgovArticleReply";
		}
	
		if (isAuthenticated) {
		    final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    String atchFileId = "";
	
		    if (!files.isEmpty()) {
			List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
			atchFileId = fileMngService.insertFileInfs(result);
		    }
	
		    board.setAtchFileId(atchFileId);
		    board.setReplyAt("Y");
		    board.setFrstRegisterId(user.getUniqId());
		    board.setBbsId(board.getBbsId());
		    board.setParnts(Long.toString(boardVO.getNttId()));
		    board.setSortOrdr(boardVO.getSortOrdr());
		    board.setReplyLc(Integer.toString(Integer.parseInt(boardVO.getReplyLc()) + 1));
		    
		  //익명등록 처리 
		    if(board.getAnonymousAt() != null && board.getAnonymousAt().equals("Y")){
		    	board.setNtcrId("anonymous"); //게시물 통계 집계를 위해 등록자 ID 저장
		    	board.setNtcrNm("익명"); //게시물 통계 집계를 위해 등록자 Name 저장
		    	board.setFrstRegisterId("anonymous");
		    	
		    } else {
		    	board.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
		    	board.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
		    	
		    }
		    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지
		    
		    egovArticleService.insertArticle(board);
		}
		
		return "forward:/cop/bbs/selectArticleList.do";
    }

    /**
     * 게시물 수정을 위한 수정페이지로 이동한다.
     * 
     * @param boardVO
     * @param vo
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/updateArticleView.do")
    public String updateArticleView(@ModelAttribute("searchVO") BoardVO boardVO,MenuManageNewVO searchVO, @ModelAttribute("board") BoardVO vo, ModelMap model)
	    throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(user == null) {
			return "redirect:/cop/bbs/selectArticleList.do?bbsId="+boardVO.getBbsId();
		}
		//boardVO.setFrstRegisterId(user.getUniqId());
		
		BoardMasterVO bmvo = new BoardMasterVO();
		BoardVO bdvo = new BoardVO();
		
		vo.setBbsId(boardVO.getBbsId());
		
		bmvo.setBbsId(boardVO.getBbsId());
		bmvo.setUniqId(user.getUniqId());
		
	    bmvo = egovBBSMasterService.selectBBSMasterInf(bmvo);
	    bdvo = egovArticleService.selectArticleDetail(boardVO);
	
		//익명 등록글인 경우 수정 불가 
		if(bdvo.getNtcrId().equals("anonymous")){
			model.addAttribute("result", bdvo);
			model.addAttribute("boardMasterVO", bmvo);
			return "egovframework/com/cop/bbs/EgovArticleDetail";
		}
		model.addAttribute("result", bdvo);
		model.addAttribute("articleVO", bdvo);
		model.addAttribute("boardMasterVO", bmvo);		
		
		
		//메뉴
		MenuManageNewVO meCode = menuManageService.seachMenu(boardVO.getBbsId());
		String parentCode = meCode.getMeCode().substring(0,2);
		MenuManageNewVO parent = menuManageService.parentName(parentCode);
		String parentName = parent.getMeName();
		model.addAttribute("parentName", parentName);
		model.addAttribute("parentCode", parentCode);
		model.addAttribute("meName", meCode.getMeName());
		model.addAttribute("meCode", meCode.getMeCode());
		List<?> list_menumanage = menuManageService.selectMenuManageListNew(searchVO);
		model.addAttribute("list_menumanage", list_menumanage);
		
		if(boardVO.getBbsId().equals("BBSMSTR_000000000061")) {
			model.addAttribute("kid","Y");
		}
		
		/* 글쓰기 스킨 분기 */
		if(bmvo.getBbsTyCode().equals("SKIN01")) {
			return "egovframework/com/jpg/skinBbsUpdt";
		} else if(bmvo.getBbsTyCode().equals("SKIN02")) {
			return "egovframework/com/cop/bbs/EgovGalleryUpdt";
		} else if(bmvo.getBbsTyCode().equals("SKIN03")) {
			return "egovframework/com/cop/bbs/EgovEmployeeUpdt";
		} else if(bmvo.getBbsTyCode().equals("SKIN04")) {
			
			return "egovframework/com/jpg/skinEduUpdt";
			
		} else if(bmvo.getBbsTyCode().equals("SKIN05")) {
			return "egovframework/com/cop/bbs/EgovPerformanceUpdt";
		} else {
			return "forward:/home.do";
		}
    }

    /**
     * 게시물에 대한 내용을 수정한다.
     * 
     * @param boardVO
     * @param board
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/updateArticle.do")
    public String updateBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		//--------------------------------------------------------------------------------------------
    	// @ XSS 대응 권한체크 체크  START
    	// param1 : 사용자고유ID(uniqId,esntlId)
    	//--------------------------------------------------------
    	LOGGER.debug("@ XSS 권한체크 START ----------------------------------------------");
    	//step1 DB에서 해당 게시물의 uniqId 조회
    	BoardVO vo = egovArticleService.selectArticleDetail(boardVO);
    	
    	//step2 EgovXssChecker 공통모듈을 이용한 권한체크
    	EgovXssChecker.checkerUserXss(multiRequest, vo.getFrstRegisterId()); 
      	LOGGER.debug("@ XSS 권한체크 END ------------------------------------------------");
    	//--------------------------------------------------------
    	// @ XSS 대응 권한체크 체크 END
    	//--------------------------------------------------------------------------------------------
	
		String atchFileId = boardVO.getAtchFileId();
	
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
	
		    //boardVO.setFrstRegisterId(user.getUniqId());
		    
		    BoardMasterVO bmvo = new BoardMasterVO();
		    BoardVO bdvo = new BoardVO();
		    
		    bmvo.setBbsId(boardVO.getBbsId());
		    bmvo.setUniqId(user.getUniqId());
	
		    bmvo = egovBBSMasterService.selectBBSMasterInf(bmvo);
		    bdvo = egovArticleService.selectArticleDetail(boardVO);
	
		    model.addAttribute("articleVO", bdvo);
		    model.addAttribute("boardMasterVO", bmvo);
	
		    return "egovframework/com/jpg/skinBbsUpdt";
		}
		
	    final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    if (!files.isEmpty()) {
			if ("".equals(atchFileId)) {
			    List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, "");
			    atchFileId = fileMngService.insertFileInfs(result);
			    board.setAtchFileId(atchFileId);
			} else {
			    FileVO fvo = new FileVO();
			    fvo.setAtchFileId(atchFileId);
			    int cnt = fileMngService.getMaxFileSN(fvo);
			    List<FileVO> _result = fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "");
			    fileMngService.updateFileInfs(_result);
			}
	    }

	    board.setLastUpdusrId(user.getUniqId());
	    
	    board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
	    board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
	    
	    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지
	    
	    
	    if(bdMstr.getBbsTyCode().equals("SKIN01")) {
			egovArticleService.updateSkin1Article(board);
			
			return"forward:/cop/bbs/selectArticleList.do?bbsId="+board.getBbsId();
		} else if(bdMstr.getBbsTyCode().equals("SKIN02")) {
			egovArticleService.updateSkin2Article(board);
			if(board.getYoutube() == null) {
				return "redirect:/cop/bbs/selectArticleList.do?bbsId="+board.getBbsId();
			}else {
				return "redirect:/cop/bbs/selectYoutubeList.do?bbsId="+board.getBbsId();
			}
		} else if(bdMstr.getBbsTyCode().equals("SKIN03")) {
			egovArticleService.updateSkin3Article(board);
			
			return "redirect:/cop/bbs/selectArticleList.do?bbsId="+board.getBbsId();
		} else if(bdMstr.getBbsTyCode().equals("SKIN04")) {
			
			egovArticleService.updateSkin4Article(board);
			return"forward:/cop/bbs/selectArticleList.do?bbsId="+board.getBbsId();
		} else if(bdMstr.getBbsTyCode().equals("SKIN05")) {
			
			egovArticleService.updateSkin5Article(board);
			 return "redirect:/cop/bbs/selectArticleList.do?bbsId="+board.getBbsId();
		} else {
			return "forward:/home.do";
		}
    }

    /**
     * 게시물에 대한 내용을 삭제한다.
     * 
     * @param boardVO
     * @param board
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/deleteArticle.do")
    public String deleteBoardArticle(HttpServletRequest request, @ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model) throws Exception {
	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		//--------------------------------------------------------------------------------------------
    	// @ XSS 대응 권한체크 체크  START
    	// param1 : 사용자고유ID(uniqId,esntlId)
    	//--------------------------------------------------------
    	LOGGER.debug("@ XSS 권한체크 START ----------------------------------------------");
    	//step1 DB에서 해당 게시물의 uniqId 조회
    	BoardVO vo = egovArticleService.selectArticleDetail(boardVO);
    	
    	//step2 EgovXssChecker 공통모듈을 이용한 권한체크
    	EgovXssChecker.checkerUserXss(request, vo.getFrstRegisterId()); 
      	LOGGER.debug("@ XSS 권한체크 END ------------------------------------------------");
    	//--------------------------------------------------------
    	// @ XSS 대응 권한체크 체크 END
    	//--------------------------------------------------------------------------------------------
		
		BoardVO bdvo = egovArticleService.selectArticleDetail(boardVO);
		
		//익명 등록글인 경우 수정 불가 
		if(bdvo.getNtcrId().equals("anonymous")){
			model.addAttribute("result", bdvo);
			model.addAttribute("boardMasterVO", bdMstr);
			return "egovframework/com/cop/bbs/EgovArticleDetail";
		}
		
		if (isAuthenticated) {
		    board.setLastUpdusrId(user.getUniqId());
		    
		    egovArticleService.deleteArticle(board);
		}
		
		if(boardVO.getBlogAt().equals("chkBlog")){
			return "forward:/cop/bbs/selectArticleBlogList.do";
		}else{
			return "forward:/cop/bbs/selectArticleList.do";
		}
    }
    
    /**
     * 방명록에 대한 목록을 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectGuestArticleList.do")
    public String selectGuestArticleList(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		/*Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if(!isAuthenticated) {	//KISA 보안취약점 조치 (2018-12-10, 이정은)
            return "egovframework/com/uat/uia/EgovLoginUsr";
        }*/
		
		// 수정 및 삭제 기능 제어를 위한 처리
		//model.addAttribute("sessionUniqId", user.getUniqId());
		
		BoardVO vo = new BoardVO();
	
		vo.setBbsId(boardVO.getBbsId());
		vo.setBbsNm(boardVO.getBbsNm());
		if (user != null) {
			vo.setNtcrNm(user.getName());
		} else {
			vo.setNtcrNm(null);
		}
		//vo.setNtcrId(user.getUniqId());
	
		BoardMasterVO masterVo = new BoardMasterVO();
		
		masterVo.setBbsId(vo.getBbsId());
		//masterVo.setUniqId(user.getUniqId());
		
		BoardMasterVO mstrVO = egovBBSMasterService.selectBBSMasterInf(masterVo);
	
		vo.setPageIndex(boardVO.getPageIndex());
		vo.setPageUnit(propertyService.getInt("pageUnit"));
		vo.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
	
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		Map<String, Object> map = egovArticleService.selectGuestArticleList(vo);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
	
		model.addAttribute("user", user);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardMasterVO", mstrVO);
		model.addAttribute("articleVO", vo);
		model.addAttribute("paginationInfo", paginationInfo);
	
		return "egovframework/com/cop/bbs/EgovGuestArticleList";
    }
    
	
    /**
     * 방명록에 대한 내용을 등록한다.
     * 
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/insertGuestArticle.do")
    public String insertGuestList(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("Board") Board board, BindingResult bindingResult,
	    ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		if(!isAuthenticated) {	//KISA 보안취약점 조치 (2018-12-10, 이정은)
            return "egovframework/com/uat/uia/EgovLoginUsr";
        }
		
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
	
		    BoardVO vo = new BoardVO();
	
		    vo.setBbsId(boardVO.getBbsId());
		    vo.setBbsNm(boardVO.getBbsNm());
		    vo.setNtcrNm(user.getName());
		    vo.setNtcrId(user.getUniqId());
	
		    BoardMasterVO masterVo = new BoardMasterVO();
		    
		    masterVo.setBbsId(vo.getBbsId());
		    masterVo.setUniqId(user.getUniqId());
		    
		    BoardMasterVO mstrVO = egovBBSMasterService.selectBBSMasterInf(masterVo);
	
		    vo.setPageUnit(propertyService.getInt("pageUnit"));
		    vo.setPageSize(propertyService.getInt("pageSize"));
	
		    PaginationInfo paginationInfo = new PaginationInfo();
		    paginationInfo.setCurrentPageNo(vo.getPageIndex());
		    paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		    paginationInfo.setPageSize(vo.getPageSize());
	
		    vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		    vo.setLastIndex(paginationInfo.getLastRecordIndex());
		    vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		    Map<String, Object> map = egovArticleService.selectGuestArticleList(vo);
		    int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		    
		    paginationInfo.setTotalRecordCount(totCnt);
	
		    model.addAttribute("resultList", map.get("resultList"));
		    model.addAttribute("resultCnt", map.get("resultCnt"));
		    model.addAttribute("boardMasterVO", mstrVO);
		    model.addAttribute("articleVO", vo);	    
		    model.addAttribute("paginationInfo", paginationInfo);
	
		    return "egovframework/com/cop/bbs/EgovGuestArticleList";
	
		}
	
		if (isAuthenticated) {
		    board.setFrstRegisterId(user.getUniqId());
		    
		    egovArticleService.insertArticle(board);
	
		    boardVO.setNttCn("");
		    boardVO.setPassword("");
		    boardVO.setNtcrId("");
		    boardVO.setNttId(0);
		}
	
		return "forward:/cop/bbs/selectGuestArticleList.do";
    }
    
    /**
     * 방명록에 대한 내용을 삭제한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/deleteGuestArticle.do")
    public String deleteGuestList(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("articleVO") Board board, ModelMap model) throws Exception {
		@SuppressWarnings("unused")
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (isAuthenticated) {
		    egovArticleService.deleteArticle(boardVO);
		}
		
		return "forward:/cop/bbs/selectGuestArticleList.do";
    }
    
    /**
     * 방명록 수정을 위한 특정 내용을 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/updateGuestArticleView.do")
    public String updateGuestArticleView(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("boardMasterVO") BoardMasterVO brdMstrVO,
	    ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if(!isAuthenticated) {	//KISA 보안취약점 조치 (2018-12-10, 이정은)
            return "egovframework/com/uat/uia/EgovLoginUsr";
        }
	
		// 수정 및 삭제 기능 제어를 위한 처리
		model.addAttribute("sessionUniqId", user.getUniqId());
		
		BoardVO vo = egovArticleService.selectArticleDetail(boardVO);
	
		boardVO.setBbsId(boardVO.getBbsId());
		boardVO.setBbsNm(boardVO.getBbsNm());
		boardVO.setNtcrNm(user.getName());
	
		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());
	
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		Map<String, Object> map = egovArticleService.selectGuestArticleList(boardVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
	
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("articleVO", vo);
		model.addAttribute("paginationInfo", paginationInfo);
	
		return "egovframework/com/cop/bbs/EgovGuestArticleList";
    }
    
    /**
     * 방명록을 수정하고 게시판 메인페이지를 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/updateGuestArticle.do")
    public String updateGuestArticle(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute Board board, BindingResult bindingResult,
	    ModelMap model) throws Exception {

		//BBST02, BBST04
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if(!isAuthenticated) {	//KISA 보안취약점 조치 (2018-12-10, 이정은)
            return "egovframework/com/uat/uia/EgovLoginUsr";
        }
	
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
	
		    BoardVO vo = new BoardVO();
	
		    vo.setBbsId(boardVO.getBbsId());
		    vo.setBbsNm(boardVO.getBbsNm());
		    vo.setNtcrNm(user.getName());
		    vo.setNtcrId(user.getUniqId());
	
		    BoardMasterVO masterVo = new BoardMasterVO();
		    
		    masterVo.setBbsId(vo.getBbsId());
		    masterVo.setUniqId(user.getUniqId());
		    
		    BoardMasterVO mstrVO = egovBBSMasterService.selectBBSMasterInf(masterVo);
	
		    vo.setPageUnit(propertyService.getInt("pageUnit"));
		    vo.setPageSize(propertyService.getInt("pageSize"));
	
		    PaginationInfo paginationInfo = new PaginationInfo();
		    paginationInfo.setCurrentPageNo(vo.getPageIndex());
		    paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		    paginationInfo.setPageSize(vo.getPageSize());
	
		    vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		    vo.setLastIndex(paginationInfo.getLastRecordIndex());
		    vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		    Map<String, Object> map = egovArticleService.selectGuestArticleList(vo);
		    int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
		    paginationInfo.setTotalRecordCount(totCnt);
		    
		    model.addAttribute("resultList", map.get("resultList"));
		    model.addAttribute("resultCnt", map.get("resultCnt"));
		    model.addAttribute("boardMasterVO", mstrVO);
		    model.addAttribute("articleVO", vo);
		    model.addAttribute("paginationInfo", paginationInfo);
	
		    return "egovframework/com/cop/bbs/EgovGuestArticleList";
		}
	
		if (isAuthenticated) {
		    egovArticleService.updateArticle(board);
		    boardVO.setNttCn("");
		    boardVO.setPassword("");
		    boardVO.setNtcrId("");
		    boardVO.setNttId(0);
		}
	
		return "forward:/cop/bbs/selectGuestArticleList.do";
    }
    
    /*********************
     * 블로그관련
     * ********************/
    
    /**
     * 블로그 게시판에 대한 목록을 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectArticleBlogList.do")
    public String selectArticleBlogList(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();	//KISA 보안취약점 조치 (2018-12-10, 이정은)

        if(!isAuthenticated) {
            return "egovframework/com/uat/uia/EgovLoginUsr";
        }
		
		BlogVO blogVo = new BlogVO();
		blogVo.setFrstRegisterId(user.getUniqId());
		blogVo.setBbsId(boardVO.getBbsId());
		blogVo.setBlogId(boardVO.getBlogId());
		BlogVO master = egovBBSMasterService.selectBlogDetail(blogVo);
		
		boardVO.setFrstRegisterId(user.getUniqId());

		//블로그 카테고리관리 권한(로그인 한 사용자만 가능)
		int loginUserCnt =  egovArticleService.selectLoginUser(boardVO);
		
		//블로그 게시판 제목 추출
		List<BoardVO> blogNameList = egovArticleService.selectBlogNmList(boardVO);

		if(user != null) {
	    	model.addAttribute("sessionUniqId", user.getUniqId());
	    }
		
		model.addAttribute("articleVO", boardVO);
		model.addAttribute("boardMasterVO", master);
		model.addAttribute("blogNameList", blogNameList);
		model.addAttribute("loginUserCnt", loginUserCnt);
		
		return "egovframework/com/cop/bbs/EgovArticleBlogList";
    }
    
    /**
     * 블로그 게시물에 대한 상세 타이틀을 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectArticleBlogDetail.do")
    public ModelAndView selectArticleBlogDetail(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		 Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();	//KISA 보안취약점 조치 (2018-12-10, 이정은)

	        if(!isAuthenticated) {
	        	throw new IllegalAccessException("Login Required!");
	        }
	        
		BoardVO vo = new BoardVO();
		
		boardVO.setLastUpdusrId(user.getUniqId());
		
		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());
		
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<BoardVO> blogSubJectList = egovArticleService.selectArticleDetailDefault(boardVO);
		vo = egovArticleService.selectArticleCnOne(boardVO);
		
		int totCnt = egovArticleService.selectArticleDetailDefaultCnt(boardVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("blogSubJectList", blogSubJectList);
		mav.addObject("paginationInfo", paginationInfo);
		
		if(vo.getNttCn() != null){
			mav.addObject("blogCnOne", vo);
		}
		
		//비밀글은 작성자만 볼수 있음 
		if(!EgovStringUtil.isEmpty(vo.getSecretAt()) && vo.getSecretAt().equals("Y") && !user.getUniqId().equals(vo.getFrstRegisterId()))
		mav.setViewName("forward:/cop/bbs/selectArticleList.do");
		return mav;
    }
    
    /**
     * 블로그 게시물에 대한 상세 내용을 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectArticleBlogDetailCn.do")
    public ModelAndView selectArticleBlogDetailCn(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("commentVO") CommentVO commentVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		boardVO.setLastUpdusrId(user.getUniqId());
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();	//KISA 보안취약점 조치 (2018-12-10, 이정은)

        if(!isAuthenticated) {
        	throw new IllegalAccessException("Login Required!");
        }
		
		BoardVO vo = egovArticleService.selectArticleDetail(boardVO);
		
		String ctsCn = vo.getNttCn();
    	ctsCn = ctsCn.replaceAll("&lt;", "<");
    	ctsCn = ctsCn.replaceAll("&gt;", ">");
    	ctsCn = ctsCn.replaceAll("&quot;", "\"");
    	vo.setNttCn(ctsCn);
		
		//----------------------------
		// 댓글 처리
		//----------------------------
		CommentVO articleCommentVO = new CommentVO();
		commentVO.setWrterNm(user.getName());
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(commentVO.getSubPageIndex());
		paginationInfo.setRecordCountPerPage(commentVO.getSubPageUnit());
		paginationInfo.setPageSize(commentVO.getSubPageSize());
	
		commentVO.setSubFirstIndex(paginationInfo.getFirstRecordIndex());
		commentVO.setSubLastIndex(paginationInfo.getLastRecordIndex());
		commentVO.setSubRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		Map<String, Object> map = egovArticleCommentService.selectArticleCommentList(commentVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
		
	    //댓글 처리 END
		//----------------------------
		
		List<BoardVO> blogCnList = egovArticleService.selectArticleDetailCn(boardVO);
		ModelAndView mav = new ModelAndView("jsonView");
		
		// 수정 처리된 후 댓글 등록 화면으로 처리되기 위한 구현
		if (commentVO.isModified()) {
		    commentVO.setCommentNo("");
		    commentVO.setCommentCn("");
		}
		
		// 수정을 위한 처리
		if (!commentVO.getCommentNo().equals("")) {
			mav.setViewName ("forward:/cop/cmt/updateArticleCommentView.do");
		}
		
		mav.addObject("blogCnList", blogCnList);
		mav.addObject("resultUnder", vo);
		mav.addObject("paginationInfo", paginationInfo);
		mav.addObject("resultList", map.get("resultList"));
		mav.addObject("resultCnt", map.get("resultCnt"));
		mav.addObject("articleCommentVO", articleCommentVO);	// validator 용도
		
		commentVO.setCommentCn("");	// 등록 후 댓글 내용 처리
		
		//비밀글은 작성자만 볼수 있음 
		if(!EgovStringUtil.isEmpty(vo.getSecretAt()) && vo.getSecretAt().equals("Y") && !user.getUniqId().equals(vo.getFrstRegisterId()))
		mav.setViewName("forward:/cop/bbs/selectArticleList.do");
		return mav;
		
    }
    
    /**
     * 개인블로그 관리 
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectBlogListManager.do")
    public String selectBlogMasterList(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
    	
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	
    	boardVO.setPageUnit(propertyService.getInt("pageUnit"));
    	boardVO.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());
	
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		boardVO.setFrstRegisterId(user.getUniqId());
		
		Map<String, Object> map = egovArticleService.selectBlogListManager(boardVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
	
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));	
		model.addAttribute("paginationInfo", paginationInfo);
    	
    	return "egovframework/com/cop/bbs/EgovBlogListManager";
    }

    /**
     * 템플릿에 대한 미리보기용 게시물 목록을 조회한다.
     * 
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/previewBoardList.do")
    public String previewBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		//LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	
		String template = boardVO.getSearchWrd();	// 템플릿 URL
		
		BoardMasterVO master = new BoardMasterVO();
		
		master.setBbsNm("미리보기 게시판");
	
		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());
	
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		BoardVO target = null;
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		target = new BoardVO();
		target.setNttSj("게시판 기능 설명");
		target.setFrstRegisterId("ID");
		target.setFrstRegisterNm("관리자");
		target.setFrstRegisterPnttm("2019-01-01");
		target.setInqireCo(7);
		target.setParnts("0");
		target.setReplyAt("N");
		target.setReplyLc("0");
		target.setUseAt("Y");
		
		list.add(target);
		
		target = new BoardVO();
		target.setNttSj("게시판 부가 기능 설명");
		target.setFrstRegisterId("ID");
		target.setFrstRegisterNm("관리자");
		target.setFrstRegisterPnttm("2019-01-01");
		target.setInqireCo(7);
		target.setParnts("0");
		target.setReplyAt("N");
		target.setReplyLc("0");
		target.setUseAt("Y");
		
		list.add(target);
		
		boardVO.setSearchWrd("");
	
		int totCnt = list.size();
		
		//공지사항 추출
		List<BoardVO> noticeList = egovArticleService.selectNoticeArticleList(boardVO);
	
		paginationInfo.setTotalRecordCount(totCnt);
	
		master.setTmplatCours(template);
		
		model.addAttribute("resultList", list);
		model.addAttribute("resultCnt", Integer.toString(totCnt));
		model.addAttribute("articleVO", boardVO);
		model.addAttribute("boardMasterVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("noticeList", noticeList);
		
		model.addAttribute("preview", "true");
	
		return "egovframework/com/cop/bbs/EgovArticleList";
    }

    /**
     * 미리보기 커뮤니티 메인페이지를 조회한다.
     * 
     * @param cmmntyVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/previewBlogMainPage.do")
    public String previewBlogMainPage(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();	//KISA 보안취약점 조치 (2018-12-10, 이정은)

    	String tmplatCours = boardVO.getSearchWrd();
    	
		BlogVO master = new BlogVO();
		master.setBlogNm("미리보기 블로그");
		master.setBlogIntrcn("미리보기를 위한 블로그입니다.");
		master.setUseAt("Y");
		master.setFrstRegisterId(user.getUniqId());
		
		boardVO.setFrstRegisterId(user.getUniqId());

		//블로그 카테고리관리 권한(로그인 한 사용자만 가능)
		int loginUserCnt =  egovArticleService.selectLoginUser(boardVO);
		
		//블로그 게시판 제목 추출
		List<BoardVO> blogNameList = new ArrayList<BoardVO>();
		
		BoardVO target = null;
		target = new BoardVO();
		target.setBbsNm("블로그게시판#1");
		
		blogNameList.add(target);
		
		
		if(user != null) {
	    	model.addAttribute("sessionUniqId", user.getUniqId());
	    }
		
		model.addAttribute("articleVO", boardVO);
		model.addAttribute("boardMasterVO", master);
		model.addAttribute("blogNameList", blogNameList);
		model.addAttribute("loginUserCnt", 1);
		
		model.addAttribute("preview", "true");
		
		return tmplatCours;   
	}
        
    @RequestMapping("/cop/bbs/selectYoutubeList.do")
    public String selectYoutubeList(@ModelAttribute("searchVO") BoardVO boardVO, MenuManageNewVO searchVO,  @RequestParam(required=false, defaultValue="N") String type,ModelMap model,@RequestParam HashMap<String,String> paramMap) throws Exception {
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	
		if(type.equals("k")) {
			model.addAttribute("kid","Y");
		}else {
			model.addAttribute("kid","N");
		}
		
		/* 22.06.28 창준추가 
    	 * 대메뉴별 최신글 확인
    	 * */
    	paramMap.put("num", "2");
    	int m2 = egovArticleService.getArticleMenuCount(paramMap);
    	paramMap.put("num", "3");
    	int m3 = egovArticleService.getArticleMenuCount(paramMap);
    	paramMap.put("num", "4");
    	int m4 = egovArticleService.getArticleMenuCount(paramMap);
    	
    	model.addAttribute("m2", m2);
    	model.addAttribute("m3", m3);
    	model.addAttribute("m4", m4);
    	
    	
		BoardMasterVO vo = new BoardMasterVO();
		
		vo.setBbsId(boardVO.getBbsId());
		/*vo.setUniqId(user.getUniqId());*/
		BoardMasterVO master = egovBBSMasterService.selectBBSMasterInf(vo);
		
		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());
	
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
		Map<String, Object> map = egovArticleService.selectYoutubeList(boardVO);
		
		//공지사항 추출
		List<BoardVO> noticeList = egovArticleService.selectNoticeArticleList(boardVO);
		
		//메뉴
		MenuManageNewVO meCode = menuManageService.seachMenu(boardVO.getBbsId());
		String parentCode = meCode.getMeCode().substring(0,2);
		MenuManageNewVO parent = menuManageService.parentName(parentCode);
		String parentName = parent.getMeName();
		model.addAttribute("parentName", parentName);
		model.addAttribute("parentCode", parentCode);
		model.addAttribute("meName", meCode.getMeName());
		model.addAttribute("meCode", meCode.getMeCode());
		List<?> list_menumanage = menuManageService.selectMenuManageListNew(searchVO);
		model.addAttribute("list_menumanage", list_menumanage);
	

		model.addAttribute("user", user); 
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("articleVO", boardVO);
		model.addAttribute("boardMasterVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("noticeList", noticeList);
		
		return "egovframework/com/jpg/skinVodList";
    }
    
    @RequestMapping("/cop/bbs/insertYoutubeView.do")
    public String insertYoutubeView(@ModelAttribute("searchVO") BoardVO boardVO,MenuManageNewVO searchVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		BoardMasterVO bdMstr = new BoardMasterVO();
	    BoardMasterVO vo = new BoardMasterVO();
	    vo.setBbsId(boardVO.getBbsId());
	    vo.setUniqId(user.getUniqId());
	    bdMstr = egovBBSMasterService.selectBBSMasterInf(vo);
	    
		//메뉴
		MenuManageNewVO meCode = menuManageService.seachMenu(boardVO.getBbsId());
		String parentCode = meCode.getMeCode().substring(0,2);
		MenuManageNewVO parent = menuManageService.parentName(parentCode);
		String parentName = parent.getMeName();
		model.addAttribute("parentName", parentName);
		model.addAttribute("parentCode", parentCode);
		model.addAttribute("meName", meCode.getMeName());
		model.addAttribute("meCode", meCode.getMeCode());
		List<?> list_menumanage = menuManageService.selectMenuManageListNew(searchVO);
		model.addAttribute("list_menumanage", list_menumanage);
		
		model.addAttribute("articleVO", boardVO);
		model.addAttribute("boardMasterVO", bdMstr);
		
		return "egovframework/com/cop/bbs/EgovYoutubeRegist";
    }    
    
    @RequestMapping("/cop/bbs/updateYoutubeView.do")
    public String updateYoutubeView(@ModelAttribute("searchVO") BoardVO boardVO, MenuManageNewVO searchVO,ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/cop/bbs/selectArticleList.do?bbsId="+boardVO.getBbsId();
		}
		
		BoardMasterVO bmvo = new BoardMasterVO();
		BoardVO bdvo = new BoardVO();
		
		boardVO.setBbsId(boardVO.getBbsId());
		
		bmvo.setBbsId(boardVO.getBbsId());
		bmvo.setUniqId(user.getUniqId());
		
	    bmvo = egovBBSMasterService.selectBBSMasterInf(bmvo);
	    bdvo = egovArticleService.selectArticleDetail(boardVO);
	
		//익명 등록글인 경우 수정 불가 
		if(bdvo.getNtcrId().equals("anonymous")){
			model.addAttribute("result", bdvo);
			model.addAttribute("boardMasterVO", bmvo);
			return "egovframework/com/cop/bbs/EgovArticleDetail";
		}
		model.addAttribute("result", bdvo);
		model.addAttribute("articleVO", bdvo);
		model.addAttribute("boardMasterVO", bmvo);		
		
		
		//메뉴
		MenuManageNewVO meCode = menuManageService.seachMenu(boardVO.getBbsId());
		String parentCode = meCode.getMeCode().substring(0,2);
		MenuManageNewVO parent = menuManageService.parentName(parentCode);
		String parentName = parent.getMeName();
		model.addAttribute("parentName", parentName);
		model.addAttribute("parentCode", parentCode);
		model.addAttribute("meName", meCode.getMeName());
		model.addAttribute("meCode", meCode.getMeCode());
		List<?> list_menumanage = menuManageService.selectMenuManageListNew(searchVO);
		model.addAttribute("list_menumanage", list_menumanage);
		
		return "egovframework/com/cop/bbs/EgovYoutubeUpdt";
    }    
}
