package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Model;

@WebServlet("/AddNewApplication")
public class AddNewApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Date date = new Date();
	String pattern = "MM/dd/yyyy";
	SimpleDateFormat format = new SimpleDateFormat(pattern);
	String dt = format.format(date);

	Date d1, d2, d3;

	public AddNewApplication() {
        super();

    }
	
	 public void init(ServletConfig config) throws ServletException {
	    	super.init(config);
    	        
	        ArrayList<Model> entries = new ArrayList<Model>();
	        
	        try{
	        	d1 = format.parse("10/21/2015");
	        	d2 = format.parse("3/20/2015");
	        	d3 = format.parse("3/1/2015");
		        entries.add( new Model("John Doe", d1, "10/21/2015", 3.1, "Pending Review"));
		        entries.add( new Model("Jane Doe", d2, "3/20/2015", null , "Application Incomplete"));
		        entries.add( new Model("Amy Smith", d3, "3/1/2015", 3.3, "Accepted"));
		        entries.add( new Model("Shiv", date, dt, 3.7, "Accepted"));
	        } catch (Exception e) {
	        	System.out.println("Error in Date Format");
	        }
	        System.out.println(dt);
	        getServletContext().setAttribute("entries", entries);
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Model> entries = (ArrayList<Model>) getServletContext().getAttribute( "entries" );
		Collections.sort(entries, new Comparator<Model>() {
  		  public int compare(Model o1, Model o2) {
  		      return o1.getDate().compareTo(o2.getDate());
  		  }
		});
		
		Collections.reverse(entries);
      
        getServletContext().setAttribute("entries", entries);

      request.getRequestDispatcher("/Applications.jsp").forward(request, response);
	
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String applicant = request.getParameter("applicant");
		String date = request.getParameter("date");
		String g = request.getParameter("gpa");
		String status = request.getParameter("status");
		
		String errors = "* are mandatory fileds";
		
		//To repopulate the current entry.
		ArrayList currEntry = new ArrayList();
		currEntry.add(applicant);
		currEntry.add(date);
		currEntry.add(g);
		currEntry.add(status);

		Double gpa = 0.0;
		try{
		gpa = Double.parseDouble(g);
		} catch (Exception e) {
			System.out.println("Error" + gpa);
		}

		ArrayList<Model> entries = (ArrayList<Model>) getServletContext().getAttribute( "entries" );

		Date dt;
		try {
			if ( (applicant.trim().length() > 0 && date.length() > 0) && (gpa <= 4.0) && status.trim().length() > 0) 
			{
				dt = format.parse(date);
				if(gpa == 0.0)
					gpa = null;
				entries.add(new Model(applicant, dt, date, gpa, status));
				doGet(request, response);
			}
			else
			{
				//System.out.println("date is empty");
				request.setAttribute("currEntry", currEntry);
				request.setAttribute("errors", errors);
				request.getRequestDispatcher("/AddNewApplication.jsp").forward(request, response);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}

}
