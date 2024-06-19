<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.gms.model.*"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
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
				<h1>Participant</h1>
			</header>
			<%
			Configuration configuration = new Configuration().configure().addAnnotatedClass(Batch.class);
			SessionFactory sessionFact = configuration.buildSessionFactory();
			Session ses = sessionFact.openSession();
			Query query = ses.createQuery("FROM Batch");
			List<Batch> list = query.list();
			%>
			<div class='dashboard-content'>
				<div class='container'>
					<div class='card'>
						<div class='card-header'>
							<h1>Add Participant</h1>
						</div>
						<div class='card-body'>
							<div class="container">
								<form action="AddParticipantServlet" method="post">
									<div class="row mb-3">
										<div class="col-md-6">
											<label for="exampleFormControlTextarea1"
												class="form-label label">Name</label> <input type="text"
												class="form-control" name="name" value="">
										</div>
										<div class="col-md-6">
											<label for="exampleFormControlTextarea1"
												class="form-label label">Batch</label> <select
												class="form-select" aria-label="Default select example" name="batch">
												<option value="">Select Batch</option>
												<%
												  for(Batch batch : list){
												  %>
												<option value="<%=batch.getId() %>"><%=batch.getName() %></option>
												<%
												  } 
												  %>
											</select>
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-md-5">
											<label for="exampleFormControlTextarea1"
													class="form-label label">Email</label> 
													<input type="email"
													class="form-control" name="email" value="">
										</div>
										<div class="col-md-5">
											<label for="exampleFormControlTextarea1"
													class="form-label label">Phone</label> 
													<input type="number" maxlength="10"
													class="form-control" name="phone" value="">
										</div>
										<div class="col-md-2">
											<label for="exampleFormControlTextarea1"
													class="form-label label">Age</label> 
													<input type="number" maxlength="10"
													class="form-control" name="age" value="">
										</div>
									</div>
									<button class="btn btn-warning">Add</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>