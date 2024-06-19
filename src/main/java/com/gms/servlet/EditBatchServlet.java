package com.gms.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import com.gms.model.Batch;

/**
 * Servlet implementation class EditBatchServlet
 */
public class EditBatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditBatchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		int id = Integer.parseInt(request.getParameter("id"));
//		Configuration config = new Configuration().configure().addAnnotatedClass(Batch.class);
//		SessionFactory sessionFactory = config.buildSessionFactory();
//		Session session = sessionFactory.openSession();
//		try {
//			Batch batch = session.get(Batch.class, id);
//			request.setAttribute("batch", batch);
//			request.getRequestDispatcher("edit-batch").forward(request, response);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		int id = Integer.parseInt(request.getParameter("id"));
		Configuration config = new Configuration().configure().addAnnotatedClass(Batch.class);
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session = sessionFactory.openSession();
		Batch batch = session.get(Batch.class, id);
//		System.out.println(employee.getName());
		request.setAttribute("batch", batch);
		request.getRequestDispatcher("edit-batch.jsp").forward(request, response);
	}

}
