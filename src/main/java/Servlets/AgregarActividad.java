package Servlets;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import excepciones.ActividadRepetidaException;
import excepciones.UsuarioNoExisteException;
import excepciones.UsuarioRepetidoException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.Entrenador;
import logica.Fabrica;
import logica.IControladorActividad;
import logica.IControladorUsuario;
import logica.Usuario;

@WebServlet("/AgregarActividad")
public class AgregarActividad extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AgregarActividad() {
        super();
    }
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Fabrica fabrica = Fabrica.getInstance();
        IControladorActividad iconAct = fabrica.getIControladorActividad();
        IControladorUsuario iconUsr = fabrica.getIControladorUsuario();

     // obtener datos
       String nombre = request.getParameter("nombre");
       String descripcion = request.getParameter("descripcion");
       int duracion = Integer.parseInt(request.getParameter("duracion"));  
       double costo = Double.parseDouble(request.getParameter("costo"));
       String lugar = request.getParameter("lugar");
       String entrenador = request.getParameter("entrenador"); 
       //opcional
       String imagen = null;
       
       try {
           if (iconUsr.consultarUsuario(entrenador) == null) {
               request.setAttribute("error", "El entrenador no existe.");
               request.getRequestDispatcher("/inicioErroneo.jsp").forward(request, response);
           }
           
           LocalDate fechaAlta = LocalDate.now();  // Fecha actual
           iconAct.crearActividad(nombre, descripcion, duracion, costo, lugar, Date.valueOf(fechaAlta), imagen, entrenador);
           request.getRequestDispatcher("/index.jsp").forward(request, response);
           
       } catch (ActividadRepetidaException e) {
           request.setAttribute("error", "Ya existe una actividad con ese nombre.");
           System.out.println("Actividad ya existente.");
           request.setAttribute("descripcion", descripcion);
           request.setAttribute("duracion", duracion);
           request.setAttribute("costo", costo);
           request.setAttribute("entrenador", entrenador);
           request.setAttribute("lugar", lugar);
           request.getRequestDispatcher("/agregarActividad.jsp").forward(request, response);
           
           
           
       } catch (UsuarioNoExisteException e) {
           request.setAttribute("error", "Entrenador no encontrado.");
           request.getRequestDispatcher("/inicioErroneo.jsp").forward(request, response);
           System.out.println("Actividad creada correctamente.");
} catch (UsuarioRepetidoException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   }
}