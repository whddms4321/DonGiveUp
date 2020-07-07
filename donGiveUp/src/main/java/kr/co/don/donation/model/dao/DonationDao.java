package kr.co.don.donation.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.donation.model.vo.Donation;
import kr.co.don.donationIn.model.vo.DonationInVo;
import kr.co.don.member.model.vo.Member;


@Repository("donationDao")
public class DonationDao {
	
	@Autowired       
	private SqlSessionTemplate sqlSession;
	
	public int totalCount(HashMap<String, String> map) {
		return sqlSession.selectOne("donation.totalCount", map);
	}

	public List<Donation> donationList(HashMap<String, String> map) {
	
		return sqlSession.selectList("donation.donationList", map);
	}

	public Donation DonationDetail(int donationNo) {
		return sqlSession.selectOne("donation.donationDetail", donationNo);
	}

	public int DonationInsert(Donation donation) {
		return sqlSession.insert("donation.donationInsert", donation);
	}

	public Member DonationMember(String donationWriter) {
		return sqlSession.selectOne("donation.donationMember",donationWriter);
	}

	public List<DonationInVo> DonationInType(String type) {
		
		return sqlSession.selectList("donationIn.donationInType",type);
	}

	public List<DonationInVo> DonationInToday(String type) {
		return sqlSession.selectList("donationIn.donationInToday",type);
	}

	
}
