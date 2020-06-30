package kr.co.don.support.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.don.support.model.service.SupportService;
import kr.co.don.support.model.vo.Support;


@Controller
public class SupportController {
	
	@Autowired
	@Qualifier("supportService")
	private SupportService supportService;
	
	@RequestMapping(value = "/supportFrm.don")
	public String supportFrm() {
		System.out.println("테스트");
		return "support/supportMain";
	}
	
	@RequestMapping(value= "/supportApplyAd.don")
	public String supportApplyAd() {
		
		return "support/supportApplyAd";
	}
	
	@RequestMapping(value= "/supportApplyWrite.don")
	public String supportApplyWrite() {
		
		return "support/supportApplyWrite";
	}
	
	@RequestMapping(value="/supportList.don")
	public String supportList(int count,Support support,Model model,HttpSession session) {
//		String supportApplyId = session.getAttribute("member");
		
		String supportApplyId = "admin";
		String counts = String.valueOf(count);
		Support test = new Support();
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("supportApplyId", supportApplyId);
		map.put("counts", counts);
		
		ArrayList<Support> list = supportService.supportList(map);
		
		model.addAttribute("list",list);
		model.addAttribute("supportApplyId", supportApplyId);
		
		return "support/supportList";
		
	}
	
	@ResponseBody
	@RequestMapping(value= "/moreList.don",produces = "text/html; charset=utf-8")
	public String moreList(int count,Support support,Model model) {
		
		String supportApplyId = "admin";
		String counts = String.valueOf(count);
		System.out.println(counts);
		HashMap<String,String> map = new HashMap<String,String>();
		
		map.put("supportApplyId", supportApplyId);
		map.put("counts", counts);
		
		ArrayList<Support> list = supportService.supportList(map);
		System.out.println(list.size());
		model.addAttribute("list",list);
		model.addAttribute("supportApplyId", supportApplyId);
		 
		return "list";
		
	}
	
	
}
