package com.huake.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springside.modules.test.spring.SpringTransactionalTestCase;

import com.huake.entity.Member;
import com.huake.service.member.MemberService;

@ContextConfiguration(locations = {"/applicationContext.xml"})
public class MemberServiceTest extends SpringTransactionalTestCase{
	
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
}
