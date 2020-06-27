package kr.co.don.adminMypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.adminMypage.model.vo.AdminDeadLineSupportVO;
import kr.co.don.adminMypage.model.vo.AdminRequestBoardVO;
import kr.co.don.adminMypage.model.vo.AdminSupportApplyVO;


@Repository("adminMypageDao")
public class AdminMypageDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public int requestCompanyTotalCount() {		
		return session.selectOne("adminMypage.selectRequestCompanyTotalCount");
	}
	
	//글 신청목록 - 전체
	public int selectboardRequestListTotalCount(HashMap<String, String> map) {	
		return session.selectOne("adminMypage.selectboardRequestListTotalCount", map);
	}
	public List<AdminRequestBoardVO> selectboardRequestList(HashMap<String, String> map) {	
		return session.selectList("adminMypage.selectboardRequestList", map);
	}
	
	//글 신청목록 - 기부,펀딩,물품후원, 함께해요
	public int selectboardRequestListTotalCountEtc(HashMap<String, String> map) {
		return session.selectOne("adminMypage.selectboardRequestListTotalCountEtc", map);
	}
	public List<AdminRequestBoardVO> selectboardRequestListEtc(HashMap<String, String> map) {	
		return session.selectList("adminMypage.selectboardRequestListEtc", map);
	}

	public int agreeRequestBoard(HashMap<String, String> map) {
		return session.update("adminMypage.agreeRequestBoard", map);
	}

	public int negativeRequestBoard(HashMap<String, String> map) {
		return session.update("adminMypage.negativeRequestBoard", map);
	}

	public String selectNegativeContent(HashMap<String, String> map) {
		return session.selectOne("adminMypage.selectNegativeContent", map);
	}

	public int deadLineSupportListTotalCount() {		
		return session.selectOne("adminMypage.deadLineSupportListTotalCount");
	}

	public List<AdminDeadLineSupportVO> deadLineSupportList(HashMap<String, String> map) {
		return session.selectList("adminMypage.deadLineSupportList", map);
	}

	public int deleteSupport(int supportNo) {
		return session.delete("adminMypage.deleteSupport", supportNo);
	}

	public int selectSupportRequestCompanyTotalCount(int supportNo) {
		return session.selectOne("adminMypage.selectSupportRequestCompanyTotalCount", supportNo);
	}

	public List<AdminSupportApplyVO> selectSupportRequestCompany(HashMap<String, String> map) {
		return session.selectList("adminMypage.selectSupportRequestCompany", map);
	}



}
