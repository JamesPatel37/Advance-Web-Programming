package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springmvc.model.AdditionalField;
import springmvc.model.Department;
import springmvc.model.Program;
import springmvc.model.dao.AdditionalFieldDao;

@Repository
public class AdditionalFieldDaoImpl implements AdditionalFieldDao {

	 @PersistenceContext
	    private EntityManager entityManager;

	@Override
	public AdditionalField getAdditionalFields(Long id) {
        return entityManager.find( AdditionalField.class, id );
	}

	@Override
	public List<AdditionalField> getAdditionalFields() {
		  return entityManager.createQuery( "from AdditionalField order by id", AdditionalField.class )
		            .getResultList();
	}

	@Override
	public List<AdditionalField> getAdditionalFieldByDept(Department department) {
        String query = "from AdditionalField where deptId = :department "
                + "order by name asc";

            return entityManager.createQuery( query, AdditionalField.class )
                .setParameter( "department", department )
                .getResultList();
	}

	@Override
	@Transactional
	public AdditionalField saveAdditionalField(AdditionalField field) {
		return entityManager.merge(field);
	}

	@Override
	@Transactional
	public void removeAdditionalField(AdditionalField af) {

		entityManager.remove(af);
	}


	 
}
