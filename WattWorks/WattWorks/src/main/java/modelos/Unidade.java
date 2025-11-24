package modelos;

import java.time.LocalDate;

public class Unidade {
	private int id, entidade_id;
	private String descricao, cnpj;
	private LocalDate dataCadastro;
	private int subgrupoId, modalidadeId;
	
	public Unidade(String descricao, String cnpj, int entidadeId) {
		this.descricao = descricao;
		this.cnpj = cnpj;
		this.dataCadastro = LocalDate.now();
		this.entidade_id = entidadeId;
	}
	
	public Unidade(String descricao, String cnpj,  String subgrupoId, String modalidadeId,
			int entidadeId) {
		this.descricao = descricao;
		this.cnpj = cnpj;
		this.dataCadastro = LocalDate.now();
		this.subgrupoId = Integer.parseInt(subgrupoId);
	    this.modalidadeId = Integer.parseInt(modalidadeId);
		this.entidade_id = entidadeId;
	}
	
	public Unidade(int id, String descricao, String cnpj, LocalDate dataCadastro, int subgrupoId, int modalidadeId,
			int entidade_id) {
		this.id = id;
		this.descricao = descricao;
		this.cnpj = cnpj;
		this.dataCadastro = dataCadastro;
		this.subgrupoId = subgrupoId;
	    this.modalidadeId = modalidadeId;
		this.entidade_id = entidade_id;
	}
	
	public int getId() {
		return id;
	}
	public int getEntidade_id() {
		return entidade_id;
	}
	public String getDescricao() {
		return descricao;
	}
	public String getCnpj() {
		return cnpj;
	}
	public LocalDate getDataCadastro() {
		return dataCadastro;
	}
	public int getSubgrupoId() {
		return subgrupoId;
	}
	public int getModalidadeId() {
		return modalidadeId;
	}	
}
