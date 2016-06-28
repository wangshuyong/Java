package com.pycms.moble;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Teacher entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "teacher", catalog = "pycms")
public class Teacher implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Date birsthday;
	private Integer sex;
	private String telephone;
	private String loginname;
	private String password;
	private String teacherrole;
	private String schoolId;

	// Constructors

	/** default constructor */
	public Teacher() {
	}

	/** full constructor */
	public Teacher(String name, Date birsthday, Integer sex, String telephone,
			String loginname, String password, String teacherrole,
			String schoolId) {
		this.name = name;
		this.birsthday = birsthday;
		this.sex = sex;
		this.telephone = telephone;
		this.loginname = loginname;
		this.password = password;
		this.teacherrole = teacherrole;
		this.schoolId = schoolId;
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

	@Temporal(TemporalType.DATE)
	@Column(name = "birsthday", length = 10)
	public Date getBirsthday() {
		return this.birsthday;
	}

	public void setBirsthday(Date birsthday) {
		this.birsthday = birsthday;
	}

	@Column(name = "sex")
	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
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

	@Column(name = "teacherrole")
	public String getTeacherrole() {
		return this.teacherrole;
	}

	public void setTeacherrole(String teacherrole) {
		this.teacherrole = teacherrole;
	}

	@Column(name = "school_id")
	public String getSchoolId() {
		return this.schoolId;
	}

	public void setSchoolId(String schoolId) {
		this.schoolId = schoolId;
	}

}