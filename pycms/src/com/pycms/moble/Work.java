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
 * Work entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "work", catalog = "pycms")
public class Work implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String content;
	private String type;
	private String teacher;
	private Date createtime;
	private String status;
	private String subjectId;
	private Integer isTop;
	private Date changetime;
	private Integer count;
	private Integer participantCount;

	// Constructors

	/** default constructor */
	public Work() {
	}

	/** full constructor */
	public Work(String title, String content, String type, String teacher,
			Date createtime, String status, String subjectId, Integer isTop,
			Date changetime, Integer count, Integer participantCount) {
		this.title = title;
		this.content = content;
		this.type = type;
		this.teacher = teacher;
		this.createtime = createtime;
		this.status = status;
		this.subjectId = subjectId;
		this.isTop = isTop;
		this.changetime = changetime;
		this.count = count;
		this.participantCount = participantCount;
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

	@Column(name = "title")
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content", length = 2000)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "type")
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "teacher")
	public String getTeacher() {
		return this.teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "createtime", length = 10)
	public Date getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	@Column(name = "status")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "subject_id")
	public String getSubjectId() {
		return this.subjectId;
	}

	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}

	@Column(name = "is_top")
	public Integer getIsTop() {
		return this.isTop;
	}

	public void setIsTop(Integer isTop) {
		this.isTop = isTop;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "changetime", length = 10)
	public Date getChangetime() {
		return this.changetime;
	}

	public void setChangetime(Date changetime) {
		this.changetime = changetime;
	}

	@Column(name = "count")
	public Integer getCount() {
		return this.count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	@Column(name = "participantCount")
	public Integer getParticipantCount() {
		return this.participantCount;
	}

	public void setParticipantCount(Integer participantCount) {
		this.participantCount = participantCount;
	}

}