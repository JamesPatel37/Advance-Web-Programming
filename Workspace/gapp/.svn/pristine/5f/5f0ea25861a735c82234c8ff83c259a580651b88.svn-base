package springmvc.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

import springmvc.model.Application;

@Test(groups = "StudentDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class StudentDaoTest extends AbstractTransactionalTestNGSpringContextTests {

	 @Autowired
	 StudentDao studentDao;

	 @Autowired
	 ApplicationDao applicationDao;
	 
	 @Test
	 public void getStudents()
	 {
		 
		 List<Application> appList = applicationDao.getApplications();

		for(Application app : appList) {
			
			//if( app.getUser_Id().getEmail().equals("student1@localhost.localdomain") ){
			//	assert true;
			//}
		}
		 	
		 
	 }
	
}
