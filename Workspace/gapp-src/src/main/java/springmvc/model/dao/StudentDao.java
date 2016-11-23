package springmvc.model.dao;

import java.util.List;

import springmvc.model.Student;

public interface StudentDao {

	 Student getStudents( Integer id );

	 List<Student> getStudents();
}
