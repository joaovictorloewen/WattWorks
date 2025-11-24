<%
	String subgrupo = request.getParameter("subgrupo");
	if (subgrupo.equals("A")) {%>
		<label for="dataFatura" class="form-label">Data de Referência:</label>
		<input type="date" class="form-control" id="dataFatura" name="dataFatura" required>
		<label for="consumoForaPonta" class="form-label">Consumo Fora de Ponta:</label>
		<input type="number" class="form-control" id="consumoForaPonta" name="consumoForaPonta" required>
		<label for="consumoPonta" class="form-label">Consumo Ponta:</label>
		<input type="number" class="form-control" id="consumoPonta" name="consumoPonta" required>
		<label for="demandaPonta" class="form-label">Demanda Ponta (kW):</label>
		<input type="number" class="form-control" id="demandaPonta" name="demandaPonta" required>
		<label for="demandaForaPonta" class="form-label">Demanda Fora Ponta (kW):</label>
		<input type="number" class="form-control" id="demandaForaPonta" name="demandaForaPonta" required>
	    <button type="submit" href="/WattWorks/restrito-clientes/cadastrarFatura.jsp" class="btn btn-roxo w-100 mt-4">Cadastrar Fatura</button>
	<%} else {%>
		<label for="dataFatura" class="form-label">Data de Referência:</label>
		<input type="date" class="form-control" id="dataFatura" name="dataFatura" required>
		<label for="bandeira" class="form-label">Bandeira:</label>
		<input type="text" class="form-control" id="bandeira" name="bandeira" required>
		<!--<label for="leituraAtual" class="form-label">Leitura Atual:</label>
		<input type="number" class="form-control" id="leituraAtual" name="leituraAtual" required>-->
		<label for="consumoTotal" class="form-label">Consumo Total (kWh):</label>
		<input type="number" class="form-control" id="consumoTotal" name="consumoTotal" required>		
	    <button type="submit" href="/WattWorks/restrito-clientes/cadastrarFatura.jsp" class="btn btn-roxo w-100 mt-4">Cadastrar Fatura</button>
	<%}%>