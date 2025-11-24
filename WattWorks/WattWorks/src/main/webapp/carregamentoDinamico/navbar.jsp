<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% if (session.getAttribute("tipoUsuario").equals("CLIENTE")) { %>
	<nav class="navbar navbar-clientes navbar-expand-lg fixed-top d-flex">
	    <div class="container d-flex position-relative h-100 flex-lg-row flex-column p-0">
	        <div class="logo-nav">
	            <a href="/WattWorks/restrito-clientes/home-logado.jsp" class="d-block w-100">
	                <img src="/WattWorks/imagens/logo-wattworks.png" alt="logo WattWorks Software">
	            </a>
	        </div>
	        <div onclick="exibirDiv('navLinks')" class="user-icon d-lg-none" id="hamburgerIcon">
	            <i class="bi bi-list"></i>
	        </div>
	        <div class="collapse navbar-collapse" id="navLinks">
	            <ul class="navbar-nav mb-2 mb-lg-0">
	                <li class="nav-item">
	                    <a class="nav-link" aria-current="page" href="/WattWorks/restrito-clientes/home-logado.jsp">
	                        <i class="bi bi-house-door-fill"></i>
	                        Home
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/WattWorks/restrito-clientes/fatura.jsp">
	                        <i class="bi bi-receipt"></i>
	                        Faturas
	                    </a>
	                </li> 
	                <li class="nav-item">
	                    <a class="nav-link" href="/WattWorks/restrito-clientes/projecoes.jsp">
	                        <i class="bi bi-graph-up-arrow"></i>
	                        Projeções Futuras
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="/WattWorks/restrito-clientes/faqFaturasA.html">
	                        <i class="bi bi-question-circle-fill"></i>
	                        Dúvidas Frequentes
	                    </a>
	                </li>
	            </ul>
	        </div>
	        <div onclick="exibirDiv('userMenu')" class="user-icon" id="userIcon">
	            <i class="bi bi-person-circle"></i>
	        </div>
	    </div>
	</nav>
	
	<div class="user-menu position-fixed" id="userMenu" style="display: none;">
	 <% 
       String entidadeNome = (String) session.getAttribute("entidadeNome");
       String entidadeCnpj = (String) session.getAttribute("entidadeCnpj");
	 %>
        <div class="container">
            <div class="row"> 
                <div class="col d-flex justify-content-between align-items-center h5-user">
                    <h5 class="mb-0 text-center">Informações da Conta</h5>
                    <a href="/WattWorks/restrito-clientes/configurarConta.jsp" class="ms-3 text-dark">
                        <i class="bi bi-gear-fill"></i>
                    </a>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col entidade-info">
                    <p><%= entidadeNome %></p> 
                    <p class="mb-3">CNPJ <%= entidadeCnpj %></p>	                    
                </div>
            </div>	

            <div class="row g-2 mt-3">
                <div class="col-12 col-sm-6">
                    <a href="/WattWorks/restrito-clientes/cadastrarUnidade.jsp" class="btn btn-success btn-sm w-100">
                        <i class="bi bi-plus"></i> Unidade
                    </a>
                </div>
                <div class="col-12 col-sm-6">
                    <a href="/WattWorks/logout" class="btn btn-danger btn-sm w-100">
                        <i class="bi bi-box-arrow-right"></i> Sair
                    </a>
                </div>
            </div>
        </div>
	</div> 
	
<% } else { %>
	<nav class="navbar navbar-administracao navbar-expand-lg fixed-top d-flex">
	    <div class="container d-flex position-relative h-100 flex-lg-row flex-column p-0">
	        <div class="logo-nav">
	            <a href="/WattWorks/restrito-administracao/home-logado-adm.jsp" class="d-block w-100">
	                <img src="/WattWorks/imagens/logo-wattworks.png" alt="logo WattWorks Software">
	            </a>
	        </div>
	        <div onclick="exibirDiv('navLinks')" class="user-icon d-lg-none" id="hamburgerIcon">
	            <i class="bi bi-list"></i>
	        </div>
	        <div class="collapse navbar-collapse" id="navLinks">
	            <ul class="navbar-nav mb-2 mb-lg-0">
					<li class="nav-item">
	                    <a class="nav-link" aria-current="page" href="/WattWorks/restrito-administracao/home-logado-adm.jsp">
							<i class="bi bi-house-door"></i>
	                        Auditoria ADM
	                    </a>
	                </li>
					<!--<li class="nav-item">
					    <a class="nav-link" aria-current="page" href="/WattWorks/restrito-administracao/dados-clientes.jsp">
					        <i class="bi bi-people"></i>
					        Dados dos Clientes
					    </a>
					</li>
					<li class="nav-item">
					    <a class="nav-link" href="/WattWorks/restrito-administracao/equipe-wattworks.jsp">
					        <i class="bi bi-person-badge"></i>
					        Equipe WattWorks
					    </a>
					</li>-->
					<li class="nav-item">
					    <a class="nav-link" href="/WattWorks/restrito-administracao/atualizacoes.jsp">
					        <i class="bi bi-megaphone"></i>
					        Atualizar Sistema	
					    </a>
					</li>
	            </ul>
	        </div>
	        <div onclick="exibirDiv('userMenu')" class="user-icon" id="userIcon">
	            <i class="bi bi-person-circle"></i>
	        </div>
	    </div>
	</nav> 
	
	<div class="user-menu position-fixed" id="userMenu" style="display: none;">
	  <% 
        String entidadeNome = (String) session.getAttribute("entidadeNome");
        String entidadeCnpj = (String) session.getAttribute("entidadeCnpj");
	
	  %>
        <div class="container">
            <div class="row"> 
                <div class="col d-flex justify-content-between align-items-center h5-user">
                    <h5 class="mb-0 text-center">Informações da Conta</h5>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col entidade-info">
                    <p><%= entidadeNome %></p> 
                </div>
            </div>	

            <div class="row g-2 mt-3">
                <div class="col-12 col-sm-6">
                    <a href="/WattWorks/logout" class="btn btn-danger btn-sm w-100">
                        <i class="bi bi-box-arrow-right"></i> Sair
                    </a>
                </div>
            </div>
        </div>
	</div>
<% } %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
