package model;

import java.util.ArrayList;
import java.util.List;

public class SelectOption {

	   public List<String> getItems() {
	        List<String> list = new ArrayList<String>();
	        list.add("Application Incomplete");
	        list.add("Pending Review");
	        list.add("Rejected");
	        list.add("Accepted");
	        list.add("Admission Offer Sent");
	        list.add("Admission Offer Accepted");
	        return list;
	    }
}
