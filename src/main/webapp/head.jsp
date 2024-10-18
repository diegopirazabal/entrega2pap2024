<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index.jsp" style="margin-left: 5px">MenuGym</a>
    <button
      class="navbar-toggler"
      type="button"
      data-toggle="collapse"
      data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <c:choose>
          <c:when test="${not empty sessionScope.estado_sesion}">
            <li class="nav-item">
              <a class="nav-link" href="agregarUsuario.jsp">Agregar Usuario</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="consultas.jsp">Consultar Usuario</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="agregarActividad.jsp"
                >Agregar Actividad</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="consultarActividad.jsp"
                >Consultar Actividad</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="agregarClase.jsp">Agregar Clase</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="consultaClase.jsp">Consultar Clase</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="inscripcion.jsp"
                >Realizar Inscripcion</a
              >
            </li>
          </c:when>
        </c:choose>
      </ul>

      <!-- Nueva sección para los elementos alineados a la derecha -->
      <ul class="navbar-nav ml-auto">
        <c:choose>
          <c:when test="${not empty sessionScope.estado_sesion}">
            <li class="nav-item">
              <a class="nav-link" href="perfil.jsp">Mi perfil</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logout.jsp">Cerrar Sesión</a>
            </li>
          </c:when>
          <c:when test="${empty sessionScope.estado_sesion}">
            <li class="nav-item">
              <a class="nav-link" href="iniciar.jsp">Iniciar Sesión</a>
            </li>
          </c:when>
        </c:choose>
      </ul>
    </div>
  </nav>
</body>
