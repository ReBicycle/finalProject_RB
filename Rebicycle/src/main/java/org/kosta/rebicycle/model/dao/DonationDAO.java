package org.kosta.rebicycle.model.dao;

import java.util.List;

import org.kosta.rebicycle.model.vo.DonationVO;
import org.kosta.rebicycle.model.vo.PagingBean;
import org.kosta.rebicycle.model.vo.StoryVO;
import org.springframework.web.multipart.MultipartFile;

public interface DonationDAO {

	int getTotalContentsNo();

	List<DonationVO> getDonationList(PagingBean pb);

	DonationVO findDonationDetailByNo(String donationbicycleno);

	void registerDonation(DonationVO dvo);

	void uploadFile(List<MultipartFile> list, String uploadPath, List<String> nameList);

	int getDonationBicycleNo();

	List<String> uploadFileRename(List<MultipartFile> list,int donationBicycleNo);

	void donationStoryRegister(StoryVO svo);

	void selectStory(DonationVO dvo);

	void donationUpdate(DonationVO dvo);

	void donationDelete(String donationBicycleNo);

}
