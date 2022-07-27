package egovframework.com.jpg.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class JpgBoardController{
	
	@Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

	@RequestMapping("/selectBoard.do")
	public String SelectBoard(@RequestParam Map<?, ?> commandMap) throws Exception {
		
		String bbsId = (String)commandMap.get("bbsId");

		
		
		return "egovframework/com/jpg/userLogin";
	}
}
