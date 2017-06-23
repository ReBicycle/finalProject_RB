package org.kosta.rebicycle.model.dao;

import javax.annotation.Resource;

import org.kosta.rebicycle.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public MemberVO login(MemberVO mvo) {
		return template.selectOne("member.login", mvo);
	}

	@Override
	public void registerMember(MemberVO vo) {
		template.insert("member.registerMember", vo);
	}

	@Override
	public int idcheck(String id) {
		return template.selectOne("member.idcheck",id);
	}

	public MemberVO findMemberById(String id) {
		return template.selectOne("member.findMemberById", id);
	}

	@Override
	public void memberModify(MemberVO vo) {
		template.update("member.memberModify", vo);
		
	}
}
