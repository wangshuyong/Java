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
 * Curriculum entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "curriculum", catalog = "pycms")
public class Curriculum implements java.io.Serializable {

	// Fields

	private Integer id;
	private String subjectId;
	private String teacherId;
	private String classId;
	private Date teacheDay;
	private Date createTime;

	// Constructors

	/** default constructor */
	public Curriculum() {
	}

	/** full constructor */
	public Curriculum(String subjectId, String teacherId, String classId,
			Date teacheDay, Date createTime) {
		this.subjectId = subjectId;
		this.teacherId = teacherId;
		this.classId = classId;
		this.teacheDay = teacheDay;
		this.createTime = createTime;
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
	public String getSubjectId() {
		return this.subjectId;
	}

	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}

	@Column(name = "teacher_id")
	public String getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	@Column(name = "class_id")
	public String getClassId() {
		return this.classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "teache_day", length = 10)
	public Date getTeacheDay() {
		return this.teacheDay;
	}

	public void setTeacheDay(Date teacheDay) {
		this.teacheDay = teacheDay;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "create_time", length = 10)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}