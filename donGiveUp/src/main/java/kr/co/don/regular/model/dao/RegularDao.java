package kr.co.don.regular.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.member.model.vo.Member;
import kr.co.don.regular.model.vo.Regular;
import kr.co.don.regularIn.model.vo.RegularInVo;



@Repository("regularDao")
public class RegularDao {
	
	@Autowired       
	private SqlSessionTemplate sqlSession;

	public List<Member> RegularList(String type) {
	
		 return sqlSession.selectList("regular.regularList",type); 
	 
	}

	public int RegularInsert(Regular regular) {
		 return sqlSession.selectOne("regular.regularInsert",regular); 
	}

	public Regular RegularDetail(String regularWriter) {
		return sqlSession.selectOne("regular.regularDetail",regularWriter); 
	}

	public Member RegularMember(String regularWriter) {
		return sqlSession.selectOne("regular.regularMember",regularWriter);
	}

	public int RegularInInsert(RegularInVo r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("regular.regularInInsert",r);
	}

	public int MemberMoneyUpdate(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("regular.memberMoneyUpdate",m);
	}

	public List<RegularInVo> RegularInPay() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("regular.regularInPay"); 
	}



	public List<Member> MemberPaySearch(String regularInId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("regular.memberPaySearch",regularInId);
	}

	public int MemberInUpdate(String to) {
		// TODO Auto-generated method stub
		return sqlSession.update("regular.memberInUpdate",to);
	}

	public int RegularInUpdate(String to) {
		// TODO Auto-generated method stub
		return sqlSession.update("regular.regularInUpdate",to);
	}

	public int BankInUpdate(String to) {
		// TODO Auto-generated method stub
		return sqlSession.update("regular.bankInUpdate",to);
	}

	public int BankMemInUpdate(String to) {
		// TODO Auto-generated method stub
		return sqlSession.update("regular.bankMemInUpdate",to);
	}
	
	
	
}
