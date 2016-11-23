package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import springmvc.model.Program;
import springmvc.model.dao.ProgramDao;

@Repository
public class ProgramDaoImpl implements ProgramDao {

	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public Program getPrograms(Integer id) {
        return entityManager.find( Program.class, id );
	}

	@Override
	public List<Program> getPrograms() {
		  return entityManager.createQuery( "from Program order by id", Program.class )
		            .getResultList();
	}

	
}
