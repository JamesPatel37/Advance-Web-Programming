package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.AdditionalField;
import springmvc.model.Department;
import springmvc.model.Program;
import springmvc.model.Users;
import springmvc.model.dao.DepartmentDao;
@Repository
public class DepartmentDaoImpl implements DepartmentDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public Department getDepartment(long id) {
        return entityManager.find( Department.class, id );
	}

	@Override
	public List<Department> getDepartments() {
		  return entityManager.createQuery( "from Department order by id", Department.class )
		            .getResultList();
	}
	
	@Override
	@Transactional
	public Department saveDepartment(Department department) {
		return entityManager.merge(department);
	}

/*	@Override
	public Program getProgramByDepartment(long deptId) {
		
        List<Program> programs = (List<Program>) entityManager.createQuery( "from Program where department_id =:deptId", Program.class )
        		.getResultList();
		
        return (Program) programs;

	}*/

}
