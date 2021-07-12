package com.kh.jd.progress;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.jd.account.Student;
import com.kh.jd.account.Teacher;

@Controller
public class ProgressController {
	@Autowired
	private ProgressService PService;
	// 현재 재생 시간 값 받기
	@ResponseBody
	@RequestMapping(value = "Addprogress", method = RequestMethod.POST)
	public String Addprogress(Model m,HttpServletRequest request, @RequestParam(name="progress") int progress,
			@RequestParam(name="progress_no") int progress_no, Progress pro) {
		
		System.out.println(progress);
		System.out.println(progress_no);
		System.out.println(pro);
		PService.updateProgress(pro);
		return "";
	}
	@ResponseBody
	@RequestMapping(value = "avgProgress", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String avgProgress(Model m,HttpServletRequest request, @RequestParam(name="lecture_no") int lecture_no,
			Progress progress) {
		Map<String, Object> map = new HashMap<String, Object>();
		Student st= (Student)request.getSession().getAttribute("DTO");
		int student_number=st.getStudent_number();
		progress.setLecture_no(lecture_no);
		progress.setStudent_number(student_number);
		
		List<Integer> down = PService.avgProgress(lecture_no);
		List<Integer> up = PService.avgProgress1(lecture_no);
		double allDown = 0;
		double allUp = 0;
		for( Integer integer : down) {
			allDown += integer;
		}
		for( Integer integer : up) {
			allUp += integer;
		}
		double agg = (allUp / allDown) * 100;
		String avg = String.format("%.2f", agg);
		
		List<Integer> mydown = PService.myProgress(progress);
		List<Integer> myup = PService.myProgress1(progress);
		double myallDown = 0;
		double myallUp = 0;
		for( Integer integer : mydown) {
			myallDown += integer;
		}
		for( Integer integer : myup) {
			myallUp += integer;
		}
		double myagg = (myallUp / myallDown) * 100;
		String myavg = String.format("%.2f", myagg);
		
		List<Integer> class1Down = PService.classProgress(lecture_no);
		List<Integer> class1Up = PService.classProgress1(lecture_no);
		double allClass1Down = 0;
		double allClass1Up = 0;
		for( Integer integer : class1Down) {
			allClass1Down += integer;
		}
		for( Integer integer : class1Up) {
			allClass1Up += integer;
		}
		double myclass1Avg = (allClass1Up / allClass1Down) * 100;
		String class1Avg = String.format("%.2f", myclass1Avg);
		
		List<Integer> class2Down = PService.class2Progress(lecture_no);
		List<Integer> class2Up = PService.class2Progress1(lecture_no);
		double allClass2Down = 0;
		double allClass2Up = 0;
		for( Integer integer : class2Down) {
			allClass2Down += integer;
		}
		for( Integer integer : class2Up) {
			allClass2Up += integer;
		}
		double myclass2Avg = (allClass2Up / allClass2Down) * 100;
		String class2Avg = String.format("%.2f", myclass2Avg);
		
		map.put("avg", avg);
		map.put("myavg", myavg);
		map.put("class1Avg", class1Avg);
		map.put("class2Avg", class2Avg);
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonOutput = gson.toJson(map);
		return jsonOutput;
	}
}
