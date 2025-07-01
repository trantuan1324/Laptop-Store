package com.rabbyte.LaptopStore.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @GetMapping("/admin/user")
    public String getUserDashboard() {
        return "admin/user/show";
    }
}
