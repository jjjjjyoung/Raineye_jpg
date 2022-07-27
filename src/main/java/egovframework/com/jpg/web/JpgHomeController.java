package egovframework.com.jpg.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cms.web.MenuManageNewVO;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovArticleService;
import egovframework.com.cop.bbs.service.EgovBBSMasterService;
import egovframework.com.jpg.service.SnsManageService;
import egovframework.com.jpg.service.SnsManageVO;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.com.uss.ion.pwm.service.EgovPopupManageService;
import egovframework.com.uss.ion.pwm.service.PopupManageVO;
import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import solapi.app.SendAlimtalkVariablesSync;



@Controller
public class JpgHomeController{
		
    /** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;

	@Resource(name = "EgovArticleService")
    private EgovArticleService egovArticleService;
	
	@Resource(name = "egovPopupManageService")
	private EgovPopupManageService egovPopupManageService;	
	
	/** mberManageService */
	@Resource(name = "mberManageService")
	private EgovMberManageService mberManageService;
	
	@Resource(name = "EgovBBSMasterService")
    private EgovBBSMasterService egovBBSMasterService;
	
    @Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;
    
	@Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;
	
    @Resource(name = "SnsManageService")
    private SnsManageService snsManageService;
	
    
    
    
    @RequestMapping("/fisrtHome.do")
	public String FirstIndex(@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,@ModelAttribute("searchVO") BoardVO boardVO,PopupManageVO popupManageVO,ModelMap model) throws Exception {
		
		return "egovframework/com/jpg/firstIndex";
		
	}
    
    
	@RequestMapping("/home.do")
	public String MainIndex(@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,@ModelAttribute("searchVO") BoardVO boardVO,PopupManageVO popupManageVO,ModelMap model,@RequestParam HashMap<String,String> paramMap) throws Exception {
		
    	List<?> popList = null;
    	popList = egovPopupManageService.selectPopupMainList(popupManageVO);
		model.addAttribute("popList", popList);
    	
    	/* 공지사항 최신 리스트 생성 */
    	boardVO.setBbsId("BBSMSTR_000000000041");
    	List<BoardVO> list1 = egovArticleService.selectArticleListMain(boardVO);
    	for(BoardVO v : list1) {
			String nttCn = v.getNttCn();
			nttCn = nttCn.replaceAll("&nbsp;", " ");
			nttCn = nttCn.replaceAll("&lt;", "<");
	    	nttCn = nttCn.replaceAll("&gt;", ">");
	    	nttCn = nttCn.replaceAll("&quot;", "\"");
			nttCn = nttCn.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","");
	    	v.setNttCn(nttCn);
    	}
    	BoardMasterVO master1 = new BoardMasterVO();
    	master1.setBbsId(boardVO.getBbsId());		
		master1 = egovBBSMasterService.selectBBSMasterInf(master1);
		
		//String message = "귀하가 제출하신 지원사업 신청에 대한 보완요청이 왔습니다. 확인 바랍니다.";
		//SendAlimtalkVariablesSync sendMessage = new SendAlimtalkVariablesSync();
		//String[] params = {};
		//sendMessage.main(params); // 문자 발송
    	
    	/* 채용공고 최신 리스트 생성 */
    	boardVO.setBbsId("BBSMSTR_000000000042");
    	List<BoardVO> list2 = egovArticleService.selectArticleListMain(boardVO);
    	for(BoardVO v : list2) {
			String nttCn = v.getNttCn();
			nttCn = nttCn.replaceAll("&nbsp;", " ");
			nttCn = nttCn.replaceAll("&lt;", "<");
	    	nttCn = nttCn.replaceAll("&gt;", ">");
	    	nttCn = nttCn.replaceAll("&quot;", "\"");
			nttCn = nttCn.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","");
	    	v.setNttCn(nttCn);
    	}
    	BoardMasterVO master2 = new BoardMasterVO();
    	master2.setBbsId(boardVO.getBbsId());		
    	master2 = egovBBSMasterService.selectBBSMasterInf(master2);
    	
    	/* 언론보도 최신 리스트 생성 */
    	boardVO.setBbsId("BBSMSTR_000000000043");
    	List<BoardVO> list3 = egovArticleService.selectArticleListMain(boardVO);
    	for(BoardVO v : list3) {
			String nttCn = v.getNttCn();
			nttCn = nttCn.replaceAll("&nbsp;", " ");
			nttCn = nttCn.replaceAll("&lt;", "<");
	    	nttCn = nttCn.replaceAll("&gt;", ">");
	    	nttCn = nttCn.replaceAll("&quot;", "\"");
			nttCn = nttCn.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","");
	    	v.setNttCn(nttCn);
    	}
    	BoardMasterVO master3 = new BoardMasterVO();
    	master3.setBbsId(boardVO.getBbsId());		
    	master3 = egovBBSMasterService.selectBBSMasterInf(master3);
    	
    	/* 교육체험 최신 리스트 생성 */
    	boardVO.setBbsId("BBSMSTR_000000000046");
    	List<BoardVO> list4 = egovArticleService.selectArticleListMain(boardVO);
    	for(BoardVO v : list4) {
			String nttCn = v.getNttCn();
			nttCn = nttCn.replaceAll("&nbsp;", " ");
			nttCn = nttCn.replaceAll("&lt;", "<");
	    	nttCn = nttCn.replaceAll("&gt;", ">");
	    	nttCn = nttCn.replaceAll("&quot;", "\"");
			nttCn = nttCn.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","");
	    	v.setNttCn(nttCn);
    	}
    	BoardMasterVO master4 = new BoardMasterVO();
    	master4.setBbsId(boardVO.getBbsId());		
    	master4 = egovBBSMasterService.selectBBSMasterInf(master4);
    	
    	/* 공연 리스트 생성 */
    	boardVO.setBbsId("BBSMSTR_000000000055");
		/*
    	SimpleDateFormat format1 = new SimpleDateFormat("YYYY");
    	Date time = new Date();
        int year =  Integer.parseInt(format1.format(time));
        boardVO.setYearCheak(Integer.toString(year));
        */

    	Map<String, Object> map = egovArticleService.selectArticleMainList(boardVO);
    	BoardMasterVO master5 = new BoardMasterVO();
    	master5.setBbsId(boardVO.getBbsId());		
    	master5 = egovBBSMasterService.selectBBSMasterInf(master5);
    	List<BoardVO> list5 = (List)map.get("resultList");
    	
    	
    	
    	/* 해당년도의 공연이 없을경우 전년도출력 --- jun 
    	 * 추가 - 공연이 없는경우 가장 마지막했던 공연리스트 출력으로 변경 21.03.02
    	 * */
    	/*if(list5.size() < 1) {
    		
    		year =  year-1;
    		boardVO.setYearCheak(Integer.toString(year));
    		map = egovArticleService.selectArticleMainList(boardVO);
    		list5 = (List)map.get("resultList");
    		
    	}*/
    	
    	
    	
    	
    	/* 유튜브 인스타그램 */
    	
    	SnsManageVO snsManageVO = new SnsManageVO();
    	snsManageVO.setSnsType("1");
    	List<?> instar = snsManageService.selectMainList(snsManageVO); 

    	snsManageVO.setSnsType("2");
    	List<?> youtube = snsManageService.selectMainList(snsManageVO); 
    	
    	
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
    	
    	
    	model.addAttribute("youtube", youtube);
    	model.addAttribute("instar", instar);
    	
    	
    	model.addAttribute("list1", list1);
    	model.addAttribute("list2", list2);
    	model.addAttribute("list3", list3);
    	model.addAttribute("list4", list4);
    	model.addAttribute("list5", list5);
    	model.addAttribute("boardMasterVO1", master1);
    	model.addAttribute("boardMasterVO2", master2);
    	model.addAttribute("boardMasterVO3", master3);
    	model.addAttribute("boardMasterVO4", master4);
    	model.addAttribute("boardMasterVO5", master5);
		return "egovframework/com/jpg/index";
		
	}
	
	@RequestMapping("/kidHome.do")
	public String KidMainIndex(@ModelAttribute("menuManageVO") MenuManageVO menuManageVO,@ModelAttribute("searchVO") BoardVO boardVO,PopupManageVO popupManageVO,ModelMap model) throws Exception {
		
    	List<?> popList = null;
    	popList = egovPopupManageService.selectPopupMainList(popupManageVO);
		model.addAttribute("popList", popList);
		
		return "egovframework/com/jpg/kidIndex";
		
	}
	
	@RequestMapping("/menu.do")
	public String MainMenu(MenuManageNewVO menuManageNewVo, FileVO fileVO,ModelMap model,HttpServletRequest request) throws Exception{

		menuManageNewVo.setMePlace("0");
		List<?> list_headmenu = menuManageService.selectMainMenuListNew(menuManageNewVo);
        model.addAttribute("list_headmenu", list_headmenu);
        
		menuManageNewVo.setMePlace("1");
		List<?> mobile_headmenu = menuManageService.selectMainMenuListNew(menuManageNewVo);
        model.addAttribute("mobile_headmenu", mobile_headmenu);
        
    	List<FileVO> select = null;
    	fileVO.setStreFileNm("BGM_");
    	
    	select = fileService.selectBgmFile(fileVO);
    	
    	if(select.size() > 0) fileVO = select.get(0);
    	String stordFilePath = EgovProperties.getProperty("Globals.fileStorePath");

    	
    	model.addAttribute("path", stordFilePath);
    	model.addAttribute("audio", fileVO);
        
		return "egovframework/com/jpg/include/header";
	}

	@RequestMapping("/kidMenu.do")
	public String KidMenu(MenuManageNewVO menuManageNewVo, ModelMap model,HttpServletRequest request) throws Exception{

		menuManageNewVo.setMePlace("0");
		List<?> list_sitemenu = menuManageService.selectMainMenuListNew(menuManageNewVo);
        model.addAttribute("list_sitemenu", list_sitemenu);
		
		menuManageNewVo.setMePlace("1");
		List<?> mobile_headmenu = menuManageService.selectMainMenuListNew(menuManageNewVo);
        model.addAttribute("mobile_headmenu", mobile_headmenu);
        
        
        
		return "egovframework/com/jpg/include/kidHeader";
	}
	
	
	@RequestMapping("/mypage.do")
	public String mypage( ModelMap model,HttpServletRequest request) throws Exception{

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if(loginVO == null){
			return "redirect:/home.do";
		}
		
		MberManageVO mberManageVO = mberManageService.selectMber(loginVO.getUniqId());
		model.addAttribute("mberManageVO", mberManageVO);
		
		return "egovframework/com/jpg/userMyInfo";
	}
	
	@RequestMapping("/myinfoUp.do")
	public String myinfoUp(@ModelAttribute("mberManageVO") MberManageVO mberManageVO, ModelMap model,HttpServletRequest request) throws Exception{

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if(loginVO == null){
			return "redirect:/home.do";
		}
		mberManageVO.setLevel("1");
		mberManageService.updateMber(mberManageVO);

		
		return "redirect:/mypage.do";
	}
	
	@RequestMapping("/search.do")
	public String search(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, ModelMap model,HttpServletRequest request) throws Exception{

		/*
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if(loginVO == null){
			return "redirect:/home.do";
		}
		*/
		//List<?> searchList = egovArticleService.selectArticleListSearch(userSearchVO);
		Map<String, Object> map = egovArticleService.selectArticleListSearch(userSearchVO);
		
		List<BoardVO> resultList = (List)map.get("resultList");
		for(BoardVO v : resultList) {
		
			String nttCn = v.getNttCn();
			nttCn = nttCn.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>","");
			v.setNttCn(nttCn);
		}
		
		model.addAttribute("searchList", map.get("resultList"));
		
		return "egovframework/com/jpg/userSearch";
	}

	@RequestMapping("/userOut.do")
	public String userOut(ModelMap model,HttpServletRequest request) throws Exception {
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if(loginVO == null){
			return "redirect:/home.do";
		}

		MberManageVO mberManageVO = mberManageService.selectMber(loginVO.getUniqId());
		model.addAttribute("mberManageVO", mberManageVO);

		return "egovframework/com/jpg/userOut";
	}

	@RequestMapping("/userOutProc.do")
	public String userOutProc(@ModelAttribute("mberManageVO") MberManageVO mberManageVO, ModelMap model,HttpServletRequest request) throws Exception {
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if(loginVO == null){
			return "redirect:/home.do";
		}

		mberManageVO.setMberId(loginVO.getId());
		mberManageVO.setMberNm(loginVO.getName());


		mberManageService.insertOutMberData(mberManageVO);
		mberManageService.deleteOutMber(mberManageVO);

		request.getSession().setAttribute("loginVO", null);

		model.addAttribute("outMsg", "회원탈퇴가 완료되었습니다.");

		return "egovframework/com/jpg/index";
	}
	


	
}
