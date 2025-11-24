package services;

import java.io.IOException;
import java.time.LocalDate;

import controles.UnidadeController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelos.Unidade;
 
@WebServlet("/editarUnidade")
public class EditarUnidadeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	HttpSession session = request.getSession();
        	Integer entidadeId = (Integer) session.getAttribute("entidadeId");

        	UnidadeController uniController = new UnidadeController();
            Unidade uni = new Unidade(Integer.parseInt(request.getParameter("id")), request.getParameter("descricao"), request.getParameter("cnpjUnidade"),
            		LocalDate.parse(request.getParameter("dataCadastro")), Integer.parseInt(request.getParameter("subgrupoId")), Integer.parseInt(request.getParameter("modalidadeId")), entidadeId);
            uniController.editarUnidade(uni);
            
	        response.sendRedirect("/WattWorks/restrito-clientes/configurarConta.jsp");
        } catch (Exception e) {
            response.setStatus(500);
            response.getWriter().write("Erro no registro: " + e.getMessage());
        }
    }
}
