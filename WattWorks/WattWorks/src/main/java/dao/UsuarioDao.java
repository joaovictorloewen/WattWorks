package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.sql.Connection;
import java.sql.Date;

import modelos.Entidade;
import modelos.Usuario; 
import utils.ConexaoDB;

public class UsuarioDao {
	private static Connection con;
	
	public Usuario autenticar(String email, String senha) throws Exception {        
		Usuario usuario = null;
		try {
			con = ConexaoDB.getConexao();
			PreparedStatement stm = con.prepareStatement("SELECT * FROM tb_usuarios WHERE email = ?");
			stm.setString(1, email);
			ResultSet rs = stm.executeQuery();	
			
			if (rs.next()) {
                String senhaHash = rs.getString("senha_hash");
                
                if (senhaHash.equals(hashSenha(senha))) {
                	usuario = new Usuario(rs.getInt("id"), rs.getString("email"), rs.getString("senha_hash"), rs.getString("tipo_usuario"));
                    return usuario;
                }
			}
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
        return null;
    }
	  
	 private String hashSenha(String senha) {
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
	 
	 public static Usuario getById(int id) throws SQLException {
			Usuario user = null;
			try {
	        	con = ConexaoDB.getConexao();
	            PreparedStatement stm = con.prepareStatement("SELECT * FROM tb_usuarios WHERE id = ?");
	            stm.setInt(1, id);
	            ResultSet rs = stm.executeQuery();	

	            if (rs.next()) {              	
		        	user = new Usuario(rs.getInt("id"), rs.getString("email"), rs.getString("senha_hash"), rs.getString("tipo_usuario"));
	            	return user;
				}
			}
			catch (SQLException e) {
				throw new SQLException(e.getMessage());
			}
			return user;
	}
	 
	 public Usuario getByEmail(String email) throws SQLException {
			Usuario user = null;
			try {
	        	con = ConexaoDB.getConexao();
	            PreparedStatement stm = con.prepareStatement("SELECT * FROM tb_usuarios WHERE email = ?");
	            stm.setString(1, email);
	            ResultSet rs = stm.executeQuery();	

	            if (rs.next()) {              	
		        	user = new Usuario(rs.getInt("id"), rs.getString("email"), rs.getString("senha_hash"), rs.getString("tipo_usuario"));
	            	return user;
				}
			}
			catch (SQLException e) {
				throw new SQLException(e.getMessage());
			}
			return user;
	}
	 
	 public static void atualizarSenha(Usuario user) throws SQLException {
		 try {
        	con = ConexaoDB.getConexao();
            PreparedStatement stm = con.prepareStatement("UPDATE tb_usuarios SET senha_hash = ? WHERE email = ?");
         
            stm.setString(1, user.getSenhaHash());
            stm.setString(2, user.getEmail());
            stm.execute();
            stm.close();
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
	 }
}
