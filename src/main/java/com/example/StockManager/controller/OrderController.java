package com.example.StockManager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.StockManager.model.Stock;
import com.example.StockManager.model.Order;
import com.example.StockManager.service.OrderService;
import com.example.StockManager.service.StockService;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private StockService stockService;
    
    //Show all order by using GET mapping
    @GetMapping ("/order")
    public String getAllOrder (Model model){
        List <Order> orderList = orderService.getAllOrder();
        model.addAttribute("orderList", orderList);
        model.addAttribute("pageContent","order.jsp");
        return "mainpage";
    }

    //GET to show the create order form
    @GetMapping ("/order/create")
    public String showCreateForm(Model model){
        List <Stock> stockList = stockService.getAllStock();
        model.addAttribute ("stockList", stockList);
        model.addAttribute ("pageContent", "createEditOrder.jsp");
        return "mainpage";
    }

    //POST to create an order record
    @PostMapping ("order/create")
    public String createOrder (Model model, @ModelAttribute Order order, @RequestParam int stockId ){
        Stock stock = stockService.getStockById(stockId);
        order.setStock (stock);
        orderService.saveOrUpdateOrder(order);
        return "redirect:/order";
    }

    //GET to show the edit form
    @GetMapping ("order/edit/{orderId}")
    public String showEditForm (@PathVariable ("orderId") int orderId, Model model){
        Order order = orderService.getOrderById(orderId);
        model.addAttribute("order", order);
        List <Stock> stockList = stockService.getAllStock();
        model.addAttribute ("stockList", stockList);
        model.addAttribute ("pageContent", "createEditOrder.jsp");
        return "mainpage";
    }

    //edit the order record using POST
    @PostMapping ("order/edit/{orderId}")
    public String editOrder (@PathVariable ("orderId") int orderId, @ModelAttribute Order order, Model model, @RequestParam int stockId){
        Stock stock = stockService.getStockById(stockId);
        order.setStock (stock);

        orderService.saveOrUpdateOrder(order);
        return "redirect:/order";
    }

    //delete the order record with GET
    @GetMapping ("order/delete/{orderId}")        
    public String deleteOrder (@PathVariable ("orderId") int orderId){
        orderService.deleteOrder(orderId);
        return "redirect:/order";
    }
    
    //POST method to update stock when the order had arrive
    @PostMapping("/order/arrive/delete/{orderId}")
    public String confirmOrderArrival(@PathVariable("orderId") int orderId, @RequestParam int stockId) {
        Order order = orderService.getOrderById(orderId);
        Stock stock = stockService.getStockById(stockId);

        // Update the stock quantity based on the order quantity
        int newQuantity = stock.getQuantity() + order.getOrderQty();
        stock.setQuantity(newQuantity);

        // Save the updated stock
        stockService.saveOrUpdateStock(stock);
        orderService.deleteOrder(orderId);

        return "redirect:/stock";
    }
}
