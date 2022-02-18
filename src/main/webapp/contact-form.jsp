<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Gestion Contacts</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous"></head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="<%=request.getContextPath()%>" class="navbar-brand"> Gestion des contacts </a>
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
				<c:if test="${contact != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${contact == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${contact != null}">
            			Modifier contact
            		</c:if>
						<c:if test="${contact == null}">
            			Ajouter nouveau contact
            		</c:if>
					</h2>
				</caption>

				<c:if test="${contact != null}">
					<input type="hidden" name="id" value="<c:out value='${contact.id_contact}' />" />
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