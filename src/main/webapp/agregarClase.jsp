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
<body>

<div class="text-center">
 <h1>Agregar Actividad</h1>
	<form action="AgregarActividad" method="post">
		
		<div class="form-group">
			<label for="exampleInputPassword1">Nombre:</label> <input type="text" name="nombre" style="width: 600px class="form-control" id="exampleInputPassword1"
				placeholder="Ingrese un nombre ">
		</div>
		
		<div class="form-group">
			<label for="exampleInputPassword1">Descripcion:</label> <input type="text" name="descripcion" style="width: 600px class="form-control" id="exampleInputPassword1" placeholder="Ingrese uasdasdna descripcion ">
		</div>
		
		<div class="form-group">
           <label for="numero">Ingresa una duracion:</label> <input type="number" id="numero" name="duracion" style="width: 600px class="form-control" id="exampleInputPassword1" placeholder="Ingresa duracion">
        </div>
		
		<div class="form-group">
			<label for="exampleInputPassword1">Costo</label> <input type="number" id="numero" name="costo" style="width: 600px class="form-control" id="exampleInputPassword1"  placeholder="Ingresa el costo">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Lugar:</label> <input type="text" name="lugar" style="width: 600px class="form-control" id="exampleInputPassword1" placeholder="Ingrese un lugar">
		</div>
		
		  <!-- Contenedor para los elementos dinámicos -->
            <div id="contenedorElementos">
               <!-- Aquí se mostrarán los elementos dinámicos -->
            </div>

	   <br>
		<button type="submit" class="btn btn-primary">Agregar Actividad</button>
      </form>
      
      	<br><br><br>
	
	
    <jsp:include page="/footer.jsp"/>
    </div>  
   
 </body>  
 
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