package springmvc.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import springmvc.model.Program;

@Entity
@Table(name = "departments")
public class Department implements Serializable {

	@Id
	@GeneratedValue
	@Column(name="id")
	private long id;
	
    @Column(nullable = false, unique = true)
    private String name;
    
    @OrderBy("name asc")
    @OneToMany(mappedBy = "department")
    private List<Program> programs;
    
    @OrderBy("name asc")
    @OneToMany(mappedBy = "deptId")
    private List<AdditionalField> additionalField;
    
    @OneToMany(mappedBy="departmentId")
    private List<Application> applicationId; 
    
    public Department()
    {
        programs = new ArrayList<Program>();
    }

    
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Program> getPrograms() {
		return programs;
	}

	public void setPrograms(List<Program> programs) {
		this.programs = programs;
	}


	public List<AdditionalField> getAdditionalField() {
		return additionalField;
	}


	public void setAdditionalField(List<AdditionalField> additionalField) {
		this.additionalField = additionalField;
	}


	public List<Application> getApplicationId() {
		return applicationId;
	}


	public void setApplicationId(List<Application> applicationId) {
		this.applicationId = applicationId;
	}



	
    
}
