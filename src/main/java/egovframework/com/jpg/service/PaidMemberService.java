package egovframework.com.jpg.service;

import java.util.List;

import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.com.uss.umt.service.UserManageVO;

public interface PaidMemberService {

	void insert(PaidMemberVO paidMemberVO);

	List<?> selectList(UserDefaultVO userSearchVO);

	int selectListTotCnt(UserDefaultVO userSearchVO);

	PaidMemberVO selectUser(String uniqId);

	void updateUser(PaidMemberVO paidMemberVO);

	void deleteUser(String checkedIdForDel);

	List<?> selectListOne(String mberId);

}
