package springmvc.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import springmvc.model.Application;
import springmvc.model.Department;
import springmvc.model.Program;
import springmvc.model.Student;
import springmvc.model.Users;
import springmvc.model.dao.ApplicationDao;
import springmvc.model.dao.DepartmentDao;
import springmvc.model.dao.ProgramDao;
import springmvc.model.dao.StudentDao;
import springmvc.model.dao.UsersDao;
import springmvc.web.validator.UserValidator;

@Controller
public class UserController {

	
	@Autowired
	private UsersDao usersDao;
	
	@Autowired
	private UserValidator userValidator;
	
	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private ApplicationDao applicationDao;
	
	@RequestMapping("/user/list.html")
	public String list(ModelMap models)
	{
		//get all users from database and pass them to jsp
		List<Users> users = usersDao.getUsers();

		models.put("users", users);
		
		return "user/list";
	}
	
	@RequestMapping(value="/user/register.html", method = RequestMethod.GET)
	public String register( ModelMap models) {
		
		//models.put( "users", new Users() );
		models.put("student", new Student());
		return "user/register";
	}
	
	@RequestMapping(value="/user/register.html", method = RequestMethod.POST)	
	public String register( @ModelAttribute Student student, BindingResult result) {
	
		userValidator.validate(student, result);
		if( result.hasErrors() ) 
			return "user/register";

		// Save user to database
		//users = usersDao.saveUsers(users);		
		
		studentDao.saveStudent(student);
		
		// redirect to users.list		
		return "redirect:login.html";
	}
	
	@RequestMapping(value = "/user/login.html", method = RequestMethod.GET)
	public String login() {
		
		return "user/login";
	}
	
	@RequestMapping(value="/user/login.html", method= RequestMethod.POST)
	public String login(@RequestParam String username, @RequestParam String password , ModelMap models, ModelMap model2,
			ModelMap model3) {
		
		List<Users> users = usersDao.getUsers();
	
		for(Users user: users) {
			if ( (user.getEmail().equals(username)) && (user.getPassword().equals(password)) ) {
				if (user.getType().equals("admin"))
					return "user/admin";
				else if (user.getType().equals("staff"))
					return "user/staff";
				else if (user.getType().equals("student")) {					
					
					Student student = studentDao.getStudent(user.getId());	
					models.put("student", student);
					
					List<Application> app = applicationDao.getApplications();				
					model2.put("application", app);
										 
					return "student/student";
				}
				else 		
					return "user/login";
			}
		}
		
		return "user/login";
	}
}
