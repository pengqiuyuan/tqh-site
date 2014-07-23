package com.huake.entity;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

/**
 * 待审核场馆
 * @author asus
 *
 */
@Entity
@javax.persistence.Table(name = "t_places_site")
public class Place extends BaseEntry{

	/**
	 * 待审核场馆名称
	 */
	@Column(name = "name")
	private String name;

	/**
	 * 地址
	 */
	@Column(name = "addr")
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
	private Set<PlaceDetail> placeDetails = new HashSet<PlaceDetail>();

	/**
	 * 省份代码
	 */
	@Column(name = "province")
	private String province;
	/**
	 * 城市代码
	 */
	@Column(name = "city")
	private String city;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public BigDecimal getLongitude() {
		return longitude;
	}

	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}

	public BigDecimal getLatitude() {
		return latitude;
	}

	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}

	@OneToMany(cascade = CascadeType.ALL,  
            fetch = FetchType.LAZY)  
	@JoinColumn(name="placeId")
	public Set<PlaceDetail> getPlaceDetails() {
		return placeDetails;
	}

	public void setPlaceDetails(Set<PlaceDetail> placeDetails) {
		this.placeDetails = placeDetails;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
}
