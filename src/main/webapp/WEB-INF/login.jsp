<!-- JSTL -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

<c:set var="path" value="${pageContext.request.contextPath}"
	scope="request" />
<style type="text/css">
@import url("${path}/assets/bootstrap/css/bootstrap.min.css");

@import url("${path}/assets/bootstrap/css/bootstrap-theme.min.css");

#login {
	width: 400px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 100px;
}

#btn-login {
	width: 100%;
}
</style>
</head>

<body>

	<section id="login" class="panel panel-primary">
	
		<c:if test="${not empty param['error']}">
		
			<div class="alert alert-warning alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
	
					<p>Usuário ou senha incorretos.</p>
	
			</div>
		
		</c:if>
		
		<c:if test="${not empty param['logout']}">
		
			<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
	
					<p>Saiu com sucesso!</p>
	
			</div>
		
		</c:if>

		<form action="${path}/autenticar" method="post">

			<div class="panel-heading text-center"><h3>Biblioteca UFAB</h3></div>

			<div class="panel-body">

				<div class="form-group">

					<label for="email" class="control-label">Email:</label> <input
						type="email" class="form-control" id="email" name="email" required>

					<label for="password" class="control-label">Senha:</label> <input
						type="password" class="form-control" id="password" name="password" required>


				</div>

			</div>
			
			<div class="panel-footer">
			
				<button id="btn-login" type="submit" class="btn btn-primary">Login</button>
			
			</div>
			
			<input type="hidden" name="_csrf" value="${_csrf.token}">

		</form>

	</section>

	<script type="text/javascript"
		src="${path}/assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"
		src="${path}/assets/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>