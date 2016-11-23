package model;

import java.util.Date;

public class Model {

	public String name;
	public Date date;
	public String sdate;
	public Double gpa;
	public String status;
	
	public Model(String name, Date date, String sdate, Double gpa, String status) {
		super();
		this.name = name;
		this.date = date;
		this.sdate = sdate;
		this.gpa = gpa;
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public Double getGpa() {
		return gpa;
	}

	public void setGpa(Double gpa) {
		this.gpa = gpa;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
}
