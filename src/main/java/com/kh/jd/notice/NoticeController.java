package com.kh.jd.notice;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.JsonObject;

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
		Notice vo = new Notice();
		vo = noticeService.viewNotice(notice_no);
		
		System.out.println("컨트롤러 vo=" + vo);
		mv.addObject("notice", vo);
		mv.setViewName("notice/viewNotice");
		List<Notice> listFile = noticeService.listFile(notice_no);
		mv.addObject("listFile", listFile);
		return mv;
	}

	// 글등록 폼
	@RequestMapping(value = "/addNoticeForm", method = RequestMethod.GET)
	public String addNoticeForm(ModelAndView mv) {
		return "notice/addNotice";
	}

	// 글등록
	@RequestMapping(value = "/addNotice", method = RequestMethod.POST)
	public ModelAndView addNotice(HttpServletResponse response, HttpServletRequest request,
			@RequestParam(name = "notice_filepath", required = false) MultipartFile[] multiFile) throws IOException {

		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		String t_no = request.getParameter("teacher_number");
		String m_no = request.getParameter("manager_number");
		String n_sub =  request.getParameter("notice_sub");
		String n_con = request.getParameter("notice_con");
		
		System.out.println("티처넘버 = " + t_no);
		System.out.println("매니저넘버 = " + m_no);
		
		map.put("teacher_number", t_no);
		map.put("manager_number", m_no);
		map.put("notice_sub", n_sub);
		map.put("notice_con", n_con);
		
		String path = request.getServletContext().getRealPath("fileUpload/");
		File filePath = new File(path); // 만약 fileUpload 폴더가 없다면 폴더생성

		map.put("notice_filepath", path);
		noticeService.addNotice(map);	 
		
				try {
					for(int i=0; i<multiFile.length; i++) {
					if (multiFile[i] != null) {
							if (!filePath.exists()) {
								filePath.mkdirs();
							}
							File files = new File(path, multiFile[i].getOriginalFilename()); 	// 파일생성
							FileCopyUtils.copy(multiFile[i].getBytes(), files);						// 파일복사
							map.put("notice_filename", multiFile[i].getOriginalFilename());	// 파일이름 맵에 담기
							noticeService.addFile(map);
							}
						}
				} catch (

				Exception e) {
					e.printStackTrace();
					System.out.println("파일 저장에 실패했습니다");
				}
				try {
					System.out.println("map : " + map);
					mv.setViewName("redirect:/listNotice");
				} catch (Exception e) {
					e.printStackTrace();
				}
				return mv;
			}
	
	// 파일 다운로드
	@RequestMapping(value = "/fileDownload", method = RequestMethod.GET)
	public void fileDownload(Notice vo, HttpServletRequest req, HttpServletResponse res, @RequestParam(name = "n_no") int notice_no  ) throws Exception {

			Notice noticeVO =  noticeService.viewNotice(notice_no); 
			System.out.println("vo = "+vo);
			
	    	String filePath 			= noticeVO.getNotice_filepath();//"여기 vo에서 파일패스가져오기"
	    	String fileName 		= vo.getNotice_filename();
		 	String fileFullPath 	= filePath + fileName;
	    	
			System.out.println("filePath : " + filePath);
			System.out.println("fileName : " + fileName);
			System.out.println("fileFullPath : " + fileFullPath);
		 	File file = new File(fileFullPath);
		 	System.out.println("file = " + file);

			if(file.exists()) {
				
				  String userAgent = req.getHeader("User-Agent");
				  System.out.println("userAgent = " + userAgent);
				  boolean ie = userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("rv:11") > -1;
				  System.out.println("ie = " + ie);
				  if (ie) {
					  fileName = URLEncoder.encode((String) fileName, "utf-8");
				  } else {
					  fileName = new String(((String) fileName).getBytes("utf-8"),"iso-8859-1");
				  }

				  res.setContentType("application/octet-stream");
				  res.setHeader("Content-Disposition","attachment;filename=\"" +fileName+"\";");

				  FileInputStream fis=new FileInputStream(file);
				  System.out.println("fis = " + fis);
				  BufferedInputStream bis=new BufferedInputStream(fis);
				  System.out.println("bis = " + bis);
				  ServletOutputStream so=res.getOutputStream();
				  System.out.println("so = " + so);
				  BufferedOutputStream bos=new BufferedOutputStream(so);
				  System.out.println("bos = " + bos);

				  byte[] data=new byte[2048];
				  int input=0;
				  while((input=bis.read(data))!=-1){
					  bos.write(data,0,input);
					  bos.flush();
				  }

				  if(bos!=null) bos.close();
				  if(bis!=null) bis.close();
				  if(so!=null) so.close();
				  if(fis!=null) fis.close();

			} else {
				res.setCharacterEncoding("UTF-8"); 
				res.setContentType("text/html;charset:UTF-8");
				res.setHeader("Cache-Control", "no-cache");
				res.getWriter().print("<script>alert('파일이 존재하지 않거나 삭제되었습니다.')</script>");
			}
	}

	// 글수정폼
	@RequestMapping(value = "/editNoticeForm", method = RequestMethod.GET)
	public ModelAndView eidtNotice(ModelAndView mv, @RequestParam(name = "n_no") int notice_no) {
		Notice vo = new Notice();
		vo = noticeService.viewNotice(notice_no);
		System.out.println("vo : " + vo);
		mv.addObject("notice", vo);
		mv.setViewName("notice/editNotice");
		List<Notice> listFile = noticeService.listFile(notice_no);
		mv.addObject("listFile", listFile);
		return mv;
	}

	// 글수정
	@RequestMapping(value = "/editNotice", method = RequestMethod.POST)
	public ModelAndView editNotice(HttpServletRequest request, @RequestParam(name = "notice_filepath", required = false) MultipartFile[] multiFile) throws IOException {
		ModelAndView mv = new ModelAndView(); // mv 객체 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		String n_no = "";
		String n_sub = "";
		String n_con = "";
		n_no = request.getParameter("n_no");
		int notice_no = Integer.parseInt(n_no);
		n_sub = request.getParameter("n_sub");
		n_con = request.getParameter("editor1");
		String chk = request.getParameter("allcount");
		System.out.println("chk="+chk);
		if (chk != null) {

			int count = Integer.parseInt(request.getParameter("allcount"));
			List<String> list = new ArrayList<String>();
			for (int i = 1; i <= count; i++) {
				String aaa = request.getParameter(String.valueOf(i));
				list.add(aaa);
			}

			for (int i = 0; i < list.size(); i++) {
				delFile(list.get(i), request); // DB삭제
			}

		}
		List<Notice> listFile = noticeService.listFile(notice_no);
		System.out.println("listFile = "+ listFile);
		System.out.println("notice_no ="+notice_no);
		mv.addObject("listFile", listFile);
		map.put("notice_no", n_no);
		map.put("notice_sub", n_sub);
		map.put("notice_con", n_con);

		String path = request.getServletContext().getRealPath("fileUpload/");
		File filePath = new File(path); // 만약 fileUpload 폴더가 없다면 폴더생성

		map.put("notice_filepath", path);
		noticeService.editNotice(map);	 
		System.out.println("map =" + map);
		
//		delete from filelist where notice_no=#{notice_no} ;
//		noticeService.delFile(notice_no); // 삭제
		
		try {
			if (multiFile[0].getOriginalFilename().length() != 0) {
//				noticeService.delFile(notice_no); 
			for(int i=0; i<multiFile.length; i++) {

					if (!filePath.exists()) {
						filePath.mkdirs();
					}
					File files = new File(path, multiFile[i].getOriginalFilename()); // 파일생성
					System.out.println(multiFile[i].getOriginalFilename());
					FileCopyUtils.copy(multiFile[i].getBytes(), files);					// 파일복사
					map.put("notice_filename", multiFile[i].getOriginalFilename());
					System.out.println("컨트롤러 수정 map ="+map);
					noticeService.addFile(map);
					
					}
				}
		} catch (

		Exception e) {
			e.printStackTrace();
			System.out.println("파일 저장에 실패했습니다");
		}
		try {
			System.out.println("map : " + map);
			mv.setViewName("redirect:/listNotice");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
		
//	// 첨부파일 삭제
//	@RequestMapping(value = "/delFile", method = RequestMethod.POST)
//	@ResponseBody
//	public String delFile(HttpServletRequest req, HttpServletResponse res, @RequestParam(name = "filename") String notice_filename,
//			Notice vo) {
	public void delFile(String name, HttpServletRequest request) {
		System.out.println("들어왔나영?");
		
		try {
			noticeService.delFile(name); // 디비에서 삭제하기
			String path = request.getServletContext().getRealPath("fileUpload/");
			String fileFull = path + name;
			System.out.println("fileFull=" + fileFull);
			File file = new File(fileFull);
			if (file.exists() == true) {
				file.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
//		return "";
	}

	// 글삭제
	@RequestMapping(value = "/removeNotice", method = RequestMethod.GET)
	public String removeNotice(RedirectAttributes rttr, @RequestParam(name = "n_no") int notice_no) {
		noticeService.removeNotice(notice_no);
		return "redirect:/listNotice";
	}

	// ck에디터 이미지 업로드
	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {

		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						String uploadPath = request.getServletContext().getRealPath("/resources/imageUpload/");
						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
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
						if (!callback.equals("1")) { // callback이 1일 경우만 성공한 것
							printWriter.println("<script>alert('이미지 업로드에 실패했습니다.');" + "</script>");
							System.out.println();
						} else {

							json.addProperty("uploaded", 1);
							json.addProperty("fileName", fileName);
							json.addProperty("url", fileUrl);
							printWriter.println(json);
							
						}
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
		return null;
	}

}
