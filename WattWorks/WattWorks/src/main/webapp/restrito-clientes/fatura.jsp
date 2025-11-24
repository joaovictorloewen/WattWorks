<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="modelos.*"%>
<%@page import="controles.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" />
	<title>Gerenciamento de Faturas - WattWorks</title>
	<link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
	<link href="/WattWorks/estilos/footer-navbar.css" rel="stylesheet" />
	<link href="/WattWorks/estilos/paginas-gerais.css" rel="stylesheet" />
    <style>
        :root {
            --cor-primaria: #6200EE;
            --cor-secundaria: #9C27B0;
            --cor-terciaria: #7B1FA2;
            --cor-verde-sucesso: #28a745;
            --cor-vermelho-erro: #dc3545;
            --cor-cinza-claro: #f8f9fa;
            --cor-cinza-escuro: #343a40;
            --cor-background-pagina: #f4f7f6;
            --cor-card-bg: #ffffff;
            --cor-borda-card: rgba(0, 0, 0, 0.125);
            --cor-sombra-card: rgba(0, 0, 0, 0.08);
        }

        body {
            background-color: var(--cor-background-pagina);
            font-family: 'Poppins', sans-serif;
            color: var(--cor-cinza-escuro);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .content-wrapper {
            flex-grow: 1;
            padding: 20px;
            box-sizing: border-box;
            transition: width 0.3s ease, margin-left 0.3s ease;
        }

        @media (min-width: 1300px) {
            .content-wrapper {
                width: calc(100% - 280px);
                margin-left: 280px;
            }
        }

        .page-title {
            color: var(--cor-primaria);
            margin-bottom: 30px;
            font-weight: 700;
        }

        .filter-section {
            background-color: var(--cor-card-bg);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px var(--cor-sombra-card);
            margin-bottom: 30px;
            display: flex;
            flex-wrap: wrap;
            align-items: flex-end;
            gap: 20px;
        }

        .filter-section .filter-group {
            flex: 1;
            min-width: 200px;
        }

        .filter-section label {
            font-weight: 500;
            color: var(--cor-cinza-escuro);
            margin-bottom: 5px;
            display: block;
        }

        .filter-section select.form-select {
            border-color: rgba(0, 0, 0, 0.2);
            box-shadow: none;
            width: 100%;
        }

        .filter-section .btn-primary {
            background-color: var(--cor-secundaria);
            border-color: var(--cor-secundaria);
            font-weight: 600;
            padding: 10px 20px;
            border-radius: 6px;
            transition: all 0.3s ease;
            white-space: nowrap;
        }

        .filter-section .btn-primary:hover {
            background-color: var(--cor-terciaria);
            border-color: var(--cor-terciaria);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(156, 39, 176, 0.2);
        }

        .info-cards-grid {
            display: grid;
            gap: 25px;
            margin-bottom: 30px;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        }

        @media (min-width: 1024px) {
            .info-cards-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        .info-card {
            background-color: var(--cor-card-bg);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px var(--cor-sombra-card);
            border-left: 5px solid var(--cor-primaria);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.2s ease;
        }
        
        .card-red {
            border-left: 5px solid red !important;
        }
        
        .card-verde {
            border-left: 5px solid green !important;
        }

        .info-card:hover {
            transform: translateY(-5px);
        }

        .info-card h4 {
            color: var(--cor-cinza-escuro);
            font-weight: 600;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        .info-card h4 .bi {
            margin-right: 10px;
            color: var(--cor-primaria);
            font-size: 1.5rem;
        }
        
        .card-red h4 .bi {
        	color: red !important;
        }
        
        .card-verde h4 .bi {
        	color: green !important;
        }

        .info-card p {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--cor-secundaria);
            margin: 0;
        }
        .info-card p.text-muted {
            font-size: 0.9rem;
            font-weight: 400;
            color: var(--cor-texto-card) !important;
            margin-top: 5px;
        }

        .chart-section {
            background-color: var(--cor-card-bg);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px var(--cor-sombra-card);
            margin-bottom: 30px;
            height: 400px;
            display: flex;
            flex-direction: column;
        }
        .chart-container {
            flex-grow: 1;
            position: relative;
        }

        .chart-section h3 {
            color: var(--cor-primaria);
            margin-bottom: 20px;
            font-weight: 600;
        }

        .fatura-table-section {
            background-color: var(--cor-card-bg);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px var(--cor-sombra-card);
            overflow-x: auto;
        }

        .fatura-table-section h3 {
            color: var(--cor-primaria);
            margin-bottom: 20px;
            font-weight: 600;
        }

        .table {
            color: var(--cor-cinza-escuro);
        }
        .table thead {
            background-color: var(--cor-cinza-claro);
        }
        .table th, .table td {
            vertical-align: middle;
            white-space: nowrap;
        }
        
        .btn-roxo {
		    background-color: #6f42c1; 
		    border-color: #6f42c1;
		    color: #fff;
		}
		
		.btn-roxo:hover {
		    background-color: #59359c;
		    border-color: #59359c;
		    color: #fff;
		}

        @media (max-width: 992px) {
            .filter-section .filter-group {
                min-width: 180px;
            }
            .info-cards-grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            }
        }
        @media (max-width: 768px) {
            .filter-section {
                flex-direction: column;
                align-items: stretch;
            }
            .filter-section .filter-group,
            .filter-section select.form-select {
                width: 100%;
            }
            .content-wrapper {
                padding: 15px;
            }
            .info-cards-grid {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            }
        }

        @media (max-width: 576px) {
            .page-title {
                font-size: 1.8rem;
            }
            .info-card {
                padding: 20px;
            }
            .info-card h4 {
                font-size: 1.1rem;
            }
            .info-card p {
                font-size: 1.5rem;
            }
            .filter-section .btn-primary {
                width: 100%;
            }
        }
    </style>
</head>

<body>
  <main style="min-height: 0px !important;" class="content-wrapper">
    <h1 class="page-title">Gerenciamento de Faturas</h1>

    <form action="fatura.jsp" method="post" class="filter-section">
        <div class="filter-group">
            <label for="unidadeId" class="form-label">Selecione a Unidade:</label>
            <select class="form-select" id="unidadeId" name="unidadeId">
                <%   
                int entidadeId = (Integer) session.getAttribute("entidadeId");
                UnidadeController uniController = new UnidadeController();
                List<Unidade> unidades = uniController.getByEntidadeId(entidadeId);
                
                for(Unidade uni : unidades) {%>
	                <option value="<%= uni.getId() %>"><%= (uni.getDescricao() + " - " + uni.getCnpj()) %></option>
                <%} %> 
            </select>
        </div>
        <div class="filter-group">
            <label for="anoSelect" class="form-label">Selecione o Ano:</label>
            <select class="form-select" id="anoSelect" name="anoSelect">
                <option selected value="0">Todos os Anos</option>
                <% 
                FaturaController fatController = new FaturaController();
                List<Integer> anosComFaturas = fatController.getAnosComFaturas();
                
                for(int ano : anosComFaturas) {%>
	                <option value="<%= ano %>"><%= ano %></option>
                <%} %>
            </select> 
        </div>
        <div>
            <button type="submit" href="#" class="btn btn-primary mb-2">
                <i class="bi bi-funnel me-2"></i>Filtrar
            </button>
            <a href="/WattWorks/restrito-clientes/cadastrarFatura.jsp" class="btn btn-primary mb-2">
                <i class="bi bi-plus-circle me-2"></i>Cadastrar Nova Fatura
            </a>
        </div>
    </form>
	<%
	if (request.getParameter("unidadeId") != null && !request.getParameter("unidadeId").isEmpty()) {
	%>
	<div class="fatura-table-section mb-4">
	    <div class="d-flex justify-content-between align-items-center mb-3">
	        <h3 class="h4 m-0">Faturas cadastradas na unidade selecionada</h3>
	        <!-- <div class="d-flex gap-2">
	            <a href="exemplo.html?ano=2025" class="btn btn-roxo btn-sm">
	                <i class="bi bi-funnel me-2"></i>Média Histórica (2025)
	            </a>
	            <a href="exemplo.html?unidadeId=2" class="btn btn-roxo btn-sm">
	                <i class="bi bi-funnel me-2"></i>Média Histórica (todo período)
	            </a>
	        </div>-->
	    </div>
	    
	    <table class="table table-hover table-striped">
	        <thead>
	            <tr>
	                <th scope="col">#</th>
	                <th scope="col">Unidade</th>
	                <th scope="col">CNPJ</th>
	                <th scope="col">Mês/Ano Ref.</th>
	                <th scope="col">Ações</th>
	            </tr>
	        </thead>
	        <tbody>
			<% 
		        String unidadeParam = request.getParameter("unidadeId");
		        String anoParam = request.getParameter("anoSelect");
		
		        Integer unidadeId = (unidadeParam != null && !unidadeParam.equals("0")) ? Integer.parseInt(unidadeParam) : null;
		        Integer ano = (anoParam != null && !anoParam.isEmpty()) ? Integer.parseInt(anoParam) : null;
		
		        List<Fatura> faturas = fatController.getByFiltros(unidadeId, ano);
		
		        int id = 1;%>
		         <% if (faturas.isEmpty()) { %>
					    <tr>
					        <td colspan="4" class="text-center text-muted">Nenhuma fatura encontrada.</td>
					    </tr>
				<% }
		         
		        for (Fatura fat : faturas) {
			%>
		            <tr>
		                <th scope="row"><%= id %></th>
		                <td>
		                    <div class="d-inline-block text-truncate" style="max-width: 150px;">
		                        <% Unidade uni2 = uniController.getById(fat.getUnidadeId()); %>
		                        <%= uni2.getDescricao() %>
		                    </div>
		                </td>
		                <td>
		                    <%= uni2.getCnpj() %>
		                </td>
		                <td>
		                    <%= fat.getDataReferencia().format(DateTimeFormatter.ofPattern("MM/yyyy")) %>
		                </td>
		                <td>
		                    <a href="fatura.jsp?faturaId=<%= fat.getId() %>" class="btn btn-sm btn-info text-white"><i class="bi bi-eye"></i></a>
	                    	<a href="fatura.jsp?fatRemoverId=<%= fat.getId() %>&unidadeId=<%=uni2.getId() %>&anoSelect=<%= anoParam %>" class="btn btn-sm btn-danger"><i class="bi bi-trash"></i></a>
		                </td>
		            </tr>
		           <%			            
		            id++;
		        }
			%>


	        </tbody>
	    </table>
	</div>
	<%
	}
	    String fatRemoverIdStr = request.getParameter("fatRemoverId");
	    if(fatRemoverIdStr != null && !fatRemoverIdStr.isEmpty()) {
	        int fatRemoverId = Integer.parseInt(fatRemoverIdStr);
	        fatController.removerFaturaA(fatRemoverId);
	
	        String unidadeId = request.getParameter("unidadeId");
	        String anoSelect = request.getParameter("anoSelect");
	        response.sendRedirect("fatura.jsp?unidadeId=" + unidadeId + "&anoSelect=" + anoSelect);
	        return;
	    }

	    String faturaIdStr = request.getParameter("faturaId");
	    if (faturaIdStr != null && !faturaIdStr.isEmpty()) {
	        int faturaIdParam = Integer.parseInt(faturaIdStr);
	        Fatura fat = fatController.getFaturaAById(faturaIdParam); 
	        NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));

    %>
		    <div class="info-cards-grid">
		    	<div class="info-card card-verde">
		            <h4><i class="bi bi-receipt"></i>Identificação da Fatura</h4>
		            <span class="text-muted"> Unidade:
			            <% Unidade uni = uniController.getById(fat.getUnidadeId()); %>
			            <%= uni.getDescricao() %>
		            </span>
		            <span class="text-muted">Subgrupo:
		            	<%
		            		int subgrupoId = fat.getSubgrupoId();
			    	        String subgrupoIdStr;
			    	        if (1 == subgrupoId) {
			    	        	subgrupoIdStr = "A2";
			    	        } else if (2 == subgrupoId) {
			    	        	subgrupoIdStr = "A3";
			    	        } else if (3 == subgrupoId) {
			    	        	subgrupoIdStr = "A3A";
			    	        } else if (4 == subgrupoId) {
			    	        	subgrupoIdStr = "A4";
			    	        } else if (5 == subgrupoId) {
			    	        	subgrupoIdStr = "B1";
			    	        } else if (6 == subgrupoId) {
			    	        	subgrupoIdStr = "B2";
			    	        } else if (7 == subgrupoId) {
			    	        	subgrupoIdStr = "B3";
			    	        } else if (8 == subgrupoId) {
			    	        	subgrupoIdStr = "B4";
			    	        } else {
			    	        	subgrupoIdStr = "B";
			    	        }
		            	%>  
		                <%= subgrupoIdStr %>
		            </span>         
		            <span class="text-muted">Mês e ano de referência:
		                <%= fat.getDataReferencia().format(DateTimeFormatter.ofPattern("MM/yyyy")) %>
		            </span>         
		        </div> 
		        
		        <div class="info-card">
		            <h4><i class="bi bi-receipt"></i>Demandas Contratadas</h4>
		            <span class="text-muted">Demanda Ponta: <%= String.format("%.0f", fat.getDemandaPontaKw()) %> kWh</span>         
		            <span class="text-muted">Demanda Fora Ponta: <%= String.format("%.0f", fat.getDemandaForaPontaKw()) %> kWh</span>
		        </div>	
		        
		        <div class="info-card"> 
		            <h4><i class="bi bi-currency-dollar"></i> Total Faturado (R$)</h4>
					<p>
						<% double valorTotal = (fatController.calcularValorTusdFPA(fat) 
						           + fatController.calcularValorTeFPA(fat) + fatController.calcularValorTePA(fat) 
						           + fatController.calcularValorTusdPA(fat)); %>
					    <%= nf.format(
					            valorTotal * 1.065
					        ) %>
					</p>
					<p class="text-muted">Para um total de <%= String.format("%.0f", (fat.getConsumoForaPonta() + fat.getConsumoPonta())) %>kWh</p>         
		        	<p class="text-muted">ICMS: <span class="text-success"><%= nf.format(valorTotal * 0.030) %></span> | COFINS: <span class="text-success"><%= nf.format(valorTotal * 0.030) %> 
		        	</span><br/> PIS: <span class="text-success"><%= nf.format(valorTotal * 0.030) %></span></p>         
		        	 
		        </div>
		         
		        <div class="info-card">
		            <h4><i class="bi bi-graph-up"></i> Consumo Ponta (kWh)</h4>
		            <p><%= String.format("%.0f",fat.getConsumoPonta()) %> kWh</p>
					<p class="text-muted">
					    Foram pagos <%= nf.format(fatController.calcularValorTusdPA(fat)) %> em TUSD
					</p>	
					<p class="text-muted">
					    Foram pagos <%= nf.format(fatController.calcularValorTePA(fat)) %> em TE
					</p>  
		        </div>
		        
		        <div class="info-card">
		            <h4><i class="bi bi-graph-up"></i> Consumo Fora Ponta (kWh)</h4>
		            <p><%= String.format("%.0f",fat.getConsumoForaPonta()) %> kWh</p>
					<p class="text-muted">
					    Foram pagos <%= nf.format(fatController.calcularValorTusdFPA(fat)) %> em TUSD
					</p>	
					<p class="text-muted">
					    Foram pagos <%= nf.format(fatController.calcularValorTeFPA(fat)) %> em TE
					</p>	        
				</div>
		        
				<div class="info-card card-red">
				    <h4><i class="bi bi-exclamation-triangle"></i> Penalidades</h4>
				 	<p class="text-muted h6" style="font-size: 13px; margin-bottom: -10px;">
					    <span class="fw-bold">Fora Ponta:</span>  
					    <%=
					    	fatController.houvePenalidadeFP(fat)
					    %>
				    </p>
				    <hr/>
				    <p class="text-muted h6" style="font-size: 13px;  margin-top: -10px;">
					    <span class="fw-bold">Ponta:</span> 
					    <%=
					    	fatController.houvePenalidadeP(fat)
					    %>
				    </p> 
				</div>
				
		    </div>
		
		    <!--<div class="chart-section">
		        <h3>Valor pago mensalmente no ano da fatura consultada (R$)</h3>
		        <div class="chart-container">
		            <canvas id="consumoChart"></canvas>
		        </div>
		    </div> -->
	<%	}%>
  </main>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="/WattWorks/javascript/navbar-footer.js"></script>
  <script>
	    let consumoChart;
	
	    function renderConsumoChart(dataLabels, dataValues) {
	        if (consumoChart) {
	            consumoChart.destroy();
	        }
	
	        const consumoData = {
	            labels: dataLabels,
	            datasets: [{
	                label: 'Valor em R$',
	                data: dataValues,
	                backgroundColor: 'rgba(98, 0, 238, 0.7)',
	                borderColor: 'rgba(98, 0, 238, 1)',
	                borderWidth: 1,
	            }]
	        };
	
	        const consumoConfig = {
	            type: 'bar',
	            data: consumoData,
	            options: {
	                responsive: true,
	                maintainAspectRatio: false,
	                plugins: {
	                    title: { display: false },
	                    legend: { display: false }
	                },
	                scales: {
	                    y: {
	                        beginAtZero: true,
	                        title: { display: true, text: 'Valor em R$' },
	                        grid: { color: 'rgba(0, 0, 0, 0.05)' }
	                    },
	                    x: {
	                        title: { display: true, text: 'Mês' },
	                        grid: { display: false }
	                    }
	                }
	            }
	        };
	
	        const consumoChartCtx = document.getElementById('consumoChart').getContext('2d');
	        consumoChart = new Chart(consumoChartCtx, consumoConfig);
	    }
	
	    function loadFaturaData(unidadeId, anoId) {
	        let labels = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'];
	        let values = [0,0,0,0,0,0,0,0,0,0,0,0];
	
	        switch (unidadeId) {
	            case "1": values = [1000,980,1050,1020,1100,1070,1030,0,0,0,0,0]; break;
	            case "2": values = [700,750,680,720,780,740,705,0,0,0,0,0]; break;
	            case "4": values = [1500,1450,1600,1550,1700,1650,1580,0,0,0,0,0]; break;
	        }
	
	        if (anoId && anoId !== "0") {
	            const index = parseInt(anoId) - 1;
	            if (index >=0 && index < 12) {
	                labels = [labels[index]];
	                values = [values[index]];
	            }
	        }
	
	        renderConsumoChart(labels, values);
	    }
	
	    document.addEventListener('DOMContentLoaded', function() {
	        const unidadeSelect = document.getElementById('unidadeId');
	        const anoSelect = document.getElementById('anoSelect');
	
	        loadFaturaData(unidadeSelect.value, anoSelect.value);
	
	        unidadeSelect.addEventListener('change', () => loadFaturaData(unidadeSelect.value, anoSelect.value));
	        anoSelect.addEventListener('change', () => loadFaturaData(unidadeSelect.value, anoSelect.value));
	    });
	</script>

</body>
</html>