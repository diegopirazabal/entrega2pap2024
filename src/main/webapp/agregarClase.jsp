<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />

</head>
<style>
	#idTipo, #listaAct {
		display: none;
	}
</style>
<body>
<jsp:include page="/head.jsp"/>
<div class="text-center" >
 <h1>Agregar Clase</h1>
 		<form action="cargarActividades" method="post">
 		<button type="submit" class="btn btn-primary">Cargar Actividades</button>
 		</form>
 <br>
      <form action="AgregarClase" method="post">
      <div class="form-group">
      		<label for="actividadesList">Selecciona una actividad:</label>
                   <select id="actividadesList" name="actividades" onchange="mostrarElementos()" class="form-control">
                    
            		</select>
      	<br>
			<label for="nombre">Nombre:</label> <input type="text" name="nombre" class="form-control"  id="nombre"
				placeholder="Nombre de la clase ">
		</div>
		
		<div class="form-group">
			<label for="fecha">Fecha:</label> <input type="date" name="fecha" class="form-control" style="width: 600px id="fecha" placeholder="Fecha ">
		</div>
		
		<div class="form-group">
           <label for="hora">Ingresa una hora:</label> <input type="text" id="hora" name="hora" class="form-control" style="width: 600px id="hora" placeholder="Ingresa hora">
        </div>
		
		<div class="form-group">
			<label for="lugar">Costo</label> <input type="lugar" id="lugar" name="lugar" class="form-control" style="width: 600px id="lugar"  placeholder="Ingresa el lugar">
		</div>
		<div class="form-group">
			<label for="cupos">Cupos:</label> <input type="number" name="cupos" class="form-control" style="width: 600px id="cupos" placeholder="Ingrese cupos">
		</div>
      	<button type="submit" class="btn btn-primary">Agregar Clase</button>
      </form>
      	<br><br><br>
 
	    <p id="idTipo">${tipoUsuario}</p>
	    <p id="listaAct">${listaAct}</p>

    <jsp:include page="/footer.jsp"/>
    </div>  
   
 </body>  
 
 	<script>	
		 	//var boton = document.getElementById("boton");
			//boton.addEventListener("click", mostrarElementos);

			function mostrarElementos() {
			    // Obtén el valor seleccionado del combo box
			    var seleccion = document.getElementById("idTipo").innerHTML;
			    console.log("console");
			    
			    // Obtén el contenedor donde se mostrarán los elementos dinámicos
			    var contenedor = document.getElementById("contenedorElementos");
			    
			    // Limpia el contenido anterior del contenedor
			    //contenedor.innerHTML = "";
			    
			    //if (seleccion === "Entrenador") {
			        
			        // Crea un nuevo select dinámico
			     //   var labelActividades = document.createElement("label");
			      //  labelActividades.textContent = "Actividades:   ";
			        var cajaActividades = document.getElementById("actividadesList");
			      //  cajaActividades.id = "actividades";
			      //  cajaActividades.name = "actividades"; 
			      //  contenedor.appendChild(labelActividades);
			        //contenedor.appendChild(cajaActividades);
			        
			        // Obtén las opciones del párrafo y elimina los corchetes
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
			
				 
			    //} else if (seleccion === "Deportista") {
			 
			//}
			}

			mostrarElementos();
			
			</script>
 
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
		
	

</html>