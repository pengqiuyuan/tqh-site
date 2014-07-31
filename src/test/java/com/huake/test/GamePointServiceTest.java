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
import org.springframework.util.Assert;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import com.huake.entity.GamePoint;
import com.huake.service.live.GamePointService;

@TransactionConfiguration(defaultRollback=false)
@ContextConfiguration(locations = {"classpath*:/applicationContext.xml"})
public class GamePointServiceTest extends SpringTransactionalTestCase{
	
	private static final Map<String,String> map = new HashMap<String,String>();
	
	@Autowired
	private GamePointService gamePointService;
	/**
	 * 测试直播间直播信息
	 */
	@Test
	public void testGamePoint(){
		GamePoint gp = gamePointService.findByStatusOrderByUpDateDesc(GamePoint.STATUS_VALID);
		Assert.notNull(gp);
		System.out.println(gp.getName()+"     "+gp.getUrl()+"   "+gp.getDate());
	}

}
