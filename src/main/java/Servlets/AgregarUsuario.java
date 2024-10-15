package Servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import excepciones.UsuarioRepetidoException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Fabrica;
import logica.IControladorUsuario;

@WebServlet("/AgregarUsuario")
public class AgregarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public AgregarUsuario() {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// llamar a metodo de el package modelo, eso seria lo correcto para seguir MVC, patron de diseño
		System.out.println("voy a AGREGAR");
		Fabrica fabrica = Fabrica.getInstance();
		IControladorUsuario icon = fabrica.getIControladorUsuario();

		String nickname = request.getParameter("nickUsuario");
		String nombre = request.getParameter("nombreUsuario");
		String apellido = request.getParameter("apellidoUsuario");
		String email = request.getParameter("emailUsuario");
		String fechaNac1 = request.getParameter("fechaNac1");
		Date fechaNac = null;
		try {
			fechaNac = new SimpleDateFormat("yyyy-mm-dd").parse(fechaNac1);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String contrasena = request.getParameter("passUsuario");
		String contrasena2 = request.getParameter("passUsuario2");//para comparar
		String disciplina = request.getParameter("disciplina");
		String sitioweb = request.getParameter("sitioWeb");
		String cedula = request.getParameter("cedula");
		Boolean esProfesional1 = null;
		String esProfesional = null;
		Boolean esEntrenador;
		System.out.println("\nEl valor del checkbox que traigo es: " + esProfesional);
		if(contrasena.equals(contrasena2)) {

			try {
			if (request.getParameter("opciones").equals("deportista")) {
				esProfesional = request.getParameter("esProfesional");
				if(esProfesional.equals(null))
				esProfesional1 = false;
				if(esProfesional.equals("on"))
				esProfesional1 = true;
				esEntrenador = false;
				icon.crearDeportista(nickname, nombre, apellido, email, fechaNac, esEntrenador, contrasena, esProfesional1);
			}else if(request.getParameter("opciones").equals("entrenador")) {

				esEntrenador = true;
				icon.crearEntrenador(nickname, nombre, apellido, email, fechaNac, esEntrenador, contrasena, disciplina, sitioweb);
			}
			RequestDispatcher rd;
			request.setAttribute("mensaje", "Se ha ingresado correctamente el usuario " + nombre + " de nick " + nickname + " en el sistema.");
			rd = request.getRequestDispatcher("/notificacion.jsp");
			rd.forward(request, response);
			}catch (UsuarioRepetidoException e) {
				// TODO Auto-generated catch block
				RequestDispatcher rd;
				request.setAttribute("mensaje", "Ya existe un usuario con ese correo (" + email + ") o ese nickname (" + nickname + ").");
				rd = request.getRequestDispatcher("/notificacion.jsp");
				rd.forward(request, response);
				}
			}
		}
}
