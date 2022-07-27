<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>


<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/regist-layout.css' />">



<script type="text/javaScript" language="javascript" defer="defer">


/* <c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if> */
	function validate_fileupload(fileName)
	{
	    var allowed_extensions = new Array("mp3","wav","wma","flac","aac");
	    var file_extension = fileName.split('.').pop().toLowerCase(); // split function will split the filename by dot(.), and pop function will pop the last element from the array which will give you the extension as well. If there will be no extension then it will return the filename.

	    for(var i = 0; i <= allowed_extensions.length; i++)
	    {
	        if(allowed_extensions[i]==file_extension)
	        {
	            return true; // valid file extension
	        }
	    }
		
	    alert("확장자 명을 확인해주세요.\n허용된 확장자명 : .mp3, .wav, .wma, .flac, .aac");
	    return false;
	}
</script>

<style>
.layout-container form { border-top: 0; padding: 0 !important;}
.search_box { margin-bottom: 1.2rem;}
</style>

</head>

<body>
<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div class="layout-container">

	<h1>BGM 관리</h1>
	
		<form method="post" action="/bgmInsert.do" enctype="multipart/form-data" ">
			<div class="wTableFrm">
				<input type="hidden" name="type" value="BGM_" />
				
				<table class="datatables-demo table-striped table-bordered dataTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
					<tr>
						<th class="col-xs-3 center">첨부파일<img
							src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15"
							height="15" alt="필수입력표시">
						</th>
						<td class="col-xs-7 center"><input type="file" name="file_1" id="egovComFileUploader" onchange="validate_fileupload(this.value);"
							title="이미지">
						<!-- onchange="javascript:fncOnChangeImage();" --></td>
						<td class="col-xs-2 center"><input type="submit" class="btn btn-success btn-sm"
							value="<spring:message code="button.save" />"></td>
					</tr>
				</table>
			</div>
		</form>
		<form method="post" action="/bgmdelete.do" enctype="multipart/form-data">
		
			
			<div class="wTableFrm">
				<table class="wTable">
					<tbody>
						<c:forEach var="item" items="${list}">
								<tr>
									<th class="tg-c3ow">
										파일명
									</th>
									<td class="tg-c3ow">
										<c:out value="${item.orignlFileNm}" />
									</td>
									<%-- <td class="tg-c3ow">
										<c:if test="${item.useAt.equals('Y') }">
											<button class="btn btn-success btn-sm">재생안함</button>
										</c:if>
										<c:if test="${item.useAt.equals('N') }">
											<button class="btn btn-success btn-sm">재생함</button>
										</c:if>
									</td> --%>
									<td class="tg-c3ow">
										<button class="btn btn-success btn-sm">삭제</button>
									</td>
								</tr>
								<input type="hidden" name="atchFileId" value="${item.atchFileId }">
								<input type="hidden" name="fileSn" value="${item.fileSn }">
						</c:forEach>
					</tbody>
				</table>
			</div>
		</form>



</div>

<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>
