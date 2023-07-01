package pl.scrumsystem.zakladfryzjerski.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController
{
    @GetMapping("/login")
    public String login()
    {
        return "login";
    }

    @GetMapping("/access-denied")
    public String accessDenied()
    {
        return "access-denied";
    }
}