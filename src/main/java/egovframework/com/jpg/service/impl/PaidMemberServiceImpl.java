package egovframework.com.jpg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.jpg.service.PaidMemberService;
import egovframework.com.jpg.service.PaidMemberVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.com.uss.umt.service.UserManageVO;
import egovframework.com.utl.fcc.service.EgovStringUtil;


@Service("PaidMemberService")
public class PaidMemberServiceImpl implements PaidMemberService{

	@Resource(name = "PaidMemberDAO")
	private PaidMemberDAO paidMemberDAO;
	
	@Override
	public void insert(PaidMemberVO paidMemberVO) {
		paidMemberDAO.insert(paidMemberVO);
	}

	@Override
	public List<?> selectList(UserDefaultVO userSearchVO) {
		List<?> result = paidMemberDAO.selectList(userSearchVO);
		return result;
	}

	@Override
	public int selectListTotCnt(UserDefaultVO userSearchVO) {
		// TODO Auto-generated method stub
		return paidMemberDAO.selectListTotCnt(userSearchVO);
	}

	@Override
	public PaidMemberVO selectUser(String idx) {
		PaidMemberVO paidMemberVO = paidMemberDAO.selectUser(idx);
		return paidMemberVO;
	}

	@Override
	public void updateUser(PaidMemberVO paidMemberVO) {
		// TODO Auto-generated method stub
		paidMemberDAO.updateUser(paidMemberVO);
	}

	@Override
	public void deleteUser(String checkedIdForDel) {
		String [] delId = EgovStringUtil.isNullToString(checkedIdForDel).split(",");
		for (int i=0; i<delId.length ; i++){
			paidMemberDAO.deleteUser(delId[i]);
		}
		
	}

	@Override
	public List<?> selectListOne(String mberId) {
		List<?> result = paidMemberDAO.selectListOne(mberId);
		return result;
	}

	
	
}
