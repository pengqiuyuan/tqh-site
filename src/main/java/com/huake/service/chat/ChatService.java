package com.huake.service.chat;

import javax.transaction.Transactional;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.huake.chat.DataCallBack;
import com.huake.chat.PomeloClient;
import com.huake.entity.Chat;
import com.huake.repository.ChatDao;

@Component
@Transactional
public class ChatService {
	
	@Value("#{envProps.chatUrl}")
	private String url;

	@Value("#{envProps.chatport}")
	private int port;
	
	@Autowired
	private ChatDao chatDao;
	
	public Chat findById(Long id){
		return chatDao.findOne(id);
	}
	
	public void linkToLive() throws JSONException {
		String currentHost = "192.168.1.182";
		String route = "gate.gateHandler.queryEntry";
		final PomeloClient client = new PomeloClient(currentHost, 3014);
		client.init();
		JSONObject jb = new JSONObject();
		    try {
		        jb.put("uid", "aa");
		    } catch (JSONException e) {
		        e.printStackTrace();
		    }
		    client.request(route, jb, new DataCallBack() {
		        @Override
		            public void responseData(JSONObject message) {
		            //client.disconnect();
		            try {
		                System.out.println(message);
		                if (message.getInt("code") == 200) {
		                    // 获取分配的IP和端口
		                	System.out.println("获取IP和端口成功");
		                    login(message.getString("host"), message.getInt("port"));
		                } else {
		                    System.out.println("获取IP和端口失败");
		                }
		            } catch (Exception e) {
		            }
		        }
		});	
	}
	
	public void login(String host , int port) throws JSONException{
		System.out.println("1111111111111111");
		final PomeloClient client = new PomeloClient(host, port);
		client.init();
		JSONObject jb = new JSONObject();
		jb.put("rid", "房间1");
		jb.put("username", "cheng2");
		client.request("connector.entryHandler.enter", jb, new DataCallBack() {

		        @Override
		        public void responseData(JSONObject message) {
		            System.out.println("收到返回消息:" + message);
		            try {
		                    if (!(message.has("code")&&message.getInt("code") == 500)) {
		                        Send(client);
		                    }
		                } catch (JSONException e) {
		                    e.printStackTrace();
		                }
		    }
		});
	}
	
	public void Send(PomeloClient client) {
		System.out.println("222222222222222");
        JSONObject jb = new JSONObject();
        try {
            jb.put("rid", "房间1");
            jb.put("content", "你好");
            jb.put("from", "cheng");
            jb.put("target", "*");//发给谁
        } catch (JSONException e) {
            e.printStackTrace();
        }
        client.request("chat.chatHandler.send", jb, new DataCallBack() {

            @Override
            public void responseData(JSONObject message) {
                System.out.println("收到返回消息:" + message);
            }
        });
	}
}
