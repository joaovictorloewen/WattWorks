package modelos;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import enums.TipoUsuarioENUM;

public class Usuario {
	private int id;
    private String email, senhaHash;
    private TipoUsuarioENUM tipoUsuario;

    public Usuario(String email, String senha, String tipoUsuario) {
        this.email = email;
        this.senhaHash = gerarHash(senha);
        this.tipoUsuario = TipoUsuarioENUM.valueOf(tipoUsuario.toUpperCase());
        System.out.println(this.tipoUsuario + "aaaa");
    }
    
    public Usuario(int id, String email, String senha, String tipoUsuario) {
        this.id = id;
    	this.email = email;
        this.senhaHash = senha;
        this.tipoUsuario = TipoUsuarioENUM.valueOf(tipoUsuario.toUpperCase());
    }
    
    public Usuario(String email, String senha) {
    	this.email = email;
        this.senhaHash = gerarHash(senha);
    }
    
    public Usuario(int id, String email) {
        this.id = id;
    	this.email = email;
    }
    
    public int getId() {
		return id;
	}

	public String getEmail() {
        return email;
    }
	
	public String getTipoUsuario() {
        return tipoUsuario.toString();
    }
	
    public String getSenhaHash() {
        return senhaHash;
    }

    private String gerarHash(String senha) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = md.digest(senha.getBytes());
            
            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
            
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Erro ao gerar hash da senha", e);
        }
    }
    
    public boolean verificarSenha(String senhaDigitada) {
        String hashDigitado = gerarHash(senhaDigitada);
        return hashDigitado.equals(this.senhaHash);
    }
}

