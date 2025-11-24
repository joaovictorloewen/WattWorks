package services;

import java.io.IOException;

import controles.EntidadeController;
import dao.UsuarioDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelos.Entidade;
import modelos.Usuario;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 

    	try {
    	    UsuarioDao usuarioDao = new UsuarioDao();
    	    Usuario usuario = usuarioDao.autenticar(request.getParameter("email"), request.getParameter("senha"));
    	    
    	    if (usuario != null) {
    	    	EntidadeController eController = new EntidadeController();
    		    Entidade ent = eController.getEntidadeByUserId(usuario.getId());
    	        HttpSession session = request.getSession();

    		    if (ent != null) {
    		        session.setAttribute("entidadeId", ent.getId());
    		        session.setAttribute("entidadeNome", ent.getNome());
    		        session.setAttribute("entidadeCnpj", ent.getCnpj());
    		        session.setAttribute("usuarioId", usuario.getId());
    		        session.setAttribute("tipoUsuario", usuario.getTipoUsuario());
    		    } else {
    		        session.setAttribute("mensagemErroLogin", "Email ou senha inválidos.");
    		        response.sendRedirect("/WattWorks/login.jsp");
    		        return;
    		    }
       	        session.setAttribute("logado", true);
       	        
       	        if (usuario.getTipoUsuario().equals("CLIENTE")) {
            	    response.sendRedirect("/WattWorks/restrito-clientes/home-logado.jsp");
       	        } else {
            	    response.sendRedirect("/WattWorks/restrito-administracao/home-logado-adm.jsp");
       	        }
    	    } else {
    	        request.getSession().setAttribute("mensagemErroLogin", "Email ou senha inválidos.");
    	        response.sendRedirect("/WattWorks/login.jsp");
    	    }
    	} catch (Exception e) {
    	    e.printStackTrace();
    	    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    	    response.getWriter().write("Erro interno no servidor durante o login.");
    	}
	}
}
