package Servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.EstadoSesion;

/**
 * Servlet implementation class Home
 */
@WebServlet("/home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Home() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * inicializa la sesión si no estaba creada
	 * 
	 * @param request
	 */
	public static void initSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("paginas_navegadas") == null) {
			session.setAttribute("paginas_navegadas", 0);
		}
		if (session.getAttribute("estado_sesion") == null) {
			session.setAttribute("estado_sesion", EstadoSesion.NO_LOGIN); // Seteo si esta o no logeado
		}
	}

	/**
	 * Devuelve el estado de la sesión
	 * 
	 * @param request
	 * @return
	 */
	public static EstadoSesion getEstado(HttpServletRequest request) {
		return (EstadoSesion) request.getSession().getAttribute("estado_sesion");
	}

	private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		initSession(req);

		switch (getEstado(req)) { // el metodo getEstado de arriba duevuelve lo que hay en EstadoSesion
			case NO_LOGIN:
				// hace que se ejecute el jsp sin cambiar la url ACA MANDA UNA JSP
				req.getRequestDispatcher("/iniciar.jsp").forward(req, resp);
				break;
			case LOGIN_INCORRECTO:
				// hace que se ejecute el jsp sin cambiar la url
				req.getRequestDispatcher("/inicioErroneo.jsp").forward(req, resp);
				break;
			case LOGIN_CORRECTO:
				// manda una redirección a otra URL (cambia la URL) ACA MANDA A OTRO SERVLET
				req.getRequestDispatcher("/index.jsp").forward(req, resp);
				break;
		}
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
