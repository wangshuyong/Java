package com.pycms.moble;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Classcode entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "classcode", catalog = "pycms")
public class Classcode implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String gradeId;
	private String classCode;

	// Constructors

	/** default constructor */
	public Classcode() {
	}

	/** full constructor */
	public Classcode(String name, String gradeId, String classCode) {
		this.name = name;
		this.gradeId = gradeId;
		this.classCode = classCode;
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

	@Column(name = "grade_id")
	public String getGradeId() {
		return this.gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	@Column(name = "class_code")
	public String getClassCode() {
		return this.classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

}