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
<title>Turismo | Consultas</title>


</head>
<style>
	#listaAct{
		display: none;
	}
	
	#listaCla{
		display: none;
	}
</style>
<body>
   <jsp:include page="/head.jsp"/>
	
	<form action="cargarActividades" method="post">
 		<button type="submit" class="btn btn-primary">Cargar Actividades</button>
 	</form>
	
	<div class="d-flex justify-content-center">
	<!-- El stilo para que quede uno abaja del otro los form -->
	<form action="ConsultaClase" method="post" style="display: block; margin-bottom: 20px;">
	   <div class="form-group">
			<label for="actividadesList">Selecciona una actividad:</label>
                   <select id="actividadesList" name="actividades" onchange="mostrarElementos()" class="form-control">
                   
            		</select>
            		 <button type="submit" class="btn btn-primary">Cargar Clases</button>
		</div>		
	</form>
	</div>
   
	<div class="d-flex justify-content-center">	
	<form action="DetalleClase" method="post" style="display: block; margin-bottom: 20px;">
		
	    <p id="listaAct">${listaAct}</p>
	    <p id="listaCla">${listCla}</p>

	    <div class="input-group-prepend" id="contenedorElementos">      
	
		</div>
	
		<div class="input-group-prepend" id="contenedorElementos2">      
		
		</div>
		<div class="input-group-prepend">      
			<div class="">
            <label for="nombreClase2" class="col-sm-2 col-form-label">Nombre:</label> 
            <div class="">
                <input type="text" name="nombreClase2" class="form-control" id="nombreClase2" readonly="readonly" value="${nombreClase}">
            </div>
            
            <div class="">
            <label for="fechaClase" class="col-sm-2 col-form-label">Fecha:</label> 
            <div class="">
                <input type="text" name="fechaClase" class="form-control" id="fechaClase" readonly="readonly" value="${fechaClase}">
            </div>
            
            <div class="">
            <label for="horaClase" class="col-sm-2 col-form-label">Hora:</label> 
            <div class="">
                <input type="text" name="horaClase" class="form-control" id="horaClase" readonly="readonly" value="${horaClase}">
            </div>
            
            <div class="">
            <label for="lugarClase" class="col-sm-2 col-form-label">Lugar:</label> 
            <div class="">
                <input type="text" name="lugarClase" class="form-control" id="lugarClase" readonly="readonly" value="${lugarClase}">
            </div>
            
            <div class="">
            <label for="cuposClase" class="col-sm-2 col-form-label">Cupos:</label> 
            <div class="">
                <input type="text" name="cuposClase" class="form-control" id="cuposClase" readonly="readonly" value="${cuposClase}">
            </div>
        </div>
		</div>
		<button type="submit">MOSTRARDETALLES</button>
	</form>
	 
	 <br>
	 <br>
	 </div>
	 <div class="d-flex justify-content-center">
	    
	 </div>	

</body>
<script>
function mostrarElementos() {
    // Obtén el valor seleccionado del combo box
    
    console.log("console");
    
    // Obtén el contenedor donde se mostrarán los elementos dinámicos
    var contenedor = document.getElementById("contenedorElementos");

        var cajaActividades = document.getElementById("actividadesList");
        var textoActividades = document.getElementById("listaAct").innerHTML;
        var opcionesTexto = textoActividades.replace(/^\[|\]$/g, ''); // Elimina [ y ]
        var opciones = opcionesTexto.split(","); // Divide en un array por comas
        
        // Recorrer el array de actividades y crear las opciones dinámicamente
        opciones.forEach(function(actividad) {
        var opcion = document.createElement("option");
        opcion.value = actividad.trim(); // Asigna el valor y elimina espacios en blanco
        opcion.value = opcion.value.split(" - ")[0];
        opcion.textContent = actividad.trim(); // El texto visible para la opción
        cajaActividades.appendChild(opcion); // Agrega la opción al select
        });

		var labelClases = document.createElement("label");
		labelClases.innerHTML = "Clases:  ";
        var cajaClases = document.createElement("select");
        cajaClases.name = "comboClases";
        cajaClases.id = "comboClases";
        contenedor.appendChild(labelClases);
        contenedor.appendChild(cajaClases);
        
        var textoClases = document.getElementById("listaCla").innerHTML;
        var opcionesTexto2 = textoClases.replace(/^\[|\]$/g, ''); // Elimina [ y ]
        var opciones2 = opcionesTexto2.split(","); // Divide en un array por comas
        
        opciones2.forEach(function(clase) {
            var opcion = document.createElement("option");
            opcion.value = clase.trim(); // Asigna el valor y elimina espacios en blanco
            //opcion.value = opcion.value.split(" - ")[0];
            opcion.textContent = clase.trim(); // El texto visible para la opción
            cajaClases.appendChild(opcion); // Agrega la opción al select
            });
		
}

mostrarElementos();
</script>
</html>