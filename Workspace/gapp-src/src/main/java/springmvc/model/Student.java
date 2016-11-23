package springmvc.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "students")
public class Student{
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private long id;
	
	@OneToOne
	@JoinColumn(name="user_id")
	Users userId;
	
	//[3]Basic information of the student
    @Column(name="cin") //If available
	private long cin;
    
    @Column(name="phone")
	private long phone;
    
    @Column(name="gender")
	private String gender;
    
    @Column(name="birthday")
    private String birthday;
    
    @Column(name="citizenship")
	private String citizenship;	
    
    //[4] Educational background
    @OneToMany(mappedBy = "student")
	private List<EduBackground> eduBackground;
    

	public Users getUserId() {
		return userId;
	}

	public void setUserId(Users userId) {
		this.userId = userId;
	}

	public long getCin() {
		return cin;
	}

	public void setCin(long cin) {
		this.cin = cin;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getCitizenship() {
		return citizenship;
	}

	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}

	public List<EduBackground> getEduBackground() {
		return eduBackground;
	}

	public void setEduBackground(List<EduBackground> eduBackground) {
		this.eduBackground = eduBackground;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}


}
