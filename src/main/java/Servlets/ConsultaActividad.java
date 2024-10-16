package Servlets;

import java.io.IOException;
import java.util.List;

import dtos.dataTypeActividad;
import dtos.dataTypeClase;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Fabrica;
import logica.IControladorActividad;
import logica.IControladorClase;

@WebServlet("/ConsultaActividad")
public class ConsultaActividad extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ConsultaActividad() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombreActividad = request.getParameter("actividades");
        System.out.println("La actividad que me traje a consultaActividad es: " + nombreActividad);
        Fabrica fabrica = Fabrica.getInstance();
        IControladorActividad icon = fabrica.getIControladorActividad();
        IControladorClase iconClas = fabrica.getIcontroladorClase();
        dataTypeActividad actividad = null;

        try {
            actividad = icon.consultarActividad(nombreActividad);
            String lugar = actividad.getLugar();
            int duracion = actividad.getDuracion();
            double costo = actividad.getCosto();
            List<dataTypeClase> auxiliar = null;
            auxiliar = iconClas.listarClasesPorActividad(nombreActividad);
            request.setAttribute("listaCla", auxiliar);
            request.setAttribute("nombre", nombreActividad);
            request.setAttribute("lugar", lugar);
            request.setAttribute("duracion", duracion);
            request.setAttribute("costo", costo);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "No se encontró la actividad.");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/consultarActividad.jsp");
        rd.forward(request, response);
    }
}