package springmvc.model;

import java.io.File;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "additionalField")
public class AdditionalField implements Serializable  {

	@Id
	@GeneratedValue
	@Column(name="id")
	private long id;
	
	@ManyToOne
    @JoinColumn(name="dept_id")
	private Department deptId;
    
    @Column(name="name")
	private String name;
	
    //Type of the field value, which can be Text, Number, or File.
    @Column(name="text")
	private String text;

    @Column(name="number")
	private long number;
    
    @Column(name="file")
	private File file;
	
    @Column(name="required")
	private boolean required;
    
    

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Department getDeptId() {
		return deptId;
	}

	public void setDeptId(Department deptId) {
		this.deptId = deptId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public long getNumber() {
		return number;
	}

	public void setNumber(long number) {
		this.number = number;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public boolean isRequired() {
		return required;
	}

	public void setRequired(boolean required) {
		this.required = required;
	}
    
    
}
