<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="modelos.*"%>
<%@page import="controles.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" />
    <title>Configurar Conta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="/WattWorks/estilos/paginas-gerais.css" rel="stylesheet" />
    <style>
        :root {
          --roxo-principal: #5e35b1;
          --roxo-secundario: #8e24aa;
          --roxo-claro-suave: #EDE7F6;
          --roxo-texto-forte: #4527A0;
          --azul-aqua: #00BCD4;
          --fundo-pagina-cor: #f0f2f5;
          --texto-geral: #333;
          --shadow-color: rgba(0, 0, 0, 0.1);
        }

        body {
            background-color: var(--fundo-pagina-cor);
            background-image: linear-gradient(180deg, rgba(32,48,88, 0.4), rgba(129,112,159, 0.4)), url('/WattWorks/imagens/bg-roxo-azul-reverse.jpeg');
            background-repeat: no-repeat;
            background-position: center center;
            background-size: cover;
            background-attachment: fixed;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--texto-geral);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 3rem 1rem;
            position: relative;
        }

        .container {
            max-width: 960px;
            width: 100%;
        }

        h1 {
            color: white;
            font-weight: 700;
            margin-bottom: 2.5rem;
            text-align: center;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.4);
        }

        .cards-container {
            display: flex;
            gap: 2rem;
            width: 100%;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            justify-content: center;
        }

        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 8px 25px var(--shadow-color);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
            background-color: rgba(255, 255, 255, 0.9);
            flex: 1;
            min-width: 300px;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            background-color: rgba(255, 255, 255, 1);
        }

        .card:first-child .card-header {
            background-color: rgba(var(--roxo-principal-rgb), 0.8);
            color: white;
            padding: 1.25rem 2rem;
            font-weight: 600;
            font-size: 1.25rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .card:nth-child(2) .card-header {
            background-color: rgba(var(--roxo-secundario-rgb), 0.8);
            color: white;
            padding: 1.25rem 2rem;
            font-weight: 600;
            font-size: 1.25rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .card-body {
            padding: 2rem;
        }

        .card-body p {
            margin-bottom: 0.75rem;
            font-size: 1.05rem;
            line-height: 1.5;
        }

        .card-body p strong {
            color: var(--roxo-texto-forte);
        }

        .list-group {
            margin-bottom: 0;
        }

        .list-group-item {
            background-color: var(--roxo-claro-suave);
            border: 1px solid rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            margin-bottom: 0.5rem;
            padding: 0.8rem 1.2rem;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .list-group-item:hover {
            background-color: rgba(var(--roxo-claro-suave-rgb), 0.7);
            border-color: var(--roxo-principal);
        }

        .list-group-item span {
            font-size: 1rem;
            color: var(--roxo-texto-forte);
        }

        .list-group-item strong {
            color: var(--roxo-principal);
        }

        .list-group-item .text-muted {
            color: #6c757d !important;
            font-size: 0.9rem;
        }

        .btn-primary {
            background-color: var(--roxo-principal);
            border-color: var(--roxo-principal);
            color: white;
            padding: 0.6rem 1.2rem;
            border-radius: 6px;
            font-weight: 500;
            transition: background-color 0.3s ease, border-color 0.3s ease, transform 0.2s ease;
        }

        .btn-primary:hover {
            background-color: var(--roxo-secundario);
            border-color: var(--roxo-secundario);
            transform: translateY(-2px);
            color: white;
        }

        :root {
          --roxo-principal-rgb: 94, 53, 177;
          --roxo-secundario-rgb: 142, 36, 170;
          --roxo-claro-suave-rgb: 237, 231, 246;
        }

        @media (max-width: 768px) {
            .cards-container {
                flex-direction: column;
                align-items: center;
            }
            .card {
                width: 100%;
                max-width: 400px;
            }
        }
    </style>
</head>
<body class="bg-cadastros">
	<%
        int entidadeId = (Integer) session.getAttribute("entidadeId");
        UnidadeController uniController = new UnidadeController();
        EntidadeController entController = new EntidadeController();
        UsuarioController userController = new UsuarioController();
        
        Entidade ent = entController.getById(entidadeId);
   		Usuario user = userController.getById(ent.getUsuarioId());   
        List<Unidade> unidades = uniController.getByEntidadeId(entidadeId);
    %>
    <a href="/WattWorks/restrito-clientes/home-logado.jsp" class="btn-voltar">✕ Voltar</a>

	<div class="container my-5">
	    <h1 class="mb-4">Configurações da Conta</h1>

	    <div class="cards-container">
	        <div class="card">
	            <div class="card-header">
	                <h4 class="mb-0">Empresa</h4>
	            </div>
	            <div class="card-body">
	                <p><strong>Nome: <%= ent.getNome() %> </strong> </p>
	                <p><strong>CNPJ: <%= ent.getCnpj() %> </strong> </p>
	                <p><strong>Fone: <%= ent.getFone() %> </strong> </p>
	               	<p><strong>Email: <%= user.getEmail() %> </strong></p>
	               	<p><strong>Data de Cadastro:
		               	<%
						    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
						%>
		               	<%= ent.getDataCadastro().format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy")) %> 
	               	</strong></p>
	            </div>
	        </div>

	        <div class="card mt-4">
	            <div class="card-header">
	                <h4 class="mb-0">Unidades</h4>
	            </div>
	            <div class="card-body">
	                <ul class="list-group">

	                <% if (unidades != null && !unidades.isEmpty()) { %>
		                <% for(Unidade uni : unidades) {%>
		                	<li class="list-group-item d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center">
		                        <div class="mb-2 mb-md-0 me-md-3">
		                            <span><strong><%= uni.getDescricao() %></strong></span><br class="d-md-none">
		                            <span class="text-muted"><%= uni.getCnpj() %></span>
		                        </div>
		                        <a class="btn btn-primary" href="/WattWorks/restrito-clientes/editarUnidade.jsp?id=<%= uni.getId() %>">editar</a>
		                    </li>
		                <%}%>
	                <% } else { %>
	                    <li class="list-group-item text-center text-muted">Nenhuma unidade cadastrada.</li>
	                <% } %>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
