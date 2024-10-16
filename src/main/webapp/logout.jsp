<%@ page session="false" %> <% // Obtener la sesi�n, si existe HttpSession
session = request.getSession(false); if (session != null) { // Invalida la
sesi�n session.invalidate(); } // Redirige al login o a la p�gina principal
response.sendRedirect("index.jsp"); // Cambia la ruta seg�n la p�gina a la que
desees redirigir %>
