package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.Department;
import springmvc.model.Program;
import springmvc.model.dao.ProgramDao;

@Repository
public class ProgramDaoImpl implements ProgramDao {

	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public Program getPrograms(Long id) {
        return entityManager.find( Program.class, id );
	}

	@Override
	public List<Program> getPrograms() {
		  return entityManager.createQuery( "from Program order by id", Program.class )
		            .getResultList();
	}

	@Override
	@Transactional
	public Program saveProgram(Program program) {
		return entityManager.merge(program);
	}

    @Override
    public List<Program> getPrograms( Department department )
    {
        String query = "from Program where department = :department "
            + "order by name asc";

        return entityManager.createQuery( query, Program.class )
            .setParameter( "department", department )
            .getResultList();
    }

	@Override
	@Transactional
	public void removeProgram(Program program) {
		
		entityManager.remove(program);
		
	}


/*	@Override
	public List<Program> getPrograms(Department department) {
		String query = "from Program where department = :department "
	            + "order by name asc";

        return entityManager.createQuery( query, Program.class )
            .setParameter( "department", department )
            .getResultList();
	}*/

	
}
