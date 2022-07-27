package egovframework.com.jpg.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.jpg.service.HtmlEditorVO;

@Repository("HtmlEditorDAO")
public class HtmlEditorDAO extends EgovComAbstractDAO {
	
	public void insertHtmlEditor(HtmlEditorVO vo){
		insert("HtmlEditorDAO.insertHtmlEditor",vo);
	}
	
	public HtmlEditorVO selectHtmlEditor(HtmlEditorVO vo){

		return selectOne("HtmlEditorDAO.selectHtmlEditor",vo);
	}
	
	@SuppressWarnings("unchecked")
	public List<?> selectHtmlEditorList(){
		return selectList("HtmlEditorDAO.selectHtmlEditorList");
	}
	
	public void updateHtmlEditor(HtmlEditorVO vo){
		update("HtmlEditorDAO.updateHtmlEditor",vo);
	}

	public void deleteHtmlEditor(HtmlEditorVO vo) {
		// TODO Auto-generated method stub
		delete("HtmlEditorDAO.deleteHtmlEditor", vo);
	}
}
