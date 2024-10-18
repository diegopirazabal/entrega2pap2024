package Servlets;

import java.io.IOException;
import java.util.List;

import dtos.dataTypeClase;
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

@WebServlet("/ConsultaClase")
public class ConsultaClase extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ConsultaClase() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Fabrica fabrica = Fabrica.getInstance();
        IControladorActividad iconAct = fabrica.getIControladorActividad();
        IControladorUsuario iconUsr = fabrica.getIControladorUsuario();
        IControladorClase iconClase = fabrica.getIcontroladorClase();
        HttpSession session = request.getSession();
        Object logueado = session.getAttribute("usuario_logueado");
        String x = logueado.toString();
        String[] parts = x.split(" - ");
        String sessionUsername = parts[0].trim(); // "carlos"
        String sessionFullName = parts[1].trim(); // "Carlos Tevez"

        String actividad = request.getParameter("actividades");

        List<dataTypeClase> aux = null;
        try {
            aux = iconClase.listarClasesPorActividad(actividad);
            request.setAttribute("listCla", aux);
            request.getRequestDispatcher("/consultaClase.jsp").forward(request, response);

        } catch (ClaseNoExisteException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}