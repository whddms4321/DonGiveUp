package kr.co.don.adminMypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMypageController {
	
	@RequestMapping(value="/dashboard.do")
	public String dashboard() {
		return "/mypage/admin/dashboard";
	}
}
