package pl.scrumsystem.zakladfryzjerski.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pl.scrumsystem.zakladfryzjerski.entity.Booking;
import pl.scrumsystem.zakladfryzjerski.repository.BookingRepository;

import java.util.List;

@Controller
public class BookingController {

    @Autowired
    private BookingRepository bRepo;


    @GetMapping({"/showBooking"})
    public ModelAndView showBooking()
    {
        ModelAndView mav = new ModelAndView("list-booking");
        List<Booking> list = bRepo.findAll();
        mav.addObject("booking", list);
        return mav;
    }

    @GetMapping("/AddBooking")
    public ModelAndView orderBooking() {
        ModelAndView mav = new ModelAndView("Add-booking");
        Booking newBooking = new Booking();
        mav.addObject("booking", newBooking);
        return mav;
    }

    @PostMapping("/saveBooking")
    public String saveBooking(@ModelAttribute Booking booking) {
        bRepo.save(booking);
        return "redirect:/showBooking";
    }

    @GetMapping("/deleteBooking")
    public String deleteBooking(@RequestParam Long bookingId) {
        bRepo.deleteById(bookingId);
        return "redirect:/showBooking";
    }


}
