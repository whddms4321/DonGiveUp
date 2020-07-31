package kr.co.don.fdreview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.don.fdreview.model.service.FdreviewServiceImpl;

@Controller
public class FdreviewController {
	@Autowired
	@Qualifier("fdreviewService")
	private FdreviewServiceImpl service;
	
	@RequestMapping(value="/fdreviewlist.don")
	public String fdreview(int count) {
		return "review/fdreviewlist";
	}
	
	@RequestMapping(value="/fdrwrite.don")
	public String fdrwrite() {
		return "review/fdrwrite";
	}
	
	@RequestMapping(value="/fdrview.don")
	public String fdrveiw() {
		return "review/fdrviewpage";
	}

}
