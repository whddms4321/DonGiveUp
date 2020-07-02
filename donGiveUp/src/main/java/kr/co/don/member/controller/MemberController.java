package kr.co.don.member.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	@CrossOrigin(origins = "*")
	@ResponseBody
	@RequestMapping(value = "/checkId.don")
	public String checkId(Member m) {
		Member member = service.selectOneMember(m);
		if(member == null) {
			return "0";
		}else {
			return "1";
		}
		
	      
	}
	
	@RequestMapping(value = "/insertMember.don")
	public String insertMember(Member m) {
		System.out.println(m);
		int result = service.insertMember(m);
		if(result!=0) {
			return "member/joinStep3";
		}else {
			return "redirect:/";
		}
		
	}
	
	//MultipartFile companyFilename,MultipartFile chartFilename
	@RequestMapping(value = "/insertCompany.don")
	public String insertCompany(HttpServletRequest request,MultipartFile companyFile, MultipartFile chartFile,Member m) {
		if(!companyFile.isEmpty()) {
			try {
				String savePath = request.getSession().getServletContext().getRealPath("/resources/song/company/");
				// 업로드한 파일의 실제 파일명
				String originalFilename = companyFile.getOriginalFilename();
				m.setCompanyFilename(originalFilename);
				// 확장자를 제외한 파일명 -> test
				String onlyFilename = originalFilename.substring(0,originalFilename.lastIndexOf("."));
				// 확장자 -> .txt
				String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
				String filepath = onlyFilename+"_"+getCurrentTime()+extension;
				m.setCompanyFilepath(filepath);
				String fullpath = savePath+filepath;
				byte[] bytes = companyFile.getBytes();
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
				bos.write(bytes);
				bos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if(!chartFile.isEmpty()) {
			try {
				String savePath = request.getSession().getServletContext().getRealPath("/resources/song/company/");
				// 업로드한 파일의 실제 파일명
				String originalFilename = chartFile.getOriginalFilename();
				m.setChartFilename(originalFilename);
				// 확장자를 제외한 파일명 -> test
				String onlyFilename = originalFilename.substring(0,originalFilename.lastIndexOf("."));
				// 확장자 -> .txt
				String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
				String filepath = onlyFilename+"_"+getCurrentTime()+extension;
				m.setChartFilepath(filepath);
				String fullpath = savePath+filepath;
				byte[] bytes = chartFile.getBytes();
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
				bos.write(bytes);
				bos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		int result = service.insertCompany(m);
		if(result!=0) {
			return "member/joinStep3";
		}else {
			return "redirect:/";
		}
		
	}
	
	public long getCurrentTime() {
		Calendar today = Calendar.getInstance();
		return today.getTimeInMillis();
	}
}
