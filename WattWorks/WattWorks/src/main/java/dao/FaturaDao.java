package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import modelos.Fatura;
import utils.ConexaoDB;

public class FaturaDao {
private static Connection con;
	
	public static void salvarFaturaA(Fatura fatA) throws SQLException {
        try {
        	con = ConexaoDB.getConexao();
        	PreparedStatement stm = con.prepareStatement("INSERT INTO tb_faturas (unidade_id, subgrupo_id, data_referencia,"
        			+ "consumo_fora_ponta, consumo_ponta, demanda_ponta, demanda_fora_ponta, data_cadastro) "
        			+ "VALUES (?,?,?,?,?,?,?,?)");
            stm.setInt(1, fatA.getUnidadeId());
            stm.setInt(2, fatA.getSubgrupoId());
            stm.setObject(3, fatA.getDataReferencia());
            stm.setDouble(4, fatA.getConsumoForaPonta());
            stm.setDouble(5, fatA.getConsumoPonta());
            stm.setDouble(6, fatA.getDemandaPontaKw());
            stm.setDouble(7, fatA.getDemandaForaPontaKw());
            stm.setObject(8, fatA.getDataCadastro());
            stm.execute();
            stm.close();
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
	}
	
	public static Fatura getFaturaAById(int idFatA) throws SQLException {
		Fatura fat = null;
		try {
        	con = ConexaoDB.getConexao();
            PreparedStatement stm = con.prepareStatement("SELECT * FROM tb_faturas WHERE id = ?");
            stm.setInt(1, idFatA);
            ResultSet rs = stm.executeQuery();	

            if (rs.next()) {       
            	Date dataCadSql = rs.getDate("data_cadastro");
            	LocalDate dataCadastro = (dataCadSql != null) ? dataCadSql.toLocalDate() : null;
            	Date dataRefSql = rs.getDate("data_referencia");
            	LocalDate dataReferencia = (dataRefSql != null) ? dataRefSql.toLocalDate() : null;
            	            	
	        	fat = new Fatura(rs.getInt("id"), rs.getInt("unidade_id"), rs.getInt("subgrupo_id"), 
	        			dataReferencia, rs.getDouble("consumo_fora_ponta"), rs.getDouble("consumo_ponta"), 
	        			rs.getDouble("demanda_ponta"), rs.getDouble("demanda_fora_ponta"), dataCadastro);
            	return fat;
			}
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
		return fat;
	}
	
	public static List<Fatura> getByFiltros(Integer unidadeId, Integer ano) throws SQLException {
	    List<Fatura> fats = new ArrayList<>();
	    try {
	        con = ConexaoDB.getConexao();

	        StringBuilder sql = new StringBuilder("SELECT * FROM tb_faturas WHERE 1=1  AND unidade_id = ?");
	        
	        if (ano != null && ano > 0) {
	            sql.append(" AND YEAR(data_referencia) = ?");
	        }

	        sql.append(" ORDER BY data_referencia DESC");

	        PreparedStatement stm = con.prepareStatement(sql.toString());

	        int index = 1;
	        if (unidadeId != null && unidadeId > 0) {
	            stm.setInt(index++, unidadeId);
	        }
	        if (ano != null && ano > 0) {
	            stm.setInt(index++, ano);
	        }

	        ResultSet rs = stm.executeQuery();

	        while (rs.next()) {
	            Date dataRefSql = rs.getDate("data_referencia");
	            LocalDate dataReferencia = (dataRefSql != null) ? dataRefSql.toLocalDate() : null;

	            fats.add(new Fatura(rs.getInt("id"), rs.getInt("unidade_id"), dataReferencia));
	        }
	    } catch (SQLException e) {
	        throw new SQLException(e.getMessage());
	    }
	    return fats;
	}
	
	public static int getNumTotal() throws SQLException {
	    int totalFaturas = 0;
		try {
        	con = ConexaoDB.getConexao();
        	PreparedStatement stm = con.prepareStatement("SELECT COUNT(*) FROM tb_faturas");            
            ResultSet rs = stm.executeQuery();	

            if (rs.next()) {             
            	 totalFaturas = rs.getInt(1);
			}
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
		return totalFaturas;
	}
	
	public static List<Integer> getAnosComFaturas() throws SQLException {
		List<Integer> anos = new ArrayList<>();
		try {
        	con = ConexaoDB.getConexao();
        	PreparedStatement stm = con.prepareStatement("SELECT YEAR(data_referencia) AS ano FROM tb_faturas GROUP BY ano ORDER BY ano DESC");            
            ResultSet rs = stm.executeQuery();	

            while (rs.next()) {             
            	anos.add(rs.getInt("ano"));
			}
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
		return anos;
	}
	
	public static void removerFaturaA(int idFatA) throws SQLException {
		try {
        	con = ConexaoDB.getConexao();
            PreparedStatement stm = con.prepareStatement("DELETE FROM tb_faturas WHERE id = ?");
            stm.setInt(1, idFatA);
            stm.execute();
            stm.close();
            }
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
	}
}