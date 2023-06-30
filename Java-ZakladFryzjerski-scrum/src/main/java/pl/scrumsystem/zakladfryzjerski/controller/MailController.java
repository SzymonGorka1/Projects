package pl.scrumsystem.zakladfryzjerski.controller;

import pl.scrumsystem.zakladfryzjerski.service.EmailService;

public class MailController
{
    private EmailService emailService;

    public MailController(EmailService emailService)
    {
        this.emailService = emailService;
    }
}
