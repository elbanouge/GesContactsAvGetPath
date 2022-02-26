<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Gestion des contacts avec JSP</title>
<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css" />

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
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<form action="insert" method="post">
					<h2>Ajouter nouveau contact</h2>

					<c:if test="${contact != null}">
						<input type="hidden" name="id"
							value="<c:out value='${contact.id_contact}' />" />
					</c:if>

					<fieldset class="form-group">
						<label>Nom de contact</label> <input type="text"
							value="<c:out value='${contact.nom}' />" class="form-control"
							name="nom" required="required">
					</fieldset>

					<fieldset class="form-group">
						<label>Adresse de contact</label> <input type="text"
							value="<c:out value='${contact.adresse}' />" class="form-control"
							name="adresse">
					</fieldset>

					<fieldset class="form-group">
						<label>Email de contact</label> <input type="text"
							value="<c:out value='${contact.email}' />" class="form-control"
							name="email">
					</fieldset>

					<fieldset class="form-group">
						<label>Telephone de contact</label> <input type="text"
							value="<c:out value='${contact.tel}' />" class="form-control"
							name="tel">
					</fieldset>

					<button type="submit" class="btn btn-success">Sauvegarder</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>