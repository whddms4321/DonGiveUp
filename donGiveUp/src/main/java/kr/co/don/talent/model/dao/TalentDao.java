package kr.co.don.talent.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.talent.model.vo.Talent;
import kr.co.don.talent.model.vo.TalentBoard;
import kr.co.don.talent.model.vo.TalentJoin;
import kr.co.don.talent.model.vo.TalentList;

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

	public Talent talentDetail(int talentNo) {
		return sqlSession.selectOne("talent.talentDetail",talentNo);
	}

	public int insertTalentList(TalentList t) {
		// TODO Auto-generated method stub
		return sqlSession.insert("talentList.insertTalentList",t);
	}

	public TalentList selectTalentList(TalentList t) {
		return sqlSession.selectOne("talentList.selectTalentList",t);
	}

	public int updateTalent(Talent t) {
		return sqlSession.update("talent.updateTalent",t);
	}

	public Talent selectTalentOne(int talentNo) {
		return sqlSession.selectOne("talent.selectTalentOne",talentNo);
	}

	public int deleteTalent(int talentNo) {
		return sqlSession.delete("talent.deleteTalent",talentNo);
	}

	public ArrayList<TalentJoin> talentListMyList(String memberId) {
		List list = sqlSession.selectList("talentJoin.talentListMyList",memberId); 
		return (ArrayList<TalentJoin>)list;
	}

	public ArrayList<TalentBoard> selectTalentBoard(int start, int end,int talentNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("talentNo",talentNo);
		List list = sqlSession.selectList("talentBoard.selectTalentBoard",map); 
		return (ArrayList<TalentBoard>)list;
	}

	public int totalCount(int talentNo) {
		return sqlSession.selectOne("talentBoard.totalCount",talentNo);
	}

	public int deleteTalentList(TalentList list) {
		return sqlSession.delete("talentList.deleteTalentList",list);
	}
	
	public ArrayList<Talent> selectTalentList(String memberId) {
		List list = sqlSession.selectList("talent.talentListOpen",memberId); 
		return (ArrayList<Talent>)list; 
	}
}
