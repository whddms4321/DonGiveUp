package kr.co.don.adminMypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.annotations.JsonAdapter;

import kr.co.don.adminMypage.model.service.AdminMypageService;
import kr.co.don.adminMypage.model.vo.RequestBoardPageData;

@Controller
public class AdminMypageController {
	
	@Autowired
	@Qualifier("adminMypageService")
	private AdminMypageService service;
	
	//관리자 마이페이지 메인(DashBoard) 이동 
	@RequestMapping(value="/dashboard.don")
	public String dashboard() {
		
		return "/mypage/admin/dashboard";
	}
	
	//글 등록 신청목록 이동, 타입에 상관없이 모든 신청목록을 불러온다
	@RequestMapping(value="/boardRequestList.don")
	public String boardRequestList(int reqPage, String type, String title, String requestList, String sorting, Model m) {
		if(sorting.equals("정렬")) {
			sorting = "date";
		}
		RequestBoardPageData pageData = service.selectboardRequestList(reqPage, type, title, requestList, sorting);
		
		m.addAttribute("reqBoardList", pageData.getList());
		m.addAttribute("pageNavi", pageData.getPageNavi());
		
		return "/mypage/admin/boardRequestList";
	}
	
	// 글 등록 신청목록 이동, 타입에 상관없이 모든 신청목록을 불러온다
	@ResponseBody
	@RequestMapping(value = "/boardRequestListAjax.don", produces = "application/json;charset=utf-8;")
	public String boardRequestListAjax(int reqPage, String type, String title, String requestList, String sorting) {
		if (sorting.equals("정렬")) {
			sorting = "date";
		}
		
		RequestBoardPageData pageData = service.selectboardRequestList(reqPage, type, title, requestList, sorting);
		return new Gson().toJson(pageData);
	}
	
	//후원단체 등록 신청목록
	//@RequestMapping(value="/companyRequestList.don")
	//public String companyRequestList(int reqPage) {
	//	service.companyRequestList()
	//}
}
