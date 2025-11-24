<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="modelos.*"%>
<%@page import="controles.*"%>
<%@page import="java.util.*"%>
<html lang="pt-br">
<head> 
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" />  
  <title>Home - WattWorks</title>
  <link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />
  <link href="/WattWorks/estilos/footer-navbar.css" rel="stylesheet" />
  <link href="/WattWorks/estilos/paginas-gerais.css" rel="stylesheet" />
  <style>
    :root { 
      --roxo-claro: #BB86FC;
      --azul: #03DAC6;
      --roxo-escuro: #3700B3;
      --fundo-sidebar: var(--roxo-escuro);
      --fundo-main: #f0f2f5;
      --texto-sidebar: #fff;
      --texto-geral: #333;
      --shadow-color: rgba(0, 0, 0, 0.25);
    }
   

    .titulo-home-logado {
        height: 250px;
        background: linear-gradient(180deg, rgba(32,48,88, 0.5), rgba(129,112,159, 0.5)), url('/WattWorks/imagens/bg-roxo-azul-reverse.jpeg');
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        width: calc(100% - 280px);
        margin-left: 280px;
        color: white;
        display: flex;
        align-items: center;
        padding-left: 2.5rem;
    }

    .titulo-home-logado h1 {
        margin: 0;
        font-size: 3rem;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
    }

    body, html {
        height: 100%;
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: var(--fundo-main);
        color: var(--texto-geral);
    }

    .sidebar {
        position: fixed;
        top: 0;
        left: 0;
        width: 280px;
        height: 100vh;
        background: linear-gradient(180deg, var(--roxo-escuro) 0%, var(--roxo-claro) 100%);
        color: var(--texto-sidebar);
        padding: 2rem 1.5rem;
        box-shadow: 2px 0 10px var(--shadow-color);
        display: flex;
        flex-direction: column;
        animation: slideInLeft 0.8s ease forwards;
        z-index: 1000;
        user-select: none;
    }

    .sidebar h2 {
        font-weight: 700;
        margin-bottom: 2.5rem;
        letter-spacing: 2px;
        text-transform: uppercase;
        color: #fff;
    }

    .nav-links {
        list-style: none;
        padding: 0;
        flex-grow: 1;
    }

    .nav-links li {
        margin-bottom: 1.8rem;
        font-size: 1.15rem;
        cursor: pointer;
        transition: color 0.3s ease, transform 0.2s ease;
        display: flex;
        align-items: center;
        gap: 0.7rem;
        font-weight: 500;
    }

    .nav-links li:hover {
        color: var(--azul);
        transform: translateX(5px);
    }

    .nav-links li i {
        font-size: 1.5rem;
    }

    main {
        margin-left: 280px;
        padding: 2.5rem;
        width: calc(100% - 280px);
        animation: fadeIn 1s ease forwards;
        display: flex;
        flex-direction: column;
        gap: 2.5rem;
    }

    @media (max-width: 1300px) {
        .sidebar {
            width: 0;
            padding: 0;
            overflow: hidden;
            transition: width 0.3s ease, padding 0.3s ease;
        }

        .sidebar h2, .sidebar ul {
            display: none;
        }

        .titulo-home-logado {
            width: 100%;
            margin-left: 0px;
            margin-top: 80px;
            padding-left: 1.5rem; 
            height: 200px; 
        }

        .titulo-home-logado h1 {
            font-size: 2.2rem;  
        }

        main {
            margin-left: 0;
            width: 100%;
            padding: 1.5rem;
            gap: 1.5rem;
        }
    }

    .dashboard-section, .news-tips-section {
        background: white;
        border-radius: 16px;
        box-shadow: 0 2px 5px var(--shadow-color);
        padding: 2rem;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border: 1px solid rgba(0,0,0,0.05);
    }
    
    .dashboard-section h2, .news-tips-section h2 {
        color: var(--roxo-escuro);
        font-weight: 700;
        margin-bottom: 1.5rem;
        font-size: 1.8rem;
    }

    .kpi-card {
        background: var(--fundo-main);
        border-radius: 12px;
        padding: 1.2rem;
        box-shadow: inset 0 2px 5px rgba(0,0,0,0.05);
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        transition: background-color 0.3s ease;
    }

    .kpi-card:hover {
        background-color: rgba(var(--roxo-claro-rgb), 0.1);
    }

    .kpi-card .value {
        font-size: 2.2rem;
        font-weight: 800;
        color: var(--roxo-escuro);
        margin-bottom: 0.3rem;
    }

    .kpi-card .label {
        font-size: 0.95rem;
        color: var(--texto-geral);
        font-weight: 500;
    }

    .kpi-card .change {
        font-size: 0.85rem;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: 0.3rem;
    }

    .kpi-card .change.positive {
        color: #28a745;
    }

    .kpi-card .change.negative {
        color: #dc3545;
    }

    .news-tip-card {
        background: var(--fundo-main);
        border-radius: 12px;
        padding: 1rem;
        box-shadow: inset 0 1px 3px rgba(0,0,0,0.05);
        display: flex;
        flex-direction: column;
        transition: background-color 0.3s ease;
    }

    .news-tip-card:hover {
        background-color: rgba(var(--azul-rgb), 0.1);
    }

    .news-tip-card h3 {
        font-size: 1.15rem;
        color: var(--roxo-escuro);
        margin-bottom: 0.5rem;
    }

    .news-tip-card p {
        font-size: 0.9rem;
        color: #555;
        flex-grow: 1;
    }

    .news-tip-card a {
        color: var(--azul);
        text-decoration: none;
        font-weight: 600;
        margin-top: 0.5rem;
        align-self: flex-start;
    }

    .news-tip-card a:hover {
        text-decoration: underline;
    }

    @keyframes slideInLeft {
        from {
            transform: translateX(-100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    :root {
        --roxo-claro-rgb: 187, 134, 252;
        --azul-rgb: 3, 218, 198;
    }
  </style>
</head>

<body>
    <%
        String entidadeNome = (String) session.getAttribute("entidadeNome");
    %>
    <div class="titulo-home-logado d-flex justify-content-center align-items-center">
        <h1>Olá, <%= entidadeNome %>!</h1>
    </div>

    <main style="min-height: 0px !important; margin-top: 0px;">
        <section class="dashboard-section" aria-label="Resumo do Dashboard de Energia">
            <h2>Informações Gerais (último ano)</h2>
            <div class="row row-cols-1 row-cols-md-2 row-cols-xl-3 g-4">
                <div class="col">
                    <div class="kpi-card">
                        <div class="value">
                          <% 
							FaturaController fatController = new FaturaController();
				        	int totalFaturas = fatController.getNumTotal();
				          %>
				          <%= totalFaturas %>
                        </div>
                        <div class="label">faturas lançadas</div>
                    </div>
                </div>
                <div class="col">
                    <div class="kpi-card">
                        <div class="value">2</div>
                        <div class="label">unidades consumidoras cadastradas</div>
                    </div>
                </div>
                <div class="col">
                    <div class="kpi-card">
                        <div class="value">8</div>
                        <div class="label">média de faturas por unidade consumidora</div>
                    </div> 
                </div> 
            </div>
        </section>
    
        <section class="news-tips-section" aria-label="Notícias e Dicas de Energia">
            <h2>Novidades e Dicas para Você</h2>
            <div class="row row-cols-1 row-cols-md-2 row-cols-xl-3 g-4">
                <div class="col">
                    <div class="news-tip-card">
                        <h3>Mercado de energia solar cresce 15% em 2025</h3>
                        <p>Novas políticas de incentivo impulsionam o setor e trazem oportunidades para os **usuários**.</p>
                    </div>
                </div> 
                <div class="col">
                    <div class="news-tip-card"> 
                        <h3>Tarifa de energia deve sofrer reajuste em julho</h3>
                        <p>Prepare-se para as mudanças na sua conta de luz. Entenda o que impacta.</p>
                    </div>
                </div>  
                <div class="col">
                    <div class="news-tip-card">
                        <h3>Dica: Desligue aparelhos em standby</h3>
                        <p>Economize até 10% na sua fatura simplesmente tirando da tomada aparelhos não utilizados.</p>
                    </div>
                </div>
            </div>
        </section> 
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/WattWorks/javascript/navbar-footer.js"></script>
</body>
</html>