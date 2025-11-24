package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import modelos.Entidade;
import modelos.Usuario;
import utils.ConexaoDB;

public class EntidadeDao {
	private static Connection con;
	
	public static void salvarEntidadeEUsuario(Entidade ent, Usuario user) throws SQLException {
        try {
        	con = ConexaoDB.getConexao();
            PreparedStatement stm = con.prepareStatement("CALL sp_insert_entidade_usuario (?,?,?,?,?,?)");
         
            stm.setString(1, ent.getNome());
            stm.setString(2, user.getEmail());
            stm.setString(3, ent.getFone());
            stm.setString(4, ent.getCnpj());
            stm.setString(5, user.getSenhaHash());
            stm.setString(6, user.getTipoUsuario());
            stm.execute();
            stm.close();
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
	}
	
	public static void editarEntidadeEUsuario(Entidade ent, Usuario user) throws SQLException {
        try {
        	con = ConexaoDB.getConexao();
            PreparedStatement stm = con.prepareStatement("CALL sp_editar_entidade_usuario (?,?,?,?,?,?)");
         
            stm.setString(1, ent.getNome());
            stm.setString(2, user.getEmail());
            stm.setString(3, ent.getFone());
            stm.setString(4, ent.getCnpj());
            stm.setInt(5, ent.getId());
            stm.setInt(6, user.getId());
            stm.execute();
            stm.close();
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
	}
	
	public static Entidade getById(int id) throws SQLException {
		Entidade entidade = null;
		try {
        	con = ConexaoDB.getConexao();
            PreparedStatement stm = con.prepareStatement("SELECT * FROM tb_entidades WHERE id = ?");
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();	

            if (rs.next()) {       
            	Date dataSql = rs.getDate("cadastrado_em");
            	LocalDate dataCadastro = (dataSql != null) ? dataSql.toLocalDate() : null;
            	
	        	entidade = new Entidade(rs.getInt("id"), rs.getString("nome"), rs.getString("cnpj"), rs.getString("fone"), dataCadastro, rs.getInt("usuario_id"));
            	return entidade;
			}
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
		return entidade;
	}
	
	public static Entidade getEntidadeByUserId(int id) throws SQLException {
		Entidade entidade = null;
		try {
        	con = ConexaoDB.getConexao();
            PreparedStatement stm = con.prepareStatement("SELECT * FROM tb_entidades WHERE usuario_id = ?");
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();	

            if (rs.next()) {       
            	Date dataSql = rs.getDate("cadastrado_em");
            	LocalDate dataCadastro = (dataSql != null) ? dataSql.toLocalDate() : null;
            	
	        	entidade = new Entidade(rs.getInt("id"), rs.getString("nome"), rs.getString("cnpj"), rs.getString("fone"), dataCadastro, rs.getInt("usuario_id"));
            	return entidade;
			}
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
		return entidade;
	}
}
