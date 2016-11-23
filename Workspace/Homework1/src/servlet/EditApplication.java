package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Model;

@WebServlet("/EditApplication")
public class EditApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Date date = new Date();
	String pattern = "MM/dd/yyyy";
	SimpleDateFormat format = new SimpleDateFormat(pattern);
	String dt = format.format(date);
	
	ArrayList currEntry = new ArrayList();

    public EditApplication() {
        super();

    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int index = Integer.parseInt( request.getParameter( "index" ) );

		ArrayList<Model> entries = (ArrayList<Model>) getServletContext().getAttribute( "entries" );
      
		currEntry.clear();
		currEntry.add(entries.get(index).getName());
		currEntry.add(entries.get(index).getSdate());
		currEntry.add(entries.get(index).getGpa());
		currEntry.add(entries.get(index).getStatus());
		
		request.setAttribute("currEntry", currEntry);
		request.setAttribute( "entry", entries.get( index ) );
		request.getRequestDispatcher( "/EditApplication.jsp" ).forward(request, response );
	}

	@SuppressWarnings({ "unchecked" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String applicant = request.getParameter( "applicant" );
		String date = request.getParameter("date");
		String g = request.getParameter("gpa");
		String status = request.getParameter("status");
		
		ArrayList<String > errors = new ArrayList<String>();
		
		currEntry.clear();
		currEntry.add(applicant);
		currEntry.add(date);
		currEntry.add(g);
		currEntry.add(status);
		
		Double gpa = -0.01;
		try{
			gpa = Double.parseDouble(g);
		} catch (Exception e) {
			System.out.println("Error in GPA");
		}
	
		int index = Integer.parseInt( request.getParameter( "index" ) );
		
		ArrayList<Model> entries = (ArrayList<Model>) getServletContext().getAttribute( "entries" );
        
		Model entry = entries.get( index );
		
		if (applicant != "") {
			entry.setName( applicant );
		} else {
			errors.add("Name should not be empty. ");
		}
        
        Date dt;
		try {
			if (date != ""){
				dt = format.parse(date);
				entry.setDate( dt );
				entry.setSdate(format.format(dt));
			} else {
				errors.add("Please enter a Valid Date. ");
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	
		
		if ( (gpa >= 0.0) && (gpa <= 4.0) ) {
			entry.setGpa ( gpa );
		} else if (request.getParameter("gpa").isEmpty()) {
			gpa = null;
			entry.setGpa(gpa);
		} else {
			errors.add("GPA must be between 0.0 to 4.0.");
		}
		
		entry.setStatus( status );
		
		
		if (!errors.isEmpty()) { // ( (applicant != "") && (date != "") && (gpa >= 0.0) && (gpa <= 4.0) ) {
			request.setAttribute("errors", errors);
			request.setAttribute("currEntry", currEntry);
			request.getRequestDispatcher("/EditApplication.jsp").forward(request, response);
		} else
		{
			Collections.sort(entries, new Comparator<Model>() {
		  		  public int compare(Model o1, Model o2) {
		  		      return o1.getDate().compareTo(o2.getDate());
		  		  }
			});
				
			Collections.reverse(entries);
			request.setAttribute("currEntry", currEntry);
			request.setAttribute("entries", entries);
			request.getRequestDispatcher("/Applications.jsp").forward(request, response);
		}
	
	}

}
