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
   
@WebFilter({"/restrito-clientes/*", "/restrito-administracao/*"})
public class AuthFiltro implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        boolean logado = (session != null && session.getAttribute("logado") != null && (Boolean) session.getAttribute("logado"));

        if (!logado) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        } else {
            chain.doFilter(request, response);
        }
    }

    public void destroy() {}
}