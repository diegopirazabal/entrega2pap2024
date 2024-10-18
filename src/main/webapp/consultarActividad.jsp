<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- JSTL para manejar listas y formato -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>Turismo | Consultas</title>

    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    
            <link rel="stylesheet" type="text/css" href="styles/main.css" />
    

    <style>
      #listaInsc,
      #listaCla,
      #soyEse,
      #costoClase,
      #idTipo {
        display: none;
      }
      
      .contenedor{
      padding: 20px;
    margin: 20px;
    background-color: rgba(0, 0, 0, .3);
    border-radius: 30px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    height: 90%;
      }
    </style>
    
  </head>
  <body>
    <!-- Incluye el encabezado -->
    <jsp:include page="/head.jsp" />

    <div class="contenedor">
      <div class="text-center">
        <h1>Consultar Actividades</h1>
      </div>

      <div class="d-flex justify-content-center">
        <!-- Botón para cargar actividades -->
        <form action="cargarActividades" method="post" class="mb-4">
          <button type="submit" class="btn btn-primary btn-block">
            Cargar Actividades
          </button>
        </form>
      </div>

      <div class="d-flex justify-content-center">
        <!-- Formulario para seleccionar actividad y listar clases -->
        <form
          action="cargarClasesActividad"
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
            ></select>
            <button type="submit" class="btn btn-primary btn-block mt-3">
              Mostrar detalles
            </button>
          </div>
        </form>
      </div>

      <div class="d-flex justify-content-center flex-column">
        <!-- Mostrar información de la actividad -->
        <input
          type="text"
          value="${nombreActividad}"
          class="form-control mb-3"
          readonly
        />
        <input
          type="text"
          value="${lugarActividad}"
          class="form-control mb-3"
          readonly
        />
        <input
          type="text"
          value="${duracionActividad}"
          class="form-control mb-3"
          readonly
        />
        <input
          type="text"
          value="${costoActividad}"
          class="form-control mb-3"
          readonly
        />

        <!-- Formulario para seleccionar una clase y ver detalles -->
        <form
          action="DetalleClaseDeActividad"
          method="post"
          class="text-left mx-auto"
          style="max-width: 600px"
        >
          <div class="form-group">
            <label for="clasesList">Selecciona una clase:</label>
            <select
              id="clasesList"
              name="clases"
              onchange="mostrarElementos()"
              class="form-control"
            ></select>
            <button type="submit" class="btn btn-primary btn-block mt-3">
              Desplegar Datos de la Clase
            </button>
          </div>
        </form>

        <!-- Mostrar información de la clase -->
        <input
          type="text"
          value="${nombreClase}"
          class="form-control mb-3"
          readonly
        />
        <input
          type="text"
          value="${fechaClase}"
          class="form-control mb-3"
          readonly
        />
        <input
          type="text"
          value="${horaClase}"
          class="form-control mb-3"
          readonly
        />
      </div>

      <!-- Elementos ocultos con datos de las listas -->
      <p id="idTipo">${tipoUsuario}</p>
      <p id="listaAct">${listaAct}</p>
      <p id="listaCla">${listaCla}</p>
      <p id="listaInsc">${inscripciones}</p>
      <p id="soyEse">${iguales}</p>
      <p id="costoClase">${costoClase}</p>
    </div>

    <!-- Script para manejar el llenado dinámico de las listas -->
    <script>
      function mostrarElementos() {
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

        var cajaClases = document.getElementById("clasesList");
        var textoClases = document.getElementById("listaCla").innerHTML;
        var opcionesTexto2 = textoClases.replace(/^\[|\]$/g, "");
        var opciones2 = opcionesTexto2.split(",");

        opciones2.forEach(function (clase) {
          var opcion = document.createElement("option");
          opcion.value = clase.trim();
          opcion.textContent = clase.trim();
          cajaClases.appendChild(opcion);
        });
      }

      mostrarElementos();
    </script>

    <!-- Bootstrap JS -->
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
