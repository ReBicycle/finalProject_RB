package org.kosta.rebicycle.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kosta.rebicycle.model.vo.BicycleVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {
	private String uploadPath;
	@RequestMapping("multi_fileupload.do")
	public ModelAndView fileUpload(BicycleVO vo, HttpServletRequest request){
		
		// uploadPath 실제 운영시에 사용할 서버 업로드 경로
				uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/");
				//개발시에는 워크스페이스 업로드 경로로 준다
				//uploadPath="C:\\java-kosta\\framework-workspace2\\springmvc21-fileupload\\src\\main\\webapp\\resources\\upload\\";
				List<MultipartFile> list=vo.getFile();
				ArrayList<String>nameList=new ArrayList<String>();
				for(int i=0;i<list.size();i++){
					String fileName=list.get(i).getOriginalFilename();
					if(fileName.equals("")==false){
						try {
							list.get(i).transferTo(new File(uploadPath+fileName));
							nameList.add(fileName);
							System.out.println("upload 완료"+fileName);
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
					}
						
				}
				ModelAndView mv=new ModelAndView();
				mv.addObject("nameList", nameList);
				mv.setViewName("product/multifileupload_result.tiles");
		return mv;
		
	}

	
}
