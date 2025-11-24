<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" />
    <title>Validar Código</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/WattWorks/estilos/paginas-gerais.css">
</head>
<body class="bg-light bg-cadastros"> 
    <a href="/WattWorks/login.jsp" class="btn-voltar">✕ Voltar</a>
    <div class="container d-flex justify-content-center align-items-center vh-100">        
        <div class="container-cadastros p-4 shadow rounded-4" style="min-width: 350px; max-width: 500px;">
            
            <h4 class="text-center mb-4">Código de Validação</h4>

            <%
                String mensagem = null;
                if(request.getMethod().equalsIgnoreCase("POST")) {
                    String codigoDigitado = request.getParameter("codigo");
                    String codigoEsperado = (String) session.getAttribute("codigoRecuperacao");

                    if (codigoEsperado != null && codigoDigitado != null && codigoDigitado.equals(codigoEsperado)) {
                        response.sendRedirect("redefinirSenha.jsp");
                    } else {
                        mensagem = "Código inválido. Tente novamente.";
                    }
                }
            %>
 
            <form action="validarCodigo.jsp" method="post">
                <label for="codigo" class="form-label">Digite o código enviado por e-mail:</label>               
                <input class="form-control" type="number" name="codigo" placeholder="Código" required>
                
                <% 
                if(mensagem != null) { %>
                    <h3 class="text-danger mt-3 fs-6 fw-bold text-center"><%= mensagem %></h3>
                <% 
                }
                
                String emailRecuperacao = (String) session.getAttribute("emailRecuperacao");
                 
                if(emailRecuperacao != null) { 
                %>					
					<a href="#" class="link-cadastro text-center"> 
					   Reenviar código
					</a>
				<% } else { %>
				    <span class="text-muted">Não há e-mail para reenviar código.</span>
				<% } %>  
				        
                <button type="submit" class="btn btn-roxo w-100 mt-3">Validar</button>
            </form>
        </div>
    </div>
</body> 
</html>
