package egovframework.com.cop.bbs.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.uss.umt.service.UserDefaultVO;

@Repository("EgovArticleDAO")
public class EgovArticleDAO extends EgovComAbstractDAO {

	public List<?> selectArticleList(BoardVO boardVO) {
		
		//String id=boardVO.getBbsId().substring(boardVO.getBbsId().length()-3, boardVO.getBbsId().length());
		//int bBsId=Integer.parseInt(id.toString());
		
		if(boardVO.getBbsId().equals("BBSMSTR_000000000055")) {
			return list("BBSArticle.selectPeformanceList", boardVO);
		}else {
			
			if(boardVO.getBbsId().equals("BBSMSTR_000000000049") || boardVO.getBbsId().equals("BBSMSTR_000000000050")) {
				return list("BBSArticle.selectArticleListProfile", boardVO);
			}else if(boardVO.getBbsId().equals("BBSMSTR_000000000047") || boardVO.getBbsId().equals("BBSMSTR_000000000048")){
				return list("BBSArticle.selectGalleryList", boardVO);
			}else {
				return list("BBSArticle.selectArticleList", boardVO);
			}
		}
	}

	public int selectArticleListCnt(BoardVO boardVO) {
		return (Integer)selectOne("BBSArticle.selectArticleListCnt", boardVO);
	}

	public int selectMaxInqireCo(BoardVO boardVO) {
		return (Integer)selectOne("BBSArticle.selectMaxInqireCo", boardVO);
	}

	public void updateInqireCo(BoardVO boardVO) {
		update("BBSArticle.updateInqireCo", boardVO);
	}

	public BoardVO selectArticleDetail(BoardVO boardVO) {
		String id=boardVO.getBbsId().substring(boardVO.getBbsId().length()-3, boardVO.getBbsId().length());
		int bBsId=Integer.parseInt(id.toString());
		
		if(52<bBsId && bBsId<56) {
			return (BoardVO) selectOne("BBSArticle.selectPeformanceDetail", boardVO);
		}else {
			return (BoardVO) selectOne("BBSArticle.selectArticleDetail", boardVO);
		}
	}
	
	public void replyArticle(Board board) {
		insert("BBSArticle.replyArticle", board);
	}

	public void insertArticle(Board board) {
		insert("BBSArticle.insertArticle", board);
	}
	
	public void insertSkin1Article(Board board) {
		insert("BBSArticle.insertSkin1Article", board);
	}

	public void insertSkin2Article(BoardVO board) {
		insert("BBSArticle.insertSkin2Article", board);
	}
	
	public void insertSkin3Article(BoardVO board) {
		insert("BBSArticle.insertSkin3Article", board);
	}

	public void updateArticle(Board board) {
		update("BBSArticle.updateArticle", board);
	}

	public void deleteArticle(Board board) {
		update("BBSArticle.deleteArticle", board);
		
	}

	public List<BoardVO> selectNoticeArticleList(BoardVO boardVO) {
		return (List<BoardVO>) list("BBSArticle.selectNoticeArticleList", boardVO);
	}
	
	public List<?> selectGuestArticleList(BoardVO vo) {
		return list("BBSArticle.selectGuestArticleList", vo);
	}

	public int selectGuestArticleListCnt(BoardVO vo) {
		return (Integer)selectOne("BBSArticle.selectGuestArticleListCnt", vo);
	}
	
	/*
	 * 블로그 관련
	 */
	public BoardVO selectArticleCnOne(BoardVO boardVO) {
		return (BoardVO) selectOne("BBSArticle.selectArticleCnOne", boardVO);
	}
	
	public List<BoardVO> selectBlogNmList(BoardVO boardVO) {
		return (List<BoardVO>) list("BBSArticle.selectBlogNmList", boardVO);
	}
	
	public List<?> selectBlogListManager(BoardVO vo) {
		return list("BBSArticle.selectBlogListManager", vo);
	}
	
	public int selectBlogListManagerCnt(BoardVO vo) {
		return (Integer)selectOne("BBSArticle.selectBlogListManagerCnt", vo);
	}
	
	public int getArticleMenuCount(HashMap map) {
		return (Integer)selectOne("BBSArticle.getArticleMenuCount", map);
	}
	
	public List<BoardVO> selectArticleDetailDefault(BoardVO boardVO) {
		return (List<BoardVO>) list("BBSArticle.selectArticleDetailDefault", boardVO);
	}
	
	public int selectArticleDetailDefaultCnt(BoardVO boardVO) {
		return (Integer)selectOne("BBSArticle.selectArticleDetailDefaultCnt", boardVO);
	}
	
	public List<BoardVO> selectArticleDetailCn(BoardVO boardVO) {
		return (List<BoardVO>) list("BBSArticle.selectArticleDetailCn", boardVO);
	}
	
	public int selectLoginUser(BoardVO boardVO) {
		return (Integer)selectOne("BBSArticle.selectLoginUser", boardVO);
	}

	public List<BoardVO> selectArticleListMain(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return (List<BoardVO>)list("BBSArticle.selectArticleListMain", boardVO);
	}

	public int selectMaxEmpNo(Board board) {
		// TODO Auto-generated method stub
		return (Integer)selectOne("BBSArticle.selectMaxEmpNo", board);
	}

	public void updateSkin3Article(Board board) {
		update("BBSArticle.updateSkin3Article", board);
	}
	public void updateSkin5Article(Board board) {
		
		update("BBSArticle.updateSkin5Article", board);
	}

	public void updateSkin1Article(Board board) {
		update("BBSArticle.updateSkin1Article", board);
	}

	public List<?> selectYoutubeList(BoardVO boardVO) {
		return list("BBSArticle.selectYoutubeList", boardVO);
	}

	public void insertYoutubeArticle(BoardVO board) {
		insert("BBSArticle.insertYoutubeArticle", board);
	}

	public void updateSkin2Article(Board board) {
		update("BBSArticle.updateSkin2Article", board);
	}
	
	public List<BoardVO> selectNoticeEduArticleList(BoardVO boardVO) {
		return (List<BoardVO>) list("BBSArticle.selectNoticeEduArticleList", boardVO);
	}
	
	public void insertSkin4Article(Board board) {
		insert("BBSArticle.insertSkin4Article", board);
	}
	
	public void updateRecStatus(BoardVO boardVO) {
		update("BBSArticle.updateRecStatus", boardVO);
	}

	public void insertSkin5Article(Board board) {
		insert("BBSArticle.insertSkin5Article", board);
	}

	public List<?> selectArticleListSearch(UserDefaultVO userSearchVO) {
		// TODO Auto-generated method stub
		return  (List<BoardVO>)list("BBSArticle.selectArticleListSearch", userSearchVO);
	}

	public void updateSkin4Article(Board board) {
		// TODO Auto-generated method stub
		update("BBSArticle.updateSkin4Article", board);
	}

	public List<?> selectArticleMainList(BoardVO boardVO) {
		return list("BBSArticle.selectPeformanceMainList", boardVO);
	}
}
