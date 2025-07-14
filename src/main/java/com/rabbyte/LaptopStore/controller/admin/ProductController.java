package com.rabbyte.LaptopStore.controller.admin;

import com.rabbyte.LaptopStore.domain.Product;
import com.rabbyte.LaptopStore.service.ProductService;
import com.rabbyte.LaptopStore.service.UploadService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import java.util.Optional;

@Controller
public class ProductController {
    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(UploadService uploadService, ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    @GetMapping("/admin/products")
    public String getDashboard(Model model) {
        List<Product> products = this.productService.handleGetAllProducts();
        model.addAttribute("products", products);
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

    @GetMapping("/admin/products/{id}")
    public String getProductDetails(@PathVariable Long id, Model model) {
        Optional<Product> product = this.productService.handleGetProductById(id);
        product.ifPresent(value -> model.addAttribute("selectedProduct", value));

        return "admin/product/detail";
    }

    @GetMapping("/admin/products/update/{id}")
    public String getUpdateProductPage(@PathVariable Long id, Model model) {
        Optional<Product> product = this.productService.handleGetProductById(id);

        product.ifPresent(value -> model.addAttribute("currentProduct", value));

        return "admin/product/update";
    }

    @PostMapping("/admin/products/update")
    public String updateProduct(@ModelAttribute("currentProduct") Product currentProduct, BindingResult bindingResult, @RequestParam("productImage")MultipartFile file) {
        Optional<Product> data = this.productService.handleGetProductById(currentProduct.getId());

        for (FieldError error: bindingResult.getFieldErrors()) {
            System.err.println(">>>>>>" + error.getField() + ": " + error.getDefaultMessage());
        }

        if (bindingResult.hasErrors()) {
            return "admin/product/update";
        }

        String image = this.uploadService.handleUploadFile(file, "product");

        currentProduct.setImage(image);
        data.ifPresent(product -> this.productService.handleUpdateProduct(product.getId(), currentProduct));

        return "redirect:/admin/products";
    }

    @GetMapping("/admin/products/delete/{id}")
    public String getDeleteProductPage(@PathVariable Long id, Model model) {
        Optional<Product> deletedProduct = this.productService.handleGetProductById(id);

        deletedProduct.ifPresent(value -> model.addAttribute("deletedProduct", value));

        return "admin/product/delete";
    }

    @PostMapping("/admin/products/delete")
    public String deleteProduct(@ModelAttribute("deletedProduct") Product deletedProduct, BindingResult bindingResult) {
        this.productService.handleDeleteProduct(deletedProduct.getId());

        return "redirect:/admin/products";
    }
}
