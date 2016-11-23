package springmvc.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import springmvc.model.Department;

@Entity
@Table(name = "programs")
public class Program implements Serializable {

	@Id
	@GeneratedValue
	@Column(name="id")
	private long id;
	
	@ManyToOne
	@JoinColumn(name = "department_id")
	private Department department; 
	
    @Column(nullable = false, name = "program_name")
    private String name; 
    
	
	@OneToOne(mappedBy="programId")
	private Application applicationId;

	public Program() {
	}
	
    public Program( Department department )
    {
        this();
        this.department = department;
    }

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Application getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(Application applicationId) {
		this.applicationId = applicationId;
	}


}
