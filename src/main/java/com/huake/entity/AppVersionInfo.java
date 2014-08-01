package com.huake.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
/**
 * app 版本
 * @author zhenghongwei
 *
 */
@Entity
@javax.persistence.Table(name="t_app_info")
public class AppVersionInfo implements Serializable {

	
	private static final long serialVersionUID = 1L;
	/**
	 * 台球会越狱版本
	 */
	public static final String APP_CATEGORY_TQH_IOS="IOS-TQH-FREE";
	/**
	 * 台球会android版
	 */
	public static final String APP_CATEGORY_TQH_ANDROID="ANDROID-TQH";
	/**
	 * 台球视界android版
	 */
	public static final String APP_CATEGORY_TQSJ_ANDROID="ANDROID-BILLIARDSVIDEO";
	/**
	 * 台球会视界iPhone版
	 */
	public static final String APP_CATEGORY_TQSJ_IOS="IOS-BILLIARDSVIDEO";
	
	@Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
	public Long id;
	/**
	 * 手机类型，1:一起看Android/2:一起看iPhone/...
	 */
	@Column(name = "category",length=255)
	public String category;
	/**
	 * 应用软件名称
	 */
	@Column(name="app_name")
	public String appName;
	/**
	 * 版本代码，如1, android 对应为 android:versionCode="1" android:versionName="1.0.0"
	 */
	@Column(name="verCode")
	public Integer verCode;
	/**
	 * 应用软件名称
	 */
	@Column(name="url",length=255)
	public String url;
	
	/**
	 * 创建日期
	 */
	@Column(name="crt_date")
	public Date crtDate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public Integer getVerCode() {
		return verCode;
	}

	public void setVerCode(Integer verCode) {
		this.verCode = verCode;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Date getCrtDate() {
		return crtDate;
	}

	public void setCrtDate(Date crtDate) {
		this.crtDate = crtDate;
	}
	
}
