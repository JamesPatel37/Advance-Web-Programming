package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.Student;
import springmvc.model.dao.StudentDao;

@Repository
public class StudentDaoImpl implements StudentDao {

	 @PersistenceContext
	    private EntityManager entityManager;

	@Override
	public Student getStudent(long id) {
        return entityManager.find( Student.class, id );
	}

	@Override
	public List<Student> getStudents() {
		  return entityManager.createQuery( "from Student order by id", Student.class )
		            .getResultList();
	}

	@Override
	@Transactional
	public Student saveStudent(Student student) {
		return entityManager.merge(student);
	}

}
