package pl.scrumsystem.zakladfryzjerski.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pl.scrumsystem.zakladfryzjerski.entity.Orders;
import pl.scrumsystem.zakladfryzjerski.repository.OrdersRepository;

import java.util.List;

@Controller
public class OrdersController {

    @Autowired
    private OrdersRepository oRepo;

    @GetMapping({"/showOrders"})
    public ModelAndView showOrders()
    {
        ModelAndView mav = new ModelAndView("list-orders");
        List<Orders> list = oRepo.findAll();
        mav.addObject("orders", list);
        return mav;
    }

    @GetMapping("/orderProduct")
    public ModelAndView orderProduct() {
        ModelAndView mav = new ModelAndView("order-product");
        Orders newOrder = new Orders();
        mav.addObject("orders", newOrder);
        return mav;
    }

    @PostMapping("/saveOrder")
    public String saveOrder(@ModelAttribute Orders order) {
        oRepo.save(order);
        return "redirect:/showOrders";
    }

    @GetMapping("/deleteOrder")
    public String deleteOrder(@RequestParam Long orderId) {
        oRepo.deleteById(orderId);
        return "redirect:/showOrders";
    }

}
