package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import springmvc.model.Student;
import springmvc.model.dao.StudentDao;

@Repository
public class StudentDaoImpl implements StudentDao {

	 @PersistenceContext
	    private EntityManager entityManager;

	@Override
	public Student getStudents(Integer id) {
        return entityManager.find( Student.class, id );
	}

	@Override
	public List<Student> getStudents() {
		  return entityManager.createQuery( "from Student order by id", Student.class )
		            .getResultList();
	}


}
