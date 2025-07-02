package com.rabbyte.LaptopStore.service;

import com.rabbyte.LaptopStore.domain.Role;
import com.rabbyte.LaptopStore.domain.User;
import com.rabbyte.LaptopStore.repository.RoleRepository;
import com.rabbyte.LaptopStore.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public void handleCreateUser(User newUser) {
        userRepository.save(newUser);
    }

    public List<User> handleGetAllUsers() {
        return userRepository.findAll();
    }

    public Role handleGetRoleByName(String roleName) {
        return roleRepository.findByName(roleName);
    }
}
