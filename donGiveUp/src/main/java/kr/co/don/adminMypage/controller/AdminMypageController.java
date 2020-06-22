package kr.co.don.adminMypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMypageController {
	
	//관리자 마이페이지 메인(DashBoard) 이동
	@RequestMapping(value="/dashboard.do")
	public String dashboard() {
		return "/mypage/admin/dashboard";
	}
	
	//글 등록 신청목록 이동
	@RequestMapping(value="/boardRequestList.do")
	public String boardRequestList() {
		return "/mypage/admin/boardRequestList";
	}
}
