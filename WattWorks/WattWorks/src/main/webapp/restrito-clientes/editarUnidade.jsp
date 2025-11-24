<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="modelos.*"%>
<%@page import="controles.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" />	
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
	<link href="/WattWorks/estilos/paginas-gerais.css" rel="stylesheet" />
</head>
<body class="bg-light bg-cadastros"> 
	<% 	    
		int id = Integer.parseInt(request.getParameter("id"));
		UnidadeController uniController = new UnidadeController();
		Unidade uni = uniController.getById(id);
	 %>	 
	<a href="/WattWorks/restrito-clientes/configurarConta.jsp" class="btn-voltar">✕ Voltar</a>
	<div class="container d-flex justify-content-center align-items-center vh-100">	    
	    <div class="container-cadastros p-4 shadow rounded-4" style="min-width: 350px; max-width: 500px;">
	        <h4 class="text-center mb-4">Editar Unidade</h4>
	        
	        <form action="/WattWorks/editarUnidade" method="post">
	        	<input type="hidden" name="id" value="<%= uni.getId() %>">
	        	<input type="hidden" name="dataCadastro" value="<%= uni.getDataCadastro() %>">
	        
				<div class="row g-3 mb-3">
					<div class="col-12 col-md-6">
						<label for="descricao" class="form-label">Descrição:</label>
						<input type="text" class="form-control" id="descricao" name="descricao" placeholder="Ex: Unidade Têxtil" value="<%= uni.getDescricao() %>" required>
					</div>
					<div class="col-12 col-md-6">
						<label for="cnpjUnidade" class="form-label">CNPJ da Unidade:</label>
						<input type="text" class="form-control" id="cnpjUnidade" name="cnpjUnidade" placeholder="00.000.000/0000-00" value="<%= uni.getCnpj() %>" required>
					</div>
				</div>
				
				<div class="row g-3 mb-3">
					<div class="col-12 col-md-6">
						<label for="subgrupoId" class="form-label">Subgrupo da Fatura:</label>
						<select class="form-select" id="subgrupoId" name="subgrupoId" required>
							<option value="" disabled selected>Selecione</option>
							<option value="1" <%= uni.getSubgrupoId() == 1 ? "selected" : "" %>>A2</option>
							<option value="2" <%= uni.getSubgrupoId() == 2 ? "selected" : "" %>>A3</option>
							<option value="3" <%= uni.getSubgrupoId() == 3 ? "selected" : "" %>>A3A</option>
							<option value="4" <%= uni.getSubgrupoId() == 4 ? "selected" : "" %>>A4</option>
							<option value="5" <%= uni.getSubgrupoId() == 5 ? "selected" : "" %>>B1</option>
							<option value="6" <%= uni.getSubgrupoId() == 6 ? "selected" : "" %>>B2</option>
							<option value="7" <%= uni.getSubgrupoId() == 7 ? "selected" : "" %>>B3</option>
							<option value="8" <%= uni.getSubgrupoId() == 8 ? "selected" : "" %>>B4</option>
							<option value="9" <%= uni.getSubgrupoId() == 9 ? "selected" : "" %>>B</option>
						</select>
					</div>
				
					<div class="col-12 col-md-6">
						<label for="modalidadeId" class="form-label">Modalidade da Fatura:</label>
						<select class="form-select" id="modalidadeId" name="modalidadeId" required>
							<option value="" disabled selected>Selecione</option>
							<option value="1" <%= uni.getModalidadeId() == 1 ? "selected" : "" %>>AZUL</option>
							<option value="2" <%= uni.getModalidadeId() == 2 ? "selected" : "" %>>AZULPAE</option>
							<option value="3" <%= uni.getModalidadeId() == 3 ? "selected" : "" %>>VERDE</option>
							<option value="4" <%= uni.getModalidadeId() == 4 ? "selected" : "" %>>VERDEPAE</option>
						</select>
					</div>
				</div>
				
				<div class="row">
					<div class="col-12">
						<button type="submit" class="btn btn-roxo w-100">Atualizar</button>
					</div>
				</div>
			</form>
	    </div>
	</div>
</body> 
</html>
