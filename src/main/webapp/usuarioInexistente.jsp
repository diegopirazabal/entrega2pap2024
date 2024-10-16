<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@page
errorPage="/WEB-INF/errorPages/500.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <!--Lo hace responsivo -->

    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <!-- Referencia hora de estilo Bootstrap 4 CSS -->

    <title>Homepage</title>

    <!-- referencia al CSS maestro -->
    <link rel="stylesheet" type="text/css" href="styles/main.css" />
  </head>
  <body>
    <jsp:include page="/head.jsp" />

    <form class="formulario_centrar main" action="login" ACTION="POST">
      <div class="error">
        <b>El usuario no existe.</b>
        <p>
          Asegurese que la entró correctamente la cedula. <code>prueba</code>.
        </p>
      </div>

      <div class="fila_input">
        <label for="error_login">Cedula: </label>
        <input id="error_login" type="text" name="login" />
      </div>

      <div class="fila_input">
        <label for="error_password">Contraseña:</label>
        <input id="error_password" type="password" name="password" />
      </div>

      <div class="fila_input">
        <input
          class="con_margen"
          type="button"
          value="Entrar"
          onclick="submit()"
        />
      </div>
    </form>

    <jsp:include page="/footer.jsp" />
  </body>
</html>
