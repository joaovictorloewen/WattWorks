<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="modelos.*"%>
<%@page import="dto.*"%>
<%@page import="controles.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" /> 
    <title>Cadastro - EneFree</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/WattWorks/estilos/paginas-gerais.css">
</head>
<body class="bg-light bg-cadastros">
	<% 	    
		int id = (Integer) session.getAttribute("entidadeId"); 
		EntidadeController entController = new EntidadeController();
		EntidadeDTO entDTO = entController.getEntDtoById(id);
	 %>	 
    <a href="/WattWorks/restrito-clientes/configurarConta.jsp" class="btn-voltar">✕ Voltar</a>

    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="container-cadastros card-cadastros p-4 shadow rounded-4" style="min-width: 350px; max-width: 600px;">
            <h4 class="text-center mb-4">Editar Conta</h4>
            <form action="/WattWorks/editarEntidade" method="post">
            	<input type="hidden" name="dataCadastro" value="<%= entDTO.getDataCadastro() %>">	        	
                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="nome" class="form-label">Empresa:</label>
                        <input type="text" class="form-control" id="nome" name="nome" placeholder="Informe o nome da Matriz" value="<%= entDTO.getNome() %>" required>
                    </div>
                    <div class="col-md-6">
                        <label for="email" class="form-label">E-mail:</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Digite seu e-mail" value="<%= entDTO.getEmail() %>" required>
                    </div>
                    <div class="col-md-6">
                        <label for="fone" class="form-label">Telefone:</label>
                        <input type="tel" class="form-control" id="fone" name="fone" placeholder="(00) 00000-0000" value="<%= entDTO.getFone() %>" required>
                    </div>
                    <div class="col-md-6">
                        <label for="cnpj" class="form-label">CNPJ:</label>
                        <input type="text" class="form-control" id="cnpj" name="cnpj" placeholder="00.000.000/0000-00" value="<%= entDTO.getCnpj() %>" required>
                    </div>
                    <div class="col-md-12 d-flex align-items-end">
                        <button type="submit" class="btn btn-roxo w-100">Atualizar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</body> 
</html>
