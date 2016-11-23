package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.AppStatus;
import springmvc.model.dao.AppStatusDao;

@Repository
public class AppStatusDaoImpl implements AppStatusDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public AppStatus getAppStatus(Integer id) {
        return entityManager.find( AppStatus.class, id );
	}

	@Override
	public List<AppStatus> getAppStatus() {
		return entityManager.createQuery( "from AppStatus order by id", AppStatus.class )
	            .getResultList();
	}

	@Override
	@Transactional
	public AppStatus saveAppStatus(AppStatus appStatus) {
		return entityManager.merge( appStatus );
	}

}
