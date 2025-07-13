package com.rabbyte.LaptopStore.controller.admin;

import com.rabbyte.LaptopStore.domain.Product;
import com.rabbyte.LaptopStore.service.ProductService;
import com.rabbyte.LaptopStore.service.UploadService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class ProductController {
    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(UploadService uploadService, ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    @GetMapping("/admin/products")
    public String getDashboard() {
        return "admin/product/show";
    }

    @GetMapping("/admin/products/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/products/create")
    public String createProduct(@Valid @ModelAttribute("newProduct") Product newProduct, BindingResult bindingResult, @RequestParam("productImage")MultipartFile file) {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error: errors) {
            System.err.println(">>>>>>" + error.getField() + ": " + error.getDefaultMessage());
        }

        if (bindingResult.hasErrors()) {
            return "admin/product/create";
        }

        String image = this.uploadService.handleUploadFile(file, "product");

        newProduct.setImage(image);

        this.productService.handleCreateProduct(newProduct);
        return "redirect:/admin/products";
    }
}
