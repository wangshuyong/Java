package com.sea.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name="_School")
@Entity
public class School {
	
	private int id;
	private  String schoolName;
	private String nickName;
	private int type;
	private District district;
	private Set<Classes> classes = new HashSet<Classes>();
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public String getNickName() {
		return nickName;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public int getType() {
		return type;
	}
	public void setId(int id) {
		this.id = id;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public void setType(int type) {
		this.type = type;
	}
	/*
	@OneToOne
	@JoinColumn(name="district_id")
	public District getDistrict() {
		return district;
	}
	public void setDistrict(District district) {
		this.district = district;
	} */
	@OneToMany(mappedBy="school"
//			,fetch=FetchType.EAGER
			)
	public Set<Classes> getClasses() {
		return classes;
	}
	public void setClasses(Set<Classes> classes) {
		this.classes = classes;
	}
}
