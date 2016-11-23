package springmvc.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

import springmvc.model.Application;

import springmvc.model.dao.DepartmentDao;

@Test(groups = "DepartmentDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class ApplicationDaoTest extends AbstractTransactionalTestNGSpringContextTests {

	 @Autowired
	 DepartmentDao departmentDao;
	
	 @Autowired
	 ApplicationDao applicationDao;
	
	 ProgramDao	programDao;
	 List<Application> appList;
	 
	 @Test
	 public void getDepartments()
	 {

		 List<Application> apps = applicationDao.getApplications();
		 String term = "Fall 2016";
		String dept = "Accounting";
		 for(Application app : apps){
	 		if(app.getTerm().equals(term)){
	 			if(app.getDepartmentId().getName().equals(dept)){
	 				assert true;
	 			}
	 		}

		 }
		 
	 }
	 


}
