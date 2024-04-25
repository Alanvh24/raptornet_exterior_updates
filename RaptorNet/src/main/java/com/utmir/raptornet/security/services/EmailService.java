package com.utmir.raptornet.security.services;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

    private final JavaMailSender mailSender;

    public EmailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendEmailWithImage(String to, String subject, String content, String imagePath) {
        MimeMessage message = mailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(content, true);

            String cid = "WeAreRaptors.png"; // Este es el Content-ID que utilizarás.
            ClassPathResource resource = new ClassPathResource(imagePath);
            String imageName = StringUtils.getFilename(resource.getPath());

            if (imageName != null) {
                // Asegurarnos de usar el nombre de archivo como el Content-ID
                helper.addInline(cid, resource);
            } else {
                throw new MessagingException("El nombre de la imagen no puede ser nulo");
            }

        } catch (MessagingException e) {
            throw new RuntimeException("Fallo al enviar el correo electrónico", e);
        }

        mailSender.send(message);
    }

    public void sendSimpleEmail(String to, String subject, String content) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(content, true); // true para indicar que el contenido es HTML
        } catch (MessagingException e) {
            throw new RuntimeException("Fallo al enviar el correo electrónico", e);
        }
        mailSender.send(message);
    }

    public void sendEmailWithAttachment(String to, String subject, String content, byte[] attachment,
            String attachmentFilename) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(content);

        // Agrega el adjunto
        helper.addAttachment(attachmentFilename, new ByteArrayResource(attachment));

        mailSender.send(message);
    }
}