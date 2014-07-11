package com.huake.test;

import java.util.HashMap;
import java.util.Map;

import javax.transaction.Transactional;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import com.huake.entity.Member;
import com.huake.service.member.MemberService;
@TransactionConfiguration(defaultRollback=false)
@ContextConfiguration(locations = {"classpath*:/applicationContext.xml"})
public class MemberServiceTest extends SpringTransactionalTestCase{
	
	private static final Map<String,String> map = new HashMap<String,String>();
	
	@Autowired
	private MemberService memberService;
	
	@Test
	public void test(){
		System.out.println("55555555");
		Member member = memberService.findByEmail("64878@qq.com", 1);
		System.out.println("11111111111" + member.getEmail());
		
		boolean t = memberService.iExist("64878@qq.com");
		System.out.println("000000  " + t);
	}
	@Test
	public void validate(){
	System.out.println(memberService.vilidateEmailOrNickName(null, "sfgege", map).toString());
	}
	@Test
	public void register(){
		Member member  = new Member();
		member.setEmail("565656@qq.com");
		member.setNickName("shenqideren");
		member.setPassword("123");
		memberService.register(member,map);
	}
	@Test
	public void sfs(){
		//Member m = memberService.gg("4546785@qq.com");
	//	System.out.println(m.getEmail()+"   " +m.getPassword());
	}
	@Test
	public void  fdk(){
		System.out.println("aaa");
	}
}
