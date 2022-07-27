package egovframework.com.jpg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.jpg.service.HtmlEditorService;
import egovframework.com.jpg.service.HtmlEditorVO;


@Service("HtmlEditorService")
public class HtmlEditorServiceImpl implements HtmlEditorService{
	
	@Resource(name = "HtmlEditorDAO")
	private HtmlEditorDAO HtmlEditorDAO;
	
	@Override
	public void insertHtmlEditor(HtmlEditorVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		HtmlEditorDAO.insertHtmlEditor(vo);
	}

	@Override
	public HtmlEditorVO selectHtmlEditor(HtmlEditorVO vo) throws Exception {
		// TODO Auto-generated method stub
		return HtmlEditorDAO.selectHtmlEditor(vo);
	}

	@Override
	public void updateHtmlEditor(HtmlEditorVO vo) throws Exception {
		// TODO Auto-generated method stub
		HtmlEditorDAO.updateHtmlEditor(vo);
	}

	@Override
	public List<?> selectHtmlEditorList() throws Exception {
		// TODO Auto-generated method stub
		return HtmlEditorDAO.selectHtmlEditorList();
	}
	
	@Override
	public void deleteHtmlEditor(HtmlEditorVO vo) throws Exception {
		// TODO Auto-generated method stub
		HtmlEditorDAO.deleteHtmlEditor(vo);
	}
}
