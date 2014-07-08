package com.huake.web.controller.mgr;

import java.io.IOException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.huake.base.AppBizException;
import com.huake.entity.Member;
import com.huake.service.account.ShiroDbRealm.ShiroUser;
import com.huake.service.member.MemberService;
import com.huake.web.controller.BaseApiController;

@Controller
@RequestMapping(value="/member")
public class MemberController{
	
	public  static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	private String index() throws Exception{
		return "/member/login";
	}
	
	/**
	 * 用户登录
	 * @return
	 * @throws IOException
	 * @throws AppBizException
	 */
	@RequestMapping(value="/login", method = RequestMethod.POST)
	private String login(Member member,RedirectAttributes redirectAttributes) throws Exception{
		
		return "redirect:/index";
	}
	
	/**
	 * 用户注册
	 * @return
	 */
	@RequestMapping(value="/register",method = RequestMethod.POST)
	private String  register(Member member,RedirectAttributes redirectAttributes) throws Exception{

		return "redirect:/index";
	}
}
