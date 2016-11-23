package springmvc.model.dao;

import java.util.List;

import springmvc.model.Users;

public interface UsersDao {

	 Users getUsers( long studentId );

	 List<Users> getUsers();

	 Users saveUsers( Users users);
	 
	 Users getUserByEmail( String email);
}