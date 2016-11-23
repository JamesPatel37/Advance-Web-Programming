package springmvc.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "eduBackground")
public class EduBackground implements Serializable {
    
	@Id
	@GeneratedValue
	@Column(name="id")
	private long id;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private Users userId;
	
    @Column(name="colgName")
	private String colgName;
    
    @Temporal(TemporalType.DATE)
    @Column(name="timePeriod1")
	private Date timePeriod1;

    @Temporal(TemporalType.DATE)
    @Column(name="timePeriod2")
	private Date timePeriod2; 
    
    @Column(name="degree")
	private String degree;
    
    @Column(name="major")
	private String major;


	public String getColgName() {
		return colgName;
	}

	public void setColgName(String colgName) {
		this.colgName = colgName;
	}

	public Date getTimePeriod1() {
		return timePeriod1;
	}

	public void setTimePeriod1(Date timePeriod1) {
		this.timePeriod1 = timePeriod1;
	}

	public Date getTimePeriod2() {
		return timePeriod2;
	}

	public void setTimePeriod2(Date timePeriod2) {
		this.timePeriod2 = timePeriod2;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public Users getUserId() {
		return userId;
	}

	public void setUserId(Users userId) {
		this.userId = userId;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

    
}
