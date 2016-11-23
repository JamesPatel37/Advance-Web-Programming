package springmvc.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springmvc.model.AdditionalField;
import springmvc.model.Department;
import springmvc.model.Program;
import springmvc.model.dao.AdditionalFieldDao;
import springmvc.model.dao.DepartmentDao;
import springmvc.model.dao.ProgramDao;

@Controller
public class AdminController {

	@Autowired
	public DepartmentDao departmentDao;
	
	@Autowired
	public ProgramDao programDao;
	
	@Autowired
	public AdditionalFieldDao additionalFieldDao;
		
	@RequestMapping("/user/department.html")
	public String departments(ModelMap models, ModelMap model2 , ModelMap model3) {
		
		List<Department> departments = departmentDao.getDepartments();
		List<Program> programs = programDao.getPrograms();

		models.put("departments", departments);
		model2.put("programs", programs);
		
		return "user/department";
	}
	
	@RequestMapping("/user/detail.html")
	public String details(ModelMap models, ModelMap model2 , ModelMap model3) {
		
		List<Department> departments = departmentDao.getDepartments();
		List<Program> programs = programDao.getPrograms();
		List<AdditionalField> additionalFieldList= additionalFieldDao.getAdditionalFields();
		
		models.put("departments", departments);
		model2.put("programs", programs);
		model3.put("additionalFieldList", additionalFieldList);
		
		return "user/detail";
	}
	
	@RequestMapping(value = "/user/addDepartment.html", method = RequestMethod.GET)
	public String addDepartment(ModelMap models) {
		
		List<Department> departments = departmentDao.getDepartments();
		models.put("departments", departments); 
		
		return "user/addDepartment";
	}
	
	@RequestMapping(value = "/user/addDepartment.html", method = RequestMethod.POST)
	public String addDepartment(@RequestParam String department, ModelMap models, ModelMap model2 , ModelMap model3) {
		
		List<Department> departments = departmentDao.getDepartments();
		List<Program> programs = programDao.getPrograms();
		List<AdditionalField> additionalFieldList = additionalFieldDao.getAdditionalFields();
		
		if(department.isEmpty()) {
			return "user/addDepartment";
		}
		
		for (Department dep : departments) {
			if(dep.getName().equals(department)){
				return "user/addDepartment";
			}
		}
		
		//add new department
		Department dept = new Department();
		dept.setName(department);
		departments.add(dept);
		//save new department to database
		departmentDao.saveDepartment(dept);
		
		models.put("departments", departments);
		model2.put("programs", programs);
		model3.put("additionalFieldList", additionalFieldList);
		
		return "redirect:department.html";
	}
	
	@RequestMapping(value="/user/addProgram.html", method = RequestMethod.GET)
	public String addProgram() {
		
		return "user/addDepartment";
	}
	
	@RequestMapping(value="/user/addProgram.html", method = RequestMethod.POST)
	public String addProgram(@RequestParam String department, @RequestParam String program) {
		
		List<Department> departments = departmentDao.getDepartments();
		long deptId = 0;
		Program prog = new Program();
			
		boolean contains = false;
		for(Department dept: departments) {
			if (dept.getName().equals(department)) {
				contains = true;
				deptId = dept.getId();
			}
		}
		
		if(contains) {
			prog.setName(program);
			prog.setDepartment(departmentDao.getDepartment(deptId));
		}
		programDao.saveProgram(prog);
		
		return "redirect:department.html";
	}
	

	@RequestMapping(value="/user/addAdditionalField.html", method = RequestMethod.GET)
	public String addAdditionalField() {
		
		return "user/addDepartment";
	}

	@RequestMapping(value="/user/addAdditionalField.html", method = RequestMethod.POST)
	public String addAdditionalField(@RequestParam String department, @RequestParam String addReq) {
		
		List<Department> departments = departmentDao.getDepartments();
		long deptId = 0;
		AdditionalField af = new AdditionalField();
			
		boolean contains = false;
		for(Department dept: departments) {
			if (dept.getName().equals(department)) {
				contains = true;
				deptId = dept.getId();
			}
		}
		
		if(contains) {
			af.setName(addReq);
			af.setRequired(true);
			af.setDeptId(departmentDao.getDepartment(deptId));;
		}
		additionalFieldDao.saveAdditionalField(af);
		
		return "redirect:department.html";	
	}
	
	@RequestMapping(value="/user/editDepartment/{id}.html" , method = RequestMethod.GET)
	public String editDepartment(@PathVariable Integer id, ModelMap model) {
		
		Department department = departmentDao.getDepartment(id);	
		model.put("department", department);
		return "user/editDepartment";
	}
	
	@RequestMapping(value="/user/editDepartment/{id}.html", method = RequestMethod.POST)
	public String editDepartment(@PathVariable Integer id, @RequestParam String name, ModelMap model) {
		
		if(name.isEmpty()) {
			Department department = departmentDao.getDepartment(id);	
			model.put("department", department);
			return "user/editDepartment";
		}
		
		Department department = departmentDao.getDepartment(id);	
		
		department.setName(name);
		department.setId(id);
		departmentDao.saveDepartment(department);

		return "redirect:/user/detail.html";
	}
	
	@RequestMapping(value="/user/editProgram/{id}.html" , method = RequestMethod.GET)
	public String editProgram(@PathVariable Integer id, ModelMap model, ModelMap model2) {

		Department department = departmentDao.getDepartment(id);
		model.put("department", department);
		
		List<Program> programs = programDao.getPrograms(departmentDao.getDepartment(id));
		model2.put("programs", programs);
		return "user/editProgram";
	}
	
	@RequestMapping(value="/user/editProgram/{id}.html", method = RequestMethod.POST)
	public String editProgram(@PathVariable Integer id, @RequestParam String department, @RequestParam String program) {

		if (program.isEmpty()) {
			return "redirect:/user/editProgram/{id}.html";
		}
		
		List<Department> departments = departmentDao.getDepartments();
		long deptId = 0;
		Program prog = new Program();
			
		boolean contains = false;
		for(Department dept: departments) {
			if (dept.getName().equals(department)) {
				contains = true;
				deptId = dept.getId();
			}
		}
		
		if(contains) {
			prog.setName(program);
			prog.setDepartment(departmentDao.getDepartment(deptId));
		}
		programDao.saveProgram(prog);
		
		return "redirect:/user/editProgram/{id}.html";
	}
	
	@RequestMapping(value="/user/editProgram/{deptId}/{programId}.html", method = RequestMethod.GET)
	public String removeProgram(@PathVariable Long deptId, @PathVariable Long programId,  ModelMap model, ModelMap model2) {
	
		//programId = progId;
		Program program = programDao.getPrograms(programId);
		programDao.removeProgram(program);
		
		Department department = departmentDao.getDepartment(deptId);
		model.put("department", department);
		
		List<Program> programs = programDao.getPrograms(departmentDao.getDepartment(deptId));
		model2.put("programs", programs);
		
		return "redirect:/user/editProgram/" + deptId +".html";
	}
	
	@RequestMapping(value="/user/editAdditionalField/{id}.html", method = RequestMethod.GET)
	public String editAdditionalField(@PathVariable Integer id, ModelMap model, ModelMap model2) {
		
		Department department = departmentDao.getDepartment(id);
		model.put("department", department);
		
		List<AdditionalField> af = additionalFieldDao.getAdditionalFieldByDept(department);
		model2.put("af", af);
		
		return "user/editAdditionalField";
	}
	
	@RequestMapping(value="/user/editAdditionalField/{id}.html", method = RequestMethod.POST)
	public String editAdditionalField(@PathVariable Integer id, @RequestParam String department, @RequestParam String addReq) {
		
		if(addReq.isEmpty()) {
			return "redirect:/user/editAdditionalField/{id}.html";
		}
		
		List<Department> departments = departmentDao.getDepartments();
		long deptId = 0;
		AdditionalField af = new AdditionalField();
			
		boolean contains = false;
		for(Department dept: departments) {
			if (dept.getName().equals(department)) {
				contains = true;
				deptId = dept.getId();
			}
		}
		
		if(contains) {
			af.setName(addReq);
			af.setRequired(true);
			af.setDeptId(departmentDao.getDepartment(deptId));;
		}
		additionalFieldDao.saveAdditionalField(af);
		
		return "redirect:/user/editAdditionalField/{id}.html";
	}
	
	@RequestMapping(value="/user/editAdditionalField/{deptId}/{afId}.html", method = RequestMethod.GET)
	public String removeAdditionalField(@PathVariable Long deptId, @PathVariable Long afId,  ModelMap model, ModelMap model2) {
	
		AdditionalField aff = additionalFieldDao.getAdditionalFields(afId);
		additionalFieldDao.removeAdditionalField(aff);
		
		Department department = departmentDao.getDepartment(deptId);
		model.put("department", department);
		
		List<AdditionalField> af = additionalFieldDao.getAdditionalFieldByDept(departmentDao.getDepartment(deptId));
		model2.put("af", af);
		
		return "redirect:/user/editAdditionalField/" + deptId +".html";
	}
}
