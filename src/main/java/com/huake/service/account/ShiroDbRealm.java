/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.huake.service.account;

import java.io.Serializable;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.utils.Encodes;

import com.google.common.base.Objects;
import com.google.common.collect.ImmutableList;
import com.huake.entity.Member;
import com.huake.entity.User;
import com.huake.service.member.CustomCredentialsMatcher;
import com.huake.service.member.MemberService;

public class ShiroDbRealm extends AuthorizingRealm {

	protected MemberService memberService;
	/**
	 * 认证回调函数,登录时调用.
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		/*UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		User user = accountService.findUserByLoginName(token.getUsername());
		if (user != null) {
			byte[] salt = Encodes.decodeHex(user.getSalt());
			return new SimpleAuthenticationInfo(new ShiroUser(user.getId(), user.getLoginName(), user.getName()),
					user.getPassword(), ByteSource.Util.bytes(salt), getName());
		} else {
			return null;
		}*/
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		Member member = memberService.findByEmail(token.getUsername(),Member.STATUS_VALID);
		if (member != null) {
			//byte[] salt = Encodes.decodeHex(member.getSalt());
			System.out.println("认证信息  会员Id"+member.getMemberId()+"昵称名"+member.getLoginName()+"  邮箱"+member.getEmail()+"  密码"+member.getPassword());
			//return new SimpleAuthenticationInfo(new ShiroUser(member.getMemberId(), member.getNickName(), member.getEmail()),
				//	member.getPassword(), ByteSource.Util.bytes(salt), getName());
			return	new SimpleAuthenticationInfo(new ShiroUser(member.getMemberId(), member.getNickName(), member.getEmail()),
					member.getPassword(), getName());
		} else {
			return null;
		}
	}

	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		/*ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
		User user = accountService.findUserByLoginName(shiroUser.loginName);
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addRoles(user.getRoleList());
		return info;*/
		ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
		Member member = memberService.findByEmail(shiroUser.email,Member.STATUS_VALID);
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addRoles(ImmutableList.copyOf(StringUtils.split(member.getRoles(), ",")));
		return info;
	}

	/**
	 * 设定Password校验的Hash算法与迭代次数.
	 */
	@PostConstruct
	public void initCredentialsMatcher() {
		/*HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(AccountService.HASH_ALGORITHM);
		matcher.setHashIterations(AccountService.HASH_INTERATIONS);*/
		setCredentialsMatcher(new CustomCredentialsMatcher());
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	/**
	 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息.
	 */
	public static class ShiroUser implements Serializable {
		private static final long serialVersionUID = -1373760761780840081L;
		public Long memberId;
		public String nickName;
		public String email;

		public ShiroUser(Long memberId, String nickName, String email) {
			System.out.println("会员信息    ID:"+memberId+"    name:" +nickName+"    email:"+email);
			this.memberId = memberId;
			this.nickName = nickName;
			this.email = email;
		}

		public String getName() {
			return nickName;
		}

		/**
		 * 本函数输出将作为默认的<shiro:principal/>输出.
		 */
		@Override
		public String toString() {
			return email;
		}

		/**
		 * 重载hashCode,只计算loginName;
		 */
		@Override
		public int hashCode() {
			return Objects.hashCode(email);
		}

		/**
		 * 重载equals,只计算email;
		 */
		@Override
		public boolean equals(Object obj) {
			if (this == obj) {
				return true;
			}
			if (obj == null) {
				return false;
			}
			if (getClass() != obj.getClass()) {
				return false;
			}
			ShiroUser other = (ShiroUser) obj;
			if (email == null) {
				if (other.email != null) {
					return false;
				}
			} else if (!email.equals(other.email)) {
				return false;
			}
			return true;
		}
	}
}
