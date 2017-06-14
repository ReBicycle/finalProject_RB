package org.kosta.rebicycle.model.service;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.DonationDAO;
import org.kosta.rebicycle.model.vo.ListVO;
import org.kosta.rebicycle.model.vo.PagingBean;
import org.springframework.stereotype.Service;
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
	
}
