package services;

import java.io.IOException;

import controles.UnidadeController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelos.Unidade;

@WebServlet("/cadastroUnidade")
public class CadastroUnidadeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	HttpSession session = request.getSession();
        	Integer entidadeId = (Integer) session.getAttribute("entidadeId");

        	UnidadeController uniController = new UnidadeController();
            Unidade uni = new Unidade(request.getParameter("descricao"), request.getParameter("cnpjUnidade"), entidadeId);
            uniController.salvarUnidade(uni);
            
	        response.sendRedirect("/WattWorks/restrito-clientes/fatura.jsp");
        } catch (Exception e) {
            response.setStatus(500);
            response.getWriter().write("Erro no registro: " + e.getMessage());
        }
    }
}
