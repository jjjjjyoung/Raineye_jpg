package egovframework.com.jpg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.jpg.service.SnsManageService;
import egovframework.com.jpg.service.SnsManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;

@Service("SnsManageService")
public class SnsManageServiceImpl implements SnsManageService{

	@Resource(name = "SnsManageDAO")
	private SnsManageDAO SnsManageDAO;
	
	@Override
	public List<?> snsListAll(UserDefaultVO userSearchVO) {
		// TODO Auto-generated method stub
		return SnsManageDAO.snsListAll(userSearchVO);
	}

	@Override
	public int selectListTotCnt(UserDefaultVO userSearchVO) {
		// TODO Auto-generated method stub
		return SnsManageDAO.selectListTotCnt(userSearchVO);
	}

	@Override
	public void regist(SnsManageVO snsManageVO) {
		// TODO Auto-generated method stub
		SnsManageDAO.regist(snsManageVO);
	}

	@Override
	public SnsManageVO selectUser(String idx) {
		// TODO Auto-generated method stub
		return SnsManageDAO.selectUser(idx);
	}

	@Override
	public void update(SnsManageVO snsManageVO) {
		// TODO Auto-generated method stub
		SnsManageDAO.update(snsManageVO);
	
	}

	@Override
	public List<?> selectMainList(SnsManageVO snsManageVO) {
		// TODO Auto-generated method stub
		return SnsManageDAO.selectMainList(snsManageVO);
	}

	@Override
	public SnsManageVO getFileName(String snsId) {
		// TODO Auto-generated method stub
		return SnsManageDAO.getFileName(snsId);
	}

	
	
}

