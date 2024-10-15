package Servlets;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/ConsultaUsuario")
public class ConsultaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ConsultaUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		Fabrica fabrica = Fabrica.getInstance();
		IControladorUsuario icon = fabrica.getIControladorUsuario();
		List<dataTypeUsuario> result = null;
		try {
			result = icon.listarTodos();
		} catch (UsuarioNoExisteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  // Cargo la lista de usuario de la base
		request.setAttribute("opciones", result);
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/consultas.jsp");
		rd.forward(request, response);



		 //String opcionSeleccionada = request.getParameter("opcionSeleccionada");
		 //System.out.println(opcionSeleccionada); // Aca se recibe la seleccion del como por su parametros y se carga en seleccion
		 // para pasar al servlets de Consulta Salida
		 String seleccion = request.getParameter("opcionSeleccionada"); // Recibe la seleccion del combo
		 HttpSession session = request.getSession();
		 session.setAttribute("opcionSeleccionada", seleccion);

		 // Ahora con la opcion seleccionada trago el Datatype para cargar una tabla con ese caso

	}
}