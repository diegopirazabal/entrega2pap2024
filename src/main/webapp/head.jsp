<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a 	class="navbar-brand" href="#">MenúTurismo</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Homepage <span class="sr-only">(current)</span>
			</a></li>
		
			<c:choose>
			<c:when test="${not empty sessionScope.estado_sesion}">
			<li class="nav-item"><a class="nav-link" href="agregarUsuario.jsp">Agregar Usuario</a></li>
			<li class="nav-item"><a class="nav-link" href="agregarActividad.jsp">Agregar Actividad</a></li>
			<li class="nav-item"><a class="nav-link" href="agregarClase.jsp">Agregar Clase</a></li>
			<li class="nav-item"><a class="nav-link" href="consultas.jsp">Consultas</a></li>
			<li class="nav-item"><a class="nav-link" href="logout.jsp">Cerrar Sesion</a></li>
			<li class="nav-item"><a class="nav-link" href="perfil.jsp">Mi perfil</a></li>
			</c:when>
			</c:choose>
			
			<c:choose>
			<c:when test="${empty sessionScope.estado_sesion}">
			<li class="nav-item"><a class="nav-link" href="iniciar.jsp">Iniciar Sesion</a></li>
			</c:when>
			</c:choose>
			
		</ul>
	</div>
	</nav>
</body>