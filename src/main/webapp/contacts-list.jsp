<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Gestion des contacts</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="<%=request.getContextPath()%>" class="navbar-brand">
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
			<h3 class="text-center">Liste des contacts</h3>
			<hr>
			<div class="container text-left">
				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Ajouter
					nouveau contact</a>
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
						<th>Actions</th>
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
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?id=<c:out value='${con.id_contact}' />">Supprimer</a></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>
</body>
</html>