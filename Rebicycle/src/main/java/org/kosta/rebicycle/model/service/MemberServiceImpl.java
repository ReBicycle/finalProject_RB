package org.kosta.rebicycle.model.service;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.dao.MemberDAO;
import org.kosta.rebicycle.model.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;

	@Override
	public MemberVO login(MemberVO mvo) {
		return memberDAO.login(mvo);
	}

}
