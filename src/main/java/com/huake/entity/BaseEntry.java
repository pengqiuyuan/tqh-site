package com.huake.entity;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import com.fasterxml.jackson.annotation.JsonFormat;
/**
 * 
 * @author wuhui
 *
 */
@MappedSuperclass
public class BaseEntry {

	/**
	 * 有效 即审核通过
	 */
	public final static String STATUS_VALIDE="1";
	/**
	 * 无效 审核未通过
	 */
	public final static String STATUS_INVALIDE="0";
	/**
	 * 未审核
	 */
	public final static String STATUS_NOT_CHECK="2";
	protected Long id;
	
	private Date crtDate;
	
	private Date upDate;
	
	private String status;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	public Date getCrtDate() {
		return crtDate;
	}

	public void setCrtDate(Date crtDate) {
		this.crtDate = crtDate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	public Date getUpDate() {
		return upDate;
	}

	

	public void setUpDate(Date upDate) {
		this.upDate = upDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
