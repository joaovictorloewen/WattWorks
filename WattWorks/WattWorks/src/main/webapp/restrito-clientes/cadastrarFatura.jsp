<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="modelos.*"%>
<%@page import="controles.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Mobile First -->
  <link rel="icon" type="image/png" href="/WattWorks/imagens/logo-wattworks.png" />
  <title>Inserir Fatura</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
  <link href="/WattWorks/estilos/paginas-gerais.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/tesseract.js@4/dist/tesseract.min.js"></script>  
  <style>
  	.body-faturas {
	    font-family: 'Inter', sans-serif !important;
	    display: flex !important;
	    flex-direction: column !important;
	    min-height: 100vh !important;
	}

	#previewImage {
	    max-height: 300px;
	    object-fit: contain; 
	    transition: transform 0.3s ease-in-out;
	}
	
	#previewImage:hover {
	    transform: scale(1.03);
	}
	
	.form-control:focus {
	    border-color: #0d6efd;
	    box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
	}

    /* Botão voltar responsivo */
    .btn-voltar {
      display: inline-block;
      margin: 1rem;
      padding: 0.5rem 1rem;
      font-size: 0.9rem;
      background: #f8f9fa;
      border: 1px solid #dee2e6;
      border-radius: 0.5rem;
      text-decoration: none;
      color: #212529;
      transition: background 0.3s;
    }
    .btn-voltar:hover {
      background: #e9ecef;
    }
    @media (max-width: 576px) {
      .btn-voltar {
        width: 100%;
        text-align: center;
      }
    }
  </style>
</head> 
<body class="body-faturas bg-light bg-cadastros"> 
  
  <a href="/WattWorks/restrito-clientes/fatura.jsp" class="btn-voltar">✘ Voltar</a>
 
  <%
	    String unidadeIdStr = request.getParameter("unidadeSelect");
	    String subgrupoIdStr = request.getParameter("subgrupoId");
	    String dataFaturaStr = request.getParameter("dataFatura");
	    String consumoForaPontaStr = request.getParameter("consumoForaPonta");
	    String consumoPontaStr = request.getParameter("consumoPonta");
	    String demandaPontaStr = request.getParameter("demandaPonta");
	    String demandaForaPontaStr = request.getParameter("demandaForaPonta");

	    if(unidadeIdStr != null && subgrupoIdStr != null && dataFaturaStr != null &&
	       consumoForaPontaStr != null && consumoPontaStr != null &&
	       demandaPontaStr != null && demandaForaPontaStr != null) {

	        int unidadeId = Integer.parseInt(unidadeIdStr);
	        LocalDate dataReferencia = LocalDate.parse(dataFaturaStr, DateTimeFormatter.ISO_DATE);
	        double consumoForaPonta = Double.parseDouble(consumoForaPontaStr);
	        double consumoPonta = Double.parseDouble(consumoPontaStr);
	        double demandaPontaKw = Double.parseDouble(demandaPontaStr);
	        
	        int subgrupoId= 0;
	        if ("A2".equals(subgrupoIdStr)) {
	        	subgrupoId = 1;
	        } else if ("A3".equals(subgrupoIdStr)) {
	        	subgrupoId = 2;
	        } else if ("A3A".equals(subgrupoIdStr)) {
	        	subgrupoId = 3;
	        } else if ("A4".equals(subgrupoIdStr)) {
	        	subgrupoId = 4;
	        } else if ("B1".equals(subgrupoIdStr)) {
	        	subgrupoId = 5;
	        } else if ("B2".equals(subgrupoIdStr)) {
	        	subgrupoId = 6;
	        } else if ("B3".equals(subgrupoIdStr)) {
	        	subgrupoId = 7;
	        } else if ("B4".equals(subgrupoIdStr)) {
	        	subgrupoId = 8;
	        } else {
	        	subgrupoId = 9;
	        }
	        	
	        double demandaForaPontaKw = Double.parseDouble(demandaForaPontaStr);

	        Fatura fat = new Fatura(unidadeId, subgrupoId, dataReferencia, 
	                                consumoForaPonta, consumoPonta, 
	                                demandaPontaKw, demandaForaPontaKw);

	        FaturaController fatController = new FaturaController();
	        fatController.salvarFatura(fat);
	        response.sendRedirect("cadastrarFatura.jsp");
  %>
  <%
	}
  %>
  <div class="flex-grow-1 d-flex align-items-center justify-content-center"> 
    <div class="container">
      <div class="row justify-content-center gx-5">
        
        <!-- Coluna Inserir Fatura -->
        <div class="col-12 col-md-6 col-lg-5 mb-4 mb-md-0">
          <form action="cadastrarFatura.jsp" id="formFaturas" class="container-cadastros card p-4 shadow rounded-4 h-100">
            <h1 class="mb-4 text-center text-primary">Inserir Fatura</h1>
            
            <div class="mb-3">
	            <label for="unidadeSelect" class="form-label">Selecione a Unidade:</label>
	            <select class="form-select" id="unidadeSelect" name="unidadeSelect" required>
	                <% 
	                int entidadeId = (Integer) session.getAttribute("entidadeId");
	                UnidadeController uniController = new UnidadeController();
	                List<Unidade> unidades = uniController.getByEntidadeId(entidadeId);
	                
	                for(Unidade uni : unidades) {%>
	                	<option value="<%= uni.getId() %>"><%= (uni.getDescricao() + " - " + uni.getCnpj()) %></option>
	                <%} %> 
	            </select>
				<label for="subgrupoId" class="form-label">Subgrupo da Fatura:</label>
				<select class="form-select" id="subgrupoId" name="subgrupoId" required>
					<option value="" disabled selected>Selecione</option>
					<option value="A2">A2</option>
					<option value="A3">A3</option>
					<option value="A3A">A3A</option>
					<option value="A4">A4</option>
					<option value="B1">B1</option>
					<option value="B2">B2</option>
					<option value="B3">B3</option>
					<option value="B4">B4</option>
					<option value="B">B</option>
				</select>
				<div id="inputsDinamicos">
					<!-- Inputs serão carregados dinamicamente -->
				</div>
            </div>
          </form>
        </div>
 
        <!-- Coluna Escanear Fatura -->
        <div class="col-12 col-md-6 col-lg-5">
          <div class="container-cadastros card p-4 shadow rounded-4 h-100">
            <h2 class="mb-4 text-center text-primary">Escanear Fatura</h2>

            <input type="file" id="uploadScan" class="form-control mb-3">

            <div id="previewContainer" class="d-flex justify-content-center mb-3">
              <img id="previewImage" alt="Pré-visualização da fatura" class="img-fluid rounded shadow-sm" style="max-height: 300px;">
            </div>

            <div id="loading" class="text-center d-none">
              <img src="https://i.imgur.com/llF5iyg.gif" alt="Carregando..." width="50">
              <p class="mt-2">Lendo fatura...</p>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  		let textoOCR = null
  
		document.getElementById('uploadScan').addEventListener('change', async (event) => {
		  const file = event.target.files[0]
		  if (!file) return
		
		  const previewImage = document.getElementById('previewImage')
		  const loading = document.getElementById('loading')
		
		  previewImage.src = URL.createObjectURL(file)
		  previewImage.classList.remove("d-none")
		
		  loading.classList.remove('d-none')
		
		  try {
		    const { data: { text } } = await Tesseract.recognize(file, 'por', {
		      logger: m => console.log(m)
		    }); 
			
		    textoOCR = text
			console.log('Texto OCR:', textoOCR)
		    definirSubgrupoComOCR()
		  } catch (error) {
		    console.error('Erro na leitura OCR:', error)
		    alert('Erro ao ler a imagem. Tente novamente.')
		  } finally {
		    loading.classList.add('d-none')
		  }
		});
		
		
		function definirSubgrupoComOCR() {			
			let grupoMatch = textoOCR.match(/\/(B1|B2|B3|B4|B)/i)
	
			if (!grupoMatch) {
				grupoMatch = textoOCR.match(/GRUPO\s*[:\-]?\s*([A-Z0-9]+)/i)
			}
			
			if (grupoMatch && grupoMatch[1]) {
				const subgrupoValue = grupoMatch[1].trim().toUpperCase()
				console.log('Subgrupo detectado:', subgrupoValue)
				document.getElementById('subgrupoId').value = subgrupoValue
				
				carregarFormPorSubgrupo(subgrupoValue)
			} else {
				console.warn('Subgrupo não encontrado no texto OCR.')
			}
		}
		
		function carregarFormPorSubgrupo(subgrupo) {
			const primeiraLetra = subgrupo.charAt(0) 
			console.log('Primeira letra do grupo:', primeiraLetra)

			fetch('/WattWorks/carregamentoDinamico/form-faturas.jsp?subgrupo=' + primeiraLetra)
				.then(response => {
					if (!response.ok) {
						throw new Error('Erro ao carregar o formulário.')
					}
					return response.text()
				})
				.then(html => {
					document.getElementById('inputsDinamicos').innerHTML = html

					if (primeiraLetra === 'B') {
						preencherFormSubgrupoB()
					} else {
						preencherFormSubgrupoA()
					}
				})
				.catch(error => {
					console.error('Erro ao carregar formulário:', error)
				})
		}

		
		function preencherFormSubgrupoA() {
				  // --- REFERÊNCIA ---
				  const referenciaMatch = textoOCR.match(/REFER[ÊE]NCIA\s*[:\-]?\s*(\d{1,2})\/(\d{4})/i)
				  if (referenciaMatch) {
				    const mes = referenciaMatch[1].padStart(2, '0')
				    const ano = referenciaMatch[2]
				    const dia = '01';
				    const dataFormatada = ano + '-' + mes + '-' + dia
				    console.log('Data formatada:', dataFormatada);
				
				    const input = document.getElementById('dataFatura')
				    if (input) {
				      input.value = dataFormatada
				    } else {
				      console.warn('Input #dataFatura não existe no DOM!')
				    }
				  } else {
				    console.warn('REFERÊNCIA não encontrada no texto OCR.')
				  }
				
				  // --- DEMANDA PONTA ---
				  const demandaPontaMatch = textoOCR.match(/DEMANDA\s*PONTA.*?:\s*\/?\s*(\d+([.,]\d+)?)/i);
				  if (demandaPontaMatch) {
				    const valor = demandaPontaMatch[1].replace(',', '.');
				    const input = document.getElementById('demandaPonta');
				    if (input) {
				      input.value = valor;
				    } else {
				      console.warn('Input #demandaPonta não existe no DOM!');
				    }
				  } else {
				    console.warn('DEMANDA PONTA não encontrada.');
				  }
				
				// --- DEMANDA FORA PONTA ---
				  const demandaForaPontaMatch = textoOCR.match(/DEMANDA\s*FORA\s*PONTA.*?:\s*\/?\s*(\d+([.,]\d+)?)/i);
				  if (demandaForaPontaMatch) {
				    const valor = demandaForaPontaMatch[1].replace(',', '.');
				    const input = document.getElementById('demandaForaPonta');
				    if (input) {
				      input.value = valor;
				    } else {
				      console.warn('Input #demandaForaPonta não existe no DOM!');
				    }
				  } else {
				    console.warn('DEMANDA FORA PONTA não encontrada.');
				  }
				
				  // --- CONSUMO FORA PONTA ---
				  const consumoForaPontaMatch = textoOCR.match(/CONSUMO\s*FORA\s*PONTA\s*[:\-]?\s*(\d+([.,]\d+)?)/i)
				  if (consumoForaPontaMatch) {
				    const valor = consumoForaPontaMatch[1].replace('.', '').replace(',', '.')
				    const input = document.getElementById('consumoForaPonta')
				    if (input) {
				      input.value = valor
				    } else {
				      console.warn('Input #consumoForaPonta não existe no DOM!')
				    }
				  } else {
				    console.warn('CONSUMO FORA PONTA não encontrado.')
				  }
				
				  // --- CONSUMO PONTA ---
				  const consumoPontaMatch = textoOCR.match(/CONSUMO\s*PONTA[^\d]*\s*(\d+([.,]\d+)?)/i);
				  if (consumoPontaMatch) {
				    const valor = consumoPontaMatch[1].replace(',', '.');
				    const input = document.getElementById('consumoPonta');
				    if (input) {
				      input.value = valor;
				    } else {
				      console.warn('Input #consumoPonta não existe no DOM!');
				    }
				  } else {
				    console.warn('CONSUMO PONTA não encontrado.');
				  }
		}
				 


		function preencherFormSubgrupoB() {
		     // --- DATA DE REFERÊNCIA --- // 
			  const matchData = textoOCR.match(/Lida\s+(\d{2}\/\d{2}\/\d{4})/i);
			  if (matchData) {
			    const dataBruta = matchData[1]; 
			    const [dia, mes, ano] = dataBruta.split('/').map(Number);
			    let novoMes = mes - 1;

			    const dataReferencia = ano + '-' + '0' + 	novoMes + '-' + '0' + 1;

			    console.log('DATA REFERÊNCIA (Lida -1 mês):', dataReferencia);

			    document.getElementById('dataFatura').value = dataReferencia;
			  } else {
			    console.warn('Data após Lida não encontrada no texto OCR.');
			  }
			  
			  // --- BANDEIRA TAIFÁRIA --- //
			  const matchBandeira = textoOCR.match(/Lida\s+\d{2}\/\d{2}\/\d{4}\s+([A-Za-z]+)/i);
			  if (matchBandeira) {
			    const bandeira = matchBandeira[1];

			    console.log('BANDEIRA:', bandeira);

			    document.getElementById('bandeira').value = bandeira;
			  } else {
			    console.warn('Bandeira não encontrada após Lida.');
			  }
			  
			  /*// --- LEITURA ATUAL --- //
			  const match = textoOCR.match(/Único\s+\d+[\.,]?\d*\s+(\d+[\.,]?\d*)/i);
			  if (match) {
			    let leituraAtual = match[1].replace('.', '').replace(',', '.'); 

			    console.log('LEITURA ATUAL:', leituraAtual);

			    document.getElementById('leituraAtual').value = leituraAtual;
			  } else {
			    console.warn('Leitura Atual não encontrada após Único.');
			  }*/
			  
			  // --- BLOCOS DE CONSUMO ---
			  const blocosConsumo = [...textoOCR.matchAll(/\(0[D|E]\)\s+Consumo\s+(TE|TUSD)\s+KWH\s+(\d+,\d+)\s+([\d,.]+)\s+([\d,.]+)/gi)];
			  let consumoTotal = 0;

			  blocosConsumo.forEach(b => {
			    const tipo = b[1]; // TE ou TUSD
			    let qtd = b[2];    // ex: "70,000"

			    qtd = parseFloat(qtd.replace(',', '.'));

			    consumoTotal += qtd;

			    console.log('Tipo: ' + tipo +', Qtd: ' + qtd + ' kWh');
			  });

			  console.log('Consumo total: ' + consumoTotal + 'kWh');

			  document.getElementById('consumoTotal').value = consumoTotal; 


			}


		
  </script>
</body>
</html>