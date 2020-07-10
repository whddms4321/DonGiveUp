package kr.co.don.userMypage.controller;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.don.adminMypage.model.vo.AdminPageDataGenericVO;
import kr.co.don.member.model.vo.Member;
import kr.co.don.userMypage.model.service.UserMypageService;
import kr.co.don.userMypage.model.vo.UserAttendListVO;
import kr.co.don.userMypage.model.vo.UserBankInVO;
import kr.co.don.userMypage.model.vo.UserBankVO;
import kr.co.don.userMypage.model.vo.UserMoneyUseListVO;
import net.sf.json.JSONArray;

@Controller
public class UserMypageController {
	
	@Autowired
	@Qualifier("userMypageService")
	private UserMypageService service;
	
	@RequestMapping(value="/userMypage.don")
	public String userMypage(String memberId, int reqPage, Model model) {
		AdminPageDataGenericVO<UserMoneyUseListVO> pageData = service.moneyUserList(memberId, reqPage);
		model.addAttribute("useList", pageData.getList());
		model.addAttribute("pageNavi", pageData.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		return "mypage/user/userMypageHome";
	}
	
	@ResponseBody
	@RequestMapping(value="/allUseMoney.don")
	public int allUseMoney(String memberId) {
		return service.allUseMoney(memberId);
	}
	
	@ResponseBody
	@RequestMapping(value="/nowMoney.don")
	public int nowMoney(String memberId) {
		return service.nowMoney(memberId);
	}
	
	@ResponseBody
	@RequestMapping(value="/pageMove.don", produces="application/json; charset=utf-8;")
	public String pageMove(int reqPage, String memberId) {
		AdminPageDataGenericVO<UserMoneyUseListVO> pageData = service.moneyUserList(memberId, reqPage);
		return new Gson().toJson(pageData);
	}
	
	@ResponseBody
	@RequestMapping(value="/dontoriPay.don", produces="application/json; charset=utf-8;")
	public String dontoriPay(String memberId, int amount) {
		System.out.println("결제~!~!~!~!");
		HashMap<String, String> map = service.dontoriPay(memberId, amount);
		return new Gson().toJson(map);
	}
	
	@RequestMapping(value="/userModify.don")
	public String userModifyFrm() {
		return "mypage/user/userModifyFrm";
	}
	
	@RequestMapping(value="/userInfoModify.don")
	public String userInfoModify(Member m, HttpSession session) {
		int result = service.userInfoModify(m);
		if(result>0) {
			session.setAttribute("member", m);
		}
		return "mypage/user/userModifyFrm";
	}
	
	@RequestMapping(value="/userAttendList.don")
	public String userAttendList() {
		return "mypage/user/attendList";
	}
	
	@ResponseBody
	@RequestMapping(value="/attenListCount.don", produces="application/json;")
	public String attenListCount(String memberId) {
		System.out.println(memberId);
		HashMap<String, Integer> map = service.attenListCount(memberId);
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/attendList.don", produces="application/json; charset=utf-8;")
	public String attendList(String type, String radio, int reqPage, String memberId) {
		AdminPageDataGenericVO<UserAttendListVO> pageData = service.attendList(type, radio, reqPage,memberId);
		return new Gson().toJson(pageData);
	}
	
	@ResponseBody
	@RequestMapping(value="/regularCancelRequest.don")
	public int regularCancelRequest(int boardNo) {
		return service.regularCancelRequest(boardNo);
	}
	
	@ResponseBody
	@RequestMapping(value="/selectNegativeContentUser.don", produces="text/html; charset=utf-8;") 
	public String selectNegativeContentUser(int boardNo, String type) {
		String content = service.selectNegativeContentUser(boardNo, type);
		return content;
	}
	
	@ResponseBody
	@RequestMapping(value="/selectCompanyReqContent.don", produces="text/html; charset=utf-8;")
	public String selectCompanyReqContent(int boardNo, String type) {
		String reqContent = service.selectCompanyReqContent(boardNo, type);
		return reqContent;
	}
	
	@RequestMapping(value="/userBank.don")
	public String userBank() {
		return "mypage/user/userBank";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectBankInfo.don", produces="application/json; charset=utf-8;")
	public UserBankVO selectBankInfo(String memberId) {
		return service.selectBankInfo(memberId);
	}
	
	@ResponseBody
	@RequestMapping(value="/selectBankInList.don", produces="application/json; charset=utf-8;")
	public String selectBankInList(String memberId, int reqPage, int type) {
		AdminPageDataGenericVO<UserBankInVO> pageData = service.selectBankInList(memberId, reqPage, type);
		return new Gson().toJson(pageData);
	}
	
	@ResponseBody
	@RequestMapping(value="/bankCancelReq.don")
	public int bankCancelReq(int bankNo) {
		return service.bankCancelReq(bankNo);
	}
	
	@ResponseBody
	@RequestMapping(value="/donationToCompany.don")
	public void donationToCompany(String memberId, String companyName, int price, int bankNo) {
		HashMap<String, String> map =service.donationToCompany(memberId,companyName,price,bankNo);
	}
}
