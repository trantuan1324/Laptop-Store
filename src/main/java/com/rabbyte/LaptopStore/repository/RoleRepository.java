package com.rabbyte.LaptopStore.repository;

import com.rabbyte.LaptopStore.domain.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}
