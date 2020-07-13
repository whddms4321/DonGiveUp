package kr.co.don.regular.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javafx.scene.control.Alert;
import kr.co.don.donation.model.service.DonationService;
import kr.co.don.donation.model.vo.DonationData;
import kr.co.don.donationIn.model.vo.DonationInVo;
import kr.co.don.member.model.vo.Member;
import kr.co.don.regular.model.service.RegularService;
import kr.co.don.regular.model.vo.Regular;
import kr.co.don.regular.model.vo.RegularData;
import kr.co.don.regularIn.model.vo.RegularInVo;
import kr.co.don.donation.model.vo.Donation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
public class RegularController {
	@Autowired
	private RegularService service;
	
	@RequestMapping(value = "/regular.don")
	public String regular(int reqPage, String type, Model model) {
		ArrayList<Member> list = service.RegularList(reqPage, type);
		int count = list.size();
		model.addAttribute("count", count);
		model.addAttribute("regular", list);
		return "regular/regular";

	}
	
	@RequestMapping(value = "/regularInsertFrm.don")
	public String regularInsertFrm() {
		return "regular/regularInsert";
	}
	
	@RequestMapping(value = "/regularDetail2.don")
	public String regularDetailFrm(Regular regular, Model model) {

		
		model.addAttribute("r", regular);
	
	
		return "regular/regularDetail2";	
	}
	
	
	@RequestMapping(value = "/regularInsert.don")
	public String regularInsert(Regular regular,Model model) {
		
		regular.setRegularType("전체,"+regular.getRegularType());
		
		int result = service.regularInsert(regular);
		
		int reqPage =1;
		String type="전체";
		ArrayList<Member> list = service.RegularList(reqPage, type);
		int count = list.size();
		model.addAttribute("count", count);
		model.addAttribute("regular", list);
		
		
		if (result > 0) {
			return "regular/regular";
		} else {
			return "regular/regularInsert";
		}
	}
	@RequestMapping(value = "/regularDetail.don")
	public String regularDetail(String regularWriter,Model model) {
		
		Regular detail = service.RegularDetail(regularWriter);
		
		 System.out.println(regularWriter);
		Member m = service.MemberDetail(regularWriter);
		 System.out.println(m);
		model.addAttribute("company", m);
		model.addAttribute("detail", detail);
	
		return "regular/regularDetail";	
	}
	
	@RequestMapping(value = "/regularMoney.don")
	public String regularMoney(Regular regular,String companyName, Model model) {

		
		model.addAttribute("r", regular);
		model.addAttribute("companyName", companyName);
	
		return "regular/regularMoney";	
	}
	
	@RequestMapping(value = "/regularInInsert.don")
	public String regularInInsert(Member m, RegularInVo r) {

		
	      SimpleDateFormat format2 = new SimpleDateFormat ( "yy/MM/");
	            
	      Date time = new Date();
	            
	     
	      String time2 = format2.format(time);
	            
	      
	      System.out.println(time2);
	      r.setRegularInPayNum(time2+r.getRegularInPayNum());
	      System.out.println(r.getRegularInPayNum());
	      System.out.println("RegularId : "+r.getRegularId());
	      System.out.println("RegularId : "+r.getRegularInId());
		int result = service.RegularInInsert(r);
		
		
		
		int memMon= m.getMemberMoney();
		int regInMon = r.getRegularInMoney();
		int resultMon = memMon-regInMon;
		
		m.setMemberId(r.getRegularInId());
		m.setMemberMoney(resultMon);
		
		
		if (result > 0) {
			int result2 = service.MemberMoneyUpdate(m);
			if(result2>0) {
			return "regular/regularInSuccess";
		} else {
			return "regular/regularInFail";
			
		}
		
	}else {
		return "regular/regularInFail";
	}
		
	}
	
}