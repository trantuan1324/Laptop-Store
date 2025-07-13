package com.rabbyte.LaptopStore.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ProductDetailController {

    @GetMapping("/product/{id}")
    public String getProductDetail(@PathVariable Long id, Model model) {
        return "/client/product/show-detail";
    }
}
