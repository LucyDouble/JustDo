package com.kh.jd.progress;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProgressController {
	// 현재 재생 시간 값 받기
	@ResponseBody
	@RequestMapping(value = "Addprogress", method = RequestMethod.POST)
	public String Addprogress(Model m,HttpServletRequest request, @RequestParam(name="progress") int progress) {
		
		System.out.println(progress);
		return "";
	}
}
