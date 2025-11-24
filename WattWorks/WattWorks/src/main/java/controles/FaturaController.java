package controles;

import java.sql.SQLException;
import java.util.List;

import dao.FaturaDao;
import dao.TarifaDeAplicacaoDao;
import modelos.Fatura;
import modelos.TarifaDeAplicacao;

public class FaturaController {
	public void salvarFatura(Fatura fat) throws SQLException {
		FaturaDao.salvarFaturaA(fat);
	}
	 	 
	public Fatura getFaturaAById(int idFatA) throws SQLException {
		return FaturaDao.getFaturaAById(idFatA);
	}
	
	public int getNumTotal() throws SQLException {
		return FaturaDao.getNumTotal();
	}
	
	public List<Fatura> getByFiltros(int unidadeId, int ano) throws SQLException {
		return FaturaDao.getByFiltros(unidadeId, ano);
	} 
	
	public List<Integer> getAnosComFaturas() throws SQLException {
		return FaturaDao.getAnosComFaturas();
	} 
	
	public void removerFaturaA(int idFatA) throws SQLException {
		FaturaDao.removerFaturaA(idFatA);
	}
	
	public String houvePenalidadeFP(Fatura fat) throws SQLException {
		List<TarifaDeAplicacao> tarifas = TarifaDeAplicacaoDao.getTarifasDeAplicacao(fat.getDataReferencia().getYear());
		TarifaDeAplicacao tafAp = null;
		
		for (TarifaDeAplicacao tafAp2 : tarifas) {
		    if("FP".equals(tafAp2.getPosto())) {
		    	tafAp = tafAp2;
		    }
		}

		return tafAp.getPenalidadeFP(fat.getConsumoForaPonta(), fat.getDemandaForaPontaKw());
	}
	
	public String houvePenalidadeP(Fatura fat) throws SQLException {
		List<TarifaDeAplicacao> tarifas = TarifaDeAplicacaoDao.getTarifasDeAplicacao(fat.getDataReferencia().getYear());
		TarifaDeAplicacao tafAp = null;

		for (TarifaDeAplicacao tafAp2 : tarifas) {
		    if("P".equals(tafAp2.getPosto())) {
		    	tafAp = tafAp2;
		    }
		}
		return tafAp.getPenalidadeP(fat.getConsumoPonta(), fat.getDemandaPontaKw());
	}
	
	public double calcularValorTusdFPA(Fatura fat) throws SQLException {
		List<TarifaDeAplicacao> tarifas = TarifaDeAplicacaoDao.getTarifasDeAplicacao(fat.getDataReferencia().getYear());
		TarifaDeAplicacao tafAp = null;
		for (TarifaDeAplicacao tafAp2 : tarifas) {
		    if("FP".equals(tafAp2.getPosto())) {
		    	tafAp = tafAp2;
		    }
		}
		return tafAp.getValorTusdFPA(fat.getConsumoForaPonta(), fat.getDemandaForaPontaKw());
	}
	
	public double calcularValorTeFPA(Fatura fat) throws SQLException {
		List<TarifaDeAplicacao> tarifas = TarifaDeAplicacaoDao.getTarifasDeAplicacao(fat.getDataReferencia().getYear());
		TarifaDeAplicacao tafAp = null;
		
		for (TarifaDeAplicacao tafAp2 : tarifas) {
		    if("FP".equals(tafAp2.getPosto())) {
		    	tafAp = tafAp2;
		    }
		}
		return tafAp.getValorTeFPA(fat.getConsumoForaPonta(), fat.getDemandaForaPontaKw());
	}
	
	public double calcularValorTusdPA(Fatura fat) throws SQLException {
		List<TarifaDeAplicacao> tarifas = TarifaDeAplicacaoDao.getTarifasDeAplicacao(fat.getDataReferencia().getYear());
		TarifaDeAplicacao tafAp = null;
		for (TarifaDeAplicacao tafAp2 : tarifas) {
		    if("P".equals(tafAp2.getPosto())) {
		    	tafAp = tafAp2;
		    }
		}
		return tafAp.getValorTusdFPA(fat.getConsumoPonta(), fat.getDemandaPontaKw());
	}
	
	public double calcularValorTePA(Fatura fat) throws SQLException {
		List<TarifaDeAplicacao> tarifas = TarifaDeAplicacaoDao.getTarifasDeAplicacao(fat.getDataReferencia().getYear());
		TarifaDeAplicacao tafAp = null;
		
		for (TarifaDeAplicacao tafAp2 : tarifas) {
		    if("P".equals(tafAp2.getPosto())) {
		    	tafAp = tafAp2;
		    }
		}
		return tafAp.getValorTeFPA(fat.getConsumoPonta(), fat.getDemandaPontaKw());
	}}
