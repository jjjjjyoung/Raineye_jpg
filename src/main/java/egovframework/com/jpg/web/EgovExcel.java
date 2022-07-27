/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.com.jpg.web;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import egovframework.com.jpg.service.EduProgramVO;

/**
 * 엑셀파일을 생성하는 클래스를 정의한다.
 * @author 실행환경 개발팀 신혜연
 * @since 2011.07.11
 * @version 1.0
 * @see 
 * <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.07.11  신혜연          최초 생성
 * 포이
 * </pre>
 */
public class EgovExcel extends AbstractExcelView {

	/**
	 * 엑셀파일을 설정하고 생성한다.
	 * @param model
	 * @param wb
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook wb, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "public");
		response.setHeader("Expires", "0");
		response.setHeader("Content-Disposition", "attachment; filename=ApplyUserList.xls");
        
		HSSFCell cell = null;
		 
		HSSFSheet sheet = wb.createSheet("User List");
		sheet.setDefaultColumnWidth((short) 12);
 
		// put text in first cell
		cell = getCell(sheet, 0, 0);
		setText(cell, "User List");
 
		// set header information
		setText(getCell(sheet, 2, 0), "신청자");
		setText(getCell(sheet, 2, 1), "전화번호");
		setText(getCell(sheet, 2, 2), "이메일");
		setText(getCell(sheet, 2, 3), "교육명");
		setText(getCell(sheet, 2, 4), "클래스");
		setText(getCell(sheet, 2, 5), "신청일");
		setText(getCell(sheet, 2, 6), "승인일");
		setText(getCell(sheet, 2, 7), "승인여부");
 
		List<EduProgramVO> excel = (List<EduProgramVO>) model.get("excelList");
 		
		
		for (int i = 0; i < excel.size(); i++) {
			EduProgramVO eduProgramVO = excel.get(i);
				cell = getCell(sheet, 3 + i, 0);
				setText(cell, eduProgramVO.getMberNm());
				cell = getCell(sheet, 3 + i, 1);
				setText(cell, eduProgramVO.getEduApplyTel());
				cell = getCell(sheet, 3 + i, 2);
				setText(cell, eduProgramVO.getEduEmail());
				cell = getCell(sheet, 3 + i, 3);
				setText(cell, eduProgramVO.getNttSj());
				cell = getCell(sheet, 3 + i, 4);
				setText(cell, eduProgramVO.getEduType());
				cell = getCell(sheet, 3 + i, 5);
				setText(cell, eduProgramVO.getRegistDate());
				cell = getCell(sheet, 3 + i, 6);
				setText(cell, eduProgramVO.getAgreeDate());
				cell = getCell(sheet, 3 + i, 7);
				if (eduProgramVO.getStatus() == "I") {
					setText(cell, "신청중");
				} else if (eduProgramVO.getStatus() == "C") {
					setText(cell, "신청 완료");
				} else if (eduProgramVO.getStatus() == "N"){
					setText(cell, "신청 취소");
				}
		}
		
	}
}
