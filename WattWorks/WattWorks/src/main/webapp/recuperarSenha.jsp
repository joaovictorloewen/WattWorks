<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" />
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/WattWorks/estilos/paginas-gerais.css">
</head>
<body class="bg-light bg-cadastros"> 
	  
	<a href="/WattWorks/login.jsp" class="btn-voltar">✕ Voltar</a>
	<div class="container d-flex justify-content-center align-items-center vh-100">	    
	    <div class="container-cadastros p-4 shadow rounded-4" style="min-width: 350px; max-width: 500px;">
	        
	        <h4 class="text-center mb-4">Recuperação de Senha</h4>
		    <form action="recuperar-senha" method="post">
		        <label for="email" class="form-label">E-mail:</label>			    
		        <input class="form-control" type="email" name="email" placeholder="Digite seu e-mail" required>
		        <%  
		            String mensagem = (String) session.getAttribute("mensagemRecuperacao");
		            if (mensagem != null) { 
		        %>
		            <h3 class="text-center mt-3 fw-bold text-danger fs-6"><%= mensagem %></h3>
		        <% 
		            session.removeAttribute("mensagemRecuperacao"); 
		            } 
		        %>   
		        <button type="submit" class="btn btn-roxo w-100 mt-3">Receber Código</button>
		    </form>  
	    </div>
	</div>
</body> 
</html>
