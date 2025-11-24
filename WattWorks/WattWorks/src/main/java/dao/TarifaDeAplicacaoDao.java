package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelos.TarifaDeAplicacao;
import utils.ConexaoDB;

public class TarifaDeAplicacaoDao {
	private static Connection con;

	public static List<TarifaDeAplicacao> getTarifasDeAplicacao(int ano) throws SQLException {
	    List<TarifaDeAplicacao> lista = new ArrayList<>();
	    
	    try (Connection con = ConexaoDB.getConexao();
	         PreparedStatement stm = con.prepareStatement(
	            "SELECT " +
	            "    ta.id AS aplicacao_id, " +
	            "    ta.subgrupo_id, " +
	            "    ta.posto, " +
	            "    ta.ano_tarifa, " +
	            "    te.rs_kwh AS tarifa_energia, " +
	            "    tus.rs_kw, " +
	            "    tus.rs_mwh AS tarifa_uso_mwh " +
	            "FROM tb_tarifas_de_aplicacao ta " +
	            "JOIN tb_tarifas_energia te ON ta.tarifa_energia_id = te.id " +
	            "JOIN tb_tarifas_uso_sistema tus ON ta.tarifa_uso_sistema_id = tus.id " +
	            "WHERE ta.ano_tarifa = ?")) {
	        
	        stm.setInt(1, ano);
	        
	        try (ResultSet rs = stm.executeQuery()) {
	            while (rs.next()) {
	                TarifaDeAplicacao tafAp = new TarifaDeAplicacao(
	                    rs.getInt("aplicacao_id"),   
	                    rs.getInt("subgrupo_id"),  
	                    rs.getDouble("rs_kw"),      
	                    rs.getDouble("tarifa_uso_mwh"), 
	                    rs.getDouble("tarifa_energia"), 
	                    rs.getString("posto"),     
	                    rs.getInt("ano_tarifa")    
	                );
	                lista.add(tafAp);
	            }
	        }
	    } catch (SQLException e) {
	        throw new SQLException(e.getMessage());
	    }
	    
	    return lista;
	}

}
