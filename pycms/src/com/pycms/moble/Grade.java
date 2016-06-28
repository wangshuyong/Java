package com.pycms.moble;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Grade entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "grade", catalog = "pycms")
public class Grade implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String schoolType;

	// Constructors

	/** default constructor */
	public Grade() {
	}

	/** full constructor */
	public Grade(String name, String schoolType) {
		this.name = name;
		this.schoolType = schoolType;
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

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "school_type")
	public String getSchoolType() {
		return this.schoolType;
	}

	public void setSchoolType(String schoolType) {
		this.schoolType = schoolType;
	}

}