package com.huake.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;
/**
 * 台球会网站banner
 * @author zhenghongwei
 *
 */
@Entity
@Table(name = "t_tqh_site_banner")
public class TqhSiteBanner extends BaseEntry{
		
	/**
	 * 标题
	 */
	@Column(name = "title")
	private String title;
	/**
	 * 缩略图
	 */
	@Column(name = "thumb")
	private String thumb;
	/**
	 * 关联实体
	 */
	@Column(name = "entry",length=5)
	private String entry;
	/**
	 * 关联值
	 */
	@Column(name = "value")
	private String value;
	/**
	 * 排序字段
	 */
	
	@Column( name = "seq_date")
	private Date seqDate;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	public Date getSeqDate() {
		return seqDate;
	}

	public void setSeqDate(Date seqDate) {
		this.seqDate = seqDate;
	}

	public String getEntry() {
		return entry;
	}

	public void setEntry(String entry) {
		this.entry = entry;
	}

	


}
