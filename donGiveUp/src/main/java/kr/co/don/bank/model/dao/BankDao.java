package kr.co.don.bank.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.bank.model.vo.Bank;
import kr.co.don.bankIn.model.vo.BankInVo;
import kr.co.don.member.model.vo.Member;



@Repository("bankDao")
public class BankDao {
	
	@Autowired       
	private SqlSessionTemplate sqlSession;
	
	public int totalCount(HashMap<String, String> map) {
		return sqlSession.selectOne("bank.totalCount", map);
	}


	public List<Bank> BankList(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bank.bankList", map);
	}


	public List<Member> SelectOrg() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bank.selectOrg"); 
	}


	public int BankInsert(Bank bank) {
		// TODO Auto-generated method stub
		return sqlSession.insert("bank.bankInsert",bank);
	}


	public Bank BankDetail(int bankNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bank.bankDetail",bankNo);
	}


	public Member MemberSearch(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bank.memberSearch",memberId);
	}


	public int BankInInsert(BankInVo b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("bank.bankInInsert",b);
	}


	public int MemberMoneyUpdate(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("bank.memberMoneyUpdate",m);
	}


	public int BankMoneyUpdate(Bank b1) {
		// TODO Auto-generated method stub
		return sqlSession.update("bank.bankMoneyUpdate",b1);
	}


	
}
