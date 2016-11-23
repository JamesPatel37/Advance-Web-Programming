package springmvc.model.dao;

import java.util.List;

import springmvc.model.AdditionalField;

public interface AdditionalFieldDao {

	AdditionalField getAdditionalFields( Integer id );

	 List<AdditionalField> getAdditionalFields();

}
