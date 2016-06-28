package com.sea.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="_Class")
@Entity
public class Classes {
	
	private int classCode;
	private  String className;
	private int id;
	private School school;
	
	public int getClassCode() {
		return classCode;
	}
	public String getClassName() {
		return className;
	}
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public void setClassName(String className) {
		this.className = className;
	}
	public void setId(int id) {
		this.id = id;
	}
    
	@ManyToOne(cascade=CascadeType.ALL)
	public School getSchool() {
		return school;
	}
	public void setSchool(School school) {
		this.school = school;
	}

}
