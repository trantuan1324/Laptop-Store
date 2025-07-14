package com.rabbyte.LaptopStore.controller.client;

import com.rabbyte.LaptopStore.domain.Product;
import com.rabbyte.LaptopStore.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Optional;

@Controller
public class ProductDetailController {


    private final ProductService productService;

    public ProductDetailController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductDetail(@PathVariable Long id, Model model) {
        Optional<Product> product = this.productService.handleGetProductById(id);

        product.ifPresent(value -> model.addAttribute("currentProduct", value));

        return "/client/product/show-detail";
    }
}
