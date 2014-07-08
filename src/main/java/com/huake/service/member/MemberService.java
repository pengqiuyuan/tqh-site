package com.huake.service.member;

import java.security.MessageDigest;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public Member findByNickName(String nickName,Integer status){
		return memberDao.findByNickNameAndStatus(nickName, Member.STATUS_VALID);
	}
	/**
	 * 判断邮箱登陆名是否存在
	 * @param email
	 * @return
	 */
	public boolean iExist(String email){
		return memberDao.findByEmail(email) == null ? false:true;
	}
	/**
	 * 会员登录验证
	 * @param member
	 * @param redirectAttributes
	 * @return
	 */
	public String login(Member member,RedirectAttributes redirectAttributes){
		Member memberData = findByEmail(member.getEmail(),Member.STATUS_VALID);
		if(memberData==null || !memberData.getPassword().equals(toMD5(member.getPassword()))){
			redirectAttributes.addFlashAttribute("loginMember",member);
			return "redirect:/member/login";
		}
		return "redirect:/index";
	}
	/**
	 * 注册邮箱 昵称验证
	 * @param email
	 * @param nickName
	 * @param map
	 * @return
	 */
	public Map<String,String> vilidateEmailOrNickName(String email,String nickName,Map<String,String> map){
		if( (email!=null && !email.equals("")) && (nickName == null || nickName.equals(""))){
			Member member = findByEmail(email,Member.STATUS_VALID);
			if(member != null){
				map.put("message","该帐号已使用");
				return map;
			}else{
				map.put("message","ok");
				return map;
			}
		}else{
			Member member = findByNickName(nickName,Member.STATUS_VALID);
			if(member != null){
				map.put("message","该昵称已使用");
				return map;
			}else{
				map.put("message","ok");
				return map;
			}
		}
	}
	/**
	 * 会员注册
	 * @param member
	 * @return
	 */
	public Member register(Member member){
		member.setPassword(toMD5(member.getPassword()));
		return	saveMember(member);
	}
	public String toMD5(String s) {
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F' };
		try {
			byte[] btInput = s.getBytes();
			// 获得MD5摘要算法 ?MessageDigest 对象
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			// 使用指定的字节更新摘要
			mdInst.update(btInput);
			// 获得密文
			byte[] md = mdInst.digest();
			// 把密文转换成十六进制的字符串形式
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
				str[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(str);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 保存会员
	 * @param member
	 * @return
	 */
	public Member saveMember(Member member){
		member.setStatus(Member.STATUS_VALID);
		return memberDao.save(member);
	}
}
