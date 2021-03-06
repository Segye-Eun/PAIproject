package com.pai.spring.message.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.pai.spring.message.model.service.MessageService;

@Component
public class MessageScheduler {
	

 
	@Autowired
	private MessageService service;
	
	//매일 자정 자동으로 실행 -> 메시지 삭제 로직
	//db 컬럼 추가 필요 -> 쪽지보관유무 y,n으로 보관중 아닌 쪽지(n)인 것만 삭제 -> 쪽지보관함으로 옮긴 쪽지는 y로 수정하는 식

	@Scheduled(cron="0 0 0 * * *") 
	public void autoMessageDelete() {
		//30일 뒤 자동 삭제
		service.oldMessageDelete();
		
		//보낸사람, 받은사람 모두 삭제한 경우 자동 삭제
		service.perDelete();
	}

 

}
