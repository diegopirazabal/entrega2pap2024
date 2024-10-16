<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />

    <title>Inscribirme a una Clase</title>
    <style>
        #idTipo, #listaAct, #listaCla {
            display: none;
        }
    </style>
</head>
<body>

    <!-- Incluye el encabezado -->
    <jsp:include page="/head.jsp"/>

    <div class="container my-5">
        <div class="text-center">
            <h1>Inscribirme a una Clase</h1>
            
            <!-- Formulario para cargar actividades -->
            <form action="cargarActividades" method="post">
                <button type="submit" class="btn btn-primary my-3">Cargar Actividades</button>
            </form>

            <!-- Formulario para cargar clases -->
            <form action="cargarClases" method="post" class="text-left mx-auto" style="max-width: 600px;">
                <div class="form-group">
                    <label for="actividadesList">Selecciona una actividad:</label>
                    <select id="actividadesList" name="actividades" class="form-control">
                        <!-- Opciones serán generadas dinámicamente -->
                    </select>
                    <button type="submit" class="btn btn-primary btn-block mt-3">Cargar Clases</button>
                </div>
            </form>

            <!-- Formulario para inscribirse a una clase -->
            <form action="inscripcion" method="post" class="text-left mx-auto" style="max-width: 600px;">
                <div class="form-group">
                    <label for="clasesList">Selecciona una clase:</label>
                    <select id="clasesList" name="clases" class="form-control">
                        <!-- Opciones serán generadas dinámicamente -->
                    </select>
                </div>
                <button type="submit" class="btn btn-primary btn-block mt-3">Inscribirme</button>
            </form>
        </div>
    </div>



    <!-- Datos ocultos para procesamiento en JavaScript -->
    <p id="idTipo">${tipoUsuario}</p>
    <p id="listaAct">${listaAct}</p>
    <p id="listaCla">${listaCla}</p>

    <!-- JavaScript para generar opciones dinámicas -->
    <script>
        function mostrarElementos() {
            var cajaActividades = document.getElementById("actividadesList");
            var textoActividades = document.getElementById("listaAct").innerHTML;
            var opcionesTexto = textoActividades.replace(/^\[|\]$/g, ''); // Elimina [ y ]
            var opciones = opcionesTexto.split(",");

            // Recorrer el array de actividades y crear las opciones dinámicamente
            opciones.forEach(function(actividad) {
                var opcion = document.createElement("option");
                opcion.value = actividad.trim().split(" - ")[0];
                opcion.textContent = actividad.trim();
                cajaActividades.appendChild(opcion);
            });

            var cajaClases = document.getElementById("clasesList");
            var textoClases = document.getElementById("listaCla").innerHTML;
            var opcionesTexto2 = textoClases.replace(/^\[|\]$/g, '');
            var opciones2 = opcionesTexto2.split(",");

            // Recorrer el array de clases y crear las opciones dinámicamente
            opciones2.forEach(function(clase) {
                var opcion = document.createElement("option");
                opcion.value = clase.trim();
                opcion.textContent = clase.trim();
                cajaClases.appendChild(opcion);
            });
        }

        // Llama a la función para cargar las opciones en los select
        mostrarElementos();
    </script>

    <!-- Bootstrap JavaScript -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
