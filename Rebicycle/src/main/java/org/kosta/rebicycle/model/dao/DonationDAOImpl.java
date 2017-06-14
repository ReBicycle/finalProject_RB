package org.kosta.rebicycle.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.DonationVO;
import org.kosta.rebicycle.model.vo.PagingBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
