package org.kosta.rebicycle.model.dao;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.DonationVO;
import org.kosta.rebicycle.model.vo.PagingBean;
import org.kosta.rebicycle.model.vo.PhotoVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class DonationDAOImpl implements DonationDAO {
	@Resource
	private SqlSessionTemplate template;
	@Override
	public int getTotalContentsNo() {
		String total=template.selectOne("donation.getTotalContentsNo");
		return Integer.parseInt(total);
	}
	@Override
	public List<DonationVO> getDonationList(PagingBean pb) {
	
		return template.selectList("donation.getDonationList",pb);
	}
	@Override
	public DonationVO findDonationDetailByNo(String donationbicycleno) {
		DonationVO dvo=template.selectOne("donation.findDonationDetailByNo",Integer.parseInt(donationbicycleno));
		String address= dvo.getAddress();
		String address2="";
		int index=address.indexOf("%")+1;
		address = address.substring(index);
		address2=address.replaceAll("%", " ");
		dvo.setAddress(address2);
		return dvo ;
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
		
		List<String> list = uploadFileRename(dvo.getFile(), dvo.getDonationBicycleNo());
								
		PhotoVO pvo=new PhotoVO(list.get(0),list.get(1),list.get(2));
		dvo.setPhotoVO(pvo);
		
		
		System.out.println(dvo);
		template.insert("donation.registerDonation",dvo);
		uploadFile(dvo.getFile(), uploadPath,list);
	}
	@Override
	public void uploadFile(List<MultipartFile> list, String uploadPath,List<String> nameList) {

		for (int i = 0; i < list.size(); i++) {
			if (nameList.get(i).equals("") == false) {
				try {
					list.get(i).transferTo(new File(uploadPath + nameList.get(i)));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
	}// uploadFile method
	@Override

	public List<String> uploadFileRename(List<MultipartFile> list,int donationBicycleNo){
		ArrayList<String> nameList = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			int pos = list.get(i).getOriginalFilename().lastIndexOf(".");
			String ext = list.get(i).getOriginalFilename().substring(pos + 1);
			String fileName = String.valueOf(donationBicycleNo)+ "_photo" + (i + 1) + "." + ext;
			nameList.add(fileName);
		}
		return nameList;
	}
	@Override
	public int getDonationBicycleNo() {
		
		return template.selectOne("donation.getDonationBicycleNo");
	}
}
