package kr.co.don.adminMypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.adminMypage.model.vo.AdminDeadLineSupportVO;
import kr.co.don.adminMypage.model.vo.AdminMemberVO;
import kr.co.don.adminMypage.model.vo.AdminRegularInVO;
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

	public int supportReUpload(int supportNo) {
		return session.update("adminMypage.supportReUpload", supportNo); 
	}

	//프로시저 호출
	public HashMap<String,String> supportAssignToCompany(HashMap<String,String> map) {
		return session.selectOne("adminMypage.supportAssignToCompany", map);
	}

	public int companyEnrollReqTotalCount() {
		return session.selectOne("adminMypage.companyEnrollReqTotalCount");
	}

	public List<AdminMemberVO> companyEnrollReq(HashMap<String, String> map) {
		return session.selectList("adminMypage.companyEnrollReq",map);
	}

	public int enrollCompany(HashMap<String,String> map) {
		return session.update("adminMypage.enrollCompany", map);
	}

	public String selectApplyId(String applyId) {
		return session.selectOne("adminMypage.selectApplyId", applyId);
	}

	public int memberManagementListTotalCount(String type) {
		return session.selectOne("adminMypage.memberManagementListTotalCount", type);
	}

	public List<AdminMemberVO> memberManagementList(HashMap<String, String> map) {
		return session.selectList("adminMypage.memberManagementList", map);
	}

	public int memberStopAndRestore(HashMap<String,String> map) {
		return session.update("adminMypage.memberStopAndRestore", map);
	}

	public int regularCancelReqTotalCount(HashMap<String, String> map) {
		return session.selectOne("adminMypage.regularCancelReqTotalCount",map);
	}

	public List<AdminRegularInVO> regularCancelReq(HashMap<String, String> map) {
		return session.selectList("adminMypage.regularCancelReq", map);
	}



}
