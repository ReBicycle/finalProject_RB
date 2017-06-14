package org.kosta.rebicycle.model.service;

import org.kosta.rebicycle.model.vo.DonationVO;
import org.kosta.rebicycle.model.vo.ListVO;

public interface DonationService {

	ListVO getDonationList(String nowPage);

	DonationVO findDonationDetailByNo(String donationbicycleno);

	void registerDonation(DonationVO dvo);



}
