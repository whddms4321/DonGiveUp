package kr.co.don.donation.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import kr.co.don.donationIn.model.vo.DonationInVo;
import kr.co.don.member.model.vo.Member;
import kr.co.don.donation.model.vo.Donation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
public class DonationController {
	@Autowired
	private DonationService service;
	
	
	@RequestMapping(value = "/donation.don")
	public String donation(int reqPage, String type,Model model) {
		
		DonationData data = service.DonationList(reqPage, type);
			
		
		SimpleDateFormat format2 = new SimpleDateFormat ("yyyy년 MM월 dd일");
				
		Date time = new Date();
				
	int typeTotalCount = 0;
	int typeMemberCount = 0;
	int typeTodayCount =0;
	
		String time2 = format2.format(time);
		ArrayList<DonationInVo> list = service.DonationInType(type);	
		ArrayList<DonationInVo> list2 = service.DonationInToday(type); 
		for(int i=0; i<list.size(); i++) { 
			typeTotalCount +=
				  list.get(i).getDonationInMoney(); 
			}
		for(int i=0; i<list2.size(); i++) {
			  typeTodayCount += list2.get(i).getDonationInMoney(); 
			  }
		typeMemberCount = list.size();
		
		
		
		
		for( Donation j : data.getList()) {
            int nowMoney = j.getDonationNowMoney();
          
            int goalMoney = j.getDonationGoalMoney();
           
            double result = (double)nowMoney/goalMoney*100;
         
            j.setDnrPercent((int)result);
         }
		

		
		model.addAttribute("typeTodayCount",typeTodayCount);
		model.addAttribute("typeMemberCount",typeMemberCount);
		model.addAttribute("typeTotalCount",typeTotalCount);
		model.addAttribute("time2",time2);
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
		model.addAttribute("totalCount", data.getTotalCount());
		
		return "donation/donation";

		
		
	}
	
	@RequestMapping(value = "/donationDetail.don")
	public String donationDetail(int donationNo,String donationWriter,Model model) {
		
		Donation detail = service.DonationDetail(donationNo);
		
		Member m = service.MemberDetail(donationWriter);
		
		
            int nowMoney = detail.getDonationNowMoney();
            System.out.println(nowMoney);
            int goalMoney = detail.getDonationGoalMoney();
            System.out.println(goalMoney);
            double result = (double)nowMoney/goalMoney*100;
            System.out.println(result);
            detail.setDnrPercent((int)result);


		model.addAttribute("company", m);
		model.addAttribute("detail", detail);
	
		return "donation/donationDetail";	
	}
	
	@RequestMapping(value = "/donationDetail2.don")
	public String donationDetailFrm(Donation donation, Model model) {

		
		model.addAttribute("d", donation);
	
	
		return "donation/donationDetail2";	
	}
	
	@RequestMapping(value = "/donationMoney.don")
	public String donationMoney(Donation donation,String companyName,int donationNowMoney,String memberId ,Model model) {
		
		Member m = service.MemberSerch(memberId);
		
		model.addAttribute("m",m);
		model.addAttribute("d", donation);
		model.addAttribute("donationNowMoney", donationNowMoney);
		model.addAttribute("companyName",companyName);
		return "donation/donationMoney";	
	}
	
	
	@RequestMapping(value = "/donationInsertFrm.don")
	public String donationInsertFrm() {
		return "donation/donationInsert";
	}
	@RequestMapping(value = "/donationInInsert.don")
	public String donationInInsert(Member m,DonationInVo d, int donationNowMoney , Donation d1, Model model) {
		
		int result = service.DonationInInsert(d);
		int result1 = service.MoneyUseList(d);
		
		Donation d2 = service.DonationSerch(d1);
		int memMon= m.getMemberMoney();
		int donInMon = d.getDonationInMoney();
		int resultMon = memMon-donInMon;
		
		int resultDon = donationNowMoney+(donInMon*100);
		d2.setDonationNowMoney(resultDon);	
		m.setMemberId(d.getDonationInMemberid());
		m.setMemberMoney(resultMon);
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월 dd일");
		
		Date time = new Date();
				

	
		String time2 = format2.format(time);
		if (result > 0) {
			int result2 = service.MemberMoneyUpdate(m);
			int result3 = service.DonationMoneyUpdate(d2);
			if(result2>0 && result3>0) {
				model.addAttribute("m",m);
				model.addAttribute("d",d);
				model.addAttribute("time",time2);
			return "donation/donationInSuccess";
		} else {
			return "donation/donationInFail";
			
		}
		
	}else {
		return "donation/donationInFail";
	}
		
	}
	
	@RequestMapping(value = "/donationInsert.don")
	public String donationInsert(HttpServletRequest request, MultipartFile file, Donation donation, Model model) {
		if (!file.isEmpty()) {

			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/images/");
			System.out.println(savePath);
			// 업로드한 파일의 실제 파일명
			String originalFilename = file.getOriginalFilename();
			System.out.println(originalFilename);

			String onlyFilename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
			// 확장자
			String extension = originalFilename.substring(originalFilename.lastIndexOf("."));

			String filepath = onlyFilename + "_" + System.currentTimeMillis() + extension;

			String fullpath = savePath + filepath;

			try {  
				donation.setDonationFilename(originalFilename);
				donation.setDonationFilepath(filepath);
				byte[] bytes = file.getBytes();
				
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
				bos.write(bytes);
				bos.close();

				System.out.println("파일업로드 완료");

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		donation.setDonationType("전체,"+donation.getDonationType());
		
		int result = service.donationInsert(donation);
		
		int reqPage=1;
		String type="전체";
		DonationData data = service.DonationList(reqPage, type);
			
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월 dd일");
				
		Date time = new Date();
				
	int typeTotalCount = 0;
	int typeMemberCount = 0;
	int typeTodayCount =0;
	
		String time2 = format2.format(time);
		ArrayList<DonationInVo> list = service.DonationInType(type);	
		ArrayList<DonationInVo> list2 = service.DonationInToday(type); 
		for(int i=0; i<list.size(); i++) { 
			typeTotalCount +=
				  list.get(i).getDonationInMoney(); 
			}
		for(int i=0; i<list2.size(); i++) {
			  typeTodayCount += list2.get(i).getDonationInMoney(); 
			  }
		typeMemberCount = list.size();
		
		
		
		
		for( Donation j : data.getList()) {
            int nowMoney = j.getDonationNowMoney();
            System.out.println(nowMoney);
            int goalMoney = j.getDonationGoalMoney();
            System.out.println(goalMoney);
            double result5 = (double)nowMoney/goalMoney*100;
            System.out.println(result);
            j.setDnrPercent((int)result5);
         }
		

		
		model.addAttribute("typeTodayCount",typeTodayCount);
		model.addAttribute("typeMemberCount",typeMemberCount);
		model.addAttribute("typeTotalCount",typeTotalCount);
		model.addAttribute("time2",time2);
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
		model.addAttribute("totalCount", data.getTotalCount());
		
		

		if (result > 0) {
			return "donation/donation";
		} else {
			return "donation/donationInsert";
		}
	}
	
}