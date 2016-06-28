package com.pycms.moble;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Parents entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "parents", catalog = "pycms")
public class Parents implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String telephone;
	private String loginname;
	private String password;
	private String studentId;

	// Constructors

	/** default constructor */
	public Parents() {
	}

	/** full constructor */
	public Parents(String name, String telephone, String loginname,
			String password, String studentId) {
		this.name = name;
		this.telephone = telephone;
		this.loginname = loginname;
		this.password = password;
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

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "telephone")
	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Column(name = "loginname")
	public String getLoginname() {
		return this.loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	@Column(name = "password")
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "student_id")
	public String getStudentId() {
		return this.studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

}