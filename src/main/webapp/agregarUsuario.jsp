<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"/>
<title>Gimnasio | Agregar Usuario</title>
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
        etiqueta1.innerHTML = "Descripcion:";
        contenedor.appendChild(etiqueta1);
        
        var cajaDescripcion = document.createElement("input");
        cajaDescripcion.type = "text";
        cajaDescripcion.name = "disciplina";
        contenedor.appendChild(cajaDescripcion);
        
        contenedor.appendChild(document.createElement("br"));
       
        var etiqueta2 = document.createElement("label");
        etiqueta2.innerHTML = "Sitio Web:";
        contenedor.appendChild(etiqueta2);
        
        var cajaSitioWeb = document.createElement("input");
        cajaSitioWeb.type = "text";
        cajaSitioWeb.name = "sitioWeb"; 
        contenedor.appendChild(cajaSitioWeb);
    } else if (seleccion === "deportista") {
    	var etiquetaCheckbox = document.createElement("label");
        etiquetaCheckbox.innerHTML = "Es Profesional:";
        contenedor.appendChild(etiquetaCheckbox);
        
        var checkboxProfesional = document.createElement("input");
        checkboxProfesional.type = "checkbox";
        checkboxProfesional.name = "esProfesional"; // Nombre del campo de entrada, esto se manda al servlet
        contenedor.appendChild(checkboxProfesional);
    }
}

    </script>
    

</head>
<body>
  
	 <jsp:include page="/head.jsp"/>
	
  
	 <div class="contenedorAgregarClase text-center">
	    <h1 class="text-center">Agregar Usuario</h1>
	 
	     <form action="AgregarUsuario" method="post">
	      
		    <div class="form-group">
			<label for="exampleNombre">Nombre</label> <input type="text" name="nombreUsuario" style="width: 400px
				class="form-control" id="nombre"
				aria-describedby="nombre" placeholder="Ingrese el nombre">
		    </div>
		     <div class="form-group">
		    	<label for="exampleApellido">Apellido</label> <input type="text" name="apellidoUsuario" style="width: 400px
				class="form-control" id="apellido"
				placeholder="Ingrese el Apellido">
		     </div>
		      <div class="form-group">
		    	<label for="exampleNickname">Nickname</label> <input type="text" name="nickUsuario" style="width: 400px
				class="form-control" id="nickname"
				placeholder="Ingrese el Nickname">
		     </div>
		     <div class="form-group">
		    	<label for="exampleEmail">Email</label> <input type="text" name="emailUsuario" style="width: 400px
				class="form-control" id="email"
				placeholder="Ingrese el Email">
		     </div>
		     <div class="form-group">
		    	<label for="examplePassword">Contrasena</label> <input type="password" name="passUsuario" style="width: 400px
				class="form-control" id="password"
				placeholder="Ingrese la Contrasena">
		     </div>
		     <div class="form-group">
		    	<label for="examplePassword2">Repetir Contrasena</label> <input type="password" name="passUsuario2" style="width: 400px
				class="form-control" id="password2"
				placeholder="Repita la Contrasena">
		     </div>
		     <div class="form-group">
		    	<label for="exampleFecha">Fecha de Nacimiento</label> <input type="date" name="fechaNac1" style="width: 400px
				class="form-control" id="fechaNac1"
				placeholder="">
		     </div>
		     <div class="form-group">
		    	<label for="exampleCedula">Cedula</label> <input type="text" name="cedula" style="width: 400px
				class="form-control" id="cedula"
				placeholder="12345678">
		     </div>

		     <div> 
	    	    <label for="opciones">Selecciona tipo de usuario:</label>
                   <select id="opciones" name="opciones" onchange="mostrarElementos()" >
                    <option value="deportista">Deportista</option>
                     <option value="entrenador">Entrenador</option>
                   </select>
		      </div>
		      
		
		   <!-- Contenedor para los elementos dinámicos -->
            <div id="contenedorElementos">
               
            </div>
        
		<button type="submit" class="btn btn-primary">Agregar Usuario</button>
		
	   </form>

	
	
    
    
   </div>
   
   
</body>
</html>