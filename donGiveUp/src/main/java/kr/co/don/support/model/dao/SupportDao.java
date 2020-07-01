package kr.co.don.support.model.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.support.model.vo.Support;

@Repository("supportDao")
public class SupportDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<Support> supportList(HashMap<String,String> map) {
		
		return sqlSession.selectList("support.supportList", map);
	}
	
}
