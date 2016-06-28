package com.pycms.moble;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Position entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "position", catalog = "pycms")
public class Position implements java.io.Serializable {

	// Fields

	private Integer id;
	private String provinceName;
	private String cityName;
	private String countyName;

	// Constructors

	/** default constructor */
	public Position() {
	}

	/** full constructor */
	public Position(String provinceName, String cityName, String countyName) {
		this.provinceName = provinceName;
		this.cityName = cityName;
		this.countyName = countyName;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "province_name")
	public String getProvinceName() {
		return this.provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	@Column(name = "city_name")
	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	@Column(name = "county_name")
	public String getCountyName() {
		return this.countyName;
	}

	public void setCountyName(String countyName) {
		this.countyName = countyName;
	}

}