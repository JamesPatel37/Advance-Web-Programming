package springmvc.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "app_status")
public class AppStatus implements Serializable {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private long id;
	
    @Column(name="New", nullable = false)
	private boolean New;
    
    @Column(name="Pending", nullable = false)
	private boolean Pending;
    
    @Column(name="Denied", nullable = false)
	private boolean Denied;
    
    @Column(name="Admit", nullable = false)
	private boolean Admit;
    
    @Column(name="AdmitWithCondition", nullable = false)
	private boolean AdmitWithCondition;
	
    @Column(name="date")
    private Date date;
    
    @Column(name="comment")
	private String comment;

    @OneToMany(mappedBy="statusId", cascade = CascadeType.ALL)
    private List<Application> application;
    
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
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

	public List<Application> getApplication() {
		return application;
	}

	public void setApplication(List<Application> application) {
		this.application = application;
	}


}
