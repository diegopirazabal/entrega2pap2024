package Servlets;

import java.io.IOException;

import dtos.dataTypeUsuario;
import excepciones.UsuarioNoExisteException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import logica.Fabrica;
import logica.IControladorUsuario;
import modelo.EstadoSesion; // Enumerado con el estado de la sesion

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession objSesion = request.getSession(); // Obtengo la sesion en objSesion

		String login = request.getParameter("login"); // el request tiene un parametro login, que capturo de esta manera
		String password = request.getParameter("password"); // Idem anterior
		EstadoSesion nuevoEstado = null; // Objeto para mantener la sesion

		// buscar usuario
		Fabrica fabrica = Fabrica.getInstance();
		IControladorUsuario icon = fabrica.getIControladorUsuario();

		dataTypeUsuario result = null;
		System.out.println("La user del form es: " + login);
		System.out.println("La password del form es: " + password);

		try {
			if (login.contains("@") && login.contains(".")) { // es un correo
				result = icon.buscarUsuarioPorEmail(login);
			} else {
				result = icon.consultarUsuario(login);
			}
			
			if (login.equals(result.getNickname()) || login.equals(result.getEmail())) {
				if (password.equals(result.getContrasena())) {
					nuevoEstado = EstadoSesion.LOGIN_CORRECTO;
					request.getSession().setAttribute("usuario_logueado", result);
				} else {
					nuevoEstado = EstadoSesion.LOGIN_INCORRECTO;
					// setea el usuario logueado

				}
			}

		} catch (UsuarioNoExisteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} // Cargo el DataUsuario

		objSesion.setAttribute("estado_sesion", nuevoEstado); // Aca mando el estado como parametros a /home

		// redirige a la página principal para que luego rediriga a la página que
		// corresponde

		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
