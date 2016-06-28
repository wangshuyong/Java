package com.sea.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Table(name="_District")
@Entity
public class District {
	
	private int districtCode;
	private  String distrtictName;
	private int id;	
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public int getDistrictCode() {
		return districtCode;
	}

	public void setDistrictCode(int districtCode) {
		this.districtCode = districtCode;
	}

	public String getDistrtictName() {
		return distrtictName;
	}

	public void setDistrtictName(String distrtictName) {
		this.distrtictName = distrtictName;
	}
	

}
