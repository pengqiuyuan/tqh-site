package com.huake.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
/**
 * 商品详情  存放拓展数据
 * @author zhenghongwei
 *
 */
@Entity
@Table(name = "t_places_site_detail")
public class PlaceDetail extends BaseEntry{
	/**
	 *审核场馆Id
	 */
	private Long placeId;
	/**
	 * 关联属性
	 */
	private String entry;
	/**
	 * 关联属性值
	 */
	private String value;
	public Long getPlaceId() {
		return placeId;
	}
	public void setPlaceId(Long placeId) {
		this.placeId = placeId;
	}
	public String getEntry() {
		return entry;
	}
	public void setEntry(String entry) {
		this.entry = entry;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}
