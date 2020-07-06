package kr.co.don.spreview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.don.spreview.model.service.SpreviewServiceImpl;

@Controller
public class SpreviewController {
	@Autowired
	@Qualifier("spreviewService")
	private SpreviewServiceImpl service;
	
	@RequestMapping(value="/spreview.don")
	public String spreview() {
		return "review/spreviewlist";
	}
}
