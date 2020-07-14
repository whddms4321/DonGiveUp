package kr.co.don.funding.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import jdk.nashorn.internal.ir.annotations.Reference;
import kr.co.don.funding.model.vo.Funding;
import kr.co.don.funding.model.vo.FundingIn;
import kr.co.don.funding.model.vo.RewardList;

@Repository("fundingDao")
public class FundingDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<Funding> selectList(HashMap<String, String> map) {

		return sqlSession.selectList("funding.selectList", map);
	}

	public int totalCount(HashMap<String, String> map) {
		
		return sqlSession.selectOne("funding.totalCount",map);
	
	}
	public Funding fundingView(int fundingNo) {
		
		return sqlSession.selectOne("funding.fundingView",fundingNo);
	

	}
	public List<FundingIn> fundingInList(int fundingNo) {
		
		return sqlSession.selectList("funding.fundingInList",fundingNo);
	}
	public List<Funding> scheduledList(){
		
		return sqlSession.selectList("funding.scheduledList");
	}

	public int updateType(int fundingNo) {
		
		return sqlSession.update("funding.updateType",fundingNo);
	}

	public List<FundingIn> refundList(int fundingNo) {
		
		return sqlSession.selectList("funding.refundList",fundingNo);
	}

	public int refund(FundingIn m) {
		
		return sqlSession.update("funding.refund", m);
	}

	public int insertFunding(Funding funding) {
		
		return sqlSession.insert("funding.insert", funding);
	}

	public int insertReward(RewardList rd) {
		
		return sqlSession.insert("funding.insertRd", rd);
	}

	public int research() {
		
		return sqlSession.selectOne("funding.research");
	}
}
