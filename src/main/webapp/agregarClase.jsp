<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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

    <title>Agregar Clase</title>
    <style>
      #idTipo,
      #listaAct {
        display: none;
      }
    </style>
  </head>
  <body>
    <!-- Incluye el encabezado -->
    <jsp:include page="/head.jsp" />

    <div class="container my-5">
      <div class="text-center">
        <h1>Agregar Clase</h1>
        <form action="cargarActividades" method="post">
          <button type="submit" class="btn btn-primary my-3">
            Cargar Actividades
          </button>
        </form>

        <form
          action="AgregarClase"
          method="post"
          class="text-left mx-auto"
          style="max-width: 600px"
        >
          <div class="form-group">
            <label for="actividadesList">Selecciona una actividad:</label>
            <select
              id="actividadesList"
              name="actividades"
              onchange="mostrarElementos()"
              class="form-control"
            >
              <!-- Opciones serán generadas dinámicamente por JavaScript -->
            </select>
          </div>

          <div class="form-group">
            <label for="nombre">Nombre de la clase:</label>
            <input
              type="text"
              name="nombre"
              class="form-control"
              id="nombre"
              placeholder="Nombre de la clase"
            />
          </div>

          <div class="form-group">
            <label for="fecha">Fecha:</label>
            <input
              type="date"
              name="fecha"
              class="form-control"
              id="fecha"
              placeholder="Fecha"
            />
          </div>

          <div class="form-group">
            <label for="hora">Hora:</label>
            <input
              type="text"
              id="hora"
              name="hora"
              class="form-control"
              placeholder="Hora de la clase (ej: 14:30)"
            />
          </div>

          <div class="form-group">
            <label for="lugar">Lugar:</label>
            <input
              type="text"
              id="lugar"
              name="lugar"
              class="form-control"
              placeholder="Lugar de la clase"
            />
          </div>

          <div class="form-group">
            <label for="cupos">Cupos:</label>
            <input
              type="number"
              name="cupos"
              class="form-control"
              id="cupos"
              placeholder="Cantidad de cupos disponibles"
            />
          </div>

          <button type="submit" class="btn btn-primary">Agregar Clase</button>
        </form>
      </div>
    </div>

    <!-- Datos ocultos para procesamiento en JavaScript -->
    <p id="idTipo">${tipoUsuario}</p>
    <p id="listaAct">${listaAct}</p>

    <!-- JavaScript para generar opciones dinámicas -->
    <script>
      function mostrarElementos() {
        var seleccion = document.getElementById("idTipo").innerHTML;
        var cajaActividades = document.getElementById("actividadesList");
        var textoActividades = document.getElementById("listaAct").innerHTML;
        var opcionesTexto = textoActividades.replace(/^\[|\]$/g, "");
        var opciones = opcionesTexto.split(",");

        opciones.forEach(function (actividad) {
          var opcion = document.createElement("option");
          opcion.value = actividad.trim().split(" - ")[0];
          opcion.textContent = actividad.trim();
          cajaActividades.appendChild(opcion);
        });
      }

      // Llama a la función para cargar las opciones en el select
      mostrarElementos();
    </script>

    <!-- Bootstrap JavaScript -->
    <script
      src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
