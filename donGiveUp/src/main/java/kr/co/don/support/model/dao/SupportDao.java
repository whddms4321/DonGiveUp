package kr.co.don.support.model.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.support.model.vo.Support;
import kr.co.don.support.model.vo.SupportApply;

@Repository("supportDao")
public class SupportDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<Support> supportList(HashMap<String,String> map) {
		
		return sqlSession.selectList("support.supportList", map);
	}

	public List<SupportApply> applyList(HashMap<String, String> map) {
		
		return sqlSession.selectList("supportApply.applyList", map);
	}

	public Support selectOne(int supportNo) {
		
		return sqlSession.selectOne("support.selectOne",supportNo);
	}
	
	public int applyInsert(SupportApply supportApply) {
		return sqlSession.insert("supportApply.insertApply", supportApply);
	}

	public int supportInsert(Support support) {
		
		return sqlSession.insert("support.insertSupport", support);
	}
}
