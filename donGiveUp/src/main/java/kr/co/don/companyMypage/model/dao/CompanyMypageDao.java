package kr.co.don.companyMypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.companyMypage.model.vo.AttendUserVO;
import kr.co.don.companyMypage.model.vo.CompanyRegularUserVO;
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

	public int selectCompanyBoardListTotalCount(HashMap<String, String> map) {
		return session.selectOne("companyMypage.selectCompanyBoardListTotalCount", map);
	}

	public List<CompanyReqBoardVO> selectCompanyBoardList(HashMap<String, String> map) {
		return session.selectList("companyMypage.selectCompanyBoardList", map);
	}

	public int boardAttendUserListTotalCount(HashMap<String, String> map) {
		return session.selectOne("companyMypage.boardAttendUserListTotalCount", map);
	}

	public List<AttendUserVO> boardAttendUserList(HashMap<String, String> map) {
		return session.selectList("companyMypage.boardAttendUserList", map);
	}
	
	public int selectNowMoney(String memberId) {
		return session.selectOne("companyMypage.selectNowMoney", memberId);
	}
	
	public int selectMonthMoney(String memeberId) {
		return session.selectOne("companyMypage.selectMonthMoney", memeberId);
	}

	public int selectCompanyRegularBoardTotalCount(HashMap<String, String> map) {
		return session.selectOne("companyMypage.selectCompanyRegularBoardTotalCount", map);
	}

	public List<CompanyRegularUserVO> selectCompanyRegularBoard(HashMap<String, String> map) {
		return session.selectList("companyMypage.selectCompanyRegularBoard",map);
	}
}
