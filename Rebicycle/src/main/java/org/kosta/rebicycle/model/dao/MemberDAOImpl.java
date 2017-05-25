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
}
