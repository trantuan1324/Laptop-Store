package com.rabbyte.LaptopStore.controller.admin;

import com.rabbyte.LaptopStore.domain.Role;
import com.rabbyte.LaptopStore.domain.User;
import com.rabbyte.LaptopStore.service.UploadService;
import com.rabbyte.LaptopStore.service.UserService;
import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import java.util.Optional;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/users")
    public String getUserDashboard(Model model) {
        List<User> users = userService.handleGetAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/users/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/users/create")
    public String createUser(@Valid @ModelAttribute("newUser") User newUser, BindingResult newUserBindingResult, @RequestParam("avatarImage")MultipartFile file) {
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors ) {
            System.err.println(">>>>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadService.handleUploadFile(file, "avatar");
        String hashPassword = passwordEncoder.encode(newUser.getPassword());

        newUser.setAvatar(avatar);
        newUser.setPassword(hashPassword);
        Role userRole = this.userService.handleGetRoleByName(newUser.getRole().getName());
        newUser.setRole(userRole);

        userService.handleCreateUser(newUser);
        return "redirect:/admin/users";
    }

    @GetMapping("admin/users/{id}")
    public String getUserDetailsPage(@PathVariable Long id, Model model) {
        Optional<User> user = this.userService.handleGetUserById(id);
        User selectedUser;
        if (user.isPresent()) {
            selectedUser = user.get();
            model.addAttribute("selectedUser", selectedUser);
        }
        return "admin/user/detail";
    }

    @GetMapping("admin/users/update/{id}")
    public String getUserUpdatePage(@PathVariable Long id, Model model) {
        Optional<User> data = this.userService.handleGetUserById(id);
        User user;
        if (data.isPresent()) {
            user = data.get();
            model.addAttribute("selectedUser", user);
        }
        return "admin/user/update";
    }

    @PostMapping("admin/users/update")
    public String updateUser(@ModelAttribute("selectedUser") User updatedUser, @RequestParam("avatarImage")MultipartFile file) {
        Optional<User> data = this.userService.handleGetUserById(updatedUser.getId());
        String avatar = this.uploadService.handleUploadFile(file, "avatar");
        String hashPassword = passwordEncoder.encode(updatedUser.getPassword());
        Role newRole = this.userService.handleGetRoleByName(updatedUser.getRole().getName());

        updatedUser.setAvatar(avatar);
        updatedUser.setPassword(hashPassword);
        updatedUser.setRole(newRole);

        data.ifPresent(user -> this.userService.handleUpdateUser(user.getId(), updatedUser));
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/users/delete/{id}")
    public String getDeleteUserPage(@PathVariable Long id, Model model) {
        Optional<User> selectedUser = this.userService.handleGetUserById(id);
        User user;
        if (selectedUser.isPresent()) {
            user = selectedUser.get();
            model.addAttribute("selectedUser", user);
        }
        return "admin/user/delete";
    }

    @PostMapping("/admin/users/delete")
    public String deleteUser(@ModelAttribute("selectedUser") User selectedUser) {
        this.userService.handleDeleteUser(selectedUser.getId());
        return "redirect:/admin/users";
    }
}
