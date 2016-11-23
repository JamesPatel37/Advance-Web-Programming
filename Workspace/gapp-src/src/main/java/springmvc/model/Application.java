package springmvc.model;

import java.io.File;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "application")
public class Application {
		
	@Id
	@GeneratedValue
	@Column(name="id")
	private long id;
	
	@OneToOne
    @JoinColumn(name="program_id")
	private Program programId;

	@ManyToOne
	@JoinColumn(name="department_id")
	private Department departmentId;
	
	@OneToOne
	@JoinColumn(name="user_id")
	private Users user_Id;
	
	@Column(name="term")
	private String term; 
	
	//[5] Academic records
    @Column(name="toefl") //(for international students)
	private long toefl;
    
    @Column(name="gre") // GRE score (if required by department)
	private long gre;
    
    @Column(name="gpa")
	private double gpa;
    
    @Column(name="transcript")
	private File transcript;

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

	public Users getUserId() {
		return user_Id;
	}

	public void setUserId(Users userId) {
		this.user_Id = userId;
	}


	public Users getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(Users user_Id) {
		this.user_Id = user_Id;
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

	public File getTranscript() {
		return transcript;
	}

	public void setTranscript(File transcript) {
		this.transcript = transcript;
	}
    
    
    
   
}
