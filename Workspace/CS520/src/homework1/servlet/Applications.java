package homework1.servlet;

import java.io.IOException;
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

import homework1.model.Model;

@WebServlet("/homework1/Applications")
public class Applications extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String pattern = "MM/dd/yyyy";
	SimpleDateFormat format = new SimpleDateFormat(pattern);

	Date date = new Date();
	String dt = format.format(date);
	Date d1, d2, d3;

	public Applications() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);

		ArrayList<Model> entries = new ArrayList<Model>();

		try {
			d1 = format.parse("10/21/2015");
			d2 = format.parse("3/20/2015");
			d3 = format.parse("3/1/2015");
			entries.add(new Model("John Doe", d1, "10/21/2015", 3.1, "Pending Review"));
			entries.add(new Model("Jane Doe", d2, "3/20/2015", null, "Application Incomplete"));
			entries.add(new Model("Amy Smith", d3, "3/1/2015", 3.3, "Accepted"));
			entries.add(new Model("Shiv", date, dt, 3.7, "Accepted"));

			Collections.sort(entries, new Comparator<Model>() {
				public int compare(Model o1, Model o2) {
					return o1.getDate().compareTo(o2.getDate());
				}
			});
			Collections.reverse(entries);

		} catch (Exception e) {
			System.out.println("Error in Date Format");
		}
		System.out.println(dt);
		getServletContext().setAttribute("entries", entries);

	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<Model> entries = (ArrayList<Model>) getServletContext().getAttribute("entries");

		String index = request.getParameter("id");

		int id = 0;
		try {
			id = Integer.parseInt(index);
		} catch (Exception e) {
			System.out.println("Index Error");
		}

		if (id == 1) {
			Collections.sort(entries, new Comparator<Model>() {
				public int compare(Model o1, Model o2) {
					return o1.getName().compareTo(o2.getName());
				}
			});
		} else if (id == 2) {

			Collections.sort(entries, new Comparator<Model>() {
				public int compare(Model o1, Model o2) {
					if (o2.getGpa() == null) {
						return (o1.getGpa() == null) ? 0 : -1;
					}
					if (o1.getGpa() == null) {
						return 1;
					}
					return o2.getGpa().compareTo(o1.getGpa());
				}
			});

		} else if (id == 3) {
			Collections.sort(entries, new Comparator<Model>() {
				public int compare(Model o1, Model o2) {
					return o1.getStatus().compareTo(o2.getStatus());
				}
			});
		} else {
			System.out.println();
		}

		if (id == 2) {
			// Collections.reverse(entries);
		}

		request.setAttribute("entries", entries);
		request.getRequestDispatcher("Applications.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

// http://www.allmyscripts.com/Table_Sort/#how_to_use_it*/