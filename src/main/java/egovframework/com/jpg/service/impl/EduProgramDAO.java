package egovframework.com.jpg.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.jpg.service.EduProgramVO;
import egovframework.com.jpg.service.PaidMemberVO;
import egovframework.com.uss.umt.service.UserDefaultVO;

@Repository("EduProgramDAO")
public class EduProgramDAO extends EgovComAbstractDAO {

	public void regist(EduProgramVO eduProgramVO) {
		// TODO Auto-generated method stub
		insert("EduProgramDAO.regist",eduProgramVO);
	}

	public List<EduProgramVO> seleteMyEdu(EduProgramVO eduProgramVO) {
		// TODO Auto-generated method stub
		return selectList("EduProgramDAO.seleteMyEdu",eduProgramVO);
	}

	public void cancleMyEdu(EduProgramVO eduProgramVO) {
		// TODO Auto-generated method stub
		update("EduProgramDAO.cancleMyEdu",eduProgramVO);
	}

	public List<?> eduListAll(UserDefaultVO userSearchVO) {
		// TODO Auto-generated method stub
		return selectList("EduProgramDAO.eduListAll",userSearchVO);
	}

	public int selectListTotCnt(UserDefaultVO userSearchVO) {
		// TODO Auto-generated method stub
		return (Integer)selectOne("EduProgramDAO.selectListTotCnt", userSearchVO);
	}

	public EduProgramVO selectUser(String idx) {
		// TODO Auto-generated method stub
		return (EduProgramVO) selectOne("EduProgramDAO.selectUser", idx);
	}

	public void updateUser(EduProgramVO eduProgramVO) {
		update("EduProgramDAO.updateUser",eduProgramVO);
		
	}

	public List<?> selectEduUserList(String idx) {
		// TODO Auto-generated method stub
		return selectList("EduProgramDAO.selectEduUserList", idx);
	}

	public int seleteMyEduCnt(EduProgramVO eduProgramVO) {
		// TODO Auto-generated method stub
		return (Integer)selectOne("EduProgramDAO.seleteMyEduCnt", eduProgramVO);
	}

}
