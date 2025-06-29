package com.rabbyte.LaptopStore.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "order_details")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private long quantity;
    private double price;

    // order_id
    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    // product_id
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
}
