package com.rabbyte.LaptopStore.controller.client;

import com.rabbyte.LaptopStore.domain.Product;
import com.rabbyte.LaptopStore.domain.Role;
import com.rabbyte.LaptopStore.domain.User;
import com.rabbyte.LaptopStore.domain.dto.RegisterDTO;
import com.rabbyte.LaptopStore.service.ProductService;
import com.rabbyte.LaptopStore.service.UserService;
import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.handleGetAllProducts();
        model.addAttribute("products", products);
        return "client/home_page/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
                               BindingResult bindingResult) {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.err.println(">>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.mapperRegisterDTOtoUser(registerDTO);

        String hashPassword = this.passwordEncoder.encode(registerDTO.getPassword());
        Role role = this.userService.handleGetRoleByName("USER");

        user.setPassword(hashPassword);
        user.setRole(role);

        this.userService.handleCreateUser(user);

        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "client/auth/login";
    }

    @PostMapping("/login")
    public String loginUser() {
        return "redirect:/";
    }

    @GetMapping("/access-denied")
    public String getAccessDeniedPage() {
        return "client/auth/access-denied";
    }
}
