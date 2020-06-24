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

}
