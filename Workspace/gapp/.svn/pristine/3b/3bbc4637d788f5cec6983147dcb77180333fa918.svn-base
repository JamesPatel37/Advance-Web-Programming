package springmvc.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import springmvc.model.Users;
import springmvc.model.dao.UsersDao;

@Repository
public class UsersDaoImpl implements UsersDao{

	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public Users getUsers(Integer id) {
        return entityManager.find( Users.class, id );
	}

	@Override
	public List<Users> getUsers() {
		  return entityManager.createQuery( "from User order by id", Users.class )
		            .getResultList();
	}

	
}
