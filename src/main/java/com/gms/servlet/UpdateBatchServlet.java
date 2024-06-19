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
 * Servlet implementation class UpdateBatchServlet
 */
public class UpdateBatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBatchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		Configuration config = new Configuration().configure().addAnnotatedClass(Batch.class);
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		Batch batch = null;
		try {
			transaction = session.beginTransaction();
			batch = session.get(Batch.class, id);
			batch.setName(name);
			session.update(batch);
			transaction.commit();
			response.sendRedirect("batch-list.jsp");
		}catch(Exception e) {
			if(transaction == null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

}
