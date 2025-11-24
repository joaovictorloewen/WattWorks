<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" />
  <title>Atualizações - WattWorks</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />
  <link href="/WattWorks/estilos/footer-navbar.css" rel="stylesheet" />
  <link href="/WattWorks/estilos/paginas-gerais.css" rel="stylesheet" />
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Inter:wght@300;400;500;600;700&display=swap');

    :root {
      /* Cores Padrão (mantidas para referência) */
      --purple-dark: #4A148C;
      --purple-light: #E1BEE7;
      --blue-primary: #1976D2;

      /* Nova paleta Laranja Mais Escura e com mais contraste */
      --orange-darker: #BF360C;
      --orange-primary: #E65100;
      --orange-light: #FF8A65;
      
      --text-dark: #212529;
      --text-light: #495057;
      --bg-light: #F0F2F5;
      --bg-section: #FFFFFF;
      --box-shadow: 0 0.6rem 1.2rem rgba(0,0,0,0.05);
      --border-radius: 0.8rem;
    }

    body {
      background-color: var(--bg-light);
      color: var(--text-dark);
      font-family: 'Inter', sans-serif;
      line-height: 1.5;
      padding: 0;
      overflow-x: hidden;
      font-size: 0.95rem;
    }

    main {
      padding: 15px;
      margin-top: 60px;
    }

    @media(min-width:1300px){
      main{
        width: calc(100% - 280px);
        margin-left: 280px;
        margin-right: auto;
        padding: 30px 50px;
        margin-top: 0;
      }
    }

    .updates-section {
      background-color: var(--bg-section);
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
      padding: 30px;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .updates-section:hover{
      transform: translateY(-3px);
      box-shadow: 0 0.8rem 1.5rem rgba(0,0,0,0.08);
    }

    .updates-section h1 {
      font-family: 'Poppins', sans-serif;
      font-weight: 700;
      text-align: center;
      font-size: 2rem;
      color: var(--orange-darker);
      margin-bottom: 2.5rem;
    }

    .form-card {
      border: 1px solid #ddd;
      border-radius: var(--border-radius);
      box-shadow: 0 6px 15px rgba(0,0,0,0.1); /* Sombra mais pronunciada */
      padding: 25px;
      margin-bottom: 30px;
      transition: all 0.3s ease-in-out;
    }

    .form-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0,0,0,0.15); /* Sombra mais intensa no hover */
    }

    .form-card h2 {
      font-family: 'Poppins', sans-serif;
      font-weight: 600;
      font-size: 1.5rem;
      color: var(--orange-primary);
      margin-bottom: 1.5rem;
      display: flex;
      align-items: center;
    }

    .form-card h2 i {
      margin-right: 0.8rem;
      color: var(--orange-darker);
    }

    .form-group label {
      font-weight: 500;
      color: var(--text-dark);
    }

    .form-control, .form-select {
      border-radius: 0.5rem;
      border-color: #ced4da;
      padding: 0.75rem 1rem;
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .form-control:focus, .form-select:focus {
      border-color: var(--orange-primary);
      box-shadow: 0 0 0 0.25rem rgba(230, 81, 0, 0.25);
    }
    
    .btn-custom {
      background-color: var(--orange-primary);
      color: #fff;
      font-weight: 600;
      border: none;
      padding: 12px 30px;
      border-radius: 50px;
      text-transform: uppercase;
      transition: background-color 0.3s ease, transform 0.3s ease;
    }

    .btn-custom:hover {
      background-color: var(--orange-darker);
      transform: translateY(-2px);
    }
  </style>
</head>
<body>
  <main>
    <div class="container">
      <div class="updates-section">
        <h1><i class="bi bi-gear-fill me-2"></i>Área de Atualizações do Sistema</h1>
        
        <div class="form-card">
          <h2><i class="bi bi-file-earmark-bar-graph"></i>Dados Fiscais (COFINS, PIS, ICMS)</h2>
          <form>
            <div class="row g-3 mb-3">
              <div class="col-md-6">
                <label for="mes" class="form-label">Mês</label>
                <select id="mes" class="form-select" required>
                  <option selected disabled value="">Selecione...</option>
                  <option value="1">Janeiro</option>
                  <option value="2">Fevereiro</option>
                  <option value="3">Março</option>
                  <option value="4">Abril</option>
                  <option value="5">Maio</option>
                  <option value="6">Junho</option>
                  <option value="7">Julho</option>
                  <option value="8">Agosto</option>
                  <option value="9">Setembro</option>
                  <option value="10">Outubro</option>
                  <option value="11">Novembro</option>
                  <option value="12">Dezembro</option>
                </select>
              </div>
              <div class="col-md-6">
                <label for="ano_fiscal" class="form-label">Ano</label>
                <input type="number" class="form-control" id="ano_fiscal" placeholder="Ex: 2025" required>
              </div>
            </div>
            <div class="mb-3">
              <label for="cofins" class="form-label">Alíquota COFINS (%)</label>
              <input type="number" step="0.01" class="form-control" id="cofins" placeholder="Ex: 7.6" required>
            </div>
            <div class="mb-3">
              <label for="pis" class="form-label">Alíquota PIS (%)</label>
              <input type="number" step="0.01" class="form-control" id="pis" placeholder="Ex: 1.65" required>
            </div>
            <div class="mb-3">
              <label for="icms" class="form-label">Alíquota ICMS (%)</label>
              <input type="number" step="0.01" class="form-control" id="icms" placeholder="Ex: 17.0" required>
            </div>
            <button type="submit" class="btn btn-custom">Atualizar Dados Fiscais</button>
          </form>
        </div>
        
        <div class="form-card">
          <h2><i class="bi bi-lightning-charge"></i>Tarifas de Aplicação</h2>
          <form>
            <div class="row g-3 mb-3">
              <div class="col-md-6">
                <label for="tusd_kw" class="form-label">TUSD (R$ / kW)</label>
                <input type="number" step="0.0001" class="form-control" id="tusd_kw" placeholder="Ex: 15.2500" required>
              </div>
              <div class="col-md-6">
                <label for="tusd_mwh" class="form-label">TUSD (R$ / MWh)</label>
                <input type="number" step="0.0001" class="form-control" id="tusd_mwh" placeholder="Ex: 350.5000" required>
              </div>
            </div>
            <div class="row g-3 mb-3">
              <div class="col-md-6">
                <label for="te_kwh" class="form-label">TE (R$ / kWh)</label>
                <input type="number" step="0.0001" class="form-control" id="te_kwh" placeholder="Ex: 0.2500" required>
              </div>
              <div class="col-md-6">
                <label for="ano_tarifa" class="form-label">Ano</label>
                <input type="number" class="form-control" id="ano_tarifa" placeholder="Ex: 2025" required>
              </div>
            </div>
            <div class="row g-3 mb-3">
              <div class="col-md-6">
                <label for="posto" class="form-label">Posto</label>
                <select id="posto" class="form-select" required>
                  <option selected disabled value="">Selecione...</option>
                  <option>Ponta (P)</option>
                  <option>Fora de Ponta (FP)</option>
                </select>
              </div>
              <div class="col-md-6">
                <label for="subgrupo" class="form-label">Subgrupo</label>
                <select id="subgrupo" class="form-select" required>
                  <option selected disabled value="">Selecione...</option>
                  <option>A2</option>
                  <option>A3</option>
                  <option>A4</option>
                  <option>B</option>
                  <option>B1</option>
                  <option>B2</option>
                  <option>B3</option>
                </select>
              </div>
            </div>
            <div class="mb-3">
                <label for="modalidade" class="form-label">Modalidade</label>
                <select id="modalidade" class="form-select" required>
                  <option selected disabled value="">Selecione...</option>
                  <option>Azul</option>
                  <option>Verde</option>
                </select>
            </div>
            <button type="submit" class="btn btn-custom">Atualizar Tarifas</button>
          </form>
        </div>
        
        <div class="form-card">
          <h2><i class="bi bi-megaphone"></i>Atualização de Novidades</h2>
          <form>
            <div class="mb-3">
              <label for="titulo_novidade" class="form-label">Título da Novidade</label>
              <input type="text" class="form-control" id="titulo_novidade" placeholder="Ex: Nova funcionalidade de cálculo" required>
            </div>
            <div class="mb-3">
              <label for="texto_novidade" class="form-label">Descrição</label>
              <textarea class="form-control" id="texto_novidade" rows="5" placeholder="Descreva a nova atualização aqui..." required></textarea>
            </div>
            <button type="submit" class="btn btn-custom">Publicar Novidade</button>
          </form>
        </div>

      </div>
    </div>
  </main>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/WattWorks/javascript/navbar-footer.js"></script>
</body>
</html>