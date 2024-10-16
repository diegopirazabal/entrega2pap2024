<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"/>
<title>Turismo | Consultas</title>

<style>
	/* Estilo para el encabezado fijo */
	.fixed-top {
		position: fixed;
		width: 100%;
		z-index: 1000;
		background-color: #f8f9fa;
		box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
	}

	/* Centrar formulario vertical y horizontalmente */
	#content-wrapper {
		display: flex;
		justify-content: center;
		align-items: center;
		min-height: 100vh;
		padding-top: 80px; /* Espacio para el encabezado fijo */
		background-color: #f8f9fa;
	}

	/* Estilo del formulario */
	form {
		max-width: 600px;
		width: 600px;
		padding: 20px;
		background-color: white;
		border-radius: 10px;
		box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
	}

	#contenedorElementos,
	#contenedorElementos2 {
		margin-bottom: 15px;
	}

	#listaAct, #listaCla {
		display: none;
	}
</style>

</head>
<body>

	<!-- Encabezado fijo -->
	<div class="fixed-top">
		<jsp:include page="/head.jsp"/>
	</div>

	<!-- Contenido centrado -->
	<div id="content-wrapper">
		<div>
			<form action="cargarActividades" method="post" class="mb-4">
				<button type="submit" class="btn btn-primary btn-block">Cargar Actividades</button>
			</form>

			<form action="ConsultaClase" method="post" class="mb-4">
				<div class="form-group">
					<label for="actividadesList">Selecciona una actividad:</label>
					<select id="actividadesList" name="actividades" onchange="mostrarElementos()" class="form-control"></select>
					<button type="submit" class="btn btn-primary btn-block mt-3">Cargar Clases</button>
				</div>		
			</form>

			<form action="DetalleClase" method="post">
				<p id="listaAct">${listaAct}</p>
				<p id="listaCla">${listCla}</p>

				<div class="form-group" id="contenedorElementos"></div>
				<div class="form-group" id="contenedorElementos2"></div>

				<div class="form-group">
					<label for="nombreClase2">Nombre:</label> 
					<input type="text" name="nombreClase2" class="form-control" id="nombreClase2" readonly="readonly" value="${nombreClase}">
				</div>

				<div class="form-group">
					<label for="fechaClase">Fecha:</label> 
					<input type="text" name="fechaClase" class="form-control" id="fechaClase" readonly="readonly" value="${fechaClase}">
				</div>

				<div class="form-group">
					<label for="horaClase">Hora:</label> 
					<input type="text" name="horaClase" class="form-control" id="horaClase" readonly="readonly" value="${horaClase}">
				</div>

				<div class="form-group">
					<label for="lugarClase">Lugar:</label> 
					<input type="text" name="lugarClase" class="form-control" id="lugarClase" readonly="readonly" value="${lugarClase}">
				</div>

				<div class="form-group">
					<label for="cuposClase">Cupos:</label> 
					<input type="text" name="cuposClase" class="form-control" id="cuposClase" readonly="readonly" value="${cuposClase}">
				</div>

				<button type="submit" class="btn btn-primary btn-block">Mostrar Detalles</button>
			</form>
		</div>
	</div>

<script>
function mostrarElementos() {
    console.log("console");

    var contenedor = document.getElementById("contenedorElementos");
    var cajaActividades = document.getElementById("actividadesList");
    var textoActividades = document.getElementById("listaAct").innerHTML;
    var opcionesTexto = textoActividades.replace(/^\[|\]$/g, ''); 
    var opciones = opcionesTexto.split(",");

    opciones.forEach(function(actividad) {
        var opcion = document.createElement("option");
        opcion.value = actividad.trim();
        opcion.value = opcion.value.split(" - ")[0];
        opcion.textContent = actividad.trim();
        cajaActividades.appendChild(opcion);
    });

    var labelClases = document.createElement("label");
    labelClases.innerHTML = "Clases:  ";
    var cajaClases = document.createElement("select");
    cajaClases.name = "comboClases";
    cajaClases.id = "comboClases";
    cajaClases.className = "form-control";
    contenedor.appendChild(labelClases);
    contenedor.appendChild(cajaClases);

    var textoClases = document.getElementById("listaCla").innerHTML;
    var opcionesTexto2 = textoClases.replace(/^\[|\]$/g, ''); 
    var opciones2 = opcionesTexto2.split(",");

    opciones2.forEach(function(clase) {
        var opcion = document.createElement("option");
        opcion.value = clase.trim();
        opcion.textContent = clase.trim();
        cajaClases.appendChild(opcion);
    });
}

mostrarElementos();
</script>
</body>
</html>
