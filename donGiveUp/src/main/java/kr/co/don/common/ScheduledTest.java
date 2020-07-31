package kr.co.don.common;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.don.funding.model.service.FundingService;
import kr.co.don.regular.model.service.RegularService;




@Component
public class ScheduledTest {
	
	@Autowired
	@Qualifier("regularService")
	private RegularService service;

	/*
	 * @Autowired
	 * 
	 * @Qualifier("FundingService") private FundingService fundingService;
	 */
	/*
	 * @Scheduled(cron = "0 0 0 * * *") public void scheduleEndFunding() { //자정이 될시
	 * funding 기간이 지난 목록들은 자동으로 조건문 탐 fundingService.scheduledList(); }
	 */
	//매일 새벽 2시마다 : 정기기부 결제, 결제 테이블 추가
	@Scheduled(cron = "0 0 02 * * ?")
	public void scheduleTest2() {
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "yy/MM/dd");
		
		Date time = new Date();
		
		String to = format2 .format(time);
		
		int result = service.MemberInUpdate(to);
		int result2 = service.RegularInUpdate(to);
		int result3 = service.BankInUpdate(to);
		int result4 = service.BankMemInUpdate(to);

		
	}

}	
		


