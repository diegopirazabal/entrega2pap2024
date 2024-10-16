package Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

@WebServlet("/DetalleClaseDeActividad")
public class DetalleClaseDeActividad extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DetalleClaseDeActividad() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Fabrica fabrica = Fabrica.getInstance();
        IControladorActividad iconAct = fabrica.getIControladorActividad();
        IControladorUsuario iconUsr = fabrica.getIControladorUsuario();
        IControladorClase iconClase = fabrica.getIcontroladorClase();
        HttpSession session = request.getSession();
    	Object logueado = session.getAttribute("usuario_logueado");
		String x = logueado.toString();
		String[] parts = x.split(" - ");
        String sessionUsername = parts[0].trim(); // "carlos"
        String sessionFullName = parts[1].trim();  // "Carlos Tevez"
        
        String claseSeleccionada = request.getParameter("clases");
        
        dataTypeClase aux = iconClase.obtenerClasePorNombre2(claseSeleccionada);
        request.setAttribute("nombreClase", aux.getNombre());
        System.out.println("La fecha que voy a formatear es: " + aux.getFecha());
        Date fecha = aux.getFecha();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		String fechaFormateada = sdf.format(fecha);
        request.setAttribute("fechaClase", fechaFormateada);
        request.setAttribute("horaClase", aux.getHora());
        request.setAttribute("lugarClase", aux.getLugar());
        request.setAttribute("cuposClase", aux.getCupo());
		request.getRequestDispatcher("/consultarActividad.jsp").forward(request, response);

        
		
		

        
    }
    
}