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
	
	
	public Member selectOneMember(Member m) {
		return dao.selectOneMember(m);
	}

	@Transactional
	public int insertMember(Member m) {
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
	public int insertCompany(Member m) {
		return dao.insertCompany(m);
	}


	public ArrayList<Member> findIdMember(Member m) {
		return dao.findIdMember(m);
	}


	public ArrayList<Member> findIdCompany(Member m) {
		return dao.findIdCompany(m);
	}


	public Member findPwMember(Member m) {
		return dao.findPwMember(m);
	}


	public Member findPwCompany(Member m) {
		return dao.findPwCompany(m);
	}

}
