package kr.co.don.adminMypage.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.don.adminMypage.model.vo.RequestBoardVO;


@Repository("adminMypageDao")
public class AdminMypageDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public int requestCompanyTotalCount() {		
		return session.selectOne("mypage.selectRequestCompanyTotalCount");
	}
	
	//글 신청목록 - 전체
	public int selectboardRequestListTotalCount(HashMap<String, String> map) {	
		return session.selectOne("mypage.selectboardRequestListTotalCount", map);
	}
	public List<RequestBoardVO> selectboardRequestList(HashMap<String, String> map) {	
		return session.selectList("mypage.selectboardRequestList", map);
	}
	
	//글 신청목록 - 기부,펀딩,물품후원, 함께해요
	public int selectboardRequestListTotalCountEtc(HashMap<String, String> map) {
		return session.selectOne("mypage.selectboardRequestListTotalCountEtc", map);
	}
	public List<RequestBoardVO> selectboardRequestListEtc(HashMap<String, String> map) {	
		return session.selectList("mypage.selectboardRequestListEtc", map);
	}

	public int agreeRequestBoard(HashMap<String, String> map) {
		return session.update("mypage.agreeRequestBoard", map);
	}

	public int negativeRequestBoard(HashMap<String, String> map) {
		return session.update("mypage.negativeRequestBoard", map);
	}



}
