package com.pycms.moble;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Teachersubject entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "teachersubject", catalog = "pycms")
public class Teachersubject implements java.io.Serializable {

	// Fields

	private Integer id;
	private String teacherId;
	private String gradeId;
	private String classId;
	private String subjectId;
	private Integer directorFlag;

	// Constructors

	/** default constructor */
	public Teachersubject() {
	}

	/** full constructor */
	public Teachersubject(String teacherId, String gradeId, String classId,
			String subjectId, Integer directorFlag) {
		this.teacherId = teacherId;
		this.gradeId = gradeId;
		this.classId = classId;
		this.subjectId = subjectId;
		this.directorFlag = directorFlag;
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

	@Column(name = "teacher_id", length = 11)
	public String getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	@Column(name = "grade_id", length = 11)
	public String getGradeId() {
		return this.gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	@Column(name = "class_id", length = 11)
	public String getClassId() {
		return this.classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	@Column(name = "subject_id", length = 11)
	public String getSubjectId() {
		return this.subjectId;
	}

	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}

	@Column(name = "director_flag")
	public Integer getDirectorFlag() {
		return this.directorFlag;
	}

	public void setDirectorFlag(Integer directorFlag) {
		this.directorFlag = directorFlag;
	}

}