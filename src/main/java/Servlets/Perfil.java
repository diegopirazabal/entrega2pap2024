package Servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
import logica.IControladorUsuario;

/**
 * Servlet implementation class Home
 */
@WebServlet ("/perfil")
public class Perfil extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Perfil() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	HttpSession session = request.getSession();
    	Fabrica fabrica = Fabrica.getInstance();
    	IControladorUsuario icon = fabrica.getIControladorUsuario();
    	Object logueado = session.getAttribute("usuario_logueado");
    	System.out.println("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
		String x = logueado.toString();
		String[] parts = x.split(" - ");
        String sessionUsername = parts[0].trim(); // "carlos"
        String sessionFullName = parts[1].trim();  // "Carlos Tevez"
		dataTypeUsuario aux;


		try {
			aux = icon.verInfoUsuario(sessionUsername);
			request.setAttribute("nombre", aux.getNombre());
			request.setAttribute("prueba", aux.getNombre());
			request.setAttribute("apellido", aux.getApellido());
			request.setAttribute("nickname", aux.getNickname());
			request.setAttribute("email", aux.getEmail());

			Date fecha = aux.getFNacimiento();
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	        String fechaFormateada = sdf.format(fecha);
			request.setAttribute("fecha", fechaFormateada);
			String nombre = request.getParameter("nombre");
			String apellido = request.getParameter("apellido");
			System.out.println("El nombre nuevo en AAAPerfil es: " + nombre);
			//icon.editarNombreApellido(sessionUsername, nombre, apellido);
			//aux = icon.verInfoUsuario(sessionUsername);
			//System.out.println("El usuario modificado es: " + aux.getNombre() + " " + aux.getApellido());
			//request.getRequestDispatcher("/PerfilModificado.jsp").forward(request, response);
		} catch (UsuarioNoExisteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}
}