package kr.co.don.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.don.member.model.dao.MemberDao;
import kr.co.don.member.model.vo.Member;

@Service("memberService")
public class MemberService {

	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;
	
	
	public Member selectOneMemberEnc(Member m) {
		return dao.selectOneMember(m);
	}

	@Transactional
	public int insertMemberEnc(Member m) {
		Member member = dao.selectMemberReferee(m);
		System.out.println(member);
		System.out.println(m);
		if(member!=null) {
			System.out.println("추천인 있음");
			return dao.insertMemberReferee(m);
		}else {
			System.out.println("추천인 없음");
			return dao.insertMember(m);
		}
	}

	@Transactional
	public int insertCompanyEnc(Member m) {
		return dao.insertCompany(m);
	}


	public ArrayList<Member> findIdMemberEnc(Member m) {
		return dao.findIdMember(m);
	}


	public ArrayList<Member> findIdCompanyEnc(Member m) {
		return dao.findIdCompany(m);
	}


	public Member findPwMemberEnc(Member m) {
		return dao.findPwMember(m);
	}


	public Member findPwCompanyEnc(Member m) {
		return dao.findPwCompany(m);
	}
	
	@Transactional
	public int updateMemberPwEnc(Member m) {
		return dao.updateMemberPw(m);
	}

}
