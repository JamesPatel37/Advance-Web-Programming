package springmvc.model.dao;

import java.util.List;

import springmvc.model.AdditionalField;
import springmvc.model.Department;

public interface AdditionalFieldDao {

	AdditionalField getAdditionalFields( Long afId );

	 List<AdditionalField> getAdditionalFields();

	 List<AdditionalField> getAdditionalFieldByDept(Department department);
	 
	 AdditionalField saveAdditionalField (AdditionalField field);

	 void removeAdditionalField(AdditionalField af);

}
