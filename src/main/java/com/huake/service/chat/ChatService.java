package com.huake.service.chat;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huake.entity.Chat;
import com.huake.repository.ChatDao;

@Component
@Transactional
public class ChatService {
	
	@Autowired
	private ChatDao chatDao;
	
	public Chat findById(Long id){
		return chatDao.findOne(id);
	}
}
