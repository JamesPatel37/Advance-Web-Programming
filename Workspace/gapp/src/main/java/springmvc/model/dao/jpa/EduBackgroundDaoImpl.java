package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.EduBackground;
import springmvc.model.dao.EduBackgroundDao;

@Repository
public class EduBackgroundDaoImpl implements EduBackgroundDao{

	 @PersistenceContext
	    private EntityManager entityManager;

	@Override
	public EduBackground getEduBackgrounds(Long id) {
        return entityManager.find( EduBackground.class, id );
	}

	@Override
	public List<EduBackground> getEduBackgrounds() {
		  return entityManager.createQuery( "from EduBackground order by id", EduBackground.class )
		            .getResultList();
	}

	@Override
	@Transactional
	public EduBackground saveEduBackground(EduBackground eb) {
		return entityManager.merge( eb );
	}

	@Override
	@Transactional
	public void removeEduBackground(EduBackground eb) {
		entityManager.remove(eb);
	}

	 
}
