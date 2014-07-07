package com.huake.entity;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@javax.persistence.Table(name = "t_places")
public class Place extends BaseEntry{

	/**
	 * 名称
	 */
	@Column(name = "name")
	private String name;

	/**
	 * 地址
	 */
	@Column(name = "address")
	private String addr;

	/**
	 * 电话  
	 */
	@Column(name = "tel")
	private String tel;
	
	/**
	 * 经度
	 */
	@Column(name = "longitude", precision = 15, scale = 10)
	private BigDecimal longitude;
	/**
	 * 纬度
	 */
	@Column(name = "latitude", precision = 15, scale = 10)
	private BigDecimal latitude;

	/**
	 * 图片
	 */
	@ElementCollection(fetch = FetchType.EAGER)
	@Column(name = "value")
	@CollectionTable(name = "t_place_pictures", joinColumns = @JoinColumn(name = "place_id"))
	@Fetch(FetchMode.SUBSELECT)
	@LazyCollection(value = LazyCollectionOption.FALSE)
	private List<String> pictures;
	
	
}
