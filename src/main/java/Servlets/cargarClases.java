package Servlets;

import java.io.IOException;
import java.util.List;

import dtos.dataTypeClase;
import excepciones.ActividadNoExisteException;
import excepciones.ClaseNoExisteException;
import excepciones.UsuarioNoExisteException;
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

@WebServlet("/cargarClases")
public class cargarClases extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public cargarClases() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        List<dataTypeClase> aux = null;
        try {
            aux = iconCla.listarClasesPorActividad(actividad);
            request.setAttribute("listaCla", aux);
            request.getRequestDispatcher("/inscripcion.jsp").forward(request, response);
        } catch (ClaseNoExisteException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}