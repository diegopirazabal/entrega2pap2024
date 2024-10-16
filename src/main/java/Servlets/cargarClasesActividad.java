package Servlets;

import java.io.IOException;
import java.util.List;

import dtos.dataTypeActividad;
import dtos.dataTypeClase;
import excepciones.ActividadNoExisteException;
import excepciones.ClaseNoExisteException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import logica.Fabrica;
import logica.IControladorActividad;
import logica.IControladorClase;
import logica.IControladorUsuario;

@WebServlet("/cargarClasesActividad")
public class cargarClasesActividad extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public cargarClasesActividad() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Fabrica fabrica = Fabrica.getInstance();
        IControladorActividad iconAct = fabrica.getIControladorActividad();
        IControladorUsuario iconUsr = fabrica.getIControladorUsuario();
        IControladorClase iconCla = fabrica.getIcontroladorClase();
        HttpSession session = request.getSession();
    	Object logueado = session.getAttribute("usuario_logueado");
		String x = logueado.toString();
		String[] parts = x.split(" - ");
        String sessionUsername = parts[0].trim();
        String actividad = request.getParameter("actividades");
        System.out.println("La actividad que traigo a cargar clases es: " + actividad);
        dataTypeActividad auxiliar;
		try {
			auxiliar = iconAct.consultarActividad(actividad);
			request.setAttribute("nombreActividad", auxiliar.getNombre());
			request.setAttribute("lugarActividad", auxiliar.getLugar());
			request.setAttribute("duracionActividad", auxiliar.getDuracion());
			request.setAttribute("costoActividad", auxiliar.getCosto());
		} catch (ActividadNoExisteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        List<dataTypeClase> aux = null;
		try {
			aux = iconCla.listarClasesPorActividad(actividad);
			
			request.setAttribute("listaCla", aux);
			request.getRequestDispatcher("/consultarActividad.jsp").forward(request, response);
		} catch (ClaseNoExisteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    }
    
}