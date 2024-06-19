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
	<div class="container">
		<div class="card login-card">
			<div class="card-body">
				<h5 class="card-title">Login</h5>
				<p class="card-text">With supporting text below as a natural
					lead-in to additional content.</p>
					<form action="LoginServlet" method="post">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label label">Email
								address</label> <input type="email" class="form-control"
								id="exampleFormControlInput1" placeholder="name@example.com" name="email">
						</div>
						<div class="mb-3">
							<label for="exampleFormControlTextarea1" class="form-label label">Password</label>
							<input type="password" class="form-control" name="password">
						</div>
						<button type="submit" class="btn btn-primary text-center">Login</button>
					</form>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>