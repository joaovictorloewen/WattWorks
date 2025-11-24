package services;

import java.io.IOException;

import controles.EntidadeController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelos.Entidade;
import modelos.Usuario;

@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Entidade ent = new Entidade(request.getParameter("nome"), request.getParameter("cnpj"), request.getParameter("fone"));
            Usuario user = new Usuario(request.getParameter("email"), request.getParameter("senha"), request.getParameter("tipoUsuario"));
            
            EntidadeController entController = new EntidadeController();
            entController.salvarEntidadeEUsuario(ent, user);
            
            request.setAttribute("email", user.getEmail());
            request.setAttribute("senha", user.getSenhaHash());
            
            request.getRequestDispatcher("/login").forward(request, response);
        } catch (Exception e) {
            response.setStatus(500);
            response.getWriter().write("Erro no registro: " + e.getMessage());
        }
    }
}
