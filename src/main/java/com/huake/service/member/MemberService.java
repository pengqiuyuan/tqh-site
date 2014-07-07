package com.huake.service.member;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.huake.entity.Member;
import com.huake.repository.MemberDao;

@Component
@Transactional
public class MemberService {

	@Autowired
	private MemberDao memberDao;
	
	/**
	 * 通过email查找用户
	 * @param email
	 * @param status
	 * @return
	 */
	public Member findByEmail(String email,Integer status){
		return memberDao.findByEmailAndStatus(email, Member.STATUS_VALID);
	}
	
	/**
	 * 判断邮箱登陆名是否存在
	 * @param email
	 * @return
	 */
	public boolean iExist(String email){
		return memberDao.findByEmail(email) == null ? false:true;
	}
	
}
