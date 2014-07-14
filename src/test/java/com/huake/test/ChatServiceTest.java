package com.huake.test;

import java.util.HashMap;
import java.util.Map;

import javax.transaction.Transactional;

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
		PomeloClient client = new PomeloClient(url, port);
		client.init();
		System.out.println("000000  ");
	}

	
	/**
	 * 连接到群聊房间
	 */
	@Test
	public void linkToLive() {
		PomeloClient client = new PomeloClient(url, port);
		client.init();
		JSONObject msg = new JSONObject();
		try {
			msg.put("uid","2333");
			System.out.println("11111111111111111");
			client.request("gate.gateHandler.queryEntry", msg,
					new DataCallBack() {
						@Override
						public void responseData(JSONObject msg) {
							clientLive.disconnect();
							try {
								String ip = msg.getString("host");
								enter(ip, msg.getInt("port"));
							} catch (JSONException e) {
								e.printStackTrace();
							}
						}
					});
		} catch (JSONException e) {
			e.printStackTrace();
		}	
		}
	
	public void enter(String host, int port) {
		JSONObject msg = new JSONObject();
		try {
			msg.put("username","我是谁");
			msg.put("rid","zhibo");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		clientLive = new PomeloClient(host, port);
		clientLive.init();
		clientLive.request("connector.entryHandler.enter", msg, new DataCallBack() {
			@Override
			public void responseData(JSONObject msg) {
				if(msg.has("error")){
					return;
				}
			}
		});
	}
}
