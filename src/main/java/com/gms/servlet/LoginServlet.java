package com.gms.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.gms.model.Batch;
import com.gms.model.Participant;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// build configuration
		Configuration config = new Configuration().configure().addAnnotatedClass(Participant.class);
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		Participant participant = null;
		try {
			transaction = session.beginTransaction();
			participant = (Participant) session
					.createQuery("FROM Participant WHERE email = :email")
					.setParameter("email", email).uniqueResult();
			if (participant != null && participant.getPassword().equals(password)) {
				transaction.commit();
				HttpSession ses = request.getSession();
				ses.setAttribute("participant", participant);
				//request.getRequestDispatcher("dashboard.jsp").forward(request, response);
				response.sendRedirect("dashboard.jsp");
			}else {
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}

	}

}
