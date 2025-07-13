package com.rabbyte.LaptopStore.service;

import com.rabbyte.LaptopStore.domain.Role;
import com.rabbyte.LaptopStore.domain.User;
import com.rabbyte.LaptopStore.repository.RoleRepository;
import com.rabbyte.LaptopStore.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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

    public Optional<User> handleGetUserById(long userId) {
        return userRepository.findById(userId);
    }

    public void handleUpdateUser(long id, User updatedUser) {
        Optional<User> data = this.userRepository.findById(id);
        User user = new User();
        if (data.isPresent()) {
            user = data.get();
            user.setFullName(updatedUser.getFullName());
            user.setAddress(updatedUser.getAddress());
            user.setPhone(updatedUser.getPhone());
            user.setAvatar(updatedUser.getAvatar());
            user.setPassword(updatedUser.getPassword());
            user.setRole(handleGetRoleByName(updatedUser.getRole().getName()));
        } else {
            System.err.println(id + " not found");
        }
        userRepository.save(user);
    }

    public void handleDeleteUser(long id) {
        userRepository.deleteById(id);
    }
}
