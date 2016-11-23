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

@Entity
@Table(name = "eduBackground")
public class EduBackground implements Serializable {

	@Id
	@GeneratedValue
	@Column(name="id")
	private long id;
    
	
	@JoinColumn(name = "studentId")
	@ManyToOne
    private Student student;
    
    @Column(name="colgName")
	private String colgName;
    
    @Column(name="timePeriod1")
	private String timePeriod1;

    @Column(name="timePeriod2")
	private String timePeriod2; 
    
    @Column(name="degree")
	private String degree;
    
    @Column(name="major")
	private String major;

    
    
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
 

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getColgName() {
		return colgName;
	}

	public void setColgName(String colgName) {
		this.colgName = colgName;
	}

	public String getTimePeriod1() {
		return timePeriod1;
	}

	public void setTimePeriod1(String timePeriod1) {
		this.timePeriod1 = timePeriod1;
	}

	public String getTimePeriod2() {
		return timePeriod2;
	}

	public void setTimePeriod2(String timePeriod2) {
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

    
}
