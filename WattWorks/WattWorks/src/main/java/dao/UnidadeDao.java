package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import modelos.Unidade;
import utils.ConexaoDB;

public class UnidadeDao {
private static Connection con;
	
	public static void salvarUnidade(Unidade uni) throws SQLException {
        try {
        	con = ConexaoDB.getConexao();
        	PreparedStatement stm = con.prepareStatement("INSERT INTO tb_unidades (descricao, cnpj, cadastrado_em, entidade_id) VALUES (?,?,?,?)");
            stm.setString(1, uni.getDescricao());
            stm.setString(2, uni.getCnpj());
            stm.setObject(3, uni.getDataCadastro());
            stm.setInt(4, uni.getEntidade_id());
            stm.execute();
            stm.close();
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
	}
	
	public static void editarUnidade(Unidade uni) throws SQLException {
        try {
        	con = ConexaoDB.getConexao();
        	PreparedStatement stm = con.prepareStatement("UPDATE tb_unidades SET descricao = ?, cnpj = ?, subgrupo_id = ?, modalidade_id = ?, entidade_id = ? WHERE id = ?");
            stm.setString(1, uni.getDescricao());
            stm.setString(2, uni.getCnpj());
            stm.setInt(3, uni.getSubgrupoId());
            stm.setInt(4, uni.getModalidadeId());
            stm.setInt(5, uni.getEntidade_id());
            stm.setInt(6, uni.getId());
            stm.execute();
            stm.close();
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
	}
	
	public static Unidade getById(int id) throws SQLException {
		Unidade unidade = null;
		try {
        	con = ConexaoDB.getConexao();
            PreparedStatement stm = con.prepareStatement("SELECT * FROM tb_unidades WHERE id = ?");
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();	

            if (rs.next()) {       
            	Date dataSql = rs.getDate("cadastrado_em");
            	LocalDate dataCadastro = (dataSql != null) ? dataSql.toLocalDate() : null;
            	
	        	unidade = new Unidade(rs.getInt("id"), rs.getString("descricao"), rs.getString("cnpj"), dataCadastro, rs.getInt("subgrupo_id"), rs.getInt("modalidade_id"), rs.getInt("entidade_id"));
            	return unidade;
			}
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
		return unidade;
	}
	
	public static List<Unidade> getByEntidadeId(int entidadeId) throws SQLException {
		List<Unidade> unidades = new ArrayList<>();
		try {
        	con = ConexaoDB.getConexao();
            PreparedStatement stm = con.prepareStatement("SELECT * FROM tb_unidades WHERE entidade_id = ?");
            stm.setInt(1, entidadeId);
            ResultSet rs = stm.executeQuery();	

            while (rs.next()) {       
            	Date dataSql = rs.getDate("cadastrado_em");
            	LocalDate dataCadastro = (dataSql != null) ? dataSql.toLocalDate() : null;
            	
	        	unidades.add(new Unidade(rs.getInt("id"), rs.getString("descricao"), rs.getString("cnpj"), dataCadastro, 
	        			rs.getInt("subgrupo_id"), rs.getInt("modalidade_id"), rs.getInt("entidade_id")));
			}
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
		return unidades;
	}
}