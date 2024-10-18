<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- Esto para usar jstl, etiqueta por ej para un combo con foreach  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS -->

    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
                <link rel="stylesheet" type="text/css" href="styles/main.css" />
    
    <title>Turismo | Consultas</title>
  </head>
  <style>
    #listaAct {
      display: none;
    }
    #listaCla {
      display: none;
    }
    #listaInsc {
      display: none;
    }
    #soyEse {
      display: none;
    }
    #costoClase {
      display: none;
    }
    #idTipo {
      display: none;
    }
    
    .contenedor{
       padding: 20px;
    margin: 20px;
    background-color: rgba(0, 0, 0, .3);
    border-radius: 30px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
  </style>
  
  
  <body>
    <jsp:include page="/head.jsp" />
	<div class="contenedor"> 
	    <div class="d-flex justify-content-center">
	      <h1>Consultar Usuarios</h1>
	    </div>
	
	    <div class="d-flex justify-content-center">
	      <!-- El stilo para que quede uno abaja del otro los form -->
	      <form
	        action="ConsultaUsuario"
	        method="post"
	        style="display: block; margin-bottom: 20px"
	      >
	        <div class="form-group">
	          <div class="input-group-prepend">
	            <button type="submit" class="btn btn-primary">
	              Consultar Usuarios
	            </button>
	            <!-- Boton de arriba -->
	            <select id="opciones" name="opciones">
	              <c:forEach items="${opciones}" var="opcion">
	                <option value="${opcion}">${opcion}</option>
	              </c:forEach>
	            </select>
	          </div>
	        </div>
	      </form>
	    </div>
	
	    <div class="d-flex justify-content-center">
	      <form
	        action="DetalleUsuario"
	        method="post"
	        style="display: block; margin-bottom: 20px"
	      >
	        <div class="input-group-prepend">
	          <label for="exampleCedula">Nickname: </label> <input type="text"
	          name="nickname" style="width: 600px class="form-control" id="nickname"
	          placeholder="Ingrese Nickname">
	          <button type="submit" class="btn btn-primary">Detalle Usuario</button>
	          <button id="boton" type="button" class="btn">
	            Mostrar Actividades
	          </button>
	          <!-- Boton de arriba -->
	        </div>
	        <br />
	
	        <br />
	        <br />
	        <input
	          type="text"
	          value="${nombre}"
	          class="form-control"
	          readonly="readonly"
	        />
	        <br />
	        <input
	          type="text"
	          value="${apellido}"
	          class="form-control"
	          readonly="readonly"
	        />
	        <br />
	        <input
	          type="text"
	          value="${email}"
	          class="form-control"
	          readonly="readonly"
	        />
	        <br />
	        <input
	          type="text"
	          value="${fechaNac}"
	          class="form-control"
	          readonly="readonly"
	        />
	        <br />
	        <input
	          type="text"
	          value="${tipoUsuario}"
	          class="form-control"
	          readonly="readonly"
	        />
	
	        <p id="idTipo">${tipoUsuario}</p>
	        <p id="listaAct">${disciplina}</p>
	        <p id="listaCla">${auxiliar}</p>
	        <p id="listaInsc">${inscripciones}</p>
	        <p id="soyEse">${iguales}</p>
	        <p id="costoClase">${costoClase}</p>
	
	        <div class="input-group-prepend" id="contenedorElementos"></div>
	        <br />
	        <div class="input-group-prepend" id="contenedorElementos2"></div>
	        <br />
	        <br />
	      </form>
	
	      <br />
	      <br />
	    </div>
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
        cajaActividades.className = "form-control";
        contenedor.appendChild(labelActividades);
        contenedor.appendChild(cajaActividades);

        // Obtén las opciones del párrafo y elimina los corchetes
        var textoActividades = document.getElementById("listaAct").innerHTML;
        var opcionesTexto = textoActividades.replace(/^\[|\]$/g, ""); // Elimina [ y ]
        var opciones = opcionesTexto.split(","); // Divide en un array por comas

        // Recorrer el array de actividades y crear las opciones dinámicamente
        opciones.forEach(function (actividad) {
          var opcion = document.createElement("option");
          opcion.value = actividad.trim(); // Asigna el valor y elimina espacios en blanco
          opcion.textContent = actividad.trim(); // El texto visible para la opción
          cajaActividades.appendChild(opcion); // Agrega la opción al select
        });
        var soyEse = document.getElementById("soyEse").innerHTML;
        console.log(soyEse);
        if (soyEse == "false") {
          var labelClases = document.createElement("label");
          labelClases.textContent = "Clases:   ";
          var cajaClases = document.createElement("select");
          cajaClases.id = "clases";
          cajaClases.name = "clases";
          cajaClases.className = "form-control";
          contenedor2.appendChild(labelClases);
          contenedor2.appendChild(cajaClases);

          // Obtén las opciones del párrafo y elimina los corchetes
          var textoClases = document.getElementById("listaCla").innerHTML;
          var opcionesTexto = textoClases.replace(/^\[|\]$/g, ""); // Elimina [ y ]
          var opciones = opcionesTexto.split(","); // Divide en un array por comas

          // Recorrer el array de actividades y crear las opciones dinámicamente
          opciones.forEach(function (actividad) {
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
        cajaInscripciones.className = "form-control";
        contenedor.appendChild(labelInscripciones);
        contenedor.appendChild(cajaInscripciones);

        var textoInscripciones = document.getElementById("listaInsc").innerHTML;
        var opcionesTexto = textoInscripciones.replace(/^\[|\]$/g, ""); // Elimina [ y ]
        var opciones = opcionesTexto.split(","); // Divide en un array por comas

        // Recorrer el array de actividades y crear las opciones dinámicamente
        opciones.forEach(function (inscripcion) {
          var opcion = document.createElement("option");
          opcion.value = inscripcion.trim(); // Asigna el valor y elimina espacios en blanco
          opcion.textContent = inscripcion.trim(); // El texto visible para la opción
          opcion.textContent = inscripcion.slice(0, -18);
          cajaInscripciones.appendChild(opcion); // Agrega la opción al select
        });
        var soyEse = document.getElementById("soyEse").innerHTML;
        console.log(soyEse);
        if (soyEse == "true") {
          var costoLabel = document.createElement("label");
          costoLabel.textContent = "Costo:  ";
          var cajaCosto = document.createElement("input");
          cajaCosto.id = "cajaCosto";
          cajaCosto.name = "cajaCosto";
          cajaCosto.className = "form-control";
          cajaCosto.readOnly = true;
          var costosTexto = document.getElementById("costoClase").innerHTML;
          console.log(
            "Esto es lo que estoy trayendo de costos: " + costosTexto
          );

          // Limpiar el texto para eliminar los corchetes y espacios no deseados
          costosTexto = costosTexto.replace(/^\[|\]$/g, ""); // Eliminar los corchetes [ y ]
          var costos = costosTexto.split(",").map(function (costo) {
            return parseFloat(costo.trim()); // Convertir los costos en números
          });
          cajaInscripciones.addEventListener("click", function () {
            var selectedIndex = cajaInscripciones.selectedIndex; // Obtener el índice de la opción seleccionada
            console.log("\n\nEste es el selected index = " + selectedIndex);
            var selectedCosto = costos[selectedIndex]; // Obtener el costo correspondiente
            console.log(
              "\n\nEste es el costo asociado al indice: " + selectedCosto
            );
            cajaCosto.value = selectedCosto; // Asignar el costo al input
          });
          contenedor2.appendChild(costoLabel);
          contenedor2.appendChild(cajaCosto);
        }
      }
    }
  </script>
</html>
