package egovframework.com.jpg.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.jpg.service.SnsManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;

@Repository("SnsManageDAO")
public class SnsManageDAO extends EgovComAbstractDAO {

	public List<?> snsListAll(UserDefaultVO userSearchVO) {
		// TODO Auto-generated method stub
		return selectList("SnsManageDAO.snsListAll",userSearchVO);
	}

	public int selectListTotCnt(UserDefaultVO userSearchVO) {
		// TODO Auto-generated method stub
		return (Integer)selectOne("SnsManageDAO.selectListTotCnt", userSearchVO);
	}

	public void regist(SnsManageVO snsManageVO) {
		// TODO Auto-generated method stub
		insert("SnsManageDAO.regist", snsManageVO);
	}

	public SnsManageVO selectUser(String idx) {
		// TODO Auto-generated method stub
		return selectOne("SnsManageDAO.selectUser", idx);
	}

	public void update(SnsManageVO snsManageVO) {
		// TODO Auto-generated method stub
		update("SnsManageDAO.update",snsManageVO);
	}

	public List<?> selectMainList(SnsManageVO snsManageVO) {
		// TODO Auto-generated method stub
		return selectList("SnsManageDAO.selectMainList",snsManageVO);
	}

	public SnsManageVO getFileName(String snsId) {
		// TODO Auto-generated method stub
		return selectOne("SnsManageDAO.getFileName",snsId);
	}

	


}
