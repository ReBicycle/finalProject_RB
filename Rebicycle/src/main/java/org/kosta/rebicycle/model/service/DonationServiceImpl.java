package org.kosta.rebicycle.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.DonationDAO;
import org.kosta.rebicycle.model.vo.DonationVO;
import org.kosta.rebicycle.model.vo.ListVO;
import org.kosta.rebicycle.model.vo.PagingBean;
import org.kosta.rebicycle.model.vo.PhotoVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
@Service
public class DonationServiceImpl implements DonationService {
@Resource
private DonationDAO donationDAO;
	@Override
	public ListVO getDonationList(String page) {
		ListVO listVO=new ListVO();
		PagingBean pb=new PagingBean(donationDAO.getTotalContentsNo(),Integer.parseInt(page));
		listVO.setPagingBean(pb);
		listVO.setdonationList(donationDAO.getDonationList(pb));
		return listVO;
	}
	@Override
	public DonationVO findDonationDetailByNo(String donationbicycleno) {
		
		return donationDAO.findDonationDetailByNo(donationbicycleno);
	}
	@Override
	public void registerDonation(DonationVO dvo) {
		// uploadPath 실제 운영시에 사용할 서버 업로드 경로
		//String uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/bicycle/");
		//개발시에는 워크스페이스 업로드 경로로 준다
		//종봉
		String uploadPath="C:\\Users\\Administrator\\git\\finalProject_RB\\Rebicycle\\src\\main\\webapp\\resources\\upload\\donation\\";
		//태형
		//String uploadPath="C:\\Users\\KOSTA\\git\\finalProject_RB\\Rebicycle\\src\\main\\webapp\\resources\\upload\\donation\\"; 
		
		List<String> list = uploadFileRename(dvo.getFile(),dvo.getDonorId(),dvo.getTitle());
								
		PhotoVO pvo=new PhotoVO(list.get(0),list.get(1),list.get(2));
		dvo.setPhotoVO(pvo);
		donationDAO.registerDonation(dvo);
		uploadFile(dvo.getFile(), uploadPath,list);
		
	}
	
	@Override
	public void uploadFile(List<MultipartFile> list, String uploadPath,List<String> nameList) {

		for (int i = 0; i < list.size(); i++) {
			if (nameList.get(i).equals("") == false) {
				try {
					list.get(i).transferTo(new File(uploadPath + nameList.get(i)));
					System.out.println("upload 완료" + nameList.get(i));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
	}// uploadFile method
	@Override

	public List<String> uploadFileRename(List<MultipartFile> list,String donorId,String title){
		ArrayList<String> nameList = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			int pos = list.get(i).getOriginalFilename().lastIndexOf(".");
			String ext = list.get(i).getOriginalFilename().substring(pos + 1);
			String fileName = donorId+title.substring(0,4)+ "_photo" + (i + 1) + "." + ext;
			nameList.add(fileName);
		}
		return nameList;
	}
}
