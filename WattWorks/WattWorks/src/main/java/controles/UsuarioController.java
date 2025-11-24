package controles;

import java.sql.SQLException;

import dao.UsuarioDao;
import modelos.Usuario;

public class UsuarioController {
	public static void atualizarSenha(Usuario user) throws SQLException {
		UsuarioDao.atualizarSenha(user);
	}
	
	public static Usuario getById(int id) throws SQLException {
		Usuario user = UsuarioDao.getById(id);
		return user;
	}
}
