package kr.co.don.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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

}
