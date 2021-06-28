package com.kh.jd.notice;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.security.auth.callback.Callback;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.kh.jd.work.Work;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	public static final int LIMIT = 10;
	public static final int pageBlock = 5;

	// 목록조회
	@RequestMapping(value = "/listNotice", method = RequestMethod.GET)
	public ModelAndView listNotice(ModelAndView mv, @RequestParam(name = "page", defaultValue = "1") int page) {

		Map<String, Object> map = new HashMap<String, Object>();

		int listCount = noticeService.getListCount(map);
		int pageCnt = (listCount / LIMIT) + (listCount % LIMIT == 0 ? 0 : 1);
		int currentPage = page;

		int startPage = 1;
		int endPage = 5;
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;

		if (endPage > pageCnt)
			endPage = pageCnt;
		// 페이지 값 처리용
		// 한 페이지당 출력할 목록 갯수
		int maxPage = (int) ((double) listCount / LIMIT + 0.9);
		mv.addObject("pageCnt", pageCnt);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("listCount", listCount);

		List<Notice> listNotice = noticeService.listNotice(currentPage, LIMIT, map);

		mv.addObject("listNotice", listNotice);
		mv.setViewName("notice/listNotice");
		return mv;
	}

	// 글조회
	@RequestMapping(value = "/viewNotice", method = RequestMethod.GET)
	public ModelAndView viewNotice(ModelAndView mv, @RequestParam(name = "n_no") int notice_no) {
//		System.out.println(noticeService.viewNotice(notice_no));
		Notice vo = new Notice();
		vo = noticeService.viewNotice(notice_no);
		System.out.println("컨트롤러 vo=" + vo);
		mv.addObject("notice", vo);
		mv.setViewName("notice/viewNotice");
		return mv;
	}

	// 글등록 폼
	@RequestMapping(value = "/addNoticeForm", method = RequestMethod.GET)
	public String addNoticeForm(ModelAndView mv) {
		return "notice/addNotice";
	}

	// 글등록
	@RequestMapping(value = "/addNotice", method = RequestMethod.POST)
	public ModelAndView addNotice(HttpServletRequest request) {
		// System.out.println("들어왔니 add = "+add);
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();

		String t_no = "";
		String m_no = "";
		String n_sub = "";
		String n_con = "";
		String n_file = "";
		int hit = 0;
		
		t_no = request.getParameter("teacher_number");
		m_no = request.getParameter("manager_number");
		n_sub = request.getParameter("notice_sub");
		n_con = request.getParameter("notice_con");
		n_file = request.getParameter("notice_file");
		
		map.put("teacher_number", t_no);
		map.put("manager_number", m_no);
		map.put("notice_sub", n_sub);
		map.put("notice_con", n_con);
		map.put("notice_filepath", n_file);
		map.put("hit", hit);
		
		// map.put("manager_number", mng); //subject, content, num

		System.out.println("map : " + map);
		noticeService.addNotice(map);

		mv.setViewName("redirect:/listNotice");
		return mv;
	}

	// 글수정폼
	@RequestMapping(value = "/editNoticeForm", method = RequestMethod.GET)
	public ModelAndView eidtNotice(ModelAndView mv, @RequestParam(name = "n_no") int notice_no) {
		Notice vo = new Notice();
		vo = noticeService.viewNotice(notice_no);
		System.out.println("vo : " + vo);
		mv.addObject("notice", vo);
		mv.setViewName("notice/editNotice");
		return mv;
	}

	// 글수정
	@RequestMapping(value = "/editNotice", method = RequestMethod.POST)
	public ModelAndView editNotice(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView(); // mv 객체 생성
		Map<String, Object> map = new HashMap<String, Object>();
		String n_no = "";
		String n_sub = "";
		String n_con = "";
		n_no = request.getParameter("n_no");
		n_sub = request.getParameter("n_sub");
		n_con = request.getParameter("editor1");
		map.put("notice_no", n_no);
		map.put("notice_sub", n_sub);
		map.put("notice_con", n_con);
		System.out.println("컨트롤러 map : " + map);
		noticeService.editNotice(map);
		mv.setViewName("redirect:/viewNotice?n_no=" + n_no);
		return mv;
	}

	// 글삭제
	@RequestMapping(value = "/removeNotice", method = RequestMethod.GET)
	public String removeNotice(RedirectAttributes rttr, @RequestParam(name = "n_no") int notice_no) {
		noticeService.removeNotice(notice_no);
		return "redirect:/listNotice";
	}
	// 이미지 업로드
	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	public String fileUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file != null) {
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
					try {
							String fileName = file.getName();
							byte[] bytes = file.getBytes();
							String uploadPath = request.getServletContext().getRealPath("/resources/imageUpload/");
							File uploadFile = new File(uploadPath);
							if(!uploadFile.exists()) {
								uploadFile.mkdirs();
							}
							fileName = UUID.randomUUID().toString();
							uploadPath = uploadPath + "/" + fileName;
							out = new FileOutputStream(new File(uploadPath));
							out.write(bytes);
							out.flush();
							
							printWriter = response.getWriter();
							System.out.println("response : " + response);
							response.setContentType("text/html");
							String fileUrl = request.getContextPath() + "/resources/imageUpload/" + fileName;
							String callback = request.getParameter("CKEditorFuncNum");
							
							// 제이슨 데이터로 등록, {"uploaded":1, "fileName":"tes.jpg", "url":"/imgages/test.jpg"}
							// 4.9버전이상부터 json형태
							json.addProperty("uploaded", 1);
							json.addProperty("fileName", fileName);
							json.addProperty("url", fileUrl);
							printWriter.println(json);
							
							// 4.9버전 이하는 스크립트형태로 리턴
							/*if(!callback.equals("1")) { // callback이 1일 경우만 성공한 것
					        	 printWriter.println("<script>alert('이미지 업로드에 실패했습니다.');"+"</script>");
					        	 System.out.println();
					        }else {*/
//					        	printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
//					        			+ callback
//					        			+ ",'"
//					        			+ fileUrl
//					        			+ "','이미지를 업로드 하였습니다.'"
//					        			+ ")</script>");
//					        			printWriter.flush(); 
					        	
					}catch(IOException e) {
						e.printStackTrace();
					}finally {
						if(out != null) {
							out.close();
						}
						if(printWriter != null) {
							printWriter.close();
						}
										}
								}
						}
				}
				return null;
	}
}

