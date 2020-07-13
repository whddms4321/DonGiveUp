package kr.co.don.common;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import kr.co.don.member.model.vo.Member;
import kr.co.don.regular.model.service.RegularService;
import kr.co.don.regularIn.model.vo.RegularInVo;
import kr.co.don.funding.model.service.FundingService;


@Component
public class ScheduledTest {
	@Autowired
	@Qualifier("regularService")
	private RegularService service;
	
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
		

