package springmvc.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "app_status")
public class AppStatus {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private long id;
	
	@OneToOne
	@JoinColumn(name="application_id")
	private Application applicationId;
	
    @Column(name="New")
	private boolean New;
    
    @Column(name="Pending")
	private boolean Pending;
    
    @Column(name="Denied")
	private boolean Denied;
    
    @Column(name="Admit")
	private boolean Admit;
    
    @Column(name="AdmitWithCondition")
	private boolean AdmitWithCondition;
	
    @Column(name="date")
    private Date date;
    
    @Column(name="comment")
	private String comment;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Application getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(Application applicationId) {
		this.applicationId = applicationId;
	}

	public boolean isNew() {
		return New;
	}

	public void setNew(boolean new1) {
		New = new1;
	}

	public boolean isPending() {
		return Pending;
	}

	public void setPending(boolean pending) {
		Pending = pending;
	}

	public boolean isDenied() {
		return Denied;
	}

	public void setDenied(boolean denied) {
		Denied = denied;
	}

	public boolean isAdmit() {
		return Admit;
	}

	public void setAdmit(boolean admit) {
		Admit = admit;
	}

	public boolean isAdmitWithCondition() {
		return AdmitWithCondition;
	}

	public void setAdmitWithCondition(boolean admitWithCondition) {
		AdmitWithCondition = admitWithCondition;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}


}
