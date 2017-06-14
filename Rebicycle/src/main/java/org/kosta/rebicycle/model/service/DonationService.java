package org.kosta.rebicycle.model.service;

import java.util.List;

import org.kosta.rebicycle.model.vo.DonationVO;
import org.kosta.rebicycle.model.vo.ListVO;

public interface DonationService {

	ListVO getDonationList(String nowPage);

}
