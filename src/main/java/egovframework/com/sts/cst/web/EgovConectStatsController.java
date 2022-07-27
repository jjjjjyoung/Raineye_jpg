package egovframework.com.sts.cst.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.sts.com.StatsVO;
import egovframework.com.sts.cst.service.EgovConectStatsService;
import egovframework.com.sym.log.clg.service.EgovLoginLogService;
import egovframework.com.sym.log.clg.service.LoginLog;

/**
 * 접속 통계 검색 컨트롤러 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.19
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.19  박지욱          최초 생성
 *  2011.06.30  이기하          패키지 분리(sts -> sts.cst)
 *  2011.8.26	정진오			IncludedInfo annotation 추가
 *
 *  </pre>
 */


@Controller
public class EgovConectStatsController {

	/** EgovConectStatsService */
	@Resource(name = "conectStatsService")
    private EgovConectStatsService conectStatsService;
	
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name="EgovLoginLogService")
	private EgovLoginLogService loginLogService;	
	
	/** EgovCmmUseService */
/*	@Resource(name="EgovCmmUseService")
	private EgovCmmUseService cmmUseService;*/

    /**
	 * 접속 통계를 조회한다
	 * @param statsVO StatsVO
	 * @return String
	 * @exception Exception
	 */
    @IncludedInfo(name="접속통계", listUrl="/sts/cst/selectConectStats.do", order = 140 ,gid = 30)
    @RequestMapping(value="/sts/cst/selectConectStats.do")
	public String selectUserStats(@ModelAttribute("statsVO") StatsVO statsVO,
			ModelMap model) throws Exception {
    	
    	// 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if (!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    		return "egovframework/com/uat/uia/EgovLoginUsr";
    	}

		if (statsVO.getFromDate() != null && !"".equals(statsVO.getFromDate())) {

			List<?> conectStats = conectStatsService.selectConectStats(statsVO);

			// 1. 서비스별
			if ("SERVICE".equals(statsVO.getStatsKind())) {
				model.addAttribute("conectStats", conectStats);
				model.addAttribute("statsInfo", statsVO);
			// 2. 개인별
			} else {
				// 그래프에 표시될 이미지 길이를 결정한다.
				float iMaxUnit = 50.0f;
				for (int i = 0; i < conectStats.size(); i++) {
					StatsVO vo = (StatsVO)conectStats.get(i);
					int iCnt = vo.getStatsCo();
					if (iCnt > 10 && iCnt <= 100) {
						if (iMaxUnit > 5.0f) {
							iMaxUnit = 5.0f;
						}
					} else if (iCnt > 100 && iCnt <= 1000) {
						if (iMaxUnit > 0.5f) {
							iMaxUnit = 0.5f;
						}
					} else if (iCnt > 1000) {
						if (iMaxUnit > 0.05f) {
							iMaxUnit = 0.05f;
						}
					}
				}
				statsVO.setMaxUnit(iMaxUnit);
				model.addAttribute("conectStats", conectStats);
				model.addAttribute("statsInfo", statsVO);
			}
		}
        return "egovframework/com/sts/cst/EgovConectStats";
	}
    /**
	 * 접속을 기록 한다.
	 * @param statsVO StatsVO
	 * @return String
	 * @exception Exception
	 */
    @IncludedInfo(name="접속입력", listUrl="/sts/cst/insertConectStats.do", order = 140 ,gid = 30)
    @RequestMapping(value="/sts/cst/insertConectStats.do")
	public String insertConectStats(@ModelAttribute("statsVO") StatsVO statsVO,
			ModelMap model, HttpServletRequest request) throws Exception {

		String uniqId = "";

		/* Authenticated  */ 
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(isAuthenticated.booleanValue()) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			uniqId = user.getUniqId();
    	}
    	
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }
 
    	LoginLog loginLog = new LoginLog();
    	loginLog.setLoginId(uniqId);
        loginLog.setLoginIp(ip);
        loginLog.setLoginMthd("J"); // 로그인:I, 로그아웃:O
        loginLog.setErrOccrrAt("N");
        loginLog.setErrorCode(request.getQueryString());
        loginLogService.logInsertLoginLog(loginLog);

        return "LOG";

	}    
}