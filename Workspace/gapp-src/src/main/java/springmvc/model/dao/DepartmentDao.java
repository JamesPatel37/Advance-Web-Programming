package springmvc.model.dao;

import java.util.List;

import springmvc.model.Department;

public interface DepartmentDao {

	Department getDepartments( Integer id );

	 List<Department> getDepartments();

}
