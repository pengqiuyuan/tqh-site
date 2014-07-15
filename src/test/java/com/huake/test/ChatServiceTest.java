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

@TransactionConfiguration(defaultRollback=false)
@ContextConfiguration(locations = {"classpath*:/applicationContext.xml"})
public class ChatServiceTest extends SpringTransactionalTestCase{
	
	private static final Map<String,String> map = new HashMap<String,String>();

	@Value("#{envProps.chatUrl}")
	private String url;

	@Value("#{envProps.chatport}")
	private int port;
	
	
	//@Test
	public void test(){
		System.out.println("55555555");

		System.out.println("000000  ");
	}

}
