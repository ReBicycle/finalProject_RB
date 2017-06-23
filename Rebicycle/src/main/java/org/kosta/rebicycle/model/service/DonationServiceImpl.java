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
import org.kosta.rebicycle.model.vo.StoryVO;
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
	public void registerDonation(DonationVO dvo, String uploadPath) {
		dvo.setDonationBicycleNo(donationDAO.getDonationBicycleNo());
		donationDAO.registerDonation(dvo, uploadPath);
	}
	@Override
	public void donationStoryRegister(StoryVO svo) {
		donationDAO.donationStoryRegister(svo);
		
	}
	@Override
	public void selectStory(DonationVO dvo) {
	donationDAO.selectStory(dvo);
		
	}

	@Override
	public void donationUpdate(DonationVO dvo) {
		donationDAO.donationUpdate(dvo);
		
	}
	@Override
	public void donationDelete(String donationBicycleNo) {
		donationDAO.donationDelete(donationBicycleNo);
		
	}
	
	
}
