package com.pycms.moble;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Noticetable entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "noticetable", catalog = "pycms")
public class Noticetable implements java.io.Serializable {

	// Fields

	private Integer id;
	private String noticeId;
	private String userId;
	private String status;
	private String userType;

	// Constructors

	/** default constructor */
	public Noticetable() {
	}

	/** full constructor */
	public Noticetable(String noticeId, String userId, String status,
			String userType) {
		this.noticeId = noticeId;
		this.userId = userId;
		this.status = status;
		this.userType = userType;
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

	@Column(name = "notice_id")
	public String getNoticeId() {
		return this.noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	@Column(name = "user_id")
	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "status")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "user_type")
	public String getUserType() {
		return this.userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

}