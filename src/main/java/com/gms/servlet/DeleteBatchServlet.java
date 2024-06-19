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

/**
 * Servlet implementation class DeleteBatchServlet
 */
public class DeleteBatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBatchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Configuration config = new Configuration().configure().addAnnotatedClass(Batch.class);
		SessionFactory sessionfactory = config.buildSessionFactory();
		Session session = sessionfactory.openSession();
		Transaction transaction = null;
		Batch batch = null;
		try {
			transaction = session.beginTransaction();
			batch = session.get(Batch.class, id);
			if(batch != null) {
				session.delete(batch);
				transaction.commit();
				response.sendRedirect("batch-list.jsp");
			}
		} catch (Exception e) {
			if(transaction == null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

}
