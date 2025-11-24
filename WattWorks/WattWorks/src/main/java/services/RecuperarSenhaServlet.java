package services;

import java.io.IOException;
import java.security.SecureRandom;
import java.sql.SQLException;
import java.util.Properties;

import dao.UsuarioDao;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelos.Usuario;

@WebServlet("/recuperar-senha")
public class RecuperarSenhaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        UsuarioDao usuarioDao = new UsuarioDao();
        Usuario usuario = null;

        try {
            usuario = usuarioDao.getByEmail(email);
        } catch (SQLException e) {
            e.printStackTrace();
            request.getSession().setAttribute("mensagemRecuperacao",
                    "Erro no banco de dados: " + e.getMessage());
        }

        if (usuario != null) {
            String codigo = gerarCodigo();

            request.getSession().setAttribute("codigoRecuperacao", codigo);
            request.getSession().setAttribute("emailRecuperacao", email);

            boolean enviado = enviarEmail(email, codigo);
            if (enviado) {
                response.sendRedirect("/WattWorks/validarCodigo.jsp");
                return;
            } else {
                request.getSession().setAttribute("mensagemRecuperacao",
                        "Erro ao enviar o e-mail (verifique os logs).");
            }
        } else {
            request.getSession().setAttribute("mensagemRecuperacao",
                    "O e-mail informado não pertence a nenhum cadastro.");
        }

        response.sendRedirect("/WattWorks/recuperarSenha.jsp");
    }

    private String gerarCodigo() {
        SecureRandom random = new SecureRandom();
        int number = random.nextInt(999999); 
        return String.format("%06d", number);
    }

    private boolean enviarEmail(String para, String codigo) {
        final String remetente = "wattworksoficial@gmail.com"; 
        final String senhaRemetente = "dskw rlsx uygw nypt"; 

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.debug", "true");

        Session session = Session.getInstance(props,
                new jakarta.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(remetente, senhaRemetente);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(remetente));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(para));
            message.setSubject("Código de Recuperação - WattWorks");
            message.setSubject("Código de Recuperação - WattWorks");

            String htmlMessage = "<!DOCTYPE html>"
                    + "<html>"
                    + "<head>"
                    + "<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css' rel='stylesheet'>"
                    + "<style>"
                    + "  body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }"
                    + "  .container { max-width: 600px; margin: 30px auto; background-color: #eaeaea; border-radius: 8px; box-shadow: 0 0 15px rgba(0,0,0,0.2); overflow: hidden; color: #333333; }"
                    + "  .header { width: 100%; padding: 30px 0; text-align: center; background-color: #6a0dad; color: #ffffff; }"
                    + "  .header h1 { margin: 0; font-size: 36px; letter-spacing: 2px; }"
                    + "  .content { padding: 25px 20px; text-align: center; }"
                    + "  .content p { font-size: 16px; margin: 15px 0; }"
                    + "  .codigo { display: inline-block; padding: 15px 35px; font-size: 28px; color: #ffffff; background-color: #8a2be2; border-radius: 8px; margin: 20px 0; letter-spacing: 6px; font-weight: bold; }"
                    + "  .footer { font-size: 12px; color: #888888; margin-top: 20px; text-align: center; padding-bottom: 15px; }"
                    + "  .icon { color: #6a0dad; margin-right: 8px; vertical-align: middle; }"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "  <div class='container'>"
                    + "    <div class='header'>"
                    + "      <i class='bi bi-lightning-charge-fill icon'></i>"
                    + "      <h1>WattWorks</h1>"
                    + "    </div>"
                    + "    <div class='content'>"
                    + "      <p><i class='bi bi-person-circle icon'></i>Olá,</p>"
                    + "      <p>Você solicitou a recuperação de senha. Utilize o código abaixo para redefinir sua senha:</p>"
                    + "      <div class='codigo'>" + codigo + "</div>"
                    + "      <p><i class='bi bi-clock-fill icon'></i>Este código expira em <strong>10 minutos</strong>.</p>"
                    + "      <p><i class='bi bi-exclamation-triangle-fill icon'></i>Se você não solicitou essa ação, ignore este e-mail.</p>"
                    + "    </div>"
                    + "    <div class='footer'>WattWorks &copy; 2025. Todos os direitos reservados.</div>"
                    + "  </div>"
                    + "</body>"
                    + "</html>";

            message.setContent(htmlMessage, "text/html; charset=UTF-8");
            
            Transport.send(message);
            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            System.err.println("❌ Erro ao enviar e-mail: " + e.getMessage());
            if (e.getCause() != null) {
                System.err.println("Causa raiz: " + e.getCause().getMessage());
            }
            return false;
        }
    }
}
