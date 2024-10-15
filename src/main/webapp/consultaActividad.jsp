<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Esto para usar jstl, etiqueta por ej para un combo con foreach  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"/>
<title>Consulta Actividades</title>


</head>
<style>
	#listaAct{
		display: none;
	}
	#listaCla{
		display: none;
	}
	#listaInsc{
		display: none;
	}
	#soyEse{
		display: none;
	}
	#costoClase{
		display: none;
	}
</style>
<body>
    <jsp:include page="/head.jsp"/>
    <h1 class="d-flex justify-content-center">Consulta de Actividades Deportivas</h1>
	
<div class="d-flex justify-content-center">


    <form action="ConsultaActividad" method="post">
        <div class="form-group">
            <label for="actividad">Elija una Actividad Deportiva:</label>
            <select id="actividad" name="actividad">
                <c:forEach var="actividad" items="${actividades}">
                    <option value="${actividad.nombre}">${actividad.nombre}</option>
                </c:forEach>
            </select>
        </div>

       
        <button type="submit" class="btn btn-primary" id="consultarActividad">Consultar Actividad</button>
    </form>

   
    <c:if test="${not empty actividadSeleccionada}">
    
	      
	    <div id="actividadDetalles" class="d-flex justify-content-center" style="display: none;">
	        <h2>Detalles de la Actividad</h2>
	       
	        <div class="image-container">
	            <img id="actividadImagen" src="" alt="Imagen de la actividad">
	        </div>
	        
		     <p> SE ESTAN MOSTRANDO LOS DATOS Y ACA HAY QUE INVOCARLOS TODOS </p>
		     <p>Descripción: ${actividadSeleccionada.descripcion}</p>
        	<p>Fecha de Creación: ${actividadSeleccionada.fechaCreacion}</p>
		     
		     
	        <h3>Clases disponibles:</h3>
	        <ul id="clasesLista" class="class-list">
	            
	        </ul>
	        
	     </div>
	     
    </c:if>

    <!-- Mostrar un mensaje de error si no se encuentra la actividad -->
    <c:if test="${not empty errorMessage}">
        <p style="color:red;">${errorMessage}</p>
    </c:if>
</div>


    
    
    
    <!-- Mostrar detalles de una clase seleccionada -->
    <div id="claseDetalles" class="class-details">
        <h3>Detalles de la Clase</h3>
        <p id="detalleClaseTexto"></p>
    </div>



<script>
	var boton = document.getElementById("consultarActividad");
	boton.addEventListener("click", mostrarElementos);
	
	function mostrarElementos() {
	    // Obtén el valor seleccionado del combo box
	    var seleccion = document.getElementById("").innerHTML;
	}
	
</script>
</html>