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

	<% 
	    String entidadeNome = (String) session.getAttribute("entidadeNome");
		boolean setMatriz = "true".equals(request.getParameter("setMatriz"));
	    String entidadeCnpj = (String) session.getAttribute("entidadeCnpj");
	 %>
	 
	<a href="/WattWorks/restrito-clientes/home-logado.jsp" class="btn-voltar">✕ Voltar</a>
	<div class="container d-flex justify-content-center align-items-center vh-100">	    
	    <div class="container-cadastros p-4 shadow rounded-4" style="min-width: 350px; max-width: 500px;">
	        <h4 class="text-center mb-4">Cadastrar Unidade</h4>
	        
	        <form action="/WattWorks/cadastroUnidade" method="post">
				<div class="row g-3 mb-3">
					<div class="col-12 col-md-6">
						<label for="descricao" class="form-label">Descrição:</label>
							<% if (setMatriz) { %>
								<input type="text" class="form-control" id="descricao" name="descricao" value="Matriz" readonly>
							<% } else { %>
								<input type="text" class="form-control" id="descricao" name="descricao" placeholder="Ex: Unidade Têxtil" required>
							<% } %>
					</div>
					<div class="col-12 col-md-6">
						<label for="cnpjUnidade" class="form-label">CNPJ da Unidade:</label>
							<% if (setMatriz) { %>
								<input type="text" class="form-control" id="cnpjUnidade" name="cnpjUnidade" value="<%= entidadeCnpj %>" readonly>
							<% } else { %>
								<input type="text" class="form-control" id="cnpjUnidade" name="cnpjUnidade" placeholder="00.000.000/0000-00" required>
							<% } %>
					</div>
				</div>						
				<div class="row">
					<div class="col-12">
						<button type="submit" class="btn btn-roxo w-100">Cadastrar</button>
					</div>
				</div>
			</form>
	    </div>
	</div>
</body> 
</html>
