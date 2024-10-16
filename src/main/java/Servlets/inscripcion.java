package Servlets;

import java.io.IOException;
import java.util.Date;

import dtos.dataTypeUsuario;
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
import logica.IControladorInscripciones;
import logica.IControladorUsuario;

@WebServlet("/inscripcion")
public class inscripcion extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public inscripcion() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Fabrica fabrica = Fabrica.getInstance();
        IControladorActividad iconAct = fabrica.getIControladorActividad();
        IControladorUsuario iconUsr = fabrica.getIControladorUsuario();
        IControladorClase iconClase = fabrica.getIcontroladorClase();
        IControladorInscripciones iconIns = fabrica.getIcontroladorInscripciones();
        HttpSession session = request.getSession();
        Object logueado = session.getAttribute("usuario_logueado");
        String x = logueado.toString();
        String[] parts = x.split(" - ");
        String sessionUsername = parts[0].trim(); // "carlos"
        String sessionFullName = parts[1].trim(); // "Carlos Tevez"
        String clase = request.getParameter("clases");
        Date fechaIns = new Date();
        String deportista = sessionUsername;
        try {
            dataTypeUsuario aux = iconUsr.verInfoUsuario(deportista);
            
            if (aux.getTipo().equals(false)) {
                iconIns.agregarInscripcionAClase(deportista, clase, fechaIns);

            } else {
                System.out.println("No se realizo la inscripcion porque el usuario no es deportista");
            }
        } catch (UsuarioNoExisteException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

}