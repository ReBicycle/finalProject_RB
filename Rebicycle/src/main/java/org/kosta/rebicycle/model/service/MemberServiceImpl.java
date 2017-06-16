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

	@Override
	public void registerMember(MemberVO vo) {
		
		memberDAO.registerMember(vo);
		
	}

	@Override
	public int idcheck(String id){
		return memberDAO.idcheck(id);
	}

	@Override
	public MemberVO findMemberById(String id) {
		return memberDAO.findMemberById(id);
	}

	@Override
	public void memberModify(MemberVO vo) {
		memberDAO.memberModify(vo);
		
	}

}
