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
 * Information entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "information", catalog = "pycms")
public class Information implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String content;
	private String type;
	private String author;
	private Date createtime;
	private String status;
	private Integer isTop;
	private Date changetime;
	private String schoolId;
	private String subjectId;
	private Integer count;
	private Integer participantCount;
	private String attach;
	private String targetTab;
	private String scope;
	private String grade;
	
	
	
	

	// Constructors

	/** default constructor */
	public Information() {
	}

	/** full constructor */
	public Information(String title, String content, String type,
			String author, Date createtime, String status, Integer isTop,
			Date changetime, String schoolId, String subjectId, Integer count,
			Integer participantCount,String attach,String targetTab,String scope,String grade) {
		this.title = title;
		this.content = content;
		this.type = type;
		this.author = author;
		this.createtime = createtime;
		this.status = status;
		this.isTop = isTop;
		this.changetime = changetime;
		this.schoolId = schoolId;
		this.subjectId = subjectId;
		this.count = count;
		this.participantCount = participantCount;
		this.attach = attach;
		this.targetTab = targetTab;
		this.scope = scope;
		this.grade = grade;
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

	@Column(name = "content")
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

	@Column(name = "author")
	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
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

	@Column(name = "school_id")
	public String getSchoolId() {
		return this.schoolId;
	}

	public void setSchoolId(String schoolId) {
		this.schoolId = schoolId;
	}

	@Column(name = "subject_id")
	public String getSubjectId() {
		return this.subjectId;
	}

	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
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

	@Column(name = "attach")
	public String getAttach() {
		return this.attach;
	}

	public void setAttach(String attach) {
		this.attach = attach;
	}

	@Column(name = "targetTab")
	public String getTargetTab() {
		return this.targetTab;
	}

	public void setTargetTab(String targetTab) {
		this.targetTab = targetTab;
	}

	@Column(name = "scope")
	public String getScope() {
		return this.scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}

	@Column(name = "grade")
	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	
	
}