package filtros;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter({"/restrito-administracao/*"})
public class AdmPagesFiltro implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        if (session != null && !"CLIENTE".equals(session.getAttribute("tipoUsuario"))) {
            chain.doFilter(request, response); 
        } else if (session == null) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        } else {
            res.sendRedirect(req.getContextPath() + "/acesso-negado-adm.html");
        }
    }

    public void destroy() {}
}
