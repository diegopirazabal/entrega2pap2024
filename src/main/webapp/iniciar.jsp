<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@page errorPage="/WEB-INF/500.jsp" %>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <!-- Bootstrap 4 CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />

    <title>Iniciar Sesión</title>

    <style type="text/css">
      .input_blur {
        font-style: italic;
        color: #808080;
      }

      .main-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #f8f9fa;
      }

      .login-box {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
    </style>

    <!-- JavaScript embebido -->
    <script type="text/javascript">
      function sacarBlurReset(event) {
        event.target.classList.remove("input_blur");
        event.target.value = "";
      }
    </script>
  </head>

  <body>
    <!-- Contenedor principal centrado -->
    <div class="main-container">
      <div class="login-box">
        <h2 class="text-center">Iniciar Sesión</h2>
        <p class="text-center text-muted">
          Por favor, ingresa tus credenciales
        </p>

        <!-- Formulario de login -->
        <form action="login" method="POST">
          <div class="form-group">
            <label for="login">Cédula</label>
            <input
              type="text"
              class="form-control input_blur"
              id="login"
              name="login"
              value="Ingrese su cedula..."
              onMouseDown="sacarBlurReset(event);"
            />
          </div>

          <div class="form-group">
            <label for="password">Contraseña</label>
            <input
              type="password"
              class="form-control"
              id="password"
              name="password"
            />
          </div>

          <button type="submit" class="btn btn-primary btn-block">
            Entrar
          </button>
        </form>
      </div>
    </div>

    <script
      src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
      integrity="sha384-cs/xAKn1yIHQ6R72OB7wpwU0OniIIwLgFb2rZl6Joa0IEG3DkF/vpJ7EZV0y2Q9r"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
