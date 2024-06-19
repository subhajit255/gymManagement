<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.gms.model.Participant"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.util.List"%>
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
					class="fas fa-tachometer-alt"></i> Batch </a>
				<div class='dashboard-nav-list'>
					<a href="participant-list.jsp"
						class="dashboard-nav-item dashboard-nav-dropdown-toggle"><i
						class="fas fa-users"></i> Users </a>
				</div>
				<a href="LogoutServlet" class="dashboard-nav-item"><i
					class="fas fa-sign-out-alt"></i> Logout </a>
			</nav>
		</div>
		<div class='dashboard-app'>
			<header class='dashboard-toolbar'>
				<!-- <a href="#!" class="menu-toggle"><i class="fas fa-bars"></i></a> -->
				<h3 class="fw-3">Participant List</h3>
			</header>
			<%
			Configuration configuration = new Configuration().configure().addAnnotatedClass(Participant.class);
			SessionFactory sessionFactory = configuration.buildSessionFactory();
			Session ses = sessionFactory.openSession();
			Query query = ses.createQuery("From Participant WHERE type = 2");
			List<Participant> list = query.list();
			%>
			<div class='dashboard-content'>
				<div class='container'>
					<a class="btn btn-primary add-batch-button"
						href="add-participant.jsp">Add Participant</a>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Sl No.</th>
								<th>name</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Batch</th>
								<th>Action</th>
							</tr>
						</thead>
						<%
						int index = 1;
						if (list.size() != 0) {
							for (Participant participant : list) {
						%>
						<tbody>
							<tr>
								<td><%=index%></td>
								<td><%=participant.getName()%></td>
								<td><%=participant.getEmail()%></td>
								<td><%=participant.getPhone()%></td>
								<td><%=participant.getBatch().getName()%></td>
								<td><a
									href="EditParticipantServlet?id=<%=participant.getId()%>"
									class="btn btn-primary">Edit</a> <a
									href="DeleteParticipantServlet?id=<%=participant.getId()%>"
									class="btn btn-danger">Delete</a></td>
							</tr>

							<%
							index++;
							}
							} else {
							%>
							<tr>
								<td colspan="6" class="text-center">No Data Found</td>
							<tr>
								<%
								}
								%>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
</body>
</html>