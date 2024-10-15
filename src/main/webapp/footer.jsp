<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="text-center">
 </div>
<div id="footer">
	<div id="footer_copyright">Programacion de Aplicaciones &COPY; 2024</div>

	<div id="footer_derecha">
                <%
                    //Integer paginasNavegadas;
                    //paginasNavegadas = (Integer) session.getAttribute("paginas_navegadas");
                     Integer paginasNavegadas = (Integer) session.getAttribute("paginas_navegadas");
                    if (paginasNavegadas == null) {
                         paginasNavegadas = 0; // Inicializa en 0 si es la primera vez que el usuario navega
                    }
                %>

               <% if(paginasNavegadas == 0) { %>
                   <div id="footer_0_paginas">No has entrado a ninguna página aún.</div>
               <% } else if(paginasNavegadas == 1){ %>
                   <div id="footer_1_pagina" >Has entrado a una página.</div>
               <% } else { %>
                   <div id="footer_n_paginas">Has entrado a <%= paginasNavegadas.toString() %> páginas</div>
               <% }
                  session.setAttribute("paginas_navegadas", paginasNavegadas+1);
               %>
	</div>
</div>
</div>