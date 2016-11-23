package springmvc.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import springmvc.model.AdditionalField;
import springmvc.model.AppStatus;
import springmvc.model.Application;
import springmvc.model.Department;
import springmvc.model.EduBackground;
import springmvc.model.Program;
import springmvc.model.Student;
import springmvc.model.Users;
import springmvc.model.dao.AdditionalFieldDao;
import springmvc.model.dao.AppStatusDao;
import springmvc.model.dao.ApplicationDao;
import springmvc.model.dao.DepartmentDao;
import springmvc.model.dao.EduBackgroundDao;
import springmvc.model.dao.ProgramDao;
import springmvc.model.dao.StudentDao;
import springmvc.model.dao.UsersDao;

@Controller
public class StudentController {


	@Autowired
	public UsersDao usersDao;
	
	@Autowired
	public ApplicationDao applicationDao;
	
	@Autowired
	public StudentDao studentDao;
	
	@Autowired
	public DepartmentDao departmentDao;
	
	@Autowired
	public ProgramDao programDao;
	
	@Autowired
	private EduBackgroundDao eduBackgroundDao;
	
	@Autowired
	public AppStatusDao appStatusDao;
	
	@Autowired
	private ServletContext context;
	
	@Autowired
	public AdditionalFieldDao additionalFieldDao;
	
	

	@RequestMapping(value="/student/student.html", method={RequestMethod.GET, RequestMethod.POST})
	public String student (@RequestParam Student student, ModelMap models, ModelMap model2) {
		
		long studentId = student.getId();
		List<Application> app = applicationDao.getApplications();
		for (Application a : app) {
			if (a.getUserId().getId() == studentId)
				model2.put("application", app);
		}
		models.put("student", student);
		
		return "student/student";
	}
	
	@RequestMapping("/student/appDetail.html")
	public String appDetail (@RequestParam long studentId, ModelMap models, ModelMap model2, ModelMap model3) {
		Student student = studentDao.getStudent(studentId);
		models.put("student", student);

		List<Application> app = applicationDao.getApplications();
		model2.put("application", app);
		
		List<EduBackground> eduBack = eduBackgroundDao.getEduBackgrounds();
		model3.put("eduBackground", eduBack);
		return "student/appDetail";
	}
	
	
	
	
	@RequestMapping("/student/ajax.html")
	public String ajax(@RequestParam String department, HttpServletResponse response) throws IOException{
		
		List<Program> programs = programDao.getPrograms();
        String json = null;
        List<String> programNames = new ArrayList<String>();
		
        for(Program prog: programs ) {
			
			if(prog.getDepartment().getName().equals(department)){
				programNames.add(prog.getName());
			}
		}
    
		json = new Gson().toJson(programNames);

		 response.setContentType("application/json");
         response.getWriter().write(json);
		return null;
	}
	
	
	
	
	
	@RequestMapping(value="/student/addApplication.html", method = RequestMethod.GET)
	public String addApplication(@RequestParam long studentId, ModelMap model, ModelMap model2, ModelMap model3,
			ModelMap model4, ModelMap model5) {
		
		Student student = studentDao.getStudent(studentId);
		model.put("student", student);
		
		List<Department> department = departmentDao.getDepartments();
		model2.put("department", department);
		
		List<Program> program = programDao.getPrograms();
		model3.put("program", program);
		
		model4.put("eduBackground", eduBackgroundDao.getEduBackgrounds());
		model5.put("additionalFields", additionalFieldDao.getAdditionalFields());
		
		return "student/addApplication";
	}	

	@RequestMapping(value="/student/addApplication.html", method = RequestMethod.POST)
	public String addApplication(@RequestParam long studentId, @RequestParam(required=false) Long appId,
			@RequestParam String department, @RequestParam String program , @RequestParam String term , 
			@RequestParam(required=false) String lastName, @RequestParam(required=false) String firstName,
			@RequestParam(required=false) long cin, @RequestParam(required=false) long phone, @RequestParam(required=false) String gender,
			@RequestParam(required=false) String birthday, @RequestParam(required=false) String citizenship, 
			@RequestParam(required=false) long toefl, @RequestParam(required=false) long gre, @RequestParam(required=false) double gpa,
			@RequestParam MultipartFile file, 
			@RequestParam String action,
			ModelMap models, ModelMap model2, ModelMap model3) throws IllegalStateException, IOException, java.text.ParseException {
		
		SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd");
				
		Department dept = null;
		for(Department d: departmentDao.getDepartments()) {
			if (d.getName().equals(department))
				dept = d;
		}
		
		Program prog = null;
		for(Program p: programDao.getPrograms()) {
			if (p.getName().equals(program))
				prog = p;
		}
		
		
		// Add entries to student table.
		Student student = studentDao.getStudent(studentId);
		
			student.setCin(cin);
			student.setPhone(phone);
			student.setGender(gender);	
			student.setBirthday(formatter.parse(birthday));

/*			try {
				if(birthday != null){
					student.setBirthday(formatter.parse(birthday));
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}*/
			student.setCitizenship(citizenship);
			
			if(firstName != null)
				student.setFirstName(firstName);
			if(lastName != null)
				student.setLastName(lastName);
			
			studentDao.saveStudent(student);
		
			

		// Add entries to application table.
		if( appId != null)
		{
			Application editedApp = applicationDao.getApplications(appId);
			editedApp.setProgramId(prog);
			editedApp.setDate(new Date());
			editedApp.setTerm(term);	
			editedApp.setToefl(toefl);
			editedApp.setGre(gre);
			editedApp.setGpa(gpa);

			if( !file.isEmpty()){
				file.transferTo(new File(getFileDirectory(), file.getOriginalFilename()) );
				editedApp.setTranscript(file.getOriginalFilename());
			}
			
			if(action.equals("Save"))
				editedApp.setSubmitted(false);
			else if(action.equals("Submit"))
				editedApp.setSubmitted(true);
			
			applicationDao.saveApplication(editedApp);
		}
		else 
		{
			Application application = new Application();
			application.setDepartmentId(dept);
			application.setProgramId(prog);
			application.setUserId(student);
			application.setDate(new Date());
			application.setTerm(term);			
			application.setToefl(toefl);
			application.setGre(gre);
			application.setGpa(gpa);
			
			file.transferTo(new File(getFileDirectory(), file.getOriginalFilename()) );
			application.setTranscript(file.getOriginalFilename());

			if(action.equals("Save"))
				application.setSubmitted(false);
			else if(action.equals("Submit"))
				application.setSubmitted(true);
			
			applicationDao.saveApplication(application);
		}

		
			Student stud = studentDao.getStudent(studentId);
			models.put("student", stud);

			List<Application> app = applicationDao.getApplications();
			model2.put("application", app);
			
			List<EduBackground> eduBack = eduBackgroundDao.getEduBackgrounds();
			model3.put("eduBackground", eduBack);
			
		return "student/appDetail";
	}
	
	
	
	
	
	
	@RequestMapping(value="/student/addEduBackground.html", method = RequestMethod.GET)
	public String addEduBackground(@RequestParam long studentId,
			ModelMap model, ModelMap model1, ModelMap model2) {
		
		model1.put("student", studentDao.getStudent(studentId));
		model2.put("eduBack", eduBackgroundDao.getEduBackgrounds());
		
		model.put("eduBackground", new EduBackground());
		
		return "student/AddEduBackground";
	}
	
	@RequestMapping(value="/student/addEduBackground.html", method = RequestMethod.POST)
	public String addEduBackground(@ModelAttribute EduBackground eduBackground, 
			BindingResult result, @RequestParam long studentId, ModelMap model1, ModelMap model2, ModelMap model3,
			ModelMap model4, ModelMap model5, ModelMap model6) {

		eduBackground.setTimePeriod1(new Date());
		eduBackground.setTimePeriod2(new Date());
		eduBackground.setUserId(usersDao.getUsers(studentId));
		eduBackground = eduBackgroundDao.saveEduBackground(eduBackground);
		
		model1.put("student", studentDao.getStudent(studentId));
		model3.put("eduBackground", eduBackgroundDao.getEduBackgrounds());
		
		return "redirect:/student/addApplication.html?studentId="+studentId;
	}
	
	@RequestMapping(value="/student/removeEB.html", method = RequestMethod.GET)
	public String removeEB(@RequestParam Long ebId, @RequestParam long studentId,
			ModelMap model1, ModelMap model2, ModelMap model3, ModelMap model4, ModelMap model5, ModelMap model6) {
		
		EduBackground eb = eduBackgroundDao.getEduBackgrounds(ebId);
		eduBackgroundDao.removeEduBackground(eb);
		
		model1.put("student", studentDao.getStudent(studentId));
		model3.put("eduBackground", eduBackgroundDao.getEduBackgrounds());

		return "redirect:/student/addApplication.html?studentId="+studentId;
	}
	
	
	
	
	
	
	@RequestMapping(value="/student/editApplication.html", method = RequestMethod.GET)
	public String editApplication(@RequestParam long studentId, ModelMap models, ModelMap model2, ModelMap model3) {
		Student student = studentDao.getStudent(studentId);
		models.put("student", student);

		List<Application> app = applicationDao.getApplications();

		for(Application a: applicationDao.getApplications()){
			if(a.isSubmitted()) {
				app.remove(a);
			}
		}
		model2.put("application", app);
		
		List<EduBackground> eduBack = eduBackgroundDao.getEduBackgrounds();
		model3.put("eduBackground", eduBack);
		return "student/editApplication";
	}
	
	@RequestMapping(value="/student/editApplication2.html", method = RequestMethod.GET)
	public String editApplication(@RequestParam long appId, @RequestParam long studentId, ModelMap models, ModelMap model2, ModelMap model3,
			ModelMap model4, ModelMap model5, ModelMap model6) {
		
		System.out.println("appId " + appId);
				
		Student student = studentDao.getStudent(studentId);
		models.put("student", student);
			
		Application app = applicationDao.getApplications(appId);
		model2.put("application", app);
		
		List<EduBackground> eduBack = eduBackgroundDao.getEduBackgrounds();
		model3.put("eduBackground", eduBack);
		
		Department department = app.getDepartmentId();
		model4.put("department", department);
		
		Program program = app.getProgramId();
		model5.put("program", program);
		model6.put("programs", department.getPrograms());
		
		return "student/editApp";
	}	
	
	
	
	
	
	
	@RequestMapping(value="/student/editEduBackground/{appId}.html", method = RequestMethod.GET)
	public String editEduBackground(@RequestParam long studentId, @PathVariable long appId,
			ModelMap model, ModelMap model1, ModelMap model2, ModelMap model3) {

		model1.put("student", studentDao.getStudent(studentId));
		model2.put("application", applicationDao.getApplications(appId));
		model3.put("eduBack", eduBackgroundDao.getEduBackgrounds());		
		
		model.put("eduBackground", new EduBackground());
		
		return "student/editEduBackground";
	}
	
	@RequestMapping(value="/student/editEduBackground/{appId}.html", method = RequestMethod.POST)
	public String editEduBackground(@PathVariable long appId, @ModelAttribute EduBackground eduBackground, 
			BindingResult result, @RequestParam long studentId, ModelMap model1, ModelMap model2, ModelMap model3,
			ModelMap model4, ModelMap model5, ModelMap model6) {
		
		eduBackground.setTimePeriod1(new Date());
		eduBackground.setTimePeriod2(new Date());
		eduBackground.setUserId(usersDao.getUsers(studentId));
		eduBackground = eduBackgroundDao.saveEduBackground(eduBackground);
		
		model1.put("student", studentDao.getStudent(studentId));
		model2.put("application", applicationDao.getApplications(appId));
		model3.put("eduBackground", eduBackgroundDao.getEduBackgrounds());
		model4.put("department", applicationDao.getApplications(appId).getDepartmentId());
		model5.put("program", applicationDao.getApplications(appId).getProgramId());
		model6.put("programs", applicationDao.getApplications(appId).getDepartmentId().getPrograms());
		
		return "redirect:/student/editApplication2.html?appId={appId}&studentId="+studentId;
	}

	@RequestMapping(value="/student/removeEduBack/{appId}/{ebId}.html", method = RequestMethod.GET)
	public String removeEduBack(@PathVariable Long appId, @PathVariable Long ebId, @RequestParam long studentId,
			ModelMap model1, ModelMap model2, ModelMap model3, ModelMap model4, ModelMap model5, ModelMap model6) {
		
		EduBackground eb = eduBackgroundDao.getEduBackgrounds(ebId);
		eduBackgroundDao.removeEduBackground(eb);
		
		model1.put("student", studentDao.getStudent(studentId));
		model2.put("application", applicationDao.getApplications(appId));
		model3.put("eduBackground", eduBackgroundDao.getEduBackgrounds());
		model4.put("department", applicationDao.getApplications(appId).getDepartmentId());
		model5.put("program", applicationDao.getApplications(appId).getProgramId());
		model6.put("programs", applicationDao.getApplications(appId).getDepartmentId().getPrograms());
		return "redirect:/student/editApplication2.html?appId={appId}&studentId="+ studentId;
	}
	
	
	
	
	
	public File getFileDirectory () {
		String path = context.getRealPath( "WEB-INF/files" );
		return new File(path);
	}
	
	
	@RequestMapping(value = "/student/upload.html",  method = RequestMethod.GET)
	public String upload(@RequestParam long studentId, ModelMap models) {
		
		Student student = studentDao.getStudent(studentId);
		models.put("student", student);
		return "student/upload";
	}
	@RequestMapping(value = "/student/upload.html",  method = RequestMethod.POST)
	public String upload (@RequestParam MultipartFile file) throws IllegalStateException, IOException {
		
		file.transferTo( new File( getFileDirectory(), file.getOriginalFilename() ) );
		return "student/student";
	}

	
	@RequestMapping("/student/download.html")
	public String download( HttpServletResponse response, @RequestParam String name) throws IOException {
		
		response.setContentType( "text/plain" );
		response.setHeader("Content-Disposition", "inline; filename=name");
		
		//read in the file
		FileInputStream in = new FileInputStream( new File(getFileDirectory(),name) );
		OutputStream out = response.getOutputStream();
		
		//write it to response
		byte buffer[] = new byte[2048];
		int bytesRead;
		while( (bytesRead = in.read(buffer)) > 0 )
			out.write( buffer, 0, bytesRead );
		
		in.close();
		
		return null;
	}
	
/*	@RequestMapping(value = "/student/newUpload.html",  method = RequestMethod.GET)
	public String newUpload() {
		return "student/upload";
	}
	@RequestMapping(value = "/student/newUpload.html",  method = RequestMethod.POST)
	public String newUpload (@RequestParam MultipartFile file, ModelMap model, ModelMap model2) throws IllegalStateException, IOException {
		model.put("fileName", file.getOriginalFilename());
		model.put("file", file);
		file.transferTo( new File( getFileDirectory(), file.getOriginalFilename() ) );
		
		
		return "student/addApplication";
	}
	
	
	@RequestMapping("/student/download.html")
	public String download( HttpServletResponse response, @RequestParam String name) throws IOException {
		
		response.setContentType( "text/plain" );
		response.setHeader("Content-Disposition", "inline; filename=name");
		
		//read in the file
		FileInputStream in = new FileInputStream( new File(getFileDirectory(),name) );
		OutputStream out = response.getOutputStream();
		
		//write it to response
		byte buffer[] = new byte[2048];
		int bytesRead;
		while( (bytesRead = in.read(buffer)) > 0 )
			out.write( buffer, 0, bytesRead );
		
		in.close();
		
		return null;
	}
*/

}
