<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Page d'inscription</title>
<link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei"
	rel="stylesheet">
<link href="./css/style.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url(./img/back.jpg);">
	<div class="container">
		<div class="regbox box">
			<img class="avatar" src="./img/user.png">
			<h1>Créer un compte</h1>
			<form action="./RegisterServlet" method="post">
				<p>Nom</p>
				<input type="text" placeholder="Nom d'utilisateur" name="name"
					required>
				<p>Courriel</p>
				<input type="text" placeholder="Courriel de l'utilisateur"
					name="email" required>
				<p>Mot de passe</p>
				<input type="password" placeholder="Mot de passe de l'utilisateur"
					name="password" required><input type="submit"
					value="S'inscrire"><a href="index.jsp">Vous avez déjà
					un compte ?</a>
			</form>
		</div>
	</div>
</body>
</html>
