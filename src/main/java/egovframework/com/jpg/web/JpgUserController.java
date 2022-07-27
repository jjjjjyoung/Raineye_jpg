package egovframework.com.jpg.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cms.web.MenuManageNewVO;
import egovframework.com.jpg.service.EduProgramService;
import egovframework.com.jpg.service.EduProgramVO;
import egovframework.com.jpg.service.PaidMemberService;
import egovframework.com.jpg.service.PaidMemberVO;
import egovframework.com.jpg.service.SnsManageService;
import egovframework.com.jpg.service.SnsManageVO;
import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.com.uss.umt.service.UserManageVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class JpgUserController{

	/** mberManageService */
	@Resource(name = "mberManageService")
	private EgovMberManageService mberManageService;
	
	@Resource(name = "PaidMemberService")
	private PaidMemberService paidMemberService;
	
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name = "EduProgramService")
	private EduProgramService eduProgramService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;
	
    @Resource(name = "EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;
	
    @Resource(name = "SnsManageService")
    private SnsManageService snsManageService;
    
	@RequestMapping("/publeView.do")
	public String UserLogin(@RequestParam Map<?, ?> commandMap,ModelMap model) throws Exception {
		
		String getCom = (String)commandMap.get("id");
		String getType = ((String)commandMap.get("type") != null)?(String)commandMap.get("type"):"N";
		
		if (getCom.equals("showMonthCld")) {
			return "egovframework/com/jpg/showMonthCld";
		} else if (getCom.equals("showMonthList")) {
			return "egovframework/com/jpg/showMonthList";
		} else if (getCom.equals("showDayList")) {
			return "egovframework/com/jpg/showDayList";
		} else if (getCom.equals("showView")) {
			return "egovframework/com/jpg/showView";
		} else if (getCom.equals("showYearList")) {
			return "egovframework/com/jpg/showYearList";
		} else if (getCom.equals("skinBbsList")) {
			if(getType.equals("k")) {
				model.addAttribute("kid", "Y");
			}else {
				model.addAttribute("kid", "N");
			}
			return "egovframework/com/jpg/skinBbsList";
		} else if (getCom.equals("skinBbsView")) {
			return "egovframework/com/jpg/skinBbsView";
		} else if (getCom.equals("skinBbsWrite")) {
			return "egovframework/com/jpg/skinBbsWrite";
		} else if (getCom.equals("skinEduList")) {
			return "egovframework/com/jpg/skinEduList";
		} else if (getCom.equals("skinEduView")) {
			return "egovframework/com/jpg/skinEduView";
		} else if (getCom.equals("skinGalleryList")) {
			return "egovframework/com/jpg/skinGalleryList";
		} else if (getCom.equals("skinGalleryView")) {
			return "egovframework/com/jpg/skinGalleryView";
		} else if (getCom.equals("skinProfileList")) {
			if(getType.equals("k")) {
				model.addAttribute("kid", "Y");
			}else {
				model.addAttribute("kid", "N");
			}
			return "egovframework/com/jpg/skinProfileList";
		} else if (getCom.equals("skinProfileView")) {
			return "egovframework/com/jpg/skinProfileView";
		} else if (getCom.equals("skinVodList")) {
			return "egovframework/com/jpg/skinVodList";
		} else if (getCom.equals("skinVodView")) {
			return "egovframework/com/jpg/skinVodView";
		} else if (getCom.equals("userHistory")) {
			return "egovframework/com/jpg/userHistory";
		} else if (getCom.equals("userMyInfo")) {
			return "egovframework/com/jpg/userMyInfo";
		} else if (getCom.equals("userOut")) {
			return "egovframework/com/jpg/userOut";
		} else if (getCom.equals("kidRec")) {
			return "egovframework/com/jpg/kidRec";
		} else if (getCom.equals("userJoinAgree")) {
			return "egovframework/com/jpg/userJoinAgree";
		} else if (getCom.equals("userJoinComp")) {
			return "egovframework/com/jpg/userJoinComp";
		} else if (getCom.equals("userJoinProc")) {
			return "egovframework/com/jpg/userJoinProc";
		} else if (getCom.equals("userPaidJoinAgree")) {
			return "egovframework/com/jpg/userPaidJoinAgree";
		} else if (getCom.equals("userPaidJoinComp")) {
			return "egovframework/com/jpg/userPaidJoinComp";
		} else if (getCom.equals("userPaidJoinProc")) {
			return "egovframework/com/jpg/userPaidJoinProc";
		} else if (getCom.equals("userForget")) {
			return "egovframework/com/jpg/userForget";
		} else {
			return "egovframework/com/jpg/index";
		}
	}
	
	

	
	@RequestMapping("/userForget.do")
	public String UserForget() throws Exception {
		return "egovframework/com/jpg/userForget";
	}
	
	@RequestMapping("/userJoinAgree.do")
	public String UserJoinAgree() throws Exception {
		return "egovframework/com/jpg/userJoinAgree";
	}
	
	@RequestMapping("/userJoinProc.do")
	public String UserJoinProc() throws Exception {
		return "egovframework/com/jpg/userJoinProc";
	}
	
	@RequestMapping("/userJoinComp.do")
	public String UserJoinComp() throws Exception {
		return "egovframework/com/jpg/userJoinComp";
	}
	
	@RequestMapping("/userPaidJoinAgree.do")
	public String UserPaidJoinAgree(ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		model.addAttribute("loginVO", user);
		
		MberManageVO mberManageVO = new MberManageVO();
		
		if(user != null && user.getUniqId() != null) {
			mberManageVO = mberManageService.selectMber(user.getUniqId());
			
		}
		
		model.addAttribute("mberManageVO", mberManageVO);
		return "egovframework/com/jpg/userPaidJoinAgree";
	}
	
	@RequestMapping("/userPaidJoinProc.do")
	public String UserPaidJoinProc(ModelMap model) throws Exception {
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if(loginVO == null) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		
		MberManageVO mberManageVO = mberManageService.selectMber(loginVO.getUniqId());
		model.addAttribute("mberManageVO", mberManageVO);
		
		
		return "egovframework/com/jpg/userPaidJoinProc";
	}
	
	@RequestMapping("/userPaidJoinComp.do")
	public String UserPaidJoinComp(@ModelAttribute("PaidMemberVO") PaidMemberVO paidMemberVO) throws Exception {
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if(loginVO == null) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		
		
		paidMemberVO.setMberId(loginVO.getId());
		paidMemberVO.setMberUniqId(loginVO.getUniqId());
		// 신청중 상태로 고정
		
		paidMemberVO.setMberStatus("I");
		paidMemberService.insert(paidMemberVO);
		
		return "egovframework/com/jpg/userPaidJoinComp";
	}
	
	@RequestMapping("/paidMemberList.do")
	public String paidMemberList(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		

		/** EgovPropertyService */
		userSearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		userSearchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(userSearchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(userSearchVO.getPageUnit());
		paginationInfo.setPageSize(userSearchVO.getPageSize());

		userSearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		userSearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		userSearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		

		List<?> userList = paidMemberService.selectList(userSearchVO);
		model.addAttribute("resultList", userList);

		int totCnt = paidMemberService.selectListTotCnt(userSearchVO);
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "egovframework/com/cms/paidMemberList";
	}
	
	@RequestMapping("/paidMemberView.do")
	public String paidMemberView(@RequestParam("selectedId") String idx, @ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		

		PaidMemberVO paidMemberVO = new PaidMemberVO();
		paidMemberVO = paidMemberService.selectUser(idx);
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("paidMemberVO", paidMemberVO);

		return "egovframework/com/cms/paidMemberView";
	}
	
	@RequestMapping("/paidMemberUpdate.do")
	public String paidMemberUpdate(@ModelAttribute("paidMemberVO") PaidMemberVO paidMemberVO, ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
		paidMemberService.updateUser(paidMemberVO);
		
		String mberStatus = paidMemberVO.getMberStatus();
		
		if("C".equals(mberStatus)) {
			MberManageVO mberManageVO = new MberManageVO();
			String dues = paidMemberVO.getDues();
			
				// 1년 회원
			mberManageVO.setLevel("2");
			
			mberManageVO.setMberId(paidMemberVO.getMberId());
			mberManageService.updateMberPaid(mberManageVO);
			
		}
		
		/*else if("N".equals(mberStatus)){
			MberManageVO mberManageVO = new MberManageVO();
			
			mberManageVO.setLevel("1");	
			mberManageVO.setMberId(paidMemberVO.getMberId());
			mberManageService.updateMberPaid(mberManageVO);
		}*/
		
		//Exception 없이 진행시 수정성공메시지
		model.addAttribute("resultMsg", "success.common.update");
		return "forward:/paidMemberList.do";
	}
	
	
	@RequestMapping("/paidMemberDel.do")
	public String paidMemberDel(@RequestParam("checkedIdForDel") String checkedIdForDel,@ModelAttribute("paidMemberVO") PaidMemberVO paidMemberVO, ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
		System.out.println("sadfafdasfd");
		

		paidMemberService.deleteUser(checkedIdForDel);
		//Exception 없이 진행시 수정성공메시지
		model.addAttribute("resultMsg", "success.common.delete");
		return "redirect:/snsManage.do";
	}
	
	
	
	@RequestMapping("/eduRegist.do")
	public String eduRegist(@RequestParam Map<?, ?> commandMap,MenuManageNewVO searchVO,ModelMap model) throws Exception{
		
		 String nttId = commandMap.get("nttId") == null ? "" : (String) commandMap.get("nttId");
		 String bbsId = commandMap.get("bbsId") == null ? "" : (String) commandMap.get("bbsId");
		 String eduType = commandMap.get("eduType") == null ? "" : (String) commandMap.get("eduType");
		 String eduApplyTel = commandMap.get("eduApplyTel") == null ? "" : (String) commandMap.get("eduApplyTel");
		 String eduApplyName = commandMap.get("eduApplyName") == null ? "" : (String) commandMap.get("eduApplyName");
		 
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/cop/bbs/selectArticleList.do?bbsId="+bbsId;
		}
		
		EduProgramVO eduProgramVO = new EduProgramVO();
		eduProgramVO.setNttId(nttId);
		eduProgramVO.setBbsId(bbsId);
		eduProgramVO.setRegistId(user.getUniqId());
		eduProgramVO.setStatus("I");
		eduProgramVO.setEduType(eduType);
		eduProgramVO.setEduApplyTel(eduApplyTel);
		eduProgramVO.setEduApplyName(eduApplyName);
		
		eduProgramService.regist(eduProgramVO);
	
		
		return "redirect:/userHistory.do";		
	}
	
	@RequestMapping("/userHistory.do")
	public String userHistory(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
		EduProgramVO eduProgramVO = new EduProgramVO();
		eduProgramVO.setRegistId(user.getUniqId());
		
		/** EgovPropertyService */
		eduProgramVO.setPageUnit(propertiesService.getInt("pageUnit"));
		eduProgramVO.setPageSize(propertiesService.getInt("pageSize"));

		
		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(userSearchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(userSearchVO.getPageUnit());
		paginationInfo.setPageSize(userSearchVO.getPageSize());

		eduProgramVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		eduProgramVO.setLastIndex(paginationInfo.getLastRecordIndex());
		eduProgramVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<EduProgramVO> list = eduProgramService.seleteMyEdu(eduProgramVO);
		
		int totCnt = eduProgramService.seleteMyEduCnt(eduProgramVO);
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<?> userList = paidMemberService.selectListOne(user.getId());
		
		model.addAttribute("resultList", userList);
		
		model.addAttribute("list", list);
		
		return "egovframework/com/jpg/userHistory";
	}
	
	
	@RequestMapping("/cancleEdu.do")
	public String cancleEdu(@RequestParam Map<?, ?> commandMap,ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
		String eduId = commandMap.get("eduId") == null ? "" : (String) commandMap.get("eduId");
		
		EduProgramVO eduProgramVO = new EduProgramVO();
		eduProgramVO.setRegistId(user.getUniqId());
		eduProgramVO.setEduId(eduId);
		eduProgramService.cancleMyEdu(eduProgramVO);
		/*
		EduProgramVO eduProgramVO = new EduProgramVO();
		eduProgramVO.setRegistId(user.getUniqId());
		List<EduProgramVO> list = eduProgramService.seleteMyEdu(eduProgramVO);
		
		model.addAttribute("list", list);
		*/
		return "redirect:/userHistory.do";
	}
	
	
	@RequestMapping("/eduList.do")
	public String eduList(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
		/** EgovPropertyService */
		userSearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		userSearchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(userSearchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(userSearchVO.getPageUnit());
		paginationInfo.setPageSize(userSearchVO.getPageSize());

		userSearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		userSearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		userSearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		EduProgramVO eduProgramVO = new EduProgramVO();
		List<?> userList = eduProgramService.eduListAll(userSearchVO);
		model.addAttribute("resultList", userList);

		int totCnt = eduProgramService.selectListTotCnt(userSearchVO);
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		

		/*model.addAttribute("list", list);*/
		return "egovframework/com/cms/eduMemberList";
	}
	@RequestMapping("/eduMemberListView.do")
	public String eduMemberListView(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, @RequestParam("selectedId") String idx,ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}

		List<?> userLsit = eduProgramService.selectEduUserList(idx);
		
		model.addAttribute("idx", idx);
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("resultList", userLsit);

		return "egovframework/com/cms/eduMemberListView";
	}	
	@RequestMapping("/eduMemberView.do")
	public String eduMemberView(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,@RequestParam("selectedId") String idx,ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		


		EduProgramVO eduProgramVO = new EduProgramVO();
		eduProgramVO = eduProgramService.selectUser(idx);
		
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("eduProgramVO", eduProgramVO);

		return "egovframework/com/cms/eduMemberView";
	}	
	
	
	@RequestMapping("/eduMemberUpdate.do")
	public String eduMemberUpdate(@ModelAttribute("eduProgramVO") EduProgramVO eduProgramVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
		eduProgramVO.setAgreeId(user.getId());
		
		eduProgramService.updateUser(eduProgramVO);
		//Exception 없이 진행시 수정성공메시지
		model.addAttribute("resultMsg", "success.common.update");
		return "forward:/eduList.do";
	}
	
	
	@RequestMapping("/bgmManage.do")
	public String bgmManage(FileVO fileVO,ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
		List<FileVO> select = null;
    	fileVO.setStreFileNm("BGM_");
    	
    	select = fileService.selectBgmFile(fileVO);
		
		model.addAttribute("list", select);
		return "egovframework/com/cms/bgmList";
	}
	
	
	@RequestMapping("/bgmInsert.do")
	public String bgmInsert(final MultipartHttpServletRequest multiRequest, FileVO fileVO,ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
    	String type = multiRequest.getParameter("type");
    	
    	List<FileVO> result = null, select = null;
	    String atchFileId = "";
	    String filename = "" , filepath = "", orurl = "", extsn = "";
	    
	    final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    if (!files.isEmpty()) {
	    	result = fileUtil.parseFileInf(files, type, 0, "", "");
	    	atchFileId = fileService.insertFileInfs(result);
	    }

    	return "redirect:/bgmManage.do";
	}
	
	@RequestMapping("/bgmdelete.do")
	public String bgmdelete(FileVO fileVO,ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
		fileService.deleteFileInf(fileVO);
					
    	return "redirect:/bgmManage.do";
	}
		
	

	@RequestMapping("/snsManage.do")
	public String snsManage(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
		/** EgovPropertyService */
		userSearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		userSearchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(userSearchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(userSearchVO.getPageUnit());
		paginationInfo.setPageSize(userSearchVO.getPageSize());

		userSearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		userSearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		userSearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		
		
		List<?> snsList = snsManageService.snsListAll(userSearchVO);
		
		model.addAttribute("resultList", snsList);

		int totCnt = snsManageService.selectListTotCnt(userSearchVO);
		
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		
		return "egovframework/com/cms/snsManage";
	}	
	
	
	@RequestMapping("/snsInsertView.do")
	public String snsInsertView(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginUsr.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
		SnsManageVO snsManageVO = new SnsManageVO();
		model.addAttribute("resultList", snsManageVO);
		
		
		return "egovframework/com/cms/snsInsertView";
	}		
	
	@RequestMapping("/snsInsert.do")
	public String snsInsert(final MultipartHttpServletRequest multiRequest, @ModelAttribute("snsManageVO") SnsManageVO snsManageVO,ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginAdm.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
		List<FileVO> result = null;
	    String atchFileId = "";
	    
	    final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    if (!files.isEmpty()) {
	    	result = fileUtil.parseFileInf(files, "SNS_", 0, "", "");
	    	atchFileId = fileService.insertFileInfs(result);
	    }
	    snsManageVO.setSnsFile(atchFileId);
	    snsManageVO.setSnsRegistId(user.getUniqId());
	    
	    snsManageService.regist(snsManageVO);
		
		return "redirect:/snsManage.do";
	}		
	
	@RequestMapping("/snsManageView.do")
	public String snsManageView(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,@RequestParam("selectedId") String idx,ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginAdm.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
		SnsManageVO snsManageVO = new SnsManageVO();
		snsManageVO = snsManageService.selectUser(idx);
		
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("snsManageVO", snsManageVO);

		return "egovframework/com/cms/snsManageView";
	    
		
		
	}	
	
	@RequestMapping("/snsUpdate.do")
	public String snsUpdate(final MultipartHttpServletRequest multiRequest, @ModelAttribute("snsManageVO") SnsManageVO snsManageVO,ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(user == null) {
			return "redirect:/uat/uia/egovLoginAdm.do";
		}
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "index";
		}
		
		List<FileVO> result = null;
	    String atchFileId = "";
	    SnsManageVO fileNameManager = snsManageService.getFileName(snsManageVO.getSnsId());
	    
	    final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    
	    System.out.println(files.isEmpty());
	    
	    if (!files.isEmpty()) {
	    	result = fileUtil.parseFileInf(files, "SNS_", 0, "", "");
	    	atchFileId = fileService.insertFileInfs(result);
	    	// file 존재하는 상태에서 미입력시
	    	if(result.isEmpty()) {
		    	atchFileId = fileNameManager.getSnsFile();
	    	}
	    }
	    snsManageVO.setSnsFile(atchFileId);
	    snsManageVO.setSnsRegistId(user.getUniqId());
	    
	    snsManageService.update(snsManageVO);
		
		return "redirect:/snsManage.do";
	}

	/**
	 * 신청자 정보를 엑셀파일로 출력한다.
	 *
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/excelDownload.do")
	public ModelAndView excelDownload(@ModelAttribute("searchVO") UserDefaultVO userSearchVO, @RequestParam("selectedId") String idx,ModelMap model) throws Exception {


		List<?> excelList = eduProgramService.selectEduUserList(idx);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("excelList", excelList);
		return new ModelAndView("goodsExcelView", map);
	}
}
