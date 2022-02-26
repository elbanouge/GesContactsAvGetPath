<%@page import="estm.dsic.jee.dal.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String val = request.getParameter("value");
User user = (User) session.getAttribute("user");

if (user == null) {
	System.out.println("Erreur !!!!!!");
	response.sendRedirect("login.jsp");
} else {
%>
<html>
<head>
<title>Gestion des contacts avec JSP</title>
<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css" />

</head>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #2d5abb;">
			<div>
				<a href="<%=request.getContextPath()%>/list" class="navbar-brand">
					Gestion des contacts </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Contacts</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="row">
		<div class="container">
			<div class="float-right">
				<form id="searchForm" action="recherche">
					<div class="input-group mb-3">
						<input id="email-id" name="value"
							class="form-control form-control-lg" placeholder="Recherche ici" />
						&nbsp;&nbsp;
						<button type="submit" class="input-group-text btn-success">
							Rechercher</button>
					</div>
				</form>
			</div>
			<br>
			<h3 class="text-center">Liste des contacts</h3>
			<hr>
			<div class="container">

				<div class="float-left">
					<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Ajouter
						nouveau contact</a>
				</div>
				<div class="float-right">
					<form id="logoutForm" action="./logout">
						<label style="font-size: 24px;">Bienvenue (e) : <%=user.getName()%>
							&nbsp; &nbsp; &nbsp;
						</label>
						<button type="submit" class="btn btn-primary">Se
							déconnecter</button>
					</form>
				</div>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nom</th>
						<th>Adresse</th>
						<th>Email</th>
						<th>Telephone</th>
						<th colspan="2" style="text-align: center;">Actions</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="con" items="${listContacts}">
						<tr>
							<td><c:out value="${con.id_contact}" /></td>
							<td><c:out value="${con.nom}" /></td>
							<td><c:out value="${con.adresse}" /></td>
							<td><c:out value="${con.email}" /></td>
							<td><c:out value="${con.tel}" /></td>
							<td><a href="edit?id=<c:out value='${con.id_contact}' />">Modifier</a>
							<td><a href="delete?id=<c:out value='${con.id_contact}'/>"
								onclick="return confirm('Etes-vous sûr que vous voulez supprimer?')">Supprimer</a></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>
	<script type="text/javascript" src="./js/jquery-3.2.1.slim.min.js"></script>
	<script type="text/javascript" src="./js/popper.min.js"></script>
	<script type="text/javascript" src="./js/bootstrap.min.js"></script>
</body>
</html>

<%
}
%>
