package services;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import controles.EntidadeController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelos.Entidade;
import modelos.Usuario;

@WebServlet("/editarEntidade")
public class EditarEntidadeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	HttpSession session = request.getSession();
        	Integer entidadeId = (Integer) session.getAttribute("entidadeId");
        	Integer usuarioId = (Integer) session.getAttribute("usuarioId");

        	EntidadeController entController = new EntidadeController();
        	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        	LocalDate dataCadastro = LocalDate.parse(request.getParameter("dataCadastro"), formatter);

        	Entidade ent = new Entidade(
        		    entidadeId,
        		    request.getParameter("nome"),
        		    request.getParameter("cnpj"),
        		    request.getParameter("fone"),
        		    dataCadastro,
        		    usuarioId
        	);
            Usuario user = new Usuario(usuarioId, request.getParameter("email")); 
            entController.editarEntidadeEUsuario(ent, user);
            
	        response.sendRedirect("/WattWorks/restrito-clientes/configurarConta.jsp");
        } catch (Exception e) {
            response.setStatus(500);
            response.getWriter().write("Erro no registro: " + e.getMessage());
        }
    }
}
