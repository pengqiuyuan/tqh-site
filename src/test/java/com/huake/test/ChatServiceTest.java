package com.huake.test;

import java.util.HashMap;
import java.util.Map;


import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import com.huake.chat.DataCallBack;
import com.huake.chat.PomeloClient;
import com.huake.service.chat.ChatService;
@TransactionConfiguration(defaultRollback=false)
@ContextConfiguration(locations = {"classpath*:/applicationContext.xml"})
public class ChatServiceTest extends SpringTransactionalTestCase{
	
	private static final Map<String,String> map = new HashMap<String,String>();

	@Value("#{envProps.chatUrl}")
	private String url;

	@Value("#{envProps.chatport}")
	private int port;
	
	@Autowired
	private ChatService chatService;
	
	PomeloClient clientLive;
	
	//@Test
	public void test(){
		System.out.println("55555555");
		PomeloClient client = new PomeloClient("http://192.168.1.182", 3014);
		client.init();
		System.out.println("000000  ");
	}

	@Test
	public void chatTest() throws JSONException{
		chatService.linkToLive();
	}
}
