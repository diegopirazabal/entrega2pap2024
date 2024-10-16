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
	
<title>Consultas de Usuario y Actividades</title>


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
	
	<div class="contenedor"> 
		<h1 class = "text-center">Consultar Usuarios</h1>	
		<!-- El stilo para que quede uno abaja del otro los form -->
		<form action="ConsultaUsuario" method="post" style="display: block; margin-bottom: 20px;">
		   <div class="form-group">
				<div class="input-group-prepend">
				    <button type="submit" class="btn btn-primary" >Consultar Usuarios</button>  <!-- Boton de arriba -->
					<select id="opciones" name="opciones">
	    			<c:forEach items="${opciones}" var="opcion">
	     				   <option value="${opcion}">${opcion}</option>
	    		    </c:forEach>
	 			    </select>
			 </div>
			</div>		
		</form>
		
		<form action="DetalleUsuario" method="post" style="display: block;">	
		<input type="text" name="nickname" class="form-control" id="nickname" placeholder="Ingrese Nickname">
		<button type="submit" class="btn btn-primary" style="margin-top: 10px;">Detalle Usuario</button>
			
	
	<h2>Dato de usuario desde el servlet:</h2>
    <p>${nombre}</p>
    <p>${apellido}</p>
    <p>${email}</p>
    <p>${fechaNac}</p>
    <p id="idTipo">${tipoUsuario}</p>
    <p id="listaAct">${disciplina}</p>
    <p id="listaCla">${auxiliar}</p>
    <p id="listaInsc">${inscripciones}</p>
    <p id="soyEse">${iguales}</p>
    <p id="costoClase">${costoClase}</p>
    
    <div class="input-group-prepend" id="contenedorElementos">      

	</div>
	<div class="input-group-prepend" id="contenedorElementos2">      
	
	</div>
	</form>
	</div>
   

  <div class="contenedor">
    <!-- Sección para listar actividades -->
 <!-- Sección para listar actividades -->
<h2>Consultar Actividades</h2>
<form action="consultaActividad" method="get">
    <!-- Botón para cargar las actividades -->
    <button type="submit" class="btn btn-primary" style= "margin-bottom: 20px;">Mostrar Actividades</button>
</form>

<!-- Dropdown para seleccionar una actividad -->
<form action="detalleActividad" method="post">
    <div class="form-group">
        <label for="nombreActividad">Seleccione una Actividad:</label>
        <select class="form-control" id="nombreActividad" name="nombreActividad">
            <c:forEach items="${actividades}" var="actividad">
                <option value="${actividad.nombre}">${actividad.nombre}</option>
            </c:forEach>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Ver Detalles</button>
</form>


<div class="contenedor">
    <h2>Detalles de Actividad</h2>
    
    <c:if test="${not empty nombreAct}">
        <div class="form-group">
            <label>Nombre:</label>
            <p>${nombreAct}</p>
        </div>
        
        <div class="form-group">
            <label>Descripción:</label>
            <p>${descripcion}</p>
        </div>
        
        <div class="form-group">
            <label>Duración:</label>
            <p>${duracion} horas</p>
        </div>
        
        <div class="form-group">
            <label>Costo:</label>
            <p>${costo} pesos</p>
        </div>
        
        <div class="form-group">
            <label>Lugar:</label>
            <p>${lugar}</p>
        </div>
        
        <div class="form-group">
            <label>Entrenador Designado:</label>
            <p>${entrenador}</p>
        </div>
    </c:if>

    <!-- Mensaje de error si la actividad no existe -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">
            <strong>Error:</strong> ${errorMessage}
        </div>
    </c:if>
</div>

	 
</body>


<script>
	var boton = document.getElementById("boton");
	boton.addEventListener("click", mostrarElementos);
	
	function mostrarElementos() {
	    // Obtén el valor seleccionado del combo box
	    var seleccion = document.getElementById("idTipo").innerHTML;
	    console.log(seleccion);
	    
	    // Obtén el contenedor donde se mostrarán los elementos dinámicos
	    var contenedor = document.getElementById("contenedorElementos");
	    var contenedor2 = document.getElementById("contenedorElementos2");
	    
	    // Limpia el contenido anterior del contenedor
	    contenedor.innerHTML = "";
	    
	    if (seleccion === "Entrenador") {
	        
	        // Crea un nuevo select dinámico
	        var labelActividades = document.createElement("label");
	        labelActividades.textContent = "Actividades:   ";
	        var cajaActividades = document.createElement("select");
	        cajaActividades.id = "actividades";
	        cajaActividades.name = "actividades"; 
	        contenedor.appendChild(labelActividades);
	        contenedor.appendChild(cajaActividades);
	        
	        
	        // Obtén las opciones del párrafo y elimina los corchetes
	        var textoActividades = document.getElementById("listaAct").innerHTML;
	        var opcionesTexto = textoActividades.replace(/^\[|\]$/g, ''); // Elimina [ y ]
	        var opciones = opcionesTexto.split(","); // Divide en un array por comas
	        
	        
	        // Recorrer el array de actividades y crear las opciones dinámicamente
	        opciones.forEach(function(actividad) {
	            var opcion = document.createElement("option");
	            opcion.value = actividad.trim(); // Asigna el valor y elimina espacios en blanco
	            opcion.textContent = actividad.trim(); // El texto visible para la opción
	            cajaActividades.appendChild(opcion); // Agrega la opción al select
	        });
	        var soyEse = document.getElementById("soyEse").innerHTML;
	        console.log(soyEse);
	        if(soyEse == "false"){
		        var labelClases = document.createElement("label");
		        labelClases.textContent = "Clases:   "
		        var cajaClases = document.createElement("select");
		        cajaClases.id = "clases";
		        cajaClases.name = "clases";
		        contenedor2.appendChild(labelClases);
		        contenedor2.appendChild(cajaClases);
		        
		        // Obtén las opciones del párrafo y elimina los corchetes
		        var textoClases = document.getElementById("listaCla").innerHTML;
		        var opcionesTexto = textoClases.replace(/^\[|\]$/g, ''); // Elimina [ y ]
		        var opciones = opcionesTexto.split(","); // Divide en un array por comas
		        
		        
		        // Recorrer el array de actividades y crear las opciones dinámicamente
		        opciones.forEach(function(actividad) {
		            var opcion = document.createElement("option");
		            opcion.value = actividad.trim(); // Asigna el valor y elimina espacios en blanco
		            opcion.textContent = actividad.trim(); // El texto visible para la opción
		            cajaClases.appendChild(opcion); // Agrega la opción al select
		        });
	        } 
	    } else if (seleccion === "Deportista") {
	    	var labelInscripciones = document.createElement("label");
	    	labelInscripciones.textContent = "Clases a las que esta inscrito:   ";
	        var cajaInscripciones = document.createElement("select");
	        cajaInscripciones.id = "inscripciones";
	        cajaInscripciones.name = "inscripciones"; 
	        contenedor.appendChild(labelInscripciones);
			contenedor.appendChild(cajaInscripciones);
	        
	        var textoInscripciones = document.getElementById("listaInsc").innerHTML;
	        var opcionesTexto = textoInscripciones.replace(/^\[|\]$/g, ''); // Elimina [ y ]
	        var opciones = opcionesTexto.split(","); // Divide en un array por comas
	        
	        
	        // Recorrer el array de actividades y crear las opciones dinámicamente
	        opciones.forEach(function(inscripcion) {
	            var opcion = document.createElement("option");
	            opcion.value = inscripcion.trim(); // Asigna el valor y elimina espacios en blanco
	            opcion.textContent = inscripcion.trim(); // El texto visible para la opción
	            opcion.textContent = inscripcion.slice(0, -18);
	            cajaInscripciones.appendChild(opcion); // Agrega la opción al select
	        });
	        var soyEse = document.getElementById("soyEse").innerHTML;
	        console.log(soyEse);
	        if(soyEse == "true"){
	        	
		        var costoLabel = document.createElement("label");
		        costoLabel.textContent = "Costo:  ";
		        var cajaCosto = document.createElement("input");
		        cajaCosto.id = "cajaCosto";
		        cajaCosto.name = "cajaCosto";
		        cajaCosto.readOnly = true;
		        var costosTexto = document.getElementById("costoClase").innerHTML;
		        console.log("Esto es lo que estoy trayendo de costos: " + costosTexto);

		        // Limpiar el texto para eliminar los corchetes y espacios no deseados
		        costosTexto = costosTexto.replace(/^\[|\]$/g, ''); // Eliminar los corchetes [ y ]
		        var costos = costosTexto.split(",").map(function(costo) {
		            return parseFloat(costo.trim()); // Convertir los costos en números
		        });
		        cajaInscripciones.addEventListener("change", function() {
		            var selectedIndex = cajaInscripciones.selectedIndex; // Obtener el índice de la opción seleccionada
		            console.log("\n\nEste es el selected index = " + selectedIndex);
		            var selectedCosto = costos[selectedIndex]; // Obtener el costo correspondiente
		            console.log("\n\nEste es el costo asociado al indice: " + selectedCosto);
		            cajaCosto.value = selectedCosto; // Asignar el costo al input
		        });
		        contenedor2.appendChild(costoLabel);
		        contenedor2.appendChild(cajaCosto);
		        <div class="d-flex justify-content-center">	
	    }
	        <script>
	        // Este script se ejecuta cuando el DOM está cargado
	        window.onload = function() {
	            var actividades = [
	                // Aquí irían las actividades que recibes desde tu servidor o servlet, en formato JSON.
	                // Ejemplo:
	                { nombre: "Actividad 1", clases: ["Clase A", "Clase B"] },
	                { nombre: "Actividad 2", clases: ["Clase C", "Clase D"] }
	            ];

	            // Obtener los elementos select
	            var cajaActividades = document.getElementById("nombreActividad");
	            var cajaClases = document.getElementById("nombreClase");

	            // Función para cargar las actividades en el select
	            function cargarActividades() {
	                actividades.forEach(function(actividad) {
	                    var opcion = document.createElement("option");
	                    opcion.value = actividad.nombre;
	                    opcion.textContent = actividad.nombre; 
	                    cajaActividades.appendChild(opcion);
	                });
	            }

	            // Cargar las clases según la actividad seleccionada
	            cajaActividades.addEventListener("change", function() {
	                // Limpiar el select de clases
	                cajaClases.innerHTML = "";

	                // Obtener la actividad seleccionada
	                var actividadSeleccionada = cajaActividades.value;

	                // Buscar la actividad seleccionada en el array de actividades
	                var actividad = actividades.find(function(act) {
	                    return act.nombre === actividadSeleccionada;
	                });

	                // Si se encuentra la actividad, cargar sus clases
	                if (actividad) {
	                    actividad.clases.forEach(function(clase) {
	                        var opcionClase = document.createElement("option");
	                        opcionClase.value = clase;
	                        opcionClase.textContent = clase; 
	                        cajaClases.appendChild(opcionClase);
	                    });
	                }
	            });

	            // Cargar las actividades cuando la página se cargue
	            cargarActividades();
	        };
	    </script>

	}
	    
</script>
</html>