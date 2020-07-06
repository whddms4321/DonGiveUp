package kr.co.don.talent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.don.talent.model.service.TalentService;

@Controller
@RequestMapping("/talent")
public class TalentController {
	@Autowired
	@Qualifier("talentService")
	private TalentService service;
	
	@RequestMapping(value = "talentFrm.don")
	public String talentFrm() {
		return "talent/talentFrm";
	}
	
	@RequestMapping(value = "insertTalentFrm.don")
	public String insertTalentFrm() {
		return "talent/insertTalentFrm";
	}
}
