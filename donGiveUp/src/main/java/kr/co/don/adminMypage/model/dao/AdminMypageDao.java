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
	
	public int selectboardRequestListTotalCount(HashMap<String, String> map) {	
		return session.selectOne("mypage.selectboardRequestListTotalCount", map);
	}

	public int requestCompanyTotalCount() {		
		return session.selectOne("mypage.selectRequestCompanyTotalCount");
	}

	public List<RequestBoardVO> selectboardRequestList(HashMap<String, String> map) {	
		return session.selectList("mypage.selectboardRequestList", map);
	}


}
