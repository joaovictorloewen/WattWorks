<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% if (session.getAttribute("tipoUsuario").equals("CLIENTE")) {%>
	<footer class="footer text-white text-center py-4"> 
	  <div class="">
	    <div class="row g-4 mb-3 justify-content-center">
	      <div class="col-md-3">
	        <div class="card h-100 bg-light text-dark">
	          <div class="card-body">
	            <h5 class="card-title">Endereço</h5>
	            <p class="card-text">Av. Sustentável, 1000<br>Blumenau - SC</p>
	          </div>
	        </div>
	      </div> 
	      <div class="col-md-3">
	        <div class="card h-100 bg-light text-dark">
	          <div class="card-body">
	            <h5 class="card-title">Sobre</h5>
	            <p class="card-text">Somos líderes em soluções inteligentes para o controle de energia.</p>
	          </div>
	        </div>
	      </div>
	      <div class="col-md-3">
	        <div class="card h-100 bg-light text-dark">
	          <div class="card-body">
	            <h5 class="card-title">Redes Sociais</h5>
	            <p class="card-text">
	              <i class="bi bi-instagram"></i> @wattworks<br>
	              <i class="bi bi-linkedin"></i> /wattworks
	            </p>
	          </div>
	        </div>
	      </div>
	    </div>
	    <p class="mb-0">&copy; 2025 WattWorks. Todos os direitos reservados.</p>
	  </div>
	</footer>
<%}%>