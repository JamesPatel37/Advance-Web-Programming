package springmvc.model.dao;

import java.util.List;

import springmvc.model.Department;
import springmvc.model.Program;

public interface ProgramDao {

	Program getPrograms( Long programId );

	List<Program> getPrograms();
	
	Program saveProgram(Program program);

    List<Program> getPrograms( Department department );
    
    void removeProgram(Program program);


}
