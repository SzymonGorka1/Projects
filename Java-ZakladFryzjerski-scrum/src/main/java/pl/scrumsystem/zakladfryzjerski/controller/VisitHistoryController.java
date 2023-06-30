package pl.scrumsystem.zakladfryzjerski.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import pl.scrumsystem.zakladfryzjerski.entity.VisitHistory;
import pl.scrumsystem.zakladfryzjerski.repository.VisitHistoryRepository;

import java.util.List;

@Controller
public class VisitHistoryController {

    @Autowired
    private VisitHistoryRepository vhRepo;

    @GetMapping("/showVisitHistory")
    public ModelAndView showVisitHistory()
    {
        ModelAndView mav = new ModelAndView("list-visit-history");
        List<VisitHistory> list = vhRepo.findAll();
        mav.addObject("visit_history", list);
        return mav;
    }

    @GetMapping("/searchVisitHistory")
    public ModelAndView searchVisitHistory()
    {
        ModelAndView mav = new ModelAndView("search-visit-history");
        return mav;
    }

    @GetMapping("/findVisitHistory")
    public ModelAndView findVisitHistory(VisitHistory visithistory, Model model, String keyword1, String keyword2,
                                         String keyword3, String keyword4, String keyword5, String keyword6,
                                         String keyword7, String keyword8, String keyword9, String keyword10)
    {
        ModelAndView mav = new ModelAndView("list-visit-history");
        if(keyword1!=null & keyword2!=null & keyword3!=null & keyword4!=null & keyword5!=null &
                keyword6!=null & keyword7!=null & keyword8!=null & keyword9!=null & keyword10!=null) {
            List<VisitHistory> list = vhRepo.findByKeywords(keyword1, keyword2, keyword3,
                    keyword4, keyword5, keyword6, keyword7, keyword8, keyword9, keyword10);
            model.addAttribute("visit_history", list);
        }
        return mav;
    }

}
