package kr.co.don.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.don.member.model.service.MemberService;
import kr.co.don.member.model.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	@Qualifier("memberService")
	private MemberService service;
	
	@RequestMapping(value = "/loginFrm.don")
	public String loginFrm() {
		return "member/login";
	}
	
	@RequestMapping(value = "/login.don")
	public String loginMember(HttpSession session,Member m) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			session.setAttribute("member", member);
			System.out.println("success");
			return "redirect:/";
		}else {
			System.out.println("fail");
			return "redirect:/";
		}
	}
}
