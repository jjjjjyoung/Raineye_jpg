package egovframework.com.cmm;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;
/**
 * ImagePaginationRenderer.java 클래스
 *
 * @author 서준식
 * @since 2011. 9. 16.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2011. 9. 16.   서준식       이미지 경로에 ContextPath추가
 *   2016. 6. 17.   장동한       표준프레임워크 v3.6 리뉴얼
 * </pre>
 */
public class ImagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;

	public ImagePaginationRenderer() {

	}

	public void initVariables(){
		
		/** 변수 설명
		 * {0} -> 함수 fn_egov_select_linkPage() 
		 * {1} -> 페이지 번호
		 * {2} -> 현재 페이지 이외의 페이지 번호*/

		//firstPageLabel    = "<li class=\"first\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><<</a></li>";
		firstPageLabel    = "";
		previousPageLabel = "<div class=\"prev\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">이전</a></div>";
		
        currentPageLabel  = "<div class=\"current num on\"><a onClick=\"return false;\">{0}</a></div>";
        otherPageLabel    = "<div class=\"num\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a></div>";
        
        nextPageLabel    = "<div class=\"next\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">다음</a></div>";
        //lastPageLabel    = "<li class=\"last\"><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">>></a></li>";
        lastPageLabel    = "";

	}



	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}
