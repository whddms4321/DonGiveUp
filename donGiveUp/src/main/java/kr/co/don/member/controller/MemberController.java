package kr.co.don.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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
			return "redirect:/";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/logout.don")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/joinFrm.don")
	public String joinFrm() {
		return "member/joinStep1";
	}
	
	@RequestMapping(value = "/joinStep2.don")
	public String joinStep2() {
		return "member/joinStep2";
	}
	
	@RequestMapping(value = "/checkId.don")
	public void checkId(Member m, HttpServletResponse response) {
		Member member = service.selectOneMember(m);
		PrintWriter out;
		try {
			out = response.getWriter();
			if(member!=null) {
		         //아이디 사용가능 할때
		         out.print(1);
		      }else {
		         //불가능 할때
		         out.print(0);
		      }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	      
	}
}
