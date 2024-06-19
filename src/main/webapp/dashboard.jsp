<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.gms.model.Participant" %>
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
				<a href="participant-list.jsp"
					class="dashboard-nav-item dashboard-nav-dropdown-toggle"><i
					class="fas fa-users"></i> Users </a>
				<a href="LogoutServlet" class="dashboard-nav-item"><i
					class="fas fa-sign-out-alt"></i> Logout </a>
			</nav>
		</div>
		<%
		/* Participant participant = (Participant) request.getAttribute("participant");
		if (participant == null) {
			out.println("No Data Found");
			return;
		} */
		HttpSession sess = request.getSession(false);
	    Participant participant = null;
	    if (session != null) {
	        participant = (Participant) session.getAttribute("participant");
	    }
	    if (participant == null) {
	        response.sendRedirect("index.jsp"); // Redirect to the login page if the participant is not found in the session
	    }
		%>
		<div class='dashboard-app'>
			<header class='dashboard-toolbar'>
				<a href="#!" class="menu-toggle"><i class="fas fa-bars"></i></a>
			</header>
			<div class='dashboard-content'>
				<div class='container'>
					<div class='card'>
						<div class='card-header'>
							<h1>
								Welcome back
								<%=participant.getName()%></h1>
						</div>
						<div class='card-body'>
							<p>Your account type is: Administrator</p>
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