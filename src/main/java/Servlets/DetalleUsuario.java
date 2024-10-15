package Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import dtos.dataTypeActividad;
import dtos.dataTypeClase;
import dtos.dataTypeUsuario;
import excepciones.ClaseNoExisteException;
import excepciones.UsuarioNoExisteException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import logica.Actividad;
import logica.Clase;
import logica.Fabrica;
import logica.IControladorActividad;
import logica.IControladorClase;
import logica.IControladorUsuario;
import logica.Inscripcion;

@WebServlet("/DetalleUsuario")
public class DetalleUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DetalleUsuario() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession objSesion = request.getSession();
		Object logueado = objSesion.getAttribute("usuario_logueado");
		String x = logueado.toString();
		String[] parts = x.split(" - ");

        // Acceder a las partes
        String sessionUsername = parts[0].trim(); // "carlos"
        String sessionFullName = parts[1].trim();  // "Carlos Tevez"

        // Imprimir los resultados
        //System.out.println("Username: " + sessionUsername);
        //System.out.println("Full Name: " + sessionFullName);
		Fabrica fabrica = Fabrica.getInstance();
		IControladorUsuario icon = fabrica.getIControladorUsuario();
		IControladorActividad controlAct = fabrica.getIControladorActividad();
		IControladorClase controlCla = fabrica.getIcontroladorClase();
		String nickname = request.getParameter("nickname");

		dataTypeUsuario result = null;
		String prueba = request.getParameter("opciones");
		System.out.println("veo q traigo de la lista de usuarios: " + prueba);
		System.out.println("nickname: " + nickname);
		if(!sessionUsername.equals(nickname)) {// Usuario logueado != Usuario buscado
			try {
				System.out.println("Llegue al if de usuario != usuario logueado y el usuario logueado es: " + sessionUsername);
				result = icon.consultarUsuario(nickname);
				if (result == null) {
					request.getRequestDispatcher("/usuarioInexistente.jsp").forward(request, response);
					return;
				}
				request.setAttribute("nombre", result.getNombre());
				request.setAttribute("apellido", result.getApellido());
				request.setAttribute("fechaNac", result.getFNacimiento());
				request.setAttribute("email", result.getEmail());
				request.setAttribute("iguales", false);
				if(result.getTipo()) {//es Entrenador
					List<dataTypeActividad> actividadesDelEntrenador = controlAct.obtenerActividadesConfirmadasPorEntrenador(nickname);
					List<dataTypeClase> clasesRelacionadas = new LinkedList<>(); // Inicializa la lista

					for (int i = 0; i < actividadesDelEntrenador.size(); i++) { // Cambiado a i < actividadesDelEntrenador.size()
					    List<dataTypeClase> clasesPorActividad = controlCla.listarClasesPorActividad(actividadesDelEntrenador.get(i).getNombre());
					    clasesRelacionadas.addAll(clasesPorActividad); // Agrega las clases a la lista
					}

					// Ahora clasesRelacionadas contiene todas las clases relacionadas con las actividades del entrenador


					request.setAttribute("disciplina", actividadesDelEntrenador);
					request.setAttribute("auxiliar", clasesRelacionadas);
					request.setAttribute("tipoUsuario", "Entrenador");
				}
				else {//es Deportista
					List<Inscripcion> listaInscripciones = controlCla.listarInscripcionesPorClase(nickname);
					request.setAttribute("inscripciones", listaInscripciones);
					request.setAttribute("tipoUsuario", "Deportista");
				}
				RequestDispatcher rd = request.getRequestDispatcher("/consultas.jsp");
				rd.forward(request, response);
			} catch (UsuarioNoExisteException | ClaseNoExisteException e) {
				// Maneja la excepción si el usuario no existe, redirigiendo al JSP de error
				e.printStackTrace();
				request.getRequestDispatcher("/usuarioInexistente.jsp").forward(request, response);
			}
		}else if (sessionUsername.equals(nickname)) {
			try {
				System.out.println("Llegue al if de usuario = usuario logueado y el usuario es: " + nickname);
				result = icon.consultarUsuario(nickname);
				if (result == null) {
					request.getRequestDispatcher("/usuarioInexistente.jsp").forward(request, response);
					return;
				}
				request.setAttribute("nombre", result.getNombre());
				request.setAttribute("apellido", result.getApellido());
				request.setAttribute("fechaNac", result.getFNacimiento());
				request.setAttribute("email", result.getEmail());
				request.setAttribute("iguales", true);
				if(result.getTipo()) {
					List<dataTypeActividad> actividadesDelEntrenador = controlAct.listarActividadesPorEntrenador(nickname);
					request.setAttribute("disciplina", actividadesDelEntrenador);
					request.setAttribute("tipoUsuario", "Entrenador");
				}else {
					List<Inscripcion> listaInscripciones = controlCla.listarInscripcionesPorClase(nickname);
					request.setAttribute("inscripciones", listaInscripciones);
					request.setAttribute("tipoUsuario", "Deportista");
					List<Double> listaCostos = new ArrayList<>();  // Lista para almacenar los costos

					for (Inscripcion inscripcion : listaInscripciones) {
					    // Obtén la clase asociada a la inscripción
					    Clase claseAsociada = inscripcion.getClase();
					    Actividad actividadDeLaClase = claseAsociada.getActividad();
					    double costoActividad = actividadDeLaClase.getCosto();

					    // Agrega el costo a la lista de costos
					    listaCostos.add(costoActividad);
					}
					System.out.println("LISTA DE COSTSOS: " + listaCostos);
					request.setAttribute("costoClase", listaCostos);
				}
				RequestDispatcher rd = request.getRequestDispatcher("/consultas.jsp");
				rd.forward(request, response);
			} catch (UsuarioNoExisteException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
//		try {
//			result = icon.consultarUsuario(nickname);
//			if (result == null) {
//				request.getRequestDispatcher("/usuarioInexistente.jsp").forward(request, response);
//				return;
//			}
//			request.setAttribute("nombre", result.getNombre());
//			request.setAttribute("apellido", result.getApellido());
//			request.setAttribute("fechaNac", result.getFNacimiento());
//			request.setAttribute("email", result.getEmail());
//			if(result.getTipo()) {
//				List<dataTypeActividad> actividadesDelEntrenador = controlAct.obtenerActividadesConfirmadasPorEntrenador(nickname);
//				request.setAttribute("disciplina", actividadesDelEntrenador);
//				request.setAttribute("tipoUsuario", "Entrenador");
//			}
//			else {
//				request.setAttribute("tipoUsuario", "Deportista");
//			}
//			RequestDispatcher rd = request.getRequestDispatcher("/consultas.jsp");
//			rd.forward(request, response);
//		} catch (UsuarioNoExisteException e) {
//			// Maneja la excepción si el usuario no existe, redirigiendo al JSP de error
//			e.printStackTrace();
//			request.getRequestDispatcher("/usuarioInexistente.jsp").forward(request, response);
//		}
	}
}
