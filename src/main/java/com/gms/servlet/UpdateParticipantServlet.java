package com.gms.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.gms.model.Batch;
import com.gms.model.Participant;

/**
 * Servlet implementation class UpdateParticipantServlet
 */
public class UpdateParticipantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateParticipantServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Long phone = Long.parseLong(request.getParameter("phone"));
		int age = Integer.parseInt(request.getParameter("age"));
		int batchId = Integer.parseInt(request.getParameter("batch"));
		Configuration configuration = new Configuration().configure().addAnnotatedClass(Participant.class).addAnnotatedClass(Batch.class);
		SessionFactory sessionFactory = configuration.buildSessionFactory();
		Session session = sessionFactory.openSession();
		Participant participant = null;
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Batch batch = session.get(Batch.class, batchId);
			participant = session.get(Participant.class, id);
			participant.setName(name);
			participant.setBatch(batch);
			participant.setEmail(email);
			participant.setPhone(phone);
			participant.setAge(age);
			session.update(participant);
			transaction.commit();
			response.sendRedirect("participant-list.jsp");
		} catch (Exception e) {
			if(transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

}
