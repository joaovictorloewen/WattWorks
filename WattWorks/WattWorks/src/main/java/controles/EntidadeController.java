package controles;

import java.sql.SQLException;

import dao.EntidadeDao;
import modelos.Entidade;
import modelos.Usuario;
 
public class EntidadeController {
	
	public void salvarEntidadeEUsuario(Entidade ent, Usuario user) throws SQLException {
		EntidadeDao.salvarEntidadeEUsuario(ent, user);
	}
	 
	public void editarEntidadeEUsuario(Entidade ent, Usuario user) throws SQLException {
		EntidadeDao.salvarEntidadeEUsuario(ent, user);
	}
	
	public Entidade getById(int id) throws SQLException {
		return EntidadeDao.getById(id);
	}
	
	public Entidade getEntidadeByUserId(int id) throws SQLException {
		return EntidadeDao.getEntidadeByUserId(id);
	}
}
