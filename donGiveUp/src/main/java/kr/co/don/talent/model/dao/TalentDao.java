package kr.co.don.talent.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("talentDao")
public class TalentDao {
	@Autowired
	private SqlSession sqlSession;
}
