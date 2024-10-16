<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--Lo hace responsivo -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- Referencia hora de estilo Bootstrap 4 CSS -->

<title>Homepage</title>

<!-- referencia al CSS maestro -->
<link rel="stylesheet" type="text/css" href="styles/main.css">
</head>

<body>
	 <jsp:include page="/head.jsp"/>

  <%
  String catalinaBase = System.getProperty("catalina.base");
  System.out.println("Tomcat Base: " + catalinaBase);
  %>

	<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel" data-interval="2000"style="margin: 40px;">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" style="max-width: 50%; height: 500px; margin: 0 auto; object-fit: cover; border-radius: 20px;" src="imagenes/img1.jpg" alt="First slide"  >
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" style="max-width: 50%; height: 500px; margin: 0 auto; object-fit: cover; border-radius: 20px;" src="imagenes/img2.jpg" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" style="max-width: 50%; height: 500px; margin: 0 auto; object-fit: cover; border-radius: 20px;" src="imagenes/img3.jpg" alt="Third slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" style="max-width: 50%; height: 500px; margin: 0 auto; object-fit: cover; border-radius: 20px;" src="imagenes/img4.jpg" alt="Third slide">
			</div>
		</div>
	</div>
	
	
	<div class = "footer">
	<jsp:include page="/footer.jsp"/>
	</div>
	  


<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
	
	  
</body>
</html>