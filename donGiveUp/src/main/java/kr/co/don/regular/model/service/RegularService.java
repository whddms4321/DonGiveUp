package kr.co.don.regular.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.don.donation.model.vo.Donation;
import kr.co.don.donation.model.vo.DonationData;
import kr.co.don.donationIn.model.vo.DonationInVo;
import kr.co.don.member.model.vo.Member;
import kr.co.don.regular.model.dao.RegularDao;
import kr.co.don.regular.model.vo.Regular;
import kr.co.don.regular.model.vo.RegularData;
import kr.co.don.regularIn.model.vo.RegularInVo;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

@Service("regularService")


public class RegularService {

	@Autowired
	@Qualifier("regularDao")
	private RegularDao regularDao;

	public ArrayList<Member> RegularList(int reqPage, String type) {
		List<Member> list = regularDao.RegularList(type);
		 
		 return (ArrayList<Member>)list; 
		 }

	public int regularInsert(Regular regular) {
		return regularDao.RegularInsert(regular);
	}

	public Regular RegularDetail(String regularWriter) {
		return  regularDao.RegularDetail(regularWriter);
	}

	public Member MemberDetail(String regularWriter) {
		return  regularDao.RegularMember(regularWriter);
	}

	public int RegularInInsert(RegularInVo r) {
		// TODO Auto-generated method stub
		return regularDao.RegularInInsert(r);
	}

	public int MemberMoneyUpdate(Member m) {
		// TODO Auto-generated method stub
		return regularDao.MemberMoneyUpdate(m);
	}

	public ArrayList<RegularInVo> RegularInPay() {
		List<RegularInVo> list = regularDao.RegularInPay();
		 
		 return (ArrayList<RegularInVo>)list; 
	}

	public ArrayList<Member> MemberPaySearch(String regularInId) {
		List<Member> list2 = regularDao.MemberPaySearch(regularInId);
		 
		 return (ArrayList<Member>)list2; 
	}

	public int MemberInUpdate(String to) {
		// TODO Auto-generated method stub
		return regularDao.MemberInUpdate(to);
	}

	public int RegularInUpdate(String to) {
		// TODO Auto-generated method stub
		return regularDao.RegularInUpdate(to);
	}

	public int BankInUpdate(String to) {
		// TODO Auto-generated method stub
		return regularDao.BankInUpdate(to);
	}

	public int BankMemInUpdate(String to) {
		// TODO Auto-generated method stub
		return regularDao.BankMemInUpdate(to);
	}

	public Member MemberMoney(String memberId) {
		// TODO Auto-generated method stub
		return regularDao.MemberMoney(memberId);
	}

	public Member MemberIdSearch(String companyName) {
		// TODO Auto-generated method stub
		return regularDao.MemberIdSearch(companyName);
	}

	public List<RegularInVo> RegularInCount(String regularWriter) {
		// TODO Auto-generated method stub
		return regularDao.RegularInCount(regularWriter);
	}

	




}
	
	


