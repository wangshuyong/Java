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
 * Student entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "student", catalog = "pycms")
public class Student implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Date birsthday;
	private Integer sex;
	private String inSchoolYear;
	private String classId;
	private String gradeId;
	private String schoolId;

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** full constructor */
	public Student(String name, Date birsthday, Integer sex,
			String inSchoolYear, String classId, String gradeId, String schoolId) {
		this.name = name;
		this.birsthday = birsthday;
		this.sex = sex;
		this.inSchoolYear = inSchoolYear;
		this.classId = classId;
		this.gradeId = gradeId;
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

	@Column(name = "in_school_year")
	public String getInSchoolYear() {
		return this.inSchoolYear;
	}

	public void setInSchoolYear(String inSchoolYear) {
		this.inSchoolYear = inSchoolYear;
	}

	@Column(name = "class_id")
	public String getClassId() {
		return this.classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	@Column(name = "grade_id")
	public String getGradeId() {
		return this.gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	@Column(name = "school_id")
	public String getSchoolId() {
		return this.schoolId;
	}

	public void setSchoolId(String schoolId) {
		this.schoolId = schoolId;
	}

}