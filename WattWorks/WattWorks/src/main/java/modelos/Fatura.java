package modelos;

import java.time.LocalDate;

public class Fatura {
    private int id, unidadeId;
    private int subgrupoId;
    private LocalDate dataReferencia;
    private double consumoForaPonta;
    private double consumoPonta;
    private double demandaPontaKw;
    private double demandaForaPontaKw;
    private LocalDate dataCadastro;
    
	public Fatura(int id, int unidade_id, LocalDate dataReferencia) {
		this.id = id;
		this.unidadeId = unidade_id;
		this.dataReferencia = dataReferencia;
	}
	
	public Fatura(int unidade_id, int subgrupoId, LocalDate dataReferencia, double consumoForaPonta,
	        double consumoPonta, double demandaPontaKw, double demandaForaPontaKw) {
	    this.unidadeId = unidade_id;
	    this.subgrupoId = subgrupoId;
	    this.dataReferencia = dataReferencia;
	    this.consumoForaPonta = consumoForaPonta;
	    this.consumoPonta = consumoPonta;
	    this.demandaPontaKw = demandaPontaKw;
	    this.demandaForaPontaKw = demandaForaPontaKw;
	    dataCadastro = LocalDate.now();
	}

	
    public Fatura(int id, int unidade_id, int subgrupoId, LocalDate dataReferencia, double consumoForaPonta,
			double consumoPonta, double demandaPontaKw, double demandaForaPontaKw, LocalDate dataCadastro) {
		this.id = id;
		this.unidadeId = unidade_id;
		this.subgrupoId = subgrupoId;
		this.dataReferencia = dataReferencia;
		this.consumoForaPonta = consumoForaPonta;
		this.consumoPonta = consumoPonta;
		this.demandaPontaKw = demandaPontaKw;
		this.demandaForaPontaKw = demandaForaPontaKw;
		this.dataCadastro = dataCadastro;
	}
		
	public int getId() {
		return id;
	}
	public int getUnidadeId() {
		return unidadeId;
	}
	public int getSubgrupoId() {
		return subgrupoId;
	}
	public LocalDate getDataReferencia() {
		return dataReferencia;
	}
	public double getConsumoForaPonta() {
		return consumoForaPonta;
	}
	public double getConsumoPonta() {
		return consumoPonta;
	}
	public double getDemandaPontaKw() {
		return demandaPontaKw;
	}
	public double getDemandaForaPontaKw() {
		return demandaForaPontaKw;
	} 
	public LocalDate getDataCadastro() {
		return dataCadastro;
	}
}