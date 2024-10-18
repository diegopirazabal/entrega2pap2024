<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
    
<<<<<<< HEAD

    <jsp:include page="/footer.jsp"/>
</div>
=======
    <link rel="stylesheet" type="text/css" href="styles/main.css" />
  </head>
  <style>
    #err {
      color: red;
    }
  </style>
  <body>
    <jsp:include page="/head.jsp" />
    
    <div class="contenedorAgregarActividad">
      <h1 class="text-center">Agregar Actividad</h1>
      
	    <div class="contenidoAgregarActividad">
	      <form action="AgregarActividad" method="post">
	      
	        <div class="campoAgregarActividad">
	          <label for="Nombre" class="labelCampoShadowBox">Nombre:</label>
	            <input
	              type="text"
	              name="nombre"
	              class="inputCampoShadowBox"
	              id="Nombre"
	              placeholder="Ingrese el nombre de la actividad"
	            />
	            <p id="err">${error}</p>
	        </div>
	
	        <div class="campoAgregarActividad">
	          <label for="Descripcion" class="labelCampoShadowBox"
	            >Descripción:</label>
	            <input
	              type="text"
	              name="descripcion"
	              class="inputCampoShadowBox"
	              id="Descripcion"
	              placeholder="Ingrese una descripción"
	              value="${descripcion != null ? descripcion : ''}"
	            />
	        </div>
	
	        <div class="campoAgregarActividad">
	          <label for="Duracion" class="labelCampoShadowBox"
	            >Duración:</label>
	            <input
	              type="number"
	              name="duracion"
	              class="inputCampoShadowBox"
	              id="Duracion"
	              placeholder="Ingrese la duración en horas"
	              value="${duracion != null ? duracion : ''}"
	            />
	        </div>
	
	        <div class="campoAgregarActividad">
	          <label for="Costo" class="labelCampoShadowBox">Costo:</label>
	            <input
	              type="number"
	              name="costo"
	              class="inputCampoShadowBox"
	              id="Costo"
	              placeholder="Ingrese el costo en pesos"
	              value="${costo != null ? costo : ''}"
	            />
	        </div>
	
	        <div class="campoAgregarActividad">
	          <label for="Lugar" class="labelCampoShadowBox">Lugar:</label>
	            <input
	              type="text"
	              name="lugar"
	              class="inputCampoShadowBox"
	              id="Lugar"
	              placeholder="Ingrese un lugar"
	              value="${lugar != null ? lugar : ''}"
	            />
	        </div>
	
	        <div class="campoAgregarActividad">
	          <label for="Entrenador" class="labelCampoShadowBox"
	            >Entrenador:</label>
	            <input
	              type="text"
	              name="entrenador"
	              class="inputCampoShadowBox"
	              id="Entrenador"
	              placeholder="Ingrese el nickname del entrenador"
	              value="${entrenador != null ? entrenador : ''}"
	            />
	        </div>
	
	        <!-- Contenedor para los elementos dinámicos -->
	        <div id="contenedorElementos" class="campoAgregarActividad">
	          <!-- Aquí se mostrarán los elementos dinámicos -->
	        </div>
	
	        <div class="campoAgregarActividad">
	            <button type="submit" class="btn btn-primary">
	              Agregar Actividad
	            </button>
	        </div>
	      </form>
		</div>	
	    </div>
  </body>
>>>>>>> main

  <!-- JavaScript de Bootstrap y dependencias -->
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
</html>
