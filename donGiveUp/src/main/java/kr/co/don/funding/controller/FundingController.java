package kr.co.don.funding.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.don.funding.model.service.FundingService;
import kr.co.don.funding.model.vo.Funding;
import kr.co.don.funding.model.vo.FundingData;

@Controller
public class FundingController {
	
	@Autowired
	@Qualifier("fundingService")
	private FundingService fundingService; 
	
	@RequestMapping(value="/test.don")
	public String test() {
		return "funding/tt";
	}
	
	@RequestMapping(value="/fundingMain")
	public String fundingMain(HttpSession session,Funding funding,int reqPage,Model model) {
		/*Member m = (Member) session.getAttribute("member");
		String memberId = m.getMemberId();
		*/
		/*
		 * HashMap<String,String> map = new HashMap<String,String>(); map.put("reqPage",
		 * String.valueOf(reqPage));
		 */
		
		FundingData fd = fundingService.selectList(reqPage);
		
		model.addAttribute(fd.getList());
		model.addAttribute(fd.getPageNavi());
		
		return "funding/fundingMain";
		
	}
	
}
