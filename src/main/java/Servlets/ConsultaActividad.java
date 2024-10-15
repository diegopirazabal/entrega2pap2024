package Servlets;

import java.io.IOException;
import java.util.List;

import dtos.dataTypeActividad;
import excepciones.ActividadNoExisteException;
import excepciones.UsuarioNoExisteException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Fabrica;
import logica.IControladorActividad;

@WebServlet("/ConsultaActividad")
public class ConsultaActividad extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public ConsultaActividad() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Fabrica fabrica = Fabrica.getInstance();
        IControladorActividad icon = fabrica.getIControladorActividad();
        List<dataTypeActividad> actividades = null;
        
        try {
            actividades = icon.listarTodas();
        } catch (ActividadNoExisteException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "No existen actividades.");
		}
        
        // Guardar la lista de actividades en el request
        request.setAttribute("actividades", actividades);
        
        // Redirigir a la JSP que mostrará las actividades
        RequestDispatcher rd = request.getRequestDispatcher("/consultaActividad.jsp");
        rd.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el nombre de la actividad seleccionada del formulario
        String nombreActividad = request.getParameter("actividad");

        // Lógica para buscar la actividad en el sistema
        Fabrica fabrica = Fabrica.getInstance();
        IControladorActividad icon = fabrica.getIControladorActividad();
        dataTypeActividad actividad = null;

        try {
            actividad = icon.consultarActividad(nombreActividad);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "No se encontró la actividad.");
        }

        // Guardar la información de la actividad en el request
        request.setAttribute("actividad", actividad);

        // Redirigir a una página JSP para mostrar los detalles de la actividad
        RequestDispatcher rd = request.getRequestDispatcher("/consultaActividad.jsp");
        rd.forward(request, response);
    }
}