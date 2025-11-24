<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="modelos.*"%>
<%@page import="controles.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Simulação Administrativa - WattWorks</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />
  <link href="/WattWorks/estilos/footer-navbar.css" rel="stylesheet" />
  <link href="/WattWorks/estilos/paginas-gerais.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Inter:wght@300;400;500;600;700&display=swap');

    :root {
        --orange-dark: #FF5722;
        --orange-primary: #FF9800;
        --orange-light: #FFB74D;
        --blue-accent: #2196F3;
        --text-dark: #212121;
        --bg-light: #f4f6f9;
        --bg-section: #FFFFFF;
        --box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        --border-radius: 16px;
    }

    body {
      background-color: var(--bg-light);
      font-family: 'Inter', sans-serif;
    }

    main {
      padding: 20px;
      margin-top: 80px;
      animation: fadeInUp 0.8s ease forwards;
      opacity: 0;
    }

    @media (min-width: 1300px) {
      main {
        margin-top: 0;
        margin-left: 280px;
        width: calc(100% - 280px);
      }
    }

    .card {
      border: none;
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      background-color: var(--bg-section);
    }

    .card:hover {
      transform: translateY(-6px);
      box-shadow: 0 8px 20px rgba(0,0,0,0.12);
    }
    
    /* Borda esquerda aumentada para 10px */
    .card-border-left {
      border-left: 10px solid var(--orange-primary);
    }

    .card-title {
      font-weight: 600;
      color: var(--text-dark);
      font-family: 'Poppins', sans-serif;
    }

    .highlight-lg {
      font-size: 2.5rem;
      font-weight: 700;
      margin-top: 10px;
      color: var(--orange-dark);
      font-family: 'Poppins', sans-serif;
    }

    @keyframes fadeInUp {
      0% {
        transform: translateY(20px);
        opacity: 0;
      }
      100% {
        transform: translateY(0);
        opacity: 1;
      }
    }

    .section-title {
        font-family: 'Poppins', sans-serif;
        font-weight: 700;
        color: var(--text-dark);
        border-left: 4px solid var(--orange-primary);
        padding-left: 1rem;
        margin-bottom: 2rem;
    }

    .chart-card {
        padding: 2rem;
    }

    .chart-container {
        position: relative;
        height: 250px;
    }

    @media (max-width: 575.98px) {
      .chart-container {
        height: 200px;
      }
    }
  </style>
</head>
<body>
  <main>
    <div class="container-fluid">
        <h1 class="mb-4 h2 text-center section-title d-flex align-items-center justify-content-center">
            <i class="bi bi-bar-chart-fill me-3"></i>Auditoria Administrativa
        </h1>
        
        <h2 class="section-title mb-4"><i class="bi bi-calendar-check me-2"></i>Todo o Período</h2>
        <div class="row g-4 mb-5">
            <div class="col-12 col-md-6 col-xl-4">
                <div class="card p-4 text-center card-border-left">
                    <h2 class="card-title h5 d-flex align-items-center justify-content-center"><i class="bi bi-file-earmark-text me-2"></i>Faturas Lançadas</h2>
                    <div class="highlight-lg">
                        <% 
                            int totalFaturas = 16;
                        %>
                        <%= totalFaturas %>
                    </div>
                </div>
            </div>
            
            <div class="col-12 col-md-6 col-xl-4">
                <div class="card p-4 text-center card-border-left">
                    <h2 class="card-title h5 d-flex align-items-center justify-content-center"><i class="bi bi-building me-2"></i>Empresas Cadastradas</h2>
                    <div class="highlight-lg">3</div>
                </div>
            </div>
            
            <div class="col-12 col-md-6 col-xl-4">
                <div class="card p-4 text-center card-border-left">
                    <h2 class="card-title h5 d-flex align-items-center justify-content-center"><i class="bi bi-currency-dollar me-2"></i>Valor Gerenciado</h2>
                    <div class="highlight-lg">R$ 5.3M</div>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-12 col-lg-6">
                <div class="card p-4 chart-card h-100">
                    <h2 class="card-title h5 text-center d-flex align-items-center justify-content-center">
                        <i class="bi bi-bar-chart me-2"></i> Faturas por Empresa (Último Mês)
                    </h2>
                    <div class="chart-container">
                        <canvas id="faturasChart"></canvas>
                    </div>
                </div>
            </div>
            
            <div class="col-12 col-lg-6">
                <div class="card p-4 chart-card h-100">
                    <h2 class="card-title h5 text-center d-flex align-items-center justify-content-center">
                        <i class="bi bi-graph-up me-2"></i> Total de Faturas (Últimos 6 Meses)
                    </h2>
                    <div class="chart-container">
                        <canvas id="historicoChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </main>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/WattWorks/javascript/navbar-footer.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
        // Dados de exemplo para os gráficos
        const faturasPorEmpresa = {
            labels: ['VerdeSol LTDA', 'WattWorks', 'EletroSoluções'],
            datasets: [{
                label: 'Faturas Lançadas',
                data: [16, 0, 0],
                backgroundColor: ['#FF9800', '#2196F3', '#FFB74D'],
                hoverOffset: 4
            }]
        };

        const historicoFaturas = {
            labels: ['Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set'],
            datasets: [{
                label: 'Faturas Lançadas',
                data: [0, 0, 0, 0, 0, 16],
                backgroundColor: '#FF9800',
                borderColor: '#FF5722',
                borderWidth: 2,
                tension: 0.4,
                pointBackgroundColor: '#FF5722',
                pointRadius: 5,
                pointHoverRadius: 7
            }]
        };

        // Configuração do gráfico de barra (Faturas por Empresa)
        const faturasChartCtx = document.getElementById('faturasChart').getContext('2d');
        new Chart(faturasChartCtx, {
            type: 'bar',
            data: faturasPorEmpresa,
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    },
                    x: {
                        grid: {
                            display: false
                        }
                    }
                }
            }
        });

        // Configuração do gráfico de linha (Histórico de Faturas)
        const historicoChartCtx = document.getElementById('historicoChart').getContext('2d');
        new Chart(historicoChartCtx, {
            type: 'line',
            data: historicoFaturas,
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    });
  </script>
</body>
</html>