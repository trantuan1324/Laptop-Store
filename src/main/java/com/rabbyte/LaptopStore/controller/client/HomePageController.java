package com.rabbyte.LaptopStore.controller.client;

import com.rabbyte.LaptopStore.domain.Product;
import com.rabbyte.LaptopStore.service.ProductService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomePageController {


    private final ProductService productService;

    public HomePageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.handleGetAllProducts();
        model.addAttribute("products", products);
        return "/client/home_page/show";
    }


}
