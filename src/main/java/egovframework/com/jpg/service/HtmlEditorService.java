package egovframework.com.jpg.service;

import java.util.List;

public interface HtmlEditorService {

	public void insertHtmlEditor(HtmlEditorVO vo) throws Exception;
	
	public HtmlEditorVO selectHtmlEditor(HtmlEditorVO vo) throws Exception;
	
	public List<?> selectHtmlEditorList() throws Exception;
	
	public void updateHtmlEditor(HtmlEditorVO vo) throws Exception;

	void deleteHtmlEditor(HtmlEditorVO vo) throws Exception;	
}