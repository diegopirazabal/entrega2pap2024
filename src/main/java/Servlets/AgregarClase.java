package Servlets;

import java.io.IOException;

import excepciones.ActividadNoExisteException;
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

@WebServlet("/AgregarClase")
public class AgregarClase extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AgregarClase() {
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
        
        
        try {
			request.setAttribute("listaAct", iconAct.listarTodas());
			request.setAttribute("tipoUsuario", iconUsr.verInfoUsuario(sessionUsername));
			request.getRequestDispatcher("/agregarClase.jsp").forward(request, response);
		} catch (ActividadNoExisteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UsuarioNoExisteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
}