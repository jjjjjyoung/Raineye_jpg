package egovframework.com.uss.umt.web;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import Altibase.jdbc.driver.util.ByteUtils;
import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.jpg.service.HtmlEditorService;
import egovframework.com.jpg.service.HtmlEditorVO;
import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 일반회원관련 요청을  비지니스 클래스로 전달하고 처리된결과를  해당   웹 화면으로 전달하는  Controller를 정의한다
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  조재영          최초 생성
 *   2011.08.26	 정진오			IncludedInfo annotation 추가
 *   2014.12.08	 이기하			암호화방식 변경(EgovFileScrty.encryptPassword)
 *   2015.06.16	 조정국			수정시 유효성체크 후 에러발생 시 목록으로 이동하여 에러메시지 표시
 *   2015.06.19	 조정국			미인증 사용자에 대한 보안처리 기준 수정 (!isAuthenticated)
 *   2017.07.21  장동한 			로그인인증제한 작업
 *
 * </pre>
 */

@Controller
public class EgovMberManageController {

	/** mberManageService */
	@Resource(name = "mberManageService")
	private EgovMberManageService mberManageService;

	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "HtmlEditorService")
	private HtmlEditorService htmlEditorService;

	/** DefaultBeanValidator beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;

	/**
	 * 일반회원목록을 조회한다. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberManage
	 * @throws Exception
	 */
	@IncludedInfo(name = "일반회원관리", order = 470, gid = 50)
	@RequestMapping(value = "/uss/umt/EgovMberManage.do")
	public String selectMberList(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, ModelMap model) throws Exception {
 
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
//			return "redirect:/egovDevIndex.jsp";
//			return "/EgovContent.do";
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

		List<?> mberList = mberManageService.selectMberList(userSearchVO);
		model.addAttribute("resultList", mberList);

		int totCnt = mberManageService.selectMberListTotCnt(userSearchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		//일반회원 상태코드를 코드정보로부터 조회
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM013");
		List<?> mberSttus_result = cmmUseService.selectCmmCodeDetail(vo);
		model.addAttribute("entrprsMberSttus_result", mberSttus_result);//기업회원상태코드목록

		return "egovframework/com/uss/umt/EgovMberManage";
	}

	/**
	 * 일반회원등록화면으로 이동한다.
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberInsert
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberInsertView.do")
	public String insertMberView(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, @ModelAttribute("mberManageVO") MberManageVO mberManageVO, HttpServletRequest request,Model model)
			throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		/*
		HttpSession session = request.getSession();
		
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(1024);
		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();
 
   
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		
		session.setAttribute("_RSA_WEB_Key_", privateKey);
		request.setAttribute("RSAModulus", publicKeyModulus);  
		request.setAttribute("RSAExponent", publicKeyExponent);   
		*/
		
		/*
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//패스워드힌트목록을 코드정보로부터 조회
		vo.setCodeId("COM022");
		List<?> passwordHint_result = cmmUseService.selectCmmCodeDetail(vo);
		//성별구분코드를 코드정보로부터 조회
		vo.setCodeId("COM014");
		List<?> sexdstnCode_result = cmmUseService.selectCmmCodeDetail(vo);
		//사용자상태코드를 코드정보로부터 조회
		vo.setCodeId("COM013");
		List<?> mberSttus_result = cmmUseService.selectCmmCodeDetail(vo);
		//그룹정보를 조회 - GROUP_ID정보
		vo.setTableNm("COMTNORGNZTINFO");
		List<?> groupId_result = cmmUseService.selectGroupIdDetail(vo);

		model.addAttribute("passwordHint_result", passwordHint_result); //패스워트힌트목록
		model.addAttribute("sexdstnCode_result", sexdstnCode_result); //성별구분코드목록
		model.addAttribute("mberSttus_result", mberSttus_result); //사용자상태코드목록
		model.addAttribute("groupId_result", groupId_result); //그룹정보 목록
		 */
		
		return "egovframework/com/uss/umt/EgovMberInsert";
	}

	/**
	 * 일반회원등록처리후 목록화면으로 이동한다.
	 * @param mberManageVO 일반회원등록정보
	 * @param bindingResult 입력값검증용 bindingResult
	 * @param model 화면모델
	 * @return forward:/uss/umt/EgovMberManage.do
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberInsert.do")
	public String insertMber(@ModelAttribute("mberManageVO") MberManageVO mberManageVO, BindingResult bindingResult, HttpServletRequest request,Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
	
		mberManageVO.setMberSttus("P");
		mberManageService.insertMber(mberManageVO);
		//Exception 없이 진행시 등록 성공메시지
		model.addAttribute("resultMsg", "success.common.insert");

		return "forward:/uss/umt/EgovMberManage.do";
	}

	/**
	 * 일반회원정보 수정을 위해 일반회원정보를 상세조회한다.
	 * @param mberId 상세조회대상 일반회원아이디
	 * @param userSearchVO 검색조건
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSelectUpdt
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberSelectUpdtView.do")
	public String updateMberView(@RequestParam("selectedId") String mberId, @ModelAttribute("searchVO") UserDefaultVO userSearchVO, HttpServletRequest request, Model model) throws Exception {

	    // 미인증 사용자에 대한 보안처리
	    Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	    if (!isAuthenticated) {
	        return "index";
	    }
		
		/*
		HttpSession session = request.getSession();
		
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(1024);
		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();
 
   
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		
		session.setAttribute("_RSA_WEB_Key_", privateKey);
		request.setAttribute("RSAModulus", publicKeyModulus);  
		request.setAttribute("RSAExponent", publicKeyExponent);   
		*/
	    
/*	    
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//패스워드힌트목록을 코드정보로부터 조회
		vo.setCodeId("COM022");
		List<?> passwordHint_result = cmmUseService.selectCmmCodeDetail(vo);

		//성별구분코드를 코드정보로부터 조회
		vo.setCodeId("COM014");
		List<?> sexdstnCode_result = cmmUseService.selectCmmCodeDetail(vo);

		//사용자상태코드를 코드정보로부터 조회
		vo.setCodeId("COM013");
		List<?> mberSttus_result = cmmUseService.selectCmmCodeDetail(vo);

		//그룹정보를 조회 - GROUP_ID정보
		vo.setTableNm("COMTNORGNZTINFO");
		List<?> groupId_result = cmmUseService.selectGroupIdDetail(vo);

		model.addAttribute("passwordHint_result", passwordHint_result); //패스워트힌트목록
		model.addAttribute("sexdstnCode_result", sexdstnCode_result); //성별구분코드목록
		model.addAttribute("mberSttus_result", mberSttus_result); //사용자상태코드목록
		model.addAttribute("groupId_result", groupId_result); //그룹정보 목록
*/
		MberManageVO mberManageVO = mberManageService.selectMber(mberId);
		model.addAttribute("mberManageVO", mberManageVO);
		//model.addAttribute("userSearchVO", userSearchVO);

		return "egovframework/com/uss/umt/EgovMberSelectUpdt";
	}
	
	/**
	 * 로그인인증제한 해제 
	 * @param mberManageVO 일반회원등록정보
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSelectUpdtView.do
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberLockIncorrect.do")
	public String updateLockIncorrect(MberManageVO mberManageVO, Model model) throws Exception {

	    
	    // 미인증 사용자에 대한 보안처리
	    Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	    if (!isAuthenticated) {
	        return "index";
	    }
	    
	    mberManageService.updateLockIncorrect(mberManageVO);
	    
	    return "forward:/uss/umt/EgovMberSelectUpdtView.do";
	}

	/**
	 * 일반회원정보 수정후 목록조회 화면으로 이동한다.
	 * @param mberManageVO 일반회원수정정보
	 * @param bindingResult 입력값검증용 bindingResult
	 * @param model 화면모델
	 * @return forward:/uss/umt/EgovMberManage.do
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberSelectUpdt.do")
	public String updateMber(@ModelAttribute("mberManageVO") MberManageVO mberManageVO, BindingResult bindingResult, HttpServletRequest request, Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
/*
		HttpSession session = request.getSession(); 
		PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_Key_");  //로그인전에 세션에 저장된 개인키를 가져온다.
		if (privateKey == null) 
		{ 
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
	    	return "forward:/uss/umt/EgovMberManage.do";
		}
		else
		{
			try{
				//암호화처리된 사용자계정정보를 복호화 처리한다.
				
				String _pwd = decryptRsa(privateKey, mberManageVO.getPassword());
				//복호화 처리된 계정정보를 map에 담아서 iBatis와 연동한다.
				mberManageVO.setPassword(_pwd);
			}
			catch(Exception e)
			{
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
		    	return "forward:/uss/umt/EgovMberManage.do";
			}
		} 
		*/
		/*
		beanValidator.validate(mberManageVO, bindingResult);
 		if (bindingResult.hasErrors()) {
			model.addAttribute("resultMsg", bindingResult.getAllErrors().get(0).getDefaultMessage());
			return "forward:/uss/umt/EgovMberManage.do";
		} else {
		*/
		if ("".equals(mberManageVO.getGroupId())) {//KISA 보안약점 조치 (2018-10-29, 윤창원)
			mberManageVO.setGroupId(null);
		}
		mberManageService.updateMber(mberManageVO);
		//Exception 없이 진행시 수정성공메시지
		model.addAttribute("resultMsg", "success.common.update");
		return "forward:/uss/umt/EgovMberManage.do";
		//}
	}

	/**
	 * 일반회원정보삭제후 목록조회 화면으로 이동한다.
	 * @param checkedIdForDel 삭제대상 아이디 정보
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return forward:/uss/umt/EgovMberManage.do
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberDelete.do")
	public String deleteMber(@RequestParam("checkedIdForDel") String checkedIdForDel, @ModelAttribute("searchVO") UserDefaultVO userSearchVO, Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}

		mberManageService.deleteMber(checkedIdForDel);
		//Exception 없이 진행시 삭제성공메시지
		model.addAttribute("resultMsg", "success.common.delete");
		return "forward:/uss/umt/EgovMberManage.do";
	}

	// 탈퇴 처리 기능에 대한 예시
	@RequestMapping("/uss/umt/EgovMberWithdraw.do")
	public String withdrawMber(Model model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		String returnPage = "/"; // 탈퇴 처리 후 화면 지정

		if (!isAuthenticated) {
			model.addAttribute("resultMsg", "fail.common.delete");

			return "redirect:" + returnPage;
		}

		mberManageService.deleteMber(user.getUniqId());
		//Exception 없이 진행시 삭제성공메시지
		model.addAttribute("resultMsg", "success.common.delete");

		return "redirect:" + returnPage;
	}

	/**
	 * 일반회원가입신청 등록화면으로 이동한다.
	 * @param userSearchVO 검색조건
	 * @param mberManageVO 일반회원가입신청정보
	 * @param commandMap 파라메터전달용 commandMap
	 * @param model 화면모델
	 * @return uss/umt/EgovMberSbscrb
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberSbscrbView.do")
	public String sbscrbMberView(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, @ModelAttribute("mberManageVO") MberManageVO mberManageVO,HttpServletRequest request,
			@RequestParam Map<String, Object> commandMap, Model model) throws Exception {

		/*
		HttpSession session = request.getSession();
		
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(1024);
		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();
 
   
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		
		session.setAttribute("_RSA_WEB_Key_", privateKey);
		request.setAttribute("RSAModulus", publicKeyModulus);  
		request.setAttribute("RSAExponent", publicKeyExponent);   
		*/
		
		
		
		
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//패스워드힌트목록을 코드정보로부터 조회
		vo.setCodeId("COM022");
		List<?> passwordHint_result = cmmUseService.selectCmmCodeDetail(vo);
		//성별구분코드를 코드정보로부터 조회
		vo.setCodeId("COM014");
		List<?> sexdstnCode_result = cmmUseService.selectCmmCodeDetail(vo);

		model.addAttribute("passwordHint_result", passwordHint_result); //패스워트힌트목록
		model.addAttribute("sexdstnCode_result", sexdstnCode_result); //성별구분코드목록
		if (!"".equals(commandMap.get("realname"))) {
			model.addAttribute("mberNm", commandMap.get("realname")); //실명인증된 이름 - 주민번호 인증
			model.addAttribute("ihidnum", commandMap.get("ihidnum")); //실명인증된 주민등록번호 - 주민번호 인증
		}
		if (!"".equals(commandMap.get("realName"))) {
			model.addAttribute("mberNm", commandMap.get("realName")); //실명인증된 이름 - ipin인증
		}

		mberManageVO.setMberSttus("DEFAULT");

		return "egovframework/com/uss/umt/EgovMberSbscrb";
	}

	/**
	 * 일반회원가입신청등록처리후로그인화면으로 이동한다.
	 * @param mberManageVO 일반회원가입신청정보
	 * @return forward:/uat/uia/egovLoginUsr.do
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovMberSbscrb.do")
	public String sbscrbMber(@ModelAttribute("mberManageVO") MberManageVO mberManageVO, HttpServletRequest request) throws Exception {

		//가입상태 초기화
		mberManageVO.setMberSttus("P");
		mberManageVO.setLevel("1");
		//그룹정보 초기화
		//mberManageVO.setGroupId("1");
		//일반회원가입신청 등록시 일반회원등록기능을 사용하여 등록한다.
		
		/*
		HttpSession session = request.getSession();
		PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_Key_");  //로그인전에 세션에 저장된 개인키를 가져온다.
		if (privateKey == null) 
		{ 
			return "egovframework/com/uat/uia/EgovLoginUsr";
		}
		else
		{
			try{
				//암호화처리된 사용자계정정보를 복호화 처리한다.
				
				String _pwd = decryptRsa(privateKey, mberManageVO.getPassword());
				//복호화 처리된 계정정보를 map에 담아서 iBatis와 연동한다.
				
				mberManageVO.setPassword(_pwd);
			}
			catch(Exception e)
			{
				return "egovframework/com/uat/uia/EgovLoginUsr";
			}
		} 
		*/
		//System.out.println(password(mberManageVO.getPassword().getBytes()));
		
		mberManageService.insertMber(mberManageVO);
		
		return "egovframework/com/jpg/userJoinComp";
	}

	/**
	 * 일반회원 약관확인
	 * @param model 화면모델
	 * @return uss/umt/EgovStplatCnfirm
	 * @throws Exception
	 */
	@RequestMapping("/uss/umt/EgovStplatCnfirmMber.do")
	public String sbscrbEntrprsMber(Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
		//Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		//if (!isAuthenticated) {
		//	return "index";
		//}
		/*
		//일반회원용 약관 아이디 설정
		String stplatId = "STPLAT_0000000000001";
		//회원가입유형 설정-일반회원
		String sbscrbTy = "USR01";
		//약관정보 조회
		List<?> stplatList = mberManageService.selectStplat(stplatId);
		
		model.addAttribute("stplatList", stplatList); //약관정보 포함
		
		 */
		
		String sbscrbTy = "USR01";
		model.addAttribute("sbscrbTy", sbscrbTy); //회원가입유형 포함
				
		HtmlEditorVO vo = new HtmlEditorVO();
		vo.setCtsId("conditions");
		HtmlEditorVO conditions = htmlEditorService.selectHtmlEditor(vo);
		String ctsCn = conditions.getCtsCn();
    	ctsCn = ctsCn.replaceAll("&lt;", "<");
    	ctsCn = ctsCn.replaceAll("&gt;", ">");
    	ctsCn = ctsCn.replaceAll("&quot;", "\"");
    	conditions.setCtsCn(ctsCn);
    	
		model.addAttribute("conditions", conditions.getCtsCn()); //약관정보 포함
		
		HtmlEditorVO vo2 = new HtmlEditorVO();
		vo2.setCtsId("information");
		HtmlEditorVO information = htmlEditorService.selectHtmlEditor(vo2);
		String ctsCn2 = information.getCtsCn();
		ctsCn2 = ctsCn2.replaceAll("&lt;", "<");
		ctsCn2 = ctsCn2.replaceAll("&gt;", ">");
		ctsCn2 = ctsCn2.replaceAll("&quot;", "\"");
		information.setCtsCn(ctsCn2);
		model.addAttribute("information", information.getCtsCn()); //회원가입유형 포함
		
		
		return "egovframework/com/uss/umt/EgovStplatCnfirm";
	}

	/**
	 * @param model 화면모델
	 * @param commandMap 파라메터전달용 commandMap
	 * @param userSearchVO 검색조건
	 * @param mberManageVO 일반회원수정정보(비밀번호)
	 * @return uss/umt/EgovMberPasswordUpdt
	 * @throws Exception
	 */
	@RequestMapping(value = "/uss/umt/EgovMberPasswordUpdt.do")
	public String updatePassword(ModelMap model, @RequestParam Map<String, Object> commandMap, @ModelAttribute("searchVO") UserDefaultVO userSearchVO,
			HttpServletRequest request,
			@ModelAttribute("mberManageVO") MberManageVO mberManageVO) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
		String oldPassword = (String) commandMap.get("oldPassword");
		String newPassword = (String) commandMap.get("newPassword");
		String newPassword2 = (String) commandMap.get("newPassword2");
		String uniqId = (String) commandMap.get("uniqId");
		
		HttpSession session = request.getSession();
		PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_Key_");  //로그인전에 세션에 저장된 개인키를 가져온다.
		if (privateKey == null) 
		{ 
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
	    	return "egovframework/com/uat/uia/EgovLoginUsr";
		}
		else
		{
			try{
				//암호화처리된 사용자계정정보를 복호화 처리한다.
				oldPassword = decryptRsa(privateKey, oldPassword);
				newPassword = decryptRsa(privateKey, newPassword);
				newPassword2 = decryptRsa(privateKey, newPassword2);
				//복호화 처리된 계정정보를 map에 담아서 iBatis와 연동한다.
				mberManageVO.setPassword(newPassword+uniqId);
				mberManageVO.setOldPassword(oldPassword);
				
				
			}
			catch(Exception e)
			{
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
		    	return "egovframework/com/uat/uia/EgovLoginUsr";
			}
		} 
		
		
		

		boolean isCorrectPassword = false;
		MberManageVO resultVO = new MberManageVO();
		//mberManageVO.setPassword(newPassword);
		//mberManageVO.setOldPassword(oldPassword);
		mberManageVO.setUniqId(uniqId);

		String resultMsg = "";
		resultVO = mberManageService.selectPassword(mberManageVO);
		//패스워드 암호화
		String encryptPass = EgovFileScrty.encryptPassword(oldPassword+uniqId, mberManageVO.getMberId());
		if (encryptPass.equals(resultVO.getPassword())) {
			if (newPassword.equals(newPassword2)) {
				isCorrectPassword = true;
			} else {
				isCorrectPassword = false;
				resultMsg = "fail.user.passwordUpdate2";
			}
		} else {
			isCorrectPassword = false;
			resultMsg = "fail.user.passwordUpdate1";
		}

		if (isCorrectPassword) {
			mberManageVO.setPassword(EgovFileScrty.encryptPassword(newPassword+uniqId, mberManageVO.getMberId()));
			mberManageService.updatePassword(mberManageVO);
			model.addAttribute("mberManageVO", mberManageVO);
			resultMsg = "success.common.update";
		} else {
			model.addAttribute("mberManageVO", mberManageVO);
		}
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("resultMsg", resultMsg);

		return "egovframework/com/uss/umt/EgovMberPasswordUpdt";
	}

	/**
	 * 일반회원 암호 수정 화면 이동
	 * @param model 화면모델
	 * @param commandMap 파라메터전달용 commandMap
	 * @param userSearchVO 검색조건
	 * @param mberManageVO 일반회원수정정보(비밀번호)
	 * @return uss/umt/EgovMberPasswordUpdt
	 * @throws Exception
	 */
	@RequestMapping(value = "/uss/umt/EgovMberPasswordUpdtView.do")
	public String updatePasswordView(ModelMap model, @RequestParam Map<String, Object> commandMap, @ModelAttribute("searchVO") UserDefaultVO userSearchVO,HttpServletRequest request,
			@ModelAttribute("mberManageVO") MberManageVO mberManageVO) throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			return "index";
		}
		
		HttpSession session = request.getSession();
		
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(1024);
		KeyPair keyPair = generator.genKeyPair();
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();
 
   
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

		
		session.setAttribute("_RSA_WEB_Key_", privateKey);
		request.setAttribute("RSAModulus", publicKeyModulus);  
		request.setAttribute("RSAExponent", publicKeyExponent);   
		

		String userTyForPassword = (String) commandMap.get("userTyForPassword");
		mberManageVO.setUserTy(userTyForPassword);

		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("mberManageVO", mberManageVO);

		return "egovframework/com/uss/umt/EgovMberPasswordUpdt";
	}
	
	
	public String decryptRsa(PrivateKey privateKey, String securedValue) {
		 String decryptedValue = "";
		 try{
			Cipher cipher = Cipher.getInstance("RSA");
		   /**
			* 암호화 된 값은 byte 배열이다.
			* 이를 문자열 폼으로 전송하기 위해 16진 문자열(hex)로 변경한다. 
			* 서버측에서도 값을 받을 때 hex 문자열을 받아서 이를 다시 byte 배열로 바꾼 뒤에 복호화 과정을 수행한다.
			*/
			byte[] encryptedBytes = hexToByteArray(securedValue);
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
			decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
		 }catch(Exception e){
			 System.err.println(e);
		 }
			return decryptedValue;
	} 
	/** 
	 * 16진 문자열을 byte 배열로 변환한다. 
	 */
	 public static byte[] hexToByteArray(String hex) {
		if (hex == null || hex.length() % 2 != 0) {
			return new byte[]{};
		}
	 
		byte[] bytes = new byte[hex.length() / 2];
		for (int i = 0; i < hex.length(); i += 2) {
			byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
			bytes[(int) Math.floor(i / 2)] = value;
		}
		return bytes;
	}

	 public static byte[] getHash(byte[] input) { 
		 try { 
			 MessageDigest md = MessageDigest.getInstance("SHA1"); 
			 return md.digest(input); 
		 } catch (NoSuchAlgorithmException e) { 
			 // 일어날 경우가 없다고 보지만 만약을 위해 Exception 발생 
			 throw new RuntimeException("SHA1" + " Algorithm Not Found", e); 
		 } 
	 }

	 public static String password(byte[] input) { 
		 byte[] digest = null; // Stage 1 
		 digest = getHash(input); // Stage 2 
		 digest = getHash(digest); 
		 
		 StringBuilder sb = new StringBuilder(1 + digest.length); 
		 sb.append("*"); 
		 sb.append(ByteUtils.toHexString(digest).toUpperCase()); 
		 return sb.toString(); 
	 }
	 

	 	 

}