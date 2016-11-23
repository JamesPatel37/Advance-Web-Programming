package springmvc.model.dao;

import java.util.List;

import springmvc.model.EduBackground;

public interface EduBackgroundDao {

	EduBackground getEduBackgrounds( Long ebId );

	 List<EduBackground> getEduBackgrounds();

	 EduBackground saveEduBackground(EduBackground eb);
	 
	 void removeEduBackground (EduBackground eb);
}
