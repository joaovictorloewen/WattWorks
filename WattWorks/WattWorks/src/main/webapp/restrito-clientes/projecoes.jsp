<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="modelos.*"%>
<%@page import="controles.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<html lang="pt-br">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" />	
	<title>Projeção de Consumo - WattWorks</title>
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
            --cor-texto-card: #495057;
            --cor-sombra-card: rgba(0, 0, 0, 0.08);
            --cor-azul-projecao: #6200EE;
            --cor-laranja-economia: #fd7e14;
        }
        body {
            background-color: var(--cor-background-pagina);
            font-family: 'Poppins', sans-serif;
            color: var(--cor-cinza-escuro);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .content-wrapper { flex-grow: 1; padding: 20px; }
        .page-title { color: var(--cor-primaria); margin-bottom: 30px; font-weight: 700; }
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
        .filter-section .filter-group { flex: 1; min-width: 200px; }
        .filter-section label { font-weight: 500; margin-bottom: 5px; display: block; }
        .info-cards-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* Máximo 3 por linha */
            gap: 25px;
            margin-bottom: 30px;
        }
        
        .info-card {
            background-color: var(--cor-card-bg);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px var(--cor-sombra-card);
            border-left: 5px solid var(--cor-primaria);
            display: flex;
            flex-direction: column;
        }
        .info-card h4 { font-weight: 600; margin-bottom: 15px; display: flex; align-items: center; }
        .info-card h4 .bi { margin-right: 10px; color: var(--cor-primaria); font-size: 1.5rem; }
        .info-card p { font-size: 1.8rem; font-weight: 700; color: var(--cor-secundaria); margin: 0; }
        .chart-section { background-color: var(--cor-card-bg); padding: 25px; border-radius: 10px; box-shadow: 0 5px 15px var(--cor-sombra-card); height: 400px; }
        .chart-container { flex-grow: 1; position: relative; }
        .hidden { display: none; }
    </style>
</head>
<body>
  <main class="content-wrapper">
    <h1 class="page-title">Simulação de Projeções Futuras de Consumo</h1>

    <div class="filter-section">
        <div class="filter-group">
            <label for="unidadeId" class="form-label">Selecione a Unidade:</label>
            <select class="form-select" id="unidadeSelect">
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
            <label for="periodoProjecaoSelect" class="form-label">Período de Projeção:</label>
            <select class="form-select" id="periodoProjecaoSelect">
                <option value="3" selected>Próximos 3 Meses</option>
                <option value="6">Próximos 6 Meses</option>
                <option value="12">Próximos 12 Meses</option>
            </select>
        </div>
        <div>
            <button class="btn btn-primary" id="btnSimular"><i class="bi bi-graph-up-arrow me-2"></i>Simular Projeção</button>
        </div>
    </div>

    <!-- Cards e gráfico começam escondidos -->
    <div id="resultados" class="hidden">
        <div class="info-cards-grid">
            <div class="info-card">
                <h4><i class="bi bi-lightning-charge"></i> Consumo Fora Ponta (kWh)</h4>
                <p id="consumoForaPontaValor">0 kWh</p>
            </div>
            <div class="info-card">
                <h4><i class="bi bi-lightning"></i> Consumo Ponta (kWh)</h4>
                <p id="consumoPontaValor">0 kWh</p>
            </div>
            <div class="info-card">
                <h4><i class="bi bi-currency-dollar"></i> Custo Total Projetado (R$)</h4>
                <p id="custoProjetadoValor">R$ 0,00</p>
            </div>
        </div>

        <div class="chart-section">
            <h3>Projeção de Consumo Mensal (kWh)</h3>
            <div class="chart-container">
                <canvas id="projecaoConsumoChart"></canvas>
            </div>
        </div>
    </div>
  </main>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="/WattWorks/javascript/navbar-footer.js"></script>
  <script>
    let projecaoChart;

    function getRandomInRange(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    function simulateProjecao() {
        const unidade = document.getElementById('unidadeSelect').value;
        const periodoMeses = parseInt(document.getElementById('periodoProjecaoSelect').value);

        let min, max;
        if (unidade === "matriz") {
            min = 60000; max = 110000;
        } else {
            min = 700000; max = 1100000;
        }

        const projecaoLabels = [];
        const projecaoConsumoValues = [];
        let totalConsumo = 0;

        for (let i = 0; i < periodoMeses; i++) {
            const consumo = getRandomInRange(min, max);
            projecaoConsumoValues.push(consumo);
            totalConsumo += consumo;

            const d = new Date(); d.setMonth(d.getMonth() + i + 1);
            projecaoLabels.push(d.toLocaleString('pt-br', { month: 'short' }) + '/' + d.getFullYear().toString().substr(-2));
        }

        const consumoForaPonta = totalConsumo * 0.7;
        const consumoPonta = totalConsumo * 0.3;
        const custo = totalConsumo * 0.85;

        document.getElementById('consumoForaPontaValor').innerText = consumoForaPonta.toFixed(0) + ' kWh';
        document.getElementById('consumoPontaValor').innerText = consumoPonta.toFixed(0) + ' kWh';
        document.getElementById('custoProjetadoValor').innerText = 'R$ ' + custo.toFixed(2);

        if (projecaoChart) projecaoChart.destroy();
        projecaoChart = new Chart(document.getElementById('projecaoConsumoChart'), {
            type: 'line',
            data: { labels: projecaoLabels, datasets: [{ label: 'Consumo Projetado (kWh)', data: projecaoConsumoValues, borderColor: '#6200EE', tension: 0.4 }] },
            options: { responsive: true, maintainAspectRatio: false }
        });

        document.getElementById('resultados').classList.remove('hidden');
    }

    document.getElementById('btnSimular').addEventListener('click', simulateProjecao);
  </script>
</body>
</html>
