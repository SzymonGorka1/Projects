package pl.scrumsystem.zakladfryzjerski.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import pl.scrumsystem.zakladfryzjerski.entity.Availability;
import pl.scrumsystem.zakladfryzjerski.entity.Schedule;
import pl.scrumsystem.zakladfryzjerski.repository.AvailabilityRepository;


import java.util.List;

@Controller
public class AvailabilityController {
    @Autowired
    private AvailabilityRepository sRepo;

    @GetMapping({"/showAvailabilitySchedule"})
    public ModelAndView showAvailabilitySchedule()
    {
        ModelAndView mav = new ModelAndView("list-availability-schedule");
        List<Availability> list = sRepo.findAll();
        mav.addObject("availabilitys", list);
        return mav;
    }
}
