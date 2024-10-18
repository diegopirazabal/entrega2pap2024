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
    
        <link rel="stylesheet" type="text/css" href="styles/main.css" />
    
    <title>Gimnasio | Agregar Usuario</title>

    <style>
      /* Centrar formulario vertical y horizontalmente */
      #content-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding-top: 80px; /* Espacio para el encabezado fijo */
      }

      /* Estilo del formulario */
      form {
        max-width: 700px;
        width: 700px;
        padding: 50px;
        background-color: white;
        border-radius: 10px;
        border: 2px solid #dee2e6;
        box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.15);
      }

      /* Ajuste de los campos de entrada para que se vean más grandes */
      .form-control {
        padding: 15px;
        font-size: 1.2rem;
        height: 50px;
      }

      /* Botones más grandes */
      .btn {
        padding: 15px 30px;
        font-size: 1.2rem;
        height: 60px;
      }

      /* Etiquetas más grandes */
      label {
        font-size: 1.2rem;
        color:black;
      }

      /* Select box más grande */
      select {
        width: 100%;
        height: 50px;
        font-size: 1.2rem;
        padding: 10px;
      }
    </style>

    <script>
      function mostrarElementos() {
        // Obtén el valor seleccionado del combo box
        var seleccion = document.getElementById("opciones").value;
        // Obtén el contenedor donde se mostrarán los elementos dinámicos
        var contenedor = document.getElementById("contenedorElementos");
        // Limpia el contenido anterior del contenedor
        contenedor.innerHTML = "";

        if (seleccion === "entrenador") {
          var etiqueta1 = document.createElement("label");
          etiqueta1.innerHTML = "Descripción:";
          contenedor.appendChild(etiqueta1);

          var cajaDescripcion = document.createElement("input");
          cajaDescripcion.type = "text";
          cajaDescripcion.name = "disciplina";
          cajaDescripcion.className =
            "form-control"; /* Ajusta el estilo del input */
          contenedor.appendChild(cajaDescripcion);

          contenedor.appendChild(document.createElement("br"));

          var etiqueta2 = document.createElement("label");
          etiqueta2.innerHTML = "Sitio Web:";
          contenedor.appendChild(etiqueta2);

          var cajaSitioWeb = document.createElement("input");
          cajaSitioWeb.type = "text";
          cajaSitioWeb.name = "sitioWeb";
          cajaSitioWeb.className =
            "form-control"; /* Ajusta el estilo del input */
          contenedor.appendChild(cajaSitioWeb);
        } else if (seleccion === "deportista") {
          var etiquetaCheckbox = document.createElement("label");
          etiquetaCheckbox.innerHTML = "Es Profesional:";
          contenedor.appendChild(etiquetaCheckbox);

          var checkboxProfesional = document.createElement("input");
          checkboxProfesional.type = "checkbox";
          checkboxProfesional.name = "esProfesional";
          checkboxProfesional.className = "form-control";
          contenedor.appendChild(checkboxProfesional);
        }
      }
    </script>
  </head>
  <body>
    <jsp:include page="/head.jsp" />

    <div id="content-wrapper">
      <div>
        <h1 class="text-center" style="color: white;">Agregar Usuario</h1>

        <form action="AgregarUsuario" method="post">
          <div class="form-group">
            <label for="nombre">Nombre</label>
            <input
              type="text"
              name="nombreUsuario"
              class="form-control"
              id="nombre"
              placeholder="Ingrese el nombre"
            />
          </div>
          <div class="form-group">
            <label for="apellido">Apellido</label>
            <input
              type="text"
              name="apellidoUsuario"
              class="form-control"
              id="apellido"
              placeholder="Ingrese el Apellido"
            />
          </div>
          <div class="form-group">
            <label for="nickname">Nickname</label>
            <input
              type="text"
              name="nickUsuario"
              class="form-control"
              id="nickname"
              placeholder="Ingrese el Nickname"
            />
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input
              type="email"
              name="emailUsuario"
              class="form-control"
              id="email"
              placeholder="Ingrese el Email"
            />
          </div>
          <div class="form-group">
            <label for="password">Contraseña</label>
            <input
              type="password"
              name="passUsuario"
              class="form-control"
              id="password"
              placeholder="Ingrese la Contraseña"
            />
          </div>
          <div class="form-group">
            <label for="password2">Repetir Contraseña</label>
            <input
              type="password"
              name="passUsuario2"
              class="form-control"
              id="password2"
              placeholder="Repita la Contraseña"
            />
          </div>
          <div class="form-group">
            <label for="fechaNac1">Fecha de Nacimiento</label>
            <input
              type="date"
              name="fechaNac1"
              class="form-control"
              id="fechaNac1"
            />
          </div>
          <div class="form-group">
            <label for="cedula">Cédula</label>
            <input
              type="text"
              name="cedula"
              class="form-control"
              id="cedula"
              placeholder="12345678"
            />
          </div>

          <div class="form-group">
            <label for="opciones">Selecciona tipo de usuario:</label>
            <select
              id="opciones"
              name="opciones"
              class="form-control"
              onchange="mostrarElementos()"
            >
              <option value="deportista">Deportista</option>
              <option value="entrenador">Entrenador</option>
            </select>
          </div>

          <!-- Contenedor para los elementos dinámicos -->
          <div id="contenedorElementos" class="form-group"></div>

          <button type="submit" class="btn btn-primary btn-block">
            Agregar Usuario
          </button>
        </form>
      </div>
    </div>
  </body>
</html>
