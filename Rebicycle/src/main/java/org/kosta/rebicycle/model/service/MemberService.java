package org.kosta.rebicycle.model.service;

import org.kosta.rebicycle.model.vo.MemberVO;

public interface MemberService {

	MemberVO login(MemberVO mvo);

	void registerMember(MemberVO vo);

	int idcheck(String id);

}
