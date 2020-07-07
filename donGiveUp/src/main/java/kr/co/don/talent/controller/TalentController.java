package kr.co.don.talent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.don.talent.model.service.TalentService;
import kr.co.don.talent.model.vo.Talent;
import kr.co.don.talent.model.vo.TalentData;

@Controller
@RequestMapping("/talent")
public class TalentController {
	@Autowired
	@Qualifier("talentService")
	private TalentService service;
	
	@RequestMapping(value = "/talentFrm.don")
	public String talentFrm(int reqPage, String type,Model model) {
		TalentData data = service.talentList(reqPage, type);
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
		model.addAttribute("totalCount", data.getTotalCount());
		return "talent/talentFrm";
	}
	
	@RequestMapping(value = "/insertTalentFrm.don")
	public String insertTalentFrm() {
		return "talent/insertTalentFrm";
	}
	
	@RequestMapping(value = "/insertTalent.don")
	public String insertTalent(Talent t,MultipartFile file,Model model) {
		int result = service.insertTalent(t);
		if(result!=0) {
			model.addAttribute("msg","게시글 등록 성공");
			model.addAttribute("loc","/talent/talentFrm.don");
			return "main/msg";
		}else {
			model.addAttribute("msg","게시글 등록 실패");
			model.addAttribute("loc","/talent/talentFrm.don");
			return "main/msg";
		}
	}
}