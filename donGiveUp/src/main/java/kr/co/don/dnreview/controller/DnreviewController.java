package kr.co.don.dnreview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.don.dnreview.model.service.DnreviewServiceImpl;

@Controller
public class DnreviewController {
	@Autowired
	@Qualifier("dnreviewService")
	private DnreviewServiceImpl service;
	
	@RequestMapping(value="/reviewmain.don")
	public String reviewmain() {
		return "review/reviewmain";
	}

	
	@RequestMapping(value="/dnreview.don")
	public String dnreview() {
		return "review/dnreviewlist";
	}
	
	@RequestMapping(value="/dnrview.don")
	public String dnrview() {
		return "review/dnrviewpage";
	}

}
