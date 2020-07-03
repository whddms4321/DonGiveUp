package kr.co.don.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public Member selectOneMember(Member m) {
		return sqlSession.selectOne("member.selectOneMember",m);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("member.insertMember",m);
	}

	public int insertMemberReferee(Member m) {
		return sqlSession.insert("member.insertMemberReferee",m);
	}


	public Member selectMemberReferee(Member m) {
		return sqlSession.selectOne("member.selectMemberReferee",m);
	}

	public int insertCompany(Member m) {
		return sqlSession.insert("member.insertCompany",m);
	}

	public ArrayList<Member> findIdMember(Member m) {
		List list = sqlSession.selectList("member.findIdMember",m);
		return (ArrayList<Member>)list;
	}

	public ArrayList<Member> findIdCompany(Member m) {
		List list = sqlSession.selectList("member.findIdCompany",m);
		return (ArrayList<Member>)list;
	}

	public Member findPwMember(Member m) {
		return sqlSession.selectOne("member.findPwMember",m);
	}

	public Member findPwCompany(Member m) {
		return sqlSession.selectOne("member.findPwCompany",m);
	}

}
