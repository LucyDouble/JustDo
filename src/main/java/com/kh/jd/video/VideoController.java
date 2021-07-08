package com.kh.jd.video;

import java.awt.image.BufferedImage; 
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.jcodec.api.FrameGrab;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.model.Picture;
import org.jcodec.scale.AWTUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.EagerTransformation;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.jd.account.Student;
import com.kh.jd.account.Teacher;
import com.kh.jd.registration.Registration;
import com.kh.jd.registration.RegistrationService;


@Controller
public class VideoController {
	@Autowired
	private RegistrationService RService;
	@Autowired
	private VideoService VService;
	
	// 학습동영상 리스트
	@RequestMapping(value = "listVideo", method = RequestMethod.GET)
	public String listVideo(Model m, HttpServletRequest request, Registration re) {
		Student st = new Student();
		Teacher te = new Teacher();
		List<Registration> list = null;
		int student_number = 0;
		int teacher_number = 0;
		try {
			String ss = request.getSession().getAttribute("DTO").toString();
			String[] str = ss.split(" ");
			if(str[0]=="Teacher" || str[0].equals("Teacher")) {
				te= (Teacher)request.getSession().getAttribute("DTO");
				teacher_number=te.getTeacher_number();
				re.setTeacher_number(teacher_number);
				request.setAttribute("user", teacher_number);
			}else {
				st= (Student)request.getSession().getAttribute("DTO");
				student_number=st.getStudent_number();
				re.setStudent_number(student_number);
				request.setAttribute("user", student_number);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		list = RService.listRegistration(re);
		System.out.println(list);
		m.addAttribute("list", list);
		return "/video/listVideo";
	}
	
	// 등록 폼
	@RequestMapping(value = "addVideo", method = RequestMethod.GET)
	public String addVideo(Model m,HttpServletRequest request) {
		String number = request.getParameter("lectureclass_no");
		m.addAttribute("number", number);
		return "video/addVideo";
	}
	
	// 학습동영상 썸네일 출력
	@ResponseBody
	@RequestMapping(value = "listThumbnail", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String listThumbnail(HttpServletRequest request, @RequestParam(name="lectureclass_no") int lectureclass_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", VService.listVideo(lectureclass_no));
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonOutput = gson.toJson(map);
		return jsonOutput;
	}
	
	// 학습동영상 등록 및 영상 업로드, 썸네일 추출
	@RequestMapping(value = "addVideo", method = RequestMethod.POST)
	public String addVideo(Model m, @RequestParam(name="video_file_org") MultipartFile multipartFile
			,HttpServletRequest request, Video video) {
		String path = request.getSession().getServletContext().getRealPath("resources");
		String savePath = path + "\\video";
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		File targetFile = new File(path + multipartFile.getOriginalFilename());  // TODO
		String videoName = multipartFile.getOriginalFilename(); // 동영상 파일 이름
		String fullName = videoName + multipartFile.getOriginalFilename(); // 경로 + 동영상 파일 이름
		String filePath = null;
		String filePath2 = null;
		String imgName ="";
		String url = "";
		String url2 = "";
		try {
			System.out.println(videoName +"을 저장합니다.");
			System.out.println("저장 경로 : "+savePath);
			
			filePath = folder + "\\" + videoName;
			multipartFile.transferTo(new File(filePath)); // 파일 저장
			
			imgName = getMovieThumbnail(filePath, videoName); // 추출한 썸네일 이름
			System.out.println(imgName);
			filePath2 = folder + "\\" + imgName;
			Map config = new HashMap();
	        config.put("cloud_name", "jdec");
	        config.put("api_key", "865597575541279");
	        config.put("api_secret", "SUUC6_OahrI__kqYY808AVXDOco");
	        Cloudinary cloudinary = new Cloudinary(config);
	        Map res = cloudinary.uploader().upload(new File(filePath), ObjectUtils.asMap("resource_type", "video",
	        	    "public_id", videoName.replace(".mp4", ""),
	        	    "eager", Arrays.asList(
	        	        new EagerTransformation().width(300).height(300).crop("pad").audioCodec("none"),
	        	        new EagerTransformation().width(160).height(100).crop("crop").gravity("south").audioCodec("none")),
	        	    "eager_async", true,
	        	    "eager_notification_url", "https://mysite.example.com/notify_endpoint"));
	        Map res1 = cloudinary.uploader().upload(new File(filePath2), ObjectUtils.emptyMap());
	        url = res.get("url") == null ? "" : res.get("url").toString();
	        url2 = res1.get("url") == null ? "" : res1.get("url").toString();
	        System.out.println("파일 명 : " + videoName);
	        System.out.println("파일 경로 : " + filePath);
	        System.out.println("파일 전송이 완료되었습니다.");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 업로드 실패~~~~~~~~~~~~~~~~~~~");
		}
//		video.setVideo_file(videoName);
		video.setVideo_file(url);
		video.setVideo_path(url);
//		video.setVideo_image(imgName);
		video.setVideo_image(url2);
		System.out.println(video);
		VService.addVideo(video);
		return "redirect:/listVideo";
	}
	
	// 썸네일 추출 함수
	public static String getFileExtension(String string) {
	    if (string == null) {
	        return "";
	    }
	    String name = string;
	    int i = name.lastIndexOf('.');
	    String ext = i > 0 ? name.substring(i + 1) : "";
	    return ext;
	}
	// 썸네일 추출 함수
	public String getMovieThumbnail(String filePath, String name) throws Exception {
	     
	    File videoFile=new File(filePath);     
	    String fileName = videoFile.getAbsolutePath();
	    String baseName =fileName.substring(fileName.lastIndexOf("\\") + 1, fileName.lastIndexOf("."));
	    String savePath = fileName.substring(0, fileName.lastIndexOf("\\"));
	    String ext=getFileExtension(name);
	    String pngFileName=name.replaceAll(ext,"png");
	    String pngFileNameSave=savePath+"/"+baseName+".png";
	     
	    //double second = 60;        
	    int frameNumber=1;
	     
	    FrameGrab grab;        
	    try {
	        grab = FrameGrab.createFrameGrab(NIOUtils.readableChannel(videoFile));
	         
	        /** 다음 중 선택
	          1)grab.seekToSecondSloppy(second);                     
	          2)grab.seekToSecondPrecise(second);              
	          3)grab.seekToFramePrecise(frameNumber);
	          4)grab.seekToFrameSloppy(frameNumber)
	           
	        */
	        /**
	         * 동영상의 특정 프레임에 프레임 그래버 위치 지정 엉성한 탐색 수행, 즉 요청 된 정확한 프레임을 실제로 찾지 않고 가장 가까운 키 프레임을 탐색합니다.
	         * 참고 : 가장 가까운 이전 키 프레임을 탐색하고 수행하지 않기 때문에 빠릅니다. 중간에 프레임 디코딩 시도
	         */
	        grab.seekToFrameSloppy(frameNumber);
	         
	        Picture picture = grab.getNativeFrame();                                                
	        BufferedImage bufferedImage = AWTUtil.toBufferedImage(picture);
	        ImageIO.write(bufferedImage, "png", new File(pngFileNameSave));            
	        return pngFileName;
	    } catch (Exception e1) {
	        e1.printStackTrace();
	         
	        return null;      
	    }
	}
}
