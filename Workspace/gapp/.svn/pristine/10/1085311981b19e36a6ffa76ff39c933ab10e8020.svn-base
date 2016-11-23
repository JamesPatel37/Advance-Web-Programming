package springmvc.model;

import java.io.File;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "application")
public class Application implements Serializable  {
		
	@Id
	@GeneratedValue
	@Column(name="id")
	private long id;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private Users userId;

	@ManyToOne
	@JoinColumn(name="department_id")
	private Department departmentId;
	
	@ManyToOne
    @JoinColumn(name="program_id")
	private Program programId;
	
	@ManyToOne
	@JoinColumn(name="status_id")
	private AppStatus statusId;
	
	@Column(name="term")
	private String term; 
	
    @Column(name="toefl") //(for international students)
	private long toefl;
    
    @Column(name="gre") // GRE score (if required by department)
	private long gre;
    
    @Column(name="gpa")
	private double gpa;
    
    @Column(name="transcript")
	private String transcript;
    
	@Column(name="Submitted", nullable = false)
	private boolean submitted;
	
    @Column(name="date")
	private Date date;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Program getProgramId() {
		return programId;
	}

	public void setProgramId(Program programId) {
		this.programId = programId;
	}

	public Department getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Department departmentId) {
		this.departmentId = departmentId;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public long getToefl() {
		return toefl;
	}

	public void setToefl(long toefl) {
		this.toefl = toefl;
	}

	public long getGre() {
		return gre;
	}

	public void setGre(long gre) {
		this.gre = gre;
	}

	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}


	public String getTranscript() {
		return transcript;
	}

	public void setTranscript(String transcript) {
		this.transcript = transcript;
	}

	public Users getUserId() {
		return userId;
	}

	public void setUserId(Users userId) {
		this.userId = userId;
	}


	public AppStatus getStatusId() {
		return statusId;
	}

	public void setStatusId(AppStatus statusId) {
		this.statusId = statusId;
	}
    
	public boolean isSubmitted() {
		return submitted;
	}

	public void setSubmitted(boolean submitted) {
		this.submitted = submitted;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
    
   
}
