package kr.co.don.donation.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import kr.co.don.donation.model.vo.DonationVo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
public class DonationController {
	@Autowired
	private DonationService service;
	
	
	@RequestMapping(value = "/donation.don")
	public String donation(int reqPage, String type,Model model) {
		
		DonationData data = service.DonationList(reqPage, type);
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
		model.addAttribute("totalCount", data.getTotalCount());
		
		return "donation/donation";

		
		
	}
	
	@RequestMapping(value = "/donationDetail.don")
	public String donationDetail(int donationNo,Model model) {
		
		DonationVo detail = service.DonationDetail(donationNo);
		model.addAttribute("detail", detail);
		
		
		return "donation/donationDetail";

		
		
	}
	
	@RequestMapping(value = "/donationInsertFrm.don")
	public String donationInsertFrm() {
		return "donation/donationInsert";
	}
	
	@RequestMapping(value = "/donationInsert.don")
	public String donationInsert(DonationVo donation) {
		
		int result = service.donationInsert(donation);
		
		if (result > 0) {
			return "donation/donation";
		} else {
			return "donation/donationInsert";
		}
	}
	
	
	
}