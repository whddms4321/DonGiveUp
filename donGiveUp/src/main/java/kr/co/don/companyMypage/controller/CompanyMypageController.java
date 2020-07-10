package kr.co.don.companyMypage.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.don.adminMypage.model.vo.AdminPageDataGenericVO;
import kr.co.don.companyMypage.model.service.CompanyMypageService;
import kr.co.don.companyMypage.model.vo.CompanyReqBoardVO;

@Controller
public class CompanyMypageController {

	@Autowired
	@Qualifier("companyMypageService")
	private CompanyMypageService service;
	
	
	@RequestMapping(value="/companyMypage.don")
	public String companyMypage(){
		return "mypage/company/companyReqList";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectCompanyReqList.don", produces="application/json; charset=utf-8;")
	public String selectCompanyReqList(String memberId, int reqPage, String type) {
		return new Gson().toJson(service.selectCompanyReqList(memberId, reqPage,type));
	}
	
	@RequestMapping(value="/companyBoardList.don")
	public String companyBoardList() {
		return "mypage/company/companyBoardList";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectCompanyBoardList.don", produces="application/json; charset=utf-8;")
	public String selectCompanyBoardList(String type, int reqPage, String memberId) {
		return new Gson().toJson(service.selectCompanyBoardList(type, reqPage, memberId));
		
	}
	
	@ResponseBody
	@RequestMapping(value="/boardAttendUserList.don", produces="application/json; charset=utf-8;")
	public String boardAttendUserList(String type, int boardNo, int reqPage) {
		return new Gson().toJson(service.boardAttendUserList(type, boardNo, reqPage));
	}
	
	@RequestMapping(value="/companyRegularList.don")
	public String companyRegularList() {
		return "mypage/company/companyRegularList";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectNowAndMonthMoney.don", produces="application/json; charset=utf-8;")
	public String selectNowAndMonthMoney(String memberId) {
		HashMap<String, Integer> map = service.selectNowAndMonthMoney(memberId);
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/selectCompanyRegularBoard.don", produces="application/json; charset=utf-8;")
	public String selectCompanyRegularBoard(int reqPage, String memberId, String type) {
		return new Gson().toJson(service.selectCompanyRegularBoard(reqPage, memberId, type));
	}
}
