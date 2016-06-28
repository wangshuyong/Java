package com.pycms.moble;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Workscoretable entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "workscoretable", catalog = "pycms")
public class Workscoretable implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userId;
	private String workId;
	private Integer type;
	private String status;
	private Integer downloadStatus;
	private String userType;

	// Constructors

	/** default constructor */
	public Workscoretable() {
	}

	/** full constructor */
	public Workscoretable(String userId, String workId, Integer type,
			String status, Integer downloadStatus, String userType) {
		this.userId = userId;
		this.workId = workId;
		this.type = type;
		this.status = status;
		this.downloadStatus = downloadStatus;
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

	@Column(name = "user_id")
	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "work_id")
	public String getWorkId() {
		return this.workId;
	}

	public void setWorkId(String workId) {
		this.workId = workId;
	}

	@Column(name = "type")
	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Column(name = "status")
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "download_status")
	public Integer getDownloadStatus() {
		return this.downloadStatus;
	}

	public void setDownloadStatus(Integer downloadStatus) {
		this.downloadStatus = downloadStatus;
	}

	@Column(name = "user_type")
	public String getUserType() {
		return this.userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

}