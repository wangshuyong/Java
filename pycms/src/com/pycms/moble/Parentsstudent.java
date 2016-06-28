package com.pycms.moble;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Parentsstudent entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "parentsstudent", catalog = "pycms")
public class Parentsstudent implements java.io.Serializable {

	// Fields

	private Integer id;
	private String parentsId;
	private String studentId;

	// Constructors

	/** default constructor */
	public Parentsstudent() {
	}

	/** full constructor */
	public Parentsstudent(String parentsId, String studentId) {
		this.parentsId = parentsId;
		this.studentId = studentId;
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

	@Column(name = "parents_id")
	public String getParentsId() {
		return this.parentsId;
	}

	public void setParentsId(String parentsId) {
		this.parentsId = parentsId;
	}

	@Column(name = "student_id")
	public String getStudentId() {
		return this.studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

}