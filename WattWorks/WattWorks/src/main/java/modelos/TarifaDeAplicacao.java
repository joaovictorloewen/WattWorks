package modelos;

import java.text.NumberFormat;
import java.util.Locale;

public class TarifaDeAplicacao {
	private int id;
	private int subgrupoId;
	private double tusdRsKW;
	private double tusdRsMWH;
	private double teRsKWH;
	private String posto;
	private int anoTarifa;
	
	public TarifaDeAplicacao(int id, int subgrupoId, double tusdRsKW, double tusdRsMWH, double teRsKWH, String posto,
			int anoTarifa) {
		this.id = id;
		this.subgrupoId = subgrupoId;
		this.tusdRsKW = tusdRsKW;
		this.tusdRsMWH = tusdRsMWH;
		this.teRsKWH = teRsKWH;
		this.posto = posto;
		this.anoTarifa = anoTarifa;
	}
	
	public TarifaDeAplicacao(int subgrupoId, double tusdRsKW, double tusdRsMWH, double teRsMWH, String posto,
			int anoTarifa) {
		this.subgrupoId = subgrupoId;
		this.tusdRsKW = tusdRsKW;
		this.tusdRsMWH = tusdRsMWH;
		this.teRsKWH = teRsMWH;
		this.posto = posto;
		this.anoTarifa = anoTarifa;
	}

	public int getId() {
		return id;
	}
	public int getSubgrupoId() {
		return subgrupoId;
	}
	public double getTusdRsKW() {
		return tusdRsKW;
	}
	public double getTusdRsMWH() {
		return tusdRsMWH;
	}
	public double getTeRsMWH() {
		return teRsKWH;
	}
	public String getPosto() {
		return posto;
	}
	public int getAnoTarifa() {
		return anoTarifa;
	}
	
	public double getValorTusdFPA(double consumoFP, double demandaFP) {
		double demandaExcedida = 0;
		if (consumoFP > demandaFP) {
			demandaExcedida = consumoFP - demandaFP;
		}
		return consumoFP * tusdRsKW + ((tusdRsKW*2) * demandaExcedida);
	}
	
	public double getValorTeFPA(double consumoFP, double demandaFP) {
		double demandaExcedida = 0;
		if (consumoFP > demandaFP) {
			demandaExcedida = consumoFP - demandaFP;
		}
		System.out.println(teRsKWH);
		return (consumoFP * teRsKWH + ((teRsKWH*2) * demandaExcedida)	);
	}
	
	public double getValorTusdPA(double consumoP, double demandaP) {
		double demandaExcedida = 0;
		if (consumoP > demandaP) {
			demandaExcedida = consumoP - demandaP;
		}
		return consumoP * tusdRsKW + ((tusdRsKW*2) * demandaExcedida);
	}
	
	public double getValorTePA(double consumoP, double demandaP) {
		double demandaExcedida = 0;
		if (consumoP > demandaP) {
			demandaExcedida = consumoP - demandaP;
		}
		System.out.println(teRsKWH);
		return (consumoP * teRsKWH + ((teRsKWH*2) * demandaExcedida)	);
	}
	 	
	public String getPenalidadeFP(double consumoFP, double demandaFP) {
		if (consumoFP > demandaFP) {
		    NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
			return "você <span class='text-danger fw-bold'> ultrapassou " + String.format("%.0f", (consumoFP - demandaFP)) + " kW </span> da sua demanda contratada, que é de " + demandaFP + 
					" kWh. Diante deste cenário, foi paga uma <span class='text-danger fw-bold'> multa de " + (nf.format((tusdRsKW*2) * (consumoFP - demandaFP))) + 
					"</span> por ultrapassagem de demanda.";

		}
		return "não constam multas ou penalidades na fatura consultada";
	}
	
	public String getPenalidadeP(double consumoP, double demandaP) {
		if (consumoP > demandaP) {
		    NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
			return "você <span class='text-danger fw-bold'> ultrapassou " + (consumoP - demandaP) + " kWh </span> da sua demanda contratada, que é de " + demandaP + 
					" kWh. Diante deste cenário, foi paga uma <span class='text-danger fw-bold'> multa de " + (nf.format((teRsKWH*2) * (consumoP - demandaP))) + 
					"</span> por ultrapassagem de demanda.";

		}
		return "não constam multas ou penalidades na fatura consultada";
	}
}
