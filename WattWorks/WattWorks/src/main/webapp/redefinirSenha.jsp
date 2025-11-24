<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<%@page import="controles.*"%>
<%@page import="modelos.*"%>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" />
    <title>Redefinir Senha</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/WattWorks/estilos/paginas-gerais.css" rel="stylesheet" />
</head>
<body class="bg-cadastros">

    <a href="/WattWorks/login.jsp" class="btn-voltar">✕ Voltar</a>
    
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="container-cadastros text-center">
            <h2>Redefinir Senha</h2>

            <%
                String mensagem = null;
                boolean sucesso = false;

                if(request.getMethod().equalsIgnoreCase("POST")) {
                    String novaSenha = request.getParameter("senha");
                    String confirmarSenha = request.getParameter("confirmarSenha");
                    String emailRecuperacao = (String) session.getAttribute("emailRecuperacao");

                    if(novaSenha != null && confirmarSenha != null && !novaSenha.isEmpty() && !confirmarSenha.isEmpty()) {
                        if(novaSenha.equals(confirmarSenha)) {
                            Usuario user = new Usuario(emailRecuperacao, novaSenha);
                            UsuarioController.atualizarSenha(user);
                            mensagem = "Senha redefinida com sucesso!";
                            sucesso = true;
                        } else {
                            mensagem = "As senhas não coincidem. Tente novamente.";
                        }
                    } else {
                        mensagem = "Preencha todos os campos.";
                    }
                }
            %>

            <% if(!sucesso) { %>
            <form action="redefinirSenha.jsp" method="post">
                <div class="mb-3 text-start">
                    <label for="senha" class="form-label">Nova Senha:</label>
                    <input type="password" class="form-control" id="senha" name="senha" placeholder="Digite sua nova senha" required>
                </div>
                <div class="mb-3 text-start">
                    <label for="confirmarSenha" class="form-label">Confirmar Senha:</label>
                    <input type="password" class="form-control" id="confirmarSenha" name="confirmarSenha" placeholder="Confirme sua nova senha" required>
                </div>

                <% if(mensagem != null) { %>
                    <h3 class="text-danger fs-6 fw-bold mb-3"><%= mensagem %></h3>
                <% } %>

                <button type="submit" class="btn btn-roxo w-100">Redefinir Senha</button>
            </form>
            <% } else { %>
                <div class="mt-4">
                    <i class="bi bi-check-circle-fill text-success" style="font-size: 4rem;"></i>
                    <h1 class="text-success fw-bold mt-3" style="font-size: 2.5rem;"><%= mensagem %></h1>
                    <a class="btn btn-roxo mt-4" href="login.jsp">Voltar para Login</a>
                </div>
            <% } %>

        </div>
    </div>
</body>
</html>
