package pl.scrumsystem.zakladfryzjerski.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import pl.scrumsystem.zakladfryzjerski.entity.User;
import pl.scrumsystem.zakladfryzjerski.web.dto.UserRegistrationDto;


public interface UserService extends UserDetailsService
{
    User save(UserRegistrationDto registrationDto);
}
