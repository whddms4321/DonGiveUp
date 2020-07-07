package kr.co.don.companyMypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.companyMypage.model.vo.CompanyReqBoardVO;

@Repository("companyMypageDao")
public class CompanyMypageDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public int selectCompanyReqListTotalCount(HashMap<String, String> map) {
		return session.selectOne("companyMypage.selectCompanyReqListTotalCount", map);
	}

	public List<CompanyReqBoardVO> selectCompanyReqList(HashMap<String, String> map) {
		return session.selectList("companyMypage.selectCompanyReqList", map);
	}

}
