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
 * Score entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "score", catalog = "pycms")
public class Score implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer subjectId;
	private Integer studentId;
	private Integer classId;
	private Integer points;
	private Date examtime;
	private Date sendtime;
	private String examname;

	// Constructors

	/** default constructor */
	public Score() {
	}

	/** full constructor */
	public Score(Integer subjectId, Integer studentId, Integer classId,
			Integer points, Date examtime, Date sendtime, String examname) {
		this.subjectId = subjectId;
		this.studentId = studentId;
		this.classId = classId;
		this.points = points;
		this.examtime = examtime;
		this.sendtime = sendtime;
		this.examname = examname;
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

	@Column(name = "subject_id")
	public Integer getSubjectId() {
		return this.subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	@Column(name = "student_id")
	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	@Column(name = "class_id")
	public Integer getClassId() {
		return this.classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	@Column(name = "points")
	public Integer getPoints() {
		return this.points;
	}

	public void setPoints(Integer points) {
		this.points = points;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "examtime", length = 10)
	public Date getExamtime() {
		return this.examtime;
	}

	public void setExamtime(Date examtime) {
		this.examtime = examtime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "sendtime", length = 10)
	public Date getSendtime() {
		return this.sendtime;
	}

	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}

	@Column(name = "examname")
	public String getExamname() {
		return this.examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}

}