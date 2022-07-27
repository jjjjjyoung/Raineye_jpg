package egovframework.com.jpg.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.jpg.service.PaidMemberVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.com.uss.umt.service.UserManageVO;

@Repository("PaidMemberDAO")
public class PaidMemberDAO extends EgovComAbstractDAO {

	public void insert(PaidMemberVO paidMemberVO) {
		// TODO Auto-generated method stub
		insert("PaidMemberDAO.insert",paidMemberVO);
	}

	public List<?> selectList(UserDefaultVO userSearchVO) {
		// TODO Auto-generated method stub
		return list("PaidMemberDAO.selectList", userSearchVO);
	}

	public int selectListTotCnt(UserDefaultVO userSearchVO) {
		// TODO Auto-generated method stub
		 return (Integer)selectOne("PaidMemberDAO.selectListTotCnt", userSearchVO);
	}

	public PaidMemberVO selectUser(String idx) {
		// TODO Auto-generated method stub
		return (PaidMemberVO) selectOne("PaidMemberDAO.selectUser", idx);
	}

	public void updateUser(PaidMemberVO paidMemberVO) {
		// TODO Auto-generated method stub
		update("PaidMemberDAO.updateUser",paidMemberVO);
	}

	public void deleteUser(String string) {
		delete("PaidMemberDAO.deleteUser", string);
		
	}

	public List<?> selectListOne(String mberId) {
		// TODO Auto-generated method stub
		return list("PaidMemberDAO.selectListOne", mberId);
	}

}
