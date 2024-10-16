<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page errorPage="/WEB-INF/500.jsp" %>
<!doctype html>
<html>
 <head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--Lo hace responsivo -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- Referencia hora de estilo Bootstrap 4 CSS -->
	
	<link rel="stylesheet" type="text/css" href="styles/main.css">
	

<title>Homepage</title>



</head>

    <body>
      <jsp:include page="/head.jsp"/>



	<script type="text/javascript">
		/// saca el blur a un elemento y lo resetea
		function sacarBlurReset(event)
		{
			event.target.setAttribute('class', "");
			event.target.value = "";
		}
	</script>

	<div class="contenedor_principal main">
		<div class="izquierda">
			<h2>Ingresa tus datos para iniciar sesión</h2>
		</div>
		<div class="derecha">
				<!-- formulario de login -->
				<form action="login" method="POST">
		    	<input class="input_blur" type="text" name="login"
						   value="cedula..."	onMouseDown="sacarBlurReset(event);"/>
					<br/>
		    	<input type="password" name="password"/>
					<br/>
			    <input type="button" value="Entrar" onclick="submit()"/>
			</form>
		</div>
	</div>

	
 
	
</body>

</html>
