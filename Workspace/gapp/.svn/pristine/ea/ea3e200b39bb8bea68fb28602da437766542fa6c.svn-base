package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import springmvc.model.Application;
import springmvc.model.dao.ApplicationDao;

@Repository
public class ApplicationDaoImpl implements ApplicationDao {

	 @PersistenceContext
	    private EntityManager entityManager;

	@Override
	public Application getApplications(Integer id) {
        return entityManager.find( Application.class, id );
	}

	@Override
	public List<Application> getApplications() {
		  return entityManager.createQuery( "from Application order by id", Application.class )
		            .getResultList();
	}
	 
}
