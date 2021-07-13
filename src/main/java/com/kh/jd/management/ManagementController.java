package com.kh.jd.management;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jd.account.Student;
import com.kh.jd.account.Teacher;
import com.kh.jd.lecture.Lecture;
import com.kh.jd.lecture.LectureService;
import com.kh.jd.progress.Progress;
import com.kh.jd.progress.ProgressService;
import com.kh.jd.work.WorkService;

@Controller
public class ManagementController {
	public static final int LIMIT = 10;
	public static final int pageBlock = 5;
	
	@Autowired
	private WorkService workService;
	@Autowired
	private ManagementService managementService;
	@Autowired
	private LectureService LService;
	@Autowired
	private ProgressService PService;
	
	@RequestMapping(value = "/listManagement", method = RequestMethod.GET)
	public ModelAndView listManagement(ModelAndView mv,HttpServletRequest re,Management vo
			, @RequestParam(name = "page", defaultValue = "1") int page) throws ParseException {
		
		Teacher te  = (Teacher)re.getSession().getAttribute("DTO");
		int teacher_number =te.getTeacher_number();
		
		List<Lecture> list = workService.lecturechk(teacher_number);
		mv.addObject("list", list);
		mv.setViewName("management/listManagement");
		
		vo.setTeacher_number(teacher_number);
		if(vo.getLecture_no()!=0) {
			
			int listCount = managementService.getlistManagementCount(vo);
			int pageCnt = (listCount / LIMIT) + (listCount % LIMIT == 0 ? 0 : 1);
			int currentPage = page;
			
			int startPage = 1; 
			int endPage = 5;
			if(currentPage % pageBlock == 0)   { 
				startPage = ((currentPage/pageBlock)-1) * pageBlock + 1;	
			}else {
				startPage = (currentPage/pageBlock) * pageBlock + 1;  
			}		
			endPage = startPage + pageBlock - 1;
		
			if(endPage > pageCnt)
				endPage = pageCnt;
			// 페이지 값 처리용
			// 한 페이지당 출력할 목록 갯수
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("pageCnt", pageCnt);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			List<Management> managementList= managementService.listManagement(currentPage,LIMIT,vo);
			mv.addObject("managementList", managementList);
			String lecture_no = Integer.toString(vo.getLecture_no());
			Lecture vo2 = LService.viewLecture(lecture_no);
			String lecture_title = vo2.getLecture_title();
			int lecture_state = vo2.getLecture_state();
			mv.addObject("lecture_no",lecture_no);
			mv.addObject("lecture_title", lecture_title);
			mv.addObject("lecture_state", lecture_state);
		}
		
		
		return mv;
	}
	@RequestMapping(value = "/viewManagement", method = RequestMethod.POST)
	public ModelAndView viewManagement(ModelAndView mv,HttpServletRequest re,Management vo,Progress progress )  {
		
		int lecture_no = vo.getLecture_no();
		int student_number=vo.getStudent_number();
		mv.addObject("managementDTO", vo);
		
		List<Integer> allGrade = managementService.allGrade(lecture_no);
		List<Integer> allAttend= managementService.allAttend(lecture_no);
		List<Integer> workAllProgress= managementService.workAllProgress(lecture_no);
		Student st = managementService.infoStudent(student_number);
		
		System.out.println("성적"+allGrade+"출석"+allAttend+"진행률"+workAllProgress+"학생정보"+st);
		mv.addObject("allGrade", allGrade);
		mv.addObject("allAttend", allAttend);
		mv.addObject("workAllProgress", workAllProgress);
		mv.addObject("st", st);
		mv.setViewName("management/viewManagement");	
		Lecture l=managementService.infoLecture(vo);
		System.out.println("이거 왜이래??"+l);
		System.out.println("이거 왜이래22??"+lecture_no);
		mv.addObject("infoLecture", l);
		
		progress.setLecture_no(lecture_no);
		progress.setStudent_number(student_number);
		//호재님 평균
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
		
		mv.addObject("myavg", myavg);
		mv.addObject("class1Avg", class1Avg);
		mv.addObject("class2Avg", class2Avg);
		
		
		return mv;
		
	}
}
