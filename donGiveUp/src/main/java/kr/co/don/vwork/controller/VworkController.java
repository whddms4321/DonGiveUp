package kr.co.don.vwork.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.don.vwork.model.service.VworkServiceImpl;

@Controller

public class VworkController {
	@Autowired
	@Qualifier("vworkService")
	private VworkServiceImpl service;
	
	@RequestMapping(value="/vworklist.don")
	public String vworklist() {
		return "vwork/vworklist";
	}
	
}
