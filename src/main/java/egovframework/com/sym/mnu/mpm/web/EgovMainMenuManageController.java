package egovframework.com.sym.mnu.mpm.web;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovArticleService;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.com.uss.ion.pwm.service.EgovPopupManageService;
import egovframework.com.uss.ion.pwm.service.PopupManageVO;
import egovframework.rte.fdl.property.EgovPropertyService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 메인메뉴 해당링크 처리를 하는 비즈니스 구현 클래스
 * @author 개발환경 개발팀 이용
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  이  용          최초 생성
 *   2011.09.07  서준식          사용자 구분 오류 수정
 *   2015.06.19  조정국          미인증사용자에 대한 보안처리
 *   2018.10.12  이정은          메인페이지 통합(업무, 기업, 일반)
 * </pre>
 */

@Controller
public class EgovMainMenuManageController {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovMainMenuManageController.class);

	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;

	@Resource(name = "EgovArticleService")
    private EgovArticleService egovArticleService;
	
	@Resource(name = "egovPopupManageService")
	private EgovPopupManageService egovPopupManageService;
	
	
    /** EgovFileMngService */
	//@Resource(name="EgovFileMngService")
	//private EgovFileMngService fileMngService;

    /** EgovFileMngUtil */
	//@Resource(name="EgovFileMngUtil")
	//private EgovFileMngUtil fileUtil;

    /*### 메인작업 ###*/
    /*Main Index 조회*/
    /**
     * Main메뉴의 Index를 조회한다.
     * @param menuNo  String
     * @param chkURL  String
     * @return 출력페이지정보 "menu_index"
     * @exception Exception
     */
    @RequestMapping(value="/sym/mnu/mpm/EgovMainMenuIndex.do")
    public String selectMainMenuIndex(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam("menuNo") String menuNo,
    		@RequestParam("chkURL") String chkURL,
    		ModelMap model)
            throws Exception {

    	int iMenuNo = Integer.parseInt(menuNo);
    	menuManageVO.setMenuNo(iMenuNo);
//    	menuManageVO.setTempValue(chkURL);
        model.addAttribute("resultVO", menuManageVO);

        return "egovframework/com/menu_index";
    }

    /**
     * Head메뉴를 조회한다.
     * @param menuManageVO MenuManageVO
     * @return 출력페이지정보 "head"
     * @exception Exception
     */
    @RequestMapping(value="/sym/mnu/mpm/EgovMainMenu.do")
    public String selectMainMenu(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		ModelMap model)
            throws Exception {

    	LoginVO user =
			(LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	menuManageVO.setTmpId(user.getId());
    	menuManageVO.setTmpPassword(user.getPassword());
    	menuManageVO.setTmpUserSe(user.getUserSe());
    	menuManageVO.setTmpName(user.getName());
    	menuManageVO.setTmpEmail(user.getEmail());
    	menuManageVO.setTmpOrgnztId(user.getOrgnztId());
    	menuManageVO.setTmpUniqId(user.getUniqId());

    	List<?> list_headmenu = menuManageService.selectMainMenuHead(menuManageVO);
        model.addAttribute("list_headmenu", list_headmenu);
		if (!user.getId().equals("")) {
        	// 메인 페이지 이동
	    		return "egovframework/com/EgovMainView";
        } else {
        	// 오류 페이지 이동
        	return "egovframework/com/cmm/error/egovError";
        }
    }

    /**
     * Head메뉴를 조회한다.
     * @param menuManageVO MenuManageVO
     * @return 출력페이지정보  "main_head"
     * @exception Exception
     */
    @RequestMapping(value="/sym/mnu/mpm/EgovMainMenuHead.do")
    public String selectMainMenuHead(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		ModelMap model)
            throws Exception {

    	LoginVO user =
			(LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	menuManageVO.setTmpId(user.getId());
    	menuManageVO.setTmpPassword(user.getPassword());
    	menuManageVO.setTmpUserSe(user.getUserSe());
    	menuManageVO.setTmpName(user.getName());
    	menuManageVO.setTmpEmail(user.getEmail());
    	menuManageVO.setTmpOrgnztId(user.getOrgnztId());
    	menuManageVO.setTmpUniqId(user.getUniqId());
        System.out.println("----------------dddddddzzzdd------------------------");
       
    	List<?> list_headmenu = menuManageService.selectMainMenuHead(menuManageVO);
    	System.out.println(list_headmenu);
        
    	model.addAttribute("list_headmenu", list_headmenu);
		if (!user.getId().equals("")) {
        	// 메인 페이지 이동
        		return "egovframework/com/main_head";
        } else {
        	// 오류 페이지 이동
        	return "egovframework/com/cmm/error/egovError";
        }
    }


    /**
     * 좌측메뉴를 조회한다.
     * @param menuManageVO MenuManageVO
     * @param vStartP      String
     * @return 출력페이지정보 "main_left"
     * @exception Exception
     */
    @RequestMapping(value="/sym/mnu/mpm/EgovMainMenuLeft.do")
    public String selectMainMenuLeft(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam("vStartP") String vStartP,
    		ModelMap model)
            throws Exception {
    	int iMenuNo = Integer.parseInt(vStartP);
    	menuManageVO.setTempInt(iMenuNo);
        model.addAttribute("resultVO", menuManageVO);

    	LoginVO user =
			(LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	menuManageVO.setTmpId(user.getId());
    	menuManageVO.setTmpPassword(user.getPassword());
    	menuManageVO.setTmpUserSe(user.getUserSe());
    	menuManageVO.setTmpName(user.getName());
    	menuManageVO.setTmpEmail(user.getEmail());
    	menuManageVO.setTmpOrgnztId(user.getOrgnztId());
    	menuManageVO.setTmpUniqId(user.getUniqId());

    	List<?> list_menulist = menuManageService.selectMainMenuLeft(menuManageVO);
        model.addAttribute("list_menulist", list_menulist);
      	return "egovframework/com/main_left";
    }

    /**
     * 우측화면을 조회한다.
     * @param menuManageVO MenuManageVO
     * @param vStartP      String
     * @return 출력페이지정보 해당URL
     * @exception Exception
     */
    /*Right Menu 조회*/
    @RequestMapping(value="/sym/mnu/mpm/EgovMainMenuRight.do")
    public String selectMainMenuRight(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@RequestParam("vStartP") String vStartP,
    		ModelMap model)
            throws Exception {
    	int iMenuNo = Integer.parseInt(vStartP);
    	LoginVO user =
			(LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

    	String forwardURL = null;
    	forwardURL = menuManageService.selectLastMenuURL(iMenuNo, user.getUniqId());
      	return "forward:"+forwardURL;
    }

    /**
     * HOME 메인화면 조회한다.
     * @param menuManageVO  MenuManageVO
     * @return 출력페이지정보 "EgovMainView"
     * @exception Exception
     */
    @IncludedInfo(name="포털(예제) 메인화면", order = 1, gid = 0)
    @RequestMapping(value="/sym/mnu/mpm/EgovMainMenuHome.do")
    public String selectMainMenuHome(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		@ModelAttribute("searchVO") BoardVO boardVO,
    		PopupManageVO popupManageVO,
    		ModelMap model)
            throws Exception {

    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();    	
    	
    	List<?> popList = null;
    	popList = egovPopupManageService.selectPopupMainList(popupManageVO);
		model.addAttribute("popList", popList);
    	
    	/* 게시판 1 최신 리스트 생성 */
    	boardVO.setBbsId("BBSMSTR_000000000001");
    	List<BoardVO> list1 = egovArticleService.selectArticleListMain(boardVO);
    	
    	/* 게시판 2 최신 리스트 생성 */
    	boardVO.setBbsId("BBSMSTR_000000000002");
    	List<BoardVO> list2 = egovArticleService.selectArticleListMain(boardVO);
    	
    	
    	
    	model.addAttribute("user", user);
        model.addAttribute("list1", list1);
        model.addAttribute("list2", list2);
        
    	
    	return "egovframework/com/EgovMainView";
    }
    
    @RequestMapping(value="/sym/mnu/mpm/EgovMainCustomHead.do")
    public String costomHead(
    		@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,
    		ModelMap model)
            throws Exception {

    	LoginVO user =
			(LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();    	
    	
    	/* 메인헤더 메뉴생성 */
    	List<?> list_headmenu = menuManageService.selectMenuList();
    	
    	if (user == null) {
    		model.addAttribute("user", null);
    	} else {
    		model.addAttribute("user", user);
    	}
        model.addAttribute("list_headmenu", list_headmenu);        
    	
    	return "egovframework/com/head";
    }
}