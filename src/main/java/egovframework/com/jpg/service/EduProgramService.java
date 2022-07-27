package egovframework.com.jpg.service;

import java.util.List;

import egovframework.com.uss.umt.service.UserDefaultVO;

public interface EduProgramService {

	void regist(EduProgramVO eduProgramVO);

	List<EduProgramVO> seleteMyEdu(EduProgramVO eduProgramVO);

	void cancleMyEdu(EduProgramVO eduProgramVO);

	List<?> eduListAll(UserDefaultVO userSearchVO);

	int selectListTotCnt(UserDefaultVO userSearchVO);

	EduProgramVO selectUser(String idx);

	void updateUser(EduProgramVO eduProgramVO);

	List<?> selectEduUserList(String idx);

	int seleteMyEduCnt(EduProgramVO eduProgramVO);

}
