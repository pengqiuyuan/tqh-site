package com.huake.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 赛事直播间比赛描述
 * @author zhenghongwei
 *
 */
@Entity
@javax.persistence.Table(name="t_game_point")
public class GamePoint implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 有效
	 */
	public static final String STATUS_VALID="1";
	/**
	 * 无效
	 */
	public static final String STATUS_INVALID="0";
	
	@Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	
	/**
	 * 名称
	 */
	@Column(name = "name")
	private String name;
	
	
	/**
	 * 爬虫页面网址
	 */
	@Column(name="url", nullable = false)
	private String url;
	
	/**
	 * 比赛时间，编辑手动输入
	 */
	@Column(name="date", nullable = false)
	private String date;
	
	/**
	 * 创建时间
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column( name = "crt_date")
	private Date crtDate;
	/**
	 * 更新时间
	 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column( name = "up_date")
	private Date tupDate;
	
	/**
	 * 状态
	 */
	@Column(name="status",length=1)
	private String status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Date getCrtDate() {
		return crtDate;
	}

	public void setCrtDate(Date crtDate) {
		this.crtDate = crtDate;
	}

	public Date getTupDate() {
		return tupDate;
	}

	public void setTupDate(Date tupDate) {
		this.tupDate = tupDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
