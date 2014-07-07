package com.huake.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.TableGenerator;
import javax.persistence.Transient;

import org.codehaus.jackson.map.annotate.JsonFilter;
import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Index;

import com.huake.domains.annotations.ActivityPropertyColumn;
import com.huake.domains.tqh.TqhCoupon;
import com.huake.util.jackson.DateSerializer;
import com.huake.util.jackson.DateTimeSerializer;

/**
 * 会员基本信息，其它信息单独建表进行OneToOne关联.可以单独注册，也可以绑定期它第三方认证�?
 * @author skylai
 *
 */
@Entity
@javax.persistence.Table(name="t_members")
@org.hibernate.annotations.Table(appliesTo="t_members", indexes = { @Index(name="idx_member_name", columnNames = { "email" } ),
		@Index(name="idx_member_nick_name", columnNames = { "nick_name","status" } ),
		@Index(name="idx_member_member_id_status", columnNames = { "member_id","status" } ),
		@Index(name="idx_member_mobile", columnNames = { "mobile" } ),
		@Index(name="idx_member_lastLogin", columnNames = { "lastLogin" } )} )
@JsonFilter("memberFilter")
public class Member implements Serializable {
	
	/**
	 * 官方小秘书 id
	 */
	public static final Long OFFICIAL_MEMBER=125800003l;

	/**
	 * 牛逼
	 */
	public static final Integer NIUBI_YES=1;


	private static final long serialVersionUID = 1L;
	  
	public static final String MEMBER_STATUC_CLASS_NAME="MEMBER_STATUS";
	/**
	 * 会员类别 ：普通会	 
	 * 
	 * */
	public static final String MEMBER_CATEGORY_COMMON="c";
	/**
	 * 会员类别：官方账小秘
	 *  */
	public static final String MEMBER_CATEGORY_OFFICIAL="o";
	/**
	 * 会员类别：实体球房分配账号类 :用于创建俱乐 
	 * */
	public static final String MEMBER_CATEGORY_PLACE="p";
	
	/**
	 * 小秘书
	 */
	public static final Integer IDENTITY_OFFICE=2;
	/**
	 * 管理员 3
	 */
	public static final Integer IDENTITY_HEAD=3;
	/**
	 * 操作员 4
	 */
	public static final Integer IDENTITY_OPER=4;
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
	 * 竞技中心，是否可以邀：可以邀	 */
	public static final String INVITING_STATUS_VALID="1";
	/**
	 * 不能
	 */
	public static final String INVITING_STATUS_INVALID="2";
	/**
	 * 会员等级
	 * 等级1   0分以下无下限   
	 */
	public static final Integer LEVEL_1=1;
	/**
	 * 等级2   0~1000      
	 */
	public static final Integer LEVEL_2=2;
	/**
	 * 等级3   1000~4000       
	 */
	public static final Integer LEVEL_3=3;
	/**
	 * 等级4   4000~8000       
	 */
	public static final Integer LEVEL_4=4;
	/**
	 * 等级5   8000~12000      
	 */
	public static final Integer LEVEL_5=5;
	/**
	 * 等级6   12000+       
	 */
	public static final Integer LEVEL_6=6;
	/**
	 * 称号
	 */
	public static final String INTEGRAL_1="落袋";
	public static final String INTEGRAL_2="摆球";
	public static final String INTEGRAL_3="�?��";
	public static final String INTEGRAL_4="高杆";
	public static final String INTEGRAL_5="中杆";
	public static final String INTEGRAL_6="低杆";
	/**
	 * 动气来会	 */
	public static final String APP_CATEGORY_SPORT="sport";
	
	/**
	 * 台球视界会员
	 */
	public static final String APP_CATEGORY_TQSJ="tqsj";
	
	/**
	 * 台球会会员  
	 */
	public static final String APP_CATEGORY_TQH="tqh";
	
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
	 * 登录	 */
	@Column(name="login_name", length=60)
	private String loginName;
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
	
	@Transient
	private String oldPassword;
	/**
	 * 性别
	 */
	@Column(name="sex", length = 1)
	@ActivityPropertyColumn(name = "性别")
	//@JsonSerialize(using = SexSerializer.class)
	private String sex;
	/**
	 * 生日
	 */
	@Column(name="birth")
	@ActivityPropertyColumn(name = "生日")
	@JsonSerialize(using = DateSerializer.class)
	private Date birth;
	/**
	 * 
	 */
	@Column(name="introduce")
	private String introduce;
	
	/**
	 * 备注
	 */
	@Column(name="remark")
	private String remark;
	
	/**
	 * 手机号码
	 */
	@Column(name="mobile", length = 30 , nullable=true)
	private String mobile;

	/**
	 * 绑定手机
	 */
	@Column(name="bind_mobile_able")
	private Boolean bindMobile;
	
	/**
	 * 实名
	 */
	@Column(name="name")
	private String name;
	
	/**
	 * 地址
	 */
	@Column(name="address", length = 200)
	private String address;

	/**
	 * 是否实名，默认false，为true时name字段必须为真实�?�?
	 */
	@Column(name="realable")
	private Boolean realName;
	
	/**
	 * 账户金额，可通过网银，支付宝等转账	 */
	@Column(name="account_amount")
	private BigDecimal accountAmount=new BigDecimal(0);
	/**
	 * 登陆次数
	 */
	@Column(name="login_num")
	private long loginNum = 0;
	/**
	 *登陆时间
	 */
	@Column(name="lastLogin")
	@JsonSerialize(using = DateTimeSerializer.class)
	private Date lastLogin;
	
	/**
	 * 登录的城	 */
	@Column(name = "last_city")
	private String lastCity;
	
	@Column(name ="sign_count")
	private Integer signCount;
	/**
	 * 修改时间
	 */
	@Column
	private Date updateDate;
	
	/**
	 * 用于竞技排行 ：会员级别，以分数进行区	 */
	@Column(name = "level")
	@ActivityPropertyColumn(name = "积分")
	private Integer level=1;
	/**
	 * 用于竞技排行：积 */
	@Column
	private Long integral=new Long(0);
	
	@Column(name = "created_at")
	@ActivityPropertyColumn(name = "注册时间")
	@JsonSerialize(using = DateTimeSerializer.class)
	private Date crtDate;
	/**
	 * 身份  （暂时用于标示是否是牛逼的人）
	 */
	@Column(name="identity")
	private Integer identity;
	
	/**
	 * 头像
	 */
	@Column(name = "avatar")
	private String avatar;
	
	/**
	 * 新浪微博账号
	 */
	@Column(name="tsina", length = 60)
	private String tsina;
	
	@Column(name="tsina_id", length = 60)
	private String tsinaId;
	
	@Column(name="tqq", length = 60)
	private String tqq;
	
	@Column(name="tqq_id", length = 60)
	private String tqqId;
	
	@Column(name = "client", length = 100)
	private String client;
	
	@Column(name="qq", length = 60)
	private String qq;
	/**
	 * 会员关联身份
	 */
	@ManyToMany(fetch = FetchType.EAGER, cascade={})
	@Fetch(FetchMode.SUBSELECT)
	@JoinTable(name = "t_member_identitys", joinColumns=@JoinColumn(name="member_id"), inverseJoinColumns=@JoinColumn(name="identity_id"))
	private List<Identity> identitys;
	/**
	 * 持有优惠券
	 */
	@Transient
	private List<Coupon> coupons;
	
	
	/**
	 * 持有优惠券(zhong)
	 */
	@Transient
	private List<TqhCoupon> tqhcoupons;
	
	public List<TqhCoupon> getTqhcoupons() {
		return tqhcoupons;
	}
	public void setTqhcoupons(List<TqhCoupon> tqhcoupons) {
		this.tqhcoupons = tqhcoupons;
	}
	/**

	 * 用于接口使用，会员发送给好友的消息数 */


	@Transient
	private Long count;
	/**
	 * 状
	 */
	@Column(name="status", length=2, nullable=false)
	private Integer status;
	/**
	 * 胜率
	 */
	@Column(name="winning", precision = 4, scale = 1)
	private BigDecimal winning=new BigDecimal(0);
	
	/**
	 * 胜场	 */
	@Column(name="win_times")
	private Integer winTimes;
	/**
	 * 负场	 */
	@Column(name="lose_times")
	private Integer loseTimes;
	/**
	 * 称号
	 */
	@Column(name="epithet")
	private String epithet;
	/**
	 * 类别   普会员 ,小秘	 */
	@Column(name="category",length=5)
	private String category;
	/**
	 * 会员积分
	 */
	@Column
	private Long bonusPoint=new Long(0);
	/**
	 * 会员区分app
	 */
	@Column(name="app",length=20)
	private String app;
	/**
	 * 竞技中心好友列表：用于表示该好友是否可以发起�?��
	 * 1可以 2 不能
	 */
	@Transient
	private String invitingStatus;
	/**
	 * 是否为某个会员好友，用于会员搜索功能
	 * 1 2	 */
	@Transient
	private String friendStatus;
	/**
	 * 用于动起来会员注 添加兴趣爱好
	 */
	@Transient
	private List<SportItem> sportItems;
	
	/**
	 * pengqiuyuan
	 * 用于es保存对象字段 
	 */
	@Transient
	private Long friendId;
	
	/**
	 * pengqiuyuan
	 * 用于es保存对象字段 
	 */
	@Transient
	private String esStatus;
	
	/**
	 * pengqiuyuan
	 * 用于es保存对象字段 
	 */
	@Transient
	private Long esMemberId;
	
	/**
	 * pengqiuyuan
	 * 用于es保存对象字段 
	 */
	@Transient
	private String esTime;
	/**
	 * 粉丝数     tqh
	 */
	@Column(name="fans")
	private Integer fans=new Integer(0);
	/**
	 * 关注数    tqh
	 */
	@Column(name="focus")
	private Integer focus=new Integer(0);
	/**
	 * 话题数  tqh
	 */
	@Column(name="discussions")
	private Integer discussions=new Integer(0);
	/**
	 * @return the identity
	 */
	public Integer getIdentity() {
		return identity;
	}
	/**
	 * @param identity the identity to set
	 */
	public void setIdentity(Integer identity) {
		this.identity = identity;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		if(null != email){
			this.email = email.toLowerCase();
		}else this.email = email;
		
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
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Boolean getBindMobile() {
		return bindMobile;
	}
	public void setBindMobile(Boolean bindMobile) {
		this.bindMobile = bindMobile;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	/**
	 * @return the realName
	 */
	public Boolean getRealName() {
		return realName;
	}
	/**
	 * @param realName the realName to set
	 */
	public void setRealName(Boolean realName) {
		this.realName = realName;
	}
	/**
	 * @return the loginNum
	 */
	public long getLoginNum() {
		return loginNum;
	}
	/**
	 * @param loginNum the loginNum to set
	 */
	public void setLoginNum(long loginNum) {
		this.loginNum = loginNum;
	}
	/**
	 * @return the lastLogin
	 */
	public Date getLastLogin() {
		return lastLogin;
	}
	/**
	 * @param lastLogin the lastLogin to set
	 */
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public BigDecimal getAccountAmount() {
		return accountAmount;
	}
	public void setAccountAmount(BigDecimal accountAmount) {
		this.accountAmount = accountAmount;
	}
	public Date getCrtDate() {
		return crtDate;
	}
	public void setCrtDate(Date crtDate) {
		this.crtDate = crtDate;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 *
	 */
	public Long getMemberId() {
		return memberId;
	}
	/**
	 * 
	 */
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	/**
	 *
	 */
	public Long getIntegral() {
		return integral;
	}
	/**
	 * 
	 */
	public void setIntegral(Long integral) {
		this.integral = integral;
	}
	/**
	 *
	 */
	public List<Coupon> getCoupons() {
		return coupons;
	}
	/**
	 * 
	 */
	public void setCoupons(List<Coupon> coupons) {
		this.coupons = coupons;
	}
	/**
	 *
	 */
	public Integer getStatus() {
		return status;
	}
	/**
	 * 
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 *
	 */
	public Date getUpdateDate() {
		return updateDate;
	}
	/**
	 * 
	 */
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Integer getSignCount() {
		return signCount;
	}
	public void setSignCount(Integer signCount) {
		this.signCount = signCount;
	}
	public String getTsina() {
		return tsina;
	}
	public void setTsina(String tsina) {
		this.tsina = tsina;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTqq() {
		return tqq;
	}
	public void setTqq(String tqq) {
		this.tqq = tqq;
	}
	public String getLastCity() {
		return lastCity;
	}
	public void setLastCity(String lastCity) {
		this.lastCity = lastCity;
	}
	public String getTsinaId() {
		return tsinaId;
	}
	public void setTsinaId(String tsinaId) {
		this.tsinaId = tsinaId;
	}
	public String getTqqId() {
		return tqqId;
	}
	public void setTqqId(String tqqId) {
		this.tqqId = tqqId;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getInvitingStatus() {
		return invitingStatus;
	}
	public void setInvitingStatus(String invitingStatus) {
		this.invitingStatus = invitingStatus;
	}
	public BigDecimal getWinning() {
		return winning;
	}
	public void setWinning(BigDecimal winning) {
		this.winning = winning;
	}
	public Integer getWinTimes() {
		return winTimes;
	}
	public void setWinTimes(Integer winTimes) {
		this.winTimes = winTimes;
	}
	public Integer getLoseTimes() {
		return loseTimes;
	}
	public void setLoseTimes(Integer loseTimes) {
		this.loseTimes = loseTimes;
	}
	public String getEpithet() {
		return epithet;
	}
	public void setEpithet(String epithet) {
		this.epithet = epithet;
	}
	public String getFriendStatus() {
		return friendStatus;
	}
	public void setFriendStatus(String friendStatus) {
		this.friendStatus = friendStatus;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Long getBonusPoint() {
		return bonusPoint;
	}
	public void setBonusPoint(Long bonusPoint) {
		this.bonusPoint = bonusPoint;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public Long getFriendId() {
		return friendId;
	}
	public void setFriendId(Long friendId) {
		this.friendId = friendId;
	}
	public String getApp() {
		return app;
	}
	public void setApp(String app) {
		this.app = app;
	}
	public List<SportItem> getSportItems() {
		return sportItems;
	}
	public void setSportItems(List<SportItem> sportItems) {
		this.sportItems = sportItems;
	}
	public String getEsStatus() {
		return esStatus;
	}
	public void setEsStatus(String esStatus) {
		this.esStatus = esStatus;
	}
	public Long getEsMemberId() {
		return esMemberId;
	}
	public void setEsMemberId(Long esMemberId) {
		this.esMemberId = esMemberId;
	}
	public String getEsTime() {
		return esTime;
	}
	public void setEsTime(String esTime) {
		this.esTime = esTime;
	}
	public List<Identity> getIdentitys() {
		return identitys;
	}
	public void setIdentitys(List<Identity> identitys) {
		this.identitys = identitys;
	}
	public Integer getFans() {
		return fans;
	}
	public void setFans(Integer fans) {
		this.fans = fans;
	}
	public Integer getFocus() {
		return focus;
	}
	public void setFocus(Integer focus) {
		this.focus = focus;
	}
	public Integer getDiscussions() {
		return discussions;
	}
	public void setDiscussions(Integer discussions) {
		this.discussions = discussions;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
