package com.huake.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import com.huake.entity.PlayAgainst;
import com.huake.util.RemoteParser;
@TransactionConfiguration(defaultRollback=false)
@ContextConfiguration(locations = {"classpath*:/applicationContext.xml"})
public class ParserTest extends SpringTransactionalTestCase{
	
	private static final Map<String,String> map = new HashMap<String,String>();
	
	@Autowired
	private RemoteParser remoteParser;
	/**
	 * 测试爬取比分
	 * @throws Exception
	 */
	@Test
	public void parserTest() throws Exception{
		Map<String,String> tagMap=new HashMap<String,String>();
		Map<String,String> removeMap=new HashMap<String,String>();
		tagMap.put("id=live-matches", "div");
		removeMap.put("class=title", "div");
		removeMap.put("class=left", "th");
		String htmlContent="";//捕捉内容
		htmlContent=remoteParser.parseHtmlContent("http://192.168.1.50/specials/test1.html", tagMap, removeMap, "utf-8");
		List<PlayAgainst> list = remoteParser.playList(htmlContent);
		for(PlayAgainst pa:list){
			System.out.println(pa.getPlayerOneName()+"    "+pa.getPlayerTwoName());
		}
	}
	
}
