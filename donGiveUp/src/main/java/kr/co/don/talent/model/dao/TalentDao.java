package kr.co.don.talent.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.talent.model.vo.Talent;

@Repository("talentDao")
public class TalentDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertTalent(Talent t) {
		return sqlSession.insert("talent.insertTalent",t);
	}

	public int totalCount(HashMap<String, String> map) {
		return sqlSession.selectOne("talent.totalCount", map);
	}

	public List<Talent> talentList(HashMap<String, String> map) {
		return sqlSession.selectList("talent.talentList", map);
	}
}
