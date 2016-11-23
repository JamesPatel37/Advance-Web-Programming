package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import springmvc.model.AdditionalField;
import springmvc.model.dao.AdditionalFieldDao;

@Repository
public class AdditionalFieldDaoImpl implements AdditionalFieldDao {

	 @PersistenceContext
	    private EntityManager entityManager;

	@Override
	public AdditionalField getAdditionalFields(Integer id) {
        return entityManager.find( AdditionalField.class, id );
	}

	@Override
	public List<AdditionalField> getAdditionalFields() {
		  return entityManager.createQuery( "from AdditionalField order by id", AdditionalField.class )
		            .getResultList();
	}

	 
}
