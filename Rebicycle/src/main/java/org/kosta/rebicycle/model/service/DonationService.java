package org.kosta.rebicycle.model.service;

import org.kosta.rebicycle.model.vo.DonationVO;
import org.kosta.rebicycle.model.vo.ListVO;
import org.kosta.rebicycle.model.vo.StoryVO;

public interface DonationService {

	ListVO getDonationList(String nowPage);

	DonationVO findDonationDetailByNo(String donationbicycleno);

	void registerDonation(DonationVO dvo, String uploadPath);

	void donationStoryRegister(StoryVO svo);

	void selectStory(DonationVO dvo);

	void donationUpdate(DonationVO dvo);

	void donationDelete(String donationBicycleNo);



}
