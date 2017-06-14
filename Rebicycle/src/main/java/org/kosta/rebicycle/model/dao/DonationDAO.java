package org.kosta.rebicycle.model.dao;

import java.util.List;

import org.kosta.rebicycle.model.vo.DonationVO;
import org.kosta.rebicycle.model.vo.PagingBean;

public interface DonationDAO {

	int getTotalContentsNo();

	List<DonationVO> getDonationList(PagingBean pb);

	DonationVO findDonationDetailByNo(String donationbicycleno);

	void registerDonation(DonationVO dvo);

}
