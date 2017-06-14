package org.kosta.rebicycle.model.service;

import java.util.List;

import org.kosta.rebicycle.model.vo.DonationVO;
import org.kosta.rebicycle.model.vo.ListVO;
import org.springframework.web.multipart.MultipartFile;

public interface DonationService {

	ListVO getDonationList(String nowPage);

	DonationVO findDonationDetailByNo(String donationbicycleno);

	void registerDonation(DonationVO dvo);

	void uploadFile(List<MultipartFile> list, String uploadPath, List<String> nameList);

	List<String> uploadFileRename(List<MultipartFile> list, String donorId, String title);

}
