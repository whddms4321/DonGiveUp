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
}
	
	


