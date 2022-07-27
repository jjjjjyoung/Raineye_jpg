package egovframework.com.jpg.service;

import java.util.List;

import egovframework.com.uss.umt.service.UserDefaultVO;

public interface SnsManageService {

	List<?> snsListAll(UserDefaultVO userSearchVO);

	int selectListTotCnt(UserDefaultVO userSearchVO);

	void regist(SnsManageVO snsManageVO);

	SnsManageVO selectUser(String idx);

	void update(SnsManageVO snsManageVO);

	List<?> selectMainList(SnsManageVO snsManageVO);

	SnsManageVO getFileName(String snsId);

}
