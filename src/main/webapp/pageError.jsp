<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="./css/bootstrap.min.css">

<title>Page d'erreur</title>
</head>
<body>

	<div class="container">
		<br /> <br />
		<center>
			<h1>Erreur :</h1>
			<h2 style="color: red;"><%=exception.getMessage()%><br />
			</h2>
			<br /> <br /> <a href="<%=request.getContextPath()%>/login.jsp">
				<button type="submit" class="btn btn-primary">Rejoignez-nous</button>
			</a>
		</center>
	</div>
</body>
</html>