package kr.co.don.donation.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.donation.model.vo.DonationVo;

@Repository("donationDao")
public class DonationDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int totalCount(HashMap<String, String> map) {
		
		return sqlSession.selectOne("donation.totalCount", map);
	}

	public List<DonationVo> donationList(HashMap<String, String> map) {

		return sqlSession.selectList("donation.donationList", map);
	}

	public DonationVo DonationDetail(int donationNo) {
		return sqlSession.selectOne("donation.donationDetail", donationNo);
	}

	public int donationInsert(DonationVo donation) {
		return sqlSession.insert("donation.donationInsert", donation);
	}
}
