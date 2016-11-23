package springmvc.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "users")
public class Users implements Serializable {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private long id;
	
	@OneToOne(mappedBy="userId")
	private Student studentId;
	
	@OneToOne(mappedBy="user_Id")
	private Application applicationId;

	@Column(name="user_type")
	private String type;	 // whether international or local student, staff or admin 
    
	@Column(name="lastname")
	private String lastName;
	
    @Column(name="firstname")
    private String firstName;
    
    @Column(name="email")
	private String email;
    
    @Column(name="password")
    private String password;
	
    
    public Users()
    {
    }
    
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
    
	
}
