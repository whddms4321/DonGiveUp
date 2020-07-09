package kr.co.don.funding.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import jdk.nashorn.internal.ir.annotations.Reference;
import kr.co.don.funding.model.vo.Funding;

@Repository("fundingDao")
public class FundingDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<Funding> selectList(HashMap<String, String> map) {

		return sqlSession.selectList("funding.selectList", map);
	}

	public int selectone(HashMap<String, String> map) {
		return sqlSession.selectOne("funding.selectOne",map);
	

	}
}
