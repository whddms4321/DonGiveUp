package kr.co.don.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.don.funding.model.service.FundingService;

@Component
public class ScheduledTest {

	@Autowired
	@Qualifier("fundingService")
	private FundingService fundingService;
	
	
	@Scheduled(cron = "0 0 0 * * *")
	public void scheduleTest2() {
	//자정이 될시 funding 기간이 지난 목록들은 자동으로 조건문 탐 
	//1) 	
		System.out.println("테스트");
	}
	
	/*
	  
	  @Scheduled(fixedDelay = 5000) public void scheduleTest3() {
	  System.out.println("5초마다 동작"); }
	  
	 */
}
