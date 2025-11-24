<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" />
    <title>Acessar Conta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="/WattWorks/estilos/paginas-gerais.css" rel="stylesheet" />
</head>
<body class="bg-cadastros">

    <a href="/WattWorks/index.html" class="btn-voltar">✕ Voltar</a>
 	
 	<div class="container d-flex justify-content-center align-items-center min-vh-100">
	    <div class="container-cadastros text-center">
	        <h2>Acessar Conta</h2>
	        <form action="login" method="post">
	            <div class="mb-3 text-start">
	            	<label for="email" class="form-label">Email:</label>
	                <input type="email" class="form-control" id="email" name="email" placeholder="Digite o email cadastrado" required>
	            </div>
	            <div class="mb-3 text-start">
	            	<label for="senha" class="form-label">Senha:</label>
	                <input type="password" class="form-control" id="senha" name="senha" placeholder="Digite sua senha" required>
	            </div>
		        <% 
				    String mensagem = (String) session.getAttribute("mensagemErroLogin");
				    if (mensagem != null && !mensagem.isEmpty()) { 
				%>
					<h3 class="text-danger fs-6 fw-bold mb-3"><%= mensagem %></h3>
				<%  
				    }         
				    session.removeAttribute("mensagemErroLogin");
				%>
	            <button type="submit" class="btn btn-roxo w-100">Entrar</button>
	        </form>
	        <div class="mt-3">
	            <a class="link-cadastro" href="recuperarSenha.jsp">Esqueceu a senha?</a><br>
	            <span>Não possui um cadastro? <a class="link-cadastro" href="/WattWorks/registro.html">Registre-se</a></span>
	        </div>
	    </div>
    </div>
</body>
</html>