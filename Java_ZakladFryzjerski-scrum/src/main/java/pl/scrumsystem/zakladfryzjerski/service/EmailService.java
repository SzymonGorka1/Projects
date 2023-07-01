package pl.scrumsystem.zakladfryzjerski.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService
{
    JavaMailSender emailSender;

    public EmailService(JavaMailSender emailSender)
    {
        this.emailSender = emailSender;
    }

    public void sendMassage(String to, String subject, String text)
    {
        SimpleMailMessage massage = new SimpleMailMessage();
        massage.setFrom("zakladfryzjerskisysinf@gmail.com");
        massage.setTo(to);
        massage.setSubject(subject);
        massage.setText(text);
        this.emailSender.send(massage);
    }
}
