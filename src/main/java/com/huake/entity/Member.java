package com.huake.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.TableGenerator;

@Entity
@javax.persistence.Table(name="t_members")
public class Member implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 有效
	 */
	public static final Integer STATUS_VALID=1;
	/**
	 * 冻结
	 */
	public static final Integer STATUS_FREEZE=2;
	/**
	 * 无效
	 */
	public static final Integer STATUS_UN_VALID=3;
	/**
	 * 默认积分
	 */
	public static final Long BONUS_POINT = new Long(0);

	
	/**
	 * 会员	 */
	@Id
	@Column(name="member_id")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "tableGen")
	@TableGenerator(name="tableGen",table="t_seq_reg",pkColumnName="seq_type",pkColumnValue="member_id_gen_auto",initialValue=10000,allocationSize=1,valueColumnName="hi_ctr")
	private Long memberId;
	/**
	 * 邮箱
	 */
	@Column(name="email", length=60)
	private String email;

	/**
	 * 昵称
	 */
	@Column(name="nick_name", length=50)
	private String nickName;
	/**
	 * 密码,为空时使用第三方认证.
	 */
	@Column(name="password", length=128)
	private String password;
	
	/**
	 * 性别
	 */
	@Column(name="sex", length = 1)
	private String sex;

	/**
	 * 头像
	 */
	@Column(name = "avatar")
	private String avatar;
	
	/**
	 * 状
	 */
	@Column(name="status", length=2, nullable=false)
	private Integer status;
	/**
	 * 积分
	 */
	@Column(name="bonus_point")
	private Long bonusPoint;
	
	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getBonusPoint() {
		return bonusPoint;
	}

	public void setBonusPoint(Long bonusPoint) {
		this.bonusPoint = bonusPoint;
	}
	
}
