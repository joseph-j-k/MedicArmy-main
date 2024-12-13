package common_classes;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class MailConnection {
    public synchronized static boolean sendMail(String to, String subject, String text) {
        System.out.println("Mail to: " + to + " Subject: " + subject + " Text: " + text);

        String host = "smtp.gmail.com";
        String user = "medicarmy123@gmail.com";
        String pass = "jypz nivy rukp zuhl "; // Consider using a more secure way to handle passwords

        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", host);
        props.put("mail.smtp.user", user);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(user));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to)); // Set single recipient
            message.setSubject(subject);
            message.setText(text);

            Transport transport = session.getTransport("smtp");
            transport.connect(host, user, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            return true;
        } catch (AddressException ae) {
            ae.printStackTrace();
            return false;
        } catch (MessagingException me) {
            me.printStackTrace();
            return false;
        }
    }
}
