package pl.scrumsystem.zakladfryzjerski.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pl.scrumsystem.zakladfryzjerski.entity.Equipment;
import pl.scrumsystem.zakladfryzjerski.entity.Report;
import pl.scrumsystem.zakladfryzjerski.repository.EquipmentRepository;
import pl.scrumsystem.zakladfryzjerski.repository.ReportRepository;
import pl.scrumsystem.zakladfryzjerski.service.EmailService;

import java.util.List;

@Controller
public class EquipmentController {

    @Autowired
    private EquipmentRepository eRepo;
    @Autowired
    private ReportRepository rRepo;

    private EmailService emailService;

    public EquipmentController(EquipmentRepository eRepo, ReportRepository rRepo, EmailService emailService)
    {
        this.eRepo = eRepo;
        this.rRepo = rRepo;
        this.emailService = emailService;
    }

    @GetMapping({"/showEquipment"})
    public ModelAndView showEquipment()
    {
        ModelAndView mav = new ModelAndView("list-equipment");
        List<Equipment> list = eRepo.findAll();
        mav.addObject("equipment", list);
        return mav;
    }


    @GetMapping("/listBrokenEquipment")
    public ModelAndView listBrokenEquipment() {
        ModelAndView mav = new ModelAndView("list-broken-equipment");
        List<Equipment> list = eRepo.findByCond("Defective");
        mav.addObject("equipment", list);
        return mav;
    }

    @GetMapping("/changeToWorking")
    public String changeToWorking(@RequestParam Long equipmentId) {
        Equipment equipment = eRepo.findById(equipmentId).orElseThrow();
        equipment.setCond("Working");
        eRepo.save(equipment);
        return "redirect:/listBrokenEquipment";
    }

    @GetMapping("/changeToWorking2")
    public String changeToWorking2(@RequestParam Long equipmentId) {
        Equipment equipment = eRepo.findById(equipmentId).orElseThrow();
        equipment.setCond("Working");
        eRepo.save(equipment);
        return "redirect:/showEquipment";
    }

    @GetMapping("/changeToDefective")
    public ModelAndView changeToDefective(@RequestParam Long equipmentId) {
        Equipment equipment = eRepo.findById(equipmentId).orElseThrow();
        equipment.setCond("Defective");
        eRepo.save(equipment);
        ModelAndView mav = new ModelAndView("list-equipment");
        Report report = new Report();
        mav.addObject("report", report);
        try {Thread.sleep(200000);}
        catch(InterruptedException ignored) {;}
        return mav;
    }

    @PostMapping("/saveReport")
    public String saveReport(@ModelAttribute Report report) {
        rRepo.save(report);
        Report reportToMail = rRepo.findAll().get(rRepo.findAll().size() - 1);
        mailReportGenerator(reportToMail, "janskwarczenski@gmail.com");
        return "redirect:/showEquipment";
    }

    private void mailReportGenerator(Report report, String toMail)
    {
        String textOfMail =  "New notification about broken equipment"+
                        "\nId: " + report.getId() +
                        "\nSalon: " + report.getSalon() +
                        "\nName: " + report.getName() +
                        "\nManufacturer: " + report.getManufacturer() +
                        "\nModel: " + report.getModel() +
                        "\nWorkplace: " + report.getWorkplace() +
                        "\nDate of damage: " + report.getDate_of_damage() +
                        "\nPriority (1 - low, 3 -high): " + report.getPriority() +
                        "\nDescription: " + report.getDescription() +
                        "\nAdditional information: " + report.getInfo();

        String textOfSubject = "New report - id: " + report.getId();
        this.emailService.sendMassage(
                toMail,
                textOfSubject,
                textOfMail);
    }
}
