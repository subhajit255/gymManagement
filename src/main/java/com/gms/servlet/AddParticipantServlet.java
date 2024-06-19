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
 * Servlet implementation class AddParticipantServlet
 */
public class AddParticipantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddParticipantServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String name = request.getParameter("name");
//		int batchId = Integer.parseInt(request.getParameter("batch"));
//		String email = request.getParameter("email");
//		long phone = Long.parseLong(request.getParameter("phone"));
//		int age = Integer.parseInt(request.getParameter("age"));
//		int type = 2;
//		Configuration config = new Configuration().configure().addAnnotatedClass(Participant.class).addAnnotatedClass(Batch.class);
//		SessionFactory sessionFactory = config.buildSessionFactory();
//		Session session = sessionFactory.openSession();
//		Batch batch = session.get(Batch.class, batchId);
//		Transaction transaction = null;
//		Participant participant = null;
//		try {
//			participant = new Participant(batch, name, type, email, phone, age, email);
//			session.save(participant);
//			transaction.commit();
//			response.sendRedirect("participant-list.jsp");
//		} catch (Exception e) {
//			if(transaction == null) {
//				transaction.rollback();
//			}
//			e.printStackTrace();
//		}
		String name = request.getParameter("name");
        int batchId = Integer.parseInt(request.getParameter("batch"));
        String email = request.getParameter("email");
        long phone = Long.parseLong(request.getParameter("phone"));
        int age = Integer.parseInt(request.getParameter("age"));
        int type = 2;

        Configuration config = new Configuration().configure()
                                                   .addAnnotatedClass(Participant.class)
                                                   .addAnnotatedClass(Batch.class);
        SessionFactory sessionFactory = config.buildSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = null;
        Participant participant = null;
        try {
            transaction = session.beginTransaction();
            Batch batch = session.get(Batch.class, batchId);
            participant = new Participant(batch, name, type, email, phone, age, email);
            session.save(participant);
            transaction.commit();
            response.sendRedirect("participant-list.jsp");
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
            sessionFactory.close();
        }
	}

}
