package modelos;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Entidade {
	private int id, usuarioId;
	private String nome, cnpj, fone;
	private LocalDate dataCadastro;	
	
	public Entidade(String nome, String cnpj, String fone) {
		this.nome = nome;
		this.cnpj = cnpj;
		this.fone = fone;
		this.dataCadastro = LocalDate.now();
	}	
	
	public Entidade(int id, String nome, String cnpj, String fone, LocalDate dataCadastro, int usuarioId) {
		this.id = id;
		this.nome = nome; 
		this.cnpj = cnpj;
		this.fone = fone;
		this.dataCadastro = dataCadastro;
		this.usuarioId = usuarioId;
	}

	public int getId() {
		return id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCnpj() {
		return cnpj;
	}
	public String getFone() {
		return fone;
	}
	public void setFone(String fone) {
		this.fone = fone;
	}
	public LocalDate getDataCadastro() {
		return dataCadastro;
	}
	public int getUsuarioId() {
		return usuarioId;
	}
}
