package egovframework.com.cop.bbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;

public interface EgovArticleService {

	Map<String, Object> selectArticleList(BoardVO boardVO);

	BoardVO selectArticleDetail(BoardVO boardVO);
	
	void insertArticle(Board board) throws FdlException;

	void updateArticle(Board board);

	void deleteArticle(Board board) throws Exception;

	List<BoardVO> selectNoticeArticleList(BoardVO boardVO);
	
	Map<String, Object> selectGuestArticleList(BoardVO vo);
	
	/*
	 * 블로그 관련
	 */
	BoardVO selectArticleCnOne(BoardVO boardVO);
	
	List<BoardVO> selectBlogNmList(BoardVO boardVO);
	
	Map<String, Object> selectBlogListManager(BoardVO boardVO);
	
	List<BoardVO> selectArticleDetailDefault(BoardVO boardVO);
	
	int selectArticleDetailDefaultCnt(BoardVO boardVO);
	
	int getArticleMenuCount(HashMap map);
	
	List<BoardVO> selectArticleDetailCn(BoardVO boardVO);
	
	int selectLoginUser(BoardVO boardVO);

	List<BoardVO> selectArticleListMain(BoardVO boardVO);

	void insertSkin1Article(Board board) throws FdlException;

	void updateSkin1Article(Board board);

	List<BoardVO> selectNoticeEduArticleList(BoardVO notiVO);

	void insertSkin4Article(Board board) throws FdlException;

	void updateRecStatus(BoardVO boardVO);

	void insertSkin5Article(Board board) throws FdlException;

	void insertSkin2Article(BoardVO board)throws FdlException;

	void insertSkin3Article(BoardVO board) throws FdlException;

	void updateSkin3Article(Board board) throws FdlException;
	
	Map<String, Object> selectYoutubeList(BoardVO boardVO);

	void updateSkin5Article(Board board) throws FdlException;

	Map<String, Object> selectArticleListSearch(UserDefaultVO userSearchVO);

	void updateSkin4Article(Board board);

	void updateSkin2Article(Board board);

	Map<String, Object> selectArticleMainList(BoardVO boardVO);
}
