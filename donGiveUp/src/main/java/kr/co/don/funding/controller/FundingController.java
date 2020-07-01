package kr.co.don.funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FundingController {
	
	@RequestMapping(value="/test.don")
	public String test() {
		return "funding/tt";
	}
}
