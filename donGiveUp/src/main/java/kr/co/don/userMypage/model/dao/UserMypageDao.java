package kr.co.don.userMypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.don.member.model.vo.Member;
import kr.co.don.userMypage.model.vo.UserAttendListVO;
<<<<<<< HEAD
import kr.co.don.userMypage.model.vo.UserBankInVO;
import kr.co.don.userMypage.model.vo.UserBankVO;
=======
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
import kr.co.don.userMypage.model.vo.UserMoneyUseListVO;

@Repository("userMypageDao")
public class UserMypageDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public int moneyUserListTotalCount(String memberId) {
		return session.selectOne("userMypage.moneyUserListTotalCount", memberId);
	}

	public List<UserMoneyUseListVO> moneyUserList(HashMap<String, String> map) {
		return session.selectList("userMypage.moneyUserList", map);
	}

	public int allUseMoney(String memberId) {
		return session.selectOne("userMypage.allUseMoney", memberId);
	}

	public int nowMoney(String memberId) {
		return session.selectOne("userMypage.nowMoney", memberId);
	}

	public HashMap<String, String> dontoriPay(HashMap<String, String> map) {
		return session.selectOne("userMypage.dontoriPay", map);
	}

	public int userInfoModify(Member m) {
		return session.update("userMypage.userInfoModify", m);
	}

	public int donationCount(String memberId) {
		return session.selectOne("userMypage.donationCount", memberId);
	}
	public int fundingCount(String memberId) {
		return session.selectOne("userMypage.fundingCount", memberId);
	}
	public int regularCount(String memberId) {
		return session.selectOne("userMypage.regularCount", memberId);
	}
	public int vworkCount(String memberId) {
		return session.selectOne("userMypage.vworkCount", memberId);
	}
	public int supportCount(String memberId) {
		return session.selectOne("userMypage.supportCount", memberId);
	}

	public int attendListTotalCount(HashMap<String, String> map) {
		return session.selectOne("userMypage.attendListTotalCount", map);
	}

	public List<UserAttendListVO> attendList(HashMap<String, String> map) {
		return session.selectList("userMypage.attendList", map);
	}

	public int regularCancelRequest(int boardNo) {
		return session.update("userMypage.regularCancelRequest", boardNo);
	}

	public String selectNegativeContentUser(HashMap<String, String> map) {
		return session.selectOne("userMypage.selectNegativeContentUser", map);
	}

	public String selectCompanyReqContent(HashMap<String, String> map) {
		return session.selectOne("userMypage.selectCompanyReqContent", map);
	}

<<<<<<< HEAD
	public UserBankVO selectBankInfo(String memberId) {
		return session.selectOne("userMypage.selectBankInfo", memberId);
	}

	public int selectBankInListTotalCount(HashMap<String, String> map) {
		return session.selectOne("userMypage.selectBankInListTotalCount", map);
	}

	public List<UserBankInVO> selectBankInList(HashMap<String, String> map) {
		return session.selectList("userMypage.selectBankInList", map);
	}

	public int bankCancelReq(int bankNo) {
		return session.update("userMypage.bankCancelReq", bankNo);
	}

	public HashMap<String, String> donationToCompany(HashMap<String, String> map) {
		return session.selectOne("userMypage.donationToCompany",map);
	}

=======
>>>>>>> parent of 87b6781... Revert "Merge branch 'ssong-branch' of https://github.com/whddms4321/DonGiveUp into ssong-branch"
}
