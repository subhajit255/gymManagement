<%@page import="java.util.List"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="com.gms.model.Batch"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GMS</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class='dashboard'>
		<div class="dashboard-nav">
			<header>
				<a href="#!" class="menu-toggle"><i class="fas fa-bars"></i></a><a
					href="#" class="brand-logo"><i class="fas fa-anchor"></i> <span>GMS</span></a>
			</header>
			<nav class="dashboard-nav-list">
				<a href="dashboard.jsp" class="dashboard-nav-item active"><i
					class="fas fa-tachometer-alt"></i> dashboard </a> <a
					href="batch-list.jsp" class="dashboard-nav-item active"><i
					class="fas fa-tachometer-alt"></i> Batch </a> <a
					href="participant-list.jsp"
					class="dashboard-nav-item dashboard-nav-dropdown-toggle"><i
					class="fas fa-users"></i> Users </a> 
				<a href="LogoutServlet" class="dashboard-nav-item"><i
					class="fas fa-sign-out-alt"></i> Logout </a>
			</nav>
		</div>
		<div class='dashboard-app'>
			<header class='dashboard-toolbar'>
				<!-- <a href="#!" class="menu-toggle"><i class="fas fa-bars"></i></a> -->
				<h3 class="fw-3">Batch List</h3>
			</header>
			<div class='dashboard-content'>
				<div class='container'>
					<a class="btn btn-primary add-batch-button" href="add-batch.jsp">Add
						Batch</a>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Sl No.</th>
								<th>name</th>
								<th>Action</th>
							</tr>
						</thead>
						<%
						Configuration configuration = new Configuration().configure().addAnnotatedClass(Batch.class);
						SessionFactory sessionFactory = configuration.buildSessionFactory();
						Session ses = sessionFactory.openSession();
						Query query = ses.createQuery("FROM Batch");
						List<Batch> list = query.list();
						int index = 1;
						if (list.size() != 0) {
							for (Batch data : list) {
						%>
						<tbody>
							<tr>
								<td><%=index%></td>
								<td><%=data.getName()%></td>
								<td><a href="EditBatchServlet?id=<%=data.getId()%>"
									class="btn btn-primary">Edit</a> <a
									href="DeleteBatchServlet?id=<%=data.getId()%>"
									class="btn btn-danger">Delete</a></td>
							</tr>

							<%
							index++;
							}
							} else {
							%>
							<tr>
								<td colspan="3" class="text-center">No Data Found</td>
							<tr>
								<%
								}
								%>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>